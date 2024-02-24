//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;

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
import axis.service.axis.Axisctr018Service;
import axis.util.Constantes;

public class Axisctr018Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisctr018Action.class);
	private Axisctr018Service miServicio = new Axisctr018Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward renovar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action Form");
		miServicio.m_renovar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action anular");
		miServicio.m_anular(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward permitir_anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action anular");
		miServicio.m_permitir_anular(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward inspeccionRiesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action inspeccionRiesgo");
		miServicio.m_inspeccionRiesgo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action consultar");
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr018.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward ajax_cargar_motivos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr18Action ajax_cargar_motivos");
		miServicio.m_ajax_cargar_motivos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_observacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr18Action ajax_cargar_observacion");
		miServicio.m_ajax_cargar_observacion(request);

		return mapping.findForward("ajax");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action editar");
		miServicio.m_editar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("editar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr018.do?operation=volver"));

		// Bug 27048/157319 - 04/11/2013 - AMC
		request.setAttribute("RETORNO_INICIALIZADO", new BigDecimal("1"));
		// Fi Bug 27048/157319 - 04/11/2013 - AMC

		return mapping.findForward("saltar");
	}

	public ActionForward emitir_propuesta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action editar");
		miServicio.m_emitir_propuesta(request, this);
		return mapping.findForward("ajax");
		// return this.form(mapping, form, request, response);
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward marcar_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action marcar_json");
		miServicio.m_marcar_json(request);
		return mapping.findForward("json");
	}

	public ActionForward emitir_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action marcar_json");
		miServicio.m_emitir_json(request);
		return mapping.findForward("json");
	}

	public ActionForward compruebainspeccion_json(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action compruebainspeccion_json");
		miServicio.m_compruebainspeccion_json(request);
		return mapping.findForward("json");
	}

	/*
	 * public ActionForward modificar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { logger.debug("Axisctr018Action modificar");
	 * 
	 * if (request.getParameter("paginar") != null) return this.form(mapping, form,
	 * request, response);
	 * 
	 * String saltarA = miServicio.m_modificar(request);
	 * 
	 * this.topPila(request, "dtPolizasOffset",
	 * request.getParameter("dtPolizasOffset"));
	 * 
	 * if (!AxisBaseService.isEmpty(saltarA)) { this.topPila(request,
	 * Constantes.SALTARDESTINOACTION, new ActionForward("/axis_" +
	 * saltarA.toLowerCase() + ".do?operation=form")); this.topPila(request,
	 * Constantes.SALTARORIGENACTION, new
	 * ActionForward("/axis_axisctr018.do?operation=volver"));
	 * 
	 * // Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los
	 * flujos de destino request.setAttribute(Constantes.PASSTOPPILA,
	 * this.topPila(request));
	 * 
	 * return mapping.findForward("saltar"); }
	 * 
	 * return this.form(mapping, form, request, response);
	 * 
	 * }
	 */

	public ActionForward modificar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action modificar");

		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		String saltarA = miServicio.m_modificar(request);

		this.topPila(request, "dtPolizasOffset", request.getParameter("dtPolizasOffset"));

		if (!AxisBaseService.isEmpty(saltarA)) {
			this.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_" + saltarA.toLowerCase() + ".do?operation=form"));
			this.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr018.do?operation=volver"));

			// Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los flujos
			// de destino
			request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

			return mapping.findForward("saltar");
		}

		return this.form(mapping, form, request, response);

	}

	public ActionForward preguntaProgagaSupl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action preguntaProgagaSupl");
		miServicio.m_preguntaProgagaSupl_json(request);
		return mapping.findForward("json");
	}

	public ActionForward validaDupSeguro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action validaDupSeguro");
		miServicio.m_validaDupSeguro_json(request);
		return mapping.findForward("json");
	}

	public ActionForward editarsupl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr018Action editar");
		miServicio.m_editarsupl(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("editar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr018.do?operation=volver"));

		// Bug 27048/157319 - 04/11/2013 - AMC
		request.setAttribute("RETORNO_INICIALIZADO", new BigDecimal("1"));
		// Fi Bug 27048/157319 - 04/11/2013 - AMC

		return mapping.findForward("saltar");
	}

}
