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
import axis.service.modal.Axispro015Service;

public class Axispro015Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro015Service miServicio = new Axispro015Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro015Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro015Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscarvalparam(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro015Action buscarvalparam");

		miServicio.m_buscarvalparam(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro015Action Form");
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro015Action aceptar");
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

}
