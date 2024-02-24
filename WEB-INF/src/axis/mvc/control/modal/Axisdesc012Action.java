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
import axis.service.modal.Axisdesc012Service;

/**
 * CONSULTA Garantias
 */
public class Axisdesc012Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisdesc012Service miServicio = new Axisdesc012Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisdesc012Action Init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisdesc012Action Buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisdesc012Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}
}
