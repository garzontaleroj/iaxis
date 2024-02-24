//Revision:# uQvs84ZWWQpiFvXImlhz0A== #
package axis.mvc.control.modal;

import java.io.IOException;
import java.math.BigDecimal;

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
import axis.service.modal.Axisper005Service;

public class Axisper005Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper005Service miServicio = new Axisper005Service();

	/*********************************************************************************************************************/
	/************************************************
	 * Mï¿½TODOS DE INICIALIZACIï¿½N
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
	 * Mï¿½TODOS DE ACTUALIZACIï¿½N
	 *******************************************/
	/*********************************************************************************************************************/

	public ActionForward getProvinPobla(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getProvinPobla(request);
		return mapping.findForward("ajax");
	}

	public ActionForward grabarPersona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		Axisper005Service.Persona persona = miServicio.initPersona(request, this);
		boolean isNew = "true".equals(AxisBaseService.getCampoTextual(request, "isNew"));
		logger.debug("ini");
		String ExistePersona = miServicio.m_personaSperson(persona);
		BigDecimal per_contactocamp = (BigDecimal) AxisBaseService.getCampoNumerico(request, "PER_CONTACTOCAMPO");
		if (!AxisBaseService.isEmpty(ExistePersona) && !AxisBaseService.isEmpty(per_contactocamp)
				&& per_contactocamp.compareTo(new BigDecimal(1)) == 0) { // Ir procesando las validaciones una
																			// detrÃ¯Â¿Â½s de otra y condicionalmente al
																			// valor de retorno anterior
			if (miServicio.m_grabarEstPersona(persona, request, this).intValue() == 0
					&& miServicio.m_grabarDireccionPersona(persona, request, this, isNew).intValue() == 0) {

				miServicio.m_traspaso_persona_est(request, this); // BUG CONF-349 - 17/09/2016 - JAEG

				logger.debug("ini 1");
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
							logger.debug("validarCCC : " + validarCCC);
							if (validarCCC == 3 || // validarCCC == 3 --> No hace falta grabar, no informado
									(validarCCC == 0
											&& miServicio.m_grabarCCCPersona(persona, request, this).intValue() == 0))
								return mapping.findForward("form");
						}

					}
				}
			}
		} else {
			if (miServicio.m_grabarEstPersona(persona, request, this).intValue() == 0
					&& miServicio.m_grabarContactoPersona(persona, request, this, isNew).intValue() == 0
					&& miServicio.m_grabarDireccionPersona(persona, request, this, isNew).intValue() == 0) {

				miServicio.m_traspaso_persona_est(request, this); // BUG CONF-349 - 17/09/2016 - JAEG

				logger.debug("ini 1");
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
							logger.debug("validarCCC : " + validarCCC);
							if (validarCCC == 3 || // validarCCC == 3 --> No hace falta grabar, no informado
									(validarCCC == 0
											&& miServicio.m_grabarCCCPersona(persona, request, this).intValue() == 0))

								return mapping.findForward("form");

						}

					}
				}
			}

		}

		// Si estamos aquÃ¯Â¿Â½, no podemos devolver un SPERSON de out porque no ha
		// funcionado
		request.removeAttribute("PSPERSONOUT");
		logger.debug("fiii");
		return this.form(mapping, form, request, response);
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
	 * Mï¿½TODOS DE CERCA
	 ****************************************************/
	/*********************************************************************************************************************/

	public ActionForward busqueda_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action Bï¿½squeda
		log.info("Axisper005Action: busqueda_persona");
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
		// Action Bï¿½squeda
		log.info("Axisper010Action: busqueda_persona");
		miServicio.m_getPersona(request, this);

		return mapping.findForward("form");
	}

	public ActionForward ajax_getdigito(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_ajax_getdigito(request, this);
		return mapping.findForward("ajax");
	}

	public ActionForward traspaso_persona(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// Action traspaso_persona
		log.info("Axisper005Action: traspaso_persona");
		miServicio.m_traspaso_persona(request, this);

		return mapping.findForward("form");
	}

	public ActionForward eliminarCONTACTO(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		miServicio.m_eliminarCONTACTO(request, this);
		return this.form(mapping, form, request, response);
	}

}
