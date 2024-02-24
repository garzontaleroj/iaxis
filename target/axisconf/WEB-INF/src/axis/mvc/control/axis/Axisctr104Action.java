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

import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr104Service;

public class Axisctr104Action extends Axisctr020Action {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr104Service miServicio = new Axisctr104Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr104Action Init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr104Action Form");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr104Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr104Action aceptar");
		miServicio.m_aceptar(request);
		return this.form(mapping, form, request, response);
		// return mapping.findForward("form");
		// return mapping.findForward("ajax");
	}

	public ActionForward contratar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr104Action contratar");
		ActionForward saltar = miServicio.m_contratar(request, this);
		/*
		 * // return this.form(mapping, form, request, response); return
		 * this.navegar(request, this.form(mapping, form, request, response));
		 */
		if (saltar != null) {
			return saltar; // bug 9195 ACC 190209
		}
		return this.navegar(request, this.recargarThisForm(mapping));
		/*
		 * this.topPila(request, Constantes.SALTARDESTINOACTION, new
		 * ActionForward("/axis_axisctr001.do?operation=siguiente"));
		 * this.topPila(request, Constantes.SALTARORIGENACTION, new
		 * ActionForward("/axis_axisctr018.do?operation=volver") );
		 */
		// return mapping.findForward("saltar");

	}

	public ActionForward actualizar_provisiones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr104Action actualizar_provisiones");
		miServicio.m_actualizar_provisiones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward marcar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr104Action marcar");
		miServicio.m_marcar(request);

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_marcar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr104Action ajax_marcar");
		miServicio.m_ajax_marcar(request);
		return mapping.findForward("ajax");
	}
}
