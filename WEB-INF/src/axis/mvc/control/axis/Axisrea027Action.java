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
import axis.service.axis.Axisrea027Service;

/**
 * Axisrmb027Action.java Alta/Mod. Agrupaci�n de contratos
 */
public class Axisrea027Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea027Service miServicio = new Axisrea027Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea027Action Init");

		return this.form(mapping, form, request, response);
	}

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea027Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	/*
	 * public ActionForward guardar_contrato(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { logger.debug("Axisrea027Action guardar_contrato");
	 * miServicio.m_guardar_contratos(request, this); return this.form(mapping,
	 * form, request, response); }
	 */

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea027Action buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_contrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea027Action borrar_cuadro");
		miServicio.m_borrar_contrato(request, this);
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	/*
	 * public ActionForward actualitzar_displays(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException {
	 * logger.debug("Axisrea027Action ActualizarDisplays");
	 * miServicio.m_actualizar_displays(request, this); return
	 * mapping.findForward("form"); }
	 */

	/*
	 * public ActionForward modificar_contrato(ActionMapping mapping, ActionForm
	 * form, HttpServletRequest request, HttpServletResponse response) throws
	 * IOException, ServletException {
	 * 
	 * logger.debug("Axisrea027Action ModificarContrato");
	 * miServicio.m_modificar_contrato(request, this); return
	 * mapping.findForward("form"); }
	 */

	/*
	 * public ActionForward aceptar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException {
	 * 
	 * logger.debug("Axisrea027Action ModificarContrato");
	 * miServicio.m_aceptar(request, this); return mapping.findForward("form"); }
	 */

	/**
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException public ActionForward actualizar_combos(ActionMapping
	 *                          mapping, ActionForm form, HttpServletRequest
	 *                          request, HttpServletResponse response) throws
	 *                          IOException, ServletException {
	 *                          logger.debug("Axisrea027Action actualizar_combos");
	 * 
	 *                          miServicio.m_ajax_actualizar_combos(request);
	 * 
	 *                          return mapping.findForward("ajax"); }
	 */

}
