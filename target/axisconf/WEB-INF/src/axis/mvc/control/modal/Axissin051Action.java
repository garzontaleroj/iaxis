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
import axis.service.modal.Axissin051Service;

public class Axissin051Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin051Service miServicio = new Axissin051Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin051Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin051Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin051Action guardar");

		/* Guardamos valor de la seccion - subseccion */
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		request.getSession().setAttribute("seccion_mdl", request.getParameter("seccion"));

		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin051Action recargar");

		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	/*
	 * public ActionForward ajax_actualiza_persona(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException { if (request.getParameterValues("paginar") !=
	 * null) return this.form(mapping, form, request, response);
	 * 
	 * miServicio.m_ajax_actualiza_persona(request); return mapping.findForward
	 * ("ajax"); } public ActionForward ajax_direccion(ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse response)
	 * throws IOException, ServletException { miServicio.m_ajax_direccion(request);
	 * return mapping.findForward("ajax"); }
	 */
	public ActionForward traspasar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin051Action traspasar");

		miServicio.m_traspasar(request, this);
		return mapping.findForward("form");
	}

}
