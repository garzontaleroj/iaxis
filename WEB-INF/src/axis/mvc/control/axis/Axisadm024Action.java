package axis.mvc.control.axis;

import java.io.IOException;
import java.util.Enumeration;

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
import axis.service.axis.Axisadm024Service;
import axis.util.Constantes;

/**
 * Axisadm024Action.java 19/02/2009
 */
public class Axisadm024Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm024Service miServicio = new Axisadm024Service();

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
		logger.debug("Axisadm024Action Init");

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
		logger.debug("Axisadm024Action Form");
		miServicio.m_form(request);

		return mapping.findForward("form");
	}

	public ActionForward reactivar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm024Action reactivar");
		miServicio.m_reactivar(request);

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
	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm024Action recargar");
		miServicio.m_recargar(request);

		return mapping.findForward("form");
	}

	public ActionForward cargar_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm024Action recargar");
		miServicio.m_cargar_detalle(request);

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
	public ActionForward imprimir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null) {
			logger.debug("Axisadm024Action imprimir");
			miServicio.m_imprimir(request);
		}

		return this.recargar(mapping, form, request, response);
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
	public ActionForward mostrar_fichero(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm024Action mostrar_fichero");
		String FICHERO = (String) request.getSession().getAttribute("FICHERO");

		if (!AxisBaseService.isEmpty(FICHERO)) {
			AxisBaseService.tunnelFichero(request, response, FICHERO);
		}

		request.getSession().removeAttribute("FICHERO");

		return null;
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
	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm024Action cancelar");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.equals("AXISADM024_filtro"))
				request.getSession().removeAttribute(attribute);
		}

		return mapping.findForward("ajax");
	}

	public ActionForward navegarRecibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm024Action navegarRecibo");
		miServicio.m_navegar(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "recibos");
		request.getSession().setAttribute("saltarRebuts", "0");
		request.setAttribute("buscar", "true");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("navegarRecibo"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisadm024.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm024Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

}