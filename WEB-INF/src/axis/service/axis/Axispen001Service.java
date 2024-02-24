package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.axis.Axispen001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispen001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axispen001Action thisAction) {
		logger.debug("Axispen001Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			request.getSession().removeAttribute("AXIS_DEPOSITARIAS");
			request.getSession().removeAttribute("LISTAFONDOS");

			logger.debug("m_init");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axispen001Action thisAction) {
		logger.debug("Axispen001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Netejem llista sessi�
			request.getSession().removeAttribute("AXIS_DEPOSITARIAS");
			if (isEmpty(formdata.get("NCONTADOR"))) {
				formdata.put("NCONTADOR", 0);
				formdata.put("NCONTADORY", 0);
				formdata.put("NCONTADORX", 0);
			}
			logger.debug("Axispen001");
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de una pension depositaria, dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_depositarias(HttpServletRequest request, Axispen001Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String NOMDEP = getCampoTextual(request, "TNOMDEP");
			BigDecimal CCODDEP = getCampoNumerico(request, "CCODDEP");

			if (formdata.get("paginar") == null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PDEPOSITARIAS(null, null, CCODDEP, null, null,
						NOMDEP);
				logger.debug(map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista depositaries
				ArrayList listaDepositarias = (ArrayList<Map>) map.get("PDEPOSITARIAS");
				logger.debug(listaDepositarias);
				request.getSession().setAttribute("AXIS_DEPOSITARIAS", listaDepositarias);
				ArrayList listaFondos = new ArrayList();
				ArrayList listaPlan = new ArrayList();
				// Si la llista de dipositaries no es buida
				/*
				 * if(listaDepositarias.size()!=0){ //Preparem llista fondos listaFondos =
				 * (ArrayList)((HashMap)((HashMap)listaDepositarias.get(0)).get(
				 * "OB_IAX_PDEPOSITARIAS")).get("FONPENSIONES"); logger.debug(listaFondos); //Si
				 * la llista de fons no es buida if(listaFondos.size()!=0){ //Preparem llista
				 * planes listaPlan =
				 * (ArrayList)((HashMap)((HashMap)listaFondos.get(0)).get("OB_IAX_FONPENSIONES")
				 * ).get("PLANPENSIONES"); logger.debug(listaPlan); } }
				 * request.setAttribute("listaFondos",listaFondos);
				 * request.setAttribute("listaPlan",listaPlan);
				 */
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_busqueda_depositarias", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de las gestoras, los fondos, y los planes de pensi�n,
	 * dados los par�metros del formulario. Dichos par�metros pueden estar a null.
	 * Pone el resultado en una List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_cuerpo(HttpServletRequest request, Axispen001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Preparem llista fons amb el seu contador
			int NCONTADOR = ((BigDecimal) getCampoNumerico(request, "NCONTADOR")).intValue();
			ArrayList listaDepositarias = (ArrayList) request.getSession().getAttribute("AXIS_DEPOSITARIAS");
			int NCONTADORX = ((BigDecimal) getCampoNumerico(request, "NCONTADORX")).intValue();
			ArrayList listaFondos = new ArrayList();
			// listaFondos =
			// (ArrayList)((HashMap)((HashMap)listaDepositarias.get((int)0)).get("OB_IAX_PDEPOSITARIAS")).get("FONPENSIONES");
			listaFondos = (ArrayList) ((HashMap) ((HashMap) listaDepositarias.get(NCONTADOR))
					.get("OB_IAX_PDEPOSITARIAS")).get("FONPENSIONES");
			logger.debug(listaFondos);
			request.setAttribute("listaFondos", listaFondos);
			// Si la llista de fons no es buida
			if (listaFondos.size() != 0) {
				// Preparem llista plans amb el seu contador
				int NCONTADORY = ((BigDecimal) getCampoNumerico(request, "NCONTADORY")).intValue();
				ArrayList listaPlan = new ArrayList();
				listaPlan = (ArrayList) ((HashMap) ((HashMap) listaFondos.get((int) 0)).get("OB_IAX_FONPENSIONES"))
						.get("PLANPENSIONES");
				logger.debug(listaPlan);
				request.setAttribute("listaPlan", listaPlan);
			}

			formdata.put("NCONTADORX", 0);
			formdata.put("NCONTADORY", 0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_busqueda_cuerpo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de los fondos y planes de pensi�n, dados los par�metros
	 * del formulario. Dichos par�metros pueden estar a null. Pone el resultado en
	 * una List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_cuerpo_fondos(HttpServletRequest request, Axispen001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// BigDecimal CCODGES=getCampoNumerico(request, "CCODGES");

			// Preparem llista fons amb el seu contador
			int NCONTADOR = ((BigDecimal) getCampoNumerico(request, "NCONTADOR")).intValue();
			ArrayList listaDepositarias = (ArrayList) request.getSession().getAttribute("AXIS_DEPOSITARIAS");
			int NCONTADORX = ((BigDecimal) getCampoNumerico(request, "NCONTADORX")).intValue();
			ArrayList listaFondos = new ArrayList();
			listaFondos = (ArrayList) ((HashMap) ((HashMap) listaDepositarias.get((int) NCONTADORX))
					.get("OB_IAX_PDEPOSITARIAS")).get("FONPENSIONES");
			logger.debug(listaFondos);
			request.setAttribute("listaFondos", listaFondos);
			// Si la llista de fons no es buida
			if (listaFondos.size() != 0) {
				// Preparem llista plans amb el seu contador
				int NCONTADORY = ((BigDecimal) getCampoNumerico(request, "NCONTADORY")).intValue();
				ArrayList listaPlan = new ArrayList();
				listaPlan = (ArrayList) ((HashMap) ((HashMap) listaFondos.get((int) 0)).get("OB_IAX_FONPENSIONES"))
						.get("PLANPENSIONES");
				logger.debug(listaPlan);
				request.setAttribute("listaPlan", listaPlan);
			}

			formdata.put("NCONTADORY", 0);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_busqueda_cuerpo_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de los planes de pensi�n, dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_cuerpo_planes(HttpServletRequest request, Axispen001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// Preparem llista fons amb el seu contador
			int NCONTADOR = ((BigDecimal) getCampoNumerico(request, "NCONTADOR")).intValue();
			ArrayList listaDepositarias = (ArrayList) request.getSession().getAttribute("AXIS_DEPOSITARIAS");
			int NCONTADORX = ((BigDecimal) getCampoNumerico(request, "NCONTADORX")).intValue();
			ArrayList listaFondos = new ArrayList();
			listaFondos = (ArrayList) ((HashMap) ((HashMap) listaDepositarias.get((int) NCONTADORX))
					.get("OB_IAX_PDEPOSITARIAS")).get("FONPENSIONES");
			logger.debug(listaFondos);
			request.setAttribute("listaFondos", listaFondos);

			// Preparem llista plans amb el seu contador
			int NCONTADORY = ((BigDecimal) getCampoNumerico(request, "NCONTADORY")).intValue();
			ArrayList listaPlan = new ArrayList();
			listaPlan = (ArrayList) ((HashMap) ((HashMap) listaFondos.get((int) NCONTADORY)).get("OB_IAX_FONPENSIONES"))
					.get("PLANPENSIONES");
			logger.debug(listaPlan);
			request.setAttribute("listaPlan", listaPlan);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen001Service - m�todo m_busqueda_cuerpo_planes", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

}
