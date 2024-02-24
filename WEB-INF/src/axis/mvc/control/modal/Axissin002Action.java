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
import axis.service.modal.Axissin002Service;

public class Axissin002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin002Service miServicio = new Axissin002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_busqueda_siniestro(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward busqueda_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper001Action: busqueda");

		miServicio.m_busqueda_siniestro(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ver_siniestro_axissin003(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin002Action: ver_siniestro_axissin003");
		// miServicio.m_ver_siniestro(request, this, null);
		return mapping.findForward("aceptar_buscador_axissin003");
	}

}
