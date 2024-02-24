package axis.mvc.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.FormlauncherService;

public class FormlauncherAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(FormlauncherAction.class);
	private FormlauncherService miServicio = new FormlauncherService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward launch(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_launch(request, this);
		return mapping.findForward("launch");
	}
}
