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
import axis.service.axis.Axissin072Service;

public class Axissin072Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin072Service miServicio = new Axissin072Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin072Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin072Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin072Action Guardar");
		miServicio.guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_profesional(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper008Action: busqueda_persona");
		miServicio.m_busqueda_profesional(request, this);

		return mapping.findForward("form");
	}

	public ActionForward traspaso_profesional(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action traspaso_profesional
		log.info("Axissin072Action: traspaso_profesional");
		miServicio.m_traspaso_profesional(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ver_profesional(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin072Action: ver_profesional");
		miServicio.m_ajax_ver_profesional(request);
		return mapping.findForward("ajax");
	}

	public ActionForward inicializarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action inicializarDatos");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

}
