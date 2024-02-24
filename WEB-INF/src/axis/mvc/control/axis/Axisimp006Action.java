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
import axis.service.axis.Axisimp006Service;

public class Axisimp006Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisimp006Service miServicio = new Axisimp006Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisimp006Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisimp006Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward busqueda_impuestos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisimp006Action: busqueda_impuestos");
		miServicio.m_busqueda_impuestos(request, this);

		return mapping.findForward("form");
	}

	public ActionForward del_impuesto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisimp006Action del_impuesto");
		miServicio.m_del_impuesto(request, this);

		return this.form(mapping, form, request, response);
	}
}
