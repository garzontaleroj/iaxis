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
import axis.service.modal.Axispro018Service;

public class Axispro018Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro018Service miServicio = new Axispro018Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro018Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro018Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward recargarTipoInteres(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro018Action recargarTipoInteres");
		// Nota: Aunque el nombre del m�todo sea recargarCuadroInteres, lo que
		// realmente recarga son los tipos para un cuadro. Es problema de mal
		// entendimiento/poca informaci�n cuando se hizo la pantalla Axispro007.
		new Axispro007Service().m_recargarCuadroInteres(request, null);
		return mapping.findForward("ajax");
	}

	public ActionForward recargarVigencias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro018Action recargarVigencias");
		new Axispro001Service().datosTecnicos_RecargarVigencias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward recargarTramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro018Action recargarTramos");
		new Axispro001Service().datosTecnicos_RecargarTramos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward deleteCuadroInteres(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action deleteCuadroInteres");

		miServicio.m_deleteCuadroInteres(request);
		return mapping.findForward("ajax");
	}

	public ActionForward deleteVigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action deleteVigencia");

		if (miServicio.m_deleteVigencia(request))
			this.recargarTipoInteres(mapping, form, request, response);

		return mapping.findForward("ajax");
	}

	public ActionForward deleteTramo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro007Action deleteTramo");

		if (miServicio.m_deleteTramo(request))
			this.recargarTramos(mapping, form, request, response);

		return mapping.findForward("ajax");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		request.getSession().removeAttribute("DATTECN_LSTNCODINT");
		return mapping.findForward("ajax");
	}

}
