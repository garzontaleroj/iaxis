//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.modal.Axisagd002Service;

public class Axisagd002Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisagd002Service miServicio = new Axisagd002Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action Form");
		this.topPila(request, "CMODO", miServicio.getCampoTextual(request, "CMODODATAPU"));
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action Buscar");
		miServicio.m_buscar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_busqueda_valores_grupo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action ajax_busqueda_valoresgrupo");
		miServicio.m_ajax_busqueda_valoresgrupo(request, this);// f_consulta_lstsini
		return mapping.findForward("ajax");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action guardar");
		miServicio.m_guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward del_vision(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action del_vision");
		miServicio.m_del_vision(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar_usuario(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action guardar_usuario");
		miServicio.m_guardar_usuario(request, this);
		return mapping.findForward("form");
	}

	public ActionForward ajax_actualitzar_usuarios(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action ajax_actualitzar_usuarios");
		miServicio.m_ajax_actualitzar_usuarios(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_valconclusiones(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisagd002Action ajax_valconclusiones");
		miServicio.m_ajax_valconclusiones(request, this);
		return mapping.findForward("ajax");
	}

}
