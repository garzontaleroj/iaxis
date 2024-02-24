package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPARAM;
import axis.mvc.control.modal.AxismpreditorAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class AxismpreditorService extends AxismprxxxService {
	static Log logger = LogFactory.getLog(AxismpreditorService.class);

	public void m_init(HttpServletRequest request, AxismpreditorAction thisAction) {
		logger.debug("AxismpreditorService m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio AxismpreditorService - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, AxismpreditorAction thisAction) {
		logger.debug("AxismpreditorService m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String CPARAM = getCampoTextual(request, "CPARAM");
			String TPARAM = (String) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_GET_DESCPARAM(CPARAM));
			request.setAttribute("TPARAM", TPARAM);

		} catch (Exception e) {
			logger.error("Error en el servicio AxismpreditorService - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, AxismpreditorAction thisAction) {
		logger.debug("AxismpreditorService m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal RETURN = this.setXXXparam(request, thisAction);

			request.setAttribute("RETURN", RETURN);
			if (RETURN.intValue() == 0) { // OK
				// thisAction.guardarMensaje(request, "1000050", null, Constantes.MENSAJE_INFO);
				request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la
																			// lista
			} else {
				thisAction.guardarMensaje(request, "1000050", new Object[] { "RETURN=0" }, Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxismpreditorService - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
