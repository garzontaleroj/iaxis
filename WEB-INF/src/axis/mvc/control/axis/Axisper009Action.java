//Revision:# 1ylR5gQgIDXpViC1m0MIBA== #
package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
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
import axis.service.axis.Axisper009Service;
import axis.util.Constantes;

public class Axisper009Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper009Service miServicio = new Axisper009Service();

	/*********************************************************************************************************************/
	/************************************************
	 * MÉTODOS DE INICIALIZACIÓN
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		// if
		// (Boolean.valueOf(String.valueOf(request.getParameter("paginar"))).booleanValue())
		// if (request.getParameter("paginar")== null)

		if (request.getParameter("paginar") != null || request.getParameter("subpantalla") != null) {
			String operation = request
					.getParameterValues("subpantalla")[request.getParameterValues("subpantalla").length - 1];

			request.setAttribute("subpantalla", operation);
		}

		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MÉTODOS DE ACTUALIZACIÓN
	 *******************************************/
	/*********************************************************************************************************************/
	public ActionForward eliminarDireccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarDireccion(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarCCC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarCCC(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarNACIONALIDAD(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarNACIONALIDAD(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarCONTACTO(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarCONTACTO(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarIDENTIFICADOR(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarIDENTIFICADOR(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarIRPF(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarIRPF(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarPARPER(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarPARPER(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultarPolissa(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action consultarPolissa");
		miServicio.m_consultarPolissa(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPolissa"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisper009.do?operation=volverPol"));

		return mapping.findForward("saltar");
	}

	public ActionForward volverPol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action volver");
		miServicio.m_volverPol(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		return new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE);
	}

	public ActionForward consultarRebut(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action consultarRebut");
		miServicio.m_consultarPolissa(request, this);
		request.getSession().setAttribute("saltarRebuts", "0");
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisadm003.do?operation=init&saltar=0"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisper009.do?operation=volverRec"));

		return mapping.findForward("saltar");
	}

	public ActionForward volverRec(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action volver");
		miServicio.m_volverPol(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		return new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE);
	}

	public ActionForward eliminarPERREL(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarPERREL(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarREGFISC(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarREGFISC(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward eliminarSARLAFT(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarSARLAFT(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward consultarPerRel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action consultarPerRel");
		miServicio.m_consultarPerRel(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		String SPERSON_AUX = AxisBaseService.getCampoTextual(request, "SPERSON_AUX");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");

		log.info("Axisper009Action consultarPerRel+ SPERSON" + SPERSON);
		log.info("Axisper009Action consultarPerRel+ SPERSON_AUX" + SPERSON_AUX);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON_AUX=" + SPERSON_AUX + "&SPERSON="
						+ SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisper009.do?operation=volverPerRel"));

		return mapping.findForward("saltar");
	}

	public ActionForward volverPerRel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action volver");
		miServicio.m_volverPerRel(request, this);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		return new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE);
	}

	public ActionForward navegarSiniestro(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action navegarSiniestro");
		miServicio.m_navegar(request, this);
		// this.topPila(request, Constantes.SALTARDESTINOACTION,
		// mapping.findForward("consultarSiniestro"));
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axissin006.do?operation=inicializarDatos&NSINIESselected="
						+ AxisBaseService.getCampoTextual(request, "NSINIES")));

		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisper009.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisint001Action volver");
		miServicio.m_volver(request, this);
		// return this.form(mapping, form, request, response);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		request.removeAttribute("subpantalla");
		request.setAttribute("VUELTA_SIN", "OK");
		return new ActionForward(
				"/axis_axisper009.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE);
	}

	public ActionForward bloquearPersonaLOPD(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_bloquearPersonaLOPD(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward desbloquearPersonaLOPD(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_desbloquearPersonaLOPD(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrarPersonaLOPD(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_borrarPersonaLOPD(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_sarlaft(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper009Action anterior");
		miServicio.borrar_sarlaft(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward aceptarSarlaft(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper047Action aceptar");
		miServicio.m_aceptarSarlaft(request);
		return mapping.findForward("form");
	}

	public ActionForward borrar_agenda(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr006Action cargarDatos");
		miServicio.m_borrar_agenda(request, this);

		return this.form(mapping, form, request, response);
	}

	/* INI--WAJ */
	public ActionForward eliminarIMPUESTO(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameter("paginar") == null)
			miServicio.m_eliminarIMPUESTO(request, this);
		return this.form(mapping, form, request, response);
	}

	/* FIN--WAJ */
	// INI IAXIS-3670 16/04/2019 AP
	public ActionForward validar_Consorcio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_validar_Consorcio(request);
		return this.form(mapping, form, request, response);
	}
	// FIN IAXIS-3670 16/04/2019 AP

}
