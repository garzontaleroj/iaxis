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
import axis.service.modal.Axisadm034Service;

public class Axisadm034Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm034Service miServicio = new Axisadm034Service();

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
		logger.debug("Axisadm034Action Init");
		miServicio.m_init(request);
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
		logger.debug("Axisadm034Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm034Action Buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_busqueda_ramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm034Action ajax_busqueda_ramos");
		miServicio.m_ajax_busqueda_ramos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm034Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm063Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm063Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}
}
