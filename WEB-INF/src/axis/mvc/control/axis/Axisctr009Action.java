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
import axis.service.axis.Axisctr009Service;

public class Axisctr009Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisctr009Action.class);
	private Axisctr009Service miServicio = new Axisctr009Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		log.info("Axisctr009Action Form");
		miServicio.m_aceptar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward imprimir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_imprimir(request, this);
		return mapping.findForward("imprimir");
	}

	public ActionForward documentacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_documentacion(request, this);
		return mapping.findForward("documentacion");
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward seleccionar_documentacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_seleccionar_documentacion(request);
		return mapping.findForward("ajax");
	}

	public ActionForward contratar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_contratar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_guardar(request);
		return mapping.findForward("ajax");
	}

	public ActionForward enviarCorreo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		if (request.getParameterValues("paginar") != null)
			return this.form(mapping, form, request, response);

		miServicio.m_enviarCorreo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward consultarCuadros(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action consultarCuadros");
		miServicio.m_consultarCuadros(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_valdocrequerida(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr009Action valdocrequerida");
		miServicio.m_ajax_valdocrequerida(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualiza_evoluprov(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr009Action actualiza_evoluprov");
		miServicio.m_actualiza_evoluprov(request, this);
		return mapping.findForward("ajax");
	}
}
