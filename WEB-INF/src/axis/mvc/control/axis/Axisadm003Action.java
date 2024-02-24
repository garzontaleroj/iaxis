package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
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
import axis.service.axis.Axisadm003Service;
import axis.util.Constantes;

/**
 * Axisadm003Action.java 04/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisadm003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm003Service miServicio = new Axisadm003Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action Init");

		if (request.getParameter("paginar") == null) {
		}

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action Form");
		miServicio.m_form(request);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return mapping.findForward("form");
	}

	/**
	 * 
	 * @param mapping
	 * @param unificar recibo
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward unificar_recibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action Unificar recibos");
		miServicio.m_unificar_recibos(request);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward gestion_cobros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm003Action gestion_cobros");
		miServicio.m_gestion_cobros(request, this);
		return mapping.findForward("saltar");
	}

	public ActionForward volverGestionCobros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm003Action volverGestionCobros");
		miServicio.m_volverGestionCobros(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward act_imp(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm003Action act_imp");
		miServicio.m_act_imp(request, this);
		return mapping.findForward("form");
	}

	/**
	 * 
	 * @param mapping
	 * @param unificar recibo
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action guardar");
		miServicio.m_guardar(request);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return this.form(mapping, form, request, response);
	}

	public ActionForward sincronizar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action sincronizar");
		miServicio.m_sincronizar(request);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_agenda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm003Action borrar_agenda");
		miServicio.m_borrar_agenda(request, this);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return this.form(mapping, form, request, response);
	}

	// Ini IAXIS-3590 - JLTS - 26/04/2019
	public ActionForward consultarPer(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm003Action consultarPer");
		miServicio.m_consultarPer(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		String SPERSON_AUX = AxisBaseService.getCampoTextual(request, "SPERSON_AUX");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		BigDecimal NRECIBO = AxisBaseService.getCampoNumerico(request, "miNRECIBO");

		log.info("Axisadm003Action consultarPer+ SPERSON" + SPERSON);
		log.info("Axisadm003Action consultarPer+ SPERSON_AUX" + SPERSON_AUX);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON_AUX=" + SPERSON_AUX + "&SPERSON="
						+ SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisadm003.do?operation=volverPer&NRECIBO" + NRECIBO));

		return mapping.findForward("saltar");
	}

	public ActionForward volverPer(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm003Action volver");
		miServicio.m_volverPer(request, this);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		BigDecimal NRECIBO = AxisBaseService.getCampoNumerico(request, "NRECIBO");
		return new ActionForward("/axis_axisadm003.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE
				+ "&NRECIBO" + NRECIBO);
	}
	// Fin IAXIS-3590 - JLTS - 26/04/2019
}