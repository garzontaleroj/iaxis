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
import axis.service.axis.Axisper049Service;

public class Axisper049Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisper049Service miServicio = new Axisper049Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper049Action init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper049Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_documentos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.ajax_documentos(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper049Action limpiar");
		miServicio.m_limpiar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actulizarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper049Action actulizarDatos");
		miServicio.m_actulizarDatos(request);
		logger.debug("Axisper049Action returned...");
		return mapping.findForward("form");
	}

}
