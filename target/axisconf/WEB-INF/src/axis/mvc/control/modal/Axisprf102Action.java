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
import axis.service.modal.Axisprf102Service;

public class Axisprf102Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf102Service miServicio = new Axisprf102Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf102Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf102Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_starifa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf102Action ajax_busqueda_starifa");
		miServicio.m_ajax_busqueda_starifa(request);
		return mapping.findForward("ajax");
	}

	public ActionForward busqueda_tarifa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		miServicio.m_busqueda_tarifa(request, this);

		return mapping.findForward("form");
	}

	public ActionForward traspaso_tarifa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action traspaso_profesional
		log.info("Axisprf102Action: traspaso_tarifa");
		miServicio.m_traspaso_tarifa(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_copiar_tarifa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action traspaso_profesional
		log.info("Axisprf102Action: ajax_copiar_tarifa");
		miServicio.m_ajax_copiar_tarifa(request, this);
		return mapping.findForward("form");
	}
}
