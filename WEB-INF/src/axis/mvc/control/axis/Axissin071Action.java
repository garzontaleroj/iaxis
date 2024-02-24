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
import axis.service.axis.Axissin071Service;

public class Axissin071Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin071Service miServicio = new Axissin071Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action buscar");
		miServicio.m_buscar(request, this);
		return mapping.findForward("buscar");
	}

	public ActionForward ejecutar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action ejecutar");
		miServicio.m_ejecutar(request, this);
		return mapping.findForward("ejecutar");
	}

	public ActionForward cargarFactura(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action anular");
		miServicio.m_cargar_factura(request, this);
		return mapping.findForward("anular");
	}

	public ActionForward anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin071Action anular");
		miServicio.m_anular(request);
		return mapping.findForward("anular");
	}

	public ActionForward descargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin071Action descargar");
		miServicio.m_descargar(request, this);
		return mapping.findForward("json");

	}

}