//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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
import axis.service.axis.AxisBaseService;
import axis.service.modal.Axisper010Service;

public class Axisper010Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper010Service miServicio = new Axisper010Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE CERCA
	 ****************************************************/
	/*********************************************************************************************************************/

	public ActionForward busqueda_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper010Action: busqueda_persona");
		miServicio.m_busqueda_persona(request, this);
//        return this.form(mapping, form, request, response);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward grabarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Axisper010Service.Persona persona = miServicio.initPersona(request, this);
		boolean isNew = "true".equals(AxisBaseService.getCampoTextual(request, "isNew"));
		request.setAttribute("NORECARG", "0");
		// Ir procesando las validaciones una detr�s de otra y condicionalmente al valor
		// de retorno anterior
		if (miServicio.m_grabarPersona(persona, request, this).intValue() != 0)
			request.removeAttribute("PSPERSONOUT");

		return mapping.findForward("form");
		// return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_getnnumide(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getnnumide(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_getdigito(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getdigito(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_duplicada(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_duplicada(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward getPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper010Action: busqueda_persona");
		miServicio.m_getPersona(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_ciiu(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_ciiu(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_tip_indica(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf016Action ajax_busqueda_tip_indica");
		miServicio.m_ajax_busqueda_tip_indica(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_busqueda_tip_agente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf016Action ajax_busqueda_tip_agente");
		miServicio.m_ajax_busqueda_tip_agente(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_tabla_indica(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisprf010Action ajax_tabla_indica");
		miServicio.m_ajax_tabla_indica(request);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_imptos(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_imptos(request, this);
		return mapping.findForward("ajax");
	}

	/* IAXIS-13881 : Cambios de facturacion electronica : start */
	public ActionForward ajax_fiscales_adquiriente(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_fiscales_adquiriente(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_validate_nit_proveedor(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_validate_nit_proveedor(request, this);
		return mapping.findForward("ajax");
	}
	/* IAXIS-13881 : Cambios de facturacion electronica : end */

	/* Cambio para IAXIS-15339 : Start */
	public ActionForward crearPersonaConCIFIN(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper010Action: crearPersonaConCIFIN :: ");
		miServicio.m_buscarDatosCIFIN(request, this);
		return mapping.findForward("form");
	}
	/* Cambio para IAXIS-15339 : End */

}
