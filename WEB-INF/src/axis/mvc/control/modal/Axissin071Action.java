//Revision:# Pu94qg6L3pgfEX6GYGfhGA== #
package axis.mvc.control.modal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.service.modal.Axissin071Service;

public class Axissin071Action extends AbstractDispatchAction {
	private Axissin071Service miServicio = new Axissin071Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_actualizar_persona(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_cargarPoblaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_cargarPoblaciones(request);
		return mapping.findForward("ajax");
	}

}
