package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin030Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axissin030Service.java - Causas Estado Siniestro
 * 
 * @author <a href="mailto:lcalvo@csi-ti.com"Luz Calvo</a>
 */

public class Axissin030Service extends AxisBaseService {

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axissin030Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la p�liza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin030Action thisAction) {

		logger.debug("Axissin030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			HashMap recarga_pantalla = (HashMap) request.getSession().getAttribute("recarga_pantalla");

			if (recarga_pantalla != null) {

				BigDecimal CCAUEST_SEARCH = (BigDecimal) recarga_pantalla.get("CCAUEST_SEARCH");
				BigDecimal CESTSIN_SEARCH = (BigDecimal) recarga_pantalla.get("CESTSIN_SEARCH");
				String TCAUEST_SEARCH = (String) recarga_pantalla.get("TCAUEST_SEARCH");

				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map mapa = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSAS(CCAUEST_SEARCH, CESTSIN_SEARCH,
						TCAUEST_SEARCH);
				ArrayList lista_causas = (ArrayList) tratarRETURNyMENSAJES(request, mapa);

				request.setAttribute("lista_causas", lista_causas);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin030Service - m�todo m_form", e);
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
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axissin030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
		BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
		String TCAUEST = getCampoTextual(request, "TCAUEST"); // Siempre ser� null - El campo se oculta en pantala

		HashMap recarga_pantalla = new HashMap();
		recarga_pantalla.put("CCAUEST_SEARCH", CCAUEST);
		recarga_pantalla.put("CESTSIN_SEARCH", CESTSIN);
		recarga_pantalla.put("TCAUEST_SEARCH", TCAUEST);
		request.getSession().setAttribute("recarga_pantalla", recarga_pantalla);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// if(CCAUEST!=null){
			Map mapa = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSAS(CCAUEST, CESTSIN, TCAUEST);
			ArrayList lista_causas = (ArrayList) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("lista_causas", lista_causas);
			// }
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin030Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");

			// request.setAttribute("lista_causas",lista_causas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin030Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_borrar_causa(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CAUSA(CCAUEST, CESTSIN);
			BigDecimal lista_causas = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin030Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	private Map dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA DATOS SINIESTRO AXISSIN030 ---------------------------------------->" + map);
		return map;

	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		Date FECHA_ACTUAL = new Date(today.getTime());
		return FECHA_ACTUAL;

	}

}
