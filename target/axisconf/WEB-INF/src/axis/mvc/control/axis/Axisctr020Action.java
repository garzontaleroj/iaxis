//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

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
import axis.service.axis.Axisctr020Service;
import axis.util.Constantes;

public class Axisctr020Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr020Service miServicio = new Axisctr020Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action Form");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cobrar_recibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action cobrar_recibo");
		miServicio.m_cobrar_recibo(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward inicializar_suplemento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action inicializar_suplemento");
		miServicio.m_inicializar_suplemento(request, this);
		return mapping.findForward("ajax");

	}
// bug  22839 ini

	public ActionForward permitesuplem(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action permitesuplem");
		// miServicio.m_emitirPropuesta(request, this);
		// return this.form(mapping, form, request, response);
		miServicio.m_ajax_permitesuplem(request);
		return mapping.findForward("ajax");
	}

// bug 22839 fin
	public ActionForward editar_suplemento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action editar_suplemento");

		ActionForward saltarForward = miServicio.m_editar_suplemento(request, this);
		if (saltarForward != null) {
			// Se nos permite editar suplemento, y saltar a un nuevo flujo
			this.topPila(request, Constantes.SALTARDESTINOACTION, saltarForward);
			this.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr020.do?operation=volver"));
			return mapping.findForward("saltar");
		} else
			// No se permite a�adir suplementos; recargar form
			return this.form(mapping, form, request, response);

	}

	public ActionForward emitirPropuesta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action emitirPropuesta");
		// miServicio.m_emitirPropuesta(request, this);
		// return this.form(mapping, form, request, response);
		miServicio.m_emitirPropuesta(request);
		return mapping.findForward("ajax");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr020Action aceptar");
		miServicio.m_aceptar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward limpiar_suplemento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr020Action limpiar_suplemento");
		miServicio.m_limpiar_suplemento(request, this);
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward consultarDetRecibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action consultarDetRecibos");
		miServicio.m_consultarDetRecibos(request, this);
		request.getSession().setAttribute("subpantalla_mdl", "DSP_RECIBOS");
		request.getSession().setAttribute("saltarRebuts", "0");
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarDetRecibos"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr020.do?operation=volverDetRec"));
		return mapping.findForward("saltar");
	}

	public ActionForward volverDetRec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action volver");
		miServicio.m_volverDetRec(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambioestdiferir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action cambioestdiferir");
		miServicio.m_cambioestdiferir(request, this);
		return this.form(mapping, form, request, response);
	}

	/***************************************************************/
	/********************** FLUJO GESTI�N COBROS *********************/

	/***************************************************************/
	// TODO De momento no se utiliza. Se carga desde el modal axisadm028
	public ActionForward gestion_cobros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro020Action gestion_cobros");
		miServicio.m_gestion_cobros(request, this);
		return mapping.findForward("saltar");
	}

	// Pantalla directa a cobro host. Ssutituye al m�todo anterior
	public ActionForward cobro_host(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro020Action cobro_host");
		miServicio.m_cobro_host(request, this);
		return mapping.findForward("saltar");
	}

	public ActionForward deletemov(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro020Action deletemov");
		miServicio.m_deletemov(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volverGestionCobros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action volverGestionCobros");
		miServicio.m_volverGestionCobros(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actualizar_provisiones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr020Action actualizar_provisiones");
		miServicio.m_actualizar_provisiones(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualiza_evoluprov(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr020Action actualiza_evoluprov");
		miServicio.m_actualiza_evoluprov(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consultarCuadros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action consultarCuadros");
		miServicio.m_consultarCuadros(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action consultarSiniestro");
		miServicio.m_consultarSiniestro(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axissin006.do?operation=inicializarDatos&CMODO=CONSULTA&PRUEBA=1"));// IAXIS-5289
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr020.do?operation=volverSinies"));
		return mapping.findForward("saltar");
	}

	public ActionForward volverSinies(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action volverSinies");
		miServicio.m_volverSinies(request, this);
		return this.form(mapping, form, request, response);
	}
	// bug 22839 ini

	public ActionForward consultarBajacertif(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action consultarBajacertif");
		miServicio.m_consultarBajacertif(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr016.do?operation=form&formorigen=axisctr020"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr020.do?operation=volverBajacertif"));
		return mapping.findForward("saltar");
	}

	public ActionForward volverBajacertif(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action volverBajacertif");
		miServicio.m_volverBajacertif(request, this);
		return this.form(mapping, form, request, response);
	}

	// bug 22839 fin
	public ActionForward ajax_obtener_impagados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr020Action obtener_impagados");
		miServicio.m_ajax_cargar_impagados(request);
		return mapping.findForward("ajax");
	}

	public ActionForward comisions(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action comisions");
		BigDecimal SSEGURO = AxisBaseService.getCampoNumerico(request, "SSEGURO");
		this.topPila(request, "SSEGURO", SSEGURO);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisctr172.do?operation=form&find=false"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr020.do?operation=form"));
		return mapping.findForward("saltar");
	}

	public ActionForward actualizarestadosolicitud(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr020Action actualizarestadosolicitud");
		miServicio.m_actualizarestadosolicitud(request);
		return mapping.findForward("ajax");
	}

	public ActionForward imprimir_detalle_primas_json(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr207Action imprimir_detalle_primas_json ");
		miServicio.m_imprimir_detalle_primas_json(request);
		return mapping.findForward("json");
	}

	public ActionForward emitirPropuestaColectiva(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action emitirPropuestaColectiva");
		miServicio.m_emitirPropuestaColectiva(request);
		return mapping.findForward("ajax");
	}

	public ActionForward abrirSuplemColectivo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action abrirSuplemColectivo");
		miServicio.m_abrirSuplemColectivo(request);
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
	public ActionForward consulta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr020 consulta_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON_CON");
		BigDecimal SSEGURO = AxisBaseService.getCampoNumerico(request, "SSEGURO_CON");

		formdata.put("SSEGURO_axisctr020", SSEGURO);
		this.topPila(request, "CMODO", "CONSULTA");
		this.topPila(request, "formdata_axisctr020", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&MODO=CONSULTA&DONDE=AXISCTR020"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr020.do?operation=volver_per"));
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
	public ActionForward volver_per(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr020Action volver_per");
		Map formdata = new HashMap();

		try {
			Map formdata_axisctr020 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr020");

			if (!AxisBaseService.isEmpty(formdata_axisctr020)) {
				formdata.putAll(formdata_axisctr020);
				formdata.put("SSEGURO", formdata.get("SSEGURO_axisctr020"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_valdocrequerida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action valdocrequerida");
		miServicio.m_ajax_valdocrequerida(request);
		return mapping.findForward("ajax");
	}

	public ActionForward preguntaProgagaSupl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr024Action preguntaProgagaSupl");
		miServicio.m_preguntaProgagaSupl_json(request);
		return mapping.findForward("json");
	}

// bug  26373 ini
	public ActionForward ajax_update_datos_contacto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr020Action AJAX update datos contacto");
		miServicio.m_ajax_update_datos_contacto(request);
		return mapping.findForward("ajax");
	}
// bug 26373 fin

//INICIO CONF-172
	public ActionForward guardar_supl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		log.info("Axisctr020Action aceptar");
		miServicio.m_guardar_supl(request);
		return mapping.findForward("ajax");
	}
//FIN CONF-172	
}
