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
import axis.service.modal.Axispro005Service;

public class Axispro005Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro005Service miServicio = new Axispro005Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro005Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro005Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_set_datos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro005Action ajax_set_datos");
		miServicio.m_ajax_set_datos(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward setDatosGestion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro005Action setDatosGestion");
		miServicio.m_setDatosGestion(request, this);
		// return mapping.findForward("form");
		return this.form(mapping, form, request, response);
	}

}
