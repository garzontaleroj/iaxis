package axis.mvc.control.modal;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

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
import axis.service.modal.Axissin039Service;
import axis.util.Constantes;

public class Axissin039Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin039Service miServicio = new Axissin039Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin039Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin039Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin039Action guardar");
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getProvinPobla(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajaxgetInfoHost(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajaxgetInfoHost(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward grabarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargardireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_recuperarDireccionON(request);
		return mapping.findForward("ajax");
	}

	/*
	 * *****************************************************************************
	 * ***********************
	 */
	/*
	 * *********************************************** AJAX
	 * ***********************************************
	 */
	/*
	 * *****************************************************************************
	 * ***********************
	 */

	public ActionForward ajax_eventos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_evento(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward consulta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin039Action consulta_persona");

		BigDecimal SPERSON = miServicio.m_consulta_persona(request, this);

		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		formdata.put("CAGENTE_axissin039",
				AxisBaseService.bigDecimalToString(AxisBaseService.getCampoNumerico(request, "CAGENTE")));
		this.topPila(request, "formdata_axissin039", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected="
						+ CAGENTE + "&CMODO=CONSULTA_SINIESTROS" + "&MODO=CONSULTA_SINIESTROS"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/modal_axissin039.do?operation=volver_per"));

		AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

		return mapping.findForward("saltar");
	}

	public ActionForward alta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin039Action consulta_persona");

		miServicio.m_consulta_persona(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&ALTA_PERSONA_INI=1"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/modal_axissin039.do?operation=volver_per"));
		return mapping.findForward("saltar");
	}

	public ActionForward ajax_existe_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin039Action ajax_existe_persona");
		miServicio.m_ajax_existe_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_get_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin039Action ajax_get_persona");
		miServicio.m_ajax_get_persona(request);
		return mapping.findForward("ajax");
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
	public ActionForward volver_per(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		AbstractDispatchAction.topPila(request, "CMODO", "MODIF_SINIESTROS");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin039Action volver_per");
		miServicio.m_volver_per(request, this);
		return this.form(mapping, form, request, response);
		// return mapping.findForward("form");
	}

}
