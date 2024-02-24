package axis.mvc.control.modal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.modal.Axisper002Service;
import axis.service.modal.Axisper006Service;

public class Axisper006Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper006Service axisper006Servicio = new Axisper006Service();
	private Axisper002Service axisper002Servicio = new Axisper002Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		axisper006Servicio.m_form(request, this);

		if ("true".equals(request.getParameter("esconderAxisper002Embed")))
			request.getSession().removeAttribute("mostrarAxisper002Embed");
		else
			axisper002Servicio.m_form(request);

		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward editarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// axisper002Servicio.m_form(request);
		request.getSession().setAttribute("mostrarAxisper002Embed", Boolean.valueOf(true));
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		axisper002Servicio.m_grabarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		axisper006Servicio.m_eliminarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

}
