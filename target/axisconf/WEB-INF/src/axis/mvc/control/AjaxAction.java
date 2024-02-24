package axis.mvc.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.AjaxService;

public class AjaxAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AjaxAction.class);
	private AjaxService miServicio = new AjaxService();

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/* RKV bug 10467 */
	public ActionForward ajax_carga_completa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.debug("AjaxAction: ajax_carga_completa");

		String whoami = request.getParameter("whoami");

		if (request.getSession().getAttribute(whoami + "_MENSAJE_INI") != null) {
			request.getSession().removeAttribute(whoami + "_MENSAJE_INI");
			request.getSession().setAttribute(whoami + "_QUITAR_MENSAJE_INI", true);
		}

		return mapping.findForward("ajax");
	}
	/* RKV bug 10467 */
}
