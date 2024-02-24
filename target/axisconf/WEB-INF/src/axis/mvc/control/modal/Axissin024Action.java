package axis.mvc.control.modal;

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
import axis.service.modal.Axissin024Service;
import axis.util.Constantes;

public class Axissin024Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin024Service miServicio = new Axissin024Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axissin024Action: guardar");

		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action consultarPolissa");
		miServicio.m_formula(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarFormula"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/modal_axissin024.do?operation=volver"));

		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper009Action volver");
		miServicio.m_volver(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		return this.form(mapping, form, request, response);
		// return new
		// ActionForward("/axis_axisper009.do?operation=form&SPERSON="+SPERSON+"&CAGENTEselected="+CAGENTE);
	}

}
