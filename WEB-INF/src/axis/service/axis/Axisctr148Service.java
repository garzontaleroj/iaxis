package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr148Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr148Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisctr148Action thisAction) {
		logger.debug("Axisctr148Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisctr148Action thisAction) {
		logger.debug("Axisctr148Service m_form");
		try {
			this.formattingNumericValues(request);
			if (!isEmpty(this.getCampoTextual(request, "origen"))
					&& this.getCampoTextual(request, "origen").equals("axisctr009"))
				AbstractDispatchAction.topPila(request, "CMODO", "GENERAL");
			logger.debug("----- riesgo session m_form:" + request.getParameterMap());
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			Map parproducto = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("AUT_ANYOTEXTO", SPRODUC);
			logger.debug(parproducto);

			request.getSession().setAttribute("AUT_ANYOTEXTO", this.tratarRETURNyMENSAJES(request, parproducto));
			initDatosAutos(request);
			cargarDatosCombos(request);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// se comprueba si la versi�n tiene versi�n homologa
			String cversion = this.getHiddenCampoTextual(request, "CVERSION");
			BigDecimal nriesgo = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal sseguro = (BigDecimal) formdata.get("SSEGURO");
			Map hayVersionHomologa = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_HAY_HOMOLOGACION(cversion, sseguro, nriesgo);
			String msgVersionHomologa = (String) hayVersionHomologa.get("PMENSAJEMOSTRAR");
			HashMap orden;
			if (msgVersionHomologa != null)
				request.setAttribute("msgVersionHomologa", msgVersionHomologa);

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO")))
				formdata.put("SSEGURO", (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"));

			// BUG 26435/146197: A�adimos el campo CMODO en el formdata (Si empty ==
			// GENERAL)
			if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO")))
				formdata.put("CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			else
				formdata.put("CMODO", "GENERAL");

			try {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				// BUG: 0026968: RSAG101 - Producto RC Argentina. Incidencias (14/5)
				PAC_IAX_PARAM param = new PAC_IAX_PARAM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("ORDEN_DATOS_VEHICULO", usuario.getCempres());

				if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {
					request.getSession().setAttribute("Mostrar", 1);
				} else {
					request.getSession().setAttribute("Mostrar", 0);
				}

			} catch (Exception e) {
				e.toString();
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
		if (isEmpty(NRIESGO))
			NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		// Lista marca
		Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(null);
		logger.debug(map);
		request.setAttribute("MARCAS", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista combustible
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(291));
		logger.debug(map);
		request.setAttribute("COMBUSTIBLE", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista tipo matr�cula
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(290));
		logger.debug(map);
		request.setAttribute("TMATRICULA", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista colores
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(440));
		logger.debug(map);
		request.setAttribute("COLORES", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista Km
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(295));
		logger.debug(map);
		request.setAttribute("KM", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista Garaje
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(296));
		logger.debug(map);
		request.setAttribute("GARAJE", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista Tipo remolque
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(297));
		logger.debug(map);
		request.setAttribute("DESREMOLQUE", (List) tratarRETURNyMENSAJES(request, map, false));
		// Lista tipo vehicle
		map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();
		logger.debug(map);

		String CMARCA = getCampoTextual(request, "CMARCA");

		Map m = new HashMap();
		if (!isEmpty(CMARCA)) {

			m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(CMARCA, null);
			logger.debug(m);

		} else {
			m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();
			logger.debug(m);
		}

		request.setAttribute("LSTCTIPVEH", (List) tratarRETURNyMENSAJES(request, m));

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		String CTIPVEH = this.getHiddenCampoTextual(request, "CTIPVEH");
		if (!isEmpty(CTIPVEH)) {
			Map map2 = new HashMap();
			// Lista Clase vehiculos
			if (!isEmpty(CMARCA)) {
				// Lista Clase vehiculos
				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(CMARCA, CTIPVEH);
			} else {
				// Lista Clase vehiculos
				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(CTIPVEH);

			}
			request.setAttribute("LSTCCLAVEH", (List) tratarRETURNyMENSAJES(request, map2));
		}
		String CVERSION = this.getHiddenCampoTextual(request, "CVERSION");
		if (!isEmpty(CVERSION)) {
			Map map2 = new HashMap();
			// Lista Clase vehiculos

			map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(CVERSION, NRIESGO);
			request.setAttribute("LSTANYOS", (List) tratarRETURNyMENSAJES(request, map2));

		}
		Map listValores = new HashMap();

		// Lista pa�ses
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		logger.debug(map);
		listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
		formdata.put("listValores", listValores);

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(758));
		logger.debug(map);
		request.setAttribute("LSTCAMPERO", (List) tratarRETURNyMENSAJES(request, map, false));
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(760));
		logger.debug(map);
		request.setAttribute("LSTPINTURA", (List) tratarRETURNyMENSAJES(request, map, false));
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(SPRODUC);
		logger.debug(map);
		request.setAttribute("LSTPESOS", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(761));
		logger.debug(map);
		request.setAttribute("LSTTIPCARROCERIA", (List) tratarRETURNyMENSAJES(request, map, false));
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000907));
		logger.debug(map);
		request.setAttribute("LSTCAJA", (List) tratarRETURNyMENSAJES(request, map, false));
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000904));
		logger.debug(map);
		request.setAttribute("LSTSERVICIO", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000905));
		logger.debug(map);
		request.setAttribute("LSTORIGEN", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(307));
		logger.debug(map);
		request.setAttribute("LSTTRANSPORTE", (List) tratarRETURNyMENSAJES(request, map, false));

		// BUG 30256/166723 - 21/02/2014 - RCL - Lista de CTRANSMISION (8000937)
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000937));
		logger.debug(map);
		request.setAttribute("LSTTRANSMISION", (List) tratarRETURNyMENSAJES(request, map, false));

	}

	/**
	 * Determina la pantalla anterior a ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		try {
			this.formattingNumericValues(request);
			logger.debug("Axisctr148Service m_anterior");
			m_guardarEstadoPantalla(request, thisAction);
			// m_validar(request, thisAction, Constantes.ANTERIOR);
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr148Service m_siguiente");
		this.formattingNumericValues(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		m_guardarEstadoPantalla(request, thisAction);
		/*
		 * try{ dbGrabarObjetoDb(request, usuario); } catch (Exception e) {
		 * logger.error("Error en el servicio Axisctr148Service - m�todo m_siguiente",
		 * e);
		 * 
		 * }
		 */
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
			if (m_vehiculo_matricula(request, thisAction))
				m_validar(request, thisAction, Constantes.SIGUIENTE);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_guardar_simulacion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr148Service m_guardar_simulacion");
		this.formattingNumericValues(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		m_guardarEstadoPantalla(request, thisAction);

		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
			m_validar_simulacion(request, thisAction);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Funcion que recupera la lista de modelos dependiendo de la marca del vehiculo
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_modelo(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CVALOR = getCampoTextual(request, "CVALOR");
			String CTIPVEH = getCampoTextual(request, "CTIPVEH");
			String CCLAVEH = getCampoTextual(request, "CCLAVEH");
			BigDecimal CTRAMIT = null;
			if (request.getParameter("CTRAMIT") != null) {
				CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			}

			logger.debug("---------- VALOR marca  :" + CVALOR);
			if (!isEmpty(CVALOR)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(CTIPVEH, CCLAVEH, CVALOR, CTRAMIT);
				logger.debug(map);
				if (!isEmpty(map)) {
					List modelos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(modelos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_modelo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Funcion que recupera el numero de puertas dependiendo de la marca y modelo
	 * del vehiculo
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_puertas(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMARCA = getCampoTextual(request, "CMARCA");
			String CMODELO = getCampoTextual(request, "CMODELO");
			request.removeAttribute("OB_IAX_AUTRIESGOS");
			logger.debug("---------- VALOR marca  :" + CMARCA + " modelo:" + CMODELO);
			if (!isEmpty(CMARCA) && !isEmpty(CMODELO)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(CMARCA, CMODELO);
				logger.debug(map);
				if (!isEmpty(map)) {
					List puertas = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(puertas);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_modelo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void initDatosAutos(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_LISTVALORES_AUT pac_axis_listvalores = new PAC_IAX_LISTVALORES_AUT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map listasDatosAutos = new HashMap();
		BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

		// BUG 0027876/0153187 - JSV (20/09/2013) - INI

		if (isEmpty(NRIESGO) && !isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")))
			NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (!isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO_034")))
			NRIESGO = new BigDecimal((String) AbstractDispatchAction.topPila(request, "NRIESGO_034"));
		// BUG 0027876/0153187 - JSV (20/09/2013) - FIN

		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

		BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

		String MODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		logger.debug("----- riesgo pila:" + NRIESGO);

		if (!isEmpty(getCampoNumerico(request, "NRIESGO")))
			NRIESGO = getCampoNumerico(request, "NRIESGO");

		logger.debug("----- riesgo session:" + getCampoNumerico(request, "NRIESGO"));

		// Recuperaci�n riesgo
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("----- riesgo:" + NRIESGO);

		if (isEmpty(NRIESGO)) {
			/* Grabar Datos AUTOS */
			Map grabarDatosAutos = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(SSEGURO, NRIESGO, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null);

			// Cargo el numero de riesgo
			logger.debug("--- Nuevo riesgo:" + grabarDatosAutos.get("PNRIESGO_OUT"));

			if (!isEmpty(grabarDatosAutos.get("PNRIESGO_OUT"))) {
				AbstractDispatchAction.topPila(request).put("NRIESGO", grabarDatosAutos.get("PNRIESGO_OUT"));
			}

			logger.debug(grabarDatosAutos);
			tratarRETURNyMENSAJES(request, grabarDatosAutos);
		} else {
			Map map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
			logger.debug("------ auto recuperado:" + map);
			map = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("OB_IAX_AUTRIESGOS", map);

			if (!isEmpty(map.get("NRIESGO"))) {
				AbstractDispatchAction.topPila(request).put("NRIESGO", map.get("NRIESGO"));
				formdata.putAll(map);

				PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map mmm = (Map) PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_TIENE_INSPEC_VIGENTE(SSEGURO, NMOVIMI,
						NRIESGO, String.valueOf((BigDecimal) map.get("CTIPMAT")), (String) map.get("CMATRIC"), SPRODUC,
						"", MODO);
				logger.debug(mmm + "mmm.get(\"PINSPECCION_VIGENTE\"):" + mmm.get("PINSPECCION_VIGENTE"));
				formdata.put("INSPECCION_VIGENTE", mmm.get("PINSPECCION_VIGENTE"));

				request.setAttribute("INSPECCION_VIGENTE", mmm.get("PINSPECCION_VIGENTE"));

				Map map2;
				if (!isEmpty(map.get("CMARCA"))) {
					// Lista modelos
					String CTIPVEH = getCampoTextual(request, "CTIPVEH");
					String CCLAVEH = getCampoTextual(request, "CCLAVEH");

					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(CTIPVEH, CCLAVEH,
									String.valueOf(map.get("CMARCA")), null);
					logger.debug("-------- marca no null:" + map2);
					request.setAttribute("MODELOS", (List) tratarRETURNyMENSAJES(request, map2, false));
				}

				if (!isEmpty(map.get("CMARCA")) && !isEmpty(map.get("CMODELO"))) {
					// Lista puertas
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(String.valueOf(map.get("CMARCA")),
									String.valueOf(map.get("CMODELO")));
					logger.debug("-------- modelo no null:" + map2);
					request.setAttribute("PUERTAS", (List) tratarRETURNyMENSAJES(request, map2, false));
				}

				logger.debug("---- CCLAVEH:" + map.get("CCLAVEH") + " CTIPVEH:" + map.get("CTIPVEH"));
				if (!isEmpty(map.get("CTIPVEH"))) {
					SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
					// Lista Usos
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(
									isEmpty(map.get("CCLAVEH")) ? "" : String.valueOf(map.get("CCLAVEH")),
									String.valueOf(map.get("CTIPVEH")), SPRODUC, null);
					logger.debug(map);
					logger.debug("-------- CCLAVEH y CTIPVEH no null:" + map2);
					request.setAttribute("USOS", (List) tratarRETURNyMENSAJES(request, map2, false));
				}

				if (!isEmpty(map.get("CUSO")) && !isEmpty(map.get("CCLAVEH")) && !isEmpty(map.get("CTIPVEH"))) {
					SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
					// Lista SubUsos
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTSUBUSO(String.valueOf(map.get("CCLAVEH")),
									String.valueOf(map.get("CTIPVEH")), String.valueOf(map.get("CUSO")), SPRODUC, null);
					logger.debug("-------- CCLAVEH,CTIPVEH y CUSO no null:" + map2);
					request.setAttribute("SUBUSOS", (List) tratarRETURNyMENSAJES(request, map2, false));
				}
				// Bug 25202 -- ECP-- 20/02/2013
				/*
				 * if (!isEmpty(map.get("NTARA"))) {
				 * SPRODUC=(BigDecimal)AbstractDispatchAction.topPila(request, "SPRODUC"); //
				 * Lista Pesos map2=new
				 * PAC_IAX_LISTVALORES_AUT((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(SPRODUC);
				 * logger.debug("-------- NTARA no null:"+map2); request.setAttribute("PESOS",
				 * (List)tratarRETURNyMENSAJES(request, map2, false)); }
				 */
				// BUG 30256/166723 - 21/02/2014 - RCL
				if (!isEmpty(map.get("CPESO"))) {
					SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
					// Lista Pesos
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTPESOS(SPRODUC);
					logger.debug("-------- CPESO no null:" + map2);
					request.setAttribute("PESOS", (List) tratarRETURNyMENSAJES(request, map2, false));
				}

				float total = 0;
				List accesorios;
				if (!isEmpty(map.get("ACCESORIOS"))) {
					accesorios = (List) map.get("ACCESORIOS");
					for (int a = 0; a < accesorios.size(); a++) {
						if (((BigDecimal) ((Map) ((Map) accesorios.get(a)).get("OB_IAX_AUTACCESORIOS")).get("CMARCADO"))
								.intValue() == 1)
							total = total + ((BigDecimal) ((Map) ((Map) accesorios.get(a)).get("OB_IAX_AUTACCESORIOS"))
									.get("IVALACC")).floatValue();
					}
					formdata.put("TOTALACC", total);
				}
			} else {
				formdata.put("SSEGURO", SSEGURO);
				/* Grabar Datos AUTOS */
				Map grabarDatosAutos = new PAC_IAX_PRODUCCION_AUT(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(SSEGURO, NRIESGO, null, null, null, null, null,
								null, null, null, null, null, null, null, null, null, null, null, null, null, null,
								null, null, null, null, null, null, null, null, null, null, null, null, null, null,
								null, null, null, null, null, null, null, null, null, null, null, null);

				// Cargo el numero de riesgo
				logger.debug("--- Nuevo riesgo:" + grabarDatosAutos.get("PNRIESGO_OUT"));

				if (!isEmpty(grabarDatosAutos.get("PNRIESGO_OUT"))) {
					AbstractDispatchAction.topPila(request).put("NRIESGO", grabarDatosAutos.get("PNRIESGO_OUT"));
				}

				logger.debug(grabarDatosAutos);
				tratarRETURNyMENSAJES(request, grabarDatosAutos);
			}

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Guarda las selecciones del usuario a BD, guarda las preguntas y las
	 * respuestas del usuario en BBDD y en axisctr_preguntasPoliza.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 **/
	private void m_guardarEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr148Service m_guardarDatos");
		try {
			// Guardamos en session los par�metros seleccionados / introducidos en la
			// pantalla
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			logger.debug("NRIESGO TOP PILA ::" + (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO"));
			logger.debug("SSEGURO TOP PILA  ::" + (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"));

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			logger.debug("SSEGURO :: " + SSEGURO);
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			if (!isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO_034")))
				NRIESGO = new BigDecimal((String) AbstractDispatchAction.topPila(request, "NRIESGO_034"));
			logger.debug("NRIESGO :: " + NRIESGO);
			BigDecimal NMOVIMI = getHiddenCampoNumerico(request, "NMOVIMI");
			logger.debug("NMOVIMI :: " + NMOVIMI);

			if (isEmpty(NMOVIMI))
				NMOVIMI = new BigDecimal(1);
			logger.debug("NMOVIMI DEF :: " + NMOVIMI);

			// Datos veh�culo
			String CMARCA = getHiddenCampoTextual(request, "CMARCA");
			logger.debug("CMARCA :: " + CMARCA);
			String CMODELO = getHiddenCampoTextual(request, "CMODELO");
			logger.debug("CMODELO :: " + CMODELO);
			String CVERSION = getHiddenCampoTextual(request, "CVERSION");
			logger.debug("CVERSION :: " + CVERSION);
			BigDecimal NPUERTAS = getCampoNumerico(request, "NPUERTAS") == null
					? getHiddenCampoNumerico(request, "NPUERTAS_HIDDEN")
					: getCampoNumerico(request, "NPUERTAS");
			logger.debug("NPUERTAS :: " + NPUERTAS);
			BigDecimal CCOMBUSTIBLE = getCampoNumerico(request, "CMOTOR");
			logger.debug("CCOMBUSTIBLE :: " + CCOMBUSTIBLE);

			String TRIESGO = getHiddenCampoTextual(request, "TRIESGO");
			logger.debug("TRIESGO :: " + TRIESGO);

			// Identificaci�n veh�culo
			BigDecimal CTIPMAT = getCampoNumerico(request, "CTIPMAT");
			logger.debug("CTIPMAT :: " + CTIPMAT);
			String CMATRIC = getCampoTextual(request, "CMATRIC");
			logger.debug("CMATRIC :: " + CMATRIC);
			BigDecimal IVEHICU = getCampoNumerico(request, "IVEHICU");
			logger.debug("IVEHICU :: " + IVEHICU);
			String CTIPVEH = isEmpty(getHiddenCampoTextual(request, "CTIPVEH"))
					? getHiddenCampoTextual(request, "CTIPVEHx")
					: getHiddenCampoTextual(request, "CTIPVEH");
			logger.debug("CTIPVEH :: " + CTIPVEH);
			String CCLAVEH = getHiddenCampoTextual(request, "CCLAVEH");
			logger.debug("CCLAVEH :: " + CCLAVEH);
			String VIN = getCampoTextual(request, "NBASTID");
			logger.debug("VIN :: " + VIN);
			BigDecimal CCOLOR = getCampoNumerico(request, "CCOLOR");
			logger.debug("CCOLOR :: " + CCOLOR);
			BigDecimal PMA = getCampoNumerico(request, "NPMA");
			logger.debug("PMA :: " + PMA);

			BigDecimal TARA = getCampoNumerico(request, "NTARA");
			/*
			 * if (isEmpty(TARA)) { TARA=getCampoNumerico(request, "CPESO"); }
			 */
			logger.debug("TARA :: " + TARA);
			// BUG 30256/166723 - 21/02/2014 - RCL
			BigDecimal CPESO = getCampoNumerico(request, "CPESO");
			logger.debug("CPESO :: " + CPESO);

			// BUG 30256/166723 - 21/02/2014 - RCL
			BigDecimal CTRANSMISION = getCampoNumerico(request, "CTRANSMISION");
			logger.debug("CTRANSMISION :: " + CTRANSMISION);

			BigDecimal NPLAZAS = getCampoNumerico(request, "NPLAZAS");
			logger.debug("NPLAZAS :: " + NPLAZAS);
			BigDecimal KMANY = getCampoNumerico(request, "KMANY");
			logger.debug("KMANY :: " + KMANY);
			BigDecimal CREMOLQUE = getCampoNumerico(request, "CUSOREMOLQUE");
			logger.debug("CREMOLQUE :: " + CREMOLQUE);
			BigDecimal DESREMOLQUE = getCampoNumerico(request, "DESREMOLQUE");
			logger.debug("DESREMOLQUE :: " + DESREMOLQUE);

			// Otros datos del veh�culo
			String CUSO = getCampoTextual(request, "CUSO");
			logger.debug("CUSO :: " + CUSO);
			String CSUBUSO = getCampoTextual(request, "CSUBUSO");
			logger.debug("CSUBUSO :: " + CSUBUSO);
			BigDecimal VEHICLE_NOU = getCampoNumerico(request, "CNUEVO");
			logger.debug("VEHICLE_NOU :: " + VEHICLE_NOU);
			java.sql.Date FMATRICUL = null;

			FMATRICUL = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FLANZAM"));
			BigDecimal CGARAJE = getCampoNumerico(request, "CGARAJE");
			BigDecimal CVEHB7 = new BigDecimal(0);

			logger.debug("------- FLANZAM:" + FMATRICUL);
			BigDecimal CPAISORIGEN = getCampoNumerico(request, "CPAISORIGEN");
			String CODMOTOR = getCampoTextual(request, "CODMOTOR");
			String CCHASIS = getCampoTextual(request, "CCHASIS");
			BigDecimal IVEHINUE = getCampoNumerico(request, "IVEHINUE");
			BigDecimal NKILOMETRAJE = getCampoNumerico(request, "NKILOMETRAJE");
			String CCILINDRAJE = getCampoTextual(request, "CCILINDRAJE");
			logger.debug("CCILINDRAJE :: " + CCILINDRAJE);
			BigDecimal CPINTURA = getCampoNumerico(request, "CPINTURA");
			BigDecimal CCAJA = getCampoNumerico(request, "CCAJA");
			BigDecimal CCAMPERO = getCampoNumerico(request, "CCAMPERO");
			BigDecimal CTIPCARROCERIA = getCampoNumerico(request, "CTIPCARROCERIA");
			BigDecimal CSERVICIO = getCampoNumerico(request, "CSERVICIO");
			BigDecimal CORIGEN = getCampoNumerico(request, "CORIGEN");
			BigDecimal CTRANSPORTE = getCampoNumerico(request, "CTRANSPORTE");
			BigDecimal IVEHICUFASECOLDA = getCampoNumerico(request, "IVEHICUFASECOLDA");
			BigDecimal IVEHICUFASECOLDANUE = getCampoNumerico(request, "IVEHICUFASECOLDANUE");
			BigDecimal ANYO = getHiddenCampoNumerico(request, "ANYO");
			BigDecimal CIAANT = getCampoNumerico(request, "CIAANT");
			java.sql.Date FFINCIANT = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINCIANT"));

			/* Grabar Datos AUTOS */
			// BUG 30256/166723 - 21/02/2014 - RCL
			Map grabarDatosAutos = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_RIESAUTO(SSEGURO, NRIESGO, CVERSION, CMODELO, CMARCA, CTIPVEH,
							CCLAVEH, CMATRIC, CTIPMAT, CUSO, CSUBUSO, FMATRICUL, KMANY, IVEHICU, PMA, TARA, NPUERTAS,
							NPLAZAS, CCOMBUSTIBLE, CGARAJE, CVEHB7, CREMOLQUE, DESREMOLQUE, CCOLOR, VEHICLE_NOU, VIN,
							TRIESGO, CPAISORIGEN, CODMOTOR, CCHASIS, IVEHINUE, NKILOMETRAJE, CCILINDRAJE, CPINTURA,
							CCAJA, CCAMPERO, CTIPCARROCERIA, CSERVICIO, CORIGEN, CTRANSPORTE, IVEHICUFASECOLDA,
							IVEHICUFASECOLDANUE, ANYO, FFINCIANT, CIAANT, CPESO, CTRANSMISION);

			// Cargo el numero de riesgo
			logger.debug("--- Nuevo riesgo:" + grabarDatosAutos.get("PNRIESGO_OUT"));
			if (isEmpty(NRIESGO)) {
				if (!isEmpty(grabarDatosAutos.get("PNRIESGO_OUT"))) {
					AbstractDispatchAction.topPila(request).put("NRIESGO", grabarDatosAutos.get("PNRIESGO_OUT"));
				}
			}

			logger.debug(grabarDatosAutos);
			tratarRETURNyMENSAJES(request, grabarDatosAutos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_guardarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_validar_simulacion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr148Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = null;
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			/* Validaci�n */
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			if (isEmpty(CMODO))
				CMODO = "EST";

			map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDARIESGOS();
			logger.debug(map);

			BigDecimal codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn2.intValue() == 0) {
				formdata.put("OK", "0");
			} else {
				List l_mensajes = (List) map.get("MENSAJES");
				Map mensajes = (HashMap) ((HashMap) (l_mensajes.get(0))).get("OB_IAX_MENSAJES");
				BigDecimal codError = mensajes != null ? (BigDecimal) mensajes.get("CERROR") : new BigDecimal(0);
				set_errores_validacion(request, codError);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr148Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = null;
		try {
			/* Validaci�n */
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			if (isEmpty(CMODO))
				CMODO = "EST";

			map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDARIESGOS();
			logger.debug(map);

			BigDecimal codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn2.intValue() == 0) {
				// vaya al siguiente...
				if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
					request.setAttribute(Constantes.FORWARDACTION,
							AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			} else {
				List l_mensajes = (List) map.get("MENSAJES");
				Map mensajes = (HashMap) ((HashMap) (l_mensajes.get(0))).get("OB_IAX_MENSAJES");
				BigDecimal codError = mensajes != null ? (BigDecimal) mensajes.get("CERROR") : new BigDecimal(0);

				set_errores_validacion(request, codError);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Funcion que recupera la versi�n
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_version(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CVERSION = getCampoTextual(request, "CVERSION");

			logger.debug("---------- VALOR version  :" + CVERSION);
			if (!isEmpty(CVERSION)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(CVERSION, new BigDecimal(1), null);
				logger.debug(map);
				if (!isEmpty(map)) {
					List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(version);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Funcion que rellena la lista de usos
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_usos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();
		try {
			String TTIPVEH = getCampoTextual(request, "TTIPVEH");
			String TCLAVEH = getCampoTextual(request, "TCLAVEH");

			logger.debug("---------- VALOR TTIPVEH  :" + TTIPVEH + " TCLAVEH:" + TCLAVEH);
			if (!isEmpty(TTIPVEH)) {
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(TCLAVEH, TTIPVEH, SPRODUC, null);
				logger.debug(map);
				if (!isEmpty(map)) {
					List usos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(usos);
					miDataObject.put("usos", usos);
					miDataObject.put("on_load", getCampoTextual(request, "on_load"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_usos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		}
	}

	/**
	 * Funcion que rellena la lista de subusos
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_subusos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String TTIPVEH = getCampoTextual(request, "TTIPVEH");
			String TCLAVEH = getCampoTextual(request, "TCLAVEH");
			String CUSO = getCampoTextual(request, "CUSO");

			logger.debug("---------- VALOR TTIPVEH  :" + TTIPVEH + " TCLAVEH:" + TCLAVEH + " CUSO" + CUSO);
			if (!isEmpty(TCLAVEH) && !isEmpty(TTIPVEH) && !isEmpty(CUSO)) {
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTSUBUSO(TCLAVEH, TTIPVEH, CUSO, SPRODUC, null);
				logger.debug(map);
				if (!isEmpty(map)) {
					List usos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(usos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_usos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_tipos_vehiculo_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CMARCA = getCampoTextual(request, "cmarca");
			BigDecimal CTRAMIT = null;
			if (request.getParameter("ctramit") != null) {
				CTRAMIT = new BigDecimal(request.getParameter("ctramit"));
			}

			Map m = new HashMap();
			if (!isEmpty(CMARCA)) {

				m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(CMARCA, CTRAMIT);
				logger.debug(m);

			} else {
				m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();
				logger.debug(m);
			}
			miDataObject.put("resultado", m);
			miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, m));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizar_franq_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_tipos_vehiculo_json_xmod(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CMARCA = getCampoTextual(request, "cmarca");
			String CMODELO = getCampoTextual(request, "cmodelo");
			BigDecimal CTRAMIT = null;
			if (request.getParameter("ctramit") != null) {
				CTRAMIT = new BigDecimal(request.getParameter("ctramit"));
			}

			Map m = new HashMap();
			if (!isEmpty(CMARCA) && !isEmpty(CMODELO)) {

				m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCAMODEL(CMARCA, CMODELO, CTRAMIT);
				logger.debug(m);

			}

			miDataObject.put("resultado", m);
			miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, m));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_tipos_vehiculo_json_xmod", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_clases_vehiculo_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CTIPVEH = this.getHiddenCampoTextual(request, "CTIPVEH");
			String CMARCA = this.getHiddenCampoTextual(request, "CMARCA");
			Map map2 = new HashMap();
			if (!isEmpty(CTIPVEH)) {

				if (!isEmpty(CMARCA)) {
					// Lista Clase vehiculos
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(CMARCA, CTIPVEH);
				} else {
					// Lista Clase vehiculos
					map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(CTIPVEH);

				}
			}
			miDataObject.put("resultado", map2);
			miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, map2));
			ajax.rellenarPlAContenedorAjax(map2);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_tipos_vehiculo_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_recuperar_version_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CVERSION = getCampoTextual(request, "CVERSION");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			logger.debug("---------- VALOR version  :" + CVERSION);
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map map2 = new HashMap();
			if (!isEmpty(CVERSION)) {
				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(CVERSION, new BigDecimal(1), CTRAMIT);
				logger.debug("---------- map2 version  :" + map2);
				String mostrarAlert = getCampoTextual(request, "mostrarAlert");
				if (mostrarAlert != null)
					map2.put("mostrarAlert", false);

				miDataObject.put("resultado", map2);
				miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, map2));
				ArrayList mm = (ArrayList) this.tratarRETURNyMENSAJES(request, map2);
				if (!isEmpty(mm)) {
					Map m = (HashMap) mm.get(0);

					if (!isEmpty(m.get("CMARCA"))) {
						String CMARCA = (String) m.get("CMARCA");
						Map mtipo = new PAC_IAX_LISTVALORES_AUT(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(CMARCA, CTRAMIT);
						logger.debug(mtipo);
						miDataObject.put("listatipos", this.tratarRETURNyMENSAJES(request, mtipo));
						if (!isEmpty(m.get("CTIPVEH"))) {
							String CTIPVEH = isEmpty(m.get("CTIPVEH")) ? "" : (String) m.get("CTIPVEH");

							Map mapclase = new PAC_IAX_LISTVALORES_AUT(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(CMARCA, CTIPVEH);
							logger.debug(mapclase);
							miDataObject.put("listaclases", this.tratarRETURNyMENSAJES(request, mapclase));
							String CCLAVEH = isEmpty(m.get("CCLAVEH")) ? "" : (String) m.get("CCLAVEH");
							Map mapmodelos = new PAC_IAX_LISTVALORES_AUT(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(CTIPVEH, CCLAVEH, CMARCA, null);
							logger.debug(mapmodelos);
							miDataObject.put("listamodelos", this.tratarRETURNyMENSAJES(request, mapmodelos));

							String CMODELO = isEmpty(m.get("CMODELO")) ? "" : (String) m.get("CMODELO");

							if (!isEmpty(CMODELO)) {
								Map mappuertas = new PAC_IAX_LISTVALORES_AUT(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(CMARCA, CMODELO);
								logger.debug(mappuertas);
								miDataObject.put("listapuertas", this.tratarRETURNyMENSAJES(request, mappuertas));
							}

						}

					}

					Map mapanyos = new PAC_IAX_LISTVALORES_AUT(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(CVERSION, NRIESGO);
					logger.debug(mapanyos);
					miDataObject.put("listaanyos", this.tratarRETURNyMENSAJES(request, mapanyos));

					// BUG 30256/168637 - RCL - 05/03/2014
					Map mapTransmision = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000937));
					logger.debug(mapTransmision);
					miDataObject.put("listatransmision", this.tratarRETURNyMENSAJES(request, mapTransmision));
				}
			}

			// Pasamos campo para saber si estamos en proceso de carga
			miDataObject.put("on_load", getCampoTextual(request, "on_load"));
			ajax.rellenarPlAContenedorAjax(map2);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_anyos_version_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_anyos_version_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CVERSION = this.getHiddenCampoTextual(request, "CVERSION");
			Map map2 = new HashMap();
			if (!isEmpty(CVERSION)) {

				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				if (isEmpty(NRIESGO))
					NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(CVERSION, NRIESGO);

			}
			miDataObject.put("resultado", map2);
			miDataObject.put("lista", this.tratarRETURNyMENSAJES(request, map2));
			ajax.rellenarPlAContenedorAjax(map2);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_anyos_version_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_vehiculo_matricula_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();
		try {

			String CMATRIC = getCampoTextual(request, "CMATRIC");
			BigDecimal CTIPMAT = this.getCampoNumerico(request, "CTIPMAT");
			String CMATRIC_TIPMAT_INI = (String) request.getSession().getAttribute("CMATRIC_TIPMAT_INI");// bug
																											// 26923#c148567

			// DCT INICIO BUG 26635/142069 Validamos que no se puplique: matr�cula,
			// vastidor, codmotor y chasis
			BigDecimal sseguro = getCampoNumerico(request, "SSEGURO");

			String NBASTID = getCampoTextual(request, "NBASTID");
			String CCHASIS = getCampoTextual(request, "CCHASIS");
			String CODMOTOR = getCampoTextual(request, "CODMOTOR");
			BigDecimal SPRODUC1 = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal CACTIVI = (BigDecimal) AbstractDispatchAction.topPila(request, "CACTIVI") != null
					? (BigDecimal) AbstractDispatchAction.topPila(request, "CACTIVI")
					: new BigDecimal(0);

			// BUG 26923/146170: Se recupera el valor SSEGURO_OUT (De estudio) para la
			// validaci�n
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			Map mnduplica = new HashMap();
			mnduplica = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_CONTROLDUPLICIDAD(SSEGURO_OUT, CMATRIC, NBASTID, CCHASIS,
							CODMOTOR, SPRODUC1);
			logger.debug(mnduplica);
			miDataObject.put("resultado", mnduplica);

			BigDecimal mx = (BigDecimal) this.tratarRETURNyMENSAJES(request, mnduplica);

			BigDecimal donde = getCampoNumerico(request, "DONDE");
			if (mx.intValue() == 0) {

				if ((!isEmpty(donde) && donde.equals(new BigDecimal(1)))) {
					// DCT FIN BUG 26635/142069

					if (!isEmpty(CMATRIC) && CMATRIC != null && !isEmpty(CTIPMAT)
							&& !(CMATRIC + CTIPMAT).equals(CMATRIC_TIPMAT_INI)) {

						request.getSession().setAttribute("CMATRIC_TIPMAT_INI", CMATRIC + CTIPMAT); // bug 26923#c148567

						String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
						Map mn = new HashMap();
						mn = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION_AUT__F_GET_AUTO_MATRIC(CTIPMAT, CMATRIC, SPRODUC1, CACTIVI,
										CMODO);
						logger.debug(mn);
						this.tratarRETURNyMENSAJES(request, mn);
						if (!isEmpty(mn.get("MENSAJES"))) {

							List l_mensajess = (List) mn.get("MENSAJES");
							Map mensajess = (HashMap) ((HashMap) (l_mensajess.get(0))).get("OB_IAX_MENSAJES");
							BigDecimal TIPERROR = mensajess != null ? (BigDecimal) mensajess.get("TIPERROR")
									: new BigDecimal(0);
							if (!isEmpty(TIPERROR) && TIPERROR.intValue() == 1) {
								miDataObject.put("MATRICULAKO", new BigDecimal(1));
							}
							miDataObject.put("resultado", mn);
							ajax.rellenarPlAContenedorAjax(mn);
							return;
						}

						miDataObject.put("resultado", mn);
						request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
						miDataObject.put("riesgoauto", this.tratarRETURNyMENSAJES(request, mn));

						Map m = (HashMap) this.tratarRETURNyMENSAJES(request, mn);
						BigDecimal NRIESGO = (BigDecimal) m.get("NRIESGO");
						if (isEmpty(NRIESGO)) {
							NRIESGO = getCampoNumerico(request, "NRIESGO");
							if (isEmpty(NRIESGO))
								NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
						}
						Map map = new PAC_IAX_PRODUCCION_AUT(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
						logger.debug("------ auto recuperado:" + map);
						map = (Map) tratarRETURNyMENSAJES(request, map);

						float total = 0;
						List accesorios;
						if (!isEmpty(map.get("ACCESORIOS"))) {
							accesorios = (List) map.get("ACCESORIOS");
							for (int a = 0; a < accesorios.size(); a++) {
								if (((BigDecimal) ((Map) ((Map) accesorios.get(a)).get("OB_IAX_AUTACCESORIOS"))
										.get("CMARCADO")).intValue() == 1)
									total = total + ((BigDecimal) ((Map) ((Map) accesorios.get(a))
											.get("OB_IAX_AUTACCESORIOS")).get("IVALACC")).floatValue();
							}
							miDataObject.put("TOTALACC", total);

						}
						if (!isEmpty(CMATRIC) && !isEmpty(CTIPMAT)) {
							Map mn2 = new HashMap();
							// bug --> 29315#c165209 : En el �ltimo par�metro de la funci�n de abajo se ha
							// de pasar un 0 en lugar de null, porque en weblogic da error si se pasa un
							// null a un parametro NUMBER IN OUT.
							mn2 = new PAC_IAX_CON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_CON__F_ULTIMOSEGUROVEHICULO(Integer.toString(CTIPMAT.intValue()),
											CMATRIC, new BigDecimal(0));
							logger.debug(mn2);
							miDataObject.put("resultado", mn2);
							miDataObject.put("FECHAULTIMAVIG", mn2.get("PFECHAULTIMAVIG"));
							miDataObject.put("CCOMPANI", mn2.get("PCOMPANI"));

							// BUG 30256/168637 - RCL - 05/03/2014
							Map mapTransmision = new PAC_IAX_LISTVALORES(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000937));
							logger.debug(mapTransmision);
							miDataObject.put("listatransmision", this.tratarRETURNyMENSAJES(request, mapTransmision));
						}

						if (!isEmpty(m) && !isEmpty(m.get("CMARCA"))) {
							String CMARCA = (String) m.get("CMARCA");
							Map mtipo = new PAC_IAX_LISTVALORES_AUT(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(CMARCA, null);
							logger.debug(mtipo);
							miDataObject.put("listatipos", this.tratarRETURNyMENSAJES(request, mtipo));
							if (!isEmpty(m.get("CTIPVEH"))) {
								String CTIPVEH = isEmpty(m.get("CTIPVEH")) ? "" : (String) m.get("CTIPVEH");
								Map mapclase = new PAC_IAX_LISTVALORES_AUT(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(CMARCA, CTIPVEH);
								logger.debug(mapclase);
								miDataObject.put("listaclases", this.tratarRETURNyMENSAJES(request, mapclase));
								String CCLAVEH = isEmpty(m.get("CCLAVEH")) ? "" : (String) m.get("CCLAVEH");
								Map mapmodelos = new PAC_IAX_LISTVALORES_AUT(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(CTIPVEH, CCLAVEH, CMARCA,
												null);
								logger.debug(mapmodelos);
								miDataObject.put("listamodelos", this.tratarRETURNyMENSAJES(request, mapmodelos));

								if (!isEmpty(CTIPVEH)) {
									// Lista Usos
									BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request,
											"SPRODUC");
									Map map2 = new PAC_IAX_LISTVALORES_AUT(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTUSO(
													isEmpty(m.get("CCLAVEH")) ? "" : String.valueOf(m.get("CCLAVEH")),
													String.valueOf(CTIPVEH), SPRODUC, null);
									logger.debug(map2);
									logger.debug("-------- CCLAVEH y CTIPVEH no null:" + map2);
									miDataObject.put("listausos", (List) tratarRETURNyMENSAJES(request, map2, false));
								}

								String CMODELO = isEmpty(m.get("CMODELO")) ? "" : (String) m.get("CMODELO");

								if (!isEmpty(CMODELO)) {
									Map mappuertas = new PAC_IAX_LISTVALORES_AUT(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTNUMPUERTAS(CMARCA, CMODELO);
									logger.debug(mappuertas);
									miDataObject.put("listapuertas", this.tratarRETURNyMENSAJES(request, mappuertas));
								}

							}
							if (!isEmpty(m.get("CVERSION"))) {

								NRIESGO = (BigDecimal) m.get("NRIESGO");
								if (isEmpty(NRIESGO)) {
									NRIESGO = getCampoNumerico(request, "NRIESGO");
									if (isEmpty(NRIESGO))
										NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
								}
								Map mapanyos = new PAC_IAX_LISTVALORES_AUT(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION((String) m.get("CVERSION"),
												NRIESGO);
								logger.debug(mapanyos);
								miDataObject.put("listaanyos", this.tratarRETURNyMENSAJES(request, mapanyos));
							}

						}

						ajax.rellenarPlAContenedorAjax(mn);

					}
				}
			} else {
				List l_mensajes = (List) mnduplica.get("MENSAJES");
				Map mensajes = (HashMap) ((HashMap) (l_mensajes.get(0))).get("OB_IAX_MENSAJES");
				BigDecimal codError = mensajes != null ? (BigDecimal) mensajes.get("CERROR") : new BigDecimal(0);
				set_errores_validacion(miDataObject, codError);

				ajax.rellenarPlAContenedorAjax(mnduplica);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr207Service - m�todo m_vehiculo_matricula_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		}
	}

	public boolean m_vehiculo_matricula(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			String CMATRIC = getCampoTextual(request, "CMATRIC");
			BigDecimal CTIPMAT = this.getCampoNumerico(request, "CTIPMAT");
			String CMATRIC_TIPMAT_INI = (String) request.getSession().getAttribute("CMATRIC_TIPMAT_INI");// bug
																											// 26923#c148567

			// DCT INICIO BUG 26635/142069 Validamos que no se puplique: matr�cula,
			// vastidor, codmotor y chasis
			BigDecimal sseguro = getCampoNumerico(request, "SSEGURO");

			String NBASTID = getCampoTextual(request, "NBASTID");
			String CCHASIS = getCampoTextual(request, "CCHASIS");
			String CODMOTOR = getCampoTextual(request, "CODMOTOR");
			BigDecimal SPRODUC1 = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal CACTIVI = (BigDecimal) AbstractDispatchAction.topPila(request, "CACTIVI") != null
					? (BigDecimal) AbstractDispatchAction.topPila(request, "CACTIVI")
					: new BigDecimal(0);

			// BUG 26923/146170: Se recupera el valor SSEGURO_OUT (De estudio) para la
			// validaci�n
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			Map mnduplica = new HashMap();
			mnduplica = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_CONTROLDUPLICIDAD(SSEGURO_OUT, CMATRIC, NBASTID, CCHASIS,
							CODMOTOR, SPRODUC1);
			logger.debug(mnduplica);
			miDataObject.put("resultado", mnduplica);

			BigDecimal mx = (BigDecimal) this.tratarRETURNyMENSAJES(request, mnduplica);

			BigDecimal donde = getCampoNumerico(request, "DONDE");
			if (mx.intValue() == 0) {
				return true;

			} else {
				return false;
			}
			// request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr207Service - m�todo m_vehiculo_matricula_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		return false;
	}

	/**
	 * Metodo para validar con PAC_VALIDACION.F_VALIDA, aunque es de la 148, puede
	 * ser acccedido desde todos los sitios
	 */
	public void m_f_valida_campo_ajaxjson(HttpServletRequest request, Axisctr148Action thisAction) {
		logger.debug("f_valida_campo_ajaxjson");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap miDataObject = new HashMap();

			logger.debug((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_VALIDACIONES PAC_IAX_VALIDACIONES = new PAC_IAX_VALIDACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (CEMPRES == null) {
				CEMPRES = usuario.getCempres(); // si no se envia explicitamente la empresa, pillamos la del usuario
			}
			String CIDCAMPO = this.getCampoTextual(request, "CIDCAMPO"); // es el identidicador del campo, es decir el
																			// valor del atributo "id"
			String TDESCCAMPO = this.getCampoTextual(request, "TDESCCAMPO"); // opcional: descripcion del campo en
																				// idioma del usuario actual
			String CAMPO = this.getCampoTextual(request, "CAMPO"); // es el valor del campo, es decir el valor del
																	// atributo "value"

			miDataObject.put("CIDCAMPO", CIDCAMPO); // hacemos un echo de los datos por si nos pueden servir en la
													// respuesta
			miDataObject.put("TDESCCAMPO", TDESCCAMPO); // hacemos un echo de los datos por si nos pueden servir en la
														// respuesta
			miDataObject.put("CAMPO", CAMPO); // hacemos un echo de los datos por si nos pueden servir en la respuesta

			HashMap m = PAC_IAX_VALIDACIONES.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CAMPO(CEMPRES, CIDCAMPO, CAMPO);
			miDataObject.put("F_VALIDA_CAMPO", m);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void set_errores_validacion(HttpServletRequest request, BigDecimal codError) {

		switch (codError.intValue()) {
		case 9904839:
			request.setAttribute("errores_validacion", "1"); // matricula ja existent
			break;
		case 9904841:
			request.setAttribute("errores_validacion", "2"); // bastidor ja existent
			break;
		case 9905114:
			request.setAttribute("errores_validacion", "3"); // chasis ja existent
			break;
		case 9904842:
			request.setAttribute("errores_validacion", "4"); // motor ja existent
			break;
		}

	}

	public void set_errores_validacion(Map map, BigDecimal codError) {

		switch (codError.intValue()) {
		case 9904839:
			map.put("errores_validacion", 1); // matricula ja existent
			break;
		case 9904841:
			map.put("errores_validacion", 2); // bastidor ja existent
			break;
		case 9905114:
			map.put("errores_validacion", 3); // chasis ja existent
			break;
		case 9904842:
			map.put("errores_validacion", 4); // motor ja existent
			break;
		}

	}

}
