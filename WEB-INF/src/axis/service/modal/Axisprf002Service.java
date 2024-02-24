package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
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
import axis.mvc.control.modal.Axisprf002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf002Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// this.cargaListaRamos(request);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf002Action thisAction) {
		logger.debug("Axisprf002Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
			if (psprofes == null) {
				psprofes = this.getCampoNumerico(request, "pSPROFES");
			}
			BigDecimal psperson = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPROFES", psprofes);
			logger.debug("++++sprofes: " + psprofes);

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(psprofes);

			formdata.put("OBPROF", (Map) map.get("OBPROFESIONAL"));
			logger.debug("++++profesional: " + map);

			if (psperson == null && map.get("RETURN") != null) {
				Map ppsperson = (Map) map.get("OBPROFESIONAL");
				psperson = (BigDecimal) ppsperson.get("SPERSON");
			}
			formdata.put("SPERSON", psperson);

			this.cargarPersona(request, thisAction, usuario, formdata);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(psperson);
			logger.debug("++++map DOMICILIOS-->" + map);
			List DOMISPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("DOMISPROF", DOMISPROF);

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_LSTTELEFONOS(psperson);
			logger.debug("++++map TELEFONOS-->" + map);
			List TELFSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TELFSPROF", TELFSPROF);

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {

				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf002Action thisAction) {
		logger.debug("Axisprf002Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal pCDOMICI = this.getCampoNumerico(request, "CDOMICI");
			String pNREGMER = this.getCampoTextual(request, "NREGMER");
			Date pFREGMER = this.stringToSqlDate(this.getCampoTextual(request, "FREGMER"));
			BigDecimal pNLIMITE = this.getCampoNumerico(request, "NLIMITE");
			BigDecimal pCNOASIS = this.getCampoNumerico(request, "CNOASIS");
			BigDecimal pCTELCLI = this.getCampoNumerico(request, "CTELCLI");
			BigDecimal pCMODCON = this.getCampoNumerico(request, "CTELCLI");
			String pTNOMBRE = this.getCampoTextual(request, "TNOMBRE");
			String pTTELCLI = this.getCampoTextual(request, "TTELCLI");
			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_PROFESIONAL(pSPROFES, pSPERSON, pTNOMBRE, pNREGMER,
						pFREGMER, pCDOMICI, pCMODCON, pCTELCLI, pNLIMITE, pCNOASIS, new BigDecimal(2));
			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_PROFESIONAL(pSPROFES, pSPERSON, pTNOMBRE, pNREGMER,
						pFREGMER, pCDOMICI, pCMODCON, pCTELCLI, pNLIMITE, pCNOASIS, new BigDecimal(1));
			}

			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
				formdata.put("SPROFES_INI", pSPROFES);
			} else {
				if (!isEmpty(map.get("PTEXTO"))) {
					formdata.put("mensaje_aviso", map.get("PTEXTO"));
				}
				formdata.put("guardat", "1");

				formdata.put("SPROFES", pSPROFES);

				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(pSPROFES);

				formdata.put("OBPROF", (Map) map.get("OBPROFESIONAL"));
				formdata.put("SPERSON", pSPERSON);

				this.cargarPersona(request, thisAction, usuario, formdata);

				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(pSPERSON);
				logger.debug("++++map DOMICILIOS-->" + map);
				List DOMISPROF = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("DOMISPROF", DOMISPROF);

				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_LSTTELEFONOS(pSPERSON);
				logger.debug("++++map TELEFONOS-->" + map);
				List TELFSPROF = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("TELFSPROF", TELFSPROF);

				formdata.put("CDOMICI", pCDOMICI);
				formdata.put("NREGMER", pNREGMER);
				formdata.put("FREGMER", pFREGMER);
				formdata.put("NLIMITE", pNLIMITE);
				formdata.put("CNOASIS", pCNOASIS);
				formdata.put("CTELCLI", pCTELCLI);
				formdata.put("TNOMBRE", pTNOMBRE);
				formdata.put("TTELCLI", pTTELCLI);
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf002Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarPersona(HttpServletRequest request, Axisprf002Action thisAction, UsuarioBean usuario,
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
							StringBuffer nombreCompleto = new StringBuffer();
							nombreCompleto.append(
									(String) OBPERSONA.get("TNOMBRE") == null ? "" : (String) OBPERSONA.get("TNOMBRE"));
							nombreCompleto.append(" ");
							nombreCompleto.append((String) OBPERSONA.get("TAPELLI1") == null ? ""
									: (String) OBPERSONA.get("TAPELLI1"));
							nombreCompleto.append(" ");
							nombreCompleto.append((String) OBPERSONA.get("TAPELLI2") == null ? ""
									: (String) OBPERSONA.get("TAPELLI2"));
							formdata.put("TNOMBRE", nombreCompleto);
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper002Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
