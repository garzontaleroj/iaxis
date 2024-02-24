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
import axis.service.modal.Axisrea038Service;

public class Axisrea038Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea038Service miServicio = new Axisrea038Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea038Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea038Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea038Action cargar");
		miServicio.m_cargar_valores(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward delete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea038Action delete");
		miServicio.m_delete(request, this);
		miServicio.m_cargar_valores(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisrea038Action liquida");
		miServicio.m_aceptar(request, this);
		miServicio.m_cargar_valores(request, this);
		return this.form(mapping, form, request, response);
	}

}
