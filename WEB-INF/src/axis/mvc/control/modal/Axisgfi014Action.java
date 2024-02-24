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
import axis.service.modal.Axisgfi014Service;

/**
 * Axisgfi014Service.java 25/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisgfi014Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisgfi014Service miServicio = new Axisgfi014Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS AJAX************
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward ajax_ordenes(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action ajax_ordenes");
		miServicio.m_ajax_ordenes(request);
		return mapping.findForward("ajax");
	}

	public ActionForward guardar_vigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Guardar Vigencia");
		miServicio.m_guardar_vigencia(request);
		return mapping.findForward("form");

	}

	public ActionForward borrar_vigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Borrar Vigencia");
		miServicio.m_borrar_vigencia(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar_detalle_vigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Guardar detalle vigencia");
		miServicio.m_guardar_detalle_vigencia(request);
		return mapping.findForward("form");

	}

	public ActionForward borrar_detalle_vigencia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisgfi014Action Borrar detalle vigencia");
		miServicio.m_borrar_detalle_vigencia(request);
		return mapping.findForward("form");

	}

}
