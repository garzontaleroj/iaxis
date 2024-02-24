package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea026Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea026Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Desplegables
		try {
			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea004Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */
	private

			void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
					throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {

			/* Recupera combo productos */
			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");

			/*
			 * *****************************************************************************
			 * *********
			 */
			/*
			 * ************************* Recuperar CRAMO - SPRODUC - CGARANT
			 * ************************
			 */
			/*
			 * *****************************************************************************
			 * *********
			 */
			List listaRamos = new ArrayList();
			HashMap map_ramos = new HashMap();

			List listaProductos = new ArrayList();
			HashMap map_productos = new HashMap();

			List listaGarantias = new ArrayList();
			HashMap map_garantias = new HashMap();

			List listaActividades = new ArrayList();
			HashMap map_actividades = new HashMap();

			BigDecimal CRAMO = null;
			if (!isEmpty(getCampoNumerico(request, "CRAMO"))) {
				CRAMO = getCampoNumerico(request, "CRAMO"); // Cogemos el valor de pantalla
			}

			/* Recuperamos los ramos */
			map_ramos = (HashMap) this.dbGetRamo(request, usuario, CEMPRES);
			listaRamos = (List) tratarRETURNyMENSAJES(request, map_ramos, false);
			formdata.put("listaRamo", listaRamos);
			logger.debug(map_ramos);

			if (CRAMO != null) {
				/* Recuperamos los productos siempre y cuando est� informado el RAMO */
				map_productos = (HashMap) this.dbGetProducto(request, usuario, null, CEMPRES, CRAMO);
				listaProductos = (List) tratarRETURNyMENSAJES(request, map_productos, false);
			}
			formdata.put("listaProducto", listaProductos);
			logger.debug(map_productos);

			BigDecimal SPRODUC = null;
			if (!isEmpty(getCampoNumerico(request, "SPRODUC"))) {
				SPRODUC = getCampoNumerico(request, "SPRODUC"); // Cogemos el valor de pantalla
			}

			BigDecimal CACTIVI = null;
			if (!isEmpty(getCampoNumerico(request, "CACTIVI"))) {
				CACTIVI = getCampoNumerico(request, "CACTIVI"); // Cogemos el valor de pantalla
			}
			/*
			 * Recuperamos las garantias: No dependen de nada. Si el SPRODUC y el CRAMO
			 * est�n informados se caragarn los que corresponda
			 */
			map_actividades = (HashMap) this.dbGetActividad(request, usuario, SPRODUC, CRAMO);
			listaActividades = (List) tratarRETURNyMENSAJES(request, map_actividades, false);
			formdata.put("listaActividad", listaActividades);
			logger.debug(map_actividades);

			/*
			 * Recuperamos las garantias: No dependen de nada. Si el SPRODUC y el CRAMO
			 * est�n informados se caragarn los que corresponda
			 */
			map_garantias = (HashMap) this.dbGetGarantia(request, usuario, CRAMO, SPRODUC, CACTIVI);
			listaGarantias = (List) tratarRETURNyMENSAJES(request, map_garantias, false);
			formdata.put("listaGarantia", listaGarantias);
			logger.debug(map_garantias);

			/*
			 * *****************************************************************************
			 * *********
			 */
			/*
			 * ************************* Recuperar CONTRATO - VERSIONES
			 * ************************
			 */
			/*
			 * *****************************************************************************
			 * *********
			 */

			/* Recupera combo contratos */
			Map map_contrato = (HashMap) this.dbGetContrato(request, usuario, CEMPRES);
			List listaContrato = (List) tratarRETURNyMENSAJES(request, map_contrato, false);
			formdata.put("listaContrato", listaContrato);
			logger.debug(map_contrato);

			/* Recupera combo versiones */
			List listaVersion = new ArrayList();
			HashMap map_version = new HashMap();
			if (!isEmpty(map_contrato) && listaContrato.size() >= 1) {
				/*
				 * Extraemos el valor del SCONTRA DE LA PRIMERA FILA, la primera vez que
				 * entramos en la pantalla
				 */

				BigDecimal SCONTRA = null;
				if (!isEmpty(getCampoNumerico(request, "SCONTRA"))) {
					SCONTRA = getCampoNumerico(request, "SCONTRA"); // Cogemos el valor de pantalla
				} else {
					SCONTRA = (BigDecimal) ((HashMap) listaContrato.get(0)).get("SCONTRA"); // SCONTRA
				}

				if (!isEmpty(SCONTRA)) {
					map_version = (HashMap) this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
					listaVersion = (List) tratarRETURNyMENSAJES(request, map_version, false);
				}
			}

			formdata.put("listaVersion", listaVersion);
			logger.debug(map_version);

			/* Borramos arrays auxiliares */
			listaProductos = null;
			listaGarantias = null;
			listaContrato = null;
			listaVersion = null;

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea026Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos TRAMOS a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public

			void m_ajax_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea026Service m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal ILIMSUB = getCampoNumerico(request, "ILIMSUB");

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_AGR_CONTRATOS(SCONTRA, NVERSIO, CRAMO, CMODALI, null,
					CTIPSEG, SPRODUC, CACTIVI, CGARANT, ILIMSUB);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(resultado + "******************************************************" + map);

			ajax.rellenarPlAContenedorAjax(map);

			// ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea026Service - m�todo m_ajax_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_garantia(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualiza_garantia");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			Map map = this.dbGetGarantia(request, usuario, CRAMO, SPRODUC, CACTIVI);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualiza_garantia", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_producto(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualiza_producto");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = this.dbGetProducto(request, usuario, null, CEMPRES, CRAMO);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualiza_producto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_version(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualiza_version");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			Map map = this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualiza_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request funciones de llamada a BBDD
	 */
	private Map dbGetVersion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA, BigDecimal CEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRA);
		logger.debug("Map de version  ------------------------------------------------------>" + m);
		return m;
	}

	private Map dbGetContrato(HttpServletRequest request, UsuarioBean usuario, BigDecimal CEMPRES) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(CEMPRES);
		logger.debug("Map de contratos ------------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetGarantia(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC,
			BigDecimal CACTIVI) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, CACTIVI);
		logger.debug("Map de garantias ------------------------------------------------------>" + m);
		return m;
	}

	private Map dbGetRamo(HttpServletRequest request, UsuarioBean usuario, BigDecimal EMPRESA) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, EMPRESA);
		logger.debug("Map de actividades ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetProducto(HttpServletRequest request, UsuarioBean usuario, String CTIPO, BigDecimal CEMPRES,
			BigDecimal CRAMO) throws Exception {
		Map m = // new
				// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(CTIPO,CEMPRES,CRAMO);
				new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, new BigDecimal("0"));
		logger.debug("Map de productos ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetActividad(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC, BigDecimal CRAMO)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
		logger.debug("Map de actividades ------------------------------------------------->" + m);
		return m;
	}

}
