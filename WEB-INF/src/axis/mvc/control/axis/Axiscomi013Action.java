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
import axis.service.axis.Axiscomi013Service;

/**
 * Axiscomi013Action.java 04/07/2008
 * 
 */
public class Axiscomi013Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axiscomi013Service miServicio = new Axiscomi013Service();

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
		logger.debug("Axiscomi013Action Init");
		miServicio.m_init(request, this);
		if (request.getParameter("paginar") == null) {
		}

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
		logger.debug("Axiscomi013Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscomi013Action aceptar");
		miServicio.m_aceptar(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscomi013Action buscar");
		miServicio.m_buscar(request, this);

		if (request.getParameter("paginar") != null) {
			String subseccion = request.getParameterValues("subseccion")[request.getParameterValues("subseccion").length
					- 1];
			request.setAttribute("subseccion", subseccion);
		}

		return this.form(mapping, form, request, response);
	}

	// INI IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el
	// asegurado
	public ActionForward almacenar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscomi013Action almacenar");
		miServicio.m_almacenar(request, this);

		return this.form(mapping, form, request, response);
	}
	// FIN IAXIS 4081 AABG: Se crea funcion para almacenar temporalmente el
	// asegurado

	// INI IAXIS 4081 AABG: Se crea funcion para eliminar un asegurado temporal
	public ActionForward f_borrar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscomi013Action f_borrar_asegurado");
		miServicio.m_borrar_asegurado(request, this);

		return this.form(mapping, form, request, response);
	}
	// FIN IAXIS 4081 AABG: Se crea funcion para eliminar un asegurado temporal

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisret005Action m_ajax_actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_insertpor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axiscoa004Action ajax_insertval");
		miServicio.m_ajax_insertpor(request);
		return mapping.findForward("ajax");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscomi013Action Form");
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi013Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscomi013Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}
}
