package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.axis.Axispen005Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispen005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axispen005Action thisAction) {
		logger.debug("Axispen005Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			if (isEmpty(formdata.get("NCONTADOR")))
				formdata.put("NCONTADOR", 0);
			request.getSession().removeAttribute("AXIS_PROMO");
			logger.debug("m_init");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen005Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axispen005Action thisAction) {
		logger.debug("Axispen005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("AXIS_PROMO");

			logger.debug("Axispen005");

			if (isEmpty(formdata.get("NCONTADOR")))
				formdata.put("NCONTADOR", 0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen005Service - m�todo m_form", e);
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
	 * Realiza la b�squeda de promotores, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_promotors(HttpServletRequest request, Axispen005Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if (formdata.get("paginar") == null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PROMOTORES(CRAMO, SPRODUC, NPOLIZA, CCODPLA,
						CTIPIDE, NNUMIDE, SPERSON);

				logger.debug(map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de promotors
				ArrayList listaPromotors = (ArrayList<Map>) map.get("PROMOTORES");
				logger.debug(listaPromotors);
				request.getSession().setAttribute("AXIS_PROMO", listaPromotors);
				request.setAttribute("listaPromotors", listaPromotors);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen005Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
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
	public void m_busqueda_cuerpo(HttpServletRequest request, Axispen005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen005Service - m�todo m_busqueda_cuerpo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	/**
	 * Borra un promotor
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrar_promotor(HttpServletRequest request, Axispen005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal PCCODPLA = getCampoNumerico(request, "CCODPLAN");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_DEL_PROMOTORES(PCCODPLA, PSPERSON);
			logger.debug("----> borramos promotor:" + map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen005Service - m�todo m_borrar_promotor", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

}
