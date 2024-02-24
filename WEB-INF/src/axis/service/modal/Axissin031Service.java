package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin031Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin031Service.java - Alta/Mod. Causas Estado Siniestro
 * 
 * @author <a href="mailto:lcalvo@csi-ti.com">Luz Calvo</a>
 */
public class Axissin031Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin031Action thisAction) {
		try {
			this.cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin031Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin031Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin031Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarDatos(HttpServletRequest request, Axissin031Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_lista = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_lista.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			ArrayList lista_idiomas = (ArrayList) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			request.setAttribute("lista_idiomas", lista_idiomas);
			request.getSession().setAttribute("lista_idiomas", lista_idiomas);

			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCESTSIN();
			logger.debug(m);
			listValores.put("lst_estados", tratarRETURNyMENSAJES(request, m));
			formdata.put("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin031Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			formdata.put("listValores", listValores);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public

			void m_guardar(HttpServletRequest request, Axissin031Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");

			ArrayList lista_idiomas = (ArrayList) request.getSession().getAttribute("lista_idiomas");

			if (lista_idiomas != null) {
				for (int i = 0; i < lista_idiomas.size(); i++) {

					HashMap mapa = (HashMap) lista_idiomas.get(i);
					BigDecimal numer = (BigDecimal) mapa.get("CIDIOMA");

					BigDecimal CIDIOMA = getCampoNumerico(request, "IDIOMA_" + numer.intValue());
					String TCAUEST = getCampoTextual(request, "DESCRIPCION_" + numer.intValue());
					if (TCAUEST != null && !TCAUEST.equals("")) {
						PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CAUSA(CCAUEST, CESTSIN, CIDIOMA,
								TCAUEST);
						BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
						logger.debug(map);

						if (resultado.intValue() == 0) {
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						}

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin031Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

	public

			void m_editar_causa(HttpServletRequest request, Axissin031Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");

			this.cargarDatos(request, thisAction);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAUSA(CCAUEST, CESTSIN);

			ArrayList lista_idiomas_rellenado = (ArrayList) tratarRETURNyMENSAJES(request, mapa);

			PAC_IAX_LISTVALORES pac_axis_lista = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_lista.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			ArrayList lista_idiomas_vacio = (ArrayList) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			/* Juntamos la informaci�n de una y otra lista */
			for (int i = 0; i < lista_idiomas_rellenado.size(); i++) {
				HashMap map_valores = (HashMap) lista_idiomas_rellenado.get(i);
				BigDecimal CIDIOMA_AUX = (BigDecimal) map_valores.get("CIDIOMA");
				String TCAUEST_AUX = (String) map_valores.get("TCAUEST");

				for (int j = 0; j < lista_idiomas_vacio.size(); j++) {
					HashMap map_valores_null = (HashMap) lista_idiomas_vacio.get(j);
					BigDecimal CIDIOMA_AUX_null = (BigDecimal) map_valores_null.get("CIDIOMA");
					if (CIDIOMA_AUX.intValue() == CIDIOMA_AUX_null.intValue()) {
						map_valores_null.put("TCAUEST", TCAUEST_AUX);
						// lista_idiomas_vacio.add(j,map_valores_null);
					}

				}

			}

			request.setAttribute("lista_idiomas", lista_idiomas_vacio);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin031Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.configForm(request, whoami(this));
		}
	}

}
