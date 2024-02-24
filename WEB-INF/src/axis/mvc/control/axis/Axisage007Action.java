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
import axis.service.axis.Axisage007Service;
import axis.util.Constantes;

/**
 * Axisage007Action.java 29/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage007Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage007Service miServicio = new Axisage007Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage007Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage007Action Form");
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
		logger.debug("Axisage007Action Aceptar");
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
	public ActionForward consulta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axisage007Action consulta_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE_PERSONA");

		formdata.put("CAGENTE_axisage007", AxisBaseService.getCampoNumerico(request, "CAGENTE"));
		this.topPila(request, "formdata_axisage007", formdata);

		// Llamamos a AXISPER009. Le pasamos el SPERSON de la persona, que lo tenemos en
		// un hidden vinculado a formdata.AGENTE.SPERSON
		// Tambi�n le tenemos que pasar el CAGENTE de la persona, para que pueda
		// seleccionarse en AXISPER009
		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisage007.do?operation=volver"));

		AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA_PERSONA");

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

		log.debug("Axisage007Action volver");
		Map formdata = new HashMap();

		try {
			Map formdata_axisage007 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisage007");

			if (!AxisBaseService.isEmpty(formdata_axisage007)) {
				formdata.putAll(formdata_axisage007);
				formdata.put("CAGENTE", formdata.get("CAGENTE_axisage007"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage007Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_agenda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage007Action borrar_agenda");
		miServicio.m_borrar_agenda(request, this);

		if (!AxisBaseService.isEmpty(request.getParameter("subseccion")))
			request.setAttribute("subseccion", request.getParameter("subseccion"));

		return this.form(mapping, form, request, response);
	}

}
