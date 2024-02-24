package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.axis.Axispen004Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispen004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axispen004Action thisAction) {
		logger.debug("Axispen004Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			request.getSession().removeAttribute("AXIS_PLANES");
			logger.debug("m_init");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axispen004Action thisAction) {
		logger.debug("Axispen004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("AXIS_PLANES");
			if (isEmpty(formdata.get("NCONTADOR")))
				formdata.put("NCONTADOR", 0);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_form", e);
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
	 * Realiza la b�squeda de planes de pensi�n , dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_planes(HttpServletRequest request, Axispen004Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
			if (CCODPLA != null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(null, null, null, null, null,
						CCODPLA);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES return: " + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map, true))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores

				ArrayList listaPlan = (ArrayList<Map>) map.get("PLANPENSIONES");
				logger.debug(listaPlan);
				formdata.put("AXIS_PLANES", listaPlan);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de planes de pensi�n , dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrado_planes(HttpServletRequest request, Axispen004Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCODPLA = getCampoNumerico(request, "codig");

			if (formdata.get("paginar") == null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_DEL_PLANPENSIONES(CCODPLA);

				logger.debug(map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores
				formdata.put("okk", "okk");
				ArrayList listaPlan = (ArrayList<Map>) map.get("PLANPENSIONES");
				logger.debug(listaPlan);
				request.getSession().setAttribute("AXIS_PLANES", listaPlan);
				request.setAttribute("listaPlan", listaPlan);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza la b�squeda de los fondos de pensi�n, dados los par�metros del
	 * formulario. Dichos par�metros pueden estar a null. Pone el resultado en una
	 * List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_cuerpo(HttpServletRequest request, Axispen004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen004Service - m�todo m_busqueda_cuerpo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
