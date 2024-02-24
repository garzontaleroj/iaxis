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
import axis.service.modal.Axisusu009Service;

public class Axisusu009Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisusu009Service miServicio = new Axisusu009Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisusu009Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisusu009Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisusu009Action busqueda");
		miServicio.m_busqueda(request, this);
		return mapping.findForward("form");
	}
}
