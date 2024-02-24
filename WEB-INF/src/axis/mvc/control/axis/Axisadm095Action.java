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
import axis.service.axis.Axisadm095Service;

public class Axisadm095Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm095Service miServicio = new Axisadm095Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095Action init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095Action form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095Action recargar");
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisadm095Action busqueda");
		miServicio.m_busqueda(request, this);
		return mapping.findForward("form");
	}

}
