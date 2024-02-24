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
import axis.service.axis.Axislist011Service;

public class Axislist011Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axislist011Service miServicio = new Axislist011Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist011Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist011Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward generar_fichero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist011Action Form");
		miServicio.m_generar_ficheros(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualiza_gestores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_gestores");
		miServicio.m_ajax_busqueda_gestores(request);
		return mapping.findForward("ajax");
	}

}
