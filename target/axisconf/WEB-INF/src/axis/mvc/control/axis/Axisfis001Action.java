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
import axis.service.axis.Axisfis001Service;

public class Axisfis001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisfis001Service miServicio = new Axisfis001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis001Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisfis001Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cargar_modelo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisfis001Action cargar_modelo");
		miServicio.m_cargar_modelo(request);
		return mapping.findForward("form");
	}

	public ActionForward seleccionar_modelo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisfis001Action seleccionar_modelo");
		miServicio.m_seleccionar_modelo(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_generar_resultados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisfis001Action ajax_generar_resultados");
		miServicio.m_ajax_generar_resultados(request);
		return mapping.findForward("ajax");
	}

	public ActionForward tunnel_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_tunnel_doc(request, response);
		return mapping.findForward("error");
	}

}
