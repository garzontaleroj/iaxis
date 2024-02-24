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
import axis.service.axis.Axisadm039Service;

/**
 * Axisadm039Action.java 26/02/2009
 */
public class Axisadm039Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisadm039Service miServicio = new Axisadm039Service();

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
		logger.debug("Axisadm039Action Init");
		miServicio.m_init(request);
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
		logger.debug("Axisadm039Action Form");
		miServicio.m_form(request);
		return mapping.findForward("form");
	}

	public ActionForward recargar_registrespendents(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action recargar_registrespendents");
		miServicio.m_recargar_registrespendents(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward buscar(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action recargar_registrespendents");
		miServicio.m_buscar(request);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/
	public ActionForward updateMarcados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action recargar_registrespendents");
		miServicio.m_updateMarcados(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward transferir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action transferir");
		miServicio.m_transferir(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward genfitxer(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action genfitxer");
		miServicio.m_genfitxer(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward genfitxerexcel(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action genfitxer");
		miServicio.m_genfitxer_excel(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward genfitxerexcelpre(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action genfitxerexcelpre");
		miServicio.m_genfitxerexcelpre(request);
		return this.buscar(mapping, form, request, response);
	}

	public ActionForward ajax_updateMarcados(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action recargar_registrespendents");
		miServicio.m_ajax_updateMarcados(request);
		return mapping.findForward("ajax");
	}

	public ActionForward salir(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action salir");
		miServicio.m_salir(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward fcambio(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisadm039Action fcambio");
		miServicio.m_fcambio(request);
		return this.form(mapping, form, request, response);
	}
}