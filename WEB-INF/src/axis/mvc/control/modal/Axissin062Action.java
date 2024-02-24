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

import axis.mvc.control.axis.Axissin006Action;
import axis.service.modal.Axissin062Service;

public class Axissin062Action extends Axissin006Action {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin062Service miServicio = new Axissin062Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/

	public Axissin062Action() {
		logger = LogFactory.getLog(getClass());
		miServicio = new Axissin062Service();
	}

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin062Action Init");
		return form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin062Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward genera_docupendiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin062Action guardar");
		miServicio.genera_docupendiente(request, this);
		return form(mapping, form, request, response);
	}
}