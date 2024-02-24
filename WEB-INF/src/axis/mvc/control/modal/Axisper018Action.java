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
import axis.service.modal.Axisper018Service;

public class Axisper018Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper018Service miServicio = new Axisper018Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameter("paginar") != null || request.getParameter("subpantalla") != null) {
			String operation = request
					.getParameterValues("subpantalla")[request.getParameterValues("subpantalla").length - 1];
			request.setAttribute("subpantalla", operation);
		}
		miServicio.m_ActualitzarDisplays(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ActualitzarDisplays(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") != null || request.getParameter("subpantalla") != null) {
			String operation = request
					.getParameterValues("subpantalla")[request.getParameterValues("subpantalla").length - 1];
			logger.debug(operation);
			request.setAttribute("subpantalla", operation);
		}
		miServicio.m_ActualitzarDisplays(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarDescen(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminarDescen(request, this);
		return this.ActualitzarDisplays(mapping, form, request, response);
	}

	public ActionForward eliminarMayor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminarMayor(request, this);
		return this.ActualitzarDisplays(mapping, form, request, response);
	}

}
