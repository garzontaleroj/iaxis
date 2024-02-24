//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.axis.Axisctr034Service;
import axis.service.modal.Axisctr033Service;
import axis.util.Constantes;

/**
 * Axisctr034Action.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr034Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr034Service miServicio = new Axisctr034Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action Init");
		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action Form");
		miServicio.m_form(request);

		if (request.getParameter("paginar") == null) {
			String dtPolizasOffset = (String) this.topPila(request, "dtPolizasOffset");

			if (AxisBaseService.isEmpty(dtPolizasOffset))
				dtPolizasOffset = request.getParameter("dtPolizasOffset");

			if (!AxisBaseService.isEmpty(dtPolizasOffset))
				request.setAttribute("dtPolizasOffset", dtPolizasOffset);

		}

		return mapping.findForward("form");
	}

	public ActionForward cuadro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr034Action cuadro");
		miServicio.m_cuadro(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward autorizarTodo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action autorizarTodo");

		if (request.getParameter("paginar") == null) {
			new Axisctr033Service().m_buscar(request);
		}
		miServicio.m_autorizarTodo(request);

		return this.form(mapping, form, request, response);
	}

	public ActionForward autorizarTodoMenosInspeccion(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action m_autorizarTodoMenosInspeccion");

		if (request.getParameter("paginar") == null) {
			new Axisctr033Service().m_buscar(request);
		}
		miServicio.m_autorizarTodoMenosInspeccion(request);

		return this.form(mapping, form, request, response);
	}

	public ActionForward rechazarTodo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action rechazarTodo");

		if (request.getParameter("paginar") == null) {
			new Axisctr033Service().m_buscar(request);
		}
		miServicio.m_rechazarTodo(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward inspeccionRiesgo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action inspeccionRiesgo");
		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		String saltarA = miServicio.m_inspeccionRiesgo(request);

		this.topPila(request, "dtPolizasOffset", request.getParameter("dtPolizasOffset"));

		if (!AxisBaseService.isEmpty(saltarA)) {
			this.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_" + saltarA.toLowerCase() + ".do?operation=form"));
			this.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr034.do?operation=recargar"));

			// Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los flujos
			// de destino
			request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

			return mapping.findForward("saltar");
		}

		return this.form(mapping, form, request, response);

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action recargar");

		// Mensajes de OK devueltos des del modal
		if (request.getSession().getAttribute("PRETEN_MENSAJES") != null) {
			AbstractDispatchAction.guardarMensaje(request,
					String.valueOf(request.getSession().getAttribute("PRETEN_MENSAJES")), null,
					Constantes.MENSAJE_INFO);
			request.getSession().removeAttribute("PRETEN_MENSAJES");
		}

		if (request.getParameter("paginar") == null) {
			new Axisctr033Service().m_buscar(request);
		}
		AbstractDispatchAction.removeTopPila(request, "NRIESGO_034");
		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward cargarMotivos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action cargarMotivos");

		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_cargarMotivos(request);

		return mapping.findForward("ajax");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action salir");

		if (request.getParameter("paginar") == null)
			miServicio.borrarAtributosSession(request);

		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/*****************************************************
	 * SALTOS DE FLUJO
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action consultar");

		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_consultar(request);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr020.do?operation=form&CMODO=CONSULTA_SINIESTROS"));// IAXIS-5125
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr034.do?operation=form"));
		this.topPila(request, "dtPolizasOffset", request.getParameter("dtPolizasOffset"));

		// Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los flujos
		// de destino
		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

		return mapping.findForward("saltar");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
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
					new ActionForward("/axis_axisctr034.do?operation=recargar"));

			// Meter la pila actual en PASSTOPPILA, para que la puedan utilizar los flujos
			// de destino
			request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));

			return mapping.findForward("saltar");
		}

		return this.form(mapping, form, request, response);

	}

	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		this.topPila(request, "dtPolizasOffset", request.getParameter("dtPolizasOffset"));

		log.info("Axisctr034Action editar");
		miServicio.m_editar(request, this);
		// this.topPila(request, Constantes.SALTARDESTINOACTION,
		// mapping.findForward("editar"));
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr001.do?operation=siguiente"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr034.do?operation=recargar"));

		request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));
		return mapping.findForward("saltar");

	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward ajax_guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action ajax_guardar");
		miServicio.m_ajax_guardar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_valdocrequerida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr034Action valdocrequerida");
		miServicio.m_ajax_valdocrequerida(request);
		return mapping.findForward("ajax");
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward ajax_haycontrolesmanuales(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr034Action ajax_haycontrolesmanuales");
		miServicio.m_ajax_haycontrolesmanuales(request);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		new Axisctr033Service().m_buscar(request);

		return this.form(mapping, form, request, response);
	}

	public ActionForward autorizarEmitir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisctr034Action autorizarEmitir");
		miServicio.m_autorizarEmitir(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward psucontrolseg_ajax(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr18Action ajax_cargar_motivos");
		miServicio.m_psucontrolseg_ajax(request);
		return mapping.findForward("ajax");
	}

}
