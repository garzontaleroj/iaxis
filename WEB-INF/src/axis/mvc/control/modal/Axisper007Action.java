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
import axis.service.modal.Axisper004Service;
import axis.service.modal.Axisper007Service;

public class Axisper007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper007Service axisper007Servicio = new Axisper007Service();
	private Axisper004Service axisper004Servicio = new Axisper004Service();

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
		axisper007Servicio.m_form(request, this);

		if ("true".equals(request.getParameter("esconderAxisper004Embed")))
			request.getSession().removeAttribute("mostrarAxisper004Embed");
		else
			axisper004Servicio.m_form(request);

		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward editarCCC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// axisper004Servicio.m_form(request);
		request.getSession().setAttribute("mostrarAxisper004Embed", Boolean.valueOf(true));
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabarCCC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		axisper004Servicio.m_grabarCCC(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarCCC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		axisper007Servicio.m_eliminarCCC(request, this);
		return this.form(mapping, form, request, response);
	}
}
