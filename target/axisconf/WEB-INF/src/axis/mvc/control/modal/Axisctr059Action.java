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
import axis.service.modal.Axisctr059Service;
import axis.service.modal.Axisctr070Service;

public class Axisctr059Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr059Service miServicio = new Axisctr059Service();
	private Axisctr070Service Axisctr070miServicio = new Axisctr070Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr059Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr059Action Form");
		miServicio.m_form(request, this);

		if ("true".equals(request.getParameter("esconderAxisctr070Embed"))) {
			request.getSession().removeAttribute("mostrarAxisctr070Embed");
			request.getSession().removeAttribute("modo_modif");
		} else {
			Axisctr070miServicio.m_form(request);
		}

		return mapping.findForward("form");

	}

	public ActionForward editarAccesorio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		request.getSession().setAttribute("mostrarAxisctr070Embed", Boolean.valueOf(true));

		if (request.getParameter("CACCESORIO") != null && !request.getParameter("CACCESORIO").equals("null")) {
			logger.debug("+++++MODO MODIF: " + request.getParameter("CACCESORIO"));
			request.getSession().setAttribute("modo_modif", "1");
		} else {
			logger.debug("+++++REMOVE MODIF");
			request.getSession().removeAttribute("modo_modif");
		}
		return this.form(mapping, form, request, response);
	}

	public ActionForward selecAccesorio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr059Action selecAccesorio");

		miServicio.m_selecAccesorio(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("axisctr059_aux");

	}

	public ActionForward guardarAccesorio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr059Action guardarAccesorio");
		miServicio.m_guardarAccesorio(request, this);
		request.getSession().removeAttribute("mostrarAxisctr070Embed");
		request.getSession().removeAttribute("modo_modif");
		return this.form(mapping, form, request, response);

	}

	public ActionForward borrarAccesorio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr059Action borrarAccesorio");
		miServicio.m_borrarAccesorio(request, this);
		request.getSession().removeAttribute("mostrarAxisctr070Embed");
		return this.form(mapping, form, request, response);

	}

	public ActionForward asegurable_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr070Action asegurable_json");
		miServicio.m_asegurable_json(request, this);
		return mapping.findForward("json");
	}
}