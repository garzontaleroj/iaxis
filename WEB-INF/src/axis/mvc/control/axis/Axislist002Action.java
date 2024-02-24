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
import axis.service.axis.Axislist002Service;

public class Axislist002Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axislist002Service miServicio = new Axislist002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ejecutar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action ejecutar");
		miServicio.m_ejecutar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_personaagente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// joan
		log.info("Axislist002Action: ver_personaagente");
		miServicio.m_ajax_ver_personaagente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// joan
		log.info("Axisctr038Action m_ajax_actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargaragrupaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargaragrupaciones");
		miServicio.m_ajax_cargaragrupaciones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargarRamos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargaragrupaciones");
		miServicio.m_ajax_cargarRamos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargarProductos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargaragrupaciones");
		miServicio.m_ajax_cargarProductos(request);
		return mapping.findForward("ajax");
	}

	// etm ini 24776
	public ActionForward ajax_cargarMotivos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargarmotivos");
		miServicio.m_ajax_cargarMotivos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargarDatosPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axislist002Action cargarDatosPersona");
		miServicio.m_ajax_cargarDatosPersona(request);
		return mapping.findForward("ajax");
	}

	// etm fin 24776
	// BUG 21838 - 20120530 -JLTS Desde aqui
	public ActionForward ajax_cargarTramitadores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargarTramitadores");
		miServicio.m_ajax_cargarTramitadores(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargarPoblaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist002Action: m_ajax_cargarPoblaciones");
		miServicio.m_ajax_cargarPoblaciones(request);
		return mapping.findForward("ajax");
	}
	// BUG 21838 - 20120530 -JLTS Hasta aqui

}
