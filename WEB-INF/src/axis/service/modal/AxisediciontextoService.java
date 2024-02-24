//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.service.modal;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.modal.AxisediciontextoAction;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class AxisediciontextoService extends AxismprxxxService {
	static Log logger = LogFactory.getLog(AxisediciontextoService.class);

	public void m_form(HttpServletRequest request, AxisediciontextoAction thisAction) {
		logger.debug("AxisediciontextoService m_form");

		try {
			/*
			 * String ID = getCampoTextual(request, "ID"); String DESCRIPCION =
			 * getCampoTextual(request, "DESCRIPCION"); String VALOR =
			 * getCampoTextual(request, "VALOR");
			 */
			String READONLY_TMP = getCampoTextual(request, "READONLY");
			String COMBO_TMP = getCampoTextual(request, "COMBO");

			boolean READONLY = false;
			boolean COMBO = false;

			if (!isEmpty(READONLY_TMP))
				READONLY = new Boolean(READONLY_TMP).booleanValue();
			if (!isEmpty(COMBO_TMP))
				COMBO = new Boolean(COMBO_TMP).booleanValue();

			/*
			 * request.setAttribute("ID", ID); request.setAttribute("DESCRIPCION",
			 * DESCRIPCION); request.setAttribute("VALOR", VALOR);
			 */
			request.setAttribute("READONLY", READONLY);
			request.setAttribute("COMBO", COMBO);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisediciontextoService - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
