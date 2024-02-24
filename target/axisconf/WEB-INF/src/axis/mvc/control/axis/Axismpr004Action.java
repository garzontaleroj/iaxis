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
import axis.service.axis.Axismpr004Service;

public class Axismpr004Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axismpr004Action.class);

	private Axismpr004Service miServicio = new Axismpr004Service();

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

	public ActionForward borrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_borrar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualizar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_actualizar(request, this);
		return mapping.findForward("ajaxp");
	}

	public ActionForward listavalores(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_listavalores(request, this);
		return mapping.findForward("ajaxp");
	}

}
