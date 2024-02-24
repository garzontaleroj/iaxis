package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ESC_RIESGO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm104Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm104Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisadm104Action thisAction) {
		logger.debug("Axisadm104Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CMODO = getCampoTextual(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new String(request.getParameter("CAGENTE"));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			formdata.put("CMODO", CMODO);

			BigDecimal CESCRIE = getCampoNumerico(request, "CESCRIE");
			if (CESCRIE == null) {
				try {
					CESCRIE = new BigDecimal(String.valueOf(request.getParameter("CESCRIE")));
				} catch (Exception ex) {
					CESCRIE = null;
				}
			}
			formdata.put("CESVALOR", CESCRIE);

			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
			if (NDESDE == null) {
				try {
					NDESDE = new BigDecimal(String.valueOf(request.getParameter("NDESDE")));
				} catch (Exception ex) {
					NDESDE = null;
				}
			}
			formdata.put("NDESDE", NDESDE);

			BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
			if (NHASTA == null) {
				try {
					NHASTA = new BigDecimal(String.valueOf(request.getParameter("NHASTA")));
				} catch (Exception ex) {
					NHASTA = null;
				}
			}
			formdata.put("NHASTA", NHASTA);

			String INDICAD = getCampoTextual(request, "INDICAD");
			if (INDICAD == null) {
				try {
					INDICAD = String.valueOf(request.getParameter("INDICAD"));
				} catch (Exception ex) {
					INDICAD = null;
				}
			}
			formdata.put("INDICAD", INDICAD);

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);
			/* m_buscar */

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm104Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que almacena los datos de la escala de riesgo
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisadm104Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic002Service m_aceptar");

		try {

			BigDecimal CESCRIE = getCampoNumerico(request, "CESVALOR");
			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
			BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
			String INDICAD = getCampoTextual(request, "INDICAD");

			PAC_IAX_ESC_RIESGO pac_iax_esc_riesgo = new PAC_IAX_ESC_RIESGO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_esc_riesgo.ejecutaPAC_IAX_ESC_RIESGO__F_GRABAR_ESCALA_RIESGO(CESCRIE, NDESDE, NHASTA,
					INDICAD);

			logger.debug(map);

			request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista de valores
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001184));
			logger.debug(map);
			listValores.put("lstEscalaDeRiesgo", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm104Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}
}
