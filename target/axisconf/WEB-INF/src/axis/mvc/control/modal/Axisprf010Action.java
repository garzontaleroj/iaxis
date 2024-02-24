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
import axis.service.modal.Axisprf010Service;

public class Axisprf010Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf010Service miServicio = new Axisprf010Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action Guardar");
		miServicio.guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_subtipos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action ajax_busqueda_subtipos");
		miServicio.m_ajax_busqueda_subtipos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_cargaDiaSem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action ajax_busqueda_cargaDiaSem");
		miServicio.m_ajax_busqueda_cargaDiaSem(request);
		return mapping.findForward("ajax");
	}
}
