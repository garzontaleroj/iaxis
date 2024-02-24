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
import axis.service.axis.Axisrea037Service;

/**
 *
 * @since Java 5.0
 */
public class Axisrea037Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea037Service miServicio = new Axisrea037Service();

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_tunnel_doc(request, response);
		return mapping.findForward("error"); // json ya esta predefindo como mapping;
	}

	public ActionForward recuperarsprocesajaxjson(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		miServicio.m_recuperarsprocesajaxjson(request, this);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action Buscar");

		String datos_num_lineas = miServicio.getCampoTextual(request, "datos_num_lineas");
		if (datos_num_lineas != null) {
			miServicio.m_cancelar(request, this);
		}

		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward liquidar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action Buscar");
		miServicio.m_liquidar(request, this);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward recargar_pantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action Buscar");
		miServicio.m_recargar_pantalla(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualiza_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_combos");
		miServicio.m_ajax_actualiza_version(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_combos");

		miServicio.m_ajax_actualiza_actividad(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_ramo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_ramos");

		miServicio.m_ajax_actualiza_ramos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_tramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_tramos");

		miServicio.m_ajax_actualiza_tramos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_producto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_combos");

		miServicio.m_ajax_actualiza_producto(request);

		return mapping.findForward("ajax");

	}

	public ActionForward ajax_actualiza_companias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action ajax_actualiza_companias");
		miServicio.m_ajax_actualiza_companias(request);
		return mapping.findForward("json");

	}

	public ActionForward ajax_actualizar_importes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea037Action actualizar_combos");
		miServicio.m_ajax_actualiza_importes(request);
		return mapping.findForward("ajax");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea037Action cancelar");
		miServicio.m_cancelar(request, this);
		// return this.buscar(mapping, form, request, response);
		return mapping.findForward("ajax");
	}
}
