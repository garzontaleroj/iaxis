//Revision:# CEVYelgaXXMbRwZAcfKk4w== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AUTOLIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisage029Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

public class Axisage029Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisage029Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Rellena la combo de estado de liquidacion. para poder realizar una b�squeda
	 * nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisage029Action thisAction) {

		log.debug("Axisage029Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.getSession().removeAttribute("axisage029_listaLiquidaciones");
			request.getSession().removeAttribute("axisage_tagente");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map estado_liquida = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(32001));
			log.debug("estado_de_liquidacion: " + estado_liquida);
			List estadoLiquida = (List) tratarRETURNyMENSAJES(request, estado_liquida);
			request.getSession().setAttribute("ESTADO_LIQUIDA", estadoLiquida);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un como minimo un parametro de entrada, ejecuta la consulta de b�squeda
	 * de Autoliquidaciones, y devuelve el resultado en el atributo de sesi�n
	 * axisage029_listaLiquidaciones.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda(HttpServletRequest request, Axisage029Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar datos a buscar
			BigDecimal SPROLIQ = getCampoNumerico(request, "SPROLIQ");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			Date FLIQUIDA = stringToSqlDate(getCampoTextual(request, "FLIQUIDA"));
			BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CUSUARIO = getCampoTextual(request, "CUSUARIO");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			Date FCOBRO = stringToSqlDate(getCampoTextual(request, "FCOBRO"));

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisage029_listaLiquidaciones");

				PAC_IAX_AUTOLIQUIDA pacIaxAutoliquida = new PAC_IAX_AUTOLIQUIDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map liquidacionesMap = pacIaxAutoliquida.ejecutaPAC_IAX_AUTOLIQUIDA__F_GET_AUTOLIQUIDACIONES(SPROLIQ,
						CEMPRES, FLIQUIDA, IIMPORTE, CAGENTE, CUSUARIO, CESTADO, FCOBRO);
				log.debug("Lista_Liquidaciones:" + liquidacionesMap);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, liquidacionesMap)).intValue() == 0) {
					List LISTA_LIQUIDA = (List) liquidacionesMap.get("PCURLIQUIDA");
					request.getSession().setAttribute("axisage029_listaLiquidaciones", LISTA_LIQUIDA);
				}

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Procesa la �ltima versi�n activa del convenio (suplemento masivo de cambio de
	 * versi�n para el convenio). Llamamos a PAC_ CONVENIOS_EMP.
	 * F_PROCESO_CAMB_VERSCON(convenio pantalla) en modo diferido.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_aceptar(HttpServletRequest request, Axisage029Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal fileProces = null;

		try {

			String TCODCONV = getCampoTextual(request, "TCODCONV");
			String TDESCRI = getCampoTextual(request, "TDESCRI");

			if (formdata.get("paginar") == null) {

				/*
				 * HashMap proceso=null; proceso = new
				 * PAC_IAX_CONVENIOS_EMP((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_CONVENIOS_EMP__F_PROCESO_CAMB_VERSCON(TCODCONV,
				 * usuario.getCidioma()); log.debug(proceso); formdata.put("RSLTVERSION",
				 * tratarRETURNyMENSAJES(request, proceso, false));
				 * request.getSession().setAttribute("RSLTVERSION", proceso );
				 * 
				 * if (proceso.get("RETURN").equals(new BigDecimal(0))){
				 * request.getSession().removeAttribute("axisage029_listaConvenios" ); String
				 * literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(),
				 * "111313"); thisAction. guardarMensaje(request, "verbatim:" + literal + ": " +
				 * proceso.get("PSPROCES"), null, Constantes.MENSAJE_INFO); }
				 */

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		log.info("Axisage029Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			log.error("Error en el servicio Axisage029Service - m�todo m_ajax_actualizar_agente", e);
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
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			log.debug("actualizar_agente:" + mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisage_tagente", agente.get("NOMBRE"));

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
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisage_tagente", agente.get("NOMBRE"));
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			log.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
