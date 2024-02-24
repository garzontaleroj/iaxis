package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisage022Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class Axisage022Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axisage022Service.class);

	public void m_init(HttpServletRequest request, Axisage022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.initxxx(request, thisAction);
			if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
				String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
				request.getSession().setAttribute("AXISMPRXXX_EST", EST);
			}
			request.getSession().setAttribute("AXISMPRXXX", "axisage022");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage022Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisage022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		request.getSession().setAttribute("AXISMPRXXX", "axisage022");
		if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
			String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
			request.getSession().setAttribute("AXISMPRXXX_EST", EST);
		}
		try {
			this.getXXXparam(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage022Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrar(HttpServletRequest request, Axisage022Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		if (formdata.get("paginar") != null)
			return; // ignorar si es un paginar

		try {
			this.elimXXXparam(request, thisAction);

			request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la lista

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage022Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actualizar(HttpServletRequest request, Axisage022Action thisAction) {
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
			logger.error("Error en el servicio Axisage022Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
