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
import axis.service.axis.Axisfis005Service;

public class Axisfis005Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisfis005Service miServicio = new Axisfis005Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis005Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis005Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward asignar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis005Action asignar");
		miServicio.m_asignar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward generar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis005Action generar");
		miServicio.m_generar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_datos_carpeta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_datos_carpeta(request);
		return mapping.findForward("ajax");
	}

}
