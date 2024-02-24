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
import axis.service.axis.Axisrea025Service;

/**
 * Axisrea025Action.java Alta/Mod. Asociaci�n de productos a contratos
 * 05/08/2011
 */
public class Axisrea025Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea025Service miServicio = new Axisrea025Service();

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
		logger.debug("axisrea023Action Init");

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
		logger.debug("Axisrea025Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar_contrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea025Action guardar_contrato");
		miServicio.m_guardar_contrato(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_producto(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea025Action borrar_cuadro");
		miServicio.m_borrar_producto(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("axisrea025Action Buscar Contratos");
		miServicio.m_buscar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		logger.debug("axisrea025Action Buscar Contratos");
		miServicio.m_recargar(request, this);
		return mapping.findForward("form");
	}

	public ActionForward actualitzar_displays(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea025Action ActualizarDisplays");
		miServicio.m_actualizar_displays(request, this);
		return mapping.findForward("form");
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
	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea025Action actualizar_combos");

		miServicio.m_ajax_actualizar_combos(request);

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

	/**
	 * 
	 * 
	 * METODOS ACTUALIZACION COMBOS
	 */
	public ActionForward ajax_actualiza_actividad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea024Action actualizar_combos");

		miServicio.m_ajax_actualiza_actividad(request);

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
