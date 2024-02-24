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
import axis.service.modal.Axiscomi011Service;

public class Axiscomi011Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscomi011Service miServicio = new Axiscomi011Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("axiscomi011Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("axiscomi011Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("axiscomi011Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_guardar_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_guardar_detalle(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_del_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_del_detalle(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cancelar_desglose(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_cancelar_desglose(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_criterios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi010Action ajax_busqueda_criterios");
		miServicio.m_ajax_busqueda_criterios(request);
		return mapping.findForward("ajax");
	}

}
