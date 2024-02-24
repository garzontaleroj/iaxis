package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea033Service extends AxisBaseService {
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
		logger.debug("Axisrea033Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		// Desplegables
		try {

			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea033Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	private

			void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
					throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea033Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos TRAMOS a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public

			void m_ajax_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea033Service m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			BigDecimal LIM_INF = getCampoNumerico(request, "LIM_INF");
			BigDecimal LIM_SUP = getCampoNumerico(request, "LIM_SUP");
			BigDecimal PCTPART = getCampoNumerico(request, "PCTPART");
			BigDecimal PCTMIN = getCampoNumerico(request, "PCTMIN");
			BigDecimal PCTMAX = getCampoNumerico(request, "PCTMAX");
			String MODO = getCampoTextual(request, "MODO") + "";

			BigDecimal CMODO = null;
			if (MODO.equals("ALTA")) {
				CMODO = new BigDecimal("1");
			} else {
				CMODO = new BigDecimal("2");
			}

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_CLAUSULAS_REAS_DET(CMODO, CCODIGO, CTRAMO, LIM_INF,
					LIM_SUP, PCTPART, PCTMIN, PCTMAX);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(resultado + "******************************************************" + map);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea033Service - m�todo m_ajax_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
