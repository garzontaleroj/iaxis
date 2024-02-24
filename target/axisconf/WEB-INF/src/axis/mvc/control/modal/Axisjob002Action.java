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
import axis.service.modal.Axisjob002Service;

public class Axisjob002Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisjob002Service miServicio = new Axisjob002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob002Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob002Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward altajob(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob002Action altajob");
		miServicio.m_altajob(request, this);
		return form(mapping, form, request, response);
	}

	public ActionForward modificarjob(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob002Action modificarjob");
		miServicio.m_modificarjob(request, this);

		// return mapping.findForward("form");
		return form(mapping, form, request, response);
	}

}