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
import axis.service.axis.Axisctr102Service;
import axis.util.Constantes;

public class Axisctr102Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr102Service miServicio = new Axisctr102Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Init");
		miServicio.m_init(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar_simulacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Buscar Simulaci�n");
		ActionForward siguiente = miServicio.m_buscar_simulacion(request, this);
		if (!AxisBaseService.isEmpty(siguiente)) {

			this.topPila(request, Constantes.SALTARDESTINOACTION, siguiente);
			this.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr102.do?operation=volver"));
			return mapping.findForward("saltar");
		} else {
			return this.form(mapping, form, request, response);
		}
		/*
		 * miServicio.m_buscar_simulacion(request, this); return
		 * mapping.findForward("detalle");
		 */
	}

	public ActionForward ajax_busqueda_simulaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Busqueda Simulaciones");
		miServicio.m_ajax_busqueda_simulaciones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward busqueda_simulaciones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Busqueda Simulaciones");
		miServicio.m_cargaSimulaciones(request, this);
		return mapping.findForward("form");
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action Nuevo");
		ActionForward siguiente = miServicio.m_nuevo(request, this);
		if (siguiente != null) {
			this.topPila(request, Constantes.SALTARDESTINOACTION, siguiente);
			this.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr102.do?operation=volver"));
			return mapping.findForward("saltar");
		} else {
			return mapping.findForward("form");
		}
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * ********************************* TRATAMIENTO AGENTE LCF *
	 * *****************************
	 */
	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_productos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}
}