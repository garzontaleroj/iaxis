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
import axis.service.axis.Axispro001Service;
import axis.service.modal.Axispro007Service;

/**
 * Axispro007Action.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro007Service miServicio = new Axispro007Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward recargarCuadroInteres(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action CargarCuadroInteres");
		miServicio.m_recargarCuadroInteres(request, null);
		return mapping.findForward("ajax");
	}

	public ActionForward recargarVigencias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action recargarVigencias");
		new Axispro001Service().datosTecnicos_RecargarVigencias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward recargarTramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action recargarTramos");
		new Axispro001Service().datosTecnicos_RecargarTramos(request);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward grabarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action grabarDatos");

		if (miServicio.m_grabarDatos(request)) {
			// Grabaci�n OK
			request.setAttribute("grabarOK", true);
			return mapping.findForward("form");
		} else
			return this.form(mapping, form, request, response);
	}

}
