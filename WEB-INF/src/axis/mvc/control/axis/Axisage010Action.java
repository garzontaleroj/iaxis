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
import axis.service.axis.Axisage010Service;

public class Axisage010Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage010Service miServicio = new Axisage010Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage010Action init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage010Action form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage010Action aceptar");
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward miajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_miajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel_doc(request, response);
		return this.form(mapping, form, request, response);
	}
}
