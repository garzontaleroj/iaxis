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
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axissin061Service;
import axis.util.Constantes;

public class Axissin061Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin061Service miServicio = new Axissin061Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin061Action init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin061Action form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin061Action buscar");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin061Action buscar");
		miServicio.m_actualizar_pago(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward traspasar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin061Action traspasar");
		miServicio.m_traspasar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin061Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_productos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_concepto_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin061Action ajax_concepto_pago");
		miServicio.m_ajax_concepto_pago(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_pago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin0Action ajax_pago");
		miServicio.m_ajax_pago(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consultarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin061Action consultarSiniestro");
		miServicio.m_consultarSiniestro(request, this);
		// this.topPila(request, Constantes.SALTARDESTINOACTION,
		// mapping.findForward("consultarSiniestro"));
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axissin006.do?operation=inicializarDatos&NSINIESselected="
						+ AxisBaseService.getCampoTextual(request, "NSINIES")));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin061.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin061Action volver");
		miServicio.m_volver(request, this);
		return this.buscar(mapping, form, request, response);
	}
}
