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
import axis.service.axis.Axispen005Service;

public class Axispen005Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axispen005Service miServicio = new Axispen005Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispen005Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispen005Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_promotors(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_promotors(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_cuerpo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_cuerpo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrar_promotor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrar_promotor(request, this);
		return this.form(mapping, form, request, response);
	}

}