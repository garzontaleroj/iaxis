package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.mvc.control.modal.Axiscob001cAction;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscob001cService extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscob001cAction thisAction) {
		logger.debug("Axiscob001cService m_init");
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
	public void m_form(HttpServletRequest request, Axiscob001cAction thisAction) {

		logger.debug("Axiscob001cService m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.remove("TRANS_SPL");
			BigDecimal pSSEGURO = getCampoNumerico(request, "SSEGURO");
			PAC_IAX_CTACLIENTE pac_iax_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_TRANSFERIBLE_SPL(pSSEGURO);
			BigDecimal trans_spl = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);
			formdata.put("TRANS_SPL", trans_spl);

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSEQCAJA = getCampoNumerico(request, "SEQCAJA");
			BigDecimal pPCESTADO = new BigDecimal(3);

			request.getSession().removeAttribute("listaPolizas");
			PAC_IAX_CAJA PAC_IAX_CAJA = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_LEE_CAJAMOV(pPSSEGURO, pPSEQCAJA, pPCESTADO);
			request.getSession().setAttribute("listaPolizas", (ArrayList) tratarRETURNyMENSAJES(request, map1, false));
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
