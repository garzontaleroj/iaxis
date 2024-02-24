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
import axis.service.modal.Axisctr201Service;

public class Axisctr201Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr201Service miServicio = new Axisctr201Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr201Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr201Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_actualiza_tipo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr201Action ajax_actualiza_tipo");

		miServicio.m_ajax_actualiza_tipo(request);

		return mapping.findForward("ajax");
	}

}