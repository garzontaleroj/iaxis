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
import axis.service.axis.Axisadm076Service;

public class Axisadm076Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm076Service miServicio = new Axisadm076Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anadir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action anadir");
		miServicio.m_anadir(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action limpiar");
		miServicio.m_limpiar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward marcar_desmarcar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action limpiar");
		miServicio.m_marcar_desmarcar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm076Action guardar");
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

}
