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
import axis.service.modal.Axisadm095aService;

public class Axisadm095aAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	Axisadm095aService miServicio = new Axisadm095aService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095aAction init");

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095aAction form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");

	}

	public ActionForward ajax_guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm095aAction Guardar");

		miServicio.m_ajax_guardar(request, this);
		return mapping.findForward("ajax");
	}
}
