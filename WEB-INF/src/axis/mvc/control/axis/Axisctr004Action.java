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
import axis.service.axis.Axisctr004Service;
import axis.util.Constantes;

public class Axisctr004Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr004Service miServicio = new Axisctr004Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward ajax_cargar_cuentas_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_fefecto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_actualiza_fefecto");
		miServicio.m_ajax_actualiza_fefecto(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_tomadorAXIS(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomadorAXIS(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_HOST(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_cuentas_CCCHOST");
		miServicio.m_ajax_cargar_cuentas_HOST(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_fvencim(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_actualiza_fvencim");
		miServicio.m_ajax_actualiza_fvencim(request);
		return mapping.findForward("ajax");
	}

	// BUG:8613
	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ctrhost(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action ctrhost");
		miServicio.m_ctrhost(request, this);
		// return mapping.findForward( "form");
		return this.form(mapping, form, request, response);
	}

	public ActionForward riesgos_host(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action riesgos_host");
		miServicio.m_riesgos_host(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_existe_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action ajax_existe_persona");
		miServicio.m_ajax_existe_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_get_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action ajax_get_persona");
		miServicio.m_ajax_get_persona(request);
		return mapping.findForward("ajax");
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
	public ActionForward volver_per(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr004Action volver_per");
		miServicio.m_volver_per(request, this);

		return this.form(mapping, form, request, response);
		// return mapping.findForward("form");
	}

	public ActionForward alta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr004Action consulta_persona");

		miServicio.m_consulta_persona(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&ALTA_PERSONA_INI=1"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr004.do?operation=volver_per"));
		return mapping.findForward("saltar");
	}

	public ActionForward ajax_cargar_cobradores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_cobradores");
		miServicio.m_ajax_cargar_cobradores(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_mandatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_mandatos");
		miServicio.m_ajax_cargar_mandatos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_tarjeta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_cargar_tarjeta");
		miServicio.m_ajax_cargar_tarjeta(request);
		return mapping.findForward("ajax");
	}

	public ActionForward selected_tipo_retr(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr004Action selected_tipo_retr");
		miServicio.m_selected_tipo_retr_json(request);
		return mapping.findForward("json");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Recargar");
		miServicio.m_recargar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward recargar_forpag(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Recargar Forpag");
		miServicio.m_recargar_forpag(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardarEstadoPantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action Recargar");
		miServicio.m_guardarEstadoPantalla(request, this, null);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualizar_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr004Action ajax_actualizar_actividad");
		miServicio.m_ajax_actualizar_actividad(request);
		return mapping.findForward("ajax");
	}

}
