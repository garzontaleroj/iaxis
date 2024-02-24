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
import axis.service.modal.Axisper022Service;

public class Axisper022Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper022Service miServicio = new Axisper022Service();

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		miServicio.m_init(request, this);
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_form(request, this);
		return mapping.findForward("form");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getProvinPobla(request);
		return mapping.findForward("ajax");
	}

	public ActionForward grabarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Axisper022Service.Persona persona = miServicio.initPersona(request, this);
		boolean isNew = "true".equals(AxisBaseService.getCampoTextual(request, "isNew"));

		// Ir procesando las validaciones una detr�s de otra y condicionalmente al valor
		// de retorno anterior
		if (miServicio.m_grabarPersona(persona, request, this).intValue() == 0
				&& miServicio.m_grabarContactoPersona(persona, request, this, isNew).intValue() == 0
				&& miServicio.m_grabarDireccionPersona(persona, request, this, isNew).intValue() == 0) {

			int nacionalidad = 0;
			int regfiscal = 0;
			if (!AxisBaseService.isEmpty(AxisBaseService.getCampoNumerico(request, "CREGFISCAL")))
				regfiscal = miServicio.m_grabarRegfiscalPersona(persona, request, this).intValue();

			if (regfiscal == 0) {
				if (!AxisBaseService.isEmpty(AxisBaseService.getCampoNumerico(request, "CNACIONALIDAD")))
					nacionalidad = miServicio.m_grabarNacionalidadPersona(persona, request, this).intValue();

				if (nacionalidad == 0) {
					int tarjeta = miServicio.m_grabarTarjetaPersona(persona, request, this).intValue();
					if (tarjeta == 0 || tarjeta == 3) {
						int validarCCC = miServicio.m_validarCCC(request, this, isNew).intValue();
						if (validarCCC == 3 || // validarCCC == 3 --> No hace falta grabar, no informado
								(validarCCC == 0
										&& miServicio.m_grabarCCCPersona(persona, request, this).intValue() == 0)) {
							// m_grabarEstPersona ya ha situado un atributo "PSPERSONOUT" en request
							logger.debug("No se han producido errores - se cerrar� axisper022");
							return mapping.findForward("form");
						}
					}
				}
			}
		}

		logger.debug("akiiii 222");
		// Si estamos aqu�, no podemos devolver un SPERSON de out porque no ha
		// funcionado
		request.removeAttribute("PSPERSONOUT");
		return this.form(mapping, form, request, response);
	}

	public ActionForward ajax_getdigito(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getdigito(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajax_direccion(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_direccion(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward ajaxgetInfoHost(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajaxgetInfoHost(request, this);
		return mapping.findForward("ajax");
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE CERCA
	 ****************************************************/
	/*********************************************************************************************************************/

	public ActionForward busqueda_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action B�squeda
		log.info("Axisper022Action: busqueda_persona");
		miServicio.m_busqueda_persona(request, this);
		// return this.form(mapping, form, request, response);
		return mapping.findForward("form");
	}

	public ActionForward ajax_getnnumide(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getnnumide(request, this);
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
		log.info("Axisper022Action: busqueda_persona");
		miServicio.m_getPersona(request, this);

		return mapping.findForward("form");
	}
}
