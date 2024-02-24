//Revision:# SwGAxFuBaFpIMwRB9Dwi+g== #
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
import axis.service.axis.Axissin032Service;
import axis.util.Constantes;

public class Axissin032Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axissin032Service miServicio = new Axissin032Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action Init");
		// BigDecimal RETORNO = miServicio.m_avisos(request,this);
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action Form");

		// si se ha lanzado un aviso LRE en la operacion aceptar_siniestro
		// es que no se ha realizado tal operacion y por tanto no hemos de volver
		// a controlar los avisos
		boolean avisoLreLanzado = request.getAttribute("avisolrelanzado") == null ? false
				: ((Boolean) request.getAttribute("avisolrelanzado")).booleanValue();
		if (!avisoLreLanzado) {
			BigDecimal RETORNO = miServicio.m_avisos(request, this);
		}
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action m_ajax_actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action buscar");
		BigDecimal RETORNO = miServicio.m_avisos(request, this);
		// miServicio.m_busqueda_siniestro(request,this);
		return mapping.findForward("form");
	}

	public ActionForward cambiar_fecha_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action cambiar_fecha_siniestro");
		miServicio.m_ajax_cambiar_fecha_siniestro(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_causa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_selected_causa");
		miServicio.m_ajax_selected_causa(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_existe_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_existe_persona");
		miServicio.m_ajax_existe_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_get_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_get_persona");
		miServicio.m_ajax_get_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward aceptar_siniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action aceptar_siniestro");

		// IMPORTANTE: los avisos de LRE necesitan el servlet param controlavisolre=1
		BigDecimal RETORNO = miServicio.m_avisos(request, this);

		if (RETORNO != null && RETORNO.intValue() != 1) {

			if (request.getParameterValues("paginar") != null) {
				return this.form(mapping, form, request, response);
			}

			miServicio.m_aceptar_siniestro(request, this);
			/*
			 * BigDecimal SSEGURO = null; if (request.getParameter("SSEGURO")!=null){
			 * SSEGURO = new BigDecimal(request.getParameter("SSEGURO")); }
			 * logger.debug("++++SSEGURO"+SSEGURO);
			 * 
			 * HashMap formdata=(HashMap)request.getAttribute(Constantes.FORMDATA); String
			 * NSINIES = null; if (request.getParameter("NSINIES")!=null){ NSINIES =
			 * request.getParameter("NSINIES"); } if (NSINIES==null ||
			 * NSINIES.trim().length() == 0){ NSINIES = (String)formdata.get("NSINIES"); }
			 * logger.debug("++++NSINIES"+NSINIES); String NSINIESselected=NSINIES;
			 * 
			 * this.topPila(request, "SSEGURO", SSEGURO); this.topPila(request, "NSINIES",
			 * NSINIES); this.topPila(request, "NSINIESselected", NSINIESselected);
			 * BigDecimal SIN_ALTA_GESTION = new BigDecimal(0); try {
			 * SIN_ALTA_GESTION=miServicio.getSIN_ALTA_GESTION(request);
			 * 
			 * if (NSINIES!= null && NSINIES.trim().length() > 0 &&
			 * SIN_ALTA_GESTION.equals(new BigDecimal(1))){
			 * logger.debug("++++NSINIES.trim().length()"+NSINIES.trim().length());
			 * 
			 * AbstractDispatchAction.topPila(request,"CMODO","MODIF_SINIESTROS");
			 * 
			 * this.topPila(request, Constantes.SALTARDESTINOACTION, new
			 * ActionForward("/axis_axissin006.do?operation=inicializarDatos&" +
			 * "NSINIESselected="+AxisBaseService.getCampoTextual(request,"NSINIES")+
			 * "&CMODO=MODIF_SINIESTROS"));
			 * 
			 * request.setAttribute(Constantes.PASSTOPPILA, this.topPila(request));
			 * 
			 * return mapping.findForward("saltar"); }else{ return
			 * this.form(mapping,form,request,response); } }catch(Exception e){ throw new
			 * Exception (e.getMessage()); }
			 */
		} else {
			// si hay un aviso de LRE, o de cualquier otro tipo, no se habr� realizado
			// la operacion, informamos que se ha lanzado aviso para evitar que el metodo
			// form vuelva a lanzar otra vez los mismos avisos
			request.setAttribute("avisolrelanzado", Boolean.TRUE);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar_pantalla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action aceptar_siniestro");
		miServicio.m_aceptar_pantalla(request, this);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/
	/*********************************************************************************************************************/

	public ActionForward consultarSiniestros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action consultarSiniestros");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarSiniestros"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin032.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward consultarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action consultarPoliza");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin032.do?operation=volver"));
		return mapping.findForward("saltar");

	}

	public ActionForward consulta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin032Action consulta_persona");

		BigDecimal SPERSON = miServicio.m_consulta_persona(request, this);
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE_SESSION");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		formdata.put("CAGENTE_axissin032",
				AxisBaseService.bigDecimalToString(AxisBaseService.getCampoNumerico(request, "CAGENTE")));
		this.topPila(request, "formdata_axissin032", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin032.do?operation=volver_per"));

		AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");

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
		AbstractDispatchAction.topPila(request, "CMODO", "ALTA_SINIESTROS");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin032Action volver_per");
		miServicio.m_volver_per(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward alta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin032Action consulta_persona");

		miServicio.m_consulta_persona(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&ALTA_PERSONA_INI=1"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin032.do?operation=volver_per"));

		return mapping.findForward("saltar");
	}

	public ActionForward consultarPolizaSiniestros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action consultarPoliza");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_consultarSiniestros(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axissin006.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action volver");
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_hayInnominados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axissin032Action ajax_hayInnominados");
		miServicio.m_ajax_hayInnominados(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward tipoGarantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr001Action tipoGarantia");
		// BigDecimal RETORNO = miServicio.m_avisos(request,this);
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_tipoGarantia(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualiza_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cambia_tramitador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_cambia_tramitador");
		miServicio.m_ajax_cambia_tramitador(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_elimnarref(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_elimnarref");
		miServicio.m_ajax_elimnarref(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_asistencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_asistencia");
		miServicio.m_ajax_asistencia(request);
		return mapping.findForward("ajax");
	}

	public ActionForward cal_coste(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// bug 0022674
		log.info("Axissin032Action cal_coste");
		miServicio.m_ajax_cal_coste(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consulta_persona_b(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin032Action consulta_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON_CON");
		BigDecimal NSINIES = AxisBaseService.getCampoNumerico(request, "NSINIES_CON");

		formdata.put("NSINIES_axissin032", NSINIES);
		this.topPila(request, "formdata_axissin032", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON=" + SPERSON));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axissin032.do?operation=volver_per"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver_per_b(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axissin032Action volver_per");
		Map formdata = new HashMap();

		try {
			Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin032");

			if (!AxisBaseService.isEmpty(formdata_axissin006)) {
				formdata.putAll(formdata_axissin006);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin032"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisadm047Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_valida_aseg_in(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin032Action ajax_valida_aseg_in");
		miServicio.m_ajax_valida_aseg_in(request);
		return mapping.findForward("ajax");
	}

}