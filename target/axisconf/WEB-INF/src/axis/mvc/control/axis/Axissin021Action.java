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
import axis.service.axis.Axissin021Service;

public class Axissin021Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin021Service miServicio = new Axissin021Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021Action Init");
		miServicio.m_init(request, this);

		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cargarDatos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr021Action cargarDatos");

		if (request.getParameter("paginar") != null) {
			return this.buscar(mapping, form, request, response);
		}
		miServicio.m_cargarDatos(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return mapping.findForward("form");
	}

	public ActionForward recargarCauMot(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021Action recargarRadios");

		if (request.getParameter("paginar") != null) {
			return this.buscar(mapping, form, request, response);
		}
		miServicio.m_recargarCauMot(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_producte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021 borrar_producte");
		miServicio.m_borrar_producte(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.buscar(mapping, form, request, response);
	}

	public ActionForward borrar_formula(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021 borrar_formula");
		miServicio.m_borrar_formula(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.buscar(mapping, form, request, response);
	}

	public ActionForward borrar_destinatario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021 borrar_destinatario");
		miServicio.m_borrar_destinatario(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.buscar(mapping, form, request, response);
	}

	public ActionForward borrar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axissin021 borrar");
		miServicio.m_borrar(request, this);

		if (String.valueOf(request.getParameter("subpantalla")).length() > 0
				&& request.getParameter("subpantalla") != null)
			request.setAttribute("subpantalla", request.getParameter("subpantalla"));
		if (String.valueOf(request.getParameter("seccion")).length() > 0 && request.getParameter("seccion") != null)
			request.setAttribute("seccion", request.getParameter("seccion"));

		return this.buscar(mapping, form, request, response);
	}

}
