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
import axis.service.axis.Axisctr031Service;

public class Axisctr031Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr031Service miServicio = new Axisctr031Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizaRevalorizacionGarantias(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action actualizaRevalorizacionGarantias");
		miServicio.m_actualizaRevalorizacionGarantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward selected_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Selected Garantia");
		miServicio.m_selected_garantia(request, this);
		return mapping.findForward("form");
	}

	public ActionForward selected_garantia2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Selected Garantia2");
		miServicio.m_selected_garantia2(request, this);
		return mapping.findForward("form");
	}

	// etm ini
	public ActionForward actualizaDecuentosRecargosRiesgoGaran(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action actualizaPdtocomRiesgoGaran");
		miServicio.m_actualizaDecuentosRecargosRiesgoGaran(request);
		return mapping.findForward("ajax");
	}
	// etm fin

	public ActionForward tarifar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Tarifar");
		miServicio.m_tarifar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward tarifar_paso2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Tarifar_paso2");
		miServicio.m_tarifar_paso2(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward recargar_inversion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Recargar Inversion");
		miServicio.m_guarda_preguntas_respuestas(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_cambiar_forma_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Ajax cambiar Forma Pago");
		miServicio.m_ajax_cambiar_forma_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward actualitzarimports(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action actualitzarimports");
		miServicio.m_actualitzarimports(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarmanual(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action actualitzarmanual");
		miServicio.m_actualitzarmanual(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_verifpreg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr031Action Ajax verifpreg");
		miServicio.m_ajax_verifpreg(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_setGarantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action ajax_setGarantia");
		miServicio.m_ajax_setGarantia(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward actualiza_evoluprov(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr031Action actualiza_evoluprov");
		miServicio.m_actualiza_evoluprov(request, this);
		return mapping.findForward("ajax");
	}
}
