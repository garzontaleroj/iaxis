//Revision:# STo9F2TJ6y5DmvDAbK0aYw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisagd001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisagd001Service.java Fecha: 23/11/2010 PROP�SITO (descripci�n
 * pantalla): Ejemplo : Pantalla Agenda Usuario
 * 
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 23/11/2010 XPL 1. Creaci�n de la
 * pantalla. 16417: CRT003 - An�lisis Agenda de usuario
 */
public class Axisagd001Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisagd001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void m_actualitzarModo(HttpServletRequest request, Axisagd001Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");

			this.m_actualitzarModo(request, thisAction);

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_AGENDA(IDAPUNTE, IDAGENDA);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.putAll((HashMap) m.get("POBAGENDA"));
				formdata.put("TCLAGD_OUT", formdata.get("TCLAGD"));
				logger.debug(formdata.get("TCLAGD"));
				logger.debug("CCLAGD->" + formdata.get("CCLAGD"));
				if (!isEmpty(formdata.get("CCLAGD"))) {
					if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 1)
						formdata.put("SSEGURO", formdata.get("TCLAGD"));
					else if (((BigDecimal) formdata.get("CCLAGD")).intValue() == 0)
						formdata.put("NSINIES", formdata.get("TCLAGD"));
				}
			}

			String CUSUARI = (String) formdata.get("CUSUARI");
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");

			if (isEmpty(CUSUARI) && isEmpty(CGRUPO))
				formdata.put("CUSUARI", usuario.getCusuari());

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd001Service - m�todo m_form", e);
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
	private void m_cargarCombos(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001Service m_cargarCombos");
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
			logger.debug(map);
			listValores.put("lstconcepto", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800029));
			logger.debug(map);
			listValores.put("lstmodulos", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800032));
			logger.debug(map);
			listValores.put("lstgrupos", tratarRETURNyMENSAJES(request, map, false));

			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");

			if (!isEmpty(CGRUPO)) {
				map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(1));
				logger.debug(map);
				listValores.put("lstvaloresgrupos", tratarRETURNyMENSAJES(request, map, false));
			}

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA();
			logger.debug(map);
			listValores.put("lsttipos", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			logger.debug(map);
			listValores.put("lstusuarios", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd001Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");
			BigDecimal CCLAGD = this.getHiddenCampoNumerico(request, "CCLAGD");
			BigDecimal CCONAPU = this.getHiddenCampoNumerico(request, "CCONAPU");
			BigDecimal CESTAPU = this.getHiddenCampoNumerico(request, "CESTAPU");
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");
			String TGRUPO = this.getHiddenCampoTextual(request, "TGRUPO");
			BigDecimal CTIPAPU = this.getHiddenCampoNumerico(request, "CTIPAPU");
			BigDecimal CPERAGD = this.getHiddenCampoNumerico(request, "CPERAGD");
			BigDecimal CAMBITO = this.getHiddenCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = this.getHiddenCampoNumerico(request, "CPRIORI");
			String TCLAGD = this.getHiddenCampoTextual(request, "TCLAGD");
			String TTITAPU = this.getHiddenCampoTextual(request, "TTITAPU");
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");
			String TAPUNTE = this.getHiddenCampoTextual(request, "TAPUNTE");
			java.sql.Date FALTA = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FALTA"));
			java.sql.Date FAPUNTE = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FAPUNTE"));
			java.sql.Date FESTAPU = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FESTAPU"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FRECORDATORIO"));

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_AGENDA(IDAPUNTE, IDAGENDA, CCLAGD, TCLAGD, CCONAPU,
					CESTAPU, CGRUPO, TGRUPO, TTITAPU, TAPUNTE, CTIPAPU, CPERAGD, CAMBITO, CPRIORI, CUSUARI, FAPUNTE,
					FESTAPU, FALTA, FRECORDATORIO, null, null, null, null, null); // CONF-347-01/12/2016-RCS
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				BigDecimal NUEVO = this.getHiddenCampoNumerico(request, "NUEVO");
				formdata.remove("NUEVO");
				request.removeAttribute("NUEVO");
				formdata.put("OK", "1");
				formdata.put("IDAPUNTE", new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))));
				request.setAttribute("IDAPUNTE", new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))));

				m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_AGENDA(
						new BigDecimal(String.valueOf(m.get("PIDAPUNTE_OUT"))), IDAGENDA);
				logger.debug(m);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.putAll((HashMap) m.get("POBAGENDA"));
					formdata.put("TCLAGD_OUT", formdata.get("TCLAGD"));
					logger.debug(formdata.get("TCLAGD"));
					logger.debug("CCLAGD->" + formdata.get("CCLAGD"));
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
			logger.error("Error en el servicio Axisagd001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_busqueda_poliza(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001 m_ajax_busqueda_poliza");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			////////////////// DATOS POLIZA ////////////////////////////////////
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
			ajax.rellenarPlAContenedorAjax(datosPoliza);
			ajax.guardarContenidoFinalAContenedorAjax(datosPoliza);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd001 - m�todo m_ajax_busqueda_poliza", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_valoresgrupo(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001 m_ajax_busqueda_valoresgrupo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CGRUPO = getHiddenCampoTextual(request, "CGRUPO");

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(1));
			logger.debug(map);

			ArrayList datos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datos)) {
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(datos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd001 - m�todo m_ajax_busqueda_valoresgrupo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_siniestro(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001 m_ajax_busqueda_siniestro");
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
			logger.debug(map);
			ArrayList datosPoliza = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datosPoliza)) {
				ajax.rellenarPlAContenedorAjax((HashMap) datosPoliza.get(0));
				ajax.guardarContenidoFinalAContenedorAjax((HashMap) datosPoliza.get(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd001 - m�todo m_ajax_busqueda_siniestro", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_navegar(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisagd001Service m_navegar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			String NSINIES = getHiddenCampoTextual(request, "NSINIES");
			String NSINIESselected = getHiddenCampoTextual(request, "NSINIES");

			logger.debug(NSINIES);
			logger.debug(NSINIESselected);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			thisAction.topPila(request, "formdata_Axisagd001", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_volver(HttpServletRequest request, Axisagd001Action thisAction) {
		logger.debug("Axisint001Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", (String) thisAction.removeTopPila(request, "NSINIES"));

			Map formdata_Axisagd001 = (Map) thisAction.removeTopPila(request, "formdata_Axisagd001");
			if (!isEmpty(formdata_Axisagd001)) {
				formdata.putAll(formdata_Axisagd001);
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
