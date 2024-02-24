package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPAGA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm073Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisadm073Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm073Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm073Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm073Action thisAction) {
		logger.debug("Axisadm073Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8));
			logger.debug(map);
			LISTVALORES.put("LSTTIPREC", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(73));
			logger.debug(map);
			LISTVALORES.put("LSTMOTDEVOLU", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2),
					usuario.getCidioma(), null);
			logger.debug(map);
			LISTVALORES.put("LSTOFICINAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_LSTCARTAS();
			logger.debug(map);
			LISTVALORES.put("LSTCARTAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(204));
			logger.debug(map);
			LISTVALORES.put("LSTACCION", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			//
			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES")))
					: this.getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());
			else
				formdata.put("CEMPRES", CEMPRES);

			// formdata.put("CAGENTE",usuario.getCagente());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm073Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisadm073Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal pPCRAMO = getHiddenCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getHiddenCampoNumerico(request, "SPRODUC");
			BigDecimal pPCTIPREC = getHiddenCampoNumerico(request, "CTIPREC");
			java.sql.Date pPFACCINI = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FACCDESDE"));
			java.sql.Date pPFACCFIN = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FACCHASTA"));
			BigDecimal pPNPOLIZA = getHiddenCampoNumerico(request, "NPOLIZA");
			BigDecimal pPNCERTIF = getHiddenCampoNumerico(request, "NCERTIF");
			BigDecimal pPNRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			BigDecimal pPNIMPAGAD = getHiddenCampoNumerico(request, "NIMPAGO");
			BigDecimal pPCOFICINA = getHiddenCampoNumerico(request, "COFICINA");
			BigDecimal pPCAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			BigDecimal pPCMOTIVO = getHiddenCampoNumerico(request, "MOTDEVOLU");
			BigDecimal pPCCARTA = getHiddenCampoNumerico(request, "MCARTA");
			BigDecimal pPCACTIMP = getHiddenCampoNumerico(request, "CACCION");

			Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_IMPAGADOS(pPSSEGURO, pPCRAMO, pPSPRODUC, pPCTIPREC,
					pPFACCINI, pPFACCFIN, pPNPOLIZA, pPNCERTIF, pPNRECIBO, pPNIMPAGAD, pPCOFICINA, pPCAGENTE, pPCMOTIVO,
					pPCCARTA, pPCACTIMP);
			logger.debug(map);
			BigDecimal result = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			List impagados = (List) map.get("PCURSOR");
			logger.debug("IMPAGADOS: " + impagados);
			formdata.put("IMPAGADOS", impagados);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm073Service - m�todo m_buscar", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		// Carga de ramos de la BD
		Map map = null;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}

		logger.debug("----Buscamos ramos empresa:" + pCOMPANI + " map:" + map);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CEMPRES");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, pCOMPANI, null);
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		logger.debug("---> Axisadm034Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CEMPRES"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm034Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisadm034Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CEMPRES")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} /*
				 * else
				 * ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request,usuario
				 * ));
				 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm034Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisadm034Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm034Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
