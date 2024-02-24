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
import axis.service.modal.Axisrea026Service;

public class Axisrea026Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea026Service miServicio = new Axisrea026Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/

	/**
	 */
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/**
	 */
	public

			ActionForward ajax_grabar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_grabar(request, this);
		return mapping.findForward("ajax");
	}

	/**
	 * 
	 * 
	 * METODOS ACTUALIZACION COMBOS
	 */
	public ActionForward ajax_actualiza_garantia(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea024Action actualizar_combos");

		miServicio.m_ajax_actualiza_garantia(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_producto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea024Action actualizar_combos");

		miServicio.m_ajax_actualiza_producto(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualiza_version(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea024Action actualizar_combos");

		miServicio.m_ajax_actualiza_version(request);

		return mapping.findForward("ajax");
	}

}
