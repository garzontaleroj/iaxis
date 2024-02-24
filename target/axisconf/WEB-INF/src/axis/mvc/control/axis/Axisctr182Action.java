package axis.mvc.control.axis;

import java.io.IOException;

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
import axis.service.axis.Axisctr182Service;
import axis.util.Constantes;

public class Axisctr182Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr182Service miServicio = new Axisctr182Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action Init");
		miServicio.m_init(request, this);

		return mapping.findForward("form");
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action Form");
		miServicio.m_form(request, this);
		/* Paginar */
		if (request.getParameter("paginar") != null) {
			String operation = request.getParameterValues("operation")[request.getParameterValues("operation").length
					- 1];
			request.setAttribute("subpantalla", operation);
		}

		if (request.getParameter("paginar") == null) {
			String dtPolizasOffset = (String) this.topPila(request, "dtPolizasOffset");

			if (AxisBaseService.isEmpty(dtPolizasOffset))
				dtPolizasOffset = request.getParameter("dtPolizasOffset");

			if (!AxisBaseService.isEmpty(dtPolizasOffset))
				request.setAttribute("dtPolizasOffset", dtPolizasOffset);

		}

		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action aceptar");
		miServicio.m_aceptar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward rechazar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action rechazar");
		miServicio.m_rechazar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward reversar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action rechazar");
		miServicio.m_reversar(request, this);
		return this.form(mapping, form, request, response);
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
	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr182Action consultar");
		if (request.getParameter("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_consultar(request, this);

		this.topPila(request, Constantes.SALTARDESTINOACTION, new ActionForward("/axis_axisctr020.do?operation=form"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr182.do?operation=volver"));
		return mapping.findForward("saltar");

	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr182Action volver");
		miServicio.m_volver(request, this);
		return mapping.findForward("form");
	}

}
