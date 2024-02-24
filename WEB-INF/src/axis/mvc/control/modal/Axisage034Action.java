//Revision:# 21ScXED1R2p9H5Ku5uBhfQ== #
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
import axis.service.modal.Axisage034Service;

public class Axisage034Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage034Service miServicio = new Axisage034Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward modificar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_modificar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizar_banco(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm060 ajax_actualizar_banco");
		miServicio.m_ajax_actualizar_banco(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_banco(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm060Action: ver_banco");
		miServicio.m_ajax_ver_banco(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_check(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage034Action ajax_actualizar_check");
		miServicio.m_ajax_actualizar_check(request);
		return mapping.findForward("ajax");
	}

	public ActionForward marcar_todos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisage034Action marcar_todos");
		miServicio.m_marcar_todos(request);
		return mapping.findForward("ajax");
	}

}
