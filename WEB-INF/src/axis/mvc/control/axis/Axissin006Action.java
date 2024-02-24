//Revision:# eSIbUO22FFOpyjwseCFImg== #
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
import axis.service.axis.Axissin006Service;
import axis.util.Constantes;

public class Axissin006Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin006Service miServicio = new Axissin006Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action Init");
		BigDecimal RETORNO = miServicio.m_avisos(request, this);
		miServicio.m_init(request, this);

		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action Form");
		// BigDecimal RETORNO = miServicio.m_avisos(request,this);
		miServicio.m_form(request, this);
		/* Paginar */
		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}
		return mapping.findForward("form");
	}

	public ActionForward cargarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action cargarDatos");

		BigDecimal RETORNO = miServicio.m_avisos(request, this);

		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward inicializarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action inicializarDatos");

		BigDecimal RETORNO = miServicio.m_avisos(request, this);

		miServicio.m_inicializarDatos(request, this);

		/* Tratamiento pantalla axissin006 - subpantallas */

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		else
			request.setAttribute("subpantalla", "no_disponible");

		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward recargarRadios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action recargarRadios");
		// BigDecimal RETORNO = miServicio.m_avisos(request,this);
		miServicio.m_recargarRadios(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.form(mapping, form, request, response);
	}

	public ActionForward recargarPagos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action recargarPagos");
		// BigDecimal RETORNO = miServicio.m_avisos(request,this);
		miServicio.m_recargarPagos(request, this);
		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/

	public ActionForward consultarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action consultarPoliza");
		miServicio.m_consultarPoliza(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin006.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward volverAgente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action volverAgente");
		miServicio.m_volverAgente(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultarAgente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action consultarPoliza");
		miServicio.m_consultarAgente(request, this);
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE_SIN");
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisage003.do?operation=form&isEdit=true&CAGENTE_SIN=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin006.do?operation=volverAgente"));
		return mapping.findForward("saltar");
		///
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	public

			ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getProvinPobla(request);
		return mapping.findForward("ajax");
	}

	public ActionForward grabarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabar_citacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_grabarCitacion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward del_citacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_delCitacion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/

	/**************************************************
	 * M�TODOS AJAX
	 ********************************************/
	public

			ActionForward ajax_cargar_motivos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_cargar_motivos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_causa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action ajax_selected_causa");
		miServicio.m_ajax_selected_causa(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_eventos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_evento(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward del_destinatario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action del_destintario");
		miServicio.m_del_destinatario(request, this);
		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
	}

	public ActionForward del_danyo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action del_destintario");
		miServicio.m_del_danyo(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
	}

	public ActionForward del_localizacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action del_localizacion");
		miServicio.m_del_localizacion(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
	}

	public ActionForward del_prestacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action del_localizacion");
		miServicio.m_del_prestacion(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabarSinistre(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action grabarSinistre");
		miServicio.m_grabarSinistre(request, this);

		request.getSession().setAttribute("subpantalla_mdl", "tramitaciones");
		return this.form(mapping, form, request, response);
	}

	public ActionForward grabarPantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action grabarSinistre");
		miServicio.m_grabarPantalla(request, this);

		request.getSession().setAttribute("subpantalla_mdl", "tramitaciones");
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_agenda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action cargarDatos");
		miServicio.m_borrar_agenda(request, this);
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward borrar_personarel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action borrar_personarel");
		miServicio.m_borrar_personarel(request, this);
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward borrar_tramitacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action borrar_tramitacion");
		miServicio.m_borrar_tramitacion(request, this);
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward borrar_detallepago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action cargarDatos");
		miServicio.m_borrar_detallepago(request, this);
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
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

		log.debug("Axissin006Action consulta_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON_CON");
		logger.debug("+++++SPERSON: " + SPERSON);
		BigDecimal NSINIES = AxisBaseService.getCampoNumerico(request, "NSINIES_CON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");

		formdata.put("NSINIES_axissin006", NSINIES);
		formdata.put("CAGENTE_axissin006",
				AxisBaseService.bigDecimalToString(AxisBaseService.getCampoNumerico(request, "CAGENTE")));
		this.topPila(request, "formdata_axissin006", formdata);

		logger.debug("++++CMODO" + AbstractDispatchAction.topPila(request, "CMODO"));

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected="
						+ CAGENTE + "&CMODO=" + AbstractDispatchAction.topPila(request, "CMODO") + "&MODO="
						+ AbstractDispatchAction.topPila(request, "CMODO")));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin006.do?operation=volver_per"));

		AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO"));
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
	public ActionForward volver_per(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin006Action volver_per");
		Map formdata = new HashMap();

		try {
			Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin006");

			if (!AxisBaseService.isEmpty(formdata_axissin006)) {
				formdata.putAll(formdata_axissin006);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin006"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward generarPago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action generarPago");
		miServicio.m_generarPago(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward imprimirPago(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action imprimirPago");
		miServicio.m_imprimirPago(request, response);
		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));
		return this.form(mapping, form, request, response);
		// return mapping.findForward("form");
	}

	public ActionForward delReserva(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action delReserva");
		miServicio.m_delReserva(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward delAmparo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action delAmparo");
		miServicio.m_delAmparo(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward consulta_persona_dec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin006Action consulta_persona");

		BigDecimal SPERSON = miServicio.m_consulta_persona(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON=" + SPERSON));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin006.do?operation=volver_per"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver_per_dec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin006Action volver_per");
		miServicio.m_volver_per(request, this);
		return this.form(mapping, form, request, response);
	}

	// bug 0021662
	public ActionForward generar_resultados_maps(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axissin006Action generar_resultados_maps");
		miServicio.m_generar_resultados_maps(request);
		miServicio.m_cargarDatos(request, this);
		return mapping.findForward("form");

	}

	public ActionForward ajax_elimnarref(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action ajax_elimnarref");
		miServicio.m_ajax_elimnarref(request, this);
		return mapping.findForward("ajax");
	}

	// AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros VS
	// cartera (bug hermano interno)
	public ActionForward ajax_valida_compensacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin006Action ajax_valida_compensacion");
		miServicio.m_ajax_valida_compensacion(request);
		return mapping.findForward("ajax");
	}

	public ActionForward compensacion_pagos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axissin006Action compensacion_pagos");
		miServicio.m_compensacion_pagos(request, this);
		logger.debug("resultado:" + request.getAttribute("OK"));
		return this.form(mapping, form, request, response);
	}

	// AAC_FI
	public ActionForward cargarJudicial(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action cargarJudicial");
		miServicio.m_cargarJudicial(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarProceso(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action cargarJudicial");
		miServicio.m_borrarProceso(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_sin_trami_doc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action borrar_sin_trami_doc");

		miServicio.m_borrar_sin_trami_doc(request, this);
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward cargarFiscal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action cargarJudicial");
		miServicio.m_cargarFiscal(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarProcesoFiscal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin006Action borrarProcesoFiscal");
		miServicio.m_borrarProcesoFiscal(request, this);
		return this.form(mapping, form, request, response);
	}
}
