package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper019Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper019Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NANOmarcat = getCampoNumerico(request, "NANOmarcat");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper019Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

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

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Lista tipo de cuentas

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTGRADOMINUSVALIA();
			logger.debug(map);
			listValores.put("lstgraumin", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper019Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos descendientes a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper019Service m_grabarIrpfDesc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NANOmarcat = getCampoNumerico(request, "NANOmarcat");
			java.sql.Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
			java.sql.Date FADOPCION = stringToSqlDate(getCampoTextual(request, "FADOPCION"));
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CGRADO = getCampoNumerico(request, "CGRADO");
			BigDecimal CENTER = getCampoNumerico(request, "CENTER");

			if (CENTER == null)
				CENTER = new BigDecimal(0);

			// quitamos los guiones en todos los casos
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_OBJETOIRPFDESCEN(SPERSON, CAGENTE, NANOmarcat,
					NORDEN, FNACIMI, FADOPCION, CGRADO, CENTER);
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				logger.debug(map);
				request.setAttribute("grabarOK", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper019Service.m_grabarIrpfDesc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
