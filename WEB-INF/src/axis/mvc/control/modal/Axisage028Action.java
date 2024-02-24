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
import axis.service.modal.Axisage028Service;

public class Axisage028Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisage028Action.class);
	private Axisage028Service miServicio = new Axisage028Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage028Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage028Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward marcar_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage028Action marcar_json");
		miServicio.m_marcar_json(request);
		return mapping.findForward("json");
	}

	public ActionForward marcar_json_emitir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage028Action marcar_json_emitir");
		miServicio.m_marcar_json_emitir(request);
		return mapping.findForward("json");
	}

	public ActionForward marcar_json_accesible(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage028Action marcar_json_accesible");
		miServicio.m_marcar_json_accesible(request);
		return mapping.findForward("json");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage028Action aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

}
