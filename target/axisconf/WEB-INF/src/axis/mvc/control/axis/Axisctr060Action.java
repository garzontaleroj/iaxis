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
import axis.service.axis.Axisctr060Service;

/**
 * Axisctr060Action.java 25/02/2009
 */
public class Axisctr060Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr060Service miServicio = new Axisctr060Service();

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
		logger.debug("Axisctr060Action Init");

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
		logger.debug("Axisctr060Action Form");
		miServicio.m_form(request);

		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
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
	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr060Action siguiente");
		miServicio.m_siguiente(request);

		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr060Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr060Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_casobpm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr060Action ajax_cargar_casobpm");
		miServicio.m_ajax_cargar_casobpm(request);
		return mapping.findForward("ajax");
	}
}
