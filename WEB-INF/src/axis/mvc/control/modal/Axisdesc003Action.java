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
import axis.service.modal.Axisdesc003Service;

public class Axisdesc003Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisdesc003Service miServicio = new Axisdesc003Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc003Action Init");
		miServicio.m_init(request, this);
		// return mapping.findForward("form");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc003Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_guardar_lista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisdesc003Action ajax_guardar_lista");
		miServicio.m_ajax_guardar_lista(request, this);
		return mapping.findForward("ajax");

	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisdesc003 aceptar");
		miServicio.m_aceptar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actcdesc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisdesc003 actcdesc");
		miServicio.m_actcdesc(request, this);
		return this.form(mapping, form, request, response);
	}

}