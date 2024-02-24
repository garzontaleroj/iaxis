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
import axis.service.axis.Axissin001Service;
import axis.util.Constantes;

public class Axissin001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin001Service miServicio = new Axissin001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action Init");
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action buscar");
		// miServicio.m_busqueda_siniestro(request,this);
		return mapping.findForward("form");
	}

	public ActionForward cambiar_fecha_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action cambiar_fecha_siniestro");
		miServicio.m_ajax_cambiar_fecha_siniestro(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_causa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action ajax_selected_causa");
		miServicio.m_ajax_selected_causa(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action aceptar_siniestro");
		miServicio.m_aceptar_siniestro(request);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/
	/*********************************************************************************************************************/

	public ActionForward consultarSiniestros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action consultarSiniestros");
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarSiniestros"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward consultarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action consultarPoliza");
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin001Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

}