package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin074Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin074Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axissin074Action thisAction) {

		logger.debug("Axissin074Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PAGRECOB(NSINIES, NTRAMIT, SIDEPAG);
			HashMap pago = (HashMap) map.get("OB_PAGRECOB");

			if (!isEmpty((Map) map.get("OB_PAGRECOB")))
				formdata.putAll((Map) map.get("OB_PAGRECOB"));
			logger.error(formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin074Service - metodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
