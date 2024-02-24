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
import axis.service.modal.Axispsu015Service;

/**
 * Axispsu003Action.java 2/02/2010
 * 
 * @since Java 5.0
 */
public class Axispsu015Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispsu015Service miServicio = new Axispsu015Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispsu015Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

}
