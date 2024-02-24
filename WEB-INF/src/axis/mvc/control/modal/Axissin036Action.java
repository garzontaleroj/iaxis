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
import axis.service.modal.Axissin036Service;

public class Axissin036Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin036Service miServicio = new Axissin036Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin036Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin036Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward grabar_cabecera(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin036Action grabar_cabecera");
		miServicio.m_grabar_cabecera(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward grabar_detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin036Action grabar_detalle");
		miServicio.m_grabar_detalle(request, this);

		return this.form(mapping, form, request, response);
	}

}