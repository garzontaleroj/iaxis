package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LIQUIDACOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr078Service.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr078Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr078Service m_form");
		try {
			this.cargarCombos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr078Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaAgente(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Cargar Agente de la BD
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();
		String CONDICION = this.getCampoTextual(request, "CONDICION");
		HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, (BigDecimal) (mapCX.get("RETURN")),
						new BigDecimal(1), CONDICION);
		Map agente = new HashMap();
		logger.debug("agentes --> " + map);
		if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
			List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
			agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
		}
		formdata.put("axisctr_agente", agente);

	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		formdata.put("axisctr_agente", agente);

		return mapAgentes;
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisctr078Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		List LSTRECIBOS = null;
		try {
			// Limpiamos el sproliq
			formdata.put("SPROLIQ_", null);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES) && !isEmpty(request.getAttribute("CEMPRES")))
				CEMPRES = new BigDecimal(String.valueOf(request.getAttribute("CEMPRES")));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NMES = getCampoNumerico(request, "NMES");
			BigDecimal NANO = getCampoNumerico(request, "NANO");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			String NRECIBOCIA = getCampoTextual(request, "NRECIBOCIA");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NPOLIZACIA = getCampoTextual(request, "NPOLIZACIA");
			Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
			Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
			Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			Date FCOBINI = stringToSqlDate(getCampoTextual(request, "FCOBINI"));
			Date FCOBFIN = stringToSqlDate(getCampoTextual(request, "FCOBFIN"));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			PAC_IAX_LIQUIDACOR pac_iax_liquidacor = new PAC_IAX_LIQUIDACOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_liquidacor.ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA_CAB(CEMPRES, SPRODUC, SPROCES, NMES,
					NANO, CESTADO, NPOLIZA, NPOLIZACIA, NRECIBO, NRECIBOCIA, CCOMPANI, CAGENTE, FEMISIOINI, FEMISIOFIN,
					FEFEINI, FEFEFIN, FCOBINI, FCOBFIN);
			logger.debug("ejecutaPAC_IAX_LIQUIDACOR__F_GET_LIQUIDA devuelve: " + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				if (!this.isEmpty(map.get("PT_LIQUIDA"))) {
					LSTRECIBOS = (List<Map>) map.get("PT_LIQUIDA");
				}
			}
			if (isEmpty(LSTRECIBOS)) {
				// No se han encontrado datos
				AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);
			} else {
				formdata.put("LSTLIQUIDACIONES", isEmpty(LSTRECIBOS) ? new ArrayList() : LSTRECIBOS);
			}
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr078Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarCombos(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		/* LISTVALORES */
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map LISTVALORES = new HashMap();
		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		logger.debug(map);
		LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map));
		Map m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("EMPRESADEF");
		BigDecimal CEMPRESA = (BigDecimal) ((getCampoNumerico(request, "CEMPRES") == null) ? m.get("RETURN")
				: getCampoNumerico(request, "CEMPRES"));
		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRESA, null);
		logger.debug(map);
		LISTVALORES.put("LSTPRODUCTOS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
		formdata.put("LISTVALORES", LISTVALORES);
		// Recuperem els mesos
		Map mapMesos = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
		logger.debug("PAC_IAX_LISTVALORES__F_GET_LSTMESES devuelve: " + mapMesos);
		formdata.put("LSTMESESCARTERA2", tratarRETURNyMENSAJES(request, mapMesos));
		// Recuperem el combo d'estats de la liquidacio
		Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("800030"));
		List estados = (List) tratarRETURNyMENSAJES(request, map3);
		logger.debug("PAC_IAX_LISTVALORES__F_DETVALORES devuelve: " + estados);
		formdata.put("LSESTADOS", estados);
		// Recuperamos las empresas
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias);
		formdata.put("CIAS", listacias);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr078Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr078Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr078Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
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
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");
			logger.debug("Buixa: " + request.getSession().getAttribute("axisctr014_listaAgentes"));
			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				logger.debug("Buixa");
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					formdata.put("axisctr_agente", agente);
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

}
