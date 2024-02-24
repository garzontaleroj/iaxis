package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISI_APR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr067Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr067Service.java 16/12/2009
 * 
 * @since Java 5.0
 */
public class Axisctr067Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr067Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			/*
			 * Date DESDE = stringToSqlDate(getCampoTextual(request, "FEFEINI")); Date HASTA
			 * = stringToSqlDate(getCampoTextual(request, "FEFEFIN")); BigDecimal CAGENTE =
			 * getCampoNumerico(request, "CAGENTE"); PAC_IAX_COMISI_APR pacIaxComisiApr =
			 * new PAC_IAX_COMISI_APR((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * Map map =
			 * pacIaxComisiApr.ejecutaPAC_IAX_COMISI_APR__F_OBTENER_POLIZAS(CAGENTE,null,
			 * null,null,DESDE,HASTA); logger.debug(map);
			 * request.setAttribute("T_IAX_CESIONESREA", tratarRETURNyMENSAJES(request,
			 * map));
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr067Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));
	}

	/**
	 * Realiza la b�squeda de polizas, dados los par�metros del formulario. Dichos
	 * par�metros pueden estar a null. Pone el resultado en una List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_polices(HttpServletRequest request, Axisctr067Action thisAction) {
		// Recuperar p�lizas de comisiones
		// request.getSession().removeAttribute("AXIS_DEPOSITARIAS");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("listaPolizas");
			Date DESDE = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date HASTA = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			PAC_IAX_COMISI_APR pacIaxComisiApr = new PAC_IAX_COMISI_APR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxComisiApr.ejecutaPAC_IAX_COMISI_APR__F_OBTENER_POLIZAS(CAGENTE, null, null, null, DESDE,
					HASTA);
			logger.debug(map);
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}

			ArrayList listaPolizas = (ArrayList<Map>) map.get("P_REFCURSOR");
			logger.debug(listaPolizas);
			request.getSession().setAttribute("listaPolizas", listaPolizas);

			if (listaPolizas.size() != 0) {
				Map mapComisions = pacIaxComisiApr.ejecutaPAC_IAX_COMISI_APR__F_OBTENER_COMISIONES(
						(BigDecimal) ((HashMap) listaPolizas.get(0)).get("SSEGURO"));
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, mapComisions))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				ArrayList listaComisions = (ArrayList<Map>) mapComisions.get("P_REFCURSOR");
				logger.debug(listaComisions);
				request.setAttribute("listaComisions", listaComisions);
				// request.setAttribute("NPOLIZA",(BigDecimal)((HashMap)listaPolizas.get(0)).get("NPOLIZA"));
				formdata.put("NPOLIZA", (BigDecimal) ((HashMap) listaPolizas.get(0)).get("NPOLIZA"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr067Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de comisiones de las p�lizas, dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_comissions(HttpServletRequest request, Axisctr067Action thisAction) {
		// Recuperar comisiones de p�liza
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_COMISI_APR pacIaxComisiApr = new PAC_IAX_COMISI_APR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			Map mapComisions = pacIaxComisiApr.ejecutaPAC_IAX_COMISI_APR__F_OBTENER_COMISIONES(SSEGURO);
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, mapComisions))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}
			ArrayList listaComisions = (ArrayList<Map>) mapComisions.get("P_REFCURSOR");
			logger.debug(listaComisions);
			request.setAttribute("listaComisions", listaComisions);

			formdata.put("NPOLIZA", (BigDecimal) getCampoNumerico(request, "NPOLIZA"));
			// request.setAttribute("NPOLIZA",(BigDecimal)getCampoNumerico(request,
			// "NPOLIZA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr067Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

}
