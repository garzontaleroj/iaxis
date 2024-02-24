//Revision:# srITOJByiEiVA39HFYFMtA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_UNDERWRITING;
import axis.jdbc.PAC_IAX_UTILES;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr100Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisctr207Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
    List listaPartidasG;
    private boolean paso2 = false;

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las preguntas
	 * del riesgo seleccionado.
     * 
     * @param request
     * @param usuario
     * @param NRIESGO
     * @return
     * @throws Exception
     */
	private List dbLeePreguntasRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(NRIESGO);
		logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las garantias
	 * del riesgo seleccionado.
	 * 
     * @param request
     * @param usuario
     * @param NRIESGO
     * @return
     * @throws Exception
     */
	private List dbLeeGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CPARTIDA) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS(NRIESGO, CPARTIDA);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS return: " + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar el numero de
	 * lineas que deben mostrarse en la tabla garantias
	 * 
     * @param request
     * @param usuario
     * @param SPRODUC
     * @return
     * @throws Exception
     */
	private BigDecimal obtiene_filas(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("NUM_GARAN_PANT", SPRODUC);
		logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
    }

    /**
     * Garantias determinadas por el producto seleccionado
	 * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private List dbGetGarantias(BigDecimal pNRIESGO, HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(pNRIESGO);
		logger.debug("Map de garantias riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para generar los totales de
	 * las primas/garantias del riesgo seleccionado. �sto se calcula cuando
	 * tarificamos todos los capitales de cada una de las garantias.
     * 
     * @param request
     * @param usuario
     * @param NRIESGO
     * @return
     * @throws Exception
     */
	private Map dbPrimasGarantTot(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(NRIESGO);
		logger.debug("Map de Primas/Garantias/tota---------------------------------------->" + m);
		return (Map) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos del
	 * riesgo seleccionado.
     * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private List dbGetDatosRiesgos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS();
		logger.debug("Map de Datos/Riesgos---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * etm ini****************21657************
     */
    public void m_actualizaDecuentosRecargosRiesgoGaran(HttpServletRequest request) {
        logger.debug("Axisctr207Service m_actualizaPdtocomRiesgoGaran");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

        try {
            // TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
            }
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal PDTOCOM = getCampoNumerico(request, "PDTOCOM");
			BigDecimal PRECARG = getCampoNumerico(request, "PRECARG");
			BigDecimal PDTOTEC = getCampoNumerico(request, "PDTOTEC");
			BigDecimal PRECCOM = getCampoNumerico(request, "PRECCOM");

			logger.debug("PDTOCOM ESTA ?? vacio**********axisctr207ser************************************************"
					+ PDTOCOM);

			Map m = null;
			/*
			 * INI BUG 30173#c166491 --> SE UNIFICAN LAS 4 FUNCIONES INFERIORES EN UNA SOLA
			 * PARA EVITAR TANTAS LLAMADAS. if (!isEmpty(PDTOCOM)) { logger.
			 * debug("PDTOCOM  vacio**********axisctr207ser************************************************"
			 * +PDTOCOM); m=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOCOM_RIESGOGARAN(SSEGURO,
			 * NRIESGO, PDTOCOM, null);
			 * ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			 * }
			 * 
			 * if (!isEmpty(PRECARG)) { m=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_SET_PRECARG_RIESGOGARAN(SSEGURO,
			 * NRIESGO, PRECARG, null);
			 * ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			 * }
			 * 
			 * if (!isEmpty(PDTOTEC)) { m=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOTEC_RIESGOGARAN(SSEGURO,
			 * NRIESGO, PDTOTEC, null);
			 * ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			 * }
			 * 
			 * if (!isEmpty(PRECCOM)) { m=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_SET_PRECCOM_RIESGOGARAN(SSEGURO,
			 * NRIESGO, PRECCOM, null);
			 * ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			 * }
			 */
			if (!isEmpty(PDTOCOM) || !isEmpty(PRECARG) || !isEmpty(PDTOTEC) || !isEmpty(PRECCOM)) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_PORCRECARG_RIESGOGAR(SSEGURO, NRIESGO, PDTOCOM, PRECARG,
								PDTOTEC, PRECCOM, null);
				logger.debug("m_actualizaDecuentosRecargosRiesgoGaran,  m : " + m);
                ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
            }
			// FIN BUG 30173#c166491

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizaPdtocomRiesgoGaran", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
          //  this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista
	 * correspondiente a la forma de pago.
     * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private List dbFormaPago(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista de
	 * revalorizaciones del riesgo seleccionado.
     * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private List dbGetTipReval(HttpServletRequest request, BigDecimal SPRODUC, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(SPRODUC);
		logger.debug("Map de Combo Tipo revalorizacion de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar el tipo de
	 * revalorizaci�n cambiado.
     * 
     * @param usuario
     * @param NRIESGO
     * @param CREVALI
     * @param PREVALI
     * @param IREVALI
     * @return
     * @throws Exception
     */
	private Map dbSetRevalRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CREVALI, BigDecimal PREVALI, BigDecimal IREVALI) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(NRIESGO, CREVALI, PREVALI, IREVALI);
		logger.debug("HAN CAMBIADO LAS GARANTIAS?(0->ok/1->error)---------------------------------------->" + m);
        return m;
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar las
	 * garantias del riesgo seleccionado.
     * 
     * @param request
     * @param usuario
     * @param NRIESGO
     * @param CGARANT
     * @param SELGAR
     * @param ICAPITAL
     * @param CREVALI
     * @param PREVALI
     * @param IREVALI
     * @return
     * @throws Exception
     */
	private BigDecimal dbGrabarGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CGARANT, BigDecimal SELGAR, BigDecimal ICAPITAL, BigDecimal CREVALI, BigDecimal PREVALI,
			BigDecimal IREVALI) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
						IREVALI);
		logger.debug("GARANTIA SELECCIONADA?(0->ok/1->error)---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
    }

	private Map dbGrabarGarantiasMap(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CGARANT, BigDecimal SELGAR, BigDecimal ICAPITAL, BigDecimal CREVALI, BigDecimal PREVALI,
			BigDecimal IREVALI) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
						IREVALI);
		logger.debug("GARANTIA SELECCIONADA?(0->ok/1->error)---------------------------------------->" + m);
        return m;
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar las
	 * preguntas del riesgo seleccionado.
     * 
     * @param usuario
     * @param NRIESGO
     * @param CPREGUN
     * @param CRESPUE
     * @return
     * @throws Exception
     */
	private Map dbGrabarPreguntasRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CPREGUN, BigDecimal CRESPUE, String TRESPUE) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(NRIESGO, CPREGUN, CRESPUE, TRESPUE);
		logger.debug("PREGUNTAS RIESGO GRABADAS?(0->ok/1->error)---------------------------------------->" + m);
        return m;
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para validar las
	 * preguntas/respuestas realizadas.
     * 
     * @param usuario
     * @return
     * @throws Exception
     */
	private Map dbValidaDPregGarant(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(NRIESGO);
		logger.debug("VALIDACIONES PREGUNTAS GARANTIAS?(0->ok/1->error)---------------------------------------->" + m);

        return m;
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para tarificar el riesgo.
	 * Cuando a�adimos capitales a las garantias, tenemos la opci�n de tarificar
	 * para actualizar todo el riesgo (sus datos)
     * 
     * @param usuario
     * @param NRIESGO
     * @return
     * @throws Exception
     */
    private Map dbTarificar(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map n = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR(NRIESGO);
		logger.debug("TARIFICACION CORRECTA?(0->ok/1->error)---------------------------------------->" + n);
        
        return n;
    }

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las primas de
	 * las garantias seleccionadas.
     * 
     * @param usuario
     * @param NRIESGO
     * @return
     * @throws Exception
     */
	private Map dbGetPrimasGarantTot(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(NRIESGO);
		logger.debug("PRIMAS DE GARANTIA---------------------------------------->" + m);

        return m;
    }

    /**
     * M�todo que carga el tipo de forma de pago seleccionado por el usuario
	 * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private BigDecimal dbGetGarForPag(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
        logger.debug(map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
    }

    /**
     * M�todo que modifica el tipo de forma de pago modificado por el usuario
	 * 
     * @param usuario
     * @param CFORPAG
     * @return
     * @throws Exception
     */
    private Map dbSetGarForPag(HttpServletRequest request, UsuarioBean usuario, BigDecimal CFORPAG) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_GARFORPAG(CFORPAG);
        logger.debug(map);
        return map;
    }

    /**
     * M�todo que se llama la primera vez que entramos en la p�gina
	 * 
     * @param request
     * @param usuario
     * @return
     * @throws Exception
     */
    private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
    }

    /**
     * Lee el numero de la p�liza.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
     * @return
     * @throws Exception
     */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
        logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
        return mapPoliza;
    }

    /*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
    /*********************************************************************************************************************/

    /**
     * M�todo que se llama al inicio de �ste flujo.
     * 
     * @param request
     * @param thisAction
     */
    public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_init");
        try {

            m_form(request, thisAction);
           
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_init", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }

    /**
	 * M�todo que se llama al inicio de este flujo. En �l hacemos la carga inicial
	 * del riesgo con sus preguntas y garantias.
     * 
     * @param request
     * @param thisAction
     */
    public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_form");
        
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
        try {
            Map mapGenPoliza = new HashMap();
            BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
            formdata.put("SUPLEMENTO",  pPCMOTMOV);
            
			// Antes de grabar en bd comprovamos si ha habido un cambio de plan. Bug
			// 27505/148732 - AMC
			Map cambio = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_HAYCAMBIOPLAN();
			tratarRETURNyMENSAJES(request, cambio);
            
			String operacion = (String) this.getCampoTextual(request, ("operation"));
            
            mapGenPoliza = this.dbLeePoliza(request);                
            formdata.put("NPOLIZA",  mapGenPoliza.get("NPOLIZA"));
			formdata.put("FEFEPLAZO",  mapGenPoliza.get("FEFEPLAZO"));
			formdata.put("FVENCIM",  mapGenPoliza.get("FVENCIM"));
			formdata.put("CACTIVI",  mapGenPoliza.get("CACTIVI"));                  // IAXIS-4205 CJMR
            
            if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
            formdata.put("PTMOTMOV",  map2.get("PTMOTMOV"));
            }
            
			if (isEmpty(request.getParameterValues("paginar")) && (isEmpty(operacion) || !operacion.equals("tarifar")))
                dbGrabarObjetoDb(request, usuario);
                
			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
            
            request.getSession().setAttribute("MODO", VMODO);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			AbstractDispatchAction.topPila(request, "NRIESGO", NRIESGO);

            request.getSession().setAttribute("SPRODUC", SPRODUC);
            request.getSession().setAttribute("SSEGURO", SSEGURO);
            request.getSession().setAttribute("NRIESGO", NRIESGO.toString());

			BigDecimal num_garantias = obtiene_filas(request, usuario, SPRODUC);
            request.getSession().setAttribute("num_garantias", num_garantias);
            
			// SPV IAXIS-4201
			// Se desactiva el codigo para que se desplieguen los datos en pantalla del
			// importe
			/*
			 * Map mpRO=new
			 * PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("VALOR_DEF_DEDUC",
			 * SPRODUC); logger.
			 * debug("Map resultado get VALOR DEFECTO---------------------------------------->"
			 * +mpRO); BigDecimal IMPMIN = (BigDecimal)tratarRETURNyMENSAJES(request, mpRO);
			 * formdata.put("IMPMIN", IMPMIN);
			 */
			// SPV IAXIS-4201

			// etm ini 21657
           // Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				if (mtuyo.get("PDTOCOM") != null) {
                    formdata.put("PDTOCOM", mtuyo.get("PDTOCOM"));
                }

				if (mtuyo.get("PRECARG") != null) {
                    formdata.put("PRECARG", mtuyo.get("PRECARG"));
                }

				if (mtuyo.get("PDTOTEC") != null) {
                    formdata.put("PDTOTEC", mtuyo.get("PDTOTEC"));
                }

				if (mtuyo.get("PRECCOM") != null) {
                    formdata.put("PRECCOM", mtuyo.get("PRECCOM"));
                }
            }
			// etm ini 21657
            
             // Recuperaci�n riesgo
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
             logger.debug(map);
             map = (Map) tratarRETURNyMENSAJES(request, map);
             formdata.put("OB_IAX_RIESGOS", map);
             //

			// Bug 27955/0154819 (JSV) - 04/10/2013
             if (isEmpty(request.getParameterValues("paginar"))) {
                initPreguntas(request, usuario);
				initGarantias(request, usuario, "");
				// initPreguntas2(request,usuario);
	            initParametrosGarantias(request, usuario);
	            m_validar_reval(request, thisAction);
            }
			if ((isEmpty(operacion) || !operacion.equals("tarifar"))) {
				// etm ini 21657
				mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
                    request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
                    request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
                    request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
                    request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));
                }
				// etm ini 21657
            }

			// AMC-Bug 9678
			if (isEmpty(request.getParameterValues("paginar"))) {
				List modalidades = this.dbModalidades(request, usuario);
            if (!isEmpty(modalidades))
                request.getSession().setAttribute("axisctr_CMODALI", modalidades);
                
             }

            /* Inicializar los par�metros revalorizacion */

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA("EST", SSEGURO);
            logger.debug(m);
			// Map revalorizacion = (Map)tratarRETURNyMENSAJES(request,m);
			BigDecimal PREVALI = (BigDecimal) m.get("PREVALI");
			BigDecimal CREVALI = (BigDecimal) m.get("PCREVALI");
			if (CREVALI != null) {
                request.getSession().setAttribute("axisctr_CREVALI", CREVALI);
            }
			if (PREVALI != null) {
                request.getSession().setAttribute("axisctr_PREVALI", PREVALI);
            }
            /* Fin inicializar parametros revalorizacion */

			// Mira si el producto tiene cuestioranio de salud
			BigDecimal ccuesti = this.dbTieneCuestionario(request, usuario, SPRODUC);
			logger.debug("ccuesti:" + ccuesti);
			if (ccuesti != null)
                request.getSession().setAttribute("PCCUESTI", new Integer(ccuesti.intValue()));
			if ((isEmpty(operacion) || !operacion.equals("tarifar"))) {
				PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);
    
                logger.debug(mmoneda);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                    request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                    request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                    request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));
    
                }
            }
            
			Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
            logger.debug(franq);
			formdata.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                //     this.eliminarGranqTipo4(request,franquicias);
                                                     
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
                 List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
                 if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
				}

				formdata.put("franq", franquicias);
				formdata.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				formdata.put("franqtecnicas", franqtecnicas);
				formdata.put("franqtecnicaslibres", franqtecnicaslibres);
				formdata.put("bonusmalus", bonusmalus);
				formdata.put("bonusmaluslibres", bonusmaluslibres);
				formdata.put("franqgartecnicaslibres", franqgartecnicaslibres);
				formdata.put("franqgarlibres", franqgarlibres);
				formdata.put("bonusmalusgarlibres", bonusmalusgarlibres);

				// CJMR
				PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(usuario.getCempres(),
						SPRODUC, new BigDecimal(1), new BigDecimal("1104"));
				List listaTipoUnidad = (List) tratarRETURNyMENSAJES(request, map1);
                 logger.debug(listaTipoUnidad);
				formdata.put("listaTipoUnidad", !isEmpty(listaTipoUnidad) ? listaTipoUnidad : new ArrayList());
				// CJMR
                 
            }
			Map hayfranqbonusmalus = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_HAY_FRANQ_BONUSMALUS();
             logger.debug(hayfranqbonusmalus);
             
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, hayfranqbonusmalus))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, hayfranqbonusmalus)).intValue() == 0) {
				formdata.put("PFRANQUICIAS", hayfranqbonusmalus.get("PFRANQUICIAS"));
				formdata.put("PBONUSMALUS", hayfranqbonusmalus.get("PBONUSMALUS"));
            }
			if ((isEmpty(operacion) || !operacion.equals("tarifar"))) {
                BigDecimal ACCION_PSU  = new BigDecimal(0);
				if (!isEmpty(AbstractDispatchAction.topPila(request, "ACCION_PSU"))) {
                     ACCION_PSU = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "ACCION_PSU")));
                }
                
				if (!isEmpty(SSEGURO) && ACCION_PSU.intValue() == 6) {// Si estamos en simulacion lanzamos la PSU
					Map col_psu = new PAC_IAX_PSU(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, NRIESGO, "EST");
					logger.debug("col_psu:" + col_psu);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
                        request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
                        request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
                        request.setAttribute("PCNIVELBPM", col_psu.get("P_CNIVELBPM"));
                        request.setAttribute("PTNIVELBPM", col_psu.get("P_TNIVELBPM"));
                        request.setAttribute("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));
						request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));
                        
						if (!isEmpty(col_psu.get("POBPSU_RETENIDAS"))) {
							HashMap mm = (HashMap) col_psu.get("POBPSU_RETENIDAS");
                        
							if (!isEmpty(mm.get("NOCONTINUA"))) {
                                request.setAttribute("PERMITE_EMITIR", mm.get("NOCONTINUA"));
                                request.setAttribute("CCRITICO", mm.get("CCRITICO"));
                            }
                        }
                    }
                }
            }
            //INI TASK 16563 MPC 14/01/2022
            m=new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection)request.getAttribute(Constantes.DB01CONN))).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MOD_CPARPRO_239", SPRODUC);
            logger.debug("Map resultado get MOD_CPARPRO_239---------------------------------------->"+m.values()+"-->"+SPRODUC);
            formdata.put("MOD_CPARPRO_239", (BigDecimal)tratarRETURNyMENSAJES(request, m, false));
            //FIN TASK 16563 MPC 14/01/2022
            m=new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection)request.getAttribute(Constantes.DB01CONN))).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PREG_COND_TOMASEG", SPRODUC);
            logger.debug("Map resultado get NUM FILAS---------------------------------------->"+m);
            formdata.put("PREG_COND_TOMASEG", (BigDecimal)tratarRETURNyMENSAJES(request, m, false));
        }
        catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_form", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }

        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));

    }
    
    private List dividirFranqPerCtipgru(List<HashMap> franquicias, int CTIPGRU) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

        for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
			BigDecimal CTIPGRUobj = (BigDecimal) grup.get("CTIPVISGRUP");
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
                franqdividides.add(OB_IAX_BF_PROACTGRUP);
                objBorrar.add(OB_IAX_BF_PROACTGRUP);
            }

        }

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
            franquicias.remove(OB_IAX_BF_PROACTGRUP);
        }

        return franqdividides;

    }
    
	private List dividirFranqLibres(List<HashMap> franquicias, List<HashMap> franquiciasgar) {
    
		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

        for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
			ArrayList lsubgrupos = (ArrayList) grup.get("LSUBGRUPOS");

			if (!isEmpty(lsubgrupos) && lsubgrupos.size() > 0) {
				HashMap mm = (HashMap) lsubgrupos.get(0);
				HashMap subgrup = (HashMap) mm.get("OB_IAX_BF_GRUPSUBGRUP");
				BigDecimal CTIPGRUPSUBGRUP = (BigDecimal) subgrup.get("CTIPGRUPSUBGRUP");
				if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 3) {
                    franqdividides.add(OB_IAX_BF_PROACTGRUP);
                    objBorrar.add(OB_IAX_BF_PROACTGRUP);
				} else {
					if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 4) {
                        objBorrar.add(OB_IAX_BF_PROACTGRUP);
                        franquiciasgar.add(OB_IAX_BF_PROACTGRUP);
                    }
                    
                }
                
            }
            
        }

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
            franquicias.remove(OB_IAX_BF_PROACTGRUP);
        }

        return franqdividides;

    }
    
    /**
	 * M�todo que se encaraga de cargar los datos de cada garantia. S�lo cargamos
	 * los datos que se piden en el displayTag asociado en el jsp.
     * 
     * @param idGarant
     * @param DESCRIPCION
     * @param ICAPITAL
     * @param IPRIANU
     * @param IPRITAR
     * @param COBLIGA
     * @param CTIPCAP
     * @param CTIPGAR
     * @return
     */
	private Map rellenaMapGarantias(BigDecimal idGarant, String DESCRIPCION, BigDecimal ICAPITAL, BigDecimal IPRIANU,
			BigDecimal IPRITAR, BigDecimal COBLIGA, BigDecimal CTIPCAP, BigDecimal CTIPGAR, BigDecimal IPRITOT,
			BigDecimal CTARMAN, BigDecimal CDETALLE, BigDecimal CMONCAP, String CMONINT, String TMONCAP,
			BigDecimal CVISIBLE, BigDecimal CGARPADRE, BigDecimal CNIVGAR, BigDecimal ICAPRECOMEND, BigDecimal IFRANQU,
			Timestamp FINIVIG, Timestamp FFINVIG, BigDecimal CCOBPRIMA, BigDecimal IPRIDEV) {
		Map m = new HashMap();
		BigDecimal id = idGarant;

        m.put("CGARANT", id);
        m.put("DESCRIPCION", DESCRIPCION);
        m.put("ICAPITAL", ICAPITAL);
        m.put("IPRITAR", IPRITAR);
        m.put("IPRIANU", IPRIANU);
        m.put("COBLIGA", COBLIGA);
        m.put("CTIPCAP", CTIPCAP);
        m.put("CTIPGAR", CTIPGAR);
        m.put("IPRITOT", IPRITOT);
        m.put("CTARMAN", CTARMAN);
        m.put("CDETALLE", CDETALLE);
        m.put("CMONCAP", CMONCAP);
        m.put("CMONCAPINT", CMONINT);
        m.put("TMONCAP", TMONCAP);
        m.put("CVISIBLE", CVISIBLE);
        m.put("CGARPADRE", CGARPADRE);
        m.put("CNIVGAR", CNIVGAR);
        m.put("ICAPRECOMEND", ICAPRECOMEND);
		m.put("IFRANQ", IFRANQU);
        m.put("FINIVIG", FINIVIG);   // BUG 41143/229973 - 17/03/2016 - JAEG
        m.put("FFINVIG", FFINVIG);   // BUG 41143/229973 - 17/03/2016 - JAEG
        m.put("CCOBPRIMA", CCOBPRIMA);   // BUG 41143/229973 - 17/03/2016 - JAEG
        m.put("IPRIDEV", IPRIDEV);   // BUG 41143/229973 - 17/03/2016 - JAEG
        return m;
    }

    /**
	 * M�todo que realiza la carga de garantias sean cuales sean los cambios
	 * producidos en el flujo.
     * 
     * @param request
     * @param usuario
     * @throws Exception
     */
    private void initGarantias(HttpServletRequest request, UsuarioBean usuario, String MODO) throws Exception {

        // TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
       
        // Recuperaci�n riesgo
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
       
        // BUG: 0027953/0151258 - JSV 21/08/2013 - INI
		Map mapmod = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
		logger.debug("------ auto recuperado:" + mapmod);
		mapmod = (Map) tratarRETURNyMENSAJES(request, mapmod);
		if (!isEmpty(mapmod.get("CMODALIDAD"))) {
			String CMODALIDAD = (String) mapmod.get("CMODALIDAD");
			formdata.put("CMODALI", CMODALIDAD);
                    
         if (isEmpty(request.getSession().getAttribute("garantias_mod"))) {
				// Llamaremos a una nueva funci�n que nos devolver� las garantias de la
				// modalidad
				Map mx = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_GET_GARANMODALIDAD(NRIESGO,
								stringToBigDecimal((String) CMODALIDAD));
				logger.debug("Guardamos modalidad ---------------------------------------->" + mx);

                    if (!isEmpty(mx.get("GARANTIAS"))) {
					logger.debug("------- Garantias recuperadas:" + mx.get("GARANTIAS"));
                        request.getSession().setAttribute("garantias_mod", mx.get("GARANTIAS"));
                    }

        }
            // BUG: 0027953/0151258 - JSV 21/08/2013 - FIN
        }
                    
		// TODO ->garantias (carga inicial segun n�mero de riego recuperado de la p�gina
		// 5). Por terminar
        // IAXIS-4205 CJMR
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(getCampoNumerico(request, "CACTIVI"));
        logger.debug(map);
        tratarRETURNyMENSAJES(request, map);
        
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		List garantiasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO, new BigDecimal(0));
		List garantiasSeleccionadasPartidas = this.dbLeeGarantias(request, usuario, NRIESGO, new BigDecimal(1));
		List garantsel = new ArrayList();

		if (garantiasSeleccionadas != null) {
			HashMap mapa_gar = (HashMap) garantiasSeleccionadas.get(0);
			if (mapa_gar != null) {
				HashMap NMOVIMI_map = (HashMap) mapa_gar.get("OB_IAX_GARANTIAS");
				if (NMOVIMI_map != null) {
					BigDecimal NMOVIMI = (BigDecimal) NMOVIMI_map.get("NMOVIMI");
                    AbstractDispatchAction.topPila(request, "NMOVIMI", NMOVIMI);
					request.getSession().setAttribute("NMOVIMI", (NMOVIMI == null) ? new BigDecimal(1) : NMOVIMI); // BUG
																													// 41143/229973
																													// -
																													// 17/03/2016
																													// -
																													// JAEG
                }
            }

        }

             if (!isEmpty(garantiasProducto)) {
			request.getSession().setAttribute("axisctr_garantias",
					((garantiasSeleccionadas == null) ? new ArrayList() : garantiasSeleccionadas));
			// Gestionem les partides
                 //   managePartidas(request);
		} else {
                 logger.error("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA");
             }
		if (!MODO.equals("SEL_GAR")) {
			String validar_tarificacion = (String) request.getSession().getAttribute("validar_tarificacion");
			if (!"TRUE".equals(validar_tarificacion == null ? "" : validar_tarificacion.toUpperCase()))
                 m_actualizaDecuentosRecargosRiesgoGaran(request);
                 dbGrabarObjetoDb(request, usuario); 
             }

		// AMC-Bug 9678
		List bb = (List) request.getSession().getAttribute("garantias_mod");
		if (request.getSession().getAttribute("garantias_mod") != null) {
			List la = new ArrayList();
			List garanModalidad = (List) request.getSession().getAttribute("garantias_mod");
			for (int a = 0; a < garanModalidad.size(); a++) { // alex
				BigDecimal CGARANT_ALEX = (BigDecimal) ((Map) ((Map) garanModalidad.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CGARANT");
				for (int b = 0; b < garantiasProducto.size(); b++) {
					BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(b))
							.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
                    if (CGARANT_PRODUCTO.equals(CGARANT_ALEX)) {
						la.add((Map) garantiasProducto.get(b));
                    }
                }
            }
			garantiasProducto = la;
        }

		Map m1 = new HashMap();
		List li = new ArrayList();
		List lipartidas = new ArrayList();
		List todos = new ArrayList();

        if (!isEmpty(garantiasProducto)) {
			for (int a = 0; a < garantiasProducto.size(); a++) {
				boolean coincide = false;
				BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a))
						.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
				String DESCRIPCION = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("DESCRIPCION");
				BigDecimal CTIPCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPCAP");
				BigDecimal CTIPGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPGAR");
				List LISTACAPITALES = (List) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("LISTACAPITALES");
				BigDecimal CMONCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CMONCAP");
				String CMONINT = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CMONCAPINT");
				String TMONCAP = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("TMONCAP");
				BigDecimal CVISIBLE = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CVISIBLE");
				BigDecimal CGARPADRE = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CGARPADRE");
				BigDecimal CNIVGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CNIVGAR");
				BigDecimal CPARTIDA = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CPARTIDA");
				CPARTIDA = isEmpty(CPARTIDA) ? new BigDecimal(0) : CPARTIDA;

				if (CPARTIDA.intValue() != 1)
					garantsel = garantiasSeleccionadas;
                else
					garantsel = garantiasSeleccionadasPartidas;

                if (!isEmpty(garantsel)) {
					for (int i = 0; i < garantsel.size(); i++) {
						BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantsel.get(i))
								.get("OB_IAX_GARANTIAS")).get("CGARANT");
						Map seleccionado = getObjetoDeLista(garantsel, CGARANT_SELECT.toString(), "CGARANT",
								"OB_IAX_GARANTIAS");

						BigDecimal IPRIANU = null;
						BigDecimal IPRITAR = null;
						BigDecimal IPRITOT = null;
						BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
								? (BigDecimal) seleccionado.get("ICAPITAL")
								: null);
						BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
								? (BigDecimal) seleccionado.get("COBLIGA")
								: null);
						BigDecimal CTARMAN = ((!isEmpty(seleccionado.get("CTARMAN")))
								? (BigDecimal) seleccionado.get("CTARMAN")
								: null);
						BigDecimal CDETALLE = ((!isEmpty(seleccionado.get("CDETALLE")))
								? (BigDecimal) seleccionado.get("CDETALLE")
								: null);
						BigDecimal ICAPRECOMEND = ((!isEmpty(seleccionado.get("ICAPRECOMEND")))
								? (BigDecimal) seleccionado.get("ICAPRECOMEND")
								: null);
						BigDecimal IFRANQU = ((!isEmpty(seleccionado.get("IFRANQU")))
								? (BigDecimal) seleccionado.get("IFRANQU")
								: null);
                        
                        // BUG 41143/229973 - 17/03/2016 - JAEG
						Timestamp FINIVIG = ((!isEmpty(seleccionado.get("FINIVIG")))
								? (Timestamp) seleccionado.get("FINIVIG")
								: null);
						Timestamp FFINVIG = ((!isEmpty(seleccionado.get("FFINVIG")))
								? (Timestamp) seleccionado.get("FFINVIG")
								: null);
						BigDecimal CCOBPRIMA = ((!isEmpty(seleccionado.get("CCOBPRIMA")))
								? (BigDecimal) seleccionado.get("CCOBPRIMA")
								: null);
						BigDecimal IPRIDEV = ((!isEmpty(seleccionado.get("IPRIDEV")))
								? (BigDecimal) seleccionado.get("IPRIDEV")
								: null);
                        // BUG 41143/229973 - 17/03/2016 - JAEG
                        
						// logger.debug("CTARMAN-->"+ seleccionado);

						Map PRIMAS = (Map) seleccionado.get("PRIMAS");
                        if (!isEmpty(PRIMAS)) {
							IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU")
									: IPRIANU);
							IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR")
									: IPRITAR);
							IPRITOT = ((!isEmpty(PRIMAS.get("IPRITOT"))) ? (BigDecimal) PRIMAS.get("IPRITOT")
									: IPRITOT);
                        }

                        if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
							coincide = true;
							m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
									ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, IPRITOT, CTARMAN, CDETALLE,
									CMONCAP, CMONINT, TMONCAP, CVISIBLE, CGARPADRE, CNIVGAR, ICAPRECOMEND, IFRANQU,
									FINIVIG, FFINVIG, CCOBPRIMA, IPRIDEV); // BUG 41143/229973 - 17/03/2016 - JAEG

                            // SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital   
                            if (new BigDecimal(7).equals(CTIPCAP)) {

								BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
								Map mm = new PAC_IAX_OBTENERDATOS(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_OBTENERDATOS__F_LEECAPITAL(SSEGURO, NRIESGO, CGARANT_SELECT,
												new String("REAL"));
								BigDecimal icapital = (BigDecimal) tratarRETURNyMENSAJES(request, mm);

								List li2 = new ArrayList();
								// bug 18342 - AMC

                                if (!isEmpty(icapital)) {
									HashMap OB_IAXPAR_GARANPROCAP = new HashMap();
									HashMap capital = new HashMap();

									capital.put("NORDEN", LISTACAPITALES.size() + 1);
                                    capital.put("ICAPITAL", icapital);
                                    capital.put("CDEFECTO", 0);
                                    OB_IAXPAR_GARANPROCAP.put("OB_IAXPAR_GARANPROCAP", capital);

                                    int cont;
									HashMap m = new HashMap();
									HashMap m2 = new HashMap();
									boolean encontrado = false;

									for (cont = 0; cont < LISTACAPITALES.size(); cont++) {
										m = (HashMap) LISTACAPITALES.get(cont);

										if (cont + 1 < LISTACAPITALES.size()) {
											m2 = (HashMap) LISTACAPITALES.get(cont + 1);
											HashMap vv1 = (HashMap) m.get("OB_IAXPAR_GARANPROCAP");
											HashMap vv2 = (HashMap) m2.get("OB_IAXPAR_GARANPROCAP");
											float v1 = ((BigDecimal) vv1.get("ICAPITAL")).floatValue();
											float v2 = ((BigDecimal) vv2.get("ICAPITAL")).floatValue();
											float cap = icapital.floatValue();

											if (cap < v1 && !encontrado) {
                                                li2.add(OB_IAXPAR_GARANPROCAP);
                                                li2.add(m);
												encontrado = true;
											} else if (v1 < cap && cap < v2) {
                                                li2.add(m);
                                                li2.add(OB_IAXPAR_GARANPROCAP);
												encontrado = true;
											} else {
												if (v1 == cap)
													encontrado = true;

                                                li2.add(m);
                                            }
										} else {
											HashMap vv1 = (HashMap) m.get("OB_IAXPAR_GARANPROCAP");
											float v1 = ((BigDecimal) vv1.get("ICAPITAL")).floatValue();
											float cap = icapital.floatValue();
											if (v1 < cap && !encontrado) {
                                                li2.add(m);
                                                li2.add(OB_IAXPAR_GARANPROCAP);
											} else if (cap < v1 && !encontrado) {
                                                li2.add(OB_IAXPAR_GARANPROCAP);
                                                li2.add(m);
											} else
                                                li2.add(m);
                                        }
                                    }
                                }

                                if (!isEmpty(icapital)) {
                                    // Ponemos todos los elementos de la lista a NORDEN = 0                                                
									for (int z = 0; z < li2.size(); z++) {
										HashMap po1 = (HashMap) li2.get(z);
										HashMap po2 = (HashMap) po1.get("OB_IAXPAR_GARANPROCAP");
										if (((BigDecimal) po2.get("ICAPITAL")).floatValue() == icapital.floatValue()) {
                                            po2.put("CDEFECTO", 1);
										} else {
                                            po2.put("CDEFECTO", 0);
                                        }

                                        po1.put("OB_IAXPAR_GARANPROCAP", po2);
                                        li2.set(z, po1);
                                    }

                                    m1.put("LISTACAPITALES", li2);
								} else {
                                    m1.put("LISTACAPITALES", LISTACAPITALES);
                                }
                            }
                        }
                    }
                }

                if (!coincide) {
					m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null); // BUG 41143/229973 - 17/03/2016 - JAEG
                    // m1.put("selectedGarantia", "0");
                }

				Map m2 = new HashMap();
                m2.put("OB_IAX_GARANTIAS", m1);

                if (!isEmpty(m1.get("CTIPGAR"))) {
					int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

					if (!isEmpty(ctip) && ctip != 8) {
						if (CPARTIDA.intValue() != 1)
                            li.add(m2);
                        else
                            lipartidas.add(m2);
                    }
				} else {
                    li.add(m2);
                }
            }

            todos.addAll(lipartidas);
            todos.addAll(li);
			request.getSession().setAttribute("axisctr_garantias_ini", ((todos == null) ? new ArrayList() : todos));

			li = reestructurarGarantias(request, li);

            if (!isEmpty(lipartidas)) {
                formdata.put("num_partidas", lipartidas.size());
                request.getSession().setAttribute("num_partidas", lipartidas.size());
				lipartidas = reestructurarGarantias(request, lipartidas);
				request.getSession().setAttribute("axisctr_partidas",
						((lipartidas == null) ? new ArrayList() : lipartidas));
            }

			request.getSession().setAttribute("axisctr_garantias", ((li == null) ? new ArrayList() : li));
		} else {
            logger.error("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA");
        }

		// request.getSession().setAttribute("axisctr_garantias", ((garantias == null)?
		// new ArrayList():garantias));
		request.getSession().setAttribute("axisctr_garantias_producto",
				((garantiasProducto == null) ? new ArrayList() : garantiasProducto));
		request.getSession().setAttribute("axisctr_garantias_seleccionadas",
				((garantsel == null) ? new ArrayList() : garantsel));
		
		BigDecimal SSEGUROC = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
        
		Map map_TIPIVA = new PAC_IAX_UTILES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_UTILES__F_GET_TIPIVA(SSEGUROC, NRIESGO);
        
        BigDecimal iva = new BigDecimal(map_TIPIVA.get("VTIPIVA").toString());
        
        request.getSession().setAttribute("VTIPIVA", iva);
		
		// IAXIS-16335 BJHB 27/10/2021 INICIO
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		Map varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ISPROPERTY", SPRODUC);
		BigDecimal valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);
		request.getSession().setAttribute("ISPROPERTY", valorParamtero);
		// IAXIS-16335 BJHB 27/10/2021 FIN
		
		// IAXIS-16493 BJHB 1/12/2021 INICIO
		varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ISCA", SPRODUC);
		valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);
		request.getSession().setAttribute("ISCA", valorParamtero);
		// IAXIS-16493 BJHB 1/12/2021 FIN

		Map primasTotales = new HashMap();
		if (!MODO.equals("SEL_GAR")) {
			primasTotales = this.dbPrimasGarantTot(request, usuario, NRIESGO);
			List axisctr_primasTotales = new ArrayList();
        if (!isEmpty(primasTotales))
            axisctr_primasTotales.add(primasTotales);
        request.getSession().setAttribute("axisctr_primasTotales", axisctr_primasTotales);
        }
    }

    public ArrayList separarPartidas(HttpServletRequest request, List<HashMap> li) {
		ArrayList resultat = new ArrayList();
        try {
			boolean trobat = false;
			listaPartidasG = ((ArrayList) request.getSession().getAttribute("axisctr_partidas") == null) ? null
					: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
			// recorrer li y comprarar con el objeto de partidas. eliminar del li las que
			// est�n en partidas
			for (int a = 0; a < li.size(); a++) {
				BigDecimal CGARANT_LI = (BigDecimal) ((Map) ((Map) li.get(a)).get("OB_IAX_GARANTIAS")).get("CGARANT");
				trobat = false;
				for (int b = 0; b < listaPartidasG.size() && trobat == false; b++) {
					BigDecimal CGARANT_PARTIDAS = (BigDecimal) ((Map) ((Map) listaPartidasG.get(b))
							.get("OB_IAX_GARANTIAS")).get("CGARANT");
                    if (CGARANT_PARTIDAS.equals(CGARANT_LI)) {
						trobat = true;
                    }

                }
                if (!trobat)
                    resultat.add(li.get(a));
            }
		} catch (Exception e) {
            e.printStackTrace();
        }
        return resultat;

    }

    public static ArrayList reestructurarGarantias(HttpServletRequest request, List<HashMap> li) {
		boolean situat = false;

		ArrayList resultat = new ArrayList();
        try {

			for (int i = 0; i < li.size(); i++) {
				HashMap garantia = (HashMap) li.get(i);
				HashMap gar = (HashMap) garantia.get("OB_IAX_GARANTIAS");

				BigDecimal CGARPADRE = isEmpty(gar.get("CGARPADRE")) ? new BigDecimal(0)
						: new BigDecimal(String.valueOf(gar.get("CGARPADRE")));
				BigDecimal CVISIBLE = isEmpty(gar.get("CVISIBLE")) ? new BigDecimal(1)
						: new BigDecimal(String.valueOf(gar.get("CVISIBLE")));
				BigDecimal CGARANT = new BigDecimal(String.valueOf(gar.get("CGARANT")));
				if (CGARPADRE.intValue() == 0 && CVISIBLE.intValue() == 1) {
					// resultat.add((HashMap)li.get(i));
                    resultat.add(garantia);
                    mirarquipenja(CGARANT.intValue(), li, resultat, gar);
                }
            }

		} catch (Exception e) {
            e.printStackTrace();
        }
        return resultat;

    }

    private static void mirarquipenja(int cgarant, List li, ArrayList resultat, HashMap garPadre) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");

			BigDecimal CGARPADRE = isEmpty(garh.get("CGARPADRE")) ? new BigDecimal(0)
					: new BigDecimal(String.valueOf(garh.get("CGARPADRE")));
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));
			BigDecimal CVISIBLE = isEmpty(garh.get("CVISIBLE")) ? new BigDecimal(1)
					: new BigDecimal(String.valueOf(garh.get("CVISIBLE")));

			if (CGARPADRE.intValue() == cgarant && CVISIBLE.intValue() == 1) {

                if (isEmpty(garPadre.get("T_IAX_HIJOS"))) {
					ArrayList hijos = new ArrayList();
                    hijos.add(garantia);
                    garPadre.put("T_IAX_HIJOS", hijos);
				} else {
					ArrayList hhh = (ArrayList) garPadre.get("T_IAX_HIJOS");
                    if (!existe(hhh, CGARANT))
                        hhh.add(garantia);
                }

				// resultat.add(garantia);
                mirarquipenja(CGARANT.intValue(), li, resultat, garh);
            }

        }
    }

    private static boolean existe(ArrayList li, BigDecimal pCGARANT) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));

			if (CGARANT.intValue() == pCGARANT.intValue())
                return true;
        }

        return false;

    }

    /**
	 * M�todo que realiza la carga de preguntas/respuestas sean cuales sean los
	 * cambios producidos en el flujo.
     * 
     * @param request
     * @param usuario
     * @throws Exception
     */
    private void initPreguntas(HttpServletRequest request, UsuarioBean usuario) throws Exception {
        /* Init preguntas riesgo */
        // TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		// bug 9195 ACC 220209
        //        if(request.getSession().getAttribute("NRIESGO")!=null){
		// NRIESGO =
		// stringToBigDecimal((String)request.getSession().getAttribute("NRIESGO"));
        //        }

		List preguntas = this.dbGetDatosRiesgos(request, usuario); // PAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS()
		List respuestas = this.dbLeePreguntasRiesgo(request, usuario, NRIESGO); // PAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO()

        // Mezclar las respuestas con las preguntas iniciales
        inicializarPreguntas(preguntas, respuestas);

		logger.debug("Preguntas/Respuestas despu�s del merge -> " + preguntas);
		List pregQuestSalut = null;
		List pregDespeses = null;
		List pregGastosEndosos = null; // IAXIS-3980 01/08/2019
        if (!isEmpty(preguntas)) {
            this.getPreguntasTablaLlena(preguntas, request);
			pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
			pregDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
			pregGastosEndosos = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_GASTOS_ENDOSOS); // IAXIS-3980
																										// 01/08/2019
        }

		// Guardar lista de preguntas para mostrarla en la pantalla mediante un
		// DisplayTag
        // es guarden els diferents grups de preguntes 
		request.getSession().setAttribute("axisctr_pregQuestSalut",
				((pregQuestSalut == null) ? new ArrayList() : pregQuestSalut));
		request.getSession().setAttribute("axisctr_pregDespeses",
				((pregDespeses == null) ? new ArrayList() : pregDespeses));
		request.getSession().setAttribute("axisctr_preguntasRiesgo",
				((preguntas == null) ? new ArrayList() : preguntas));
		request.getSession().setAttribute("axisctr_pregGastosEndosos",
				((pregGastosEndosos == null) ? new ArrayList() : pregGastosEndosos)); // IAXIS-3980 01/08/2019

    }

    private void getPreguntasTablaLlena(List<HashMap> preguntas, HttpServletRequest request) {
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

        try {
			for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
				HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
				BigDecimal CPREGUN = (BigDecimal) preg.get("CPREGUN");
				// CRESTIP
				if (!isEmpty(preg.get("CRESTIP")) && ((BigDecimal) preg.get("CRESTIP")).intValue() == 3) {
					Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB("R", NRIESGO, null, CPREGUN);
                    logger.debug(map);
                    if (!isEmpty(this.tratarRETURNyMENSAJES(request, map))) {
						ArrayList pt = (ArrayList) this.tratarRETURNyMENSAJES(request, map);
						if (pt.size() > 0)
                            preg.put("PREGTABLA", new BigDecimal(1));
					} else {
                        preg.put("PREGTABLA", new BigDecimal(0));
                    }
                    
               }
            }

			// return preguntas;
		} catch (Exception e) {
            logger.debug(e.getMessage());
			// return preguntas;
        }

    }

    private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
                pregdividides.add(OB_IAXPAR_PREGUNTAS);
                objBorrar.add(OB_IAXPAR_PREGUNTAS);
            }

        }

		for (HashMap OB_IAXPAR_PREGUNTAS : objBorrar) {
            preguntas.remove(OB_IAXPAR_PREGUNTAS);
        }

        return pregdividides;

    }

    /**
     * M�todo que realiza la carga de datos del riesgo seleccionado.
     * 
     * @param request
     * @param usuario
     * @throws Exception
     */
    private void initParametrosGarantias(HttpServletRequest request, UsuarioBean usuario) throws Exception {
        // PAR�METROS GARANT�AS: FORMA DE PAGO, TIPOS Y VALOR REVALORIZACION ELEGIBLES
		Map parametrosGarantias = new HashMap();

		List formaPago = this.dbFormaPago(request, usuario);
        parametrosGarantias.put("formaPago", formaPago);

		BigDecimal CFORPAG = this.dbGetGarForPag(request, usuario);

        parametrosGarantias.put("CFORPAG", CFORPAG);
		BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
		if (!isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC")) && isEmpty(SPRODUC))
			SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
        
		List tipoReval = this.dbGetTipReval(request, SPRODUC, usuario);
		logger.debug("------ TipoReval:" + tipoReval);
        parametrosGarantias.put("tipoRevalorizacion", tipoReval);

        request.getSession().setAttribute("axisctr_parametrosGarantias", parametrosGarantias);
    }

    /*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
    /*********************************************************************************************************************/

    /**
	 * M�todo que se encarga de realizar todos los cambios asociados a la
	 * actualizaci�n de la revalorizaci�n seleccionada.
     * 
     * @param request
     * @param thisAction
     */
    public void m_actualizaRevalorizacionGarantias(HttpServletRequest request) {
        logger.debug("Axisctr207Service m_actualizaRevalorizacionGarantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

        try {
            // TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			// bug 9195 ACC 220209
            //            if(request.getSession().getAttribute("NRIESGO")!=null){
			// NRIESGO =
			// stringToBigDecimal((String)request.getSession().getAttribute("NRIESGO"));
            //            }
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			// De momento le pasamos null a IREVALI (porcentage del valorRevalorizacion)
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = null;
			String listaSelectedGarantias = getCampoTextual(request, "listaSelectedGarantias");

			// if (! isEmpty (CREVALI) && ! isEmpty (listaSelectedGarantias)) {
            if (!isEmpty(CREVALI)) {
				Map plSetValRiesgo = this.dbSetRevalRiesgo(request, usuario, NRIESGO, CREVALI, PREVALI, IREVALI);
				BigDecimal setValRiesgo = (BigDecimal) ajax.rellenarPlAContenedorAjax(plSetValRiesgo);
                if (setValRiesgo.equals(new BigDecimal(0))) {
                    
                    // Para procesar en el jsp (callback de javascript)
					// ajaxContainer =
					// guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
					ajax.guardarInformacionAContenedorAjax(
							Traductor.traducir(getLocale(request).toString(), "1000059"));
                    initPreguntas(request, usuario);
					initGarantias(request, usuario, "");
                    initParametrosGarantias(request, usuario);
					// Guardamos los valores para siempre
					request.getSession().setAttribute("axisctr_PREVALI", ((PREVALI == null) ? "" : PREVALI.toString()));
                    request.getSession().setAttribute("axisctr_CREVALI", CREVALI);

                    request.getSession().setAttribute("hayCambios", "true");
                }
			} else {
				// Si no hay ning�na garantia seleccionada en lista, no se aplica ning�n cambio
				// a la lista
                logger.debug("ERROR: NO HAY GARANTIAS SELECCIONADAS");

				// Para procesar en el jsp (callback de javascript)
				// ajaxContainer =
				// guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
                ajax.guardarErrorAContenedorAjax(Traductor.traducir(getLocale(request).toString(), "1000060"));

				if (request.getSession().getAttribute("axisctr_PREVALI") != null)
                    request.getSession().removeAttribute("axisctr_PREVALI");
				if (request.getSession().getAttribute("axisctr_CREVALI") != null)
                    request.getSession().removeAttribute("axisctr_CREVALI");
            }

			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizaRevalorizacionGarantias", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    public void m_capital_recomendado_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
        try {
			HashMap miDataObject = new HashMap();

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(NRIESGO);
			logger.debug("m_capital_recomendado_json---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

            if (RETURN.equals(new BigDecimal("0"))) {
                request.getSession().setAttribute("hayCambios", "true");
                miDataObject.put("hayCambios", "true");
				initGarantias(request, usuario, "");

			} else {
                miDataObject.put("hayCambios", "false");
                miDataObject.put("resultado", m);
                ajax.rellenarPlAContenedorAjax(m);

            }

			ArrayList listaPartidas = ((ArrayList) request.getSession().getAttribute("axisctr_partidas") == null) ? null
					: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
			miDataObject.put("axisctr_garantias", (ArrayList) request.getSession().getAttribute("axisctr_garantias"));
            miDataObject.put("axisctr_partidas", listaPartidas);

            request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
            logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
        }
    }

    public void m_selected_garantia_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
        try {
			HashMap miDataObject = new HashMap();

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
			BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI_CONFIG");
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
            
			if (usuario.getCempres() != null && usuario.getCempres().toString().equals("24") && CGARANT != null
					&& CGARANT.toString().equals("7000")) {
            	miDataObject.put("poliza_fefeplazo", request.getSession().getAttribute("POLIZA_FEFEPLAZO"));
            	miDataObject.put("poliza_fvencplazo", request.getSession().getAttribute("POLIZA_FVENCPLAZO"));
            	
            	miDataObject.put("poliza_fefeplazof", "FINIVIG_7000");
            	miDataObject.put("poliza_fvencplazof", "FFINVIG_7000");
            }
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				Map mapReturn = (Map) this.dbGrabarGarantiasMap(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
				BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapReturn);
                if (RETURN.equals(new BigDecimal("0"))) {
                    request.getSession().setAttribute("hayCambios", "true");
                    miDataObject.put("hayCambios", "true");
                    
					initGarantias(request, usuario, "SEL_GAR");

				} else {
                    miDataObject.put("hayCambios", "false");
                    miDataObject.put("resultado", mapReturn);
                    ajax.rellenarPlAContenedorAjax(mapReturn);

                }

            }
			ArrayList listaPartidas = ((ArrayList) request.getSession().getAttribute("axisctr_partidas") == null) ? null
					: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
			miDataObject.put("axisctr_garantias", (ArrayList) request.getSession().getAttribute("axisctr_garantias"));
            miDataObject.put("axisctr_partidas", listaPartidas);

			/*
			 * if (SELGAR.intValue() == 0 ) CGARANT = null;
			 */
			Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, CGARANT, SELGAR);
             logger.debug(franq);
			miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				if (SELGAR.intValue() == 1)
					miDataObject.put("selected", "0");
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                 //     this.eliminarGranqTipo4(request,franquicias);
                                                      
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
                 List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
                 if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                 }
                      
				miDataObject.put("franq", franquicias);
				miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				miDataObject.put("franqtecnicas", franqtecnicas);
				miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
				miDataObject.put("bonusmalus", bonusmalus);
				miDataObject.put("bonusmaluslibres", bonusmaluslibres);
				miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
				miDataObject.put("franqgarlibres", franqgarlibres);
				miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
             
                    //  -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
			} else {
				miDataObject.put("selected", "1");
             }
            request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
            logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class)); // IAXIS-5423 CJMR 23/09/2019
        }
    }
    
	private void eliminarGranqTipo4(HttpServletRequest request, ArrayList<HashMap> franquicias) {
            
                for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
                    
			ArrayList subgrupos = (ArrayList) grup.get("LSUBGRUPOS");
			logger.debug("subgrupos:" + subgrupos);
			if (!isEmpty(subgrupos)) {
				HashMap sub = (HashMap) subgrupos.get(0);
				logger.debug("sub:" + sub);
				BigDecimal ctipsubgrup = (BigDecimal) sub.get("CTIPGRUPSUBGRUP");
				logger.debug("ctipsubgrup:" + ctipsubgrup);
				if (!isEmpty(ctipsubgrup) && ctipsubgrup.intValue() == 4)
                        franquicias.remove(OB_IAX_BF_PROACTGRUP);
                       
                    }

                }

    }

    /**
     * M�todo que se encarga de realizar el cambio de tipo de pago.
     * 
     * @param request
     * @param thisAction
     */
    public void m_ajax_cambiar_forma_pago(HttpServletRequest request) {
        logger.debug("Axisctr207Service m_ajax_cambiar_forma_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

        try {
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			Map plSetGarForPag = this.dbSetGarForPag(request, usuario, CFORPAG);
            ajax.rellenarPlAContenedorAjax(plSetGarForPag);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizaRevalorizacionGarantias", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    /**
	 * M�todo que efect�a cambios al seleccionar una garantia de la lista de
	 * garantias.
     * 
     * @param request
     * @param thisAction
     */
    public void m_selected_garantia(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug(
				"-------------------------------------------------------------------------------------->Axisctr207Service m_selected_garantia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        try {
			/*
			 * String respuestas = getCampoTextual(request, "respuestas"); String
			 * []respuesta = null; respuesta = respuestas.split("-");
             */

            // TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			// bug 9195 ACC 220209
            //             if(request.getSession().getAttribute("NRIESGO")!=null){
			// NRIESGO =
			// stringToBigDecimal((String)request.getSession().getAttribute("NRIESGO"));
            //             }

            this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
            m_actualizaDecuentosRecargosRiesgoGaran(request);

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
			BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI_CONFIG");
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
            
			// etm ini 21657
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
            
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);

			logger.debug("*********************etm***pantalla7**2**********" + mtuyo);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
                request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
                request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
                request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
                request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));

            }
			// etm ini 21657

			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
                if (RETURN.equals(new BigDecimal("0"))) {
                    logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
                    initPreguntas(request, usuario);
					initGarantias(request, usuario, "");
                    initParametrosGarantias(request, usuario);
                    request.getSession().setAttribute("hayCambios", "true");
				} else {
                    initPreguntas(request, usuario);
				} // Tratado el error en el pl
            }
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

            logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

            }
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_ajax_selected_garantia", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }

    /**
	 * M�todo que se encarga (at�micamente) de la actualizaci�n de
	 * preguntas/respuestas asociadas al riesgo.
     * 
     * @param request
     * @param NRIESGO
     * @throws Exception
     */
    private void guardaPreguntasYRespuestasToDB(HttpServletRequest request, BigDecimal NRIESGO) throws Exception {

		List preguntas = (List) request.getSession().getAttribute("axisctr_preguntasRiesgo");
		logger.debug("preguntas sin merged grabades ::" + preguntas);
		List<HashMap> pregQuestSalut = (List) request.getSession().getAttribute("axisctr_pregQuestSalut");
		List<HashMap> pregDespeses = (List) request.getSession().getAttribute("axisctr_pregDespeses");
        if (!isEmpty(pregQuestSalut))
			for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut) {
                preguntas.add(OB_IAXPAR_PREGUNTAS);
            }

        if (!isEmpty(pregDespeses))
			for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses) {
                preguntas.add(OB_IAXPAR_PREGUNTAS);
            }
		logger.debug("preguntas merged grabades ::" + preguntas);
		/*
		 * List
		 * preguntas=(List)request.getSession().getAttribute("axisctr_preguntasRiesgo");
		 */

        if (!isEmpty(preguntas))
            /* Guardar preguntas */
			guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO",
					new Object[] { NRIESGO });

    }

    public void m_capital_recomendado(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String validar_tarificacion = "false";
        try {

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

            request.getSession().setAttribute("tar_axctr007", "0");
            this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
            m_actualizaDecuentosRecargosRiesgoGaran(request);

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
            
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
                request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
                request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
                request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
                request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));
            }

            dbGrabarObjetoDb(request, usuario);
            request.getSession().setAttribute("hayCambios", "true");
			Map listaPrimas = new HashMap();
			Map plGetPrimasGarantTot = this.dbGetPrimasGarantTot(request, usuario, NRIESGO);
			listaPrimas = (Map) tratarRETURNyMENSAJES(request, plGetPrimasGarantTot);

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACT_CAP_RECOMEND(NRIESGO);
			logger.debug("m_capital_recomendado_json---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

            //              if (RETURN != null && RETURN.intValue()!= 1 ) {   

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

            logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));
            }

		} catch (Exception e) {
            logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
            request.getSession().setAttribute("validar_tarificacion", validar_tarificacion);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    public void m_tarifar_paso2(HttpServletRequest request, AbstractDispatchAction thisAction) {
    	try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}
			Map mapRespuesta = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF02(NRIESGO);
			paso2 = true;
			m_tarifar(request, thisAction);
		} catch (Exception e) {
    		logger.error("Error en el servicio Axisctr031Service - m�todo m_tarifar_2", e);
    		thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
    		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
    	}
    }

    /**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
     * 
     * @param request
     */
    public void m_tarifar(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_tarifar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String validar_tarificacion = "false";
		
		request.setAttribute("VSUPLE", "0");
        
        ///////////////////////////////////////////////////////////////
         
        // TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		// bug 9195 ACC 220209
        //         if(request.getSession().getAttribute("NRIESGO")!=null){
		// NRIESGO =
		// stringToBigDecimal((String)request.getSession().getAttribute("NRIESGO"));
        //         }

        // RSC 14/7/2015 - Recuperamos NMOVIMI y SSEGURO de las EST 
		BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
		logger.debug("NMOVMIMI : " + NMOVIMI);
		if (NMOVIMI == null) {
            NMOVIMI = new BigDecimal("1");
        }   
        
		BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
        logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);        
        // Fin RSC 14/07/2015
        
		Map listaPrimas = new HashMap();

		boolean preguntasGuardadas = false;
		boolean noHayRespuestas = false;
        try {
			request.getSession().removeAttribute("psu_critica");
			HashMap m = this.f_Get_Avisos_007(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
            request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
            BigDecimal ACCION_PSU  = new BigDecimal(0);
			if (!isEmpty(AbstractDispatchAction.topPila(request, "ACCION_PSU"))) {
                 ACCION_PSU = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "ACCION_PSU")));
			}
			logger.debug("ACCION_PSU---------------------------------------->" + ACCION_PSU);
            
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// Map map0 = new
			// PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("WS_UNDERWRITING",SPRODUC);
			// BigDecimal underwriting0 = (BigDecimal) tratarRETURNyMENSAJES (request,
			// map0);

			Map map = new PAC_IAX_UNDERWRITING((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_UNDERWRITING__F_ACTIVO_UNDW_IF01(SPRODUC, "EST");
			BigDecimal underwriting = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if ((!isEmpty(underwriting) && underwriting.intValue() == 1) && !paso2) {
				// TODO CRIDAR PACKAGE UNDERWRITTING IF01 (CRIDA CONNECT ..... )
				Map mapRespuesta = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF01(NRIESGO);
				logger.debug("MAPA RESPUESTA IF01: " + mapRespuesta);
				// mapRespuesta.put("url", "http://portal.srvcsi.com");
				
				if (mapRespuesta.get("RETURN") == null || ((Map) mapRespuesta.get("RETURN")).get("SCREENURL") == null) {
					// throw new Exception("No se ha encontrado SCREENURL");
					logger.error("Error en el servicio Axisctr207Service - m�todo m_tarifar");
		            thisAction.guardarMensaje(request, "9908332", new Object[] {}, Constantes.MENSAJE_ERROR);
					
				} else {
					request.setAttribute("IF01URL", ((Map) mapRespuesta.get("RETURN")).get("SCREENURL"));
				}
			} else {
				paso2 = false;
				if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
					
					request.getSession().setAttribute("tar_axctr007", "1");
					request.getSession().setAttribute("hayCambios", "true");
					this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
					m_actualizaDecuentosRecargosRiesgoGaran(request);
					
					logger.debug("SSEGURO-axisctr207 de la pila->" + SSEGURO);
					Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
					if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
							&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
						request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
						request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
						request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
						request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));
					}
					
					// Se pone este dbGrabarObjetoDb ya que se ha detectado que al validar las
					// preguntas
					// �stas no est�n corrcetamente actualizadas en las tablas EST, pero s� en el
					// objeto
					// ya que se llama previamente a "this.guardaPreguntasYRespuestasToDB".
					dbGrabarObjetoDb(request, usuario);
					
					// request.getSession().setAttribute("axisctr_preguntasRiesgo", preguntas);
					Map plValidaDPregGarantReturn = this.dbValidaDPregGarant(request, usuario, NRIESGO);
					BigDecimal validaDPregGarantReturn = (BigDecimal) tratarRETURNyMENSAJES(request,
							plValidaDPregGarantReturn);
					if (validaDPregGarantReturn.equals(new BigDecimal(0))) {
						Map franq = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION__F_VALIDAR_FRANQUICIAS(NRIESGO);
						logger.debug(franq);
						BigDecimal vfranq = (BigDecimal) this.tratarRETURNyMENSAJES(request, franq);
						
						if (!isEmpty(vfranq) && (vfranq.intValue() == 0)) {
							
							Map plTarificarReturn = this.dbTarificar(request, usuario, NRIESGO);
							BigDecimal tarificarReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plTarificarReturn);
							
							if (tarificarReturn.equals(new BigDecimal(0))) {
								validar_tarificacion = "true";
								request.setAttribute("hayCambios", "false");
								request.setAttribute("VSUPLE", "1");
							} else {
								request.getSession().setAttribute("tar_axctr007", "0");
								request.setAttribute("VSUPLE", "0");
							}
							BigDecimal okPSU = new BigDecimal(0);
							
							logger.debug("SSEGURO---------------------------------------->" + SSEGURO);
							logger.debug("ACCION_PSU---------------------------------------->" + ACCION_PSU);
							if (!isEmpty(SSEGURO) && ACCION_PSU.intValue() == 6) {// Si estamos en simulacion lanzamos
																					// la PSU
								Map mx = new PAC_IAX_SIMULACIONES(
										((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
										.ejecutaPAC_IAX_SIMULACIONES__F_INICIA_PSU("EST", SSEGURO, ACCION_PSU, null);
								logger.debug("PSU---------------------------------------->" + mx);
								okPSU = (BigDecimal) tratarRETURNyMENSAJES(request, mx, false);
							}
							
							if (okPSU.intValue() != 0) {
								validar_tarificacion = "true";
								request.setAttribute("hayCambios", "false");
								request.getSession().setAttribute("psu_critica", "1");
								logger.debug("PSU CRITICA");
							} else {
								request.getSession().removeAttribute("psu_critica");
								logger.debug("PSU NO CRITICA");
							}
							
							Map plGetPrimasGarantTot = this.dbGetPrimasGarantTot(request, usuario, NRIESGO);
							listaPrimas = (Map) tratarRETURNyMENSAJES(request, plGetPrimasGarantTot);
							
						} else
							request.getSession().setAttribute("tar_axctr007", "0");
					}
					
				}
				SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				// BUG9426-12032009-XVM
				// this.m_validar_reval_pendientes(request);
				PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);
				
				logger.debug(mmoneda);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
					request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
					request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
					request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));
				}
				if (!isEmpty(SSEGURO) && ACCION_PSU.intValue() == 6) {// Si estamos en simulacion lanzamos la PSU
					
					Map col_psu = new PAC_IAX_PSU(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, NRIESGO, "EST");
					logger.debug("col_psu:" + col_psu);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
						request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
						request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
						request.setAttribute("PCNIVELBPM", col_psu.get("P_CNIVELBPM"));
						request.setAttribute("PTNIVELBPM", col_psu.get("P_TNIVELBPM"));
						request.setAttribute("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));
						request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));
						
						logger.debug(col_psu.get("POBPSU_RETENIDAS"));
						if (!isEmpty(col_psu.get("POBPSU_RETENIDAS"))) {
							HashMap mm = (HashMap) col_psu.get("POBPSU_RETENIDAS");
							logger.debug(m.get("NOCONTINUA"));
							if (!isEmpty(mm.get("NOCONTINUA"))) {
								request.setAttribute("PERMITE_EMITIR", mm.get("NOCONTINUA"));
								request.setAttribute("CCRITICO", mm.get("CCRITICO"));
							}
						}
					}
				}
			}

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_tarifar", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
            request.getSession().setAttribute("validar_tarificacion", validar_tarificacion);
        //    this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    /**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
     * @param request
     * @param thisAction
     */
    public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_siguiente");
        m_actualizaDecuentosRecargosRiesgoGaran(request);
        m_guardaEstadoPantalla(request, thisAction, Constantes.SIGUIENTE);
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }

    /**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
     * @param request
     * @param thisAction
     */
    public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_anterior");
        m_guardaRespuestas(request, thisAction);
        m_actualizaDecuentosRecargosRiesgoGaran(request);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        try {
			// Al informar preguntas y darle atras no se bajan las preguntas a las EST, eso
			// hace
            // que salten validaciones incorrectamente.
            dbGrabarObjetoDb(request, usuario);
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_anterior", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }

        m_guardaEstadoPantalla(request, thisAction, Constantes.ANTERIOR);
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }
    
    public void m_anterior_sing(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_anterior_sing");

		try {
			String CFORM = getCampoTextual(request, "FORM_ACT");
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, CFORM, null));
        	request.getSession().setAttribute("tar_axctr007", "0");
		} catch (Exception e) {
		}
        
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }
    
    /**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
     * @param request
     * @param thisAction
     */
    public void m_volver(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_anterior");
        m_grabarvolver(request, thisAction, Constantes.ANTERIOR);
        this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }

    /**
	 * Valida mediante la llamada a la funci�n que se bloquee o no el combo de
	 * revalorizaciones en la pantalla 007
	 * 
     * @param request
     * @param thisAction
     */
    public void m_validar_reval(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_validar_reval");
        try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALPROD();
			BigDecimal valor_reval = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (valor_reval.intValue() == 0) {
                request.getSession().setAttribute("valida_reval", "0");
			} else {
                request.getSession().setAttribute("valida_reval", "1");
            }

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_valida_reval", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
    }

    /**
     * M�todo que se encarga de guardar las respuestas de la pantalla
	 * 
     * @param request
     * @param thisAction
     */
    private void m_guardaRespuestas(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_guardaRespuestas");

        try {

            // TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
            }

            this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_guardaRespuestas", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }

    /**
     * M�todo que se encarga de guardar las respuestas de la pantalla
	 * 
     * @param request
     * @param thisAction
     */
    public void m_avisos_cuestionario(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_avisos_cuestionario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

        try {

            // TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
            }

            this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
            dbGrabarObjetoDb(request, usuario);

			HashMap m = this.f_Get_Avisos_007_cuestionario(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			// request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() == 0) { /////////// AVISOS
                request.getSession().setAttribute("hayCambiosBonsai", "true");
                request.getSession().setAttribute("saltar_bonsai", "0");
				// formdata.put("saltar_bonsai","1");
			} else {
                request.getSession().setAttribute("saltar_bonsai", "1");
                request.getSession().setAttribute("hayCambiosBonsai", "true");
            }

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_avisos_cuestionario", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }

    /**
	 * M�todo que se encarga de la validaci�n de la pantalla cuando queremos ir a la
	 * pantalla axisctr008.
     *
     * @param request
     * @param thisAction
     */

    /**
	 * M�todo que se encarga de la validaci�n de la pantalla cuando queremos ir a la
	 * pantalla axisctr008.
     * 
     * @param request
     * @param thisAction
     */
	private void m_guardaEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal direccion) {
        logger.debug("Axisctr207Service m_guardaEstadoPantalla");
        try {
            // LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n 
			String CFORM = getCampoTextual(request, "FORM_ACT");

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			logger.debug("SSEGURO:" + SSEGURO);
			logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

			if (SSEGURO_OUT == null) {
				SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
			} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

            /* Datos fecha vencimiento Bug12485 */
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
            
			if (NMOVIMI == null) {
				NMOVIMI = new BigDecimal("1");
            }

            request.setAttribute("NMOVIMI", NMOVIMI);
            request.setAttribute("SSEGURO", SSEGURO);
            request.setAttribute("SSEGURO_OUT", SSEGURO_OUT);
            request.setAttribute("SPRODUC", SPRODUC);
            request.setAttribute("NRIESGO", NRIESGO);
			String MODO_SESSION = String.valueOf(request.getSession().getAttribute("MODO"));
			BigDecimal pRETURN = new BigDecimal(0);
			/*
			 * if (!isEmpty(MODO_SESSION) && MODO_SESSION.equals(new String("SIMULACION")))
			 * { pRETURN=new BigDecimal(0); } else{
			 */
			HashMap m = this.f_Get_Avisos_007(request, this.whoami(this));
			pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
                request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
         //   }
			if (pRETURN != null && pRETURN.intValue() != 1) {

				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, CFORM, null));
                request.getSession().setAttribute("tar_axctr007", "0");

				String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
                // Comentat per provar si es comporta Correctament.Bug 11440.NMM.i.
				// if(VMODO.equals("SIMULACION")){
                //    request.getSession().setAttribute("axisctr207_primera_vez", null);
				// }
                // Bug 11440.NMM.f.
                // LCF 
				/*
				 * if (Boolean.valueOf(true).equals(request.getAttribute("multiPantalla"))) //
				 * TODO: De momento, forwards hard-codeados
				 * request.setAttribute(Constantes.FORWARDACTION, direccion ==
				 * Constantes.ANTERIOR ? new ActionForward("/axis_axisctr027.do?operation=form")
				 * : new ActionForward("/axis_axisctr009.do?operation=form" ));
                */

                request.getSession().setAttribute("IMPRESO", request.getParameter("IMPRESO"));
            }

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_guardaEstadoPantalla", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    /**
	 * M�todo que se encarga de la validaci�n de la pantalla cuando queremos ir a la
	 * pantalla axisctr008.
     * 
     * @param request
     * @param thisAction
     */
    private void m_grabarvolver(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
        logger.debug("Axisctr207Service m_volver");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        try {
            // LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n 
			String CFORM = getCampoTextual(request, "FORM_ACT");
            request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.findForward(request, direccion, CFORM, null));
            request.getSession().setAttribute("tar_axctr007", "0");

            // LCF 

			/*
			 * PAC_IAX_SIMULACIONES pacIaxSimulacion = new
			 * PAC_IAX_SIMULACIONES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES();
			 */

			/*
			 * if (Boolean.valueOf(true).equals(request.getAttribute("multiPantalla"))) //
			 * TODO: De momento, forwards hard-codeados
			 * request.setAttribute(Constantes.FORWARDACTION, direccion ==
			 * Constantes.ANTERIOR ? new ActionForward("/axis_axisctr027.do?operation=form")
			 * : new ActionForward("/axis_axisctr009.do?operation=form" ));
            */

            request.getSession().setAttribute("IMPRESO", request.getParameter("IMPRESO"));

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_volver", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    /**
     * Devuelve 1 � 0 seg�n el producto tiene cuestionario de salud.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
     * @param usuario
     * @return
     * @throws Exception
     */
	private BigDecimal dbTieneCuestionario(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
        
		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CCUESTI(SPRODUC);
        logger.debug(map);
		if (!isEmpty((BigDecimal) tratarRETURNyMENSAJES(request, map))
				&& ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
			return (BigDecimal) map.get("PCCUESTI");
        }

        return new BigDecimal(0);
    }

    public void m_ajax_continuar(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_ajax_continuar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();

        try {
            /* recuperar el SSEGURO */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			/* Recuperar el riesgo */
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal PPULSADO = getCampoNumerico(request, "pulsado");
			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

			String PMODO = "ALT";
            if (!isEmpty(VMODO)) {
                if (VMODO.equals(new String("ALTA_POLIZA")))
					PMODO = "ALT";
                else if (VMODO.equals(new String("SIMULACION")))
					PMODO = "SIM";
                else {
                    if (VMODO.substring(0, 10).equals(new String("SUPLEMENTO")))
						PMODO = "SUP";
                }
            }

			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CUEST_SALUD(PPULSADO, PMODO, SSEGURO, NRIESGO);
            logger.debug(map);

			if (!isEmpty((BigDecimal) tratarRETURNyMENSAJES(request, map)))
				ajaxcontainer.put("IMPRIMIDO", (BigDecimal) map.get("RETURN"));

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_ajax_continuar", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
        }
    }

    public void m_ajax_cuest_imprimido(HttpServletRequest request, AbstractDispatchAction thisAction) {
        logger.debug("Axisctr207Service m_ajax_cuest_imprimido");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();

        try {
            request.getSession().setAttribute("IMPRESO", "1");

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_ajax_continuar", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
        }
    }

    // AMC-Bug 9678

    /**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista
	 * correspondiente a la modalidad.
     * 
     * @param request
     * @param usuario
     * @return
	 * @throws Exception
	 */
    public

    List dbModalidades(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODALIDADES();
		logger.debug("Map de Combo Modalidades---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
    }

    /**
     * M�todo que llama a la funci�n pl correspondiente para guardar la modalidad.
     * 
     * @param request
     * @param thisAction
     * @return
     * @throws Exception
     */
    public BigDecimal m_setModalidad(HttpServletRequest request, AbstractDispatchAction thisAction) {

        try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal cmodalidad = getCampoNumerico(request, "CMODALIDAD");
			BigDecimal nriesgo = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_GARANMODALIDAD(nriesgo, cmodalidad);
			logger.debug("Guardamos modalidad ---------------------------------------->" + m);

			if (!isEmpty(m.get("GARANTIAS"))) {
				Map n = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR(nriesgo);
				logger.debug("TARIFICACION CORRECTA?(0->ok/1->error)---------------------------------------->" + n);
            
				logger.debug("------- Garantias recuperadas:" + m.get("GARANTIAS"));
                request.getSession().setAttribute("garantias_mod", m.get("GARANTIAS"));
            }
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

            logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

            }
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
			return (BigDecimal) tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_valida_reval", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
            return new BigDecimal(1);
        }
    }

    public BigDecimal m_actualitzarimports(HttpServletRequest request, AbstractDispatchAction thisAction) {

        try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

            logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

            }
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");
			BigDecimal IPRITARsel = getCampoNumerico(request, "IPRITARsel");
			BigDecimal IPRIANUsel = getCampoNumerico(request, "IPRIANUsel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(NRIESGO, CGARANT, IPRITARsel, IPRIANUsel);
			logger.debug("m_actualitzarimports---------------------------------------->" + m);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
			return (BigDecimal) tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_valida_reval", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
            return new BigDecimal(1);
        }
    }

    public BigDecimal m_actualitzarmanual(HttpServletRequest request, AbstractDispatchAction thisAction) {

        try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMANsel");

            if (isEmpty(CTARMAN)) {
				CTARMAN = new BigDecimal(this.getCampoTextual(request, "CTARMANsel"));
            }

			if (CTARMAN.intValue() == 1)
                request.getSession().setAttribute("tar_axctr031", "1");

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
            this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
            // request.getSession().setAttribute("axisctr_preguntasRiesgo", preguntas);
			Map plValidaDPregGarantReturn = this.dbValidaDPregGarant(request, usuario, NRIESGO);
			BigDecimal validaDPregGarantReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plValidaDPregGarantReturn);
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(NRIESGO, CGARANT, CTARMAN);
			logger.debug("m_actualitzarmanual ---------------------------------------->" + m);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

            logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
                request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
                request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
                request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

            }
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
			return (BigDecimal) tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr031Service - m�todo m_valida_reval", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
            this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr207Service.class));
            return new BigDecimal(1);
        }
    }

    public void m_actualitzarimports_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
        try {
			HashMap miDataObject = new HashMap();
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");
			BigDecimal IPRITARsel = getCampoNumerico(request, "IPRITARsel");
			BigDecimal IPRIANUsel = getCampoNumerico(request, "IPRIANUsel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(NRIESGO, CGARANT, IPRITARsel, IPRIANUsel);
			logger.debug("m_actualitzarimports---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

            if (RETURN.equals(new BigDecimal("0"))) {
                
                request.getSession().setAttribute("hayCambios", "true");
                miDataObject.put("hayCambios", "true");
				initGarantias(request, usuario, "");

			} else {
                miDataObject.put("hayCambios", "false");
                miDataObject.put("resultado", m);
                ajax.rellenarPlAContenedorAjax(m);

            }

			ArrayList listaPartidas = ((ArrayList) request.getSession().getAttribute("axisctr_partidas") == null) ? null
					: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
			miDataObject.put("axisctr_garantias", (ArrayList) request.getSession().getAttribute("axisctr_garantias"));
            miDataObject.put("axisctr_partidas", listaPartidas);

			Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
            logger.debug(franq);
			miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                //     this.eliminarGranqTipo4(request,franquicias);
                                                     
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
                 List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
                 if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                 }
                      
				miDataObject.put("franq", franquicias);
				miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				miDataObject.put("franqtecnicas", franqtecnicas);
				miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
				miDataObject.put("bonusmalus", bonusmalus);
				miDataObject.put("bonusmaluslibres", bonusmaluslibres);
				miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
				miDataObject.put("franqgarlibres", franqgarlibres);
				miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
            
                   //  -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
            }
            request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);

		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualitzarimports_json", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

        }
    }

    public void m_actualitzarmanual_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
        try {
			HashMap miDataObject = new HashMap();

			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMANsel");

            if (isEmpty(CTARMAN)) {
				CTARMAN = new BigDecimal(this.getCampoTextual(request, "CTARMANsel"));
            }

			if (CTARMAN.intValue() == 1)
                request.getSession().setAttribute("tar_axctr207", "1");

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(NRIESGO, CGARANT, CTARMAN);
			logger.debug("m_actualitzarmanual ---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

            if (RETURN.equals(new BigDecimal("0"))) {
                
                request.getSession().setAttribute("hayCambios", "true");
                miDataObject.put("hayCambios", "true");
				initGarantias(request, usuario, "");

			} else {
                miDataObject.put("hayCambios", "false");
                miDataObject.put("resultado", m);
                ajax.rellenarPlAContenedorAjax(m);

            }

			ArrayList listaPartidas = ((ArrayList) request.getSession().getAttribute("axisctr_partidas") == null) ? null
					: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
			miDataObject.put("axisctr_garantias", (ArrayList) request.getSession().getAttribute("axisctr_garantias"));
            miDataObject.put("axisctr_partidas", listaPartidas);
			// dbGrabarObjetoDb(request, usuario);
			Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
            logger.debug(franq);
			miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                //     this.eliminarGranqTipo4(request,franquicias);
                                                     
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
                List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
                if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                }
                     
				miDataObject.put("franq", franquicias);
				miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				miDataObject.put("franqtecnicas", franqtecnicas);
				miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
				miDataObject.put("bonusmalus", bonusmalus);
				miDataObject.put("bonusmaluslibres", bonusmaluslibres);
				miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
				miDataObject.put("franqgarlibres", franqgarlibres);
				miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
            
                   //  -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
            }
            request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualitzarmanual_json", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }

        public void m_actualitzarpreg_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal CPREGUN = this.getCampoNumerico(request, "CPREGUN");
			BigDecimal CRESPUE = this.getCampoNumerico(request, "CRESPUE");
			BigDecimal CRECARG = this.getCampoNumerico(request, "CRECARG");
			String TRESPUE = this.getCampoTextual(request, "TRESPUE");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			Map m = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(NRIESGO, CPREGUN, CRESPUE, TRESPUE);
                logger.debug(m);
                 
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

                if (RETURN.equals(new BigDecimal("0"))) {
                    request.getSession().setAttribute("hayCambios", "true");
                    miDataObject.put("hayCambios", "true");
                  //  initGarantias(request, usuario);
                   dbGrabarObjetoDb(request, usuario);
			} else {
                    miDataObject.put("hayCambios", "false");
                    miDataObject.put("resultado", m);
                    ajax.rellenarPlAContenedorAjax(m);

                }

			/*
			 * ArrayList listaPartidas=((ArrayList)request.getSession().getAttribute(
			 * "axisctr_partidas")==null)?null:(ArrayList)request.getSession().getAttribute(
			 * "axisctr_partidas"); miDataObject.put("axisctr_garantias",
			 * (ArrayList)request.getSession().getAttribute("axisctr_garantias"));
			 * miDataObject.put("axisctr_partidas", listaPartidas);
			 * 
			 * 
			 * Map franq=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO,null);
			 * logger.debug(franq);
			 * miDataObject.put("franq",this.tratarRETURNyMENSAJES(request, franq));
                */
               miDataObject.put("CRECARG",CRECARG);
                if (!isEmpty(CRECARG) && !CRECARG.equals(new BigDecimal("0")) ){
                    
                    if (CRECARG.equals(new BigDecimal("1"))) {
                        initPreguntas(request, usuario);
					initGarantias(request, usuario, "");
                        initParametrosGarantias(request, usuario);
					ArrayList listaPartidas = ((ArrayList) request.getSession()
							.getAttribute("axisctr_partidas") == null) ? null
									: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
					miDataObject.put("axisctr_garantias",
							(ArrayList) request.getSession().getAttribute("axisctr_garantias"));
                        miDataObject.put("axisctr_partidas", listaPartidas);
				} else if (CRECARG.equals(new BigDecimal("2"))) {
					Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
                                logger.debug(franq);
					miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
					if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
						ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                                    //     this.eliminarGranqTipo4(request,franquicias);
                                                                         
						List franqtecnicas = null;
						List bonusmalus = null;
						List franqtecnicaslibres = null;
						List bonusmaluslibres = null;
						List franqgartecnicaslibres = new ArrayList();
                                     List franqgarlibres = new ArrayList();
						List bonusmalusgarlibres = new ArrayList();
                                     if (!isEmpty(franquicias)) {
							franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
							franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas
																												// libres
							bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
							bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                                     }
                                          
						miDataObject.put("franq", franquicias);
						miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
						miDataObject.put("franqtecnicas", franqtecnicas);
						miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
						miDataObject.put("bonusmalus", bonusmalus);
						miDataObject.put("bonusmaluslibres", bonusmaluslibres);
						miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
						miDataObject.put("franqgarlibres", franqgarlibres);
						miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
                                
                                       //  -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
                                }
				} else if (CRECARG.equals(new BigDecimal("3"))) {
                                initPreguntas(request, usuario);
					initGarantias(request, usuario, "");
                                initParametrosGarantias(request, usuario);
					ArrayList listaPartidas = ((ArrayList) request.getSession()
							.getAttribute("axisctr_partidas") == null) ? null
									: (ArrayList) request.getSession().getAttribute("axisctr_partidas");
					miDataObject.put("axisctr_garantias",
							(ArrayList) request.getSession().getAttribute("axisctr_garantias"));
                                miDataObject.put("axisctr_partidas", listaPartidas);
                               
					Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
                                logger.debug(franq);
					miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
					if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
						ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                               //     this.eliminarGranqTipo4(request,franquicias);
                                                                    
						List franqtecnicas = null;
						List bonusmalus = null;
						List franqtecnicaslibres = null;
						List bonusmaluslibres = null;
						List franqgartecnicaslibres = new ArrayList();
                                List franqgarlibres = new ArrayList();
						List bonusmalusgarlibres = new ArrayList();
                                if (!isEmpty(franquicias)) {
							franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
							franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas
																												// libres
							bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
							bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                                }
                                     
						miDataObject.put("franq", franquicias);
						miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
						miDataObject.put("franqtecnicas", franqtecnicas);
						miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
						miDataObject.put("bonusmalus", bonusmalus);
						miDataObject.put("bonusmaluslibres", bonusmaluslibres);
						miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
						miDataObject.put("franqgarlibres", franqgarlibres);
						miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
                                }
                            }
                }
                
                request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);                            
                
		} catch (Exception e) {
                logger.error("Error en el servicio Axisctr207Service - m�todo m_actualitzarmanual_json", e);
                thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
            }
        }
    
    public void m_actualizar_franq_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
        try {
			HashMap miDataObject = new HashMap();
            
			BigDecimal CNIVEL = getCampoNumerico(request, "CNIVEL");
            
			BigDecimal CGRUP = getCampoNumerico(request, "CGRUP");
			BigDecimal CSUBGRUP = getCampoNumerico(request, "CSUBGRUP");
			BigDecimal CVERSION = getCampoNumerico(request, "CVERSION");
			BigDecimal IMPVALOR = getCampoNumerico(request, "IMPVALOR");

			BigDecimal CVALOR1 = getCampoNumerico(request, "CVALOR1");
			BigDecimal CVALOR2 = getCampoNumerico(request, "CVALOR2");
			BigDecimal CIMPMIN = getCampoNumerico(request, "CIMPMIN");
			BigDecimal CIMPMAX = getCampoNumerico(request, "CIMPMAX");
			BigDecimal IMPMIN = getCampoNumerico(request, "IMPMIN");
			BigDecimal IMPMAX = getCampoNumerico(request, "IMPMAX");
			BigDecimal IMPVALOR2 = getCampoNumerico(request, "IMPVALOR2");
			BigDecimal TIPOFRANQ = getCampoNumerico(request, "TIPOFRANQ");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_FRANQUICIA(NRIESGO, CGRUP, CSUBGRUP, CVERSION, CNIVEL, CVALOR1,
							IMPVALOR, CVALOR2, IMPVALOR2, CIMPMIN, IMPMIN, CIMPMAX, IMPMAX);
			logger.debug("m_actualizar_franq_json ---------------------------------------->" + m);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

            if (RETURN.equals(new BigDecimal("0"))) {
                request.getSession().setAttribute("hayCambios", "true");
                miDataObject.put("hayCambios", "true");
               // initGarantias(request, usuario);

			} else {
                miDataObject.put("hayCambios", "false");
                miDataObject.put("resultado", m);
                ajax.rellenarPlAContenedorAjax(m);

            }
            
			// dbGrabarObjetoDb(request, usuario);
			Map franq = new HashMap();
			BigDecimal CGARANTfranq = this.getCampoNumerico(request, "CGARANTfranq");
			if (isEmpty(CGARANTfranq)) {
            
				if (isEmpty(TIPOFRANQ) || (!isEmpty(TIPOFRANQ) && TIPOFRANQ.intValue() == 2)) {
					franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
                        logger.debug(franq);
                }
			} else {
				if (isEmpty(TIPOFRANQ) || (!isEmpty(TIPOFRANQ) && TIPOFRANQ.intValue() == 2)) {
					franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_GARANTIA(NRIESGO, null, CGARANTfranq);
                    logger.debug(franq);
                }
                
            }
			miDataObject.put("selected", "0");
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				miDataObject.put("selected", "1");
				miDataObject.put("franq", this.tratarRETURNyMENSAJES(request, franq));
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
                            //     this.eliminarGranqTipo4(request,franquicias);
                                                                 
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
                            List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
                            if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
                            }
                                 
				miDataObject.put("franq", franquicias);
				miDataObject.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				miDataObject.put("franqtecnicas", franqtecnicas);
				miDataObject.put("franqtecnicaslibres", franqtecnicaslibres);
				miDataObject.put("bonusmalus", bonusmalus);
				miDataObject.put("bonusmaluslibres", bonusmaluslibres);
				miDataObject.put("franqgartecnicaslibres", franqgartecnicaslibres);
				miDataObject.put("franqgarlibres", franqgarlibres);
				miDataObject.put("bonusmalusgarlibres", bonusmalusgarlibres);
                        
                               //  -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
                        }

            request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizar_franq_json", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }
    
	/*
     *
     * */

    public void m_ajax_setGarantia(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
		BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
		BigDecimal CREVALI = getCampoNumerico(request, "CREVALI_CONFIG");
		BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
		BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
        BigDecimal RETURN;
        try {
			RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
					IREVALI);
            if (RETURN.equals(new BigDecimal("0"))) {

            }
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_ajax_setGarantia", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }

    }

    private HashMap f_Get_Avisos_007(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

        try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO_OUT"))) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
            }
            
            request.setAttribute("SSEGURO", SSEGURO);
            request.setAttribute("NRIESGO", NRIESGO);

			String pparams = this.getInfoStringConcatenar_007(request);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

            logger.debug(m);
			/*
			 * BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,m);
			 * 
			 * if (pRETURN != null) {
			 * request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS")); }
			 */
            return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_031 " + whoami + " ha causado un error", e);
            return null;
        }

    }

    private HashMap f_Get_Avisos_007_cuestionario(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

        try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = "PREVALBONSAI";
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

            request.setAttribute("SSEGURO", SSEGURO);
            request.setAttribute("NRIESGO", NRIESGO);

			String pparams = this.getInfoStringConcatenar_007(request);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

            logger.debug(m);
			/*
			 * BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,m);
			 * 
			 * if (pRETURN != null) {
			 * request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS")); }
			 */
            return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_031 " + whoami + " ha causado un error", e);
            return null;
        }

    }

    private String getInfoStringConcatenar_007(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

        try {
			StringBuffer cadena = new StringBuffer();
            request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();

            while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
                
				if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && fieldName.indexOf("respuesta") == -1) {
					String[] todos_valores = request.getParameterValues(fieldName);
					for (int i = 0; i < todos_valores.length; i++) {
						String fieldValue = todos_valores[i];

						if (!isEmpty(fieldValue) && !fieldValue.equals("undefined")) {
							if (i == 0) {
								// cadena.append("#").append(fieldName).append(";").append(fieldValue);
								cadena.append("#" + fieldName + ";" + fieldValue);
							} else {
								// cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
								cadena.append("#" + fieldName + "__" + i + ";" + fieldValue);
                            }
                        }

                    }
                }
            }

			enumera = request.getAttributeNames();

            while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
                
				String fieldValue = String.valueOf(request.getAttribute(fieldName));
				if (!fieldName.equals("TTITOBS") && fieldName.indexOf("respuesta") == -1 && !fieldName.equals("TOBS")
						&& !isEmpty(fieldValue) && !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					// cadena.append("#").append(fieldName).append(";").append(fieldValue);
					cadena.append("#" + fieldName + ";" + fieldValue);
                }
            }

			// cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			cadena.append("#" + "CIDIOMA" + ";" + usuario.getCidioma());
			String c = cadena.append("#").toString();
			/*
			 * logger.debug("cadena avisos sin recorte -->"+cadena); if (c.length()>1999)
			 * c=c.substring(0, 1999);
			 */
            
            return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
            return "";
        }
    }

    private void managePartidas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
		// TODO S'ha de vanciar 0 --> 1
		List partidasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO, new BigDecimal(1));
		formdata.put("axisctr_partidas_seleccionadas",
				((partidasSeleccionadas == null) ? new ArrayList() : partidasSeleccionadas));
		logger.debug("---------- Lista de partidasSeleccionadas: " + partidasSeleccionadas);
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		garantiasProducto = getGarantiasModalidad(garantiasProducto, request);
        if (!isEmpty(garantiasProducto)) {
			List listaPartidas = getGarantiasSeleccionadas(new BigDecimal(1), garantiasProducto, partidasSeleccionadas,
					request);
			logger.debug("---------- listaPartidas: " + listaPartidas);

			listaPartidasG = listaPartidas;
			if (listaPartidas != null) {
                formdata.put("num_partidas", listaPartidas.size());
            }
			formdata.put("axisctr_partidas", ((listaPartidas == null) ? new ArrayList() : listaPartidas));
			request.getSession().setAttribute("axisctr_partidas",
					((listaPartidas == null) ? new ArrayList() : listaPartidas));
        }
    }

	// Devuelve en caso que sea necesario solo las garantias de la modalidad

    private List getGarantiasModalidad(List garantiasProducto, HttpServletRequest request) {
		List bb = (List) request.getSession().getAttribute("garantias_mod");
		logger.debug("---------- garantias_mod: " + bb);
		if (request.getSession().getAttribute("garantias_mod") != null) {
            logger.debug("---------- garantias_mod no null ");
			List la = new ArrayList();
			List garanModalidad = (List) request.getSession().getAttribute("garantias_mod");
			for (int a = 0; a < garanModalidad.size(); a++) { // alex
				BigDecimal CGARANT_ALEX = (BigDecimal) ((Map) ((Map) garanModalidad.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CGARANT");
				for (int b = 0; b < garantiasProducto.size(); b++) {
					BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(b))
							.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
                    if (CGARANT_PRODUCTO.equals(CGARANT_ALEX)) {
						la.add((Map) garantiasProducto.get(b));
                    }
                }
            }
			logger.debug("---------- Lista de garantia de la modalidad: " + la);
			garantiasProducto = la;
        }
        return garantiasProducto;
    }

	// Devuelve las garantias o Partidas

	private List getGarantiasSeleccionadas(BigDecimal cpartida, List garantiasProducto, List garantiasSeleccionadas,
			HttpServletRequest request) {
		Map m1 = new HashMap();
		List listaGarantias = new ArrayList();
		// Recoremos todas las grantis de producto
		for (int a = 0; a < garantiasProducto.size(); a++) {
			boolean coincide = false;
			// Recuperamos los valores
			BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a))
					.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
			String DESCRIPCION = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("DESCRIPCION");
			BigDecimal CTIPCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CTIPCAP");
			BigDecimal CTIPGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CTIPGAR");
			List LISTACAPITALES = (List) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("LISTACAPITALES");
			BigDecimal CPARTIDA = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CPARTIDA");
			BigDecimal CMONCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CMONCAP");
			String CMONINT = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CMONCAPINT");
			String TMONCAP = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("TMONCAP");
			BigDecimal CVISIBLE = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CVISIBLE");
			BigDecimal CGARPADRE = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CGARPADRE");
			BigDecimal CNIVGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CNIVGAR");
			CPARTIDA = isEmpty(CPARTIDA) ? new BigDecimal(0) : CPARTIDA;
			logger.debug("CGARANT=" + CGARANT_PRODUCTO + ",CPARTIDA=" + CPARTIDA);
			if (CPARTIDA.intValue() == 1) {
                if (!isEmpty(garantiasSeleccionadas)) {
					for (int i = 0; i < garantiasSeleccionadas.size(); i++) {
						BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(i))
								.get("OB_IAX_GARANTIAS")).get("CGARANT");
						Map seleccionado = getObjetoDeLista(garantiasSeleccionadas, CGARANT_SELECT.toString(),
								"CGARANT", "OB_IAX_GARANTIAS");

						BigDecimal IPRIANU = null;
						BigDecimal IPRITAR = null;
						BigDecimal IPRITOT = null;
						BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
								? (BigDecimal) seleccionado.get("ICAPITAL")
								: null);
						BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
								? (BigDecimal) seleccionado.get("COBLIGA")
								: null);
						BigDecimal CTARMAN = ((!isEmpty(seleccionado.get("CTARMAN")))
								? (BigDecimal) seleccionado.get("CTARMAN")
								: null);
						BigDecimal CDETALLE = ((!isEmpty(seleccionado.get("CDETALLE")))
								? (BigDecimal) seleccionado.get("CDETALLE")
								: null);
						BigDecimal ICAPRECOMEND = ((!isEmpty(seleccionado.get("ICAPRECOMEND")))
								? (BigDecimal) seleccionado.get("ICAPRECOMEND")
								: null);
						// logger.debug("CTARMAN-->"+ seleccionado);
						BigDecimal IFRANQU = ((!isEmpty(seleccionado.get("IFRANQU")))
								? (BigDecimal) seleccionado.get("IFRANQU")
								: null);
                        
                        // BUG 41143/229973 - 17/03/2016 - JAEG
						Timestamp FINIVIG = ((!isEmpty(seleccionado.get("FINIVIG")))
								? (Timestamp) seleccionado.get("FINIVIG")
								: null);
						Timestamp FFINVIG = ((!isEmpty(seleccionado.get("FFINVIG")))
								? (Timestamp) seleccionado.get("FFINVIG")
								: null);
						BigDecimal CCOBPRIMA = ((!isEmpty(seleccionado.get("CCOBPRIMA")))
								? (BigDecimal) seleccionado.get("CCOBPRIMA")
								: null);
						BigDecimal IPRIDEV = ((!isEmpty(seleccionado.get("IPRIDEV")))
								? (BigDecimal) seleccionado.get("IPRIDEV")
								: null);
                        // BUG 41143/229973 - 17/03/2016 - JAEG

						Map PRIMAS = (Map) seleccionado.get("PRIMAS");
                        if (!isEmpty(PRIMAS)) {
							IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU")
									: IPRIANU);
							IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR")
									: IPRITAR);
							IPRITOT = ((!isEmpty(PRIMAS.get("IPRITOT"))) ? (BigDecimal) PRIMAS.get("IPRITOT")
									: IPRITOT);
                        }

                        if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
							coincide = true;
							m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
									ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, IPRITOT, CTARMAN, CDETALLE,
									CMONCAP, CMONINT, TMONCAP, CVISIBLE, CGARPADRE, CNIVGAR, ICAPRECOMEND, IFRANQU,
									FINIVIG, FFINVIG, CCOBPRIMA, IPRIDEV); // BUG 41143/229973 - 17/03/2016 - JAEG
                            // SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital   
                            if (new BigDecimal(7).equals(CTIPCAP)) {
                                m1.put("LISTACAPITALES", LISTACAPITALES);
                            }
                            break;
                        }
                    }
                }

                if (!coincide) {
					m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null); // BUG 41143/229973 - 17/03/2016 - JAEG

                }

				Map m2 = new HashMap();
                m2.put("OB_IAX_GARANTIAS", m1);
				if (m1.get("CTIPGAR") != null) {
					int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

					if (!isEmpty(ctip) && ctip != 8) {
                        listaGarantias.add(m2);
                    }
                }
            }
        }
		listaGarantias = reestructurarGarantias(request, listaGarantias);
		logger.debug("LISTA FINAL->" + listaGarantias);
        return listaGarantias;
    }
    
    private void eliminarAtributosSession(HttpServletRequest request) {

        request.getSession().removeAttribute("lstsaldodeutors");
        request.getSession().removeAttribute("faceptar");
    }

    private void limpiaAtributosSession(HttpServletRequest request) {
        request.getSession().removeAttribute("faceptar");
        request.getSession().removeAttribute("lstsaldodeutors");
        request.getSession().removeAttribute("axisctr_parametrosGarantias");
        request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
        request.getSession().removeAttribute("axisctr100_datosGestion");
        request.getSession().removeAttribute("axisctr_datosGestion.CFORPAG");
        request.getSession().removeAttribute("axisctr100_datosRiesgo");
        request.getSession().removeAttribute("axisctr_opcionesDatosRenta");
        request.getSession().removeAttribute("TNATRIE");
        request.getSession().removeAttribute("axisctr100_selectedPerson");
        request.getSession().removeAttribute("lstperrevision");
        request.getSession().removeAttribute("num_garantias");
        request.getSession().removeAttribute("");
        request.getSession().removeAttribute("axisctr_CREVALI");
        request.getSession().removeAttribute("axisctr_PREVALI");
        request.getSession().removeAttribute("SPERSON");
        request.getSession().removeAttribute("NRIESGO");
        request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
        request.getSession().removeAttribute("axisctr_datosGestion");
        request.getSession().removeAttribute("axisctr100_preguntasPoliza");
        request.getSession().removeAttribute("axisctr100_pregQuestSalut");
        request.getSession().removeAttribute("axisctr100_pregDespeses");
        request.getSession().removeAttribute("axisPreguntas");
        request.getSession().removeAttribute("axisctr100_datosRiesgo");
        request.getSession().removeAttribute("axisctr100_datosGestion");
        request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
        request.getSession().removeAttribute("axisctr100_datosGestion_FEFECTO");
        request.getSession().removeAttribute("axisctr100_datosGestion_FVENCIM");
        request.getSession().removeAttribute("axisctr100_datosGestion_CDURACI");
        request.getSession().removeAttribute("axisctr100_datosGestion_NDURACI");
        request.getSession().removeAttribute("axisctr100_datosGestion_CRECFRA"); 
        request.getSession().removeAttribute("axisctr100_selectedPerson");
        request.getSession().removeAttribute("CACTIVI");
        request.getSession().removeAttribute("axisctr_multi_registro_tomadores");
		// ETM BUG 21924
        
        request.getSession().removeAttribute("axisctr100_datosGestion_PDTOCOM");
        request.getSession().removeAttribute("axisctr100_datosGestion_CTIPRETR");
        request.getSession().removeAttribute("axisctr100_datosGestion_CINDREVFRAN");
        request.getSession().removeAttribute("axisctr100_datosGestion_PRECARG");
        request.getSession().removeAttribute("axisctr100_datosGestion_PDTOTEC");
        request.getSession().removeAttribute("axisctr100_datosGestion_PRECCOM");
    }
    
    public void m_contratar(HttpServletRequest request, Axisctr100Action thisAction) {
        logger.debug("Axisctr100Service m_siguiente");
        try {
            eliminarAtributosSession(request);
			// Antes de continuar con la emision llamamos a la funcion grabar emision con el
			// parametro recogido
			String RESEMI = getCampoTextual(request, "RESEMI");
            
       //     m_grabar_preguntas(request, thisAction);
			HashMap m2 = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m2);
			request.setAttribute("PLSTAVISOS", m2.get("PLSTAVISOS"));
                
			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PREG_COND_TOMASEG", SPRODUC);
				logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
				BigDecimal PREG_COND_TOMASEG = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
                
				if (PREG_COND_TOMASEG.intValue() == 1) {
					BigDecimal ASEGCOND = getCampoNumerico(request, "ASEGCOND");
					BigDecimal TOMCOND = getCampoNumerico(request, "TOMCOND");
					BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
                
					if (!isEmpty(ASEGCOND) || !isEmpty(TOMCOND)) {
                         
						Map map = new PAC_IAX_PRODUCCION_AUT(
								((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
								.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(
										isEmpty(NRIESGO) ? new BigDecimal(1) : NRIESGO);
                         logger.debug(map);
						List<Map> T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(T_IAX_AUTCONDUCTORES)) {
							BigDecimal SPERSON = (BigDecimal) ((HashMap) ((HashMap) T_IAX_AUTCONDUCTORES.get(0))
									.get("OB_IAX_AUTCONDUCTORES")).get("SPERSON");
                                 
							if (!isEmpty(TOMCOND)) {
								m = new PAC_IAX_SIMULACIONES(
										((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
										.ejecutaPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(SPERSON);
                                     logger.debug(m);
                                 }
                                 
							if (!isEmpty(ASEGCOND)) {
								m = new PAC_IAX_PRODUCCION(
										((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
										.ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(SPERSON, null);
                                     logger.debug(m);
                                 }
                         }
                         
                     }
            
                }
            
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(new BigDecimal(RESEMI), null);
				logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
                tratarRETURNyMENSAJES(request, m, false);
				/// COMPROBAR RETURN=1 ERROR....
                // BUG 9195 ACC 20022009
                try {
                    request.getSession().removeAttribute("NRIESGO");
				} catch (Exception e) {
    
                } // BUG 9195 ACC 20022009
				BigDecimal ret = (BigDecimal) m.get("RETURN");
				if (ret != null && ret.intValue() == 1) {
					// en caso de error en la simulaci�n de la contrataci�n de la poliza, se sigue
					// con modo simulaciones
                    AbstractDispatchAction.topPila(request, "CMODO", "SIMULACION");                        
				} else {
					AbstractDispatchAction.topPila(request, "ACCION_PSU", null);// Accion psu lo quitamos si vamos a
																				// contratar
					request.getSession().removeAttribute("psu_critica");
                    AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
                }
                AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal("1"));
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, "Axisctr100", "BT_EMITIR"));
        }
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr100Service - m�todo m_siguiente", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }

    }
    
    // INI BUG 41143/229973 - 17/03/2016 - JAEG    
    /**
     * M�todo que efect�a cambios al modificar fechas de vigencia en garant�a
	 * 
     * @param request
     * @param thisAction
     */
    public void m_actualiza_vigencia(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug(
				"-------------------------------------------------------------------------------------->Axisctr207Service m_actualiza_vigencia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
            Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIGH"));
            Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIGH"));
            
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIASVIGENCIA(NRIESGO, CGARANT, FINIVIG, FFINVIG);
            
			BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
            if (RETURN.equals(new BigDecimal("0"))) {
                request.getSession().setAttribute("hayCambios", "true");                
                initGarantias(request, usuario, "SEL_GAR");    
            }
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualiza_vigencia", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }
    
    /**
     * M�todo que efect�a cambios al activar si cobra prima la garant�a
	 * 
     * @param request
     * @param thisAction
     */
    public void m_actualiza_cobraprima(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug(
				"-------------------------------------------------------------------------------------->Axisctr207Service m_actualiza_vigencia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CCOBPRIMA = getCampoNumerico(request, "CCOBPRIMA");
            
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIASCOBPRIMA(NRIESGO, CGARANT, CCOBPRIMA);
            
			BigDecimal RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
            if (RETURN.equals(new BigDecimal("0"))) {
                request.getSession().setAttribute("hayCambios", "true");                
                initGarantias(request, usuario, "SEL_GAR");    
            }
		} catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - m�todo m_actualiza_vigencia", e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
        }
    }    
    // INI BUG 41143/229973 - 17/03/2016 - JAEG    
	
	public void m_guardar(HttpServletRequest request) {
        logger.debug("Axisctr207Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        AjaxContainerService ajax = new AjaxContainerService();
        
        try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
            
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
            
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONTROL_EMISION();
            
            Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA();
            
            String mens = "";
            
            tratarRETURNyMENSAJES(request, map);
            
			if (!isEmpty(map.get("MENSAJES"))) {
				List mensajes = (List) map.get("MENSAJES");
	            
	            Map mensaje = (Map) mensajes.get(0);
				mensaje = (Map) mensaje.get("OB_IAX_MENSAJES");
	            
	            mens = mensaje.get("TERROR").toString();
            }
            
            logger.debug(map);
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

            if (CMODO.equals("GENERAL"))
                AbstractDispatchAction.topPila(request, "CMODO", request.getSession().getAttribute("CMODO"));
            else
				request.getSession().setAttribute("CMODO", CMODO);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "ONPOLIZA", "OSSEGURO" });
            
             if (resultadoAjax[0].equals(new BigDecimal(0))) {  
                
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_BORRAR_SIMULACIONES(
						AxisBaseService.stringToBigDecimal(String.valueOf(resultadoAjax[2])));
                request.getSession().setAttribute("mensaje_ok", mens);
                
            }
        } catch (Exception e) {
            logger.error("Error en el servicio Axisctr207Service - mtodo m_guardar",  e);
            ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }        
    }
	
}
