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
import axis.service.axis.Axisctr301Service;

public class Axisctr301Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisctr301Action.class);
	private Axisctr301Service miServicio = new Axisctr301Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anular(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_anular(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cargarPoliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_cargar_poliza(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cargarDocumento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_cargar_doc(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward valida_poliza(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_valida_poliza(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward ejecutar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr301Action Form");
		miServicio.m_ejecutar(request, this);
		return this.form(mapping, form, request, response);
	}
}
