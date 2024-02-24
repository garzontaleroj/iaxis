package axis.service.modal;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper010Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper010Service extends AxisBaseService {
    Log logger = LogFactory.getLog(this.getClass());
    List<Map> lTablaImptos = new ArrayList();

    /*********************************************************************************************************************/
    /************************************************
     * MÉTODOS DE INICIALIZACIÓN
     *******************************************/
    /*********************************************************************************************************************/

    /**
     * Realiza la carga inicial de la pantalla.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     */
    public void m_form(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_form");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            // request.getSession().removeAttribute("resultats");


            formdata.put("CPAIS",
                    isEmpty(getHiddenCampoNumerico(request, "CPAISnomodi")) ? getHiddenCampoNumerico(request, "CPAIS")
                            : getHiddenCampoNumerico(request, "CPAISnomodi"));

            //cargarValoresDesplegables(request, thisAction, usuario, formdata);  IAXIS-3670  10/02/2020  CJMR

            BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPER");
            logger.debug("------> tipo persona:" + CTIPPER);
            if (isEmpty(CTIPPER)) { // LCF CTIPPER
                request.getSession().removeAttribute("resultats");
                cargarPersona(request, thisAction, usuario, formdata);

            }

            // IAXIS-3670  10/02/2020  CJMR
            cargarValoresDesplegables(request, thisAction, usuario, formdata);

        } catch (Exception e) {
            logger.error("Error en el método Axisper010Service.m_form", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }

    public String m_getDescTipSoc(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_getDescTipSoc");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            PAC_IAX_DESCVALORES pac_axis_descValores = new PAC_IAX_DESCVALORES(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            String NNUMIDEcerca = getHiddenCampoTextual(request, "NNUMIDEcerca");

            if (!isEmpty(NNUMIDEcerca)) {
                NNUMIDEcerca = NNUMIDEcerca.toUpperCase();
                Map map = pac_axis_descValores.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCSOCIEDAD(NNUMIDEcerca);
                return (String) this.tratarRETURNyMENSAJES(request, map);

            }
            return "";
        }

        catch (Exception e) {
            logger.error("Error en el método Axisper010Service.m_getDescTipSoc", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            return "";
        }
    }

    /**
     * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
     * búsqueda de Personas en BD, y devuelve el resultado en el atributo de sesión
     * Axisper008_listaPersonas.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     */
    public void m_busqueda_persona(HttpServletRequest request, Axisper010Action thisAction) {
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
        Map OBPERSONA = new HashMap();
        try {
            PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            // Recuperar persona a buscar
            BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPERcerca");
            String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDEcerca");
            BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDEcerca");
            BigDecimal CSEXPER = getHiddenCampoNumerico(request, "CSEXPERcerca");
            BigDecimal PDUPLICADA = getHiddenCampoNumerico(request, "PDUPLICADO");
            BigDecimal CAGENTE = isEmpty(getHiddenCampoNumerico(request, "CAGENTEcerca"))
                    ? this.getHiddenCampoNumerico(request, "CAGENTE_INI")
                    : getHiddenCampoNumerico(request, "CAGENTEcerca");
            java.sql.Date FNACIMI = stringToSqlDate(getHiddenCampoTextual(request, "FNACIMIcerca"));

            formdata.put("TIPOSOC", this.m_getDescTipSoc(request, thisAction));
             /* Cambio para IAXIS-15339 : start */
            request.getSession().setAttribute("PERSONAS_CIFIN", null);
            /* Cambio para IAXIS-15339 : End */     
            String PMODO = null;
            cargarValoresDesplegables(request, thisAction, usuario, formdata);
            for (int i = 0; i < thisAction.getPila(request).size(); i++) {
                HashMap m = (HashMap) thisAction.getPila(request).get(i);
                PMODO = (String) m.get("CMODO");
            }
            logger.debug("nif ==" + NNUMNIF);
            logger.debug("CTIPIDE ==" + CTIPIDE);

            BigDecimal RETURN = new BigDecimal(0);

            if (!isEmpty(NNUMNIF) && !isEmpty(CTIPIDE)) {
                logger.debug("0 ");
                Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_VALIDANIF(NNUMNIF, CTIPIDE, CSEXPER, FNACIMI);
                logger.debug(map);
                RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
                logger.debug("RETURN " + RETURN);
                if (!new BigDecimal(0).equals(RETURN))
                    formdata.put("INVALID", "1");

            }

            if (formdata.get("paginar") == null && new BigDecimal(0).equals(RETURN)) {
                request.getSession().removeAttribute("Axisper010_listaPersonas");

                BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

                Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAUNICA(CTIPPER, CTIPIDE, NNUMNIF, CSEXPER,
                        FNACIMI, PMODO, SSEGURO, CAGENTE, PDUPLICADA);

                logger.debug(map);
                RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
                OBPERSONA.put("isModify", Boolean.valueOf(true));
                if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
                    OBPERSONA = (Map) map.get("OBPERSONA");

                    if (!isEmpty(OBPERSONA)) {

                        if (!isEmpty(OBPERSONA.get("CTIPIDE")) && !isEmpty(OBPERSONA.get("NNUMIDE")))
                            OBPERSONA.put("isModify", Boolean.valueOf(false));

                        CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
                        if (new BigDecimal(2).equals(CTIPPER)) {
                            OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
                        }
                    }
                }

                // request.getSession().setAttribute("axisper010_listaPersonas", (ArrayList)
                // tratarRETURNyMENSAJES(request, map));
            }
        } catch (Exception e) {
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        } finally {
            if (!isEmpty(OBPERSONA)) {

                formdata.putAll(OBPERSONA);
                request.getSession().setAttribute("dades_setpersona", OBPERSONA);
            } else {

                request.getSession().removeAttribute("dades_setpersona");
                /*
                 * Object[] keySet = formdata.keySet().toArray(); for (int i = 0; i <
                 * keySet.length; i++) { formdata.remove(keySet[i]); }
                 */
            }

            try {

                cargarValoresDesplegables(request, thisAction, usuario, formdata);
            } catch (Exception ex) {
            }

            request.getSession().setAttribute("resultats", true);

        }

        Map imptos = new HashMap();
        imptos.put("IMPUESTOS", lTablaImptos);
        formdata.put("OBPROFESIONAL", imptos);

        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }

    /**
     * Realiza una carga de BD de los valores estáticos que contiene cada
     * desplegable de la pantalla.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     * @param usuario    El UsuarioBean activo.
     * @param formdata   HashMap que contiene los valores de los request parameters.
     * @throws Exception
     */
    private

            void cargarValoresDesplegables(HttpServletRequest request, Axisper010Action thisAction, UsuarioBean usuario,
                    Map formdata) throws Exception {
        // Carga de valores de los desplegables
        Map listValores = new HashMap();
        try {
            PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            PAC_IAX_PERSONA pac_axis_listPersona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            PAC_IAX_SIN_IMP_SAP pac_axis_sin_impuestos = new PAC_IAX_SIN_IMP_SAP(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

            if (isEmpty(formdata.get("listValores"))) {
                // Tipo de persona
                Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
                logger.debug(map);
                listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

                // Tipo de documento
                BigDecimal TIDENTI = getCampoNumerico(request, "CTIPPERcerca");
                // INI IAXIS-3670  10/02/2020  CJMR
                if (isEmpty(TIDENTI)) {
                    TIDENTI = getCampoNumerico(request, "CTIPPER");
                }
                // FIN IAXIS-3670  10/02/2020  CJMR
                
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
                logger.debug(map);
                listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

                // Tipo de sexo
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
                logger.debug(map);
                listValores.put("tipSexo", (List) tratarRETURNyMENSAJES(request, map));

                // Lista idiomas
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
                logger.debug(map);
                listValores.put("lstIdiomas", (List) tratarRETURNyMENSAJES(request, map));

                // Lista profesiones
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(0));
                logger.debug(map);
                listValores.put("lstProfesiones", (List) tratarRETURNyMENSAJES(request, map, false));

                // Lista ocupaciones
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROFESIONES(new BigDecimal(1));
                logger.debug(map);
                listValores.put("lstOcupaciones", (List) tratarRETURNyMENSAJES(request, map, false));

                // Lista países
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
                logger.debug(map);
                listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

                // Lista tipo de cuentas
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
                logger.debug(map);
                listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

                // Lista tipo direcciones
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
                logger.debug(map);
                listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

                // Lista tipo vías
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
                logger.debug(map);
                listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null,
                        new BigDecimal(1));
                logger.debug(map);
                listValores.put("lstAgentes", (List) tratarRETURNyMENSAJES(request, map, false));

                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCESTPER();
                logger.debug(map);
                listValores.put("lstEstper", (List) tratarRETURNyMENSAJES(request, map));

                // Lista Estado Civil
                map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
                        .ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(12));
                logger.debug(map);
                listValores.put("lstEstciv", (List) tratarRETURNyMENSAJES(request, map));

                // Lista Tipo Sociedad
                //map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001073));    IAXIS-3670  10/02/2020  CJMR
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(new BigDecimal(24), new BigDecimal(85), TIDENTI, new BigDecimal(8001073));
                logger.debug(map);
                listValores.put("lstTipoSociedad", (List) tratarRETURNyMENSAJES(request, map));
                // Lista Literal cirsular 037 MPC 27/04/2021 TASK 15419
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002036));
                logger.debug(map);
                listValores.put("lstCircular037", (List) tratarRETURNyMENSAJES(request, map));

                // Lista de prefijos telefonicos
                Map mapPrefijos = pac_axis_listPersona.ejecutaPAC_IAX_PERSONA__F_GET_PREFIJOSPAISES();
                listValores.put("listPrefijos", tratarRETURNyMENSAJES(request, mapPrefijos, false));

                // Lista Literal predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
                logger.debug(map);
                listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

                // Bis predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
                logger.debug(map);
                listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

                // Cod. Orientación predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
                logger.debug(map);
                listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

                // Literal predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
                logger.debug(map);
                listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

                // Cod. Orientación predio

                map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
                logger.debug(map);
                BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);

                if (valor == null)
                    valor = new BigDecimal(800046);

                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(valor);
                logger.debug(map);
                listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

                // Cod. Orientación predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
                logger.debug(map);
                listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

                // Detalle predio
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
                logger.debug(map);
                listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

                // Impuestos
                map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_LSTIMPUESTOS();
                logger.debug("++++ impuestos:" + map);
                formdata.put("LSTIMPUESTOS", tratarRETURNyMENSAJES(request, map));

                BigDecimal CCODIMP = AxisBaseService.getCampoNumerico(request, "CCODIMP");
                /* Cambio para bug-14446 : start */  
                BigDecimal CCODVIN = AxisBaseService.getCampoNumerico(request, "CCODVIN");
                logger.debug("++++ Axisper10Service : CCODVIN:"+CCODVIN); 
                BigDecimal CAREA = null;
                if (CCODVIN != null)
                {
                    if(CCODVIN.compareTo(new BigDecimal(2)) == 0 || CCODVIN.compareTo(new BigDecimal(7)) == 0) {
                        CAREA = new BigDecimal(3);
                    }else if(CCODVIN.compareTo(new BigDecimal(3)) == 0 ) {
                        CAREA = new BigDecimal(2);
                    }else if(CCODVIN.compareTo(new BigDecimal(4)) == 0 ) {
                        CAREA = new BigDecimal(1);
                    }// INI-CES: 29/05/2019: Ajuste valores por defecto para evitar errores con los vinculos que no tiene obligatoriedad de regimen
                    else {
                        CAREA = new BigDecimal(3);          
                    }
                }
                else
                {
                    CAREA = new BigDecimal(3);
                }
                    
                formdata.put("CCODIMP", CCODIMP);
                if (CCODIMP != null) {
                    map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP,CAREA);
                    logger.debug("++++ tipos indicador:" + map);
                    formdata.put("LSTTIPIND", tratarRETURNyMENSAJES(request, map));
                }
                /* Cambio para bug-14446 : end */ 
                // Vinculo persona
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTVINCULOS();
                logger.debug("++++ tipos vinculos:" + map);
                formdata.put("LSTTIPOVINCULO", tratarRETURNyMENSAJES(request, map, false));
                // Subtipo de agente
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
                logger.debug("++++ tipos agentes:" + map);
                formdata.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));
                // Subtipo compañía
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP();
                logger.debug("++++ tipos compañías:" + map);
                formdata.put("LSTTIPOCOMPANIA", tratarRETURNyMENSAJES(request, map, false));

                // Tipo de documento
                BigDecimal CTIPPER = getCampoNumerico(request, "TIDENTIcerca");
                if (isEmpty(CTIPPER))
                    CTIPPER = getCampoNumerico(request, "CTIPPERcerca");

                if (!isEmpty(CTIPPER)) {
                    map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_REGIMENFISCAL(CTIPPER);
                    logger.debug(map);
                    listValores.put("regFisc", (List) tratarRETURNyMENSAJES(request, map));
                }
                // INI CP0025M_SYS_PERS - JLTS - 21/11/2018 -- Se agrega el listValores
                // LSTTIPOIVA
                /* LSTTIPOIVA */
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
                logger.debug(map);
                listValores.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map, false));
                // FIN CP0025M_SYS_PERS - JLTS - 21/11/2018

                /* IAXIS-13881 : Cambios de facturacion electronica : Start */
                map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABLE_IVA();
                logger.debug(map);
                listValores.put("tipResponsable_IVA", (List) tratarRETURNyMENSAJES(request, map));
                /* IAXIS-13881 : Cambios de facturacion electronica : End */
                
                logger.debug(":: Listas Cargadas OK ::");

            }

        } catch (Exception e) {
            logger.error("Error en el método Axisper010Service.cargarValoresDesplegables", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        } finally {
            if (isEmpty(formdata.get("listValores"))) {
                formdata.put("listValores", listValores);
            }
        }
    }

    /**
     * Realiza una carga de BD de los valores estáticos que contiene cada
     * desplegable de la pantalla.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     * @param usuario    El UsuarioBean activo.
     * @param formdata   HashMap que contiene los valores de los request parameters.
     * @throws Exception
     */
    private

            void cargarPersona(HttpServletRequest request, Axisper010Action thisAction, UsuarioBean usuario,
                    Map formdata) throws Exception {
        Map OBPERSONA = new HashMap();

        try {
            BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
            if (SPERSON == null) {
                try {
                    SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
                } catch (Exception ex) {
                    SPERSON = null;
                }
            }

            BigDecimal CEMPRES = null; // null siempre
            BigDecimal CAGENTE = isEmpty(getHiddenCampoNumerico(request, "CAGENTE"))
                    ? getHiddenCampoNumerico(request, "CAGENTEselected")
                    : getHiddenCampoNumerico(request, "CAGENTE");
            formdata.put("CAGENTE", CAGENTE);

            PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

            OBPERSONA.put("isNew", Boolean.valueOf(true));
            logger.debug("isNew1-_>" + OBPERSONA.get("isNew"));
            /* Estado persona */
            if (!isEmpty(SPERSON)) {
                OBPERSONA.put("isNew", Boolean.valueOf(false));
                request.getSession().setAttribute("resultats", true);
                logger.debug("isNew2-_>" + OBPERSONA.get("isNew"));
                Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
                logger.debug(map);
                BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

                if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
                    OBPERSONA = (Map) map.get("OBPERSONA");

                    if (!isEmpty(OBPERSONA)) {
                        BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
                        if (new BigDecimal(2).equals(CTIPPER)) {
                            OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
                        }
                        // OBPERSONA.put("isNew", Boolean.valueOf(false));

                        PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
                                (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
                        map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(SPERSON);
                        List array = (List) tratarRETURNyMENSAJES(request, map);
                        if (array != null) {
                            Map  t = (Map) array.get(0);
                            formdata.put("SFINANCI", t.get("SFINANCI"));                    
                            OBPERSONA.put("CTIPSOCI", t.get("CTIPSOCI"));
                            
                            if(isEmpty(OBPERSONA.get("FNACIMI"))) {
                                OBPERSONA.replace("FNACIMI", t.get("FCONSTI"));     
                            }
                            
                        /*  if(isEmpty(OBPERSONA.get("FNACIMI"))) {
                                OBPERSONA.put("FCONSTI", stringToSqlDate(t.get("FCONSTI").toString()));
                                OBPERSONA.replace("FNACIMI", t.get("FCONSTI"));     
                                formdata.put("FNACIMI", t.get("FCONSTI"));
                                
                                
                                OBPERSONA.put("CTIPSOCI", t.get("CTIPSOCI"));
                        }*/

                    }
                }

            }
        }
        } catch (Exception e) {
            logger.error("Error en el método Axisper010Service.cargarPersona", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        } finally {
            // if (!isEmpty(OBPERSONA))
            formdata.put("SNIP_OB", OBPERSONA.get("SNIP"));
            formdata.putAll(OBPERSONA);

            logger.debug("isNew-_>" + formdata.get("isNew"));
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }

    }

    /*********************************************************************************************************************/
    /****************************************
     * INNER CLASS QUE REPRESENTA UNA PERSONA
     *************************************/

    /*********************************************************************************************************************/
    public class

    Persona {
        // Necesarios sólo para GRABAR
        protected BigDecimal SSEGURO = null;
        protected BigDecimal SPERSON;
        protected BigDecimal SPEREAL;
        protected BigDecimal CAGENTE = null;
        protected BigDecimal CEMPRES;
        // Necesarios para VALIDAR y GRABAR
        protected BigDecimal CTIPPER;
        protected BigDecimal CTIPIDE;
        protected String NNUMIDE;
        protected BigDecimal CSEXPER;
        protected java.sql.Date FNACIMI;

        protected String SNIP;
        protected BigDecimal CESTPER;
        protected java.sql.Date FJUBILA;
        protected BigDecimal CMUTUALISTA;
        protected java.sql.Date FDEFUNC;
        protected BigDecimal NORDIDE;
        protected BigDecimal CIDIOMA = new BigDecimal(8); // 8 Idioma Colombia
        protected String TAPELLI1;
        protected String TAPELLI2;
        protected String TNOMBRE;
        protected String TSIGLAS;
        protected String CPROFES;
        protected BigDecimal CESTCIV;
        protected BigDecimal CPAIS;
        protected BigDecimal CNACIONALIDAD;
        protected BigDecimal CDOMICI;
        protected BigDecimal PDUPLICADA;
        protected String TNOMBRE1;
        protected String TNOMBRE2;
        protected BigDecimal SWPUBLI = new BigDecimal(0); // Persona que pueden ver todos
        protected BigDecimal SWRUT;
        protected String COCUPACION;
        // Agregados por Gobierno de datos:
        protected BigDecimal TDigitoide;
        protected java.sql.Date FConsti;
        protected BigDecimal TTiposoc;
        protected String CCiiu;
        protected BigDecimal SFINANCI;
        // Agregar componentes para armar un objeto completo
        private PerDireccion direccion;
        private PerContacto contacto;
        private java.sql.Date FEFECTO;
        private BigDecimal CREGFISCAL;
        private BigDecimal CTIPIVA;
        /* IAXIS-13881 : Cambios de facturacion electronica : start */
        private PerFacturacion_Electronica factElectronica;
        /* IAXIS-13881 : Cambios de facturacion electronica : end */
        private BigDecimal CCIR037; /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES */

        public Persona(BigDecimal SSEGURO, BigDecimal SPERSON, BigDecimal SPEREAL, BigDecimal CAGENTE,
                BigDecimal CEMPRES, BigDecimal CTIPPER, BigDecimal CTIPIDE, String NNUMIDE, BigDecimal CSEXPER,
                java.sql.Date FNACIMI, String SNIP, BigDecimal CESTPER, java.sql.Date FJUBILA, BigDecimal CMUTUALISTA,
                java.sql.Date FDEFUNC, BigDecimal NORDIDE, BigDecimal CIDIOMA, String TAPELLI1, String TAPELLI2,
                String TNOMBRE, String TSIGLAS, String CPROFES, BigDecimal CESTCIV, BigDecimal CPAIS,
                BigDecimal pCNACIONALIDAD, BigDecimal CDOMICI, BigDecimal PDUPLICADA, String TNOMBRE1, String TNOMBRE2,
                BigDecimal SWPUBLI, BigDecimal SWRUT, String COCUPACION) {
            logger.debug("04>");
            this.SSEGURO = SSEGURO;
            this.SPERSON = SPERSON;
            this.SPEREAL = SPEREAL;
            this.CAGENTE = CAGENTE;
            this.CEMPRES = CEMPRES;

            this.CTIPPER = CTIPPER;
            this.CTIPIDE = CTIPIDE;
            this.NNUMIDE = NNUMIDE;
            this.CSEXPER = CSEXPER;
            this.FNACIMI = FNACIMI;
            this.SNIP = SNIP;
            this.CESTPER = CESTPER;
            this.FJUBILA = FJUBILA;
            this.CMUTUALISTA = CMUTUALISTA;
            this.FDEFUNC = FDEFUNC;
            this.NORDIDE = NORDIDE;
            this.CIDIOMA = CIDIOMA;
            this.TAPELLI1 = TAPELLI1;
            this.TAPELLI2 = TAPELLI2;
            this.TNOMBRE = TNOMBRE;
            this.TSIGLAS = TSIGLAS;
            this.CPROFES = CPROFES;
            this.CESTCIV = CESTCIV;
            this.CPAIS = CPAIS;
            this.CNACIONALIDAD = pCNACIONALIDAD;
            this.CDOMICI = CDOMICI;
            logger.debug("05>");
            this.PDUPLICADA = PDUPLICADA;
            this.TNOMBRE1 = TNOMBRE1;
            this.TNOMBRE2 = TNOMBRE2;
            this.SWPUBLI = SWPUBLI;
            this.SWRUT = SWRUT;
            this.COCUPACION = COCUPACION;
            logger.debug("06>");
        }

        public Persona() {
            // TODO Auto-generated constructor stub
            this.direccion = new PerDireccion();
            this.contacto = new PerContacto();
            /* IAXIS-13881 : Cambios de facturacion electronica : start */
            this.factElectronica = new PerFacturacion_Electronica();
            /* IAXIS-13881 : Cambios de facturacion electronica : end */
        }

        /**
         * Métodos que auto-graban la persona
         * 
         * @param pac_axis_persona - Instancia de PAC_IAX_PERSONA
         * @return Map - El retorno de la función de PAC_IAX_PERSONA
         * @throws Exception
         */
        public Map grabaPersona(PAC_IAX_PERSONA pac_axis_persona,List<Map> lTablaImptos) throws Exception {
            Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_PERSONA(SSEGURO, SPERSON, SPEREAL, CAGENTE,
                    CTIPPER, CTIPIDE, NNUMIDE, CSEXPER, FNACIMI, SNIP, CESTPER, FJUBILA, CMUTUALISTA, FDEFUNC, NORDIDE,
                    CIDIOMA, TAPELLI1, TAPELLI2, TNOMBRE, TSIGLAS, CPROFES, CESTCIV, CPAIS, SWPUBLI, PDUPLICADA,
                    TNOMBRE1, TNOMBRE2, SWRUT, COCUPACION, this.TTiposoc, new BigDecimal(this.CCiiu), this.FConsti,
                    this.direccion, this.contacto, this.CNACIONALIDAD, this.TDigitoide, this.SFINANCI,FEFECTO,CREGFISCAL,CTIPIVA,lTablaImptos
                    /* IAXIS-13881 : Cambios de facturacion electronica : start */
                    ,this.factElectronica, this.CCIR037); /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES */
                    /* IAXIS-13881 : Cambios de facturacion electronica : end */
            logger.debug(map);
            return map;
        }
        /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES: INI*/
        public BigDecimal getCCIR037() {
            return CCIR037;
        }
        
        public void setCCIR037(BigDecimal CCIR037) {
            this.CCIR037 = CCIR037;
        }
        /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES: FIN*/
        public BigDecimal getCAGENTE() {
            return CAGENTE;
        }

        public void setCAGENTE(BigDecimal cAGENTE) {
            CAGENTE = cAGENTE;
        }

        public BigDecimal getSSEGURO() {
            return SSEGURO;
        }

        public void setSSEGURO(BigDecimal sSEGURO) {
            SSEGURO = sSEGURO;
        }

        public BigDecimal getSPERSON() {
            return SPERSON;
        }

        public void setSPERSON(BigDecimal sPERSON) {
            SPERSON = sPERSON;
        }

        public BigDecimal getSPEREAL() {
            return SPEREAL;
        }

        public void setSPEREAL(BigDecimal sPEREAL) {
            SPEREAL = sPEREAL;
        }

        public BigDecimal getCEMPRES() {
            return CEMPRES;
        }

        public void setCEMPRES(BigDecimal cEMPRES) {
            CEMPRES = cEMPRES;
        }

        public BigDecimal getCTIPPER() {
            return CTIPPER;
        }

        public void setCTIPPER(BigDecimal cTIPPER) {
            CTIPPER = cTIPPER;
        }

        public BigDecimal getCTIPIDE() {
            return CTIPIDE;
        }

        public void setCTIPIDE(BigDecimal cTIPIDE) {
            CTIPIDE = cTIPIDE;
        }

        public String getNNUMIDE() {
            return NNUMIDE;
        }

        public void setNNUMIDE(String nNUMIDE) {
            NNUMIDE = nNUMIDE;
        }

        public BigDecimal getCSEXPER() {
            return CSEXPER;
        }

        public void setCSEXPER(BigDecimal cSEXPER) {
            CSEXPER = cSEXPER;
        }

        public java.sql.Date getFNACIMI() {
            return FNACIMI;
        }

        public void setFNACIMI(java.sql.Date fNACIMI) {
            FNACIMI = fNACIMI;
        }

        public String getSNIP() {
            return SNIP;
        }

        public void setSNIP(String sNIP) {
            SNIP = sNIP;
        }

        public BigDecimal getCESTPER() {
            return CESTPER;
        }

        public void setCESTPER(BigDecimal cESTPER) {
            CESTPER = cESTPER;
        }

        public java.sql.Date getFJUBILA() {
            return FJUBILA;
        }

        public void setFJUBILA(java.sql.Date fJUBILA) {
            FJUBILA = fJUBILA;
        }

        public BigDecimal getCMUTUALISTA() {
            return CMUTUALISTA;
        }

        public void setCMUTUALISTA(BigDecimal cMUTUALISTA) {
            CMUTUALISTA = cMUTUALISTA;
        }

        public java.sql.Date getFDEFUNC() {
            return FDEFUNC;
        }

        public void setFDEFUNC(java.sql.Date fDEFUNC) {
            FDEFUNC = fDEFUNC;
        }

        public BigDecimal getNORDIDE() {
            return NORDIDE;
        }

        public void setNORDIDE(BigDecimal nORDIDE) {
            NORDIDE = nORDIDE;
        }

        public BigDecimal getCIDIOMA() {
            return CIDIOMA;
        }

        public void setCIDIOMA(BigDecimal cIDIOMA) {
            CIDIOMA = cIDIOMA;
        }

        public String getTAPELLI1() {
            return TAPELLI1;
        }

        public void setTAPELLI1(String tAPELLI1) {
            TAPELLI1 = tAPELLI1;
        }

        public String getTAPELLI2() {
            return TAPELLI2;
        }

        public void setTAPELLI2(String tAPELLI2) {
            TAPELLI2 = tAPELLI2;
        }

        public String getTNOMBRE() {
            return TNOMBRE;
        }

        public void setTNOMBRE(String tNOMBRE) {
            TNOMBRE = tNOMBRE;
        }

        public String getTSIGLAS() {
            return TSIGLAS;
        }

        public void setTSIGLAS(String tSIGLAS) {
            TSIGLAS = tSIGLAS;
        }

        public String getCPROFES() {
            return CPROFES;
        }

        public void setCPROFES(String cPROFES) {
            CPROFES = cPROFES;
        }

        public BigDecimal getCESTCIV() {
            return CESTCIV;
        }

        public void setCESTCIV(BigDecimal cESTCIV) {
            CESTCIV = cESTCIV;
        }

        public BigDecimal getCPAIS() {
            return CPAIS;
        }

        public void setCPAIS(BigDecimal cPAIS) {
            CPAIS = cPAIS;
        }

        public BigDecimal getCNACIONALIDAD() {
            return CNACIONALIDAD;
        }

        public void setCNACIONALIDAD(BigDecimal cNACIONALIDAD) {
            CNACIONALIDAD = cNACIONALIDAD;
        }

        public BigDecimal getCDOMICI() {
            return CDOMICI;
        }

        public void setCDOMICI(BigDecimal cDOMICI) {
            CDOMICI = cDOMICI;
        }

        public BigDecimal getPDUPLICADA() {
            return PDUPLICADA;
        }

        public void setPDUPLICADA(BigDecimal pDUPLICADA) {
            PDUPLICADA = pDUPLICADA;
        }

        public String getTNOMBRE1() {
            return TNOMBRE1;
        }

        public void setTNOMBRE1(String tNOMBRE1) {
            TNOMBRE1 = tNOMBRE1;
        }

        public String getTNOMBRE2() {
            return TNOMBRE2;
        }

        public void setTNOMBRE2(String tNOMBRE2) {
            TNOMBRE2 = tNOMBRE2;
        }

        public BigDecimal getSWPUBLI() {
            return SWPUBLI;
        }

        public void setSWPUBLI(BigDecimal sWPUBLI) {
            SWPUBLI = sWPUBLI;
        }

        public BigDecimal getSWRUT() {
            return SWRUT;
        }

        public void setSWRUT(BigDecimal sWRUT) {
            SWRUT = sWRUT;
        }

        public String getCOCUPACION() {
            return COCUPACION;
        }

        public void setCOCUPACION(String cOCUPACION) {
            COCUPACION = cOCUPACION;
        }

        public BigDecimal getTDigitoide() {
            return TDigitoide;
        }

        public void setTDigitoide(BigDecimal tDigitoide) {
            TDigitoide = tDigitoide;
        }

        public BigDecimal getTTiposoc() {
            return TTiposoc;
        }

        public void setTTiposoc(BigDecimal tTiposoc) {
            TTiposoc = tTiposoc;
        }

        public java.sql.Date getFConsti() {
            return FConsti;
        }

        public void setFConsti(java.sql.Date fConsti) {
            FConsti = fConsti;
        }

        public String getCCiiu() {
            return CCiiu;
        }

        public void setCCiiu(String cCiiu) {
            CCiiu = cCiiu;
        }

        public PerDireccion getDireccion() {
            return direccion;
        }

        public void setDireccion(PerDireccion direccion) {
            this.direccion = direccion;
        }

        public PerContacto getContacto() {
            return contacto;
        }

        public void setContacto(PerContacto contacto) {
            this.contacto = contacto;
        }

        public BigDecimal getSFINANCI() {
            return SFINANCI;
        }

        public void setSFINANCI(BigDecimal sFINANCI) {
            SFINANCI = sFINANCI;
        }

        public java.sql.Date getFEFECTO() {
            return FEFECTO;
        }

        public void setFEFECTO(java.sql.Date fEFECTO) {
            FEFECTO = fEFECTO;
        }

        public BigDecimal getCREGFISCAL() {
            return CREGFISCAL;
        }

        public void setCREGFISCAL(BigDecimal cREGFISCAL) {
            CREGFISCAL = cREGFISCAL;
        }

        public BigDecimal getCTIPIVA() {
            return CTIPIVA;
        }

        public void setCTIPIVA(BigDecimal cTIPIVA) {
            CTIPIVA = cTIPIVA;
        }
        /* IAXIS-13881 : Cambios de facturacion electronica : start */              
        public PerFacturacion_Electronica getFactElectronica() {
            return factElectronica;
        }

        public void setFactElectronica(PerFacturacion_Electronica factElectronica) {
            this.factElectronica = factElectronica;
        }
        
        @Override
        public String toString() {
            return "Persona [SSEGURO=" + SSEGURO + ", SPERSON=" + SPERSON
                    + ", SPEREAL=" + SPEREAL + ", CAGENTE=" + CAGENTE
                    + ", CEMPRES=" + CEMPRES + ", CTIPPER=" + CTIPPER
                    + ", CTIPIDE=" + CTIPIDE + ", NNUMIDE=" + NNUMIDE
                    + ", CSEXPER=" + CSEXPER + ", FNACIMI=" + FNACIMI
                    + ", SNIP=" + SNIP + ", CESTPER=" + CESTPER + ", FJUBILA="
                    + FJUBILA + ", CMUTUALISTA=" + CMUTUALISTA + ", FDEFUNC="
                    + FDEFUNC + ", NORDIDE=" + NORDIDE + ", CIDIOMA=" + CIDIOMA
                    + ", TAPELLI1=" + TAPELLI1 + ", TAPELLI2=" + TAPELLI2
                    + ", TNOMBRE=" + TNOMBRE + ", TSIGLAS=" + TSIGLAS
                    + ", CPROFES=" + CPROFES + ", CESTCIV=" + CESTCIV
                    + ", CPAIS=" + CPAIS + ", CNACIONALIDAD=" + CNACIONALIDAD
                    + ", CDOMICI=" + CDOMICI + ", PDUPLICADA=" + PDUPLICADA
                    + ", TNOMBRE1=" + TNOMBRE1 + ", TNOMBRE2=" + TNOMBRE2
                    + ", SWPUBLI=" + SWPUBLI + ", SWRUT=" + SWRUT
                    + ", COCUPACION=" + COCUPACION + ", TDigitoide="
                    + TDigitoide + ", FConsti=" + FConsti + ", TTiposoc="
                    + TTiposoc + ", CCiiu=" + CCiiu + ", SFINANCI=" + SFINANCI
                    + ", direccion=" + direccion + ", contacto=" + contacto
                    + ", FEFECTO=" + FEFECTO + ", CREGFISCAL=" + CREGFISCAL
                    + ", CTIPIVA=" + CTIPIVA + ", factElectronica="
                    + factElectronica+", CCIR037=" + CCIR037 + "]"; /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES*/
        }
        /* IAXIS-13881 : Cambios de facturacion electronica : end */
        
    }

    public class PerDireccion {
        // Datos para el type
        private BigDecimal cDomici;
        private String tDomici;
        private String tProvin;
        private String tPoblac;
        private String tPais;
        private String tTipDir;
        private BigDecimal cSiglas;
        private String tSiglas;
        private BigDecimal nNumvia;
        private String tComple;
        private BigDecimal cCiudad;
        private BigDecimal fGisX;
        private BigDecimal fGisY;
        private BigDecimal fGisZ;
        private BigDecimal cValida;
        private String localidad;
        private BigDecimal nueva;

        // Datos que estan en la JSP
        private BigDecimal tipDir;
        private String alias;
        private BigDecimal fdefecto;
        private BigDecimal viaVp;
        private String nomVia;
        private BigDecimal litVp;
        private BigDecimal bisVp;
        private BigDecimal corVp;
        private BigDecimal viaAdco;
        private BigDecimal litCo;
        private BigDecimal corCo;
        private BigDecimal placaCo;
        private BigDecimal cor2co;
        private BigDecimal det1ia;
        private String num1ia;
        private BigDecimal det2ia;
        private String num2ia;
        private BigDecimal det3ia;
        private String num3ia;
        private String postal;
        private BigDecimal pais_direccion;
        private BigDecimal provin;
        private BigDecimal pobla;

        public PerDireccion() {

        }

        public BigDecimal getTipDir() {
            return tipDir;
        }

        public void setTipDir(BigDecimal tipDir) {
            this.tipDir = tipDir;
        }

        public String getAlias() {
            return alias;
        }

        public void setAlias(String alias) {
            this.alias = alias;
        }

        public BigDecimal getFdefecto() {
            return fdefecto;
        }

        public void setFdefecto(BigDecimal fdefecto) {
            this.fdefecto = fdefecto;
        }

        public BigDecimal getViaVp() {
            return viaVp;
        }

        public void setViaVp(BigDecimal viaVp) {
            this.viaVp = viaVp;
        }

        public String getNomVia() {
            return nomVia;
        }

        public void setNomVia(String nomVia) {
            this.nomVia = nomVia;
        }

        public BigDecimal getLitVp() {
            return litVp;
        }

        public void setLitVp(BigDecimal litVp) {
            this.litVp = litVp;
        }

        public BigDecimal getBisVp() {
            return bisVp;
        }

        public void setBisVp(BigDecimal bisVp) {
            this.bisVp = bisVp;
        }

        public BigDecimal getCorVp() {
            return corVp;
        }

        public void setCorVp(BigDecimal corVp) {
            this.corVp = corVp;
        }

        public BigDecimal getViaAdco() {
            return viaAdco;
        }

        public void setViaAdco(BigDecimal viaAdco) {
            this.viaAdco = viaAdco;
        }

        public BigDecimal getLitCo() {
            return litCo;
        }

        public void setLitCo(BigDecimal litCo) {
            this.litCo = litCo;
        }

        public BigDecimal getCorCo() {
            return corCo;
        }

        public void setCorCo(BigDecimal corCo) {
            this.corCo = corCo;
        }

        public BigDecimal getPlacaCo() {
            return placaCo;
        }

        public void setPlacaCo(BigDecimal placaCo) {
            this.placaCo = placaCo;
        }

        public BigDecimal getCor2co() {
            return cor2co;
        }

        public void setCor2co(BigDecimal cor2co) {
            this.cor2co = cor2co;
        }

        public BigDecimal getDet1ia() {
            return det1ia;
        }

        public void setDet1ia(BigDecimal det1ia) {
            this.det1ia = det1ia;
        }

        public String getNum1ia() {
            return num1ia;
        }

        public void setNum1ia(String num1ia) {
            this.num1ia = num1ia;
        }

        public BigDecimal getDet2ia() {
            return det2ia;
        }

        public void setDet2ia(BigDecimal det2ia) {
            this.det2ia = det2ia;
        }

        public String getNum2ia() {
            return num2ia;
        }

        public void setNum2ia(String num2ia) {
            this.num2ia = num2ia;
        }

        public BigDecimal getDet3ia() {
            return det3ia;
        }

        public void setDet3ia(BigDecimal det3ia) {
            this.det3ia = det3ia;
        }

        public String getNum3ia() {
            return num3ia;
        }

        public void setNum3ia(String num3ia) {
            this.num3ia = num3ia;
        }

        public String getPostal() {
            return postal;
        }

        public void setPostal(String postal) {
            this.postal = postal;
        }

        public BigDecimal getPais_direccion() {
            return pais_direccion;
        }

        public void setPais_direccion(BigDecimal pais_direccion) {
            this.pais_direccion = pais_direccion;
        }

        public BigDecimal getProvin() {
            return provin;
        }

        public void setProvin(BigDecimal provin) {
            this.provin = provin;
        }

        public BigDecimal getPobla() {
            return pobla;
        }

        public void setPobla(BigDecimal pobla) {
            this.pobla = pobla;
        }

        public BigDecimal getcDomici() {
            return cDomici;
        }

        public void setcDomici(BigDecimal cDomici) {
            this.cDomici = cDomici;
        }

        public String gettDomici() {
            return tDomici;
        }

        public void settDomici(String tDomici) {
            this.tDomici = tDomici;
        }

        public String gettProvin() {
            return tProvin;
        }

        public void settProvin(String tProvin) {
            this.tProvin = tProvin;
        }

        public String gettPoblac() {
            return tPoblac;
        }

        public void settPoblac(String tPoblac) {
            this.tPoblac = tPoblac;
        }

        public String gettPais() {
            return tPais;
        }

        public void settPais(String tPais) {
            this.tPais = tPais;
        }

        public String gettTipDir() {
            return tTipDir;
        }

        public void settTipDir(String tTipDir) {
            this.tTipDir = tTipDir;
        }

        public BigDecimal getcSiglas() {
            return cSiglas;
        }

        public void setcSiglas(BigDecimal cSiglas) {
            this.cSiglas = cSiglas;
        }

        public String gettSiglas() {
            return tSiglas;
        }

        public void settSiglas(String tSiglas) {
            this.tSiglas = tSiglas;
        }

        public BigDecimal getnNumvia() {
            return nNumvia;
        }

        public void setnNumvia(BigDecimal nNumvia) {
            this.nNumvia = nNumvia;
        }

        public String gettComple() {
            return tComple;
        }

        public void settComple(String tComple) {
            this.tComple = tComple;
        }

        public BigDecimal getcCiudad() {
            return cCiudad;
        }

        public void setcCiudad(BigDecimal cCiudad) {
            this.cCiudad = cCiudad;
        }

        public BigDecimal getfGisX() {
            return fGisX;
        }

        public void setfGisX(BigDecimal fGisX) {
            this.fGisX = fGisX;
        }

        public BigDecimal getfGisY() {
            return fGisY;
        }

        public void setfGisY(BigDecimal fGisY) {
            this.fGisY = fGisY;
        }

        public BigDecimal getfGisZ() {
            return fGisZ;
        }

        public void setfGisZ(BigDecimal fGisZ) {
            this.fGisZ = fGisZ;
        }

        public BigDecimal getcValida() {
            return cValida;
        }

        public void setcValida(BigDecimal cValida) {
            this.cValida = cValida;
        }

        public String getLocalidad() {
            return localidad;
        }

        public void setLocalidad(String localidad) {
            this.localidad = localidad;
        }

        public BigDecimal getNueva() {
            return nueva;
        }

        public void setNueva(BigDecimal nueva) {
            this.nueva = nueva;
        }

        @Override
        public String toString() {
            return "PerDireccion [cDomici=" + cDomici + ", tDomici=" + tDomici + ", tProvin=" + tProvin + ", tPoblac="
                    + tPoblac + ", tPais=" + tPais + ", tTipDir=" + tTipDir + ", cSiglas=" + cSiglas + ", tSiglas="
                    + tSiglas + ", nNumvia=" + nNumvia + ", tComple=" + tComple + ", cCiudad=" + cCiudad + ", fGisX="
                    + fGisX + ", fGisY=" + fGisY + ", fGisZ=" + fGisZ + ", cValida=" + cValida + ", localidad="
                    + localidad + ", nueva=" + nueva + ", tipDir=" + tipDir + ", alias=" + alias + ", fdefecto="
                    + fdefecto + ", viaVp=" + viaVp + ", nomVia=" + nomVia + ", litVp=" + litVp + ", bisVp=" + bisVp
                    + ", corVp=" + corVp + ", viaAdco=" + viaAdco + ", litCo=" + litCo + ", corCo=" + corCo
                    + ", placaCo=" + placaCo + ", cor2co=" + cor2co + ", det1ia=" + det1ia + ", num1ia=" + num1ia
                    + ", det2ia=" + det2ia + ", num2ia=" + num2ia + ", det3ia=" + det3ia + ", num3ia=" + num3ia
                    + ", postal=" + postal + ", pais_direccion=" + pais_direccion + ", provin=" + provin + ", pobla="
                    + pobla + "]";
        }

    }

    public class PerContacto {

        private String telFijo;
        private BigDecimal prexi_telFijo;
        private String telMovil;
        private BigDecimal prexi_telMovil;
        private String email;
        private String telFax;
        private BigDecimal prexi_telFax;

        public PerContacto() {

        }

        public String getTelFijo() {
            return telFijo;
        }

        public void setTelFijo(String telFijo) {
            this.telFijo = telFijo;
        }

        public BigDecimal getPrexi_telFijo() {
            return prexi_telFijo;
        }

        public void setPrexi_telFijo(BigDecimal prexi_telFijo) {
            this.prexi_telFijo = prexi_telFijo;
        }

        public String getTelMovil() {
            return telMovil;
        }

        public void setTelMovil(String telMovil) {
            this.telMovil = telMovil;
        }

        public BigDecimal getPrexi_telMovil() {
            return prexi_telMovil;
        }

        public void setPrexi_telMovil(BigDecimal prexi_telMovil) {
            this.prexi_telMovil = prexi_telMovil;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getTelFax() {
            return telFax;
        }

        public void setTelFax(String telFax) {
            this.telFax = telFax;
        }

        public BigDecimal getPrexi_telFax() {
            return prexi_telFax;
        }

        public void setPrexi_telFax(BigDecimal prexi_telFax) {
            this.prexi_telFax = prexi_telFax;
        }

        @Override
        public String toString() {
            return "PerContacto [telFijo=" + telFijo + ", prexi_telFijo=" + prexi_telFijo + ", telMovil=" + telMovil
                    + ", prexi_telMovil=" + prexi_telMovil + ", email=" + email + ", telFax=" + telFax
                    + ", prexi_telFax=" + prexi_telFax + "]";
        }

    }

    /* IAXIS-13881 : Cambios de facturacion electronica : start */
    public class PerFacturacion_Electronica 
    {
        private String nit_proveedor;
        private BigDecimal cresponsable_iva;
        private String tresponsable_iva;
        private String cfiscales_adquiriente;   
        private String tfiscales_adquiriente;
        private String correo_fact_elect;       
        private String applica_fact_elect;
        public String getNit_proveedor() {
            return nit_proveedor;
        }
        public void setNit_proveedor(String nit_proveedor) {
            this.nit_proveedor = nit_proveedor;
        }
        public BigDecimal getCresponsable_iva() {
            return cresponsable_iva;
        }
        public void setCresponsable_iva(BigDecimal cresponsable_iva) {
            this.cresponsable_iva = cresponsable_iva;
        }
        public String getTresponsable_iva() {
            return tresponsable_iva;
        }
        public void setTresponsable_iva(String tresponsable_iva) {
            this.tresponsable_iva = tresponsable_iva;
        }
        public String getCfiscales_adquiriente() {
            return cfiscales_adquiriente;
        }
        public void setCfiscales_adquiriente(String cfiscales_adquiriente) {
            this.cfiscales_adquiriente = cfiscales_adquiriente;
        }
        public String getTfiscales_adquiriente() {
            return tfiscales_adquiriente;
        }
        public void setTfiscales_adquiriente(String tfiscales_adquiriente) {
            this.tfiscales_adquiriente = tfiscales_adquiriente;
        }
        public String getCorreo_fact_elect() {
            return correo_fact_elect;
        }
        public void setCorreo_fact_elect(String correo_fact_elect) {
            this.correo_fact_elect = correo_fact_elect;
        }
        public String getApplica_fact_elect() {
            return applica_fact_elect;
        }
        public void setApplica_fact_elect(String applica_fact_elect) {
            this.applica_fact_elect = applica_fact_elect;
        }
        @Override
        public String toString() {
            return "PerFacturacion_Electronica [nit_proveedor=" + nit_proveedor
                    + ", cresponsable_iva=" + cresponsable_iva
                    + ", tresponsable_iva=" + tresponsable_iva
                    + ", cfiscales_adquiriente=" + cfiscales_adquiriente
                    + ", tfiscales_adquiriente=" + tfiscales_adquiriente
                    + ", correo_fact_elect=" + correo_fact_elect
                    + ", applica_fact_elect=" + applica_fact_elect + "]";
        }                                           
    }
    /* IAXIS-13881 : Cambios de facturacion electronica : end */
    
    /*********************************************************************************************************************/
    /************************************************
     * MÉTODOS DE ACTUALIZACIÓN
     *******************************************/
    /*********************************************************************************************************************/

    /**
     * Inicializa y devuelve un objeto Persona con los parámetros introducidos en el
     * formulario.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     * @return Persona - El objeto Persona rellenado con los datos del formulario.
     * @throws Exception
     */
    public Persona initPersona(HttpServletRequest request, Axisper010Action thisAction) {

        Persona person = new Persona();
        person.setSPERSON(getHiddenCampoNumerico(request, "SPERSON"));
        person.setCTIPPER(getHiddenCampoNumerico(request, "CTIPPER"));
        person.setCTIPIDE(getHiddenCampoNumerico(request, "CTIPIDE"));
        person.setNNUMIDE(getHiddenCampoTextual(request, "NNUMIDE"));
        person.setTDigitoide(getHiddenCampoNumerico(request, "TDIGITOIDE"));
        person.setTTiposoc(getHiddenCampoNumerico(request, "TIPOSOC"));
        person.setTNOMBRE1(getHiddenCampoTextual(request, "TNOMBRE1"));
        person.setTNOMBRE2(getCampoTextual(request, "TNOMBRE2"));
        person.setTAPELLI1(getHiddenCampoTextual(request, "TAPELLI1"));
        person.setTAPELLI2(getCampoTextual(request, "TAPELLI2"));
        person.setFNACIMI(stringToSqlDate(getHiddenCampoTextual(request, "FNACIMI")));
        person.setFJUBILA(stringToSqlDate(getHiddenCampoTextual(request, "FJUBILA")));
        String TSIGLAS = null;
        java.sql.Date FCONSTI = null;
        // Validate person "Juridica"
        if (person.getCTIPPER().equals(new BigDecimal(2))) {
            person.setTSIGLAS(person.getTAPELLI1());

            person.setFConsti(person.getFNACIMI());
            person.setFNACIMI(null);

        }
        person.setCSEXPER(getHiddenCampoNumerico(request, "CSEXPER"));
        person.setCPROFES(getCampoTextual(request, "CPROFES"));
        person.setCOCUPACION(getCampoTextual(request, "COCUPACION"));
        person.setCPAIS(getHiddenCampoNumerico(request, "CPAIS"));
        person.setCESTCIV(getCampoNumerico(request, "CESTCIV"));
        person.setCCiiu(getHiddenCampoTextual(request, "CCIIU"));
        person.setCAGENTE(getHiddenCampoNumerico(request, "CAGENTE"));// Default 1900
        person.setCNACIONALIDAD(getHiddenCampoNumerico(request, "CNACIONALIDAD"));
        person.setCCIR037(getHiddenCampoNumerico(request, "CCIR037")); // IAXIS-15419 : CIRCULAR 037 MODIFICACIONES
        person.setSFINANCI(getCampoNumerico(request, "SFINANCI"));
        person.setCESTPER(getCampoNumerico(request, "CESTPER"));
        person.setFEFECTO(stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO")));
        person.setCREGFISCAL(getCampoNumerico(request, "CREGFISCAL"));
        person.setCTIPIVA(getCampoNumerico(request, "CTIPIVA"));
        

        // Add direction to person
        person.getDireccion().setTipDir(getHiddenCampoNumerico(request, "CTIPDIR"));
        person.getDireccion().setAlias(getHiddenCampoTextual(request, "TALIAS"));
        person.getDireccion().setFdefecto(getHiddenCampoNumerico(request, "FDEFECTO"));
        person.getDireccion().setViaVp(getCampoNumerico(request, "CVIAVP"));
        person.getDireccion().setNomVia(getHiddenCampoTextual(request, "TNOMVIA"));
        person.getDireccion().setLitVp(getCampoNumerico(request, "CLITVP"));
        person.getDireccion().setBisVp(getCampoNumerico(request, "CBISVP"));
        person.getDireccion().setCorVp(getCampoNumerico(request, "CORVP"));
        person.getDireccion().setViaAdco(getCampoNumerico(request, "NVIAADCO"));
        person.getDireccion().setLitCo(getCampoNumerico(request, "CLITCO"));
        person.getDireccion().setCorCo(getCampoNumerico(request, "CORCO"));
        person.getDireccion().setPlacaCo(getCampoNumerico(request, "NPLACACO"));
        person.getDireccion().setCor2co(getCampoNumerico(request, "COR2CO"));
        person.getDireccion().setDet1ia(getCampoNumerico(request, "CDET1IA"));
        person.getDireccion().setNum1ia(getHiddenCampoTextual(request, "TNUM1IA"));
        person.getDireccion().setDet2ia(getCampoNumerico(request, "CDET2IA"));
        person.getDireccion().setNum2ia(getHiddenCampoTextual(request, "TNUM2IA"));
        person.getDireccion().setDet3ia(getCampoNumerico(request, "CDET3IA"));
        person.getDireccion().setNum3ia(getHiddenCampoTextual(request, "TNUM3IA"));
        person.getDireccion().setPostal(getHiddenCampoTextual(request, "CPOSTAL"));
        person.getDireccion().setPais_direccion(getHiddenCampoNumerico(request, "CPAIS_DIRECCION"));
        person.getDireccion().setProvin(getHiddenCampoNumerico(request, "CPROVIN"));
        person.getDireccion().setPobla(getHiddenCampoNumerico(request, "CPOBLAC"));

        // Add contacto to person
        person.getContacto().setTelFijo(getHiddenCampoTextual(request, "TLFFIJO"));
        person.getContacto().setPrexi_telFijo(getCampoNumerico(request, "CPREFIXTF"));
        person.getContacto().setTelMovil(getHiddenCampoTextual(request, "TLFMOVIL"));
        person.getContacto().setPrexi_telMovil(getCampoNumerico(request, "CPREFIXTM"));
        person.getContacto().setTelFax(getHiddenCampoTextual(request, "FAX"));
        person.getContacto().setPrexi_telFax(getCampoNumerico(request, "CPREFIXF"));
        person.getContacto().setEmail(getHiddenCampoTextual(request, "EMAIL"));

        /* IAXIS-13881 : Cambios de facturacion electronica : start */
        //Add FactElectronica to person
        logger.debug("FISCALES_ADQUIRIENTE :: " + getHiddenCampoTextual(request, "FISCALES_ADQUIRIENTE"));
                
        person.getFactElectronica().setNit_proveedor(getHiddenCampoTextual(request, "NIT_PROVEEDOR"));
        person.getFactElectronica().setCresponsable_iva(getCampoNumerico(request, "RESPONSABLE_IVA"));
        person.getFactElectronica().setCfiscales_adquiriente(getHiddenCampoTextual(request, "FISCALES_ADQUIRIENTE"));
        person.getFactElectronica().setCorreo_fact_elect(getHiddenCampoTextual(request, "CORREO_FACT_ELECT"));
        person.getFactElectronica().setApplica_fact_elect("SI");
        /* IAXIS-13881 : Cambios de facturacion electronica : end */
        
        logger.debug("PERSON OBJECT :: " + person.toString());

        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        return person;

    }

    /**
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     * @return BigDecimal Indicando si todo ha ido bien o no.
     * @throws Exception
     */
    public BigDecimal m_grabarPersona(Persona persona, HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Entrada :: Axisper010Service :: m_grabarPersona");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            formdata.put("CPAIS", getHiddenCampoNumerico(request, "CPAISnomodi"));
            HashMap m = this.f_Get_Avisos(request, this.whoami(this));
            BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
            request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

            BigDecimal CCIIU = getCampoNumerico(request, "CCIIU");
            BigDecimal CCIR037 = getHiddenCampoNumerico(request, "CCIR037"); /* IAXIS-15419 : CIRCULAR 037 MODIFICACIONES */

            PAC_IAX_DESCVALORES pac_axis_valores = new PAC_IAX_DESCVALORES(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            Map mapCiiu = pac_axis_valores.ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(CCIIU);

            if (!isEmpty(mapCiiu) && !isEmpty(mapCiiu.get("RETURN")) && !"**".equals((String) mapCiiu.get("RETURN"))) {

            } else {
                thisAction.guardarMensaje(request, "89905716", new Object[] { "" }, Constantes.MENSAJE_ERROR);
                cargarValoresDesplegables(request, thisAction, usuario, formdata);
                return new BigDecimal(1);
            }

            if (pRETURN != null && pRETURN.intValue() != 1) {
                Map map = persona.grabaPersona(pac_axis_persona,lTablaImptos);

                if (!isEmpty(map) && !isEmpty(map.get("PSPERSONOUT"))) {
                    // Recuperar la PSPERSONOUT y actualizar el SPERSON
                    persona.SPERSON = (BigDecimal) map.get("PSPERSONOUT");
                    //guardarImptos(request, persona.getSPERSON(), persona.getNNUMIDE());
                    //m_grabarRegfiscalPersona(persona, request, thisAction);
                                                            
                    request.setAttribute("PSPERSONOUT", map.get("PSPERSONOUT"));
                    request.setAttribute("PCAGENTEOUT", persona.CAGENTE);
                    formdata.put("SPERSON", map.get("PSPERSONOUT").toString());
                    
                    AbstractDispatchAction.topPila(request, "SPERSON_ALTA", map.get("PSPERSONOUT"));
                    request.getSession().setAttribute("SPERSON_ALTA", map.get("PSPERSONOUT"));

                    // modificacion 18/07/2017 javier herrera jira 960

                    /*
                     * String CMODO = "1"; java.sql.Date FCCOMER = new
                     * java.sql.Date(Calendar.getInstance().getTime().getTime());
                     * 
                     * String TDESCRIP = ""; BigDecimal CFOTORUT = BigDecimal.ZERO; Date FRUT = new
                     * java.sql.Date(Calendar.getInstance().getTime().getTime()); String TTITULO =
                     * ""; BigDecimal CFOTOCED = BigDecimal.ZERO; Date FEXPICED = new
                     * java.sql.Date(Calendar.getInstance().getTime().getTime()); BigDecimal CPAIS =
                     * new BigDecimal(170); BigDecimal CPROVIN = new BigDecimal(11); BigDecimal
                     * CPOBLAC = new BigDecimal(1); String TINFOAD = ""; BigDecimal CTIPSOCI =
                     * BigDecimal.ZERO; BigDecimal CESTSOC = BigDecimal.ZERO; String TOBJSOC = ".";
                     * String TEXPERI = ""; Date FCONSTI = stringToSqlDate(getCampoTextual(request,
                     * "FNACIMI")); String TVIGENC = "."; BigDecimal SFINANCI =
                     * getCampoNumerico(request, "SFINANCI"); PAC_IAX_FINANCIERA pac_axis_financiera
                     * = new
                     * PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.
                     * DB01CONN)); if (SFINANCI == null) {// si es nueva la persona se crea la ficha
                     * SFINANCI = BigDecimal.ZERO;
                     * 
                     * Map mapFicha =
                     * pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_GENERAL(persona.
                     * SPERSON, SFINANCI, CMODO, null, null, null, null, null, null, null, CPAIS,
                     * null, null, null, CCIIU, null, null, null, null, FCONSTI, null);
                     * 
                     * } else {// se modifica el cciiu Map mapFicha =
                     * pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_MODIFICAR_CCIIU(SFINANCI,
                     * CCIIU); } /* // modificacion 18/07/2017 javier herrera jira 960
                     * persona.grabaPersona(pac_axis_persona);
                     */
                    // Si existeix la nacionalitat, la guardem
                    this.tratarRETURNyMENSAJES(request, grabarNacionalidadPersona(pac_axis_persona, persona.SPERSON,
                            persona.CAGENTE, persona.CNACIONALIDAD, null));
                } // else request.setAttribute("PSPERSONOUT", map.get("PSPERSONOUT"));

                //cargarValoresDesplegables(request, thisAction, usuario, formdata);
                logger.debug("Salida :: Axisper010Service :: m_grabarPersona");
                lTablaImptos=new ArrayList<Map>();
                return (BigDecimal) tratarRETURNyMENSAJES(request, map);
            } else {
                //cargarValoresDesplegables(request, thisAction, usuario, formdata);
                logger.debug("Salida :: Axisper010Service :: m_grabarPersona");
                lTablaImptos=new ArrayList<Map>();
                return new BigDecimal(1);
            }

        } catch (Exception e) {
            logger.error("Error en el método Axisper010Service.m_grabarPersona", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            lTablaImptos=new ArrayList<Map>();
            return new BigDecimal(1);
        } finally {

            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }
    }

    public void m_ajax_direccion(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_direccion");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            String op = this.getHiddenCampoTextual(request, "op");
            BigDecimal CPAIS_RESIDENCIA = this.getHiddenCampoNumerico(request, "CPAIS_RESIDENCIA");
            PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

            if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_RESIDENCIA")) {
                Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_RESIDENCIA);
                logger.debug(map);
                ajax.rellenarPlAContenedorAjax(map);
                if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
                    Map pais = new HashMap();
                    pais.put("CPAIS_RESIDENCIA", CPAIS_RESIDENCIA);
                    pais.put("TPAISRESIDENCIA", map.get("RETURN"));
                    formdata.put("CPAIS", CPAIS_RESIDENCIA);
                    formdata.put("TPAISRESIDENCIA", map.get("RETURN"));
                    ajax.guardarContenidoFinalAContenedorAjax(pais);
                } else if ("**".equals((String) map.get("RETURN"))) {
                    Map pais = new HashMap();
                    pais.put("CPAIS", CPAIS_RESIDENCIA);
                    formdata.put("CPAIS", CPAIS_RESIDENCIA);
                    pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
                    ajax.guardarContenidoFinalAContenedorAjax(pais);
                }
            } else {
                ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
            }

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_direccion", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    public void m_ajax_duplicada(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_duplicada");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPERcerca");
            BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
            String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDEcerca");
            String SNIP = getHiddenCampoTextual(request, "SNIP");
            BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDEcerca");
            BigDecimal CSEXPER = getHiddenCampoNumerico(request, "CSEXPERcerca");
            BigDecimal SWPUBLI = getHiddenCampoNumerico(request, "SWPUBLI");
            BigDecimal CAGENTE = isEmpty(getHiddenCampoNumerico(request, "CAGENTEcerca"))
                    ? this.getHiddenCampoNumerico(request, "CAGENTE_INI")
                    : getHiddenCampoNumerico(request, "CAGENTEcerca");
            java.sql.Date FNACIMI = stringToSqlDate(getHiddenCampoTextual(request, "FNACIMIcerca"));
            PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_PERSONA_DUPLICADA(SPERSON, NNUMNIF, CSEXPER, FNACIMI,
                    SNIP, CAGENTE, SWPUBLI, CTIPIDE);
            logger.debug(map);
            ajax.rellenarPlAContenedorAjax(map);
            ajax.guardarContenidoFinalAContenedorAjax(map);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_direccion", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    public void m_ajax_getnnumide(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_getnnumide");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSON");
            String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDE");
            String SNIP = getHiddenCampoTextual(request, "SNIP");
            BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDE");
            PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_NIF(SPERSON, CTIPIDE, NNUMNIF, SNIP);
            logger.debug(map);

            ajax.rellenarPlAContenedorAjax(map);
            ajax.guardarContenidoFinalAContenedorAjax(map);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_getnnumide", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    public void m_ajax_getdigito(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_getdigito");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            String NNUMNIF = getHiddenCampoTextual(request, "NNUMIDE");
            BigDecimal CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDE");
            PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DIGITO_NIF_COL(CTIPIDE, NNUMNIF);
            logger.debug(map);

            ajax.rellenarPlAContenedorAjax(map);
            ajax.guardarContenidoFinalAContenedorAjax(map);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_getdigito", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    /**
     * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
     * búsqueda de Personas en BD, y devuelve el resultado en el atributo de sesión
     * Axisper008_listaPersonas.
     * 
     * @param request    El HttpServletRequest que contiene la petición del cliente
     *                   web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
     *                   (necesaria para el log).
     */
        public void m_getPersona(HttpServletRequest request, Axisper010Action thisAction) {
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
        Map OBPERSONA = new HashMap();
        try {
            PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            // Recuperar persona a buscar
            BigDecimal SPERSON = getHiddenCampoNumerico(request, "SPERSONDUP");
            BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTEDUP");

            Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
            logger.debug(map);
            BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

            OBPERSONA.put("isModify", Boolean.valueOf(true));
            OBPERSONA.put("isNew", Boolean.valueOf(true));
            if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

                OBPERSONA = (Map) map.get("OBPERSONA");
                OBPERSONA.put("isNew", Boolean.valueOf(false));
                request.setAttribute("dades_persona", (Map) map.get("OBPERSONA"));

                if (!isEmpty(OBPERSONA)) {
                    BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
                    if (new BigDecimal(2).equals(CTIPPER)) {
                        OBPERSONA.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
                    }
                    if (!isEmpty(OBPERSONA.get("CTIPIDE")) && !isEmpty(OBPERSONA.get("NNUMIDE")))
                        OBPERSONA.put("isModify", Boolean.valueOf(false));

                    BigDecimal CAGENTEx = isEmpty(getHiddenCampoNumerico(request, "CAGENTEcerca"))
                            ? this.getHiddenCampoNumerico(request, "CAGENTE_INI")
                            : getHiddenCampoNumerico(request, "CAGENTEcerca");

                    if (!isEmpty(CAGENTEx)) {
                        logger.debug(CAGENTEx);
                        OBPERSONA.put("CAGENTE", CAGENTEx);

                    }

                    PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
                            (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
                    map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA(SPERSON);
                    List array = (List) tratarRETURNyMENSAJES(request, map);
                    if (array != null) {
                        //int resultado = array.get(0).toString().indexOf("SFINANCI");
                        Map  t = (Map) array.get(0);
                        //String input = t.get("SFINANCI").toString();
                        //String SFINAN = array.get(0).toString().substring(resultado).split("=")[1].split(",")[0];
                        formdata.put("SFINANCI", t.get("SFINANCI"));                    
                        
                        if(isEmpty(OBPERSONA.get("FNACIMI"))) {
                            //resultado = array.get(0).toString().indexOf("FCONSTI");
                            //SFINAN = array.get(0).toString().substring(resultado).split("=")[1].split(",")[0];                            
                            OBPERSONA.put("FCONSTI", stringToSqlDate(t.get("FCONSTI").toString()));
                            OBPERSONA.replace("FNACIMI", t.get("FCONSTI"));     
                            formdata.put("FNACIMI", t.get("FCONSTI"));
                            
                            //resultado = array.get(0).toString().indexOf("CTIPSOCI");
                            //SFINAN = array.get(0).toString().substring(resultado).split("=")[1].split(",")[0];
                            
                            OBPERSONA.put("CTIPSOCI", t.get("CTIPSOCI"));
                        }
                        
                    }
                    
                    
                    
                    

                }
                OBPERSONA.put("isNew", Boolean.valueOf(false));
            }

            cargarValoresDesplegables(request, thisAction, usuario, formdata);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_direccion", e);

        } finally {
            if (!isEmpty(OBPERSONA)) {

                formdata.putAll(OBPERSONA);
                request.getSession().setAttribute("dades_setpersona", OBPERSONA);
            } else {

                request.getSession().removeAttribute("dades_setpersona");
                /*
                 * Object[] keySet = formdata.keySet().toArray(); for (int i = 0; i <
                 * keySet.length; i++) { formdata.remove(keySet[i]); }
                 */
            }

            try {

                cargarValoresDesplegables(request, thisAction, usuario, formdata);
            } catch (Exception ex) {
            }

            request.getSession().setAttribute("resultats", true);

        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }

    private Map grabarNacionalidadPersona(PAC_IAX_PERSONA pac_axis_persona, BigDecimal pSperson, BigDecimal pCagente,
            BigDecimal pCpais, BigDecimal pCdefecto) throws Exception {
        Map map = new HashMap();
        if (pCpais != null && pCagente != null) {
            if (pCdefecto == null)
                pCdefecto = new BigDecimal(0);
            map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_NACIONALIDAD(pSperson, pCagente, pCpais, pCdefecto);
            logger.debug("ejecutaPAC_IAX_PERSONA__F_SET_NACIONALIDAD: " + map);
        }
        return map;
    }

    public void m_ajax_ciiu(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_ciiu");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {
            BigDecimal CCIIU = this.getCampoNumerico(request, "CCIIU");

            PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
                    (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

            if (!isEmpty(CCIIU)) {

                Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(CCIIU);
                logger.debug(map);
                ajax.rellenarPlAContenedorAjax(map);
                Map ciiu = new HashMap();
                if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
                    ciiu.put("CCIIU", CCIIU);
                    ciiu.put("TCIIU", map.get("RETURN"));
                    ajax.guardarContenidoFinalAContenedorAjax(ciiu);
                } else {
                    ciiu.put("CCIIU", "");
                    ciiu.put("TCIIU", "");
                    ajax.guardarContenidoFinalAContenedorAjax(ciiu);
                }
            } else {
                ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
            }
        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_ciiu", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    public void m_ajax_busqueda_tip_indica(HttpServletRequest request) {
        logger.info("Axisprf010Service m_ajax_busqueda_tip_indica");
        AjaxContainerService ajax = new AjaxContainerService();
        try {
            ajax.guardarContenidoFinalAContenedorAjax(this.buscaTiposIndicador(request));
        } catch (Exception e) {
            logger.error("Error en el servicio Axisprf010Service - método m_ajax_busqueda_tip_indica", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }
    }

    private List buscaTiposIndicador(HttpServletRequest request) throws Exception {
        AjaxContainerService ajax = new AjaxContainerService();

        BigDecimal CCODIMP = getCampoNumerico(request, "CCODIMP");
        
        //inicio modificacion bartolo herrera 21-02-2019
        
                BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
                BigDecimal CAREA = null;

                if(CCODVIN.compareTo(new BigDecimal(2)) == 0 || CCODVIN.compareTo(new BigDecimal(7)) == 0) {
                    CAREA = new BigDecimal(3);
                }else if(CCODVIN.compareTo(new BigDecimal(3)) == 0 ) {
                    CAREA = new BigDecimal(2);
                }else if(CCODVIN.compareTo(new BigDecimal(4)) == 0 ) {
                    CAREA = new BigDecimal(1);
                }

                Map map = new PAC_IAX_SIN_IMP_SAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, CAREA);
                
                //fin modificacion bartolo herrera 21-02-2019
    

    logger.debug("++++map TIPOS INDICADOR-->" + map);

        List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
        return plLista;
    }

    public void m_ajax_busqueda_tip_agente(HttpServletRequest request) {
        logger.info("Axisprf016Service m_ajax_busqueda_tip_agente");
        AjaxContainerService ajax = new AjaxContainerService();
        try {
            ajax.guardarContenidoFinalAContenedorAjax(this.buscaTiposAgente(request));
        } catch (Exception e) {
            logger.error("Error en el servicio Axisprf016Service - método m_ajax_busqueda_tip_agente", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }
    }

    private List buscaTiposAgente(HttpServletRequest request) throws Exception {
        AjaxContainerService ajax = new AjaxContainerService();

        BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
        logger.debug(CCODVIN);

        if (((BigDecimal) getCampoNumerico(request, "CCODVIN")).intValue() == 3) {
            Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
                    .ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
            logger.debug("++++map TIPOS AGENTES1-->" + map);
            List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
            logger.debug("++++map AGENTES1-->" + plLista.toString() + "" + plLista.size());
            return plLista;
        } else {
            if (((BigDecimal) getCampoNumerico(request, "CCODVIN")).intValue() == 4) {
                Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
                        .ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP();
                logger.debug("++++map TIPOS AGENTES1-->" + map);
                List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
                logger.debug("++++map TIPO EMPRESA-->" + plLista.toString() + "" + plLista.size());
                return plLista;
            }
        }
        return null;
    }

    
    // * Basura */

    public void m_ajax_tabla_indica(HttpServletRequest request) {
        logger.info("Axisprf010Service m_ajax_tabla_indica");
        AjaxContainerService ajax = new AjaxContainerService();
        HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

        try {

            SimpleDateFormat dateformat3 = new SimpleDateFormat("dd/MM/yyyy");
            java.util.Date date1 = null;
            try {
                date1 = dateformat3.parse("01/01/2020");
            } catch (ParseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            java.sql.Date fAlta = stringToSqlDate("01/01/2022");

            Map impuestos = new HashMap();
            impuestos.put("CCODIMP", "1");
            impuestos.put("TDESIMP", "A");
            impuestos.put("CTIPIND", "2");
            impuestos.put("TINDICA", "B");
            impuestos.put("CUSUARI", "CS");
            impuestos.put("FALTA", fAlta);
            // impuestos.put("FALTA", "01/01/2019");
            Map map = new HashMap();
            map.put("OB_IAX_PROF_IMPUESTOS", impuestos);

            lTablaImptos.add(map);

            Map imptos = new HashMap();
            imptos.put("IMPUESTOS", lTablaImptos);

            Map objProfes = new HashMap();
            objProfes.put("OBPROFESIONAL", imptos);

            // formdata.put("OBPROFESIONAL", objProfes);

            /*
             * Map otro = new HashMap();
             * 
             * 
             * otro = (Map) json;
             * 
             * 
             * 
             * 
             * String input = (String) formdata.get("OBPROFESIONAL"); Map<String, String>
             * map = Arrays.asList(input.split(",")).stream().collect( Collectors.toMap(x ->
             * x.replaceAll("=\\d+$", ""), x -> x.replaceAll("^\\d+=", "")));
             * 
             * HashMap info = new HashMap(); info = (HashMap) formdata.get("OBPROFESIONAL");
             * 
             * Map impuestos = new HashMap(); impuestos.put("CCODIMP", "2");
             * impuestos.put("TDESIMP", "DOS"); impuestos.put("CTIPIND", "3");
             * impuestos.put("TINDICA", "TRES"); impuestos.put("CUSUARI", "CARLOSS");
             * impuestos.put("FALTA", date1); //impuestos.put("FALTA", "01/01/2019");
             * 
             * Map map2 = new HashMap(); map2.put("OB_IAX_PROF_IMPUESTOS", impuestos);
             * map2.put("OB_IAX_PROF_IMPUESTOS", map.get("OB_IAX_PROF_IMPUESTOS")); Map
             * objProfes = new HashMap(); objProfes.put("IMPUESTOS", map2);
             */
            formdata.put("OBPROFESIONAL", imptos);
            ajax.guardarContenidoFinalAContenedorAjax(objProfes);
        } catch (Exception e) {
            logger.error("Error en el servicio Axisprf010Service - método m_m_ajax_tabla_indica", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }
    }

    /* Cambio para bug-14446 : start */ 
    public void m_ajax_imptos(HttpServletRequest request, Axisper010Action thisAction) {
        logger.debug("Axisper010Service m_ajax_imptos");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

        try {

            BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
            BigDecimal CCODAGEN = getCampoNumerico(request, "CCODAGEN");
            BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
            String id = getHiddenCampoTextual(request, "NNUMIDE");
            
            BigDecimal CCODIMP = getCampoNumerico(request, "CCODIMP");
            String isValid = "false";
            String isExist = "false";
                        
            logger.debug("Axisper010Service m_ajax_imptos : id : "+id);         
            // Map <String,BigDecimal> impuestos = new HashMap<String,BigDecimal>();
            Map impuestos = null;
            Map map = null;
            Map result = new HashMap();
            
            if(lTablaImptos != null && lTablaImptos.size() == 0)
            {           
                impuestos = new HashMap();
                map = new HashMap();
                impuestos.put("CCODVIN", CCODVIN);
                impuestos.put("CCODAGEN", CCODAGEN);
                impuestos.put("CTIPIND", CTIPIND);
                impuestos.put("ID", id);
                impuestos.put("CCODIMP", CCODIMP);
                                
                map.put("OB_IAX_PROF_IMPUESTOS", impuestos);
                isValid = "true";
                lTablaImptos.add(map);
                result.put("VALUE", isValid);
                ajax.rellenarPlAContenedorAjax(map);
            }
            else
            {               
                for(int i = 0; i<lTablaImptos.size();i++)
                {
                    Map indicador = (Map) lTablaImptos.get(i).get("OB_IAX_PROF_IMPUESTOS");
                    
                    if(indicador.get("ID").equals(id) && 
                       indicador.get("CCODIMP").equals(CCODIMP) &&
                       indicador.get("CTIPIND").equals(CTIPIND))
                    {
                        isExist = "true";
                        isValid = "false";
                        result.put("VALUE", isValid);
                        break;
                    }                   
                }
                if(isExist.equals("false"))
                {
                    impuestos = new HashMap();
                    map = new HashMap();
                    impuestos.put("CCODVIN", CCODVIN);
                    impuestos.put("CCODAGEN", CCODAGEN);
                    impuestos.put("CTIPIND", CTIPIND);
                    impuestos.put("ID", id);
                    impuestos.put("CCODIMP", CCODIMP);                              
                    map.put("OB_IAX_PROF_IMPUESTOS", impuestos);
                    isValid = "true";
                    lTablaImptos.add(map);
                    ajax.rellenarPlAContenedorAjax(map);
                    result.put("VALUE", isValid);
                }
            }                               
            ajax.guardarContenidoFinalAContenedorAjax(result);

        } catch (Exception e) {
            logger.error("Error en el servicio Axisper010Service - método m_ajax_imptos", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }
    /* Cambio para bug-14446 : end */ 

    public void guardarImptos(HttpServletRequest request, BigDecimal pSperson, String pId) {

        for (Map indicador : lTablaImptos) {
            indicador = (Map) indicador.get("OB_IAX_PROF_IMPUESTOS");

            if (indicador.get("ID").equals(pId)) {
            try {
                PAC_IAX_SIN_IMP_SAP PAC_IAX_SIN_IMP_SAP = new PAC_IAX_SIN_IMP_SAP(
                        (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
                Map map = null;
                BigDecimal agente = null;
                
                try {
                    agente = new BigDecimal( indicador.get("CCODAGEN").toString());
                } catch (Exception e) {
                    agente = null;

                }
                
                map = PAC_IAX_SIN_IMP_SAP.ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER(
                        new BigDecimal(indicador.get("CCODVIN").toString()),
                        agente,
                        new BigDecimal(indicador.get("CTIPIND").toString()), 
                        pSperson);
                logger.debug("++++map ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER" + map);

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

        }
            lTablaImptos.remove(indicador);
        }
        

    }
    
    
     public BigDecimal m_grabarRegfiscalPersona(Persona persona, HttpServletRequest request, Axisper010Action thisAction) {
            logger.debug("Axisper010Service m_grabarRegfiscalPersona");
            UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
            Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
             
            try {
                PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));   

                
                boolean todoOk = true;
                if (!isEmpty(persona.getFEFECTO()) && !isEmpty(persona.getCREGFISCAL())){
                    Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_REGIMENFISCAL(persona.SPERSON,   persona.getCAGENTE(), persona.getFEFECTO(), persona.getCREGFISCAL(), null, persona.getCTIPIVA());
                    logger.debug(map);
                    todoOk = new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map));
                }
                
                return todoOk ? new BigDecimal(0) : new BigDecimal(1);
                
            } catch (Exception e) {
                logger.error("Error en el método Axisper010Service.m_grabarRegfiscalPersona", e);
                thisAction. guardarMensaje(request, "1000050", new Object[] {e.toString()}, Constantes.MENSAJE_ERROR);
                return new BigDecimal(1);  
            }
         }

     /* IAXIS-13881 : Cambios de facturacion electronica : start */
     public void m_ajax_fiscales_adquiriente(HttpServletRequest request, Axisper010Action thisAction) 
     {
            logger.debug("Axisper010Service m_ajax_fiscales_adquiriente");
            UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
            AjaxContainerService ajax = new AjaxContainerService();
            Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

            try 
            {
                String cfis_adquirient = this.getCampoTextual(request, "FISCALES_ADQUIRIENTE");

                PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
                        (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

                if (!isEmpty(cfis_adquirient)) {

                    Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_FISCALES_ADQUIRIENTE(cfis_adquirient);
                    logger.debug(map);
                    ajax.rellenarPlAContenedorAjax(map);
                    Map fiscales_adquiriente = new HashMap();
                    if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN")))
                    {
                        fiscales_adquiriente.put("FISCALES_ADQUIRIENTE", cfis_adquirient);
                        fiscales_adquiriente.put("TFISCALES_ADQUIRIENTE", map.get("RETURN"));
                        ajax.guardarContenidoFinalAContenedorAjax(fiscales_adquiriente);
                    } 
                    else 
                    {
                        fiscales_adquiriente.put("FISCALES_ADQUIRIENTE", "");
                        fiscales_adquiriente.put("TFISCALES_ADQUIRIENTE", "");
                        ajax.guardarContenidoFinalAContenedorAjax(fiscales_adquiriente);
                    }
                } else 
                {
                    ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
                }
            } catch (Exception e) 
            {
                logger.error("Error en el servicio Axisper010Service - m_ajax_fiscales_adquiriente", e);
                ajax.rellenarExcepcionAContenedorAjax(e);
            } finally 
            {
                request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            }
        }
     
     public void m_ajax_validate_nit_proveedor(HttpServletRequest request, Axisper010Action thisAction) 
     {
            logger.debug("Axisper010Service m_ajax_validate_nit_proveedor");
            UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
            AjaxContainerService ajax = new AjaxContainerService();
            Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

            try 
            {
                String nitProveedor = this.getHiddenCampoTextual(request, "NIT_PROVEEDOR");
                                
                PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
                        (java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
                if (!isEmpty(nitProveedor)) 
                {               
                    Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_VALIDANIF(nitProveedor, new BigDecimal(37), null, null);
                    logger.debug("map : nitProveedor :"+map);
                    ajax.rellenarPlAContenedorAjax(map);
                    Map resultadoNitProveedor = new HashMap();
                                        
                    resultadoNitProveedor.put("result", map.get("RETURN"));
                    ajax.guardarContenidoFinalAContenedorAjax(resultadoNitProveedor);                   
                } else 
                {
                    ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
                }
            } catch (Exception e) 
            {
                logger.error("Error en el servicio Axisper010Service - m_ajax_validate_nit_proveedor", e);
                ajax.rellenarExcepcionAContenedorAjax(e);
            } finally 
            {
                request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            }
        }
     /* IAXIS-13881 : Cambios de facturacion electronica : end */
     

     /* Cambio para IAXIS-15339 : Start */
     public void m_buscarDatosCIFIN(HttpServletRequest request,Axisper010Action thisAction) 
        {
            logger.debug("Axisper010Service m_buscarDatosCIFIN");
            UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
            Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
                            
            BigDecimal CTIPIDE = null;
            String NNUMIDE = null;
            BigDecimal resultado = null;
            BigDecimal CTIPPER = null;
            String TAPELLI = null; //POST 35
            try {
                
                CTIPIDE = getHiddenCampoNumerico(request, "CTIPIDEcerca_MODIFVISIBLE");         
                NNUMIDE = getCampoTextual(request, "NNUMIDEcerca");
                CTIPPER = getHiddenCampoNumerico(request, "CTIPPERcerca");
                TAPELLI = getCampoTextual(request, "TAPELLIcerca");//POST 35
                
                logger.debug("Axisper010Service m_buscarDatosCIFIN : CTIPIDE :"+CTIPIDE);
                logger.debug("Axisper010Service m_buscarDatosCIFIN : NNUMIDE :"+NNUMIDE);
                logger.debug("Axisper010Service m_buscarDatosCIFIN : TAPELLI :"+TAPELLI); //POST 35
                
                formdata.put("CTIPIDEcerca", CTIPIDE);
                formdata.put("CTIPPERcerca", CTIPPER);
                
                formdata.put("CTIPIDE", CTIPIDE);
                formdata.put("CTIPPER", CTIPPER);
                
                PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
                                
                //POST-35
                //Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_BUSCAR_SERVICIO_CIFIN(NNUMIDE, CTIPIDE);
            
                Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_CREAR_SERVICIO_CIFIN(NNUMIDE, CTIPIDE, TAPELLI);
                //POST-35

                logger.debug("Axisper054Service m_buscarDatosCIFIN: map: " + map);
                                                                                
                resultado = (BigDecimal)map.get("RETURN"); 
                logger.debug("resultado -----------------> " + resultado);
                
                if (new BigDecimal(0).equals(resultado))
                {                                   
                    List MENSAJES = (List) map.get("MENSAJES");
                    logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

                    HashMap mm = (HashMap) MENSAJES.get(0);
                    HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");
                    
                    logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);
                    logger.debug("PERSONAS_CIFIN : " + map.get("PERSONAS_CIFIN"));
                    //Map PERSONAS_CIFIN = map.get("PERSONAS_CIFIN");
                    Map PERSONAS_CIFIN = new HashMap();
                    PERSONAS_CIFIN = (Map) map.get("PERSONAS_CIFIN");
                    request.getSession().setAttribute("PERSONAS_CIFIN", map.get("PERSONAS_CIFIN"));
                    
                    AbstractDispatchAction.guardarMensaje(request,OB_IAX_MENSAJES.get("TERROR").toString(), new Object[] {},Constantes.MENSAJE_INFO);   
                    
                     if(CTIPPER.equals(new BigDecimal(1)))
                     {
                         formdata.put("TNOMBRE1", PERSONAS_CIFIN.get("TNOMBRE1"));
                         formdata.put("TNOMBRE2", PERSONAS_CIFIN.get("TNOMBRE2"));
                         formdata.put("TAPELLI1", PERSONAS_CIFIN.get("TAPELLI1"));
                         formdata.put("TAPELLI2", PERSONAS_CIFIN.get("TAPELLI2"));
                         formdata.put("FNACIMI", PERSONAS_CIFIN.get("FNACIMI"));
                         formdata.put("CSEXPER", PERSONAS_CIFIN.get("CSEXPER"));
                     }
                     else{
                         formdata.put("TAPELLI1", PERSONAS_CIFIN.get("TNOMBRE")); 
                     }
                     formdata.put("CPAIS", PERSONAS_CIFIN.get("CPAIS"));                     
                     formdata.put("CCIIU", PERSONAS_CIFIN.get("CCIIU"));                                        
                     formdata.put("CNACIONALIDAD", PERSONAS_CIFIN.get("CPAIS"));
                     //INI TASK 174 EDSS HOMOLOGACION CIFIN
                     formdata.put("CESTPER",PERSONAS_CIFIN.get("CESTPER"));
                     //FIN TASK 174 EDSS HOMOLOGACION CIFIN
                     List CONTACTOS = (List) PERSONAS_CIFIN.get("CONTACTOS");
                     boolean isFFIJO = false;
                     boolean isEMAIL = false;
                     boolean isMOVIL= false;
                     for(int i = 0; i < CONTACTOS.size(); i++)
                     {
                         HashMap CONTACTO = (HashMap) CONTACTOS.get(i);
                         if(CONTACTO != null)
                         {
                             HashMap OB_IAX_CONTACTO = (HashMap) CONTACTO.get("OB_IAX_CONTACTOS");
                             if(OB_IAX_CONTACTO.get("CTIPCON").equals(new BigDecimal(1)) && !isFFIJO)
                             {
                                 formdata.put("TLFFIJO", OB_IAX_CONTACTO.get("TVALCON"));
                                 isFFIJO = true;
                             }
                             if(OB_IAX_CONTACTO.get("CTIPCON").equals(new BigDecimal(3)) && !isEMAIL)
                             {
                                 formdata.put("EMAIL", OB_IAX_CONTACTO.get("TVALCON"));
                                 isEMAIL = true;
                             }
                             if(OB_IAX_CONTACTO.get("CTIPCON").equals(new BigDecimal(6)) && !isMOVIL)
                             {
                                 formdata.put("TLFMOVIL", OB_IAX_CONTACTO.get("TVALCON"));
                                 isMOVIL = true;
                             }                           
                         }                       
                     }
                     
                     List DIRECCIONES = (List) PERSONAS_CIFIN.get("DIRECCIONES");
                     boolean isDir = false;
                     
                     for(int i = 0; i < DIRECCIONES.size(); i++)
                     {
                         HashMap DIRECCION = (HashMap) DIRECCIONES.get(i);
                         if(DIRECCION != null)
                         {
                             HashMap OB_IAX_DIRECCION = (HashMap) DIRECCION.get("OB_IAX_DIRECCIONES");
                             if(OB_IAX_DIRECCION.get("TNOMVIA") != "" && !isDir)
                             {                               
                                 formdata.put("CTIPDIR", OB_IAX_DIRECCION.get("CTIPDIR"));
                                 formdata.put("TNOMVIA", OB_IAX_DIRECCION.get("TNOMVIA"));                               
                                 formdata.put("CPOSTAL", OB_IAX_DIRECCION.get("CPOSTAL"));
                                 formdata.put("CPAIS_DIRECCION", OB_IAX_DIRECCION.get("CPAIS"));
                                 formdata.put("CPROVIN", OB_IAX_DIRECCION.get("CPROVIN"));
                                 formdata.put("CPOBLAC", OB_IAX_DIRECCION.get("CPOBLAC"));
                                 isDir = true;
                             }                                               
                         }                       
                     }
                     
                }
                else if(new BigDecimal(1).equals(resultado))
                {
                    List MENSAJES = (List) map.get("MENSAJES");
                    logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

                    HashMap mm = (HashMap) MENSAJES.get(0);
                    HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");
                    
                    logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);                       
                    AbstractDispatchAction.guardarMensaje(request,OB_IAX_MENSAJES.get("TERROR").toString(), new Object[] {},Constantes.MENSAJE_INFO);
                }
                else
                {                       
                    AbstractDispatchAction.guardarMensaje(request, resultado.toString(), new Object[] {}, Constantes.MENSAJE_INFO);                 
                }
                cargarValoresDesplegables(request, thisAction, usuario, formdata);
            } catch (Exception e) 
            {
                logger.error("Error en el servicio Axisper054Service - método m_buscarDatosCIFIN ",e);
                AbstractDispatchAction.guardarMensaje(request, "1000052",
                        new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            }       
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }       
     /* Cambio para IAXIS-15339 : End */
}
