//Revision:# 6AdHEwV2NQl11zLN+eVxbg== #
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
import axis.service.modal.Axisfic001Service;

public class Axisfic001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisfic001Service miServicio = new Axisfic001Service();

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

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar(request, this);
		// return mapping.findForward("ajax");
		return this.form(mapping, form, request, response);
	}

	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - se incluye eliminarfin_general
	public ActionForward eliminarfin_general(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminar_fin_general(request, this);
		return this.buscar(mapping, form, request, response);
	}
	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019

	public ActionForward eliminarrenta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminar_renta(request, this);
		// return mapping.findForward("ajax");
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward eliminarendeuda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminar_endeuda(request, this);
		// return mapping.findForward("ajax");
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward eliminarindica(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminar_indica(request, this);
		// return mapping.findForward("ajax");
		return this.buscar(mapping, form, request, response);
	}

}
