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
import axis.service.modal.Axisctr058Service;
import axis.service.modal.Axisctr065Service;

public class Axisctr058Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr058Service miServicio = new Axisctr058Service();
	private Axisctr065Service Axisctr065miServicio = new Axisctr065Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr058Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr058Action Form");
		miServicio.m_form(request, this);

		if ("true".equals(request.getParameter("esconderAxisctr065Embed")))
			request.getSession().removeAttribute("mostrarAxisctr065Embed");
		else
			Axisctr065miServicio.m_form(request);

		return mapping.findForward("form");

	}

	public ActionForward editarVersion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		request.getSession().setAttribute("mostrarAxisctr065Embed", Boolean.valueOf(true));
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardarVersion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr065Action guardarVersion");
		miServicio.m_guardarVersion(request, this);
		request.getSession().removeAttribute("mostrarAxisctr065Embed");
		return this.form(mapping, form, request, response);
	}

}