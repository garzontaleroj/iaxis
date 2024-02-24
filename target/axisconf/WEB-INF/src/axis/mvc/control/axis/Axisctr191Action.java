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
import axis.service.axis.Axisctr191Service;

public class Axisctr191Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr191Service miServicio = new Axisctr191Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar_inquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action guardar_inquilino");
		miServicio.m_guardar_inquilino(request, this, null);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_avalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action guardar_avalista");
		miServicio.m_guardar_avalista(request, this, null);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_inquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action cambiar_tomador");
		miServicio.m_cambiar_inquilino(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_avalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action cambiar_avalista");
		miServicio.m_cambiar_avalista(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action Siguiente");
		miServicio.m_siguiente(request, this);

		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));

	}

	public ActionForward ajax_update_inquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_inquilino");
		miServicio.ajax_update_inquilino(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_update_avalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_avalista");
		miServicio.ajax_update_avalista(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selecciona_inquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_inquilino");
		miServicio.ajax_selecciona_inquilino(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selecciona_avalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_avalista");
		miServicio.ajax_selecciona_avalista(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_guarda_avalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_avalista");
		miServicio.ajax_guarda_avalista(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_guarda_inquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action AJAX ajax_update_inquilino");
		miServicio.ajax_guarda_inquilino(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actInquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action actInquilino");
		miServicio.m_actInquilino(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actAvalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action actAvalista");
		miServicio.m_actAvalista(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarInquilino(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action borrarInquilino");
		miServicio.m_borrarInquilino(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarAvalista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr191Action borrarAvalista");
		miServicio.m_borrarAvalista(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_delete_session_inquiaval(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr002Action AJAX delete session tomador");
		miServicio.m_ajax_delete_session_inquiaval(request);
		return mapping.findForward("ajax");
	}

}
