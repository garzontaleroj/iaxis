package axis.mvc.control.modal;

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
import axis.service.modal.Axiscga001Service;
import axis.util.Constantes;

public class Axiscga001Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axiscga001Service miServicio = new Axiscga001Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscga001Action Init");
		miServicio.m_init(request, this);
		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscga001Action Form");
		miServicio.m_form(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscga001Action m_ajax_actualizar_persona");
		miServicio.m_ajax_actualizar_persona(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward editar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga001Action buscar");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCONTGAR = AxisBaseService.getCampoNumerico(request, "SCONTGAR");

		this.topPila(request, "CMODO", "CONSULTA");
		this.topPila(request, "formdata_axiscga001", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axiscga002.do?operation=form&SCONTGAR=" + SCONTGAR + "&MODO=EDICION&DONDE=AXISCGA001"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axiscga001.do?operation=form"));
		return mapping.findForward("saltar");
	}

	public ActionForward detalle(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axiscga001Action buscar");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCONTGAR = AxisBaseService.getCampoNumerico(request, "SCONTGAR");

		this.topPila(request, "CMODO", "CONSULTA");
		this.topPila(request, "formdata_axiscga001", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward(
				"/axis_axiscga002.do?operation=form&SCONTGAR=" + SCONTGAR + "&MODO=CONSULTA&DONDE=AXISCGA001"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axiscga001.do?operation=form"));
		return mapping.findForward("saltar");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axiscga001Action buscar");
		miServicio.m_buscar(request, this);
		return mapping.findForward("buscar");
	}

}