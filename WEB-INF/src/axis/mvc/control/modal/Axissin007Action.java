//Revision:# t99bXKVAYu9uaCxpIv1P4A== #
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
import axis.service.modal.Axissin007Service;

public class Axissin007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin007Service miServicio = new Axissin007Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_cambios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_guardar_cambios(request, this);
		// miServicio.m_form(request,this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cargar_seccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_cargar_seccion(request, this);
		miServicio.m_form(request, this);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS AJAX
	 ********************************************/

	public ActionForward ajax_cargar_modelos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_cargar_modelos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_versiones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_cargar_versiones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_actualiza_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_recuperar_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_recuperar_version(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_cunitra(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_selected_cunitra(request);
		return mapping.findForward("ajax");
	}

	// BUG CONF-513 - 12/01/2017 - OJSO
	public ActionForward ajax_cargar_subestados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_cargar_subestados(request);
		return mapping.findForward("ajax");
	}
	// BUG CONF-513 - 12/01/2017 - OJSO

	public ActionForward datossitriesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_datossitriesgo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_get_vehiculo_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_get_vehiculo_asegurado(request);
		return mapping.findForward("ajax");
	}

}
