//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.axis.Axisctr207Service;

public class Axisctr207Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr207Service miServicio = new Axisctr207Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizaRevalorizacionGarantias(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualizaRevalorizacionGarantias");
		miServicio.m_actualizaRevalorizacionGarantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward selected_garantia_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action selected_garantia_json");
		miServicio.m_selected_garantia_json(request);
		return mapping.findForward("json");
	}

	public ActionForward capital_recomendado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action capital_recomendado ");
		miServicio.m_capital_recomendado(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward selected_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Selected Garantia");
		miServicio.m_selected_garantia(request, this);
		return mapping.findForward("form");
	}

	public ActionForward tarifar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Tarifar");

		// BUG 27955/156620 - RCL - 20/01/2014
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_tarifar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward tarifar_paso2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Tarifar_paso2");
		miServicio.m_tarifar_paso2(request, this);
		return this.form(mapping, form, request, response);
	}

	// etm ini
	public ActionForward actualizaDecuentosRecargosRiesgoGaran(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualizaPdtocomRiesgoGaran");
		miServicio.m_actualizaDecuentosRecargosRiesgoGaran(request);
		return mapping.findForward("ajax");
	}

	// etm fin
	public ActionForward ajax_cambiar_forma_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Ajax cambiar Forma Pago");
		miServicio.m_ajax_cambiar_forma_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior_sing(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action Anterior sin guardar");
		miServicio.m_anterior_sing(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action volver");
		miServicio.m_volver(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward actualitzarmanual(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualitzarmanual");
		miServicio.m_actualitzarmanual(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarmanual_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualitzarmanual_json");
		miServicio.m_actualitzarmanual_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward actualitzarpreg_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualitzarmanual_json");
		miServicio.m_actualitzarpreg_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward actualitzarimports_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualitzarimports");
		miServicio.m_actualitzarimports_json(request, this);
		return mapping.findForward("json");
	}

	public ActionForward ajax_continuar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr207Action ajax_continuar");
		miServicio.m_ajax_continuar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cuest_imprimido(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr207Action ajax_continuar");
		miServicio.m_ajax_cuest_imprimido(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward setmodalidad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action setmodalidad");
		miServicio.m_setModalidad(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarimports(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualitzarimports");
		miServicio.m_actualitzarimports(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_setGarantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action ajax_setGarantia");
		miServicio.m_ajax_setGarantia(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward avisos_cuestionario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr207Action avisos_cuestionario");
		miServicio.m_avisos_cuestionario(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualizar_franq_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action actualizar_franq_json");
		miServicio.m_actualizar_franq_json(request, this);
		return mapping.findForward("json");
	}

	// INI BUG 41143/229973 - 17/03/2016 - JAEG
	public ActionForward m_actualiza_vigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action m_actualiza_vigencia");
		miServicio.m_actualiza_vigencia(request, this);
		return mapping.findForward("json");
	}

	public ActionForward m_actualiza_cobraprima(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action m_actualiza_cobraprima");
		miServicio.m_actualiza_cobraprima(request, this);
		return mapping.findForward("json");
	}
	// FIN BUG 41143/229973 - 17/03/2016 - JAEG

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_guardar(request);
		return mapping.findForward("form");
	}
}
