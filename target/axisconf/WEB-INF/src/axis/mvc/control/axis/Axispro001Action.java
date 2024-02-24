package axis.mvc.control.axis;

import java.io.IOException;
import java.util.HashMap;

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
import axis.service.axis.Axispro001Service;
import axis.util.Constantes;

public class Axispro001Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axispro001Service miServicio = new Axispro001Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Es llamado cuando se selecciona un producto des del modal buscador. Se
	 * encarga de eliminar los atributos de Session del anterior producto. Luego
	 * ejecuta el m�todo Form.
	 * 
	 * @since Java 5.0
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@SuppressWarnings("unchecked")
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro001Action Init");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro001Action Form");
		miServicio.m_form(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		else
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		request.getSession().removeAttribute("subpantalla_mdl");

		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * AXISPRO001_DATOSUNITLINKED
	 */
	public

			ActionForward datosunitlinked(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		String metodo = AxisBaseService.getCampoTextual(request, "metodo");
		logger.debug("Axispro001Action datosunitlinked. M�todo: " + metodo);

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		if ("RecargarMODINVFONDO".equals(metodo))
			miServicio.datosUnitLinked_RecargarMODINVFONDO(request);

		request.setAttribute("subpantalla", AxisBaseService.getCampoTextual(request, "operation"));
		return mapping.findForward("ajax");
	}

	/**
	 * AXISPRO001_DATOSTECNICOS
	 */
	public

			ActionForward datostecnicos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		String metodo = AxisBaseService.getCampoTextual(request, "metodo");
		logger.debug("Axispro001Action datostecnicos. M�todo: " + metodo);

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		if ("RecargarVigencias".equals(metodo)) {
			miServicio.datosTecnicos_RecargarVigencias(request);
		} else if ("RecargarTramos".equals(metodo)) {
			miServicio.datosTecnicos_RecargarTramos(request);
		}
		request.setAttribute("subpantalla", AxisBaseService.getCampoTextual(request, "operation"));
		return mapping.findForward("ajax");
	}

	/**
	 * AXISPRO001 DATOS ACTIVIDADES
	 */
	public

			ActionForward cargar_actividades(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro001Action cargar_actividades");
		miServicio.m_cargar_actividades(request, this);

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		return mapping.findForward("actividad");
	}

	/**
	 * AXISPRO001 DATOS GENERALES
	 */
	public

			ActionForward cargar_datos_generales(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axispro001Action cargar_actividades");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_cargar_datos_generales(request, this);
		miServicio.m_form(request, this);
		// return mapping.findForward("form");
		return new ActionForward("/axis_axispro001.do?operation=form&subpantalla=datosgenerales");
	}

	/**
	 * AXISPRO01 ACCEDER A GFI
	 */
	public ActionForward buscar_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action buscar_formula");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_buscar_formula(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisgfi002.do?operation=buscar_formula"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axispro001.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward consultarParametros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action consultarParametros");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_consultarParametros(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "parametros");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarParametros"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axispro001.do?operation=volverParam"));
		return mapping.findForward("saltar");
	}

	/**
	 * M�todo que llama a la pantalla axispro031 y que edita la rama principal de
	 * actividades.
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward editar_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action editar_actividad");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_editar_actividad(request, this);
		return mapping.findForward("saltar");
	}

	public ActionForward consultarParametrosActivi(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action consultarParametrosActivi");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_consultarParametros(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "actividades");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarParametrosActivi"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axispro001.do?operation=volverParam"));

		return mapping.findForward("saltar");
	}

	/**
	 * TODO PENDIENTE DE REALIZAR AN�LISIS M�todo que edita las preguntas de las
	 * actividades
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	/*
	 * public ActionForward consultarPreguntasActivi(ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse response)
	 * throws IOException, ServletException {
	 * log.info("Axispro001Action consultarPreguntasActivi");
	 * miServicio.m_consultarPreguntas(request, this);
	 * request.getSession().setAttribute("subpantalla_mdl", "actividades");
	 * this.topPila(request, Constantes.SALTARDESTINOACTION,
	 * mapping.findForward("consultarPreguntasActivi")); this.topPila(request,
	 * Constantes.SALTARORIGENACTION, new
	 * ActionForward("/axis_axispro001.do?operation=volverParam"));
	 * 
	 * return mapping.findForward("saltar"); }
	 */

	/**
	 * M�todo que edita los recargos de las actividades
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward consultarRecargoActivi(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action consultarRecargoActivi");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_consultarRecargo(request, this);
		return mapping.findForward("saltar");
	}

	public ActionForward volverActividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volverActividad");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_volverActividad(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volverParam(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volver");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_volverParam(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volverRecargo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volverRecargo");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_volverRecargo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volver");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_volver(request, this);
		// return this.form(mapping, form, request, response);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPRODUC = AxisBaseService.getCampoTextual(request, "SPRODUC_FORMULA");
		return new ActionForward("/axis_axispro001.do?operation=form&SPRODUC=" + SPRODUC);
	}

	public ActionForward garantias_lista(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action garantias_lista");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_garantias_lista(request, this);
		// return mapping.findForward("garantias_lista");
		return this.form(mapping, form, request, response);
	}

	public ActionForward delete_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action delete_garantia");

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_delete_garantia(request, this);
		// return this.form(mapping, form, request, response);
		return this.form(mapping, form, request, response);
	}

}
