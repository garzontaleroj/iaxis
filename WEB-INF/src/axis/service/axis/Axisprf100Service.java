package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axisprf100Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisprf100Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisprf100Action thisAction) {
		logger.debug("Axisprf100Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String sprofes = request.getParameter("pCodiProf");
			BigDecimal codi = null;
			formdata.put("SPROFES", sprofes);

			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			} else if (formdata.get("SPROFES") != null) {
				codi = new BigDecimal((String) formdata.get("SPROFES"));
			} else if (request.getParameter("pSPROFES") != null) {
				codi = new BigDecimal((String) request.getParameter("pSPROFES"));
			}
			logger.debug("+++++++codi: " + codi);

			if (codi != null) {
				Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(codi);
				logger.debug("++++MAP PROFESIONAL: " + map);
				formdata.put("TNOMBRE", ((Map) map.get("OBPROFESIONAL")).get("TNOMBRE"));

				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_CONVENIOS(codi);
				formdata.put("CONVENIOS", map.get("T_CONVENIOS"));

				List col_convenios = (List) map.get("T_CONVENIOS");
				BigDecimal SCONVEN = null;
				if (col_convenios.size() == 1) {
					SCONVEN = (BigDecimal) ((Map) ((Map) col_convenios.get(0)).get("OB_IAX_PROF_CONVE")).get("SCONVEN");
					formdata.put("SCONVEN", SCONVEN);
				}
				logger.debug("++++MAP CONVENIOS: " + formdata.get("CONVENIOS"));
				if (this.getCampoNumerico(request, "pSCONVEN") != null) {
					SCONVEN = this.getCampoNumerico(request, "pSCONVEN");
				}
				if (SCONVEN != null) {
					this.m_busqueda_estados(request, thisAction, SCONVEN, codi);
				}
				formdata.put("SCONVEN", SCONVEN);

				formdata.put("SPROFES", codi);
			}
		} catch (Exception e) {
			logger.error("Error en el convenio axisprf100Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_del_convenio(HttpServletRequest request, Axisprf100Action this1) {
		logger.debug("Axisprf100Service m_del_rol");
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
			logger.error("Error en el convenio Axisprf100Service m_del_rol", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_busqueda_estados(HttpServletRequest request, Axisprf100Action thisAction, BigDecimal pSCONVEN,
			BigDecimal pSPROFES) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisprf100_listaEstados");
				PAC_IAX_PROF PAC_IAX_PROF = new PAC_IAX_PROF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = new HashMap();

				map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_ESTADOS_CONVENIO(pSCONVEN);
				List listaConvenios = (ArrayList) tratarRETURNyMENSAJES(request, map, false);

				if (listaConvenios != null) {
					Collections.sort((ArrayList<HashMap>) listaConvenios, new Comparator<HashMap>() {
						public int compare(HashMap o1, HashMap o2) {
							Long l1 = ((Date) o1.get("FESTADO")).getTime();
							Long l2 = ((Date) o2.get("FESTADO")).getTime();
							int i = l2.compareTo(l1);
							return i;
						}
					});
				}

				request.getSession().setAttribute("axisprf100_listaEstados", listaConvenios);
				logger.debug("++++ESTADOS: " + request.getSession().getAttribute("axisprf100_listaEstados"));
				formdata.put("SPROFES", pSPROFES);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_del_estado(HttpServletRequest request, Axisprf100Action this1) {
		logger.debug("Axisprf100Service m_del_estado");
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pSCONVEN = this.getCampoNumerico(request, "pSCONVEN");
			String fecha = this.getCampoTextual(request, "FESTADO").substring(0, 10);
			Date pFESTADO = Date.valueOf(fecha);
			BigDecimal pCESTADO = this.getCampoNumerico(request, "pCESTADO");
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_DEL_ESTADO_CONVENIO(pSCONVEN, pCESTADO, pFESTADO);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf100Service m_del_estado", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
