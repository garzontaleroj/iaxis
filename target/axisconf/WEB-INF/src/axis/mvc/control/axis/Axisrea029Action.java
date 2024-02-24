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
import axis.service.axis.Axisrea029Service;

/**
 * Axisrmb027Action.java Alta/Mod. Agrupaci�n de contratos 05/08/2011
 */
public class Axisrea029Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisrea029Service miServicio = new Axisrea029Service();

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
		logger.debug("axisrea029Action Init");

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
		logger.debug("axisrea029Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	public ActionForward guardar_contrato(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea029Action guardar_contrato");
		miServicio.m_guardar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea029Action buscar");
		miServicio.m_buscar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward recargar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisrea029Action buscar");
		miServicio.m_recargar(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_clau(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea029Action borrar_clau");
		miServicio.m_borrar_clau(request, this);
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
	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("axisrea029Action actualizar_combos");

		miServicio.m_ajax_actualizar_combos(request);

		return mapping.findForward("ajax");
	}

}
