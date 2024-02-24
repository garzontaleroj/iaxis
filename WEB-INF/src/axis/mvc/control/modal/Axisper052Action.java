//Revision:# 65uWIkCt4tzPNH/hplysDQ== #
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
import axis.service.modal.Axisper052Service;

public class Axisper052Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axisper052Service miServicio = new Axisper052Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper052Action init");
		miServicio.m_form(request);
		return this.form(mapping, form, request, response);
	}

	@SuppressWarnings("static-access")
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper052Action form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "ACTIONMOD"));
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

}
