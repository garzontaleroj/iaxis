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
import axis.service.axis.Axisagd001Service;
import axis.util.Constantes;

public class Axisagd001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisagd001Service miServicio = new Axisagd001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action Form");
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_poliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action ajax_busqueda_poliza");
		miServicio.m_ajax_busqueda_poliza(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action ajax_busqueda_siniestro");
		miServicio.m_ajax_busqueda_siniestro(request, this);// f_consulta_lstsini
		return mapping.findForward("ajax");
	}

	public ActionForward consultarPolissa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action consultarPolissa");
		miServicio.m_navegar(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axisctr020.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisagd001.do?operation=volver"));

		return mapping.findForward("saltar");
	}

	public ActionForward navegarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action navegarSiniestro");
		miServicio.m_navegar(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axissin006.do?operation=inicializarDatos&NSINIESselected="
						+ AxisBaseService.getCampoTextual(request, "NSINIES")));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisagd001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_busqueda_valores_grupo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd001Action ajax_busqueda_valoresgrupo");
		miServicio.m_ajax_busqueda_valoresgrupo(request, this);// f_consulta_lstsini
		return mapping.findForward("ajax");
	}

}
