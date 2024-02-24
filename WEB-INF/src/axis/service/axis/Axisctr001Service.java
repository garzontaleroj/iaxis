//Revision:# DQ4GQBSKF4VliFW/f+dfSA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr001Action thisAction) {
		logger.debug("Axisctr001Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("tipo", "TF");

			this.cargaAgente(request);
			this.cargaListaRamos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Carga de ramos de la BD
		String tipo = this.getCampoTextual(request, "tipo");
		logger.debug("tipo-->" + tipo);
		try {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (!isEmpty(request.getAttribute("VALOR_POR_DEFECTO"))
					&& (isEmpty(request.getAttribute("tipo")) || request.getAttribute("tipo").equals("null"))) {
				logger.debug("in");
				int valores_defecto_size = ((java.util.List) request.getAttribute("VALOR_POR_DEFECTO")).size();
				logger.debug("valores_defecto_size:" + valores_defecto_size);
				for (int i = 0; i < valores_defecto_size; i++) {
					String campoid = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID");
					String valor = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR");
					logger.debug("campoid:" + campoid);
					logger.debug("valor:" + valor);
					if (campoid.equals("tipo")) {
						tipo = valor;
						formdata.put("tipo", tipo);
					}
				}

			}
		} catch (Exception e) {
			logger.debug("Exception :" + e.getMessage());
		}
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

		if (CAGENTE == null && request.getSession().getAttribute("axisctr_agente") != null) {
			CAGENTE = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr_agente")).get("CODI");
		}

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE, tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaAgente(HttpServletRequest request) throws Exception {
		if (isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
			// Cargar Agente de la BD
			String CONDICION = "NUEVA_PRODUCCION";
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			// Bug 21132/105482
			BigDecimal CAGENTE = (BigDecimal) mapCX.get("RETURN");
			Map mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			// Fi Bug 21132/105482

			Map agente = new HashMap();
			logger.debug("agentes --> " + mapAgentes);
			if (!isEmpty(tratarRETURNyMENSAJES(request, mapAgentes))) {
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgentes);
				agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
				logger.debug(agente);
			}
			request.getSession().setAttribute("axisctr_agente", agente);

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
			String CONDICION = "NUEVA_PRODUCCION";

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

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Al realizar siguiente, este m�todo realiza la inicializaci�n del flujo.
	 * Adem�s, al ser la primera pantalla del flujo, apilamos en la pila de usuario
	 * ciertos valores que necesitaremos a lo largo del flujo.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public ActionForward m_siguiente(HttpServletRequest request, Axisctr001Action thisAction) {
		logger.debug("Axisctr001Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		ActionForward siguiente = null;

		try {

			// Bug 27048/157319 - 04/11/2013 - AMC
			logger.debug("----> RETORNO_INICIALIZADO:" + request.getAttribute("RETORNO_INICIALIZADO"));
			AbstractDispatchAction.topPila(request, "RETORNO_INICIALIZADO",
					request.getAttribute("RETORNO_INICIALIZADO"));
			// Fi Bug 27048/157319 - 04/11/2013 - AMC

			// Recuperar producto seleccionado
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String CESTPOL = getCampoTextual(request, "CESTPOL");
			// BigDecimal CAGENTE =getCampoNumerico (request, "CAGENTE_TEXT");//
			// !isEmpty(getCampoNumerico (request, "CAGENTE_TEXT")) ? getCampoNumerico
			// (request, "CAGENTE_TEXT") : usuario.getCagente();
			BigDecimal CAGENTE = !isEmpty(getCampoNumerico(request, "CAGENTE_TEXT"))
					? getCampoNumerico(request, "CAGENTE_TEXT")
					: getCampoNumerico(request, "CAGENTE");

			BigDecimal NNUMCASO = null;
			BigDecimal NCASO_BPM = null;
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			if (isEmpty(SSEGURO)) {
				if ("SIMULACION".equals(getCampoTextual(request, "CMODO"))) {
					// SIMULACI�N: Recuperar Agente, apilar CMODO
					try {
						if (isEmpty(CAGENTE)) {
							Map mapCX = new PAC_IAX_COMMON(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

							if (!isEmpty(tratarRETURNyMENSAJES(request, mapCX)))
								CAGENTE = (BigDecimal) tratarRETURNyMENSAJES(request, mapCX);

							if (isEmpty(CAGENTE))
								CAGENTE = !isEmpty(getCampoNumerico(request, "CAGENTE_TEXT"))
										? getCampoNumerico(request, "CAGENTE_TEXT")
										: getCampoNumerico(request, "CAGENTE");
						}
					} catch (Exception e) {
					}
					AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
				}

				// Inicializar flujo
				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA("EST", SPRODUC, CAGENTE,
								(String) AbstractDispatchAction.topPila(request, "CMODO"));

				if ("SIMULACION".equals(getCampoTextual(request, "CMODO"))) {
					if (((BigDecimal) map.get("RETURN")).intValue() != 0) {
						siguiente = new ActionForward("/axis_axisctr102.do?operation=form");
						return siguiente;
					}
				}

				if (!isEmpty(map)) {
					formdata.put("URL", map.get("PURL"));
					SSEGURO = (BigDecimal) map.get("PSSOLICIT");
					logger.debug("Se ha llamado a PAC_IAX_PRODUCCION__F_INICIALIZA() y se ha establecido SSEGURO como "
							+ SSEGURO);
				}

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);

				// Bug 28263/153355 - 01/10/2013 - AMC
				NNUMCASO = getCampoNumerico(request, "NNUMCASO");
				NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
				logger.debug("----> NCASO_BPM:" + NCASO_BPM);
				if (!isEmpty(NNUMCASO) || !isEmpty(NCASO_BPM)) {
					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_SET_CASOBPM(NNUMCASO, NCASO_BPM, null);
					logger.debug(map);
				}

			} else {
				// recuperar un SSEGURO para poder editarlo
				AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
				Map map = new HashMap();
				if (!isEmpty(CESTPOL) && CESTPOL.equals("RET")) {
					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_EDITARPROPUESTARETENIDA(SSEGURO);
				} else {
					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_EDITARPROPUESTA(SSEGURO);
				}

				BigDecimal SSEGURO_OUT = null;
				if (!isEmpty(map.get("OSSEGURO")))
					SSEGURO_OUT = new BigDecimal(String.valueOf(map.get("OSSEGURO")));

				AbstractDispatchAction.topPila(request, "SSEGURO_OUT", SSEGURO_OUT);

				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
			}

			// bug 9195 ACC 190209
			if ("SIMULACION".equals(getCampoTextual(request, "CMODO"))) {
				if (hayMensajes(request)) {
					siguiente = new ActionForward("/axis_axisctr102.do?operation=form");
				}
			} // bug 9195 ACC 190209

			// Tenemos que recuperar el SSEGURO de una p�liza nueva
			AbstractDispatchAction.topPila(request, "SSEGURO", SSEGURO);
			// Apilamos SPRODUC, TTITULO (producto) y CAGENTE en la pila de usuario
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
			AbstractDispatchAction.topPila(request, "CRAMO", CRAMO);
			AbstractDispatchAction.topPila(request, "TTITULO", TTITULO);
			if (!isEmpty(CAGENTE))
				usuario.setCagente(CAGENTE);

			// TODO: NRIESGO hard-codeado a 1!!!
			AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal(1));
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR", "PAC_IAX_PRODUCCION__LIMPIARTEMPORALES");

			// Bug 10040 - 13/05/2009 - RSC
			if (this.m_validar(request, thisAction, Constantes.SIGUIENTE, NCASO_BPM)) {

				String nuevoCoti = this.getCampoTextual(request, "CMODOCOT") == null ? "NOK"
						: this.getCampoTextual(request, "CMODOCOT");

				if (nuevoCoti.equals("NUEVO")) {

					ActionForward newParameter = AxisCodeWizard.inicioFlujo(request);
					newParameter.setPath(newParameter.getPath() + "&CMODOCOT=NUEVO");
					request.setAttribute(Constantes.FORWARDACTION, newParameter);
				} else {
					request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.inicioFlujo(request));
				}

			}
			// Fin Bug 10040

			return null; // bug 9195 ACC 190209

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_siguiente", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// bug 9195 ACC 190209
			if ("SIMULACION".equals(getCampoTextual(request, "CMODO"))) {
				siguiente = new ActionForward("/axis_axisctr102.do?operation=form");
			} else {
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			} // bug 9195 ACC 190209

		}
		return siguiente;

	}

	/**
	 * Al realizar siguiente, este m�todo realiza la inicializaci�n del flujo.
	 * Adem�s, al ser la primera pantalla del flujo, apilamos en la pila de usuario
	 * ciertos valores que necesitaremos a lo largo del flujo.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public ActionForward m_siguiente_reempl(HttpServletRequest request, Axisctr001Action thisAction) {
		logger.debug("Axisctr001Service  m_siguiente_reempl");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		ActionForward siguiente = null;

		try {
			// Recuperar producto seleccionado
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String SREEMPL = getCampoTextual(request, "SREEMPL");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String CESTPOL = getCampoTextual(request, "CESTPOL");
			BigDecimal CAGENTE = !isEmpty(getCampoNumerico(request, "CAGENTE_TEXT"))
					? getCampoNumerico(request, "CAGENTE_TEXT")
					: getCampoNumerico(request, "CAGENTE");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			// Inicializar flujo

			if (SREEMPL.lastIndexOf(",") != SREEMPL.lastIndexOf(",") - 1) {
				SREEMPL += ",";
			}
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_REEMP(SREEMPL, "EST", SPRODUC, CAGENTE,
							(String) AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(map)) {

				formdata.put("URL", map.get("PURL"));
				SSEGURO = (BigDecimal) map.get("PSSOLICIT");
				logger.debug(
						"Se ha llamado a ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_REEMP() y se ha establecido SSEGURO como "
								+ SSEGURO);
			}

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			// Tenemos que recuperar el SSEGURO de una p�liza nueva
			AbstractDispatchAction.topPila(request, "SSEGURO", SSEGURO);
			// Apilamos SPRODUC, TTITULO (producto) y CAGENTE en la pila de usuario
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
			AbstractDispatchAction.topPila(request, "TTITULO", TTITULO);
			if (!isEmpty(CAGENTE)) {
				usuario.setCagente(CAGENTE);
			}
			AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal(1));
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR", "PAC_IAX_PRODUCCION__LIMPIARTEMPORALES");
			if (this.m_validar(request, thisAction, Constantes.SIGUIENTE, null)) {
				request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.inicioFlujo(request));
			}

			BigDecimal SSEGURO_OUT = null;
			if (!isEmpty(map.get("OSSEGURO")))
				SSEGURO_OUT = new BigDecimal(String.valueOf(map.get("OSSEGURO")));

			AbstractDispatchAction.topPila(request, "SSEGURO_OUT", SSEGURO_OUT);

			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_siguiente", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
		return siguiente;

	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private
	// Bug 10040 - 13/05/2009 - RSC
	boolean m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion,
			BigDecimal NNUMCASO) {
		logger.debug("Axisctr004Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = null;
		try {
			/* Validaci�n */
			map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_PRODUCTO();
			logger.debug(map);

			BigDecimal codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn2.intValue() == 0) {

				if (!isEmpty(NNUMCASO)) {
					map = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_DATOSBPM(new String("ALTACOLCERO"));
					logger.debug(map);

					codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				}
			}

			if (codiRetorn2.intValue() == 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return false;

		}
	}

	/**
	 * Realiza el forward a la pantalla anterior.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_anterior(HttpServletRequest request, Axisctr001Action thisAction) {
		logger.debug("Axisctr001Service m_atras");
		try {
			request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.inicioFlujo(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_atras", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaProductos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
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
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos en la BD en funci�n del ramo seleccionado
	 * (CRAMO).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private List buscaProductos(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal CMODALI = getCampoNumerico(request, "CMODALI"); // BUG CONF-209 - 12/10/2016 - JAEG
		String CRAMO = getCampoTextual(request, "CRAMO");
		String TRAMO = getCampoTextual(request, "TRAMO");
		String CTERMFIN = "1"; // a scao: debido al analisis "AN121_..." getCampoTextual(request, "CTERMFIN");

		// Poner ramo seleccionado en session
		Map selectedRamo = new HashMap();
		selectedRamo.put("CRAMO", CRAMO);
		selectedRamo.put("TRAMO", TRAMO);
		request.getSession().setAttribute("axisctr_selectedRamo", selectedRamo);

		// Nos cargamos los productos por si hubiera un query anterior
		request.getSession().removeAttribute("axisctr_listaProductos");

		// Cargamos productos
		String tipo = this.getCampoTextual(request, "tipo");
		logger.debug("----> TIPO :" + tipo);
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		List plListaProductos = null;
		if (!isEmpty(CRAMO)) {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOSAGENTE(tipo, new BigDecimal(CRAMO),
							new BigDecimal("1"), CAGENTE, CMODALI); // BUG CONF-209 - 12/10/2016 - JAEG
			plListaProductos = (List) ajax.rellenarPlAContenedorAjax(map);
		}
		request.getSession().setAttribute("axisctr_listaProductos", plListaProductos);
		logger.debug((List) request.getSession().getAttribute("axisctr_listaProductos"));
		return plListaProductos;
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

	// bug 9195 ACC 190209

	/**
	 * 
	 * @param request
	 * @return
	 */
	private boolean hayMensajes(HttpServletRequest request) {

		try {
			HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);

			if (mensajes == null)
				return false;

			if (mensajes.get("m" + "__infos") == null)
				return false;

			Vector mensajeInfosVector = (Vector) mensajes.get("m" + "__infos");

			return (mensajeInfosVector.size() > 0);
		} catch (Exception e) {
			return false;
		}

	} // bug 9195 ACC 190209

	public void m_ajax_recarga_ramos(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_recarga_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			/* Recoger tipo y agente */

			String tipo = this.getCampoTextual(request, "tipo");
			logger.debug("tipo-->" + tipo);
			try {

				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
				if (!isEmpty(request.getAttribute("VALOR_POR_DEFECTO"))
						&& (isEmpty(request.getAttribute("tipo")) || request.getAttribute("tipo").equals("null"))) {
					logger.debug("in");
					int valores_defecto_size = ((java.util.List) request.getAttribute("VALOR_POR_DEFECTO")).size();
					logger.debug("valores_defecto_size:" + valores_defecto_size);
					for (int i = 0; i < valores_defecto_size; i++) {
						String campoid = (String) ((java.util.Map) ((java.util.List) request
								.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID");
						String valor = (String) ((java.util.Map) ((java.util.List) request
								.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR");
						logger.debug("campoid:" + campoid);
						logger.debug("valor:" + valor);
						if (campoid.equals("tipo")) {
							tipo = valor;

						}
					}

				}
			} catch (Exception e) {
				logger.debug("Exception :" + e.getMessage());
			}

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			/* Recoger tipo y agente */

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE, tipo, null);
			logger.debug("------- Ramos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_recarga_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, null);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_ramo(HttpServletRequest request) {
		logger.debug("Axisadm205Service AJAX m_ajax_selected_grupo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CODI");
			Map plReturn = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMODALI(CRAMO);

			List getRamosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("modalidadesramo");

			if (!isEmpty(getRamosIniReturn) && getRamosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getRamosIniReturn);
				request.getSession().setAttribute("modalidadesramo", getRamosIniReturn);
			}
		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_selected_grupo - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// Guilherme El Kadri - Task 4207 - inicio
	private int m_validarAgente(HttpServletRequest request, BigDecimal CAGENTE) {
		logger.debug("Axisctr001Service m_validarAgente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		if (CAGENTE == null) {
			CAGENTE = getCampoNumerico(request, "CAGENTE");
		}

		HashMap map = null;
		try {
			/* Validaci�n */
			map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_AGENTE_BLOCK(CAGENTE);
			logger.debug(map);

			BigDecimal retorno = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (retorno.intValue() == 0) {
				return 0;
			} else if (retorno.intValue() == 1) {
				return 1;
			} else {
				return 2;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_validar", e);
			return 5; // numero arbitr�rio para retornar caso ocorra erro

		}
	}

	/**
	 * Realiza una validacion de agente/persona por Ajax.
	 * 
	 * @see Axisctr001Service#m_validarAgente
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_validar_agente(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			int esValido = this.m_validarAgente(request, CAGENTE);
			if (esValido == 1 || esValido == 2) {
				HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
				mensajes.put("RETORNA_VALIDACION", (esValido == 1 ? "1" : "2"));
				request.setAttribute(Constantes.AJAXCONTAINER, mensajes);
				ajax.rellenarPlAContenedorAjax(mensajes);
				ajax.guardarContenidoFinalAContenedorAjax(mensajes);
			} else {
				HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
				mensajes.put("RETORNA_VALIDACION", "OK");
				request.setAttribute(Constantes.AJAXCONTAINER, mensajes);
				ajax.rellenarPlAContenedorAjax(mensajes);
				ajax.guardarContenidoFinalAContenedorAjax(mensajes);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_validar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
	// Guilherme El Kadri - Task 4207 - fim
}
