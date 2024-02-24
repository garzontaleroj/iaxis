package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr060Service.java
 * 
 * @since Java 5.0
 */
public class Axisctr060Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr060Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			logger.debug("--> CRAMO:" + CRAMO);

			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CRAMO", CRAMO);

			String TBUSCAR = this.getCampoTextual(request, "TBUSCAR");
			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NSOLICI = this.getCampoNumerico(request, "NSOLICI");

			BigDecimal CINTERMEDIARIO = this.getCampoNumerico(request, "CINTERMEDIARIO");
			BigDecimal CSUCURSAL = this.getCampoNumerico(request, "CSUCURSAL");
			BigDecimal CADN = this.getCampoNumerico(request, "CADN");

			String MODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CERTIFICADOSCERO(SPRODUC, NPOLIZA, NSOLICI, TBUSCAR,
							CINTERMEDIARIO, CSUCURSAL, CADN, MODO);
			logger.debug(map);

			request.setAttribute("LST_POLIZAS", tratarRETURNyMENSAJES(request, map));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr060Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_siguiente(HttpServletRequest request) {
		logger.debug("Axisctr060Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_NPOLIZA(NPOLIZA);
			logger.debug(map);

			// Bug 28263/153355 - 01/10/2013 - AMC
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				if (!isEmpty(NNUMCASO) || (!isEmpty(NCASO_BPM) && !isEmpty(NSOLICI_BPM))) {
					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_SET_CASOBPM(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map);
				}
			}

			// if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
			if (isEmpty(map.get("MENSAJES"))) {
				map = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPMCERTIF(NCASO_BPM, NSOLICI_BPM);
				logger.debug(map);
			}

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				// Ir a la siguiente pantalla del flujo
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr060Service - m�todo m_siguiente", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		logger.debug("Axisctr060Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr060Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal donde = getCampoNumerico(request, "DONDE");
			String CONDICION = null;
			if (donde.equals(new BigDecimal(2)))
				CONDICION = "CTIPAGE_SUC";
			else if (donde.equals(new BigDecimal(3)))
				CONDICION = "CTIPAGE_ADN";
			else if (donde.equals(new BigDecimal(4)))
				CONDICION = "NUEVA_PRODUCCION";

			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
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
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr060Service - m�todo m_ajax_cargar_casobpm", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
