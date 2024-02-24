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
import axis.service.axis.Axisctr504Service;

public class Axisctr504Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr504Service miServicio = new Axisctr504Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisctr504Action: busqueda");
		miServicio.m_busqueda(request, this);
		return mapping.findForward("form");

	}

	public ActionForward procesar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisctr504Action: procesar");
		miServicio.m_procesar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisctr504Action: anular");
		miServicio.m_anular(request, this);
		return mapping.findForward("form");
	}

}
