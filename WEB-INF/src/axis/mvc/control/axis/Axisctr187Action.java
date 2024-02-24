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
import axis.service.axis.Axisctr187Service;

public class Axisctr187Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr187Service miServicio = new Axisctr187Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr187Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr187Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr187Action siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr187Action anterior");
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
		log.info("Axisctr187Action: ajax_modificar_asegurado");
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
		log.info("Axisctr187Action ajax_selected_vinculo_tomador");
		miServicio.m_ajax_selected_vinculo_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrarAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr187Action borrarAsegurado");
		miServicio.m_borrarAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action guardar_asegurado");
		miServicio.m_guardar_gestor(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action guardar_gestor");
		miServicio.m_borrar_gestor(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr187Action cambiar_asegurado");
		miServicio.m_cambiar_gestor(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr187Action actAsegurado");
		miServicio.m_actAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward update_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action update_gestor");
		miServicio.m_actualizar_gestor(request, this);
		return this.form(mapping, form, request, response);
	}

}
