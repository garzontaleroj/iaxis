package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr174Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Inicializa los datos gesti�n y las preguntas y las guarda en los objetos
	 * axisctr_opcionesDatosGestion (las opciones seleccionables),
	 * axisctr_datosGestion (los campos no seleccionables y las respuestas del
	 * usuario) y axisctr_preguntasPoliza.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr174Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Date FEFECTOSUP = (Date) AbstractDispatchAction.topPila(request, "FEFECTO_SUPLEMENTO");
			logger.debug("Axisctr174Service m_form ----" + FEFECTOSUP);
			// request.setAttribute("FefectoSUP",FEFECTOSUP);
			formdata.put("FEFECTOSUP", FEFECTOSUP);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr174Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr174Service m_siguiente");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PSSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal PCMOTMOV = getHiddenCampoNumerico(request, "CMOTMOV");
			BigDecimal PNMOVIMI = getHiddenCampoNumerico(request, "NMOVIMI");
			String PTNATRIE = getCampoTextual(request, "TNATRIE");

			PAC_IAX_SUPLEMENTOS pac_iax_suplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = pac_iax_suplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_INSDETMOVSEGURO(PSSEGURO, PCMOTMOV, PNMOVIMI,
					PTNATRIE);
			logger.debug(mapa);
			tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr174Service - m�todo m_busqueda", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr174Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr174Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	/*
	 * private void m_validar(HttpServletRequest request, AbstractDispatchAction
	 * thisAction, BigDecimal direccion) {
	 * logger.debug("Axisctr174Service m_validar"); UsuarioBean usuario =
	 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO); HashMap
	 * map = null; try { request.setAttribute(Constantes.FORWARDACTION,
	 * AxisCodeWizard.findForward(request, direccion, whoami(this), null)); } catch
	 * (Exception e) {
	 * logger.error("Error en el servicio Axisctr174Service - m�todo m_validar", e);
	 * thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
	 * Constantes.MENSAJE_ERROR);
	 * 
	 * //Gesti�n de campos y dependencias
	 * this.f_Cargar_Propiedades_Pantalla(request, whoami(this)); } }
	 */

}
