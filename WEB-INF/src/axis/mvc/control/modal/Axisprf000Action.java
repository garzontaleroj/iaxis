//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.modal.Axisprf000Service;

public class Axisprf000Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisprf000Service miServicio = new Axisprf000Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action Guardar");
		miServicio.guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_subtipos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action ajax_busqueda_subtipos");
		miServicio.m_ajax_busqueda_subtipos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_sprofes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action ajax_busqueda_sprofes");
		miServicio.m_ajax_busqueda_sprofes(request);
		return mapping.findForward("ajax");
	}

	public ActionForward busqueda_profesional(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper008Action: busqueda_persona");
		miServicio.m_busqueda_profesional(request, this);

		return mapping.findForward("form");
	}

	public ActionForward traspaso_profesional(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action traspaso_profesional
		log.info("Axisprf000Action: traspaso_profesional");
		miServicio.m_traspaso_profesional(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_cargarPoblaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf000Action: m_ajax_cargarPoblaciones");
		miServicio.m_ajax_cargarPoblaciones(request);
		return mapping.findForward("ajax");
	}
}
