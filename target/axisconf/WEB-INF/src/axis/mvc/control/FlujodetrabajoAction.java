//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.FlujodetrabajoService;
import axis.util.Constantes;

public class FlujodetrabajoAction extends AbstractDispatchAction {

	private FlujodetrabajoService miServicio = new FlujodetrabajoService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);

		if (maxistipoMENSAJEesERROR(request)) {
			return mapping.findForward("error");
		} else {
			Object o = request.getAttribute("actionforward");
			if (o instanceof ActionForward)
				return (ActionForward) o;
			else if (o instanceof String)
				return mapping.findForward((String) o);
			else
				return mapping.findForward("error");

		}
	}

	/**
	 * Es el metodo que deberia llamar cada pantalla (formulario no modal) que haga
	 * un "cancelar" Es aqui donde se compruebe si hay algo mas en la pila - y se
	 * vaya alli, o si hay que volver al menu.
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_cancelar(request, this);
		// falta el tratamiento de "la pila diga que vayamos a ..." / o "cancelar" si la
		// pila diga nada

		if (request.getAttribute(Constantes.FORWARDACTION) != null) {
			return (ActionForward) request.getAttribute(Constantes.FORWARDACTION);
		} else {
			return mapping.findForward("cancelar");
		}
	}

	public ActionForward saltar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		ActionForward saltarA = miServicio.m_saltar(request, this);
		if (saltarA != null) {
			return saltarA;
		} else {
			this.guardarMensaje(request, "1000050", new Object[] { "saltarA=null" }, Constantes.MENSAJE_ERROR);
			return mapping.findForward("error");
		}
	}
}
