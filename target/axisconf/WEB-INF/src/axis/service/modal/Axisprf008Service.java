package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf008Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf008Action thisAction) {
		logger.debug("Axisprf008Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					String pTCOMENT = this.getCampoTextual(request, "TCOMENT");

					formdata.put("pCodiProf", psprofes);
					formdata.put("TCOMENT", pTCOMENT);
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

		}
	}

	public void guardar(HttpServletRequest request, Axisprf008Action thisAction) {
		logger.debug("Axisprf008Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pSPROFES = this.getCampoNumerico(request, "pCodiProf");
			String pTCOMENT = this.getCampoTextual(request, "TCOMENT");

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null && MODO.equals("modificar")) {

			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_OBSERVACIONES(pSPROFES, pTCOMENT);

				logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
			}

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf008Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
