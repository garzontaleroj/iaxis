//Revision:# 231/iqXH587PIniaQeu0Aw== #
package axis.mvc.control.axis;

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
import axis.service.axis.Axisgca008Service;

public class Axisgca008Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axisgca008Service miServicio = new Axisgca008Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgca008Action init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	@SuppressWarnings("static-access")
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgca008Action form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

}