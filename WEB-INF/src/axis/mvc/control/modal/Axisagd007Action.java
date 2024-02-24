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
import axis.service.modal.Axisagd007Service;

/**
 * Axisagd007Action.java 22/06/2011
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor</a>
 * @since Java 5.0
 */

public class Axisagd007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisagd007Service miServicio = new Axisagd007Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd007Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd007Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

}
