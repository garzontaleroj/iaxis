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
import axis.service.axis.Axispen004Service;

public class Axispen004Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axispen004Service miServicio = new Axispen004Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispen004Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispen004Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_plans(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_planes(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrado_plans(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrado_planes(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_cuerpo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_cuerpo(request, this);
		return mapping.findForward("form");
	}

}