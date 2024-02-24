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
import axis.service.modal.Axisper054Service;

public class Axisper054Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisper054Service miServicio = new Axisper054Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper054Action init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper054Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper054Action limpiar");
		miServicio.m_limpiar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper054Action buscarDatos");
		miServicio.m_buscarDatos(request, this);
		logger.debug("Axisper054Action returned...");
		return mapping.findForward("form");
	}

	public ActionForward buscarDatosCIFIN(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper054Action buscarDatosCIFIN");
		miServicio.m_buscarDatosCIFIN(request, this);
		logger.debug("Axisper054Action returned...");

		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizarPersonCIFIN(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_actualizarPersonCIFIN(request, this);
		return mapping.findForward("ajax");
	}

}
