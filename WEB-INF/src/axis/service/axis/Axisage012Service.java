package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_TRASPASO_CARTERA_AGE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage012Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisage012Service.java
 * 
 * @since Java 5.0
 */
public class Axisage012Service extends AxisBaseService {
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
		logger.debug("Axisage012Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CAGENTE2 = getCampoNumerico(request, "CAGENTE2");
			Date FTRASP = stringToSqlDate(getCampoTextual(request, "FTRASP"));
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			logger.debug(
					"CAGENTE: " + CAGENTE + " CAGENTE2: " + CAGENTE2 + " FTRASP: " + FTRASP + " SPROCES: " + SPROCES);
			PAC_IAX_TRASPASO_CARTERA_AGE pac_iax_traspaso_cartera_age = new PAC_IAX_TRASPASO_CARTERA_AGE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CAGENTE) || !isEmpty(CAGENTE2) || !isEmpty(FTRASP)) {
				// Si la persona CAGENTE1 est� informada recuperamos la lista de p�lizas.
				HashMap map_listtrasp = pac_iax_traspaso_cartera_age
						.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTTRASPASOS(CAGENTE, CAGENTE2, FTRASP);
				ArrayList lista_trasp = (ArrayList) tratarRETURNyMENSAJES(request, map_listtrasp, false);
				logger.debug("63-lista_trasp" + lista_trasp);
				request.setAttribute("lista_trasp", lista_trasp);
			}

			if (!isEmpty(SPROCES)) {
				HashMap map_dettrasp = pac_iax_traspaso_cartera_age
						.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(SPROCES);
				ArrayList lista_dettrasp = (ArrayList) tratarRETURNyMENSAJES(request, map_dettrasp, false);

				request.setAttribute("lista_dettrasp", lista_dettrasp);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_cargar_det(HttpServletRequest request) {
		logger.debug("Axisage012Service m_cargar_det");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			logger.debug("SPROCES: " + SPROCES);
			PAC_IAX_TRASPASO_CARTERA_AGE pac_iax_traspaso_cartera_age = new PAC_IAX_TRASPASO_CARTERA_AGE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(SPROCES)) {
				HashMap map_dettrasp = pac_iax_traspaso_cartera_age
						.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(SPROCES);
				ArrayList lista_dettrasp = (ArrayList) tratarRETURNyMENSAJES(request, map_dettrasp, false);

				request.setAttribute("lista_dettrasp", lista_dettrasp);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_cargar_det", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisage012Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE;
			BigDecimal CAGENTE2;
			java.sql.Date FTRASP;
			BigDecimal SPROCES;

			formdata.putAll((Map) AbstractDispatchAction.topPila(request, "formdata_axisadm049"));
			logger.debug("formdata: " + formdata);

			if (!isEmpty(formdata.get("CAGENTE"))) {
				CAGENTE = new BigDecimal(String.valueOf(formdata.get("CAGENTE")));
			} else {
				CAGENTE = null;
			}

			if (!isEmpty(formdata.get("CAGENTE2"))) {
				CAGENTE2 = new BigDecimal(String.valueOf(formdata.get("CAGENTE2")));
			} else {
				CAGENTE2 = null;
			}

			if (!isEmpty(formdata.get("FTRASP"))) {
				if (formdata.get("FTRASP") instanceof java.util.Date) {
					FTRASP = stringToSqlDate(datePrintfddMMyyyy((java.util.Date) (formdata.get("FTRASP"))));
				} else {
					FTRASP = stringToSqlDate(String.valueOf(formdata.get("FTRASP")));
				}
			} else {
				FTRASP = null;
			}

			if (!isEmpty(formdata.get("SPROCES"))) {
				SPROCES = new BigDecimal(String.valueOf(formdata.get("SPROCES")));
			} else {
				SPROCES = null;
			}

			logger.debug(
					"CAGENTE: " + CAGENTE + " CAGENTE2: " + CAGENTE2 + " FTRASP: " + FTRASP + " SPROCES: " + SPROCES);
			PAC_IAX_TRASPASO_CARTERA_AGE pac_iax_traspaso_cartera_age = new PAC_IAX_TRASPASO_CARTERA_AGE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CAGENTE) || !isEmpty(CAGENTE2) || !isEmpty(FTRASP)) {
				// Si la persona CAGENTE1 est� informada recuperamos la lista de p�lizas.
				HashMap map_listtrasp = pac_iax_traspaso_cartera_age
						.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTTRASPASOS(CAGENTE, CAGENTE2, FTRASP);
				ArrayList lista_trasp = (ArrayList) tratarRETURNyMENSAJES(request, map_listtrasp, false);
				logger.debug("161-lista_trasp" + lista_trasp);
				request.setAttribute("lista_trasp", lista_trasp);
			}

			if (!isEmpty(SPROCES)) {
				HashMap map_dettrasp = pac_iax_traspaso_cartera_age
						.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_GET_LISTDETTRASP(SPROCES);
				ArrayList lista_dettrasp = (ArrayList) tratarRETURNyMENSAJES(request, map_dettrasp, false);

				request.setAttribute("lista_dettrasp", lista_dettrasp);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE NAVEGACI�N
	 **********************************************/
	/*********************************************************************************************************************/

	public void m_consultarProceso(HttpServletRequest request, Axisage012Action thisAction) {
		logger.debug("Axisage012Service m_consultarProceso");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila
			logger.debug("formdata=" + formdata);

			thisAction.topPila(request, "formdata_axisadm049", formdata);
			thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axisadm049.do?operation=buscar&bus=bus&EMPRESA=" + usuario.getCempres()));
			thisAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisage012.do?operation=recargar"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_consultarProceso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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

			if (!isEmpty(request.getSession().getAttribute("axisctr014_listaAgentes"))) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
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

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisage012Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisage012Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_ajax_actualizar_agente", e);
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

			String CONDICION = "TRASPASO_CARTERA";

			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);

			/*
			 * mapAgentes = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE,
			 * new BigDecimal(1));
			 */

			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		return mapAgentes;
	}

// 11/07/2019 cambiado de la pantalla axisadm049 y su servicio
	// tarea 4080 20/06/2019 Andr� Pfeiffer INICIO
	public void m_descargar(HttpServletRequest request, Axisage012Action thisAction) {
		logger.debug("Axisadm012Service m_descargar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = new BigDecimal(24);
		String CEXPORT = "XLSX";
		String CMAP = new String();
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		String SPROC = getCampoTextual(request, "SPROC");

		CMAP = "TraspasosDeCartera";
		PARAMETROS__.put("PSPROC", SPROC);
		TPARAMETROS__.put("TPSPROC", "1");

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), new BigDecimal(8),
							new BigDecimal(0), null, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			System.out.println(ajax.getAjaxContainer());
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage012Service - m�todo m_ejecutar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()) == null) {
					String valorParametro = "T" + keyArray[i].toString();
					;
					String tipoParametro = null;
					paramObj = new ObIaxInfo(keyArray[i].toString(), null, tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				} else if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}
			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}
	// tarea 4080 20/06/2019 Andr� Pfeiffer fim
}
