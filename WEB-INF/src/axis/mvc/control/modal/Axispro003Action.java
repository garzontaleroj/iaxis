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
import axis.service.modal.Axispro003Service;

public class Axispro003Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro003Service miServicio = new Axispro003Service();

	//
	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro003Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro003Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro003Action Buscar");

		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward setDatosGenerales(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro003Action setDatosGenerales");
		miServicio.m_setDatosGenerales(request, this);
		return this.form(mapping, form, request, response);
		// return mapping.findForward("form");

		// return new
		// ActionForward("/axis_axispro001.do?operation=form&subpantalla=datosgenerales");

	}

	public ActionForward ajax_guardar_lista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_guardar_lista");
		miServicio.m_ajax_guardar_lista(request, this);
		return mapping.findForward("ajax");

	}

	public ActionForward ajax_guardar_companyia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_guardar_companyia");
		miServicio.m_ajax_guardar_companyia(request, this);
		return mapping.findForward("ajax");

	}

	public ActionForward ajax_eliminar_companyia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_aliminar_companyia");
		miServicio.m_ajax_eliminar_companyia(request, this);
		return mapping.findForward("ajax");

	}

	public ActionForward ajax_cargar_prod(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_cargar_prod");
		miServicio.m_ajax_cargar_prod(request, this);
		return mapping.findForward("ajax");

	}

}