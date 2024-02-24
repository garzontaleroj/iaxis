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
import axis.service.axis.Axisadm200Service;

public class Axisadm200Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm200Service miServicio = new Axisadm200Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm200Action init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm200Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward ajax_documentos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.ajax_documentos(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		return mapping.findForward("form");
	}

	public ActionForward buscarSolicitud(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm200Action buscarSolicitud");
		miServicio.m_buscar_servicio_details(request);
		logger.debug("Axisadm200Action returned...");
		return mapping.findForward("form");
	}

	public ActionForward reintentarEntrada(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm200Action buscarSolicitud");
		miServicio.m_reintentarEntrada(request);
		logger.debug("Axisadm200Action returned...");
		return mapping.findForward("form");
	}

	public ActionForward limpiar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm200Action limpiar");
		miServicio.m_limpiar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward reajustarParaCinterf(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm200Action reajustarParaCinterf");
		miServicio.m_reajustarParaCinterf(request, this);
		return this.form(mapping, form, request, response);
	}

}
