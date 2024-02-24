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
import axis.service.axis.Axiscga002Service;
import axis.util.Constantes;

public class Axiscga002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axiscga002Service miServicio = new Axiscga002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action init");
		miServicio.m_init(request);
		// miServicio.m_form(request, this);
		return this.form(mapping, form, request, response);
	}

	@SuppressWarnings("static-access")
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action form");
		BigDecimal pPSCONTGAR = miServicio.getCampoNumerico(request, "CMODOPAN");
		BigDecimal pPNMOVIMI = miServicio.getCampoNumerico(request, "NMOVIMI");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_detalle(request, pPSCONTGAR, pPNMOVIMI);
		return mapping.findForward("form");
	}

	public ActionForward detalle_consulta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action form");
		// IAXIS-5125 Se guarda el modo en el que se ingresa al modulo para volver a �l
		// luego de cargar la pantalla de contragarantias
		// IAXIS-5256 se realiza ajuste para campo nulo
		String modoAct = (String) this.topPila(request, "CMODO");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		BigDecimal pPSCONTGAR = miServicio.getCampoNumerico(request, "SCONTGAR");
		BigDecimal pPNMOVIMI = miServicio.getCampoNumerico(request, "NMOVIMI");
		miServicio.m_detalle(request, pPSCONTGAR, pPNMOVIMI);
		// IAXIS-5125 Se reestablece el modo para que la pagina que hizo el llamado se
		// cargue correctamente
		this.topPila(request, "CMODO", modoAct);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action aceptar");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		miServicio.m_aceptar(request);
		return mapping.findForward("form");
	}

	public ActionForward ins_codeu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action ins_codeu");
		miServicio.m_ins_codeu(request);
		return mapping.findForward("form");
	}

	public ActionForward del_codeu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action del_codeu");
		miServicio.m_del_codeu(request);
		return mapping.findForward("form");
	}

	public ActionForward ins_pol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action ins_pol");
		miServicio.m_ins_pol(request);
		return mapping.findForward("form");
	}

	public ActionForward del_pol(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action ins_pol");
		miServicio.m_del_pol(request);
		return mapping.findForward("form");
	}

	/****
	 * Ajax
	 */
	public ActionForward ajax_get_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscga002Action ajax_get_persona");
		miServicio.m_ajax_get_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga002Action cancelar");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCONTGAR = AxisBaseService.getCampoNumerico(request, "SCONTGAR");
		/*
		 * ActionForward siguiente = new
		 * ActionForward("/axis_axiscga002.do?operation=init&SCONTGAR=" +
		 * null+"&MODO=EDICION&DONDE=AXISCTR300");
		 */

		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("listacontragarantia"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axiscga002.do?operation=volver"));
		return mapping.findForward("saltar");

	}

	public ActionForward ajax_poblacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_poblacion(request, this);
		return mapping.findForward("ajax");
	}

	/*
	 * public ActionForward descargar_reporte(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException, Exception {
	 * logger.debug("Axiscga002Action Buscar");
	 * miServicio.m_descargar_reporte(request, this); // return this.form(mapping,
	 * form, request, response); return mapping.findForward("json"); // json ya esta
	 * predefindo como // mapping }
	 */
}
