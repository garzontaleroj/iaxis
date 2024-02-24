//Revision:# HOG05OVnYbZ7HpyKZf50Tw== #
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
import axis.service.modal.Axisadm206Service;

public class Axisadm206Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm206Service miServicio = new Axisadm206Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadmxx1Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadmxx1Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_aceptar(request, this);
		// return mapping.findForward("form");
		return this.form(mapping, form, request, response);
		// return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward ajax_selected_grupo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm206Action ajax_selected_grupo");
		miServicio.m_ajax_selected_grupo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_ramos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm206Action ajax_selected_ramos");
		miServicio.m_ajax_selected_ramos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_activi(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm206Action ajax_selected_activi");
		miServicio.m_ajax_selected_activi(request);
		return mapping.findForward("ajax");
	}
}