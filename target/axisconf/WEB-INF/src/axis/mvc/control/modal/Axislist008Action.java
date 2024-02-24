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
import axis.service.modal.Axislist008Service;

public class Axislist008Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axislist008Service miServicio = new Axislist008Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist008Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist008Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_gestores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_gestores");
		miServicio.m_ajax_busqueda_gestores(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_formatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_formatos");
		miServicio.m_ajax_busqueda_formatos(request);
		return mapping.findForward("ajax");
	}
}
