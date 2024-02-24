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
import axis.service.axis.Axisctr080Service;

public class Axisctr080Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr080Service miServicio = new Axisctr080Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr080Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr080Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr080Action delete");
		miServicio.m_delete(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward listado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr080Action listado");
		miServicio.m_listado(request, this);
		return this.form(mapping, form, request, response);
	}

}
