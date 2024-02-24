package axis.service.axis;

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
import axis.mvc.control.axis.Axisrea025Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea025Service.java : Asociaci�n de productos a contratos 20/08/2008
 * 
 * @since Java 5.0
 */
public class Axisrea025Service extends AxisBaseService {
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
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea025Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			try {
				this.m_obtener_combos(request);
			} catch (Exception e) {
				logger.error("Error en el servicio Axisrea025Service - m�todo m_form", e);
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea025Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea025Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			/* Recupera combo productos */
			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
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
				} // else{
					// SCONTRA = (BigDecimal)((HashMap)listaContrato.get(0)).get("SCONTRA");
					// //SCONTRA
					// }

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

			logger.error("Error en el servicio Axisrea025Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar_contrato(HttpServletRequest request, Axisrea025Action thisAction) {
		logger.debug("Axisrea025Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_MOD");
			BigDecimal SPLENO = getCampoNumerico(request, "SPLENO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_OBJETO_TRAMOS();

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
				logger.debug("<----- ENTRO IF ---->" + map);
				request.setAttribute("grabarr", new BigDecimal(0));
				formdata.clear();
			} else
				m_actualizar_displays(request, thisAction);

			// request.setAttribute("grabarOk",
			// BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map,false)));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea025Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo para Recuperar un registro de tramos
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public

			void m_actualizar_displays(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea025Service m_ActualizarDisplays");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el m�todo axisrea023Service.m_Actualizar_display", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_producto(HttpServletRequest request, Axisrea025Action thisAction) {
		logger.debug("Axisrea025Service m_borrar_tramo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_DEL");
			BigDecimal SVERSION = getCampoNumerico(request, "SVERSION_DEL");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO_DEL");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI_DEL");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT_DEL");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG_DEL");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI_DEL");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT_DEL");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC_DEL");

			Map map_borrar = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_DEL_AGR_CONTRATOS(SCONTRA, SVERSION, CRAMO, CMODALI, CCOLECT, CTIPSEG,
							SPRODUC, CACTIVI, CGARANT);
			BigDecimal borrar = (BigDecimal) tratarRETURNyMENSAJES(request, map_borrar, false);

			m_actualizar_displays(request, thisAction);

			m_recargar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea025Service - m�todo m_borrar_tramo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_recargar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("axisrea023Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal SVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			Map map_productos = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_AGR_CONTRATOS(SCONTRA, SVERSION, CRAMO, CMODALI, CCOLECT, CTIPSEG,
							SPRODUC, CACTIVI, CGARANT);
			List listaProductos = (List) tratarRETURNyMENSAJES(request, map_productos, false);
			formdata.put("listaProductos", listaProductos);
			logger.debug(map_productos);
			listaProductos = null;

			m_obtener_combos(request); // Permite recuperar el valor de los combos de pantalla

		} catch (Exception e) {
			logger.error("Error en el m�todo axisrea023Service.m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("axisrea023Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal SVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			Map map_productos = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_AGR_CONTRATOS(SCONTRA, SVERSION, CRAMO, CMODALI, CCOLECT, CTIPSEG,
							SPRODUC, CACTIVI, CGARANT);
			List listaProductos = (List) tratarRETURNyMENSAJES(request, map_productos, false);
			formdata.put("listaProductos", listaProductos);
			logger.debug(map_productos);
			listaProductos = null;

			m_obtener_combos(request); // Permite recuperar el valor de los combos de pantalla

		} catch (Exception e) {
			logger.error("Error en el m�todo axisrea023Service.m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisrea025Service m_ajax_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			Map map = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea025Service - m�todo m_ajax_actualizar_combos", e);
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
	public void m_ajax_actualiza_actividad(HttpServletRequest request) {
		logger.debug("Axisarea025Service m_ajax_actualiza_actividad");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			Map map = this.dbGetActividad(request, usuario, SPRODUC, CRAMO);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea025Service - m�todo m_ajax_actualiza_actividad", e);
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
		logger.debug("Map de ramos ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetActividad(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC, BigDecimal CRAMO)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
		logger.debug("Map de actividades ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetProducto(HttpServletRequest request, UsuarioBean usuario, String CTIPO, BigDecimal CEMPRES,
			BigDecimal CRAMO) throws Exception {
		Map m = new HashMap();
		if (CRAMO != null) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, new BigDecimal("0"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, null);
		}
		logger.debug("Map de productos ------------------------------------------------->" + m);
		return m;
	}

}
