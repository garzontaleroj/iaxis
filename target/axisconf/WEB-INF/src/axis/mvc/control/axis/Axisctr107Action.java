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
import axis.service.axis.Axisctr107Service;
import axis.util.Constantes;

/**
 * Axisctr107Action.java 29/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr107Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr107Service miServicio = new Axisctr107Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr107Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr107Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr107Action Aceptar");
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * SALTOS DE FLUJO
	 **************************************************/
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
	public ActionForward consulta_aseguradora(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr107Action consulta_aseguradora");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE_PERSONA");

		formdata.put("CAGENTE_axisctr107", AxisBaseService.getCampoNumerico(request, "CAGENTE"));
		this.topPila(request, "formdata_axisctr107", formdata);

		// Llamamos a AXISPER009. Le pasamos el SPERSON de la persona, que lo tenemos en
		// un hidden vinculado a formdata.AGENTE.SPERSON
		// Tambi�n le tenemos que pasar el CAGENTE de la persona, para que pueda
		// seleccionarse en AXISPER009
		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr107.do?operation=volver"));

		AbstractDispatchAction.topPila(request, "CMODO", "consulta_aseguradora");

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
	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisctr107Action volver");
		Map formdata = new HashMap();

		try {
			Map formdata_axisctr107 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr107");

			if (!AxisBaseService.isEmpty(formdata_axisctr107)) {
				formdata.putAll(formdata_axisctr107);
				formdata.put("CAGENTE", formdata.get("CAGENTE_axisctr107"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr107Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr107Action grabar");
		if (!AxisBaseService.isEmpty(request.getSession().getAttribute("subpantalla_mdl")))
			request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_mdl"));

		miServicio.m_grabar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_depo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr107Action ajax_depo");
		miServicio.m_ajax_depo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_aseg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr107Action ajax_aseg");
		miServicio.m_ajax_aseg(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_pers(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr107Action ajax_pers");
		miServicio.m_ajax_pers(request);
		return mapping.findForward("ajax");
	}

	public ActionForward bborrar_depo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr107Action Form");
		miServicio.m_bborrar_depo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrar_aseg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr107Action Form");
		miServicio.m_borrar_aseg(request, this);
		return mapping.findForward("form");
	}

}
