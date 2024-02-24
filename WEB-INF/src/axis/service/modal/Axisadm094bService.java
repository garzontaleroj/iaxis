package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA_CHEQUE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm094bAction;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm094bService extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr063Service.class);
	private String modo;

	public void m_init(HttpServletRequest request, Axisadm094bAction thisAction) {
		logger.debug("Axisctr063Service m_init");
		try {
			modo = (String) AbstractDispatchAction.topPila(request, "CMODO");
			logger.debug("modo : " + modo);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisadm094bService.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_form(HttpServletRequest request, Axisadm094bAction thisAction) {
		logger.debug("Axisctr063Service m_form");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr063Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisctr063Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

	public void m_aceptar(HttpServletRequest request, Axisadm094bAction thisAction) {
		logger.debug("Axisctr063Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Date FFINALI = stringToSqlDate(getCampoTextual(request, "FFINALI"));

			Date FALTA = stringToSqlDate(getCampoTextual(request, "FALTA"));

			BigDecimal VALIDA = this.getCampoNumerico(request, "PVALIDA");

			PAC_IAX_CAJA_CHEQUE pacIaxCajaCheque = new PAC_IAX_CAJA_CHEQUE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxCajaCheque.ejecutaPAC_IAX_CAJA_CHEQUE__F_GENERA_ARCHIVO_CHEQUE(FALTA, FFINALI, VALIDA);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("DIR", map.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr063Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisctr063Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

}
