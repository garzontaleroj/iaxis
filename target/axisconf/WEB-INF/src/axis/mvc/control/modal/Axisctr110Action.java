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
import axis.service.modal.Axisctr110Service;

public class Axisctr110Action extends AbstractDispatchAction {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr110Service miServicio = new Axisctr110Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr110Action Init");
		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr110Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos de actualizaci�n
	 *********************************************/
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
	public ActionForward actualizar_combos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr110Action actualizar_combos");

		miServicio.m_ajax_actualizar_combos(request);

		return mapping.findForward("ajax");
	}

	public ActionForward ajax_actualizar_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr110Action ajax_actualizar_agente");
		miServicio.m_ajax_actualizar_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ver_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr110Action ver_agente");
		miServicio.m_ajax_ver_agente(request);
		return mapping.findForward("ajax");
	}

	/*
	 * public ActionForward ajax_busqueda_productos(ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse response)
	 * throws IOException, ServletException {
	 * log.info("Axisctr110Action ajax_busqueda_productos");
	 * miServicio.m_ajax_busqueda_productos(request); return
	 * mapping.findForward("ajax"); }
	 * 
	 * 
	 * 
	 * public ActionForward buscar(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axisctr110Action Form");
	 * miServicio.m_buscar(request, this); return
	 * this.form(mapping,form,request,response); }
	 * 
	 * /* public ActionForward consultarPolizaSiniestros (ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse response)
	 * throws IOException, ServletException {
	 * log.info("Axisctr006Action consultarPoliza");
	 * miServicio.m_consultarSiniestros(request, this); this.topPila(request,
	 * Constantes.SALTARDESTINOACTION, mapping.findForward("consultarPoliza"));
	 * this.topPila(request, Constantes.SALTARORIGENACTION, new
	 * ActionForward("/axis_axissin006.do?operation=volver") ); return
	 * mapping.findForward("saltar"); }
	 * 
	 * public ActionForward volver(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest request, HttpServletResponse response) throws IOException,
	 * ServletException { log.info("Axisctr110Action volver");
	 * miServicio.m_volver(request, this); return this.form(mapping, form, request,
	 * response); }
	 */
	/*********************************************************************************************************************/
	/***********************************************
	 * Fin Metodos de pruebas
	 *********************************************/
	/*********************************************************************************************************************/
}