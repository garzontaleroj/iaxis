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
import axis.service.axis.Axisctr007Service;

public class Axisctr007Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr007Service miServicio = new Axisctr007Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizaRevalorizacionGarantias(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action actualizaRevalorizacionGarantias");
		miServicio.m_actualizaRevalorizacionGarantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward selected_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Selected Garantia");
		miServicio.m_selected_garantia(request, this);
		return mapping.findForward("form");
	}

	public ActionForward tarifar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Tarifar");
		miServicio.m_tarifar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward tarifar_paso2(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Tarifar_paso2");
		miServicio.m_tarifar_paso2(request, this);
		return this.form(mapping, form, request, response);
	}

	// etm ini
	public ActionForward actualizaDecuentosRecargosRiesgoGaran(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action actualizaPdtocomRiesgoGaran");
		miServicio.m_actualizaDecuentosRecargosRiesgoGaran(request);
		return mapping.findForward("ajax");
	}

	// etm fin
	public ActionForward ajax_cambiar_forma_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Ajax cambiar Forma Pago");
		miServicio.m_ajax_cambiar_forma_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action volver");
		miServicio.m_volver(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward actualitzarmanual(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action actualitzarmanual");
		miServicio.m_actualitzarmanual(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_continuar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr007Action ajax_continuar");
		miServicio.m_ajax_continuar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cuest_imprimido(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr007Action ajax_continuar");
		miServicio.m_ajax_cuest_imprimido(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward setmodalidad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action setmodalidad");
		miServicio.m_setModalidad(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualitzarimports(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action actualitzarimports");
		miServicio.m_actualitzarimports(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_setGarantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr007Action ajax_setGarantia");
		miServicio.m_ajax_setGarantia(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward avisos_cuestionario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr007Action avisos_cuestionario");
		miServicio.m_avisos_cuestionario(request, this);
		return this.form(mapping, form, request, response);
	}

}
