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
import axis.service.axis.Axiscaj001Service;

public class Axiscaj001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axiscaj001Service miServicio = new Axiscaj001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj001Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj001Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward m_aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		miServicio.aceptar(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_ins_mov_caja(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj001Action ajax_ins_mov_caja");
		miServicio.m_ajax_ins_mov_caja(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscaj001Action aceptar");
		miServicio.aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_moneda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscaj001Action ajax_guardar_moneda");
		miServicio.m_ajax_guardar_moneda(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscaj001Action ajax_delete");
		miServicio.m_ajax_delete(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_valida_tarjeta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscaj001Action ajax_valida_tarjeta");
		miServicio.m_ajax_valida_tarjeta(request, this);
		return mapping.findForward("ajax");
	}
}
