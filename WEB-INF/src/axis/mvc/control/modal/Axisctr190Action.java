//Revision:# 42Sd+2KqFZ5Y/LpLumn4LA== #
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
import axis.service.modal.Axisctr190Service;

public class Axisctr190Action extends AbstractDispatchAction {
	static Log log = LogFactory.getLog(Axisctr190Action.class);
	private Axisctr190Service miServicio = new Axisctr190Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr190Action init");

		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.debug("Axisctr190Action form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,

			HttpServletResponse response) throws IOException, ServletException {

		log.debug("Axisctr190Action aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,

			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action: ver_agente");

		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");

	}
}
