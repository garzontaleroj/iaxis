//Revision:# I03/YWbf+1g9BkOTp11o3Q== #
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
import axis.service.axis.Axisper047Service;

public class Axisper047Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axisper047Service miServicio = new Axisper047Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action init");
		miServicio.m_form(request);
		// miServicio.m_form(request, this);
		return this.form(mapping, form, request, response);
	}

	@SuppressWarnings("static-access")
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action form");
		// IAXIS-4854
		// this.topPila(request, "CMODO", miServicio.getCampoTextual(request,
		// "ACTIONMOD"));
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	@SuppressWarnings("static-access")
	public ActionForward forma(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "ACTIONMOD"));
		miServicio.m_forma(request);
		return mapping.findForward("form");
	}

	@SuppressWarnings("static-access")
	public ActionForward formb(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "ACTIONMOD"));
		miServicio.m_formb(request);
		return mapping.findForward("form");
	}

	@SuppressWarnings("static-access")
	public ActionForward formc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "ACTIONMOD"));
		miServicio.m_formc(request);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action aceptar");
//		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptara(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action aceptar");
//		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_aceptara(request);
		return mapping.findForward("form");
	}

	public ActionForward aceptarb(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action aceptar");
//		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_aceptarb(request);
		return mapping.findForward("form");
	}

	public ActionForward aceptarc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action aceptar");
//		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_aceptarc(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr040Action anterior");
		miServicio.m_anterior(request);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward borrar_sarlaft(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr040Action anterior");
		miServicio.borrar_sarlaft(request);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward grabar_beneficiarios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabar_beneficiarios(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabar_expuestas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabar_expuestas(request, this);
		return this.form(mapping, form, request, response);
	}

	// Inicio IAXIS-3287 01/04/2019
	public ActionForward duplicar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_duplicar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_ciiu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_ciiu(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	// Fin IAXIS-3287 01/04/2019

}
