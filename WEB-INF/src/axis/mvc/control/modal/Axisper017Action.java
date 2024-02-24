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
import axis.service.modal.Axisper017Service;

public class Axisper017Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper017Service miServicio = new Axisper017Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward grabarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Axisper017Service.Persona persona = miServicio.initPersona(request, this);
		boolean isNew = "true".equals(AxisBaseService.getCampoTextual(request, "isNew"));
		request.setAttribute("NORECARG", "0");
		// Ir procesando las validaciones una detr�s de otra y condicionalmente al valor
		// de retorno anterior
		if (miServicio.m_grabarPersona(persona, request, this).intValue() == 0)
			return mapping.findForward("form");

		// Si estamos aqu�, no podemos devolver un SPERSON de out porque no ha
		// funcionado
		request.removeAttribute("PSPERSONOUT");

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_getdigito(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getdigito(request, this);
		return mapping.findForward("ajax");
	}

}
