package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.modal.Axisctr086Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr086Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr086Service.class);

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr086Action thisAction) {
		logger.debug("Axisctr086Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr086Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr086Action thisAction) {
		logger.debug("Axisctr086Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "PSSEGURO");
			BigDecimal SRECREN = getCampoNumerico(request, "PSRECREN");

			formdata.put("SSEGURO", SSEGURO);
			formdata.put("SRECREN", SRECREN);

			PAC_IAX_RENTAS pacIaxRentas = new PAC_IAX_RENTAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxRentas.ejecutaPAC_IAX_RENTAS__F_GET_DETPAGO_RENTA(SSEGURO, SRECREN);
			logger.debug("----- datos pago:" + map);

			if (!isEmpty((HashMap) ((List) tratarRETURNyMENSAJES(request, map)).get(0))) {
				formdata.putAll((HashMap) ((List) tratarRETURNyMENSAJES(request, map)).get(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr086Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

}
