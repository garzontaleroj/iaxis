//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_RIESGO_FINANCIERO;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper050Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper050Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper050Action thisAction) {
		logger.debug("Axisper050Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date fecha_actual = new Date(new java.util.Date().getTime());
			FEFECTO = ((!isEmpty(FEFECTO)) ? FEFECTO : fecha_actual);

			formdata.put("FEFECTO", FEFECTO);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper050Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_calcular_riesgo(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper050Service m_calcular_riesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map respuesta;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			java.sql.Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			BigDecimal VFINANCIAR = getHiddenCampoNumerico(request, "VFINANCIAR");

			PAC_IAX_RIESGO_FINANCIERO param = new PAC_IAX_RIESGO_FINANCIERO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			respuesta = param.ejecutaPAC_IAX_RIESGO_FINANCIERO__F_CALCULA_RIESGO(SPERSON, FEFECTO, VFINANCIAR);

			tratarRETURNyMENSAJES(request, respuesta);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper050Service.m_calcular_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
