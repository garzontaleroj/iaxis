package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axissin058Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin058Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin058Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axissin058Action thisAction) {
		logger.debug("Axissin058Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			formdata.put("NSINIES", getCampoTextual(request, "NSINIES"));
			formdata.put("NTRAMIT", getCampoNumerico(request, "NTRAMIT"));
			formdata.put("NLOCALI", getCampoNumerico(request, "NLOCALI"));
			formdata.put("CTIPPRO", getCampoNumerico(request, "CTIPPRO"));
			formdata.put("CSUBPRO", getCampoNumerico(request, "CSUBPRO"));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(737));
			logger.debug(map);
			List VALORES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("VALORES", VALORES);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(738));
			logger.debug(map);
			List TIPO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TIPO", TIPO);

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_LSTTERMINOS();
			logger.debug(map);
			List TERMINO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTTERMINO", TERMINO);

			formdata.put("STARIFA", this.getCampoNumerico(request, "STARIFA"));
			formdata.put("TTARIFA", request.getParameter("TTARIFA"));

			this.cargarPersona(request, thisAction, usuario, formdata);

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {

			}

		} catch (Exception e) {
			logger.error("Error en el servicio axissin058Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axissin058Action thisAction) {
		logger.debug("Axissin058Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String pNSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal pNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pCAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pNLOCALI = getCampoNumerico(request, "NLOCALI");
			BigDecimal pCTIPPRO = getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = getCampoNumerico(request, "CSUBPRO");
			String pNNUMIDE = this.getCampoTextual(request, "pNNUMIDE");
			String pTNOMBRE = this.getCampoTextual(request, "pTNOMBRE");
			String pTEMAIL = this.getCampoTextual(request, "TEMAIL");
			BigDecimal pSTARIFA = this.getCampoNumerico(request, "STARIFA");
			String pTERMINO = this.getCampoTextual(request, "TERMINO");
			BigDecimal pCVALOR = this.getCampoNumerico(request, "CVALOR");
			BigDecimal pCTIPO = this.getCampoNumerico(request, "CTIPO");
			BigDecimal pNIMPORTE = null;
			BigDecimal pNPORCENT = null;
			if (pCTIPO != null && pCTIPO.equals(new BigDecimal(1))) {
				pNIMPORTE = this.getCampoNumerico(request, "NIMPORTE");
			} else if (pCTIPO != null && pCTIPO.equals(new BigDecimal(2))) {
				pNPORCENT = this.getCampoNumerico(request, "NPORCENT");
			}

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_CONVENIO_TEMPORAL(pNSINIES, pNTRAMIT, pSPERSON, pNLOCALI,
					pCTIPPRO, pCSUBPRO, pSTARIFA, pNNUMIDE, pTNOMBRE, pCVALOR, pCTIPO, pNIMPORTE, pNPORCENT, pTERMINO,
					pTEMAIL, pCAGENTE);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
				formdata.put("SPROFES", map.get("PSPROFES"));
				formdata.put("SCONVEN", map.get("PSCONVEN"));
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			logger.debug("$$$$$$$$$$$$ fin guardar convenio pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio axissin058Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		logger.debug("$$$$$$$$$$$$ Propiedades_Pantalla cargadas: ");

	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(737));
		logger.debug(map);
		List VALORES = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("VALORES", VALORES);

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(738));
		logger.debug(map);
		List TIPO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPO", TIPO);

		map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_LSTTERMINOS();
		logger.debug(map);
		List TERMINO = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("LSTTERMINO", TERMINO);
	}

	public void m_ajax_buscar_tarifa(HttpServletRequest request) {
		logger.debug("Axissin058Service m_ajax_buscar_tarifa");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaTarifa(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin058Service - m�todo m_ajax_buscar_tarifa", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaTarifa(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal STARIFA = getCampoNumerico(request, "STARIFA");
		logger.debug("---------- VALOR tarifa  :" + STARIFA);

		Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_TDESCRI_TARIFA(STARIFA);
		logger.debug("++++map starifa " + map);

		List listaTarifa = (List) ajax.rellenarPlAContenedorAjax(map);

		logger.debug("++++TARIFA " + listaTarifa);
		return listaTarifa;
	}

	private void cargarPersona(HttpServletRequest request, Axissin058Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map OBPERSONA = new HashMap();

		try {
			BigDecimal SPERSON = null;

			SPERSON = getCampoNumerico(request, "SPERSON");

			logger.debug("SPERSON ----> " + SPERSON);

			BigDecimal CEMPRES = null; // null siempre

			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTEselected"))
					? getCampoNumerico(request, "CAGENTE")
					: getCampoNumerico(request, "CAGENTEselected"); // null siempre
			logger.debug("CAGENTE ----> " + CAGENTE);

			if (isEmpty(CAGENTE) && !isEmpty(request.getParameter("CAGENTE")))
				CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));

			logger.debug("CAGENTE2 ----> " + CAGENTE);

			logger.debug("OBPERSONA.put");

			OBPERSONA.put("isNew", Boolean.valueOf(true));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTION_REC pac_axis_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				if (isEmpty(request.getAttribute("agents_visio"))) {
					Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON);
					logger.debug(mapAg);
					request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg)) && isEmpty(CAGENTE)) {
						List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
						if (retornAgentesVision.size() > 0) {
							HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
							CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
							formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						}
					}
				}

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					request.setAttribute("dades_persona", (Map) map.get("OBPERSONA"));
					BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
					if (!isEmpty(OBPERSONA)) {
						String TTIPPER = (String) OBPERSONA.get("TTIPPER");
						if (isEmpty(TTIPPER) || !TTIPPER.equals("")) {
							if (!isEmpty(CTIPPER)) {
								if (new BigDecimal(1).equals(CTIPPER)) {
									TTIPPER = "F�sica";
								} else if (new BigDecimal(2).equals(CTIPPER)) {
									TTIPPER = "Jur�dica";
								}
							}
						}
						formdata.put("TTIPPER", TTIPPER);
						formdata.put("TTIPIDE", OBPERSONA.get("TTIPIDE"));
						formdata.put("NNUMIDE", OBPERSONA.get("NNUMIDE"));
						if (new BigDecimal(2).equals(CTIPPER)) {
							formdata.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						} else {
							String nombreCompleto = (String) OBPERSONA.get("TNOMBRE") + " " + OBPERSONA.get("TAPELLI1")
									+ " " + OBPERSONA.get("TAPELLI2");
							formdata.put("TNOMBRE", nombreCompleto);
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin058Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
