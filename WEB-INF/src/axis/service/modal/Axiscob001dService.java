package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.mvc.control.modal.Axiscob001dAction;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscob001dService extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscob001dAction thisAction) {
		logger.debug("Axiscob001dService m_init");
		try {
			request.getSession().removeAttribute("listaPolizas");
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axiscob001dAction thisAction) {

		logger.debug("Axiscob001dService m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSEQCAJA = getCampoNumerico(request, "SEQCAJA");
			request.getSession().removeAttribute("listaPolizas");
			PAC_IAX_CTACLIENTE PAC_IAX_CTACLIENTE = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = PAC_IAX_CTACLIENTE.ejecutaPAC_IAX_CTACLIENTE__F_OBTENER_MOVIMIENTOS_CMOVIMI6(pPSEQCAJA);

			ArrayList lista_polizas = (ArrayList) tratarRETURNyMENSAJES(request, map1, false);
			request.getSession().setAttribute("listaPolizas", lista_polizas);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
