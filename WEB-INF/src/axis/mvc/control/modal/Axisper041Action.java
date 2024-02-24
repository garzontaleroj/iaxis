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
import axis.service.modal.Axisper041Service;

public class Axisper041Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	Axisper041Service miServicio = new Axisper041Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper041Action init");

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper041Action form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");

	}

}
