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
import axis.service.modal.Axisper027Service;

public class Axisper027Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper027Service miServicio = new Axisper027Service();

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
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward grabarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Axisper027Service.Persona persona = miServicio.initPersona(request, this);
		boolean isNew = "true".equals(AxisBaseService.getCampoTextual(request, "isNew"));

		// Ir procesando las validaciones una detr�s de otra y condicionalmente al valor
		// de retorno anterior
		if (miServicio.m_grabarRegSarlaft(persona, request, this, isNew).intValue() == 0) {
			return mapping.findForward("form");
		} else {
			// Si estamos aqu�, no podemos devolver un SPERSON de out porque no ha
			// funcionado
			request.removeAttribute("RES_SARLAFT");
			return this.form(mapping, form, request, response);
		}
	}

}
