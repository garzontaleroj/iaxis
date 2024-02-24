package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.mvc.control.axis.Axisprf001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisprf001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisprf001Action thisAction) {
		logger.debug("Axisprf001Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axisprf001Action thisAction) {
		logger.debug("Axisprf001Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String sprofes = request.getParameter("pCodiProf");
			String sperson = request.getParameter("SPERSON");
			logger.debug("+++++++codi m_form string: " + sprofes);
			logger.debug("+++++++sperson m_form string: " + sperson);
			BigDecimal codi = null;
			formdata.put("SPROFES_INI", sprofes);

			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}
			logger.debug("+++++++codi: " + codi);
			logger.debug("+++++++sperson: " + sperson);

			this.cargarDatosProfesional(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio axisprf001Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_del_estado(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_estado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPsrofes = this.getCampoNumerico(request, "pCodiProf");
			logger.debug(this.getCampoTextual(request, "FESTADO").substring(0, 10));
			String fecha = this.getCampoTextual(request, "FESTADO").substring(0, 10);
			logger.debug("parseo: " + this.stringToSqlDate(this.getCampoTextual(request, "FESTADO").substring(0, 10)));
			Date pFESTADO = Date.valueOf(fecha);

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_ESTADO(pPsrofes, pFESTADO);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_estado", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_ccc(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_ccc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCNORDEN = this.getCampoNumerico(request, "CNORDEN");

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_CCC(pSPROFES, pCNORDEN);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_ccc", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_carga(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_carga");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
			String fecha = this.getCampoTextual(request, "FDESDE").substring(0, 10);
			Date pFDESDE = Date.valueOf(fecha);

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_CARGA(pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_carga", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_perscont(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_perscont");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pNORDCTO = this.getCampoNumerico(request, "NORDCTO");

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_CONTACTO_PER(pSPROFES, pNORDCTO);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_perscont", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_carga_real(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_carga_real");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");
			String fecha = this.getCampoTextual(request, "FDESDE").substring(0, 10);
			Date pFDESDE = Date.valueOf(fecha);

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_CARGA_REAL(pSPROFES, pCTIPPRO, pCSUBPRO, pFDESDE);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_carga_real", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarDatosProfesional(HttpServletRequest request, Axisprf001Action thisAction, Map formdata)
			throws Exception {
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String sprofes = request.getParameter("pCodiProf");
			BigDecimal psperson = null;
			BigDecimal codi = null;
			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(codi);

			if (map.get("RETURN") != null) {
				Map ppsperson = (Map) map.get("OBPROFESIONAL");
				psperson = (BigDecimal) ppsperson.get("SPERSON");
			}
			formdata.put("SPERSON", psperson);

			logger.debug("++++MAP PROFESIONAL: " + map);
			formdata.put("OBPROFESIONAL", map.get("OBPROFESIONAL"));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (psperson != null) {
				Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(psperson);
				logger.debug(mapAg);
				request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
				if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg))) {
					List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
					if (retornAgentesVision.size() > 0) {
						HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
						BigDecimal CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
						formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						logger.debug("++++CAGENTE: " + CAGENTE);
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

	public void m_del_rol(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_rol");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPPRO = this.getCampoNumerico(request, "CTIPPRO");
			BigDecimal pCSUBPRO = this.getCampoNumerico(request, "CSUBPRO");

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_ROL(pSPROFES, pCTIPPRO, pCSUBPRO);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_rol", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_set_contacto_pref(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_set_contacto_pref");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			// BigDecimal pCMODCON = this.getCampoNumerico(request,"CMODCON");
			BigDecimal pCMODCON = new BigDecimal(request.getParameter("CMODCON"));

			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_CONTACTO_PREF(pSPROFES, pCMODCON);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_set_contacto_pref", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_impuesto(HttpServletRequest request, Axisprf001Action this1) {
		logger.debug("Axisprf001Service m_del_impuesto");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SIN_IMP_SAP PAC_IAX_SIN_IMP_SAP = new PAC_IAX_SIN_IMP_SAP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPIND = this.getCampoNumerico(request, "CTIPIND");

			Map map = PAC_IAX_SIN_IMP_SAP.ejecutaPAC_IAX_SIN_IMP_SAP__F_DEL_IMPUESTO_PROF(pSPROFES, pCTIPIND);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf001Service m_del_impuesto", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
