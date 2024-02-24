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
import axis.service.modal.Axisrea030Service;

public class Axisrea030Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea030Service miServicio = new Axisrea030Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/**
	 */
	public

			ActionForward ajax_grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_grabar(request, this);
		return mapping.findForward("ajax");
	}

}
