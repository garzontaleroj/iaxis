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
import axis.service.modal.Axisrea042Service;

public class Axisrea042Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea042Service miServicio = new Axisrea042Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea042Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea042Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_cargar_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisrea042Action: ajax_onchange_contrato");
		miServicio.m_ajax_cargar_version(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_tramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisrea042Action: ajax_cargar_tramos");
		miServicio.m_ajax_cargar_tramos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_ramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisrea042Action: ajax_cargar_ramos");
		miServicio.m_ajax_cargar_ramos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisrea042Action: ajax_cargar_ramos");
		miServicio.m_ajax_cargar_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea042Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward copiar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea042Action copiar");
		miServicio.m_copiar(request, this);
		return this.form(mapping, form, request, response);
	}

}
