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
import axis.service.axis.Axisctr153Service;

public class Axisctr153Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr153Service miServicio = new Axisctr153Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form_aux(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Form");
		miServicio.m_form_aux(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizaRevalorizacionGarantias(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action actualizaRevalorizacionGarantias");
		miServicio.m_actualizaRevalorizacionGarantias(request);
		return mapping.findForward("ajax");
	}

	public ActionForward selected_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Selected Garantia");
		miServicio.m_selected_garantia(request, this);
		return mapping.findForward("form");
	}

	public ActionForward tarifar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Tarifar");
		miServicio.m_tarifar(request, this);
		// return this.form_aux(mapping, form, request, response);
		// return mapping.findForward("form");
		return this.form_aux(mapping, form, request, response);
	}

	public ActionForward ajax_cambiar_forma_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Ajax cambiar Forma Pago");
		miServicio.m_ajax_cambiar_forma_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Siguiente");
		miServicio.m_siguiente(request, this);
		// return this.navegar(request,this.recargarThisForm(mapping));
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr153Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

}
