//Revision:# cJRYAJ5zgQsPhKcK6VB81Q== #
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
import axis.service.modal.Axisfic006Service;

public class Axisfic006Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisfic006Service miServicio = new Axisfic006Service();

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

	public ActionForward listavalores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_listavalores(request, this);
		return mapping.findForward("ajaxp");
	}

	public ActionForward borrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualizar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_actualizar(request, this);
		return mapping.findForward("ajaxp");
	}

	public ActionForward validar_parfinanciera(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_validar_parfinanciera(request, this);
		return mapping.findForward("ajax");
	}

	// INI - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
	public ActionForward vPatrimonial(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisfic006Action m_vPatrimonial");
		miServicio.m_vPatrimonial(request, this);
		return this.form(mapping, form, request, response);
	}
	// FIN - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
}
