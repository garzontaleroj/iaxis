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
import axis.service.axis.Axisadm106Service;

public class Axisadm106Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axisadm106Service miServicio = new Axisadm106Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm106Action init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm106Action form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_ins_obs(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisadm106Action m_ins_obs");
		miServicio.m_ins_obs(request);
		return mapping.findForward("ajax");
	}

	public ActionForward descargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm106Action descargar");
		miServicio.m_descargar(request, this);
		return mapping.findForward("json");
	}

	public ActionForward actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm106Action: actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request);
		return this.form(mapping, form, request, response);
	}
}