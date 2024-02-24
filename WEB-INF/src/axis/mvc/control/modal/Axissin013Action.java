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
import axis.service.modal.Axissin013Service;

public class Axissin013Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin013Service miServicio = new Axissin013Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action guardar");
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_guardar(request, this);
		// return this.form(mapping, form, request, response);
		logger.debug("resultado:" + request.getAttribute("OK"));

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action ajax_pago");
		miServicio.m_ajax_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_carga_parametro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action ajax_carga_parametro");
		miServicio.m_ajax_carga_parametro(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_contratos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action ajax_cargar_contratos");
		miServicio.m_ajax_cargar_contratos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_valida_compensacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action ajax_valida_compensacion");
		miServicio.m_ajax_valida_compensacion(request);
		return mapping.findForward("ajax");
	}

	public ActionForward compensacion_pagos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin013Action compensacion_pagos");
		miServicio.m_compensacion_pagos(request, this);
		logger.debug("resultado:" + request.getAttribute("OK"));

		return this.form(mapping, form, request, response);
	}
}