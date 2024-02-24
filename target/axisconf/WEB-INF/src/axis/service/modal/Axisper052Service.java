//Revision:# GTW/xyf+EIXUlXhsqBCekA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper052Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisper052Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper052Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper052Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal IDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			BigDecimal SSARLAFT = getCampoNumerico(request, "XSSARLAFT");
			String CTIPIDEN = getCampoTextual(request, "XCTIPIDEN");
			String NNUMIDE = getCampoTextual(request, "XNNUMIDE");
			String TNOMBRE = getCampoTextual(request, "XTNOMBRE");
			String PPARTICI = getCampoTextual(request, "XPPARTICI");
			String TSOCIEDAD = getCampoTextual(request, "XTSOCIEDAD");
			String NNUMIDESOC = getCampoTextual(request, "XNNUMIDESOC");
			String ACTION = getCampoTextual(request, "XACTION");

			formdata.put("IDENTIFICACION", IDENTIFICACION);
			formdata.put("SSARLAFT", SSARLAFT);
			formdata.put("CTIPIDEN", CTIPIDEN);
			formdata.put("NNUMIDE", NNUMIDE);
			formdata.put("TNOMBRE", TNOMBRE);
			formdata.put("PPARTICI", PPARTICI);
			formdata.put("TSOCIEDAD", TSOCIEDAD);
			formdata.put("NNUMIDESOC", NNUMIDESOC);
			formdata.put("ACTION", ACTION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper052Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}