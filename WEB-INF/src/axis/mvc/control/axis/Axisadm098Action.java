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
import axis.service.axis.Axisadm098Service;

public class Axisadm098Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm098Service miServicio = new Axisadm098Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm098Action Init");
		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm098Action Form");
		// miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward buscarTransferencias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm098Action buscarTransferencias");
		miServicio.m_buscarTransferencias(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cancelarTransferencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisadm098Action cancelarTransferencia");
		miServicio.m_cancelarTransferencia(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward desbloquearTransferencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisadm098Action desbloquearTransferencia");
		miServicio.m_desbloquearTransferencia(request, this);
		return this.buscarTransferencias(mapping, form, request, response);
	}

	public ActionForward salirPrincipal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm098Action salirPrincipal");
		return mapping.findForward("cancelar");
	}

}
