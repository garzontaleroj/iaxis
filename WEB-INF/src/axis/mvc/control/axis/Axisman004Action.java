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
import axis.service.axis.Axisman004Service;

public class Axisman004Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisman004Service miServicio = new Axisman004Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisman004Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisman004Action Form");

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward m_aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		miServicio.aceptar(request, this);

		return mapping.findForward("form");
	}

	public ActionForward m_buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		miServicio.buscar(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_cargar_acciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscaj004Action ajax_ins_mov_caja");
		miServicio.m_ajax_cargar_acciones(request);
		return mapping.findForward("ajax");
	}

}
