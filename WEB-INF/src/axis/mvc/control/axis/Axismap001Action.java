package axis.mvc.control.axis;

import java.io.IOException;
import java.util.Enumeration;
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
import axis.service.axis.Axismap001Service;
import axis.service.modal.Axisage001Service;
import axis.util.Constantes;

public class Axismap001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axismap001Service miServicio = new Axismap001Service();

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
		logger.debug("Axismap001Action Init");

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
		logger.debug("Axismap001Action Form");
		miServicio.m_form(request);
		logger.debug("Axismap001Action Form fi-->" + mapping.findForward("form"));
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
	public ActionForward cargarDetalleAgente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action cargarDetalleAgente");
		miServicio.m_cargarDetalleAgente(request);

		return mapping.findForward("detalle");
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
	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action salir");

		if (request.getParameter("paginar") == null) {
			/* Quitar datos de otras b�squedas que hayan quedado en Session */

			Enumeration<String> attributeNames = request.getSession().getAttributeNames();

			while (attributeNames.hasMoreElements()) {
				String attribute = attributeNames.nextElement();
				if (attribute.startsWith("RED_"))
					request.getSession().removeAttribute(attribute);
			}
		}

		return mapping.findForward("ajax");
	}

	public ActionForward actualizar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action actualizar");
		miServicio.m_ajax_actualizar(request);

		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/***************************************************
	 * SALTOS DE FLUJO
	 *************************************************/
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
	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axismap001Action editar");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.topPila(request, "formdata_axisage002", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axismap001.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axismap001.do?operation=volver"));
		return mapping.findForward("saltar");
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
	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axismap001Action volver");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axisage002 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisage002");

			if (!AxisBaseService.isEmpty(formdata_axisage002))
				formdata.putAll(formdata_axisage002);

			// Recargar datos del agente que ten�amos seleccionado
			if (!AxisBaseService.isEmpty(formdata.get("CAGENTE"))) {
				// Repetir b�squeda, por si ha cambiado el �rbol
				request.setAttribute("BUSCAR_CON_FILTRO", "true");
				new Axisage001Service().m_buscar(request);
				request.setAttribute("CAGENTE2Reload", formdata.get("CAGENTE"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action Buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_xml(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action borrar");
		miServicio.m_borrar(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward borrar_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action borrar");
		miServicio.m_borrar_detalle(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward borrar_dettratar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axismap001Action borrar_dettratar");
		miServicio.m_borrar_dettratar(request);
		return this.buscar(mapping, form, request, response);
	}

}
