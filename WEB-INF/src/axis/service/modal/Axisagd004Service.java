//Revision:# 5qf7XiGSkGy2vvwX/QJsZA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisagd004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axisagd004Service.java Fecha: 23/11/2010 PROP�SITO (descripci�n
 * pantalla): Ejemplo : Pantalla Agenda Usuario
 * 
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 23/11/2010 XPL 1. Creaci�n de la
 * pantalla. 16417: CRT003 - An�lisis Agenda de usuario
 */
public class Axisagd004Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisagd004Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NUEVO = this.getHiddenCampoNumerico(request, "NUEVO");
			String CMODO = getCampoTextual(request, "CMODO");

			// if (AbstractDispatchAction.topPila(request,"CMODO") != null){
			if (isEmpty(CMODO)) {
				if (!AbstractDispatchAction.topPila(request, "CMODO").equals("ALTA")) {
					AbstractDispatchAction.topPila(request, "CMODO_BIS",
							AbstractDispatchAction.topPila(request, "CMODO"));
				}
			} else {
				AbstractDispatchAction.topPila(request, "CMODO", CMODO);
				AbstractDispatchAction.topPila(request, "CMODO_BIS", CMODO);
			}

			if (!isEmpty(NUEVO) && NUEVO.intValue() == 1) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else {
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_BIS"));
			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void m_actualitzarModo(HttpServletRequest request, Axisagd004Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NUEVO = this.getHiddenCampoNumerico(request, "NUEVO");
			if (!AbstractDispatchAction.topPila(request, "CMODO").equals("ALTA"))
				AbstractDispatchAction.topPila(request, "CMODO_BIS", AbstractDispatchAction.topPila(request, "CMODO"));

			if (!isEmpty(NUEVO) && NUEVO.intValue() == 1) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else {
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_BIS"));
			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisagd004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NUEVO = this.getHiddenCampoNumerico(request, "NUEVO");
			String CMODO = getCampoTextual(request, "CMODO");

			// if (AbstractDispatchAction.topPila(request,"CMODO") != null){
			if (isEmpty(CMODO)) {
				if (!AbstractDispatchAction.topPila(request, "CMODO").equals("ALTA")) {
					AbstractDispatchAction.topPila(request, "CMODO_BIS",
							AbstractDispatchAction.topPila(request, "CMODO"));
				}
			} else {
				AbstractDispatchAction.topPila(request, "CMODO", CMODO);
				AbstractDispatchAction.topPila(request, "CMODO_BIS", CMODO);
			}

			if (!isEmpty(NUEVO) && NUEVO.intValue() == 1) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else {
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_BIS"));
			}

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");

			this.m_actualitzarModo(request, thisAction);

			if (!isEmpty(IDAPUNTE) && !isEmpty(IDAGENDA)) {
				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_AGENDA(IDAPUNTE, IDAGENDA);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.putAll((HashMap) m.get("POBAGENDA"));
					Map mm = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTCHAT(IDAGENDA, IDAPUNTE, null, null, null,
							null, null);
					formdata.put("lstchat", this.tratarRETURNyMENSAJES(request, mm));
				}

				if (isEmpty(formdata.get("TCLAGD_AUX")))
					formdata.put("TCLAGD_OUT", formdata.get("TCLAGD"));
				else
					formdata.put("TCLAGD_OUT", formdata.get("TCLAGD_AUX"));

				if (!isEmpty(formdata.get("CCLAGD"))) {
					if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 1)
						formdata.put("SSEGURO", formdata.get("TCLAGD"));
					else if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 0)
						formdata.put("NSINIES", formdata.get("TCLAGD"));
					else if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 2)
						formdata.put("NRECIBO", formdata.get("TCLAGD"));
				}
			}

			String CUSUARI = (String) formdata.get("CUSUARI");
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");

			/*
			 * if (isEmpty(CUSUARI) && isEmpty(CGRUPO)) formdata.put("CUSUARI",
			 * usuario.getCusuari());
			 */
			formdata.put("IDAPUNTE", IDAPUNTE);
			formdata.put("IDAGENDA", IDAGENDA);

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. XPL
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisagd004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800031));
			listValores.put("lstconcepto", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800029));
			listValores.put("lstmodulos", (List) tratarRETURNyMENSAJES(request, map, false));

			/*
			 * map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			 * BigDecimal(800032)); logger.debug(map); listValores.put("lstgrupos",
			 * tratarRETURNyMENSAJES(request, map, false));
			 */
			map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTGRUPOS();
			listValores.put("lstgrupos", tratarRETURNyMENSAJES(request, map, false));
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");

			if (!isEmpty(CGRUPO)) {
				map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(1));
				listValores.put("lstvaloresgrupos", tratarRETURNyMENSAJES(request, map, false));
			}

			String CGRUPO_ORI = this.getHiddenCampoTextual(request, "CGRUPO_ORI");

			if (!isEmpty(CGRUPO_ORI)) {
				map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO_ORI, new BigDecimal(1));
				listValores.put("lstvaloresgrupos_ori", tratarRETURNyMENSAJES(request, map, false));
			}

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA();
			listValores.put("lsttipos", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			listValores.put("lstusuarios", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisagd004Action thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDAPUNTE = getCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = getCampoNumerico(request, "IDAGENDA");
			BigDecimal CCONAPU = ((getCampoNumerico(request, "CCONAPU") != null) ? getCampoNumerico(request, "CCONAPU")
					: getCampoNumerico(request, "CCONAPU_"));
			BigDecimal CCLAGD = ((getCampoNumerico(request, "CCLAGD") != null) ? getCampoNumerico(request, "CCLAGD")
					: getCampoNumerico(request, "CCLAGD_"));

			BigDecimal CESTAPU = getCampoNumerico(request, "CESTAPU");
			String CGRUPO = getCampoTextual(request, "CGRUPO");
			String TGRUPO = getCampoTextual(request, "TGRUPO");
			BigDecimal CPERAGD = getCampoNumerico(request, "CPERAGD");
			BigDecimal CAMBITO = getCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = getCampoNumerico(request, "CPRIORI");

			String TCLAGD = ((getCampoTextual(request, "TCLAGD") != null) ? getCampoTextual(request, "TCLAGD")
					: getCampoTextual(request, "TCLAGD_OUT"));
			String TTITAPU = getCampoTextual(request, "TTITAPU");
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			String TAPUNTE = getCampoTextual(request, "TAPUNTE");

			java.sql.Date FALTA = this.stringToSqlDate(getCampoTextual(request, "FALTA"));
			java.sql.Date FAPUNTE = this.stringToSqlDate(getCampoTextual(request, "FAPUNTE"));
			java.sql.Date FESTAPU = this.stringToSqlDate(getCampoTextual(request, "FESTAPU"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(getCampoTextual(request, "FRECORDATORIO"));

			String CGRUPO_ORI = getCampoTextual(request, "CGRUPO_ORI");
			String TGRUPO_ORI = getCampoTextual(request, "TGRUPO_ORI");
			String CUSUARI_ORI = getCampoTextual(request, "CUSUARI_ORI");
			String RESAPUN = getCampoTextual(request, "RESAPUN"); // CONF-347-01/12/2016-RCS
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

			BigDecimal CTIPAPU = getCampoNumerico(request, "CTIPAPU");
			if (isEmpty(CTIPAPU))
				CTIPAPU = new BigDecimal(1);

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_AGENDA(IDAPUNTE, IDAGENDA, CCLAGD, TCLAGD, CCONAPU,
					CESTAPU, CGRUPO, TGRUPO, TTITAPU, TAPUNTE, CTIPAPU, CPERAGD, CAMBITO, CPRIORI, CUSUARI, FAPUNTE,
					FESTAPU, FALTA, FRECORDATORIO, CUSUARI_ORI, CGRUPO_ORI, TGRUPO_ORI, RESAPUN, NTRAMIT); // CONF-347-01/12/2016-RCS
																											// Se
																											// adiciona
																											// RESAPUN

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

				BigDecimal NUEVO = getCampoNumerico(request, "NUEVO");
				formdata.remove("NUEVO");
				request.removeAttribute("NUEVO");
				formdata.put("OK", "1");
				formdata.put("IDAPUNTE", new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))));
				request.setAttribute("IDAPUNTE", new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))));

				m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_AGENDA(
						new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))), IDAGENDA);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.putAll((HashMap) m.get("POBAGENDA"));
					formdata.put("TCLAGD_OUT", formdata.get("TCLAGD"));
					if (!isEmpty(formdata.get("CCLAGD"))) {
						if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 1)
							formdata.put("SSEGURO", formdata.get("TCLAGD"));
						else if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 0)
							formdata.put("NSINIES", formdata.get("TCLAGD"));
					}
				}
			}
			this.m_actualitzarModo(request, thisAction);
			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_busqueda_poliza(HttpServletRequest request, Axisagd004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			////////////////// DATOS POLIZA ////////////////////////////////////
			/*
			 * Map map =
			 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			 */
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = (Map) paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORCLAGD("1", String.valueOf(SSEGURO));

			ArrayList datosPoliza = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(datosPoliza);

			/*
			 * 
			 * Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax (map, new
			 * String[] {"ONPOLIZA", "OSSEGURO"});
			 * 
			 * if (resultadoAjax[0].equals(new BigDecimal(0))) { Map ONPOLIZA = new
			 * HashMap(); ONPOLIZA.put("ONPOLIZA", resultadoAjax[1]); Map OSSEGURO = new
			 * HashMap(); OSSEGURO.put("OSSEGURO", resultadoAjax[2]); List RESULTADO = new
			 * ArrayList(); RESULTADO.add (ONPOLIZA); RESULTADO.add (OSSEGURO);
			 * 
			 * ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004 - m�todo m_ajax_busqueda_poliza", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_valoresgrupo(HttpServletRequest request, Axisagd004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CGRUPO = getHiddenCampoTextual(request, "CGRUPO");

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(1));

			ArrayList datos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datos)) {
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(datos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004 - m�todo m_ajax_busqueda_valoresgrupo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_set_chat(HttpServletRequest request, Axisagd004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");
			BigDecimal NMOVAGD = this.getHiddenCampoNumerico(request, "NMOVAGD");
			BigDecimal NMOVCHAT = this.getHiddenCampoNumerico(request, "NMOVCHAT");
			String TTEXTO = this.getHiddenCampoTextual(request, "TTEXTO");
			BigDecimal CTIPRES = this.getHiddenCampoNumerico(request, "CTIPRES");
			String CUSUARI = getHiddenCampoTextual(request, "CUSUARI");
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");
			String TGRUPO = this.getHiddenCampoTextual(request, "TGRUPO");

			if (isEmpty(CUSUARI) && isEmpty(CGRUPO))
				CUSUARI = usuario.getCusuari();

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_CHAT(IDAGENDA, IDAPUNTE, NMOVAGD, NMOVCHAT, TTEXTO,
					CUSUARI, CGRUPO, TGRUPO, CTIPRES);

			this.tratarRETURNyMENSAJES(request, map);

			Map mm = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTCHAT(IDAGENDA, IDAPUNTE, null, null, null, null,
					null);

			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(mm));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004 - m�todo m_ajax_busqueda_valoresgrupo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_siniestro(HttpServletRequest request, Axisagd004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String NSINIES = getHiddenCampoTextual(request, "NSINIES");

			PAC_IAX_SINIESTROS pacIaxSinis = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal filtro = this.getFiltro(request);
			////////////////// DATOS POLIZA ////////////////////////////////////
			Map map = pacIaxSinis.ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI(null, null, NSINIES, null, filtro,
					null);

			ArrayList datosPoliza = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datosPoliza)) {
				ajax.rellenarPlAContenedorAjax((HashMap) datosPoliza.get(0));
				ajax.guardarContenidoFinalAContenedorAjax((HashMap) datosPoliza.get(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004 - m�todo m_ajax_busqueda_siniestro", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_recibo(HttpServletRequest request, Axisagd004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal NRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			// Info del recibo

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO, new BigDecimal(0));

			Map datosREC = (Map) tratarRETURNyMENSAJES(request, map1, false);
			ajax.rellenarPlAContenedorAjax(datosREC);
			ajax.guardarContenidoFinalAContenedorAjax(datosREC);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd004 - m�todo m_ajax_busqueda_recibo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_navegar(HttpServletRequest request, Axisagd004Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal NRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NRECIBO", NRECIBO);
			String NSINIES = getHiddenCampoTextual(request, "NSINIES");
			String NSINIESselected = getHiddenCampoTextual(request, "NSINIES");

			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			thisAction.topPila(request, "formdata_Axisagd004", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_volver(HttpServletRequest request, Axisagd004Action thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", (String) thisAction.removeTopPila(request, "NSINIES"));

			Map formdata_Axisagd004 = (Map) thisAction.removeTopPila(request, "formdata_Axisagd004");
			if (!isEmpty(formdata_Axisagd004)) {
				formdata.putAll(formdata_Axisagd004);
			}
			this.m_cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
