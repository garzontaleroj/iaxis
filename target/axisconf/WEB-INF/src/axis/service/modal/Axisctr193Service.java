//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr193Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.Traductor;

/**
 * Axisctr193Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr193Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisctr193Action thisAction) {
		logger.debug("Axisctr176Service m_init");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Date PFINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date PFFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr193Action thisAction) {
		logger.debug("Axisctr176Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String MODO = getCampoTextual(request, "CMODO");
			formdata.put("CMODO", MODO);
			logger.debug(MODO + " " + CAGENTE);

			BigDecimal PCCOMISI = getCampoNumerico(request, "CCOMISI");

			if (MODO.equals("MODIFICAR")) {
				Map map = new PAC_IAX_PRODUCCION((Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_CORRETAJE(CAGENTE);
				logger.debug(map);
				Map ob_retorno = (Map) tratarRETURNyMENSAJES(request, map);
				formdata.put("axisctr_retorno", ob_retorno);

			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisctr193Action thisAction) {
		logger.debug("Axisctr193Service m_aceptar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;

			String PMODO = getCampoTextual(request, "CMODO");
			BigDecimal PPARTICI = getCampoNumerico(request, "PPARTICI");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");

			if (PMODO.equals("NUEVO")) {
				// funci�n PAC_IAX_PRODUCCION--F_GRABACORRETAJE
				map = new PAC_IAX_PRODUCCION((Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GRABARETORNO(SPERSON, PPARTICI, IDCONVENIO);

			} else { // TODO: La funcion nos deber�a pedir el CMODO al grbar la persona
				map = new PAC_IAX_PRODUCCION((Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GRABARETORNO(SPERSON, PPARTICI, IDCONVENIO);
			}

			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
				formdata.put("SPERSON_SELECTED", SPERSON);
			} else {
				formdata.put("OK", new BigDecimal(1));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		String CONDICION = "CORRETAJE_TIPAGE_4";
		return ActualizaAgente(request, CAGENTE, CONDICION);
	}

	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE, String PCONDICION) throws Exception {
		Map mapAgentes = new HashMap();
		String NOMBRE = getCampoTextual(request, "NOMBRE");
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		BigDecimal CAGENTE2 = getCampoNumerico(request, "CAGENTE");
		String CONDICION = PCONDICION;

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			mapAgentes = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/*
	 * *****************************************************************************
	 * ************************************
	 */
	/*
	 * ********************************************* TRATAMIENTO PERSONA
	 * ***********************************************
	 */
	/*
	 * *****************************************************************************
	 * ************************************
	 */

	public void m_ajax_get_datos_tomador(HttpServletRequest request) {
		logger.debug("Axisctr193Service AJAX m_ajax_get_datos_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = dbLeeUltTomadores(request, usuario);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axisctr193Service m_ajax_get_datos_tomador - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * *****************************************************************************
	 * ************************************
	 */
	/*
	 * ********************************************* TRATAMIENTO PERSONA
	 * ***********************************************
	 */
	/*
	 * *****************************************************************************
	 * ************************************
	 */

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axisctr193Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_ESTPERSONA(SPERSON, null);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axisctr193Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * *****************************************************************************
	 * ************************************
	 */
	/*
	 * ********************************************* TRATAMIENTO PERSONA
	 * ***********************************************
	 */
	/*
	 * *****************************************************************************
	 * ************************************
	 */

	public void m_ajax_get_intermediario_beneficiario(HttpServletRequest request) {
		logger.debug("Axisctr193Service AJAX m_ajax_get_intermediario_beneficiario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String NNUMNIF = getCampoTextual(request, "NNUMIDE");
		String NOMBRE = getCampoTextual(request, "NOMBRE");
		String NSIP = getCampoTextual(request, "NSIP");
		String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");
		BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
		String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
		String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
		String MODO_SWPUBLI = "PERSONAS_PRIVADAS";
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		String CONDICION = null;
		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		String CODITABLAS = getCampoTextual(request, "CODITABLAS");
		String SNIP = getCampoTextual(request, "SNIP");
		BigDecimal CEMPRES = null;
		BigDecimal CAGENTE_IN = (BigDecimal) request.getSession().getAttribute("CAGENTE");
		String FIDEICO = getCampoTextual(request, "FIDEICO");
		try {
			PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(NNUMNIF, NOMBRECOMP, NSIP, SSEGURO,
					NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE, null, null, null, null, FIDEICO);

			logger.debug(map);
			if (map == null) {
				logger.debug("Axisctr193Service m_ajax_get_intermediario_beneficiario - fin");
				return;
			}
			ArrayList lst = (ArrayList) map.get("RETURN");
			if (isEmpty(lst)) {
				logger.debug("Axisctr193Service m_ajax_get_intermediario_beneficiario - fin");
				ajax.guardarErrorAContenedorAjax(Traductor.traducir(getLocale(request).toString(), "1000254"));
				return;
			}
			HashMap lstmap = (HashMap) lst.get(0);
			SPERSON = (BigDecimal) lstmap.get("CODI");
			CODITABLAS = (String) lstmap.get("CODITABLAS");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			SSEGURO_OUT = !isEmpty(SSEGURO_OUT) ? SSEGURO_OUT : SSEGURO;
			Map map2 = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_TRASPASAPERSONAEST(SPERSON, CAGENTE, CODITABLAS,
					SSEGURO_OUT, SNIP);
			logger.debug(map2);

			if (!isEmpty(map2) && new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map2))) {
				request.setAttribute("SPERSON_OUT", map2.get("PSPERSON_OUT"));
			}
			map2.putAll(map);
			formdata.putAll(map2);
			ajax.rellenarPlAContenedorAjax(map2);
			ajax.guardarContenidoFinalAContenedorAjax(map2);
			logger.debug("Axisctr193Service m_ajax_get_intermediario_beneficiario - fin");
		} catch (Exception e) {
			logger.error("Axisctr193Service m_ajax_get_intermediario_beneficiario - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private Map dbLeeUltTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEULTTOMADORES();
		logger.debug("DATOS �LTIMO TOMADOR ->" + map);
		return map;
	}

}
