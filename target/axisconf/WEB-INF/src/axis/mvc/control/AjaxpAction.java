package axis.mvc.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.AjaxpService;

public class AjaxpAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AjaxpAction.class);
	private AjaxpService miServicio = new AjaxpService();

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

}
