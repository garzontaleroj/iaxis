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
import axis.service.axis.Axisctr300Service;
import axis.util.Constantes;

public class Axisctr300Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	private Axisctr300Service miServicio = new Axisctr300Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action init");
		miServicio.m_init(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward nuevo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action nuevo");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCONTGAR = AxisBaseService.getCampoNumerico(request, "SCONTGAR");
		/*
		 * ActionForward siguiente = new
		 * ActionForward("/axis_axiscga002.do?operation=init&SCONTGAR=" +
		 * null+"&MODO=EDICION&DONDE=AXISCTR300");
		 */

		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("newcontragarantia"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr300.do?operation=volver"));
		return mapping.findForward("saltar");

	}

	public ActionForward listarContragarancias(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("Axisctr300Action listarContragarancias");
		if (!miServicio.isEmpty(this.topPila(request, "CMODO"))
				&& !(((String) this.topPila(request, "CMODO")).equals("CONSULTA"))) {// IAXIS-5256
			this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODOPAN"));
		}
		miServicio.m_buscar(request);
		return mapping.findForward("form");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	@SuppressWarnings("unused")
	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action buscar");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCONTGAR = AxisBaseService.getCampoNumerico(request, "SCONTGAR");

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axiscga002.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr300.do?operation=refrescar"));

		return mapping.findForward("saltar");
	}

	public ActionForward refrescar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action refrescar");
		miServicio.m_refrescar(request);
		return mapping.findForward("refrescar");
	}

	public ActionForward check(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr300Action check");
		miServicio.m_check(request);
		return mapping.findForward("check");
	}

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr300Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr300Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
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
}
