//Revision:# GhQhPBvFaX6Ppzj8Iapq2Q== #
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
import axis.service.modal.Axisfic002Service;

public class Axisfic002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisfic002Service miServicio = new Axisfic002Service();

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
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_aceptar(request, this);
		// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta el return
		return mapping.findForward("form");
		// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
		// return this.form(mapping, form, request, response);
	}

	public ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getProvinPobla(request);
		return mapping.findForward("ajax");
	}

	public ActionForward grabarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_ciiu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_ciiu(request, this);
		return mapping.findForward("ajax");
	}
}
