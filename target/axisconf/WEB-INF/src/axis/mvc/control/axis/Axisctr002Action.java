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
import axis.service.axis.Axisctr002Service;

public class Axisctr002Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr002Service miServicio = new Axisctr002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action guardar_tomador");
		miServicio.m_guardar_tomador(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action cambiar_tomador");
		miServicio.m_cambiar_tomador(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarTomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action borrarTomador");
		miServicio.m_borrarTomador(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actTomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action borrarTomador");
		miServicio.m_actTomador(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action Siguiente");
		miServicio.m_siguiente(request, this);

		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward ajax_ver_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisper002Action: ajax_ver_tomador");
		miServicio.m_ajax_ver_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_modifica_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisper003Action: ajax_modifica_tomador");
		miServicio.m_ajax_modifica_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_delete_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action delete_tomador");
		miServicio.m_ajax_delete_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action AJAX selected_tomador");
		miServicio.m_ajax_selected_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_update_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action AJAX ajax_update_tomador");
		miServicio.ajax_update_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_domicilio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action AJAX ajax_selected_domicilio");
		miServicio.m_ajax_selected_domicilio(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_delete_session_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action AJAX delete session tomador");
		miServicio.m_ajax_delete_session_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_comprobar_pregunta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisper002Action: ajax_comprobar_pregunta");
		miServicio.m_ajax_comprobar_pregunta(request);
		return mapping.findForward("ajax");
	}

}
