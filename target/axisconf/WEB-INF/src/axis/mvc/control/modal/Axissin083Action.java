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
import axis.service.modal.Axissin083Service;

public class Axissin083Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin083Service miServicio = new Axissin083Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin083Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin083Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin083Action guardar");
		request.getSession().setAttribute("subpantalla_mdl", request.getParameter("subpantalla"));
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

}
