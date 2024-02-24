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
import axis.service.axis.Axissin073Service;

public class Axissin073Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin073Service miServicio = new Axissin073Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin073Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin073Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cargaListasTramitaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		log.info("Axissin073Action Busqueda cargaListasTramitaciones");
		miServicio.cargaListasTramitaciones(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_documentos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.ajax_documentos(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward crear_pagos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		log.info("Axissin073Action Busqueda crear_pagos");
		miServicio.crear_pagos(request);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin073Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_persona(request);
		return mapping.findForward("ajax");
	}
}