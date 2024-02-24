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
import axis.service.modal.Axispro033Service;

/**
 * Axispro033Action.java
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axispro033Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro033Service miServicio = new Axispro033Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro033Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro033Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward borrarpreg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro041Action borrarpreg");

		miServicio.m_borrarpreg(request, this);
		return this.form(mapping, form, request, response);
	}

}
