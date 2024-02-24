package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.axis.Axispen003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispen003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axispen003Action thisAction) {
		logger.debug("Axispen003Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de fondos y planes de pensi�n , dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axispen003Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pCCODFON = getCampoNumerico(request, "CCODFON");

			if (pCCODFON != null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSIONES(pCCODFON, null, null, null, null,
						null);
				logger.debug(map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores
				ArrayList listaFondos = (ArrayList<Map>) map.get("FONPENSIONES");
				logger.debug(listaFondos);
				formdata.put("AXIS_FONDOS", listaFondos);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen003Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
