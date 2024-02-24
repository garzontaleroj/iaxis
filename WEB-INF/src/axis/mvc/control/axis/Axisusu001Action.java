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
import axis.service.axis.Axisusu001Service;

public class Axisusu001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisusu001Service miServicio = new Axisusu001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisusu001Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisusu001Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardarDatosUsuarioAjax(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisusu001Action GuardarDatosUsuarioAjax");
		miServicio.m_guardarDatosUsuarioAjax(request);
		return mapping.findForward("ajax");
	}

	public ActionForward guardarDatosUsuarioRequest(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisusu001Action GuardarDatosUsuarioRequest");
		miServicio.m_guardarDatosUsuarioRequest(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardarDatosConexion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisusu001Action GuardarDatosConexion");
		miServicio.m_guardarDatosConexion(request);
		return mapping.findForward("ajax");
	}

}