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
import axis.service.axis.Axiscaj019Service;

public class Axiscaj019Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscaj019Service miServicio = new Axiscaj019Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj019Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj019Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscaj019Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_valida_vingresado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj019Action ajax_valida_vingresado");
		miServicio.m_ajax_valida_vingresado(request);
		return mapping.findForward("ajax");
	}
}
