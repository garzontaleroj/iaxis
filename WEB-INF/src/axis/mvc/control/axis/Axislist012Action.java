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
import axis.service.axis.Axislist012Service;

public class Axislist012Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axislist012Service miServicio = new Axislist012Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action Form");
		// SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action: ver_persona");
		miServicio.m_ajax_ver_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward agregar_poliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action: agregar_poliza");
		miServicio.m_ajax_agregar_poliza(request);
		return mapping.findForward("ajax");
	}

	public ActionForward crear_acuerdo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action: crear_acuerdo");
		miServicio.m_ajax_crear_acuerdo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward crear_acuerdo_detalles(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist012Action: crear_acuerdo_detalles");
		miServicio.m_ajax_crear_acuerdo_detalles(request);
		return mapping.findForward("ajax");
	}
}
