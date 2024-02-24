//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.modal.Axismnt021Service;

public class Axismnt021Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axismnt021Service miServicio = new Axismnt021Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward dbGetCalifi(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action dbGetCalifi");
		miServicio.m_dbGetCalifi(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action guardar");
		miServicio.m_guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action nuevo");
		miServicio.m_nuevo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action editar");
		miServicio.m_editar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward eliminar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt021Action eliminar");
		miServicio.m_eliminar(request, this);
		return mapping.findForward("form");
	}
}
