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
import axis.service.axis.Axisadm008Service;

public class Axisadm008Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm008Service miServicio = new Axisadm008Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm008Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm008Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm008Action Form");
		miServicio.m_buscar(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/

	/**
	 */
	public

			ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm004Action Siguiente");
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm004Action Anterior");
		return this.navegar(request, this.recargarThisForm(mapping));

	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS AJAX
	 ********************************************/

	public ActionForward ajax_cargar_asientos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_cargar_asientos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_duplicar_plantilla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_duplicar_plantilla(request);
		return mapping.findForward("ajax");
	}

}
