package axis.service.axis;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axismpr007Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axismpr007Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axismpr007Service.class);

	public void m_init(HttpServletRequest request, Axismpr007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("axismprxxx_lista");
			request.getSession().setAttribute("AXISMPRXXX", this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axismpr007Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axismpr007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.getXXXparam(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismpr007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_borrar(HttpServletRequest request, Axismpr007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		if (formdata.get("paginar") != null)
			return; // ignorar si es un paginar

		try {
			this.elimXXXparam(request, thisAction);

			request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la lista

		} catch (Exception e) {
			logger.error("Error en el servicio Axismpr007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_actualizar(HttpServletRequest request, Axismpr007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		if (formdata.get("paginar") != null)
			return; // ignorar si es un paginar

		try {

			BigDecimal RETURN = this.setXXXparam(request, thisAction);

			request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la lista
			String ajaxpmessage = "" + RETURN.intValue();// +"\n"+CPARAM+"\n"+CTIPO.intValue()+"\n"+XVALPAR;
			request.setAttribute(Constantes.AJAXPCONTAINER, ajaxpmessage);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismpr007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
