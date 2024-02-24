package axis.service.modal;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.modal.Axisusu009Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisusu009Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu009Action thisAction) {

		logger.debug("Axisusu009Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().removeAttribute("T_IAX_USERS");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu009Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda(HttpServletRequest request, Axisusu009Action thisAction) {

		logger.debug("Axisusu009Service m_busqueda");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CUSER = this.getCampoTextual(request, "CUSUARIO");
			String CNOMBRE = this.getCampoTextual(request, "CNOMUSUARIO");

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("T_IAX_USERS");
				PAC_IAX_USER pac_iax_user = new PAC_IAX_USER(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_user.ejecutaPAC_IAX_USER__F_GET_USUARIOS(CUSER, CNOMBRE);
				tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("T_IAX_USERS", (ArrayList) map.get("TUSERS"));

			}

		} catch (Exception e) {
			logger.error("Error Axisusu009Service m_busqueda", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
}
