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
import axis.service.modal.Axisadm036Service;

public class Axisadm036Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm036Service miServicio = new Axisadm036Service();

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
		logger.debug("Axisadm036Action Init");
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
		logger.debug("Axisadm036Action Form");
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
	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm036Service cancelar");
		if (request.getParameter("paginar") == null)
			miServicio.borrarAtributosSession(request);

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
	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm036Action actualizar_combos");

		miServicio.m_ajax_actualizar_combos(request);

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
	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm036Action consultar");
		miServicio.m_consultar(request);
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
	public ActionForward domiciliar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm036Action domiciliar");
		miServicio.m_domiciliar(request);
		// return this.consultar(mapping, form, request, response);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_remesas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr036Action ajax_busqueda_remesas");
		miServicio.m_ajax_busqueda_remesas(request);
		return mapping.findForward("ajax");
	}

	/**
	 * @deprecated Mostrar fichero por pantalla, no se usa.
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	/*
	 * public ActionForward mostrar_fichero(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { logger.debug("Axisctr036Action mostrar_fichero"); String
	 * FICHERO = (String) request.getSession().getAttribute("FICHERO");
	 * 
	 * if (!AxisBaseService.isEmpty(FICHERO)) {
	 * AxisBaseService.tunnelFichero(request, response, FICHERO); }
	 * 
	 * request.getSession().removeAttribute("FICHERO");
	 * request.getSession().removeAttribute("miFICHERO");
	 * 
	 * return null; }
	 */

// bug 0037233 2010901 MMS   Inicio
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
	public ActionForward validar_avisos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm036Action validar_avisos");
		miServicio.m_validar_avisos(request);
		return this.form(mapping, form, request, response);
	}
// bug 0037233 2010901 MMS   Fin
}
