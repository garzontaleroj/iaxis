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
import axis.service.modal.Axisctr206Service;
import axis.service.modal.Axisctr208Service;

public class Axisctr206Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr206Service miServicio = new Axisctr206Service();
	private Axisctr208Service Axisctr208miServicio = new Axisctr208Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr206Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr206Action Form");
		miServicio.m_form(request, this);
		if ("true".equals(request.getParameter("esconderAxisctr208Embed")))
			request.getSession().removeAttribute("mostrarAxisctr208Embed");
		else
			Axisctr208miServicio.m_form(request);

		return mapping.findForward("form");

	}

	public ActionForward editarDispositivo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		request.getSession().setAttribute("mostrarAxisctr208Embed", Boolean.valueOf(true));
		return this.form(mapping, form, request, response);
	}

	public ActionForward selecDispositivo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr206Action selecDispositivo");

		miServicio.m_selecDispositivo(request, this);
		// return this.form(mapping, form, request, response);
		// return mapping.findForward("axisctr059_aux");
		request.getSession().removeAttribute("mostrarAxisctr208Embed");
		return this.form(mapping, form, request, response);

	}

	public ActionForward guardarDispositivo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr206Action guardarDispositivo");
		miServicio.m_guardarDispositivo(request, this);
		request.getSession().removeAttribute("mostrarAxisctr208Embed");
		return this.form(mapping, form, request, response);

	}

	public ActionForward borrarDispositivo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr206Action borrarDispositivo");
		miServicio.m_borrarDispositivo(request, this);
		request.getSession().removeAttribute("mostrarAxisctr208Embed");
		return this.form(mapping, form, request, response);

	}
}