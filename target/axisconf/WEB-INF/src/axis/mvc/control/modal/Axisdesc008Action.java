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
import axis.service.modal.Axisdesc008Service;

public class Axisdesc008Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisdesc008Service miServicio = new Axisdesc008Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc008Action Init");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc008Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc008Action ajax_busqueda_productos");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_ajax_busqueda_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc008Action buscar");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_buscar(request, this);

		return this.form(mapping, form, request, response);
	}

}