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
import axis.service.modal.Axissin045Service;

public class Axissin045Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin045Service miServicio = new Axissin045Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action Form");
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_calc_importe(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action ajax_calc_importe");
		miServicio.m_ajax_calc_importe(request);
		return mapping.findForward("ajax");
	}

	// INI 0026592: LCOL_S010-SIN - Gestiones de talleres (autos) y repuestos
	public ActionForward gestionPermitida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin045Action gestionPermitida");
		miServicio.m_gestionPermitida_json(request);
		return mapping.findForward("json");
	}
	// FI 0026592: LCOL_S010-SIN - Gestiones de talleres (autos) y repuestos

	public ActionForward cargar_servicios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action Form");
		miServicio.m_cargar_servicios(request, this);
		return mapping.findForward("cargar_servicios");
	}

	public ActionForward ajax_get_servicios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action ajax_get_servicios");
		miServicio.m_ajax_get_servicios(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cancela_pantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin045Action ajax_cancela_pantalla");
		miServicio.m_ajax_cancela_pantalla(request);
		return mapping.findForward("ajax");
	}
}
