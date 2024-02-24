//Revision:# M6WQQK3QQBmLTaypaNZrMA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper051Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisper051Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper051Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper051Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal IDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			BigDecimal SSARLAFT = getCampoNumerico(request, "XSSARLAFT");
			String XCTIPREL = getCampoTextual(request, "XCTIPREL");
			String XTNOMBRE = getCampoTextual(request, "XTNOMBRE");
			String CTIPIDEN = getCampoTextual(request, "XCTIPIDEN");
			String NNUMIDE = getCampoTextual(request, "XNNUMIDE");
			String XCPAIS = getCampoTextual(request, "XCPAIS");
			String XTPAIS = getCampoTextual(request, "XTPAIS");
			String XTENTIDAD = getCampoTextual(request, "XTENTIDAD");
			String XTCARGO = getCampoTextual(request, "XTCARGO");
			Date XFDESVIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "XFDESVIN"), "dd/MM/yyyy");
			String ACTION = getCampoTextual(request, "XACTION");

			formdata.put("IDENTIFICACION", IDENTIFICACION);
			formdata.put("SSARLAFT", SSARLAFT);
			formdata.put("CTIPREL", XCTIPREL);
			formdata.put("TNOMBRE", XTNOMBRE);
			formdata.put("CTIPIDEN", CTIPIDEN);
			formdata.put("NNUMIDE", NNUMIDE);
			formdata.put("CPAIS", XCPAIS);
			formdata.put("TPAIS", XTPAIS);
			formdata.put("TENTIDAD", XTENTIDAD);
			formdata.put("TCARGO", XTCARGO);
			formdata.put("FDESVIN", XFDESVIN);
			formdata.put("ACTION", ACTION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper051Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
