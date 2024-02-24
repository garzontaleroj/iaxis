package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_DIRECCIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisdir001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisdir001Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisdir001Action thisAction) {
		logger.debug("Axisdir001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// request.getSession().removeAttribute("resultats");
			PAC_IAX_DIRECCIONES pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDFINCA = getCampoNumerico(request, "IDFINCA");
			formdata.put("IDFINCA", IDFINCA);
			logger.debug("--> IDFINCA:" + IDFINCA);
			Map m = null;
			if (!isEmpty(IDFINCA)) {
				m = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCA(IDFINCA);
				List d = (List) tratarRETURNyMENSAJES(request, m);
				logger.debug("---> finca:" + d);
				if (!isEmpty(d)) {
					Map finca = (Map) d.get(0);
					formdata.put("CPOSTAL", finca.get("CPOSTAL"));
					formdata.put("CPAIS", finca.get("CPAIS"));
					formdata.put("TPAIS", finca.get("TPAIS"));
					formdata.put("CPROVIN", finca.get("CPROVIN"));
					formdata.put("TPROVIN", finca.get("TPROVIN"));
					formdata.put("CPOBLAC", finca.get("CPOBLAC"));
					formdata.put("TPOBLAC", finca.get("TPOBLAC"));
					formdata.put("IDLOCAL", finca.get("IDLOCAL"));
					formdata.put("TLOCALIDAD", finca.get("TLOCALI"));
				} else {
					m = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_FINCAMEN(IDFINCA);
					tratarRETURNyMENSAJES(request, m);
					Map finca = (Map) m.get("RETURN");
					logger.debug("fin en men:" + finca);
					formdata.put("CPOSTAL", finca.get("CPOSTALFIN"));
					formdata.put("CPAIS", finca.get("CPAISFIN"));
					formdata.put("TPAIS", finca.get("TPAISFIN"));
					formdata.put("CPROVIN", finca.get("CPROVINFIN"));
					formdata.put("TPROVIN", finca.get("TPROVINFIN"));
					formdata.put("CPOBLAC", finca.get("CPOBLACFIN"));
					formdata.put("TPOBLAC", finca.get("TPOBLACFIN"));
					formdata.put("IDLOCAL", finca.get("IDLOCAL"));
					formdata.put("TLOCALIDAD", finca.get("TLOCALIFIN"));
				}
			}

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisdir001Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

			void cargarValoresDesplegables(HttpServletRequest request, Axisdir001Action thisAction, UsuarioBean usuario,
					Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_DIRECCIONES pac_axis_listValoresDirecciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (isEmpty(formdata.get("listValores"))) {
				// Tipos Vias
				Map map = pac_axis_listValoresDirecciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_TIPOSVIAS();
				logger.debug(map);
				listValores.put("tipVias", (List) tratarRETURNyMENSAJES(request, map));

				// Tipos fincas
				map = pac_axis_listValoresDirecciones.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOSFINCAS();
				logger.debug(map);
				listValores.put("tipFincas", (List) tratarRETURNyMENSAJES(request, map));

				logger.debug("[DEBUG] [Axisper001Service] Sale de la carga de listados");

			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisdir001Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(formdata.get("listValores"))) {
				formdata.put("listValores", listValores);
			}
		}
	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */

	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axisdir001Service m_ajax_getProvinPobla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");

			if (!isEmpty(CPOSTAL)) {
				CPOSTAL = CPOSTAL.toUpperCase();
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLA(CPOSTAL);
				if (!isEmpty(map) && (new BigDecimal(0).equals(ajax.rellenarPlAContenedorAjax(map))
						|| new BigDecimal(2).equals(ajax.rellenarPlAContenedorAjax(map)))) {
					Map direccion = new HashMap();
					direccion.putAll(map);
					formdata.putAll(map);
					ajax.guardarContenidoFinalAContenedorAjax(direccion);
				}
				logger.debug(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdir001Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axisdir001Action thisAction) {
		logger.debug("Axisdir001Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");
			BigDecimal IDLOCAL = this.getCampoNumerico(request, "IDLOCAL");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DIRECCIONES pac_iax_direcciones = new PAC_IAX_DIRECCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS")) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					formdata.put("CPROVIN", CPROVIN);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					provincia.put("TPROVIN", map.get("RETURN"));
					formdata.put("CPROVIN", CPROVIN);
					formdata.put("TPROVIN", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					formdata.put("CPROVIN", CPROVIN);
					provincia.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLAC")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("IDLOCAL")) {
				Map map = pac_iax_direcciones.ejecutaPAC_IAX_DIRECCIONES__F_GET_LOCALIDAD(IDLOCAL);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("PTLOCALI")) && !"**".equals((String) map.get("PTLOCALI"))) {
					Map localidad = new HashMap();
					localidad.put("IDLOCAL", IDLOCAL);
					localidad.put("TLOCALI", map.get("PTLOCALI"));
					formdata.put("IDLOCAL", IDLOCAL);
					formdata.put("TLOCALI", map.get("PTLOCALI"));
					ajax.guardarContenidoFinalAContenedorAjax(localidad);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map localidad = new HashMap();
					localidad.put("IDLOCAL", IDLOCAL);
					formdata.put("IDLOCAL", IDLOCAL);
					localidad.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(localidad);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdir001Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
