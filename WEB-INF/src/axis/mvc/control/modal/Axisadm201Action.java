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
import axis.service.modal.Axisadm201Service;

public class Axisadm201Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm201Service miServicio = new Axisadm201Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_getReqResDetail(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.ajax_getReqResDetail(request, this);
		return mapping.findForward("ajax");
	}

}
