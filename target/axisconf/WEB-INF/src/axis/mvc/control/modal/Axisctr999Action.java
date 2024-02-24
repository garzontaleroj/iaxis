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
import axis.service.modal.Axisctr999Service;

public class Axisctr999Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	Axisctr999Service miServicio = new Axisctr999Service();

	public Axisctr999Action() {
		super();
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr999Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr999Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr999Action buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr999Action aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_recuperar_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr999Action: ajax_recuperar_productos");
		miServicio.m_ajax_recuperar_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_actividades(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr999Action: ajax_recuperar_actividades");
		miServicio.m_ajax_recuperar_actividades(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr999Action: ajax_recuperar_garantias");
		miServicio.m_ajax_recuperar_garantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward marcar_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr999Action marcar_json");
		miServicio.m_marcar_json(request);
		return mapping.findForward("json");
	}

}
