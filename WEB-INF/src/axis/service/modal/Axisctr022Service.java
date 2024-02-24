package axis.service.modal;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.modal.Axisctr022Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr022Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr022Action thisAction) {
		logger.debug("Axisctr022Service m_init");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			String NMOVIMI = getCampoTextual(request, "NMOVIMI");
			String SSEGURO = getCampoTextual(request, "SSEGURO");

			request.setAttribute("NMOVIMI", NMOVIMI);
			request.setAttribute("SSEGURO", SSEGURO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr022Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr022Action thisAction) {
		logger.debug("Axisctr022Service m_form");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cerrar(HttpServletRequest request, Axisctr022Action thisAction) {
		logger.debug("Axisctr022Service m_cerrar");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr022Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}