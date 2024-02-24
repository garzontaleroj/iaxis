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
import axis.service.modal.Axisctr049Service;

public class Axisctr049Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr049Service miServicio = new Axisctr049Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cobrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action cobrar");
		miServicio.m_cobrar(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("form");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action cancelar");
		miServicio.m_cancelar(request, this);
		return this.form(mapping, form, request, response);
		// return mapping.findForward ("form");
	}

	public ActionForward ajax_cargar_cuentas_tomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_tomadorAXIS(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action ajax_cargar_cuentas_tomador");
		miServicio.m_ajax_cargar_cuentas_tomadorAXIS(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_cuentas_HOST(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr049Action ajax_cargar_cuentas_CCCHOST");
		miServicio.m_ajax_cargar_cuentas_HOST(request);
		return mapping.findForward("ajax");
	}

}
