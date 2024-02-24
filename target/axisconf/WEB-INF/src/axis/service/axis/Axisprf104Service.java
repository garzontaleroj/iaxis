package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axisprf104Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisprf104Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisprf104Action thisAction) {
		logger.debug("Axisprf104Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal starifa = null;
			if (formdata.get("STARIFA_OUT") != null) {
				starifa = new BigDecimal((String) formdata.get("STARIFA_OUT"));
			}
			if (starifa == null && request.getParameter("STARIFA_OUT") != null) {
				starifa = new BigDecimal(request.getParameter("STARIFA_OUT"));
			}
			logger.debug("++++STARIFA: " + starifa);
			if (starifa != null) {
				this.m_busqueda_servicios(request, thisAction, starifa);
			}
			formdata.put("STARIFA", starifa);
		} catch (Exception e) {
			logger.error("Error en el servicio axisprf104Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_del_servicio(HttpServletRequest request, Axisprf104Action this1) {
		logger.debug("Axisprf104Service m_del_rol");
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
			logger.error("Error en el servicio Axisprf104Service m_del_rol", e);
			this1.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_busqueda_servicios(HttpServletRequest request, Axisprf104Action thisAction, BigDecimal STARIFA) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pSTARIFA = null;
			if (STARIFA != null) {
				pSTARIFA = STARIFA;
			} else {
				pSTARIFA = getCampoNumerico(request, "STARIFA");
			}
			BigDecimal pSSERVIC = getCampoNumerico(request, "SSERVIC");
			formdata.put("SSERVIC", pSSERVIC);
			String pTDESCRI = getCampoTextual(request, "TDESCRI");
			formdata.put("TDESCRI", pTDESCRI);

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisprf104_listaServicios");
				PAC_IAX_PROF PAC_IAX_PROF = new PAC_IAX_PROF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();

				map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(pSTARIFA, pSSERVIC, pTDESCRI);

				logger.debug(map);

				request.getSession().setAttribute("axisprf104_listaServicios",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
