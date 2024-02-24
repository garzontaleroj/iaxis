package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea031Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea031Service.java : Modificaci�n detalle reaseguro clausulas/tramos
 * escalonados 11/08/2011
 * 
 * @since Java 5.0
 */
public class Axisrea031Service extends AxisBaseService {
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
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			try {

				BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO_MOD");
				formdata.clear(); // Limpiamos los valores existentes en el formdata
				formdata.put("PROCEDE", "AXISCTR031");
				formdata.put("CCODIGO", CCODIGO);

				this.m_obtener_combos(request);

				if (!isEmpty(CCODIGO)) {
					Map map_obj_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_REA__F_GET_OBJETO_CLAUSULAS_REAS(CCODIGO);
					tratarRETURNyMENSAJES(request, map_obj_rea);

					formdata.putAll(map_obj_rea);
					logger.debug(map_obj_rea);
				}

			} catch (Exception e) {
				logger.error("Error en el servicio Axisrea031Service - m�todo m_form", e);
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea031Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea031Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map_tipos = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL();
			List tipos = (List) tratarRETURNyMENSAJES(request, map_tipos, false);
			formdata.put("listaTipos", tipos);
			logger.debug(map_tipos);
			tipos = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea031Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_recargar(HttpServletRequest request, Axisrea031Action thisAction) {
		logger.debug("Axisrea031Service m_recargar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			formdata.clear(); // Limpiamos los valores existentes en el formdata
			formdata.put("CCODIGO", CCODIGO);

			this.m_obtener_combos(request);

			Map map_obj_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_OBJETO_CLAUSULAS_REAS(CCODIGO);

			tratarRETURNyMENSAJES(request, map_obj_rea);

			formdata.putAll(map_obj_rea);
			logger.debug(map_obj_rea);

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea031Service - m�todo m_recragar", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrar_desc(HttpServletRequest request, Axisrea031Action thisAction) {
		logger.debug("Axisrea031Service m_recargar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO_DEL");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA_DEL");
			formdata.remove("CCODIGO");
			formdata.put("CCODIGO", CCODIGO);
			Map map = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_DEL_CLAUSULAS_REAS(CCODIGO, CIDIOMA);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea031Service - m�todo m_borrar_desc", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrar_tramo(HttpServletRequest request, Axisrea031Action thisAction) {
		logger.debug("Axisrea031Service m_recargar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO_DEL");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO_DEL");
			formdata.remove("CCODIGO");
			formdata.put("CCODIGO", CCODIGO);
			Map map = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_DEL_CLAUSULAS_REAS_DET(CCODIGO, CTRAMO);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea031Service - m�todo m_borrar_tramo", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisrea031Action thisAction) {
		logger.debug("Axisrea031Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			String TCONAGR = getCampoTextual(request, "TCONAGR");

			Map map_con_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_CONTRATOSAGR(SCONAGR, CIDIOMA, TCONAGR);
			List listaConRea = (List) tratarRETURNyMENSAJES(request, map_con_rea, false);
			formdata.put("listaConRea", listaConRea);
			logger.debug(map_con_rea);
			listaConRea = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea031Service - m�todo m_buscar", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar_contrato(HttpServletRequest request, Axisrea031Action thisAction) {
		logger.debug("Axisctr031Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

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

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_COD_CLAUSULAS_REAS(CMODO, CCODIGO, CTIPO, FEFECTO,
					FVENCIM);

			tratarRETURNyMENSAJES(request, map);

			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea031Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisarea031Service m_ajax_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			Map map = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea031Service - m�todo m_ajax_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

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
		try {

			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */
			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");

			Date FEFECTO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date FVENCIM = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FVENCIM"));

			BigDecimal CMODO = new BigDecimal("2"); // MODO MODIFICACION

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
			logger.error("Error en el servicio Axisrea033Service - m�todo m_ajax_grabar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
