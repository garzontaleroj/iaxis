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
import axis.service.modal.Axismnt017Service;
import axis.util.Constantes;

public class Axismnt017Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axismnt017Service miServicio = new Axismnt017Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt017Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt017Action Form");
		miServicio.m_form(request, this);

		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			log.debug("Axismnt017Action Form operation" + operation);
			request.setAttribute("subpantalla", operation);
		}

		return mapping.findForward("form");
	}

	public ActionForward consulta_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axismnt017Action consulta_persona");

		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = AxisBaseService.getCampoNumerico(request, "SPERSON_CON");

		this.topPila(request, "formdata_axismnt017", formdata);

		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON=" + SPERSON));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/modal_axismnt017.do?operation=volver_per"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver_per(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.debug("Axismnt017Action volver_per");
		Map formdata = new HashMap();

		try {
			Map formdata_axismnt017 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axismnt017");

			if (!AxisBaseService.isEmpty(formdata_axismnt017)) {
				formdata.putAll(formdata_axismnt017);

				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Action - m�todo volver", e);
		}

		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt017Action guardar");
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axismnt017Action ajax_direccion");
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}
}
