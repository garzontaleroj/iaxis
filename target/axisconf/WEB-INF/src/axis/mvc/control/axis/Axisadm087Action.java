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
import axis.service.axis.Axisadm087Service;

public class Axisadm087Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm087Service miServicio = new Axisadm087Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm087Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm087Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm087Action aceptar");
		ActionForward saltar = miServicio.m_aceptar(request, this);
		if (saltar != null) {
			return saltar;
		} else {
			return mapping.findForward("form");
		}

	}

	public ActionForward actualizar_valores_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm087Action actualizar_valores");
		miServicio.m_actualizar_valores_json(request);
		return mapping.findForward("json");
	}

	public ActionForward ajax_cargar_cuentas_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm087Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_tarjeta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm087Action ajax_cargar_tarjeta");
		miServicio.m_ajax_cargar_tarjeta(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_tomadorAXIS(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisadm087Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomadorAXIS(request);
		return mapping.findForward("ajax");
	}

}
