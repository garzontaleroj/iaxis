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
import axis.service.axis.Axisjob001Service;

public class Axisjob001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisjob001Service miServicio = new Axisjob001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob001Action Init");
		miServicio.m_init(request, this);
		return form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob001Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscarprocesos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisjob001Action buscarprocesos");
		miServicio.m_buscarprocesos(request, this);
		return form(mapping, form, request, response);
	}

	public ActionForward eliminarjob(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob001Action eliminarjob");
		miServicio.m_eliminarjob(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ejecutajob(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisjob001Action ejecutajob");
		miServicio.m_ejecutajob(request, this);

		return mapping.findForward("form");
	}

}