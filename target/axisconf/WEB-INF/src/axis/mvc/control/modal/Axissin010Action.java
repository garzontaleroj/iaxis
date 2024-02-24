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
import axis.service.modal.Axissin010Service;

public class Axissin010Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin010Service miServicio = new Axissin010Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action guardar");

		/* Guardamos valor de la seccion - subseccion */
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		request.getSession().setAttribute("seccion_mdl", request.getParameter("seccion"));

		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action ajax_garantias");
		miServicio.m_ajax_garantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_franquicia_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action ajax_garantias");
		miServicio.m_ajax_franquicia_garantia(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action ajax_guardar");
		miServicio.m_ajax_guardar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_calcular_importe(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_calcular_importe(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cal_impor_pes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action ajax_cal_impor_pes");

		miServicio.m_ajax_cal_impor_pes(request);
		return mapping.findForward("ajax");
	}

	public ActionForward fechareserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action fechareserva");

		miServicio.m_fechareserva(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action fechareserva");

		miServicio.m_garantias(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_cambiofresfin(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action ajax_cambiofresfin");

		miServicio.m_ajax_cambiofresfin(request);
		return mapping.findForward("ajax");
	}

	public ActionForward calculipenali(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action calculipenali");

		miServicio.m_calculipenali(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward calculifranq(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin010Action calculifranq");

		miServicio.m_calculifranq(request, this);
		return this.form(mapping, form, request, response);
	}
}
