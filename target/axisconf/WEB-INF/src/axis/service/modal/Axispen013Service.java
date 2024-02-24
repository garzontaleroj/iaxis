package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen013Service.java 17/06/2013
 */
@SuppressWarnings("all")
public class Axispen013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * 
	 * @param request
	 */

	public void m_form(HttpServletRequest request, Axispen013Action thisAction) {
		logger.debug("Axispen013Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispen013Service m_form formdata: " + formdata);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			cargarValoresDesplegables(request, usuario, formdata);
			BigDecimal pPCCODFON = getCampoNumerico(request, "CCODFON");
			BigDecimal CAGENTE_SESSION = usuario.getCagente();
			formdata.put("CAGENTE_SESSION", CAGENTE_SESSION);

			// Si ens pasen el fons el cargem per pantalla
			if (pPCCODFON != null) {
				HashMap m = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSION(pPCCODFON);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_OB_FONPENSIONES return: " + m);
				formdata.put("FONPENSION", m.get("FONPENSION"));
				formdata.put("CCODFON", pPCCODFON);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen013Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();

		try {

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_lstvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista tipo de cuentas
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPCCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper014Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	public void m_grabar(HttpServletRequest request, Axispen013Action thisAction) {

		logger.debug("Axispen013Service m_grabar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("Axispen013Service m_grabar formdata: " + formdata);
		try {
			// Recuperem el camps
			BigDecimal pPCCODFON = getCampoNumerico(request, "CCODFON");
			Date pPFALTARE = stringToSqlDate(getCampoTextual(request, "FALTARE"));
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON ");
			Date pPFBAJARE = stringToSqlDate(getCampoTextual(request, "FBAJARE"));
			BigDecimal pPCCODGES = getCampoNumerico(request, "CCODGES");
			String pPCODDGS = getCampoTextual(request, "CODDGS");
			String pPCBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal pPCTIPBAN = getCampoNumerico(request, "CTIPBAN");

			// Guardem els canvis
			HashMap map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_SET_FONPENSIONES(pPCCODFON, pPFALTARE, pPSPERSON, null, pPFBAJARE,
							null, pPCCODGES, null, null, pPCODDGS, pPCBANCAR, pPCTIPBAN);
			logger.debug("ejecutaPAC_IAX_PENSIONES__F_SET_FONPENSIONES return: " + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("GRABAR_OK", "0");
				formdata.put("CCODFON", map.get("PCCODFON_OUT"));
			} else {
				formdata.put("GRABAR_OK", "1");
			}
			// Recuperem el cagente
			BigDecimal CAGENTE_SESSION = usuario.getCagente();
			formdata.put("CAGENTE_SESSION", CAGENTE_SESSION);

		} catch (Exception e) {
			logger.error("Error en el servicio Axipen013 Service - m�todo  m_grabar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
