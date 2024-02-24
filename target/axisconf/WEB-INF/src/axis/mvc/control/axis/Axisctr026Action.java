package axis.mvc.control.axis;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr026Service;
import axis.util.Constantes;

public class Axisctr026Action extends Axisctr002Action {

	Log logger = LogFactory.getLog(this.getClass());
	private Axisctr026Service miServicio = new Axisctr026Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward actTomador(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action actTomador");
		super.actTomador(mapping, form, request, response);
		log.debug("Axisctr026Action actasegurado");
		miServicio.m_actAsegurado(request, this);
		log.debug("Axisctr026Action vamos al form");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action Form");
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	public ActionForward borrarAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action borrarAsegurado");
		miServicio.m_borrarAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action cambiar_asegurado");
		miServicio.m_cambiar_asegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward guardar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action guardar_asegurado");
		miServicio.m_guardar_asegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward actAsegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action actAsegurado(");
		miServicio.m_actAsegurado(request, this);
		return this.form(mapping, form, request, response);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/* Hereda los m�todos de Axisctr002Action */

	/* M�todos que llaman a Axisctr003Action */
	public ActionForward ajax_ver_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper003Action: ajax_ver_asegurado");
		miServicio.m_ajax_ver_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_modificar_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper003Action: ajax_modificar_asegurado");
		miServicio.m_ajax_modificar_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_delete_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_delete_asegurado");
		miServicio.m_ajax_delete_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_asegurado(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_selected_asegurado");
		miServicio.m_ajax_selected_asegurado(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_selected_vinculo_tomador(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_selected_vinculo_tomador");
		miServicio.m_ajax_selected_vinculo_tomador(request);
		return mapping.findForward("ajax");
	}

	/* M�TODOS DE REFRESCO DE TABLAS CRUZADAS */
	public ActionForward ajax_repintar_lista_asegurados(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_Repintar_Lista_Asegurados");
		miServicio.m_ajax_repintar_lista_asegurados(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_repintar_lista_tomadores(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr003Action ajax_repintar_lista_tomadores");
		miServicio.m_ajax_repintar_lista_tomadores(request);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	public ActionForward siguiente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action Siguiente");
		miServicio.m_siguiente(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));
	}

	public ActionForward anterior(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action Anterior");
		miServicio.m_anterior(request, this);
		return this.navegar(request, this.recargarThisForm(mapping));

	}

	/* Metodos AXIXTR1887 */
	/* Metodos de la pantalla AXISCTR187 */
	public ActionForward guardar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisctr026Action guardar_gestor");
		miServicio.m_guardar_gestor(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward cambiar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr026Action cambiar_asegurado");
		miServicio.m_cambiar_gestor(request);
		// return this.form(mapping,form,request,response);
		return this.form(mapping, form, request, response);
	}

	public ActionForward borrar_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action borrar_gestor");
		miServicio.m_borrar_gestor(request);
		return this.form(mapping, form, request, response);
	}

	public ActionForward update_gestor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.debug("Axisctr003Action update_gestor");
		miServicio.m_update_gestor(request);
		return this.form(mapping, form, request, response);
	}

	// Ini IAXIS -3635 - ACL - 22/04/2019
	public ActionForward consultarPer(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr026Action consultarPer");
		miServicio.m_consultarPer(request, this);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		String SPERSON_AUX = AxisBaseService.getCampoTextual(request, "SPERSON_AUX");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");

		log.info("Axisctr026Action consultarPer+ SPERSON" + SPERSON);
		log.info("Axisctr026Action consultarPer+ SPERSON_AUX" + SPERSON_AUX);
		this.topPila(request, Constantes.SALTARDESTINOACTION,
				new ActionForward("/axis_axisper009.do?operation=form&SPERSON_AUX=" + SPERSON_AUX + "&SPERSON="
						+ SPERSON + "&CAGENTEselected=" + CAGENTE));
		this.topPila(request, Constantes.SALTARORIGENACTION,
				new ActionForward("/axis_axisctr026.do?operation=volverPer"));

		return mapping.findForward("saltar");
	}

	public ActionForward volverPer(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisctr026Action volver");
		miServicio.m_volverPer(request, this);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String SPERSON = AxisBaseService.getCampoTextual(request, "SPERSON");
		BigDecimal CAGENTE = AxisBaseService.getCampoNumerico(request, "CAGENTE");
		return new ActionForward(
				"/axis_axisctr026.do?operation=form&SPERSON=" + SPERSON + "&CAGENTEselected=" + CAGENTE);
	}
	// Fin IAXIS -3635 - ACL - 22/04/2019
}
