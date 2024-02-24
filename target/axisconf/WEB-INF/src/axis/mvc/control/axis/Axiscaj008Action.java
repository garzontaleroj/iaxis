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
import axis.service.axis.Axiscaj008Service;

public class Axiscaj008Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axiscaj008Service miServicio = new Axiscaj008Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj008Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj008Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_movimientos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		miServicio.m_busqueda_movimientos(request, this, null);

		return mapping.findForward("form");
	}

}
