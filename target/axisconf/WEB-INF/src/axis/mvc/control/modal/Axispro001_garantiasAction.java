package axis.mvc.control.modal;

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
import axis.service.modal.Axispro001_garantiasService;
import axis.util.Constantes;

public class Axispro001_garantiasAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axispro001_garantiasAction.class);
	private Axispro001_garantiasService miServicio = new Axispro001_garantiasService();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);

		request.setAttribute("subpantalla", request.getSession().getAttribute("subpantalla_gar"));

		if (request.getParameter("paginar") != null) {
			String subpantalla = request
					.getParameterValues("subpantalla")[request.getParameterValues("subpantalla").length - 1];
			request.setAttribute("subpantalla", subpantalla);
		}
		request.getSession().removeAttribute("subpantalla_gar");
		// request.getSession().setAttribute("subpantalla_gar",null);
		return mapping.findForward("form");
	}

	public ActionForward consultarParametrosGar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action consultarParametros");
		miServicio.m_consultarParametrosGar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultarParametrosGar"));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/modal_axispro001_garantias.do?operation=volverParamGar"));
		return mapping.findForward("saltar");
	}

	public ActionForward volverParamGar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axispro001Action volver");
		miServicio.m_volverParamGar(request, this);
		return this.form(mapping, form, request, response);
	}

}
