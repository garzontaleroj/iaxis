//Revision:# SRVUR+PeCpom7Zd3b9jnBg== #
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
import axis.service.axis.Axisage031Service;

public class Axisage031Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage031Service miServicio = new Axisage031Service();

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward cargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: cargar");
		miServicio.m_cargar(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward cargar_alta(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: cargar_alta");
		miServicio.m_cargar_alta(request, this);
		return this.form(mapping, form, request, response);

	}

	public ActionForward borrarDocumento(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: borrarDocumento");
		miServicio.m_borrarDocumento(request, this);
		return mapping.findForward("form");
	}

	public ActionForward anadir_recibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: anadir_recibo");
		miServicio.m_anadir_recibo(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_recibos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: actualizar_recibos");
		miServicio.m_actualizar_recibos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_dif(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_dif");
		miServicio.m_ajax_actualizar_dif(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_difglobal(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_difglobal");
		miServicio.m_ajax_actualizar_difglobal(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_difpyg(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_difpyg");
		miServicio.m_ajax_actualizar_difpyg(request);
		return mapping.findForward("ajax");
	}

	public ActionForward recargar_apuntes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: recargar_apuntes");
		miServicio.m_recargar_apuntes(request, this);
		return mapping.findForward("form");
	}

	public ActionForward marcar_todos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: marcar_todos");
		miServicio.m_marcar_todos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward desmarcar_todos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: desmarcar_todos");
		miServicio.m_desmarcar_todos(request, this);
		return mapping.findForward("form");
	}

	public ActionForward marcar_todosci(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: marcar_todosci");
		miServicio.m_marcar_todosci(request, this);
		return mapping.findForward("form");
	}

	public ActionForward desmarcar_todosci(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: desmarcar_todosci");
		miServicio.m_desmarcar_todosci(request, this);
		return mapping.findForward("form");
	}

	public ActionForward guardar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: guardar");
		miServicio.m_guardar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward liquidar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: liquidar");
		miServicio.m_liquidar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward aceptar_axisage032(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisage031Action: aceptar_axisage032");
		miServicio.m_aceptar_axisage032(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualizar_check_pl(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_check_pl");
		miServicio.m_ajax_actualizar_check_pl(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_check_recibo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_check_recibo");
		miServicio.m_ajax_actualizar_check_recibo(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_check_apunte(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_check_apunte");
		miServicio.m_ajax_actualizar_check_apunte(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action: ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward actualizar_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action: ver_agente");
		miServicio.m_ajax_ver_persona(request);
		return mapping.findForward("ajax");
	}

	public ActionForward borrar_liquidacion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage031Action: borrar_liquidacion");
		miServicio.m_borrar_liquidacion(request, this);
		return mapping.findForward("form");
	}

}
