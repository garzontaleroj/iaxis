package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.axis.Axisctr100Service;

public class Axisctr100Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr100Service miServicio = new Axisctr100Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.form(mapping, form, request, response));

		// ;AxisCodeWizard.findForward(Constantes.SIGUIENTE, SPRODUC, CMODO, CFORM,
		// CCAMPO, usuario));
		// return mapping.findForward("siguiente");
	}

	public ActionForward guardar_riesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		BigDecimal ok = miServicio.m_guardar_riesgo(request, this);

		if (ok.intValue() == 0)
			return this.navegar(request, this.recargarThisForm(mapping));
		else
			return mapping.findForward("form");
	}

	public ActionForward garantias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		BigDecimal ok = miServicio.m_garantias(request, this);

		if (ok.intValue() == 0)
			return this.navegar(request, this.recargarThisForm(mapping));
		else
			return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_borrar_riesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action delete_riesgo");
		miServicio.m_ajax_borrar_riesgo(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_borrar_aseg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action delete_asegurado");
		miServicio.m_ajax_borrar_aseg(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_continuar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action ajax_continuar");
		miServicio.m_ajax_continuar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_continuar_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr061Action ajax_continuar_json");
		miServicio.m_ajax_continuar_json(request, this);

		return mapping.findForward("json");
	}

	public ActionForward actualiza_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		log.info("Axisctr100Action actualiza_persona");
		miServicio.m_actualiza_persona(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar_simulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action guardar_simulacion");
		miServicio.m_guardar_simulacion(request, this);
		miServicio.m_form(request, this);
		// return mapping.findForward ("fin"); //salir del flujo
		return mapping.findForward("form");
	}

	public ActionForward imprimir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action impirmir");
		miServicio.m_imprimir(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_grabar_datos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		log.info("Axisctr100Action ajax_grabar_datos");
		miServicio.m_ajax_grabar_datos(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_grabar_datos_fp(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		log.info("Axisctr100Action ajax_grabar_datos_fp");
		miServicio.m_ajax_grabar_datos_fp(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward formulas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action formulas");
		miServicio.m_formula(request, this);
		return mapping.findForward("formula");

	}

	public ActionForward cerrar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr100Action cerrar_asegurado");
		miServicio.m_cerrar_asegurado(request, this);

		miServicio.m_form(request, this);
		return mapping.findForward("form");

	}

	public ActionForward ajax_actualiza_fvencim(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr100Action ajax_actualiza_fvencim");
		miServicio.m_ajax_actualiza_fvencim(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar_datos_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		BigDecimal ok = miServicio.m_buscar_datos_persona(request, this);

		if (ok.intValue() == 0)
			return this.navegar(request, this.recargarThisForm(mapping));
		else
			return this.form(mapping, form, request, response);
	}

	public ActionForward modificar_datos_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		BigDecimal ok = miServicio.m_modificar_datos_persona(request, this);
		if (ok.intValue() == 0)
			return this.navegar(request, this.recargarThisForm(mapping));
		else
			return this.form(mapping, form, request, response);

	}

	public ActionForward ajax_grabar_preguntas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr100Action m_ajax_grabar_preguntas");
		miServicio.m_ajax_grabar_preguntas(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_abrir_riesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action ajax_abrir_riesgo");
		miServicio.m_ajax_abrir_riesgo(request, this);

		return mapping.findForward("ajax");
		//
	}

	public ActionForward ajax_guardarActivitat(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_ajax_guardarActivitat(request);
		return mapping.findForward("ajax");
	}

	public ActionForward siguiente_corr(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action siguiente_corr");
		BigDecimal ok = miServicio.m_siguiente_corr(request, this);

		if (ok.intValue() == 0)
			return this.navegar(request, this.recargarThisForm(mapping));
		else
			return mapping.findForward("form");

	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action siguiente_corr");
		miServicio.m_anterior(request, this);

		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward ajax_delete_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr010Action delete_tomador");
		miServicio.m_ajax_delete_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_delete_conductor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action delete_conductor");
		miServicio.m_ajax_delete_conductor(request);

		return mapping.findForward("ajax");
	}

// Bug: 0027955/0152213 - JSV (05/09/2013)

	public ActionForward ajax_set_riesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisctr100Action ajax_set_riesgo");

		miServicio.m_ajax_set_riesgo(request);

		return mapping.findForward("ajax");
	}

	public ActionForward rechazar_simulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr100Action rechazar_simulacion");
		miServicio.m_rechazar_simulacion(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizar_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr100Action ajax_actualizar_actividad");
		miServicio.m_ajax_actualizar_actividad(request);
		return mapping.findForward("ajax");
	}
}
