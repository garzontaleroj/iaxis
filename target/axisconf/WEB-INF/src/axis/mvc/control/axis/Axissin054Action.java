package axis.mvc.control.axis;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axissin054Service;
import axis.util.Constantes;

/**
 * Axissin054Action.java
 * 
 * @since Java 5.0
 */
public class Axissin054Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin054Service miServicio = new Axissin054Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin054Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin054Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin054Action Aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_selected_cunitra(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_selected_cunitra(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axissin054Action: busqueda");

		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward navegarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin054Action navegarSiniestro");
		miServicio.m_navegar(request, this);

		logger.debug("--->NSINIESselected:" + AxisBaseService.getCampoTextual(request, "NSINIESCON"));
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axissin006.do?operation=inicializarDatos&NSINIESselected="
						+ AxisBaseService.getCampoTextual(request, "NSINIESCON")));

		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin054.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin054Action volver");
		miServicio.m_volver(request, this);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		request.removeAttribute("subpantalla");
		return new ActionForward("/axis_axissin054.do?operation=buscar");
	}

}
