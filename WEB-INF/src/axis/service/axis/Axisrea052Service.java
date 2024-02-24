package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea052Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisrea052Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisrea052Action thisAction) {
		logger.debug("Axisrea052Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CMODO = getCampoTextual(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new String(request.getParameter("CAGENTE"));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			formdata.put("CMODO", CMODO);

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);
			/* m_buscar */
			if (formdata.get("CMODO") != null && formdata.get("CMODO").equals("ALTA_POLIZA")) {
				m_buscarAltaPoliza(request, thisAction);
			} else if (formdata.get("CMODO") != null && formdata.get("CMODO").equals("MANTTO_PER")) {
				m_buscarManttoPer(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea052Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que realiza calculos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_calcular(HttpServletRequest request, Axisrea052Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea052Service m_calcular");

		try {

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
			BigDecimal CESVALOR = getCampoNumerico(request, "CESVALOR");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			logger.debug("SPERSON  " + SPERSON);

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(FCORTE, CESVALOR.toString(),
					NNUMIDE);
			List<Map> lstAcumulacionesRG = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstAcumulacionesRG", lstAcumulacionesRG);

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_CONSORCIO(FCORTE, CESVALOR.toString(),
					NNUMIDE);
			List<Map> lstAcumulacionesRI = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstAcumulacionesRI", lstAcumulacionesRI);

			formdata.put("FCORTE", FCORTE);
			formdata.put("NNUMIDE", NNUMIDE);
			formdata.put("CESVALOR", CESVALOR.toString());

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(FCORTE, CESVALOR.toString(),
					NNUMIDE);
			List<Map> lstPintaContratos = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstPintaContratos", lstPintaContratos);
			if (!isEmpty(map) && lstPintaContratos != null) {
				for (Map iLst : lstPintaContratos) {
					formdata.put("Q1", iLst.get("Q1"));
					formdata.put("Q2", iLst.get("Q2"));
					formdata.put("Q3", iLst.get("Q3"));
					formdata.put("Q4", iLst.get("Q4"));
					formdata.put("Q6", iLst.get("Q6"));
					formdata.put("Q7", iLst.get("Q7"));
					formdata.put("Q8", iLst.get("Q8"));
					formdata.put("Q9", iLst.get("Q9"));
					formdata.put("Q10", iLst.get("Q10"));
				}
			}

			// thisAction.guardarMensaje(request, "111313", new Object[] {
			// map.get("MENSAJES") },Constantes.MENSAJE_INFO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea052Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*****
	 * Ajax
	 */
	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axiscga002Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");

			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug("--> persona:" + OB_PERSONA);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axiscga002Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*****
	 * Ajax
	 */
	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisrea052Action thisAction) {
		logger.debug("Axisper025Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");

			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug("--> persona:" + OB_PERSONA);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisper036Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscarAltaPoliza(HttpServletRequest request, Axisrea052Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea052Service m_buscar");

		try {

			Date FCORTE = new Date(new java.util.Date().getTime()); // Recoger la fecha actual

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_TIPCUM();
			logger.debug(map);
			BigDecimal tipoCumulo = (BigDecimal) map.get("RETURN");

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_TOMADOR();
			logger.debug(map);
			BigDecimal SPERSON = (BigDecimal) map.get("RETURN");

			BigDecimal CAGENTE = null;
			map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON);
			logger.debug(map);
			request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, map));
			if (!isEmpty(tratarRETURNyMENSAJES(request, map)) && isEmpty(CAGENTE)) {
				List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, map);
				if (retornAgentesVision.size() > 0) {
					HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
					CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
					formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
				}
			}

			String NOMBRE = "";
			String NNUMIDE = null;

			Map OBPERSONACI = new HashMap();
			OBPERSONACI.put("isNew", Boolean.valueOf(true));

			if (!isEmpty(SPERSON)) {
				OBPERSONACI.put("isNew", Boolean.valueOf(false));

				map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONACI = (Map) map.get("OBPERSONA");
					NNUMIDE = (String) OBPERSONACI.get("NNUMIDE");
					if (OBPERSONACI.get("TNOMBRE") != null && !"".equals(OBPERSONACI.get("TNOMBRE")))
						NOMBRE = NOMBRE + ((String) OBPERSONACI.get("TNOMBRE")).trim() + " ";
					if (OBPERSONACI.get("TAPELLI1") != null && !"".equals(OBPERSONACI.get("TAPELLI1")))
						NOMBRE = NOMBRE + ((String) OBPERSONACI.get("TAPELLI1")).trim() + " ";
					if (OBPERSONACI.get("TAPELLI2") != null && !"".equals(OBPERSONACI.get("TAPELLI2")))
						NOMBRE = NOMBRE + ((String) OBPERSONACI.get("TAPELLI2")).trim();
				}
			}

			if (FCORTE != null && tipoCumulo != null && NNUMIDE != null) {
				map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(FCORTE, tipoCumulo.toString(),
						NNUMIDE);
				List<Map> lstAcumulacionesRG = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				formdata.put("lstAcumulacionesRG", lstAcumulacionesRG);

				map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_CONSORCIO(FCORTE,
						tipoCumulo.toString(), NNUMIDE);
				List<Map> lstAcumulacionesRI = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				formdata.put("lstAcumulacionesRI", lstAcumulacionesRI);

				logger.debug(map);
				formdata.put("NNUMIDE", NNUMIDE);
				formdata.put("NOMBRE", NOMBRE);
				formdata.put("CESVALOR", tipoCumulo.toString());
				formdata.put("lstAcumulacionesRG", lstAcumulacionesRG);

				formdata.put("FCORTE", FCORTE);

				map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(FCORTE,
						tipoCumulo.toString(), NNUMIDE);
				List<Map> lstPintaContratos = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				formdata.put("lstPintaContratos", lstPintaContratos);
				if (!isEmpty(map) && lstPintaContratos != null) {
					for (Map iLst : lstPintaContratos) {
						formdata.put("Q1", iLst.get("Q1"));
						formdata.put("Q2", iLst.get("Q2"));
						formdata.put("Q3", iLst.get("Q3"));
						formdata.put("Q4", iLst.get("Q4"));
						formdata.put("Q6", iLst.get("Q6"));
						formdata.put("Q7", iLst.get("Q7"));
						formdata.put("Q8", iLst.get("Q8"));
						formdata.put("Q9", iLst.get("Q9"));
						formdata.put("Q10", iLst.get("Q10"));
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea052Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscarManttoPer(HttpServletRequest request, Axisrea052Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea052Service m_buscarManttoPer");

		try {

			Date FCORTE = new Date(new java.util.Date().getTime()); // Recoger la fecha actual
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");

			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			formdata.put("CAGENTE", bigDecimalToString(CAGENTE));
			formdata.put("NNUMIDE", NNUMIDE);
			formdata.put("NOMBRE", NOMBRE);
			formdata.put("FCORTE", FCORTE);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea052Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista de valores
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(225));
			logger.debug(map);
			listValores.put("lstTipoDeCumulo", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea052Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/**
	 * Realiza la carga de las q-tas al formdata.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarQtasRI(HttpServletRequest request, UsuarioBean usuario, Map formdata) throws Exception {
		// Carga de valores de las qtas
		try {

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Date FCORTE = stringToSqlDate((String) formdata.get("FCORTE"));

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(FCORTE,
					formdata.get("TCUMULO").toString(), (String) formdata.get("NNUMIDE"));
			List<Map> lstPintaContratos = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstPintaContratos", lstPintaContratos);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea052Service.cargarQtasRI", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
