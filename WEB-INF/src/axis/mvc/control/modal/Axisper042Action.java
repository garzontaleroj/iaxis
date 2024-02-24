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
import axis.service.modal.Axisper042Service;

public class Axisper042Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	Axisper042Service miServicio = new Axisper042Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper042Action init");

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper042Action form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");

	}

	public ActionForward busqueda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper042Action busqueda");

		miServicio.m_busqueda(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisper042Action form");

		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

}
