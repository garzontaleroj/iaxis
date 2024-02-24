//Revision:# aLW7Pu4BQOHlT8L+Xnh0RQ== #
package axis.mvc.control.axis;

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
import axis.service.axis.Axisadm205Service;

public class Axisadm205Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm205Service miServicio = new Axisadm205Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadmxx5Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadmxx1Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward f_cargar_listaVersionesDian(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		log.info("Axisadmxx1Action Busqueda f_cargar_listaVersionesDian");
		miServicio.f_cargar_listaVersionesDian(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_selected_grupo_205(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm205Action ajax_selected_grupo_205");
		miServicio.m_ajax_selected_grupo_205(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_ramos_205(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm205Action ajax_selected_ramos_205");
		miServicio.m_ajax_selected_ramos_205(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_activi_205(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm205Action ajax_selected_activi");
		miServicio.m_ajax_selected_activi_205(request);
		return mapping.findForward("ajax");
	}
}