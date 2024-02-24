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
import axis.service.modal.Axisprf106Service;

public class Axisprf106Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf106Service miServicio = new Axisprf106Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf106Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf106Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf106Action Guardar");
		miServicio.guardar(request, this);
		return mapping.findForward("form");
	}
}
