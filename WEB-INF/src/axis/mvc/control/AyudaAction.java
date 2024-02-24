//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.mvc.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.AyudaService;

public class AyudaAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AyudaAction.class);
	private AyudaService miServicio = new AyudaService();

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ayudaTitulo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_ayudaTitulo(request, this);
		return mapping.findForward("titulo");
	}
}
