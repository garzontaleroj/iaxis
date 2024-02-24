
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
import axis.service.axis.Axislist007Service;

public class Axislist007Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axislist007Service miServicio = new Axislist007Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist007Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axislist007Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_lineas(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axislist007Action ajax_busqueda_lineas");
		miServicio.m_ajax_busqueda_lineas(request);

		return mapping.findForward("ajax");
	}

	/*
	 * public ActionForward ajax_generar_resultados_map (ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse response)
	 * throws IOException, ServletException {
	 * log.debug("Axisctr098Action ajax_generar_resultados_map");
	 * miServicio.m_ajax_generar_resultados_map (request); return
	 * mapping.findForward ("ajax"); }
	 */

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axislist007Action buscar");
		miServicio.m_buscar(request, this);
		return mapping.findForward("form");
	}

}
