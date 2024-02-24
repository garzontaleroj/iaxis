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
import axis.service.axis.Axisage002Service;
import axis.service.modal.Axisage001Service;
import axis.util.Constantes;

/**
 * Axisage002Action.java 08/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 */
public class Axisage002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage002Service miServicio = new Axisage002Service();

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
		logger.debug("Axisage002Action Init");

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
		logger.debug("Axisage002Action Form");
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
	public ActionForward cargarDetalleAgente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage002Action cargarDetalleAgente");
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
		logger.debug("Axisage002Action salir");

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
		log.debug("Axisage002Action editar");

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.topPila(request, "formdata_axisage002", formdata);
		String isEdit = AxisBaseService.getCampoTextual(request, "isEdit");
		this.topPila(request, "CMODO_ORI", CMODO);

		if ("true".equals(isEdit)) {
			this.topPila(request, "CMODO", "MODIFICACION");
		} else {
			this.topPila(request, "CMODO", CMODO);
		}

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axisage003.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisage002.do?operation=volver"));

		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

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

		log.debug("Axisage002Action volver");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axisage002 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisage002");

			String CMODO = (String) this.topPila(request, "CMODO_ORI");
			this.topPila(request, "CMODO", CMODO);
			this.topPila(request, "CMODO_SUB", CMODO);

			if (!AxisBaseService.isEmpty(formdata_axisage002))
				formdata.putAll(formdata_axisage002);

			// Recargar datos del agente que ten�amos seleccionado
			if (!AxisBaseService.isEmpty(formdata.get("CAGENTE"))) {
				// Repetir b�squeda, por si ha cambiado el �rbol
				request.setAttribute("BUSCAR_CON_FILTRO", "true");
				if (request.getSession().getAttribute("RED_ARBOL") != null) {
					new Axisage001Service().m_buscar(request);
					request.setAttribute("CAGENTE2Reload", formdata.get("CAGENTE"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage002Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

}
