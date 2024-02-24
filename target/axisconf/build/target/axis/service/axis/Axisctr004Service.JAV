package axis.service.axis;

import axis.cache.AxisCodeWizard;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;

import axis.mvc.view.VisibleTag;

import axis.util.Constantes;

import java.math.BigDecimal;

import java.sql.Date;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class Axisctr004Service extends AxisBaseService {
    Log logger=LogFactory.getLog(this.getClass());
    private String SNIP="";
    private BigDecimal SPERSON;

    /*********************************************************************************************************************/
    /*********************************************** M�TODOS DE INICIALIZACION *******************************************/
    /*********************************************************************************************************************/

    /**
     * Inicializa los datos gesti�n y las preguntas y las guarda en los objetos
     * axisctr_opcionesDatosGestion (las opciones seleccionables), axisctr_datosGestion
     * (los campos no seleccionables y las respuestas del usuario) y axisctr_preguntasPoliza.
     * @param request El HttpServletRequest que contiene la petici�n del cliente web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio (necesaria para el log).
     */
    public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr004Service m_form");
        //Gesti�n de campos y dependencias
        this.configForm(request, whoami(this));
        this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));

        try {
            initDatosGestion(request);
            initPreguntas(request, thisAction);
            this.cargaAgente(request); //BUG:8613
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_form", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }

    private void initDatosGestion(HttpServletRequest request) throws Exception {
        Map opcionesDatosGestion=new HashMap();
        Map opcionesDatosRenta=new HashMap();
        Map datosGestion=new HashMap();
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        // Carga de las PAC_IAX PL/SQL
        PAC_IAX_PRODUCCION pac_iax_produccion=new PAC_IAX_PRODUCCION(usuario.getConnection());
        PAC_IAX_LISTVALORES pac_iax_listvalores=new PAC_IAX_LISTVALORES(usuario.getConnection());
        PAC_IAXPAR_PRODUCTOS pac_axispar_productos=new PAC_IAXPAR_PRODUCTOS(usuario.getConnection());

        /* Datos gesti�n */
        Map map=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
        datosGestion=(Map)tratarRETURNyMENSAJES(request, map);
        logger.debug(datosGestion);
        
        BigDecimal SPRODUC=(BigDecimal)AbstractDispatchAction.topPila(request, "SPRODUC");
        
        //-- RKV - Bug 9916
        /* Actividades */        
        if (VisibleTag.esComponenteVisible(request, "axisctr004", "CACTIVI")) {       
            if (!isEmpty(datosGestion)) {
                formdata.put("CACTIVI", datosGestion.get("CACTIVI"));
                map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, null);
                logger.debug(map);
                opcionesDatosGestion.put("lstCactivi", tratarRETURNyMENSAJES(request, map));
            }        
        }
        //-- Fin RKV - Bug 9916        

        List cuentasTomador=new ArrayList();
        /* Cuentas tomador */
        map=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
        logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()"+map);
        // Leer el PSPERSON y establecerlo en formdata
        formdata.put("SPERSON", map.get("PSPERSON"));
        SPERSON=(BigDecimal)map.get("PSPERSON");
        if (!isEmpty(map)) {

            cuentasTomador=(List)tratarRETURNyMENSAJES(request, map);
            if (!isEmpty(cuentasTomador)) {
                formdata.put("SNIP", ((Map)cuentasTomador.get(0)).get("SNIP"));
            }
        }

        if (isEmpty(request.getSession().getAttribute("cargaHost"))&&!isEmpty(cuentasTomador)) {
            opcionesDatosGestion.put("cuentasTomador", cuentasTomador);

        }
        else if (!isEmpty(request.getSession().getAttribute("cargaHost"))) {


            if (!isEmpty(getCampoNumerico(request, "SPERSON")))
                SPERSON=getCampoNumerico(request, "SPERSON");

            if (isEmpty(SNIP))
                SNIP=getCampoTextual(request, "SNIP");

            map=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "EST");
            logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()"+map);
            if (!isEmpty(map)) {
                cuentasTomador=(List)tratarRETURNyMENSAJES(request, map);
                opcionesDatosGestion.put("cuentasTomador", cuentasTomador);
            }

        }


        /* Lista idiomas */
        map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
        List idiomas=(List)tratarRETURNyMENSAJES(request, map);
        opcionesDatosGestion.put("idiomas", idiomas);
        idiomas=null;

        /* Comisi�n */
        map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISION();
        logger.debug(map);
        List comisiones=(List)tratarRETURNyMENSAJES(request, map);
        opcionesDatosGestion.put("comision", comisiones);

        /* Tipo duraci�n */
        map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION();
        logger.debug(map);
        List tipoDuracion=(List)tratarRETURNyMENSAJES(request, map);
        opcionesDatosGestion.put("tipoDuracion", tipoDuracion);

        /* Forma pago */
        map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
        logger.debug(map);
        List formaPago=(List)tratarRETURNyMENSAJES(request, map);
        opcionesDatosGestion.put("formaPago", formaPago);

        if (!isEmpty(datosGestion)) {
            map=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
            logger.debug(map);
            BigDecimal CFORPAG=(BigDecimal)tratarRETURNyMENSAJES(request, map);
            datosGestion.put("CFORPAG", CFORPAG);
        }

        /* Tipo cobro */
        map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
        logger.debug(map);
        List tipoCobro=(List)tratarRETURNyMENSAJES(request, map);
        opcionesDatosGestion.put("tipoCobro", tipoCobro);

        /* Subagentes */
        BigDecimal CAGENTE=usuario.getCagente();
        if (!isEmpty(CAGENTE)) {
            map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_SUBAGENTES(CAGENTE);
            logger.debug(map);
        }
        
        /* PerRevision */
        map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(SPRODUC);
        logger.debug(map);
        List NDURPER=(List)tratarRETURNyMENSAJES(request, map);
        //opciones
        opcionesDatosRenta.put("NDURPER", NDURPER);

        /* ForPagRent */
        map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(SPRODUC);
        logger.debug(map);
        List CFORPAGREN=(List)tratarRETURNyMENSAJES(request, map);
        //opcionesDatosRenta.put("CFORPAGREN", CFORPAGREN);
        opcionesDatosRenta.put("CFORPAGREN", CFORPAGREN);

        // Metemos el ArrayList en session para poder mostralo en la pantalla
        request.getSession().setAttribute("axisctr_opcionesDatosGestion", !isEmpty(opcionesDatosGestion)?opcionesDatosGestion:new HashMap());
        request.getSession().setAttribute("axisctr_datosGestion", !isEmpty(datosGestion)?datosGestion:new HashMap());
        request.getSession().setAttribute("axisctr_opcionesDatosRenta", !isEmpty(opcionesDatosRenta)?opcionesDatosRenta:new HashMap());

        opcionesDatosGestion=null;
        datosGestion=null;
        opcionesDatosRenta=null;
    }

    private void initPreguntas(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        PAC_IAXPAR_PRODUCTOS pac_axispar_productos=new PAC_IAXPAR_PRODUCTOS(usuario.getConnection());
        PAC_IAX_PRODUCCION pac_iax_produccion=new PAC_IAX_PRODUCCION(usuario.getConnection());

        // Leer preguntas producto
        Map map=pac_axispar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA();
        logger.debug("Preguntas Poliza -> "+map);

        List preguntas=(List)tratarRETURNyMENSAJES(request, map);

        map=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA();
        logger.debug("Preguntas Usuario -> "+map);

        // Leer preguntas/respuestas del usuario
        List respuestas=(List)tratarRETURNyMENSAJES(request, map);

        // Mezclar las respuestas con las preguntas iniciales
        inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");
        logger.debug("GUARDAMOS RESPUESTAS EN SESSION PORQUE PODEMOS TENER DESACTIVO EL MULTIREGISTRO PREGUNTAS/RESPUESTAS: "+request.getSession().getAttribute("axisPreguntas"));

        logger.debug("Preguntas/Respuestas despu�s del merge -> "+preguntas);

        List pregQuestSalut = null;
        List pregDespeses = null;
        if (!isEmpty(preguntas)){
            pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
            pregDespeses   = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
        }        
        // Guardar lista de preguntas para mostrarla en la pantalla mediante un DisplayTag
        // es guarden els diferents grups de preguntes 
        request.getSession().setAttribute("axisctr_pregQuestSalut", ((pregQuestSalut==null)?new ArrayList():pregQuestSalut));
        request.getSession().setAttribute("axisctr_pregDespeses", ((pregDespeses==null)?new ArrayList():pregDespeses));
        request.getSession().setAttribute("axisctr_preguntasPoliza", ((preguntas==null)?new ArrayList():preguntas));
        preguntas=null; pregQuestSalut=null; pregDespeses= null;
        
        }
        
        private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU){

        List pregdividides = new ArrayList();
        List<HashMap> objBorrar = new ArrayList();
        
        for (HashMap OB_IAXPAR_PREGUNTAS : preguntas){
            HashMap preg = (HashMap)OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
            BigDecimal CTIPGRUobj = (BigDecimal)preg.get("CTIPGRU");
            logger.debug("CTIPGRUobj-->"+CTIPGRUobj);
            if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU){
                pregdividides.add(OB_IAXPAR_PREGUNTAS);
               objBorrar.add(OB_IAXPAR_PREGUNTAS);
            }
            
            logger.debug("PREG-->"+OB_IAXPAR_PREGUNTAS);
        }
        
        for (HashMap OB_IAXPAR_PREGUNTAS : objBorrar){
            preguntas.remove(OB_IAXPAR_PREGUNTAS);
        }
        
        return pregdividides;
        
        
                

    }

    /*********************************************************************************************************************/
    /*********************************************** M�TODOS DE ACTUALIZACION ********************************************/
    /*********************************************************************************************************************/

    /**
     * Guarda las selecciones del usuario a BD, guarda las preguntas
     * y las respuestas del usuario en BBDD y en axisctr_preguntasPoliza.
     * @param request El HttpServletRequest que contiene la petici�n del cliente web.
     * @param thisAction Una Action abstracta desde donde se ha invocado el servicio (necesaria para el log).
     */
    private void m_guardarEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr004Service m_guardarDatos");
        try {
            // Guardamos en session los par�metros seleccionados / introducidos en la pantalla
            UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);

            Date FEFECTO=AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"));
            BigDecimal CDURACI=getHiddenCampoNumerico(request, "CDURACI");
            BigDecimal NDURACI=getHiddenCampoNumerico(request, "NDURACI");
            BigDecimal NDURCOB=getHiddenCampoNumerico(request, "NDURCOB");
            logger.debug(NDURCOB);

            Date FVENCIM=AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FVENCIM"));
            BigDecimal CFORPAG=getHiddenCampoNumerico(request, "CFORPAG");
            BigDecimal CTIPCOB=getHiddenCampoNumerico(request, "CTIPCOB");
            BigDecimal CTIPCOM=getHiddenCampoNumerico(request, "CTIPCOM");
            BigDecimal PDTOCOM=getHiddenCampoNumerico(request, "PDTOCOM");

            BigDecimal CIDIOMA=getHiddenCampoNumerico(request, "CIDIOMA");
            String CBANCAR=getHiddenCampoTextual(request, "CBANCAR");
            BigDecimal CSUBAGE=getHiddenCampoNumerico(request, "CSUBAGE");
            BigDecimal NDURPER=getHiddenCampoNumerico(request, "NDURPER");
            BigDecimal PCAPFALL=getHiddenCampoNumerico(request, "PCAPFALL");
            BigDecimal PDOSCAB=getHiddenCampoNumerico(request, "PDOSCAB");
            BigDecimal CFORPAGREN=getHiddenCampoNumerico(request, "CFORPAGREN");
            String POLISSA_INI=getHiddenCampoTextual(request, "POLISSA_INI");
            BigDecimal CAGENTE=getHiddenCampoNumerico(request, "CAGENTE_TEXT");
            BigDecimal CRECFRA=isEmpty(getCampoNumerico(request, "CRECFRA"))?new BigDecimal(0):getCampoNumerico(request, "CRECFRA");

            PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(usuario.getConnection());

            Map agentes=(Map)request.getSession().getAttribute("axisctr004_agente");
            if (isEmpty(CAGENTE)){
                logger.debug("agentes:"+agentes);
                CAGENTE=new BigDecimal(String.valueOf(agentes.get("CODI")));
            }

            /* Grabar Datos Gesti�n */
            Map grabarDatosGestion=pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(FEFECTO, CDURACI, NDURACI, FVENCIM, CFORPAG, CTIPCOB, POLISSA_INI, CTIPCOM, PDTOCOM, CIDIOMA, CBANCAR, CSUBAGE, NDURPER, PCAPFALL, PDOSCAB, CFORPAGREN, NDURCOB, CRECFRA, CAGENTE);
            logger.debug(grabarDatosGestion);
            tratarRETURNyMENSAJES(request, grabarDatosGestion);

            List preguntas=(List)request.getSession().getAttribute("axisctr_preguntasPoliza");
            List<HashMap> pregQuestSalut=(List)request.getSession().getAttribute("axisctr_pregQuestSalut");
            List<HashMap> pregDespeses=(List)request.getSession().getAttribute("axisctr_pregDespeses");
            if (!isEmpty(pregQuestSalut))
            for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut){
                    preguntas.add(OB_IAXPAR_PREGUNTAS);
            }
            
            if (!isEmpty(pregDespeses))
            for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses){
                    preguntas.add(OB_IAXPAR_PREGUNTAS);
            }
            logger.debug("preguntas merged grabades ::"+preguntas);
            
            if (!isEmpty(preguntas)) {                
                // Guardar preguntas. La pantalla puede esconder el mutiregistro de preguntas/respuestas.
                //En ese caso, recuperamos las respuestas desde una variable de sesi�n
                if (!isEmpty(request.getSession().getAttribute("axisPreguntas"))) {
                    guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA", "axisPreguntas");
                    request.getSession().removeAttribute("axisPreguntas");
                }
                else
                    guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA");
            }
            
            //-- RKV - Bug 9916
            // Grabar actividad
            if (VisibleTag.esComponenteVisible(request, "axisctr004", "CACTIVI")) {
                BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
                Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(CACTIVI);
                logger.debug(map);
                tratarRETURNyMENSAJES(request, map);
            }
            //-- Fin RKV - Bug 9916
            
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_guardarDatos", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            //Gesti�n de campos y dependencias
            this.configForm(request, whoami(this));
            this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
        }
    }

    /**
     * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla
     * a ejecutar.
     * @param request
     * @param thisAction
     */
    public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr004Service m_siguiente");
        m_guardarEstadoPantalla(request, thisAction);
        m_validar(request, thisAction, Constantes.SIGUIENTE);
    }

    /**
     * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior
     * a ejecutar.
     * @param request
     * @param thisAction
     */
    public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr004Service m_anterior");
        m_guardarEstadoPantalla(request, thisAction);
        m_validar(request, thisAction, Constantes.ANTERIOR);
    }

    /**
     * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la 
     * siguiente p�gina donde vamos a navegar.
     * @param request
     * @param thisAction
     * @param direccion
     */
    private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
        logger.debug("Axisctr004Service m_validar");
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        HashMap map=null;
        try {
            /* Validaci�n */
            String CMODO=(String)AbstractDispatchAction.topPila(request, "CMODO");
            if (isEmpty(CMODO))
                CMODO="EST";
            //Map map = new PAC_IAX_VALIDACIONES(usuario.getConnection()).ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGESTION(CMODO);
            //logger.debug (map);
            //BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

            map=new PAC_IAX_VALIDACIONES(usuario.getConnection()).ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
            logger.debug(map);

            BigDecimal codiRetorn2=(BigDecimal)tratarRETURNyMENSAJES(request, map);

            if (codiRetorn2.intValue()==0) {
                // vaya al siguiente...
                if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
                    // No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la AXCTR027
                    request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.findForward(request, direccion, whoami(this), null));
            }
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_validar", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

            //Gesti�n de campos y dependencias
            this.configForm(request, whoami(this));
            this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
        }
    }

    /**
     * Carga las cuentas del tomador y las devuelve en modo Ajax.
     * @param request
     */
    public void m_ajax_cargar_cuentas_tomador(HttpServletRequest request) {
        logger.debug("Axisctr004Service m_ajax_cargar_cuentas_tomador");
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax=new AjaxContainerService();
        try {
            Map map=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
            logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()"+map);
            if (!isEmpty(map)) {
                List cuentasTomador=(List)ajax.rellenarPlAContenedorAjax(map);
                ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
            }
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_cargar_cuentas_tomador", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        }
        finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    public void m_ajax_cargar_cuentas_tomadorAXIS(HttpServletRequest request) {
        logger.debug("Axisctr004Service m_ajax_cargar_cuentas_tomador");
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax=new AjaxContainerService();
        try {

            BigDecimal SSEGURO=(BigDecimal)AbstractDispatchAction.topPila(request, "SSEGURO");
            Map map1=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__TRASPASO_CCC(SSEGURO, null, SPERSON);
            logger.debug("ejecutaPAC_IAX_PRODUCCION__traspasoccc()"+map1);
            Map map=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC();
            logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADORCCC()"+map);
            if (!isEmpty(map)) {
                List cuentasTomador=(List)ajax.rellenarPlAContenedorAjax(map);
                ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
            }
            request.getSession().removeAttribute("cargaHost");
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_cargar_cuentas_tomador", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        }
        finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }


    /**
     * Carga las cuentas del tomador y las devuelve en modo Ajax.
     * @param request
     */
    public void m_ajax_cargar_cuentas_HOST(HttpServletRequest request) {
        logger.debug("Axisctr004Service m_ajax_cargar_cuentas_HOST");
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax=new AjaxContainerService();
        try {

            SPERSON=getCampoNumerico(request, "SPERSON");
            SNIP=getCampoTextual(request, "SNIP");


            Map map=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(SPERSON, SNIP, "EST");
            logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST()"+map);
            if (!isEmpty(map)) {
                List cuentasTomador=(List)ajax.rellenarPlAContenedorAjax(map);

                request.getSession().setAttribute("cargaHost", "0");
                ajax.guardarContenidoFinalAContenedorAjax(cuentasTomador);
            }

            System.out.println(" cargaHost ::"+request.getSession().getAttribute("cargaHost"));
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_cargar_cuentas_HOST", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        }
        finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }


    /**
     * Actualiza el campo de vencimiento y las devuelve en modo Ajax.
     * @param request
     */
    public void m_ajax_actualiza_fvencim(HttpServletRequest request) {
        logger.debug("Axisctr004Service m_ajax_actualiza_fvencim");
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax=new AjaxContainerService();
        try {

            BigDecimal NDURACI=new BigDecimal(String.valueOf(request.getParameter("NDURACI")));
            Date FEFECTO=AxisBaseService.stringToSqlDate(getCampoTextual(request, "FEFECTO"), "dd/MM/yyyy");
            Map map=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI(FEFECTO, NDURACI);
            logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI()"+map);
            if (!isEmpty(map)) {
                ajax.guardarContenidoFinalAContenedorAjax(map);
            }
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_actualiza_fvencim", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        }
        finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    //BUG:8613

    /**
     * Realiza una b�squeda de productos por Ajax.
     * @see Axisctr004Service#buscaProductos
     * @param request El HttpServletRequest que contiene la petici�n del cliente web.
     */
    public void m_ajax_actualizar_agente(HttpServletRequest request) {
        logger.debug("Axisctr004Service m_ajax_busqueda_productos");
        AjaxContainerService ajax=new AjaxContainerService();

        try {
            String CAGENTE=getCampoTextual(request, "CAGENTE");
            Map agents=this.ActualizaAgente(request, CAGENTE);

            ajax.guardarContenidoFinalAContenedorAjax(agents);
            ajax.rellenarPlAContenedorAjax(agents);
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_actualizar_agente", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        }
        finally {

            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
    }

    /**
     * Carga el agente inicial de la pantalla.
     * @param request El HttpServletRequest que contiene la petici�n del cliente web. 
     */
    private void cargaAgente(HttpServletRequest request) throws Exception {
        
            // Cargar Agente de la BD
            UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);

            //--BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
            // Es canvia la forma de recuperar l'agent per la p�lissa 
            //Map mapCX = new PAC_IAX_COMMON(usuario.getConnection()).ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

            Map mapCX=new PAC_IAX_PRODUCCION(usuario.getConnection()).ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
            logger.debug(mapCX);
            Map datosPoliza=(Map)tratarRETURNyMENSAJES(request, mapCX);
            //--FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent

             //--BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
            //HashMap map=new PAC_IAX_LISTVALORES(usuario.getConnection()).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, String.valueOf(mapCX.get("RETURN")), new BigDecimal(1));
             HashMap map=new PAC_IAX_LISTVALORES(usuario.getConnection()).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, String.valueOf(datosPoliza.get("CAGENTE")), new BigDecimal(1));
            //--FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
            
            List listaAgentes=(List)tratarRETURNyMENSAJES(request, map);

            //--BUG 8613 - 160309 - ACC - Suplement Canvi d'agent
            //Map agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
            Map agente=getObjetoDeLista(listaAgentes, String.valueOf(datosPoliza.get("CAGENTE")), "CODI");
            //--FI BUG 8613 - 160309 - ACC - Suplement Canvi d'agent

            request.getSession().setAttribute("axisctr004_agente", agente);

        
    }

    /**
     * Carga el agente inicial de la pantalla.
     * @param request El HttpServletRequest que contiene la petici�n del cliente web. 
     */
    private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
        Map mapAgentes=new HashMap();

        // Cargar Agente de la BD
        UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        mapAgentes=new PAC_IAX_LISTVALORES(usuario.getConnection()).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE, new BigDecimal(1));
        List agentes=new ArrayList();

        Map agente=new HashMap();
        if (!isEmpty(tratarRETURNyMENSAJES(request, mapAgentes))) {
            agentes=(List)mapAgentes.get("RETURN");
            if (agente.size()>0)
                agente=(Map)agentes.get(0);
            //agente = getObjetoDeLista(agentes, String.valueOf(mapAgentes.get("RETURN")), "CODI");
        }
        request.getSession().setAttribute("axisctr004_agente", agente);

        return mapAgentes;


    }


}
