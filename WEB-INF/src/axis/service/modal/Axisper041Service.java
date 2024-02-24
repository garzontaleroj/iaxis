package axis.service.modal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisper041Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper041Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisper041Action thisAction) {
		logger.debug("Axisper041Service m_init");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper041Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axisper041Action thisAction) {
		logger.debug("Axisper041Service m_init");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CPOSTAL = getCampoTextual(request, "CPOSTAL").toUpperCase();
			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisper041_listaCpostal");
				Map map = new HashMap();
				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLAPAIS(CPOSTAL);
				formdata.put("CPOSTAL", CPOSTAL);
				request.getSession().setAttribute("axisper041_listaCpostal",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
