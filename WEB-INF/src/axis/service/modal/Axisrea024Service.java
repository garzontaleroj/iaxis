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

public class Axisrea024Service extends AxisBaseService {
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
		logger.debug("Axisrea024Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Desplegables
		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String MODO = getCampoTextual(request, "MODO");

			String CCAMPO = getCampoTextual(request, "CCAMPO");
			BigDecimal CCLAVE = getCampoNumerico(request, "CLAVE");

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			// if("MOD".equals(MODO)){
			// /* TODO: Hay que a�adir el par�metro ramo */
			// Map map_formulas = new
			// PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_REA__F_GET_REAFORMULA(SCONTRA,NVERSIO,CRAMO,SPRODUC,CACTIVI,CGARANT,CCAMPO,CCLAVE);
			//
			// }

			this.m_obtener_combos(request);
			this.cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea024Service.m_form", e);
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
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_axis_listValores_rea = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map_tipo_formula = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCODCAMPO(new BigDecimal("7"));
			List ListaTipoFormula = (List) tratarRETURNyMENSAJES(request, map_tipo_formula, false);
			logger.debug(map_tipo_formula);
			formdata.put("ListaTipoFormula", ListaTipoFormula);
			ListaTipoFormula = null;

			Map map_formulas = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS_UTILI(new BigDecimal("7"));
			logger.debug(map_formulas);
			List ListaFormulas = (List) tratarRETURNyMENSAJES(request, map_formulas, false);
			formdata.put("ListaFormulas", ListaFormulas);

			ListaFormulas = null;

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea024Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea023Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

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

			/*
			 * Recuperamos las garantias: No dependen de nada. Si el SPRODUC y el CRAMO
			 * est�n informados se caragarn los que corresponda
			 */
			map_garantias = (HashMap) this.dbGetGarantia(request, usuario, CRAMO, SPRODUC);
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

			logger.error("Error en el servicio Axisrea023Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
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
	public void m_ajax_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea024Service m_ajax_guardar");
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
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			BigDecimal CCLAVE = getCampoNumerico(request, "CLAVE");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REAFORMULA(SCONTRA, NVERSIO, CRAMO, SPRODUC, CACTIVI,
					CGARANT, CCAMPO, CCLAVE);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(resultado + "******************************************************" + map);

			// ajax.guardarContenidoFinalAContenedorAjax(map);
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea024Service - m�todo m_ajax_grabar", e);
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
			Map map = this.dbGetGarantia(request, usuario, CRAMO, SPRODUC);
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

	private Map dbGetGarantia(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, null);
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

	private Map adapta_map(HttpServletRequest request, Map mapa_origen, UsuarioBean usuario) throws Exception {

		Map mapa_fin = null;

		ArrayList lista_valores = (ArrayList) tratarRETURNyMENSAJES(request, mapa_origen, false);

		ArrayList lista_aux = null;
		if (lista_valores != null && lista_valores.size() >= 0) {
			for (int i = 0; i <= lista_valores.size(); i++) {
				HashMap map_aux = new HashMap();
				BigDecimal codigo = (BigDecimal) ((HashMap) lista_valores.get(i)).get("CATRIBU");
				String descripcion = (String) ((HashMap) lista_valores.get(i)).get("TATRIBU");
				map_aux.put("CGARANT", codigo);
				map_aux.put("TGARANT", descripcion);
				lista_aux.add(map_aux);
			}
		}

		mapa_fin.put("RETURN", lista_aux);

		logger.debug("Map de productos ------------------------------------------------->" + mapa_fin);
		return mapa_fin;
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_cambia_contrato(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualizar_combos");
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
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
