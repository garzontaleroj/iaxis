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
import axis.service.axis.Axisctr038Service;

public class Axisctr038Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr038Service miServicio = new Axisctr038Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action Init");
		// miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajaxrecargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action ajaxrecargar");
		miServicio.m_recargar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action Aceptar");

		miServicio.m_aceptar(request, this);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS AJAX
	 ********************************************/
	/*********************************************************************************************************************/

	public ActionForward tarifar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr0038Action tarifar");
		miServicio.m_tarifar(request);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action Siguiente");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward ajax_cargar_cuentas_tomadorAXIS(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomadorAXIS(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_HOST(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr038Action ajax_cargar_cuentas_CCCHOST");
		miServicio.m_ajax_cargar_cuentas_HOST(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr038Action m_ajax_actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_aportante(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr038Action m_ajax_actualizar_aportante");
		miServicio.m_ajax_actualizar_aportante(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward actualiza_evoluprov(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr038Action actualiza_evoluprov");
		miServicio.m_actualiza_evoluprov(request, this);
		return mapping.findForward("ajax");
	}
}
