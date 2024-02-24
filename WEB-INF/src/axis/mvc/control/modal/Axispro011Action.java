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
import axis.service.axis.AxisBaseService;
import axis.service.modal.Axispro011Service;

public class Axispro011Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro011Service miServicio = new Axispro011Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro011Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro011Action Form");
		miServicio.m_form(request, this);
		request.setAttribute("hay_cambios_en_duraciones",
				AxisBaseService.getCampoTextual(request, "hay_cambios_en_duraciones"));
		return mapping.findForward("form");
	}

	public ActionForward eliminar_duracion_lista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminar_duracion_lista(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}
}
