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
import axis.service.axis.Axisctr016Service;
import axis.util.Constantes;

public class Axisctr016Action extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(Axisctr016Action.class);
	private Axisctr016Service miServicio = new Axisctr016Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recarg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action Form");
		miServicio.m_recarg(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward tipanul(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action tipanul");
		miServicio.m_tipanul(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward aceptar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action aceptar");
		miServicio.m_aceptar(request, this);
		/*
		 * if (this.maxistipoMENSAJE(request).intValue()<Constantes.MENSAJE_ERROR) {
		 * return mapping.findForward ("aceptar"); } else { return this.form(mapping,
		 * form, request, response); }
		 */
		return mapping.findForward("ajax");
	}

	public ActionForward cancelar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action cancelar");
		miServicio.m_cancelar(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward consultar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr018Action consultar");
		miServicio.m_consultar(request, this);
		this.topPila(request, Constantes.SALTARDESTINOACTION, mapping.findForward("consultar"));
		this.topPila(request, Constantes.SALTARORIGENACTION, new ActionForward("/axis_axisctr016.do?operation=volver"));
		return mapping.findForward("saltar");
	}

	public ActionForward volver(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action volver");
		miServicio.m_volver(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward solic_baja(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action solic_baja");
		miServicio.m_solic_baja(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_motivos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr102Action ajax_busqueda_motivos");
		miServicio.m_ajax_busqueda_motivos(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_m_aplica_penali(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action ajax_m_aplica_penali");
		miServicio.m_ajax_aplica_penali(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_cargar_casobpm(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr016Action m_ajax_cargar_casobpm");
		miServicio.m_ajax_cargar_casobpm(request);
		return mapping.findForward("ajax");
	}

}
