package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea030Service extends AxisBaseService {
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
		logger.debug("Axisrea030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Desplegables
		try {

			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea030Service.m_form", e);
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
		try {
			Map map_tipos = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL();
			List tipos = (List) tratarRETURNyMENSAJES(request, map_tipos, false);
			formdata.put("listaTipos", tipos);
			logger.debug(map_tipos);
			tipos = null;

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea030Service.cargarValoresDesplegables", e);
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
		logger.debug("Axisrea030Service m_ajax_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");

			Date FEFECTO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date FVENCIM = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FVENCIM"));

			BigDecimal CMODO = new BigDecimal("1"); // MODO ALTA

			// Map map_validacion =
			// pac_axis_rea.ejecutaPAC_IAX_REA__F_VALIDA_COD... //TODO: Ser� necesaria
			// validacion de las fuentes
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_COD_CLAUSULAS_REAS(CMODO, CCODIGO, CTIPO, FEFECTO,
					FVENCIM);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0) {
				Map mapa_desc = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_CLAUSULAS_REAS(CCODIGO, CIDIOMA, DESCRIPCION);
			}

			logger.debug(resultado + "******************************************************" + map);
			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea030Service - m�todo m_ajax_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
