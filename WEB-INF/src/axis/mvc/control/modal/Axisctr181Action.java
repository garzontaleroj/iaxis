package axis.mvc.control.modal;

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
import axis.service.modal.Axisctr181Service;
import axis.service.modal.Axisper002Service;

public class Axisctr181Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr181Service miServicio = new Axisctr181Service();
	private Axisper002Service axisper002Service = new Axisper002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);

		miServicio.m_busqueda_siniestro(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward busqueda_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);

		miServicio.m_busqueda_siniestro(request, this);

		return mapping.findForward("form");

	}

	public ActionForward busqueda_poliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisctr181Action: busqueda poliza");

		miServicio.m_busqueda_poliza(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_prestamos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr181Action ajax_busqueda_prestamos");
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		miServicio.m_ajax_busqueda_prestamos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_siniestro_axissin003(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr181Action: ver_siniestro_axissin003");
		// miServicio.m_ver_siniestro(request, this, null);
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		return mapping.findForward("aceptar_buscador_axissin003");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr181Action ajax_busqueda_productos");
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		miServicio.m_ajax_busqueda_productos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_cobjase(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr181Action ajax_busqueda_cobjase");
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		miServicio.m_ajax_busqueda_cobjase(request);

		return mapping.findForward("ajax");
	}

	public ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		axisper002Service.m_ajax_getProvinPobla(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.busqueda_poliza(mapping, form, request, response);
		axisper002Service.m_ajax_direccion(request, null);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_actividades(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action ajax_busqueda_actividades");
		miServicio.m_ajax_busqueda_actividades(request);
		return mapping.findForward("ajax");
	}
}
