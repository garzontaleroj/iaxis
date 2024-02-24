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
import axis.service.axis.Axisage035Service;

public class Axisage035Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisage035Service miServicio = new Axisage035Service();

	public Axisage035Action() {
		super();
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage035Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisage035Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisage035Action Buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward generar_correo(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisage035Action Buscar");
		miServicio.m_generar_correo(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward generar_list(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException, Exception {
		logger.debug("Axisage035Action Buscar");
		miServicio.m_generar_list(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("json"); // json ya esta predefindo como mapping
	}

	public ActionForward ajax_busqueda_productos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisage035Action ajax_busqueda_productos");
		miServicio.m_ajax_busqueda_productos(request);
		return mapping.findForward("ajax");
	}
}
