//Revision:# Kr17BXnUoCxl5M6LM8TD5w== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin075Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin075Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axissin075Action thisAction) {

		logger.debug("Axissin075Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal SIDEPAGRECOB = getCampoNumerico(request, "SIDEPAGRECOB");
			if (isEmpty(SIDEPAG)) {
				SIDEPAG = SIDEPAGRECOB;
				formdata.put("SIDEPAG", SIDEPAG);
			}

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(SSEGURO, NSINIES,
					NTRAMIT, CTIPPAG, SIDEPAG);
			if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map, false))) {

				if (!isEmpty((Map) map.get("RETURN")))
					formdata.putAll((Map) map.get("RETURN"));
			}
			BigDecimal IIVA = getCampoNumerico(request, "IIVA");
			if (IIVA.intValue() == 0) {
				formdata.put("IIVA2", 1);
			} else {
				formdata.put("IIVA2", IIVA.intValue());
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu009Service - metodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
