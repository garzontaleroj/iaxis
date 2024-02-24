package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CORRETAJE;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr176Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr176Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr176Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr176Action thisAction) {
		logger.debug("Axisctr176Service m_init");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + map1);
			tratarRETURNyMENSAJES(request, map1);
			Map OB_IAX_GENPOLIZA = (Map) map1.get("RETURN");
			logger.debug(OB_IAX_GENPOLIZA);

			BigDecimal CAGENTE = (BigDecimal) OB_IAX_GENPOLIZA.get("CAGENTE");
			BigDecimal hayCorretaje = getCampoNumerico(request, "hayCorretaje");
			logger.debug("CAGENTE: " + CAGENTE + ", hayCorretaje: " + hayCorretaje);

			if (!isEmpty(hayCorretaje))
				if (hayCorretaje.equals(new BigDecimal(0)))
					formdata.put("CAGENTE", CAGENTE);

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr176Action thisAction) {
		logger.debug("Axisctr176Service m_form");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String MODO = getCampoTextual(request, "CMODO");
			formdata.put("CMODO", MODO);
			logger.debug(MODO + " " + CAGENTE);

			if (MODO.equals("MODIFICAR")) {
				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_CORRETAJE(CAGENTE);
				logger.debug(map);
				Map ob_corretaje = (Map) tratarRETURNyMENSAJES(request, map);
				formdata.put("axisctr_corretaje", ob_corretaje);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisctr176Action thisAction) {
		logger.debug("Axisctr176Service m_aceptar");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;

			String PMODO = getCampoTextual(request, "CMODO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal CPARTICI = getCampoNumerico(request, "CPARTICI");
			BigDecimal LIDER = getCampoNumerico(request, "CLIDER");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			logger.debug("VARIABLES: " + PMODO + "-" + CAGENTE + "-" + CCOMISI + "-" + CPARTICI + "-" + LIDER + "-"
					+ NORDEN);

			if (PMODO.equals("NUEVO")) {
				// funci�n PAC_IAX_PRODUCCION--F_GRABACORRETAJE
				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GRABACORRETAJE(CAGENTE, CCOMISI, CPARTICI, LIDER);
			} else {
				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_MODIFCORRETAJE(CAGENTE, CCOMISI, CPARTICI, LIDER, NORDEN);
			}

			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else {
				formdata.put("OK", new BigDecimal(1));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr176Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_CORRETAJE pacIaxCorretaje = new PAC_IAX_CORRETAJE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CPARTICI = getCampoNumerico(request, "CPARTICI");

			if (isEmpty(CPARTICI))
				CPARTICI = new BigDecimal(0);

			Map m = (Map) this.ActualizaAgente(request, CAGENTE);

			if (!isEmpty(m.get("RETURN"))) {
				List agentes = (List) m.get("RETURN");
				Map def = ((Map) agentes.get(0));
				BigDecimal CAGENTE2 = (BigDecimal) ((Map) agentes.get(0)).get("CODI");
				Map map = pacIaxCorretaje.ejecutaPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(CAGENTE2, NRIESGO,
						CPARTICI);
				logger.debug("GET_DATOS_AGENTE" + map);
				Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
						new String[] { "PPCOMISI", "PPRETENC" });
				if (resultadoAjax[0].equals(new BigDecimal(0))) {
					Map OCOMISI = new HashMap();
					OCOMISI.put("PPCOMISI", resultadoAjax[1]);
					Map ORETENC = new HashMap();
					ORETENC.put("PPRETENC", resultadoAjax[2]);
					BigDecimal PPCOMISI = (BigDecimal) OCOMISI.get("PPCOMISI");
					BigDecimal PPRETENC = (BigDecimal) OCOMISI.get("PPRETENC");
					def.put("OCOMISI", PPCOMISI);
					def.put("ORETENC", PPRETENC);
					logger.debug("DEF:" + def);
				}
			}
			logger.debug("AGENTES:" + m);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		String CONDICION = "CORRETAJE_TODOS_TIPAGE_4";

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_CORRETAJE pacIaxCorretaje = new PAC_IAX_CORRETAJE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CODI = getCampoTextual(request, "CODI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CPARTICI = getCampoNumerico(request, "CPARTICI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					BigDecimal CAGENTE = (BigDecimal) agente.get("CODI");
					Map map = pacIaxCorretaje.ejecutaPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(CAGENTE, NRIESGO,
							CPARTICI);
					logger.debug("GET_DATOS_AGENTE" + map);

					Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
							new String[] { "PPCOMISI", "PPRETENC" });
					if (resultadoAjax[0].equals(new BigDecimal(0))) {
						Map OCOMISI = new HashMap();
						OCOMISI.put("PPCOMISI", resultadoAjax[1]);
						Map ORETENC = new HashMap();
						ORETENC.put("PPRETENC", resultadoAjax[2]);
						BigDecimal PPCOMISI = (BigDecimal) OCOMISI.get("PPCOMISI");
						BigDecimal PPRETENC = (BigDecimal) OCOMISI.get("PPRETENC");
						agente.put("OCOMISI", PPCOMISI);
						agente.put("ORETENC", PPRETENC);
						logger.debug("AGENTES:" + agente);
					}

					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_calcular_comision(HttpServletRequest request) {
		logger.debug("Axisctr176Service m_ajax_calcular_comision");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_CORRETAJE pacIaxCorretaje = new PAC_IAX_CORRETAJE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CPARTICI = getCampoNumerico(request, "CPARTICI");

			if (isEmpty(CPARTICI))
				CPARTICI = new BigDecimal(0);

			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			if (!isEmpty(m.get("RETURN"))) {
				List agentes = (List) m.get("RETURN");
				Map def = ((Map) agentes.get(0));
				Map map = pacIaxCorretaje.ejecutaPAC_IAX_CORRETAJE__F_CALCULAR_COMISION_CORRETAJE(CAGENTE, NRIESGO,
						CPARTICI);
				logger.debug("GET_DATOS_AGENTE" + map);
				Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
						new String[] { "PPCOMISI", "PPRETENC" });
				if (resultadoAjax[0].equals(new BigDecimal(0))) {
					Map OCOMISI = new HashMap();
					OCOMISI.put("PPCOMISI", resultadoAjax[1]);
					Map ORETENC = new HashMap();
					ORETENC.put("PPRETENC", resultadoAjax[2]);
					BigDecimal PPCOMISI = (BigDecimal) OCOMISI.get("PPCOMISI");
					BigDecimal PPRETENC = (BigDecimal) OCOMISI.get("PPRETENC");
					def.put("OCOMISI", PPCOMISI);
					def.put("ORETENC", PPRETENC);
					logger.debug("DEF:" + def);
				}
			}

			logger.debug("AGENTES:" + m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr176Service - m�todo m_ajax_calcular_comision", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
