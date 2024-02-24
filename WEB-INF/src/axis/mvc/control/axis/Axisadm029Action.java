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
import axis.service.axis.Axisadm029Service;
import axis.util.Constantes;

/**
 * Axisadm029Action.java 26/02/2009
 */
public class Axisadm029Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm029Service miServicio = new Axisadm029Service();

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
		logger.debug("Axisadm029Action Init");
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
		logger.debug("Axisadm029Action Form");
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
		logger.debug("Axisadm029Service cancelar");
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
	/*
	 * public ActionForward actualizar_combos(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException {
	 * logger.debug("Axisadm029Action actualizar_combos");
	 * 
	 * //miServicio.m_ajax_actualizar_combos(request);
	 * 
	 * return mapping.findForward("ajax"); }
	 */

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
		logger.debug("Axisadm029Action consultar");
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
		logger.debug("Axisadm029Action domiciliar");
		miServicio.m_domiciliar(request);
		// return this.consultar(mapping, form, request, response);

		miServicio.m_recargar(request);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm029Action aceptar");
		miServicio.m_aceptar(request);
		// return this.consultar(mapping, form, request, response);
		miServicio.m_recargar(request);
		return mapping.findForward("form");
	}

	public ActionForward retroceder(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm029Action retroceder");
		miServicio.m_retroceder(request);
		// return this.consultar(mapping, form, request, response);
		miServicio.m_recargar(request);
		return mapping.findForward("form");
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
	public ActionForward ajax_imprimir_previ(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm029Action imprimir_previ");
		miServicio.m_ajax_imprimir_previ(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_generar_resultados_map(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm029Action ajax_generar_resultados_map");
		miServicio.m_ajax_generar_resultados_map(request);
		return mapping.findForward("ajax");
	}

	public ActionForward generar_resultados_maps(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm029Action generar_resultados_maps");
		miServicio.m_generar_resultados_maps(request);
		// return this.form(mapping, form, request, response);

		miServicio.m_recargar(request);
		return mapping.findForward("form");

	}

	public ActionForward consultarDetRecibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm029Action consultarDetRecibos");
		miServicio.m_consultarDetRecibos(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "DSP_RECIBOS");
		request.getSession().setAttribute("saltarRebuts", "0");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarDetRecibos"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisadm029.do?operation=volverDetRec"));
		return mapping.findForward("saltar");
	}

	public ActionForward volverDetRec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm029Action volver");
		miServicio.m_volverDetRec(request, this);
		return this.consultar(mapping, form, request, response);

	}

}