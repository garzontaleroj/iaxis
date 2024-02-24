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
import axis.service.axis.Axisctr003Service;

public class Axisctr003Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr003Service miServicio = new Axisctr003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward ajax_ver_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper003Action: ajax_ver_asegurado");
		miServicio.m_ajax_ver_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_modificar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper003Action: ajax_modificar_asegurado");
		miServicio.m_ajax_modificar_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_delete_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_delete_asegurado");
		miServicio.m_ajax_delete_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_selected_asegurado");
		miServicio.m_ajax_selected_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_vinculo_tomador(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_selected_vinculo_tomador");
		miServicio.m_ajax_selected_vinculo_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrarAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action borrarAsegurado");
		miServicio.m_borrarAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action guardar_asegurado");
		miServicio.m_guardar_asegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action cambiar_asegurado");
		miServicio.m_cambiar_asegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action actAsegurado");
		miServicio.m_actAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualiza_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action actualiza_asegurado");
		miServicio.m_actualiza_asegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_update_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Actionajax_update_asegurado");
		miServicio.m_ajax_update_asegurado(request);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward ajax_buscar_avisos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_buscar_avisos");
		miServicio.m_ajax_buscar_avisos(request);
		return mapping.findForward("ajax");
	}

}
