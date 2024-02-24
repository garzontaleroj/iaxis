//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LIQUIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr090Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr090Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr090Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr090Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_axis_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES")) ? usuario.getCempres()
					: this.getCampoNumerico(request, "CEMPRES");
			formdata.put("CEMPRES", CEMPRES);

			Map m = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_FECINILIQ();
			logger.debug(m);

			formdata.put("FINICI",
					((HashMap) ((ArrayList) this.tratarRETURNyMENSAJES(request, m, false)).get(0)).get("FINICI"));

			logger.debug("ANTES_CARGAR_LISTAS -------------------->");

			this.cargarListas(request, thisAction);
			logger.debug("DESPUES_CARGAR_LISTAS -------------------->");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr090Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_liquidar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr090Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LIQUIDA pac_axis_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REDCOMERCIAL pac_axis_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal LIQUID = this.getCampoNumerico(request, "LIQUID");
			BigDecimal NANYO = this.getCampoNumerico(request, "NANYO");
			BigDecimal SPR = this.getCampoNumerico(request, "SPR");
			BigDecimal ADNSUC = this.getCampoNumerico(request, "ADNSUC");
			BigDecimal SUCURSAL = this.getCampoNumerico(request, "SUCURSAL");

			// -- ini BUG 0020164 - 15/11/2011 - JMF
			BigDecimal CLIQUIDO = this.getCampoNumerico(request, "CLIQUIDO");
			if (CLIQUIDO.intValue() >= 2) {
				CLIQUIDO = null;
			}
			// -- fin BUG 0020164 - 15/11/2011 - JMF

			java.sql.Date FECLIQ = null;
			FECLIQ = AxisBaseService.stringToSqlDate(this.getHiddenCampoTextual(request, "FECLIQ"));
			/*
			 * java.sql.Date FFIN = null; FFIN =
			 * AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFIN"));
			 */

			// java.sql.Date FMOVINI = new java.sql.Date(new java.util.Date().getTime());
			BigDecimal PMODO = this.getCampoNumerico(request, "PMODO");

			logger.debug("------------------> LIQUID :" + LIQUID);
			/*
			 * Map m =
			 * pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_LIQUIDALIQ(CAGENTE,CEMPRES,SPROCES
			 * ,FMOVINI,PMODO,NMES, NANYO);
			 */
			if (BigDecimal.ONE.equals(LIQUID)) {
				SPROCES = null;
			}

			logger.debug("SPROCES --------------------> " + SPROCES);
			logger.debug("SPR --------------------> " + SPR);
			logger.debug("CAGENTE --------------------> " + CAGENTE);

			// joan CLIQUIDO
			// Map m =
			// pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_LIQUIDALIQ(CAGENTE,CEMPRES,PMODO,FECLIQ,
			// SPROCES,SUCURSAL,ADNSUC);
			Map m = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_LIQUIDALIQ(CAGENTE, CEMPRES, PMODO, FECLIQ, SPROCES,
					SUCURSAL, ADNSUC, CLIQUIDO);

			this.tratarRETURNyMENSAJES(request, m, false);

			if (m != null) {
				String ruta_fichero = (String) m.get("PRUTA");
				formdata.put("V_RUTA", ruta_fichero);
			}

			PAC_IAX_LIQUIDA pac_iax_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			m = pac_iax_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_PROC_CIERRES_LIQ(PMODO, FECLIQ, CEMPRES);
			formdata.put("SPR", this.tratarRETURNyMENSAJES(request, m, false));

			logger.debug(m);

			if (LIQUID.equals(new BigDecimal(3)) && PMODO.equals(new BigDecimal(0))) {

				PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map mapf = new HashMap();
				Map mapo = new HashMap();
				mapf = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_REGIMENFISCAL(CAGENTE, "DES");
				mapo = (Map) mapf.get("POREGIMENFISCAL");

				BigDecimal cregfiscal = (BigDecimal) mapo.get("CREGFISCAL");
				logger.debug("cregfiscal --------------------> " + cregfiscal);
				if (cregfiscal != null && cregfiscal.equals(new BigDecimal(1))) {
					Map map = new HashMap();
					Map mapINFORME = new HashMap();

					String CMAP = "FacturaEquivalente";

					String CEXPORT = "PDF";

					Enumeration parameters = request.getParameterNames();
					String p = null;
					HashMap<String, String> PARAMETROS__ = new HashMap();
					HashMap<String, String> TPARAMETROS__ = new HashMap();
					BigDecimal batch = new BigDecimal(0);
					BigDecimal CIDIOMA = new BigDecimal(8);
					String CEMAIL = null;

					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Date fecha = format.parse(FECLIQ.toString());
					SimpleDateFormat formatAxis = new SimpleDateFormat("dd/MM/yyyy");

					if (SPROCES == null) {
						SPROCES = new BigDecimal(0);
					}

					PARAMETROS__.put("PSPROCES", SPROCES.toString());
					PARAMETROS__.put("PCAGENTE", CAGENTE.toString());
					PARAMETROS__.put("PCEMPRES", CEMPRES.toString());
					PARAMETROS__.put("PFECLIQ", formatAxis.format(fecha));
					TPARAMETROS__.put("TPSPROCES", "1");
					TPARAMETROS__.put("TPCAGENTE", "1");
					TPARAMETROS__.put("TPCEMPRES", "1");
					TPARAMETROS__.put("TPFECLIQ", "1");

					m = pac_iax_liquida.ejecutaPAC_LIQUIDA__F_INSERT_LIQUIDAFACT_INTER(SPROCES.toString(),
							new BigDecimal(CAGENTE.toString()));
					logger.debug("ejecutaPAC_LIQUIDA__F_INSERT_LIQUIDAFACT_INTER --------------------> " + m);
					try {
						mapINFORME = new PAC_IAX_INFORMES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
										this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA,
										batch, CEMAIL, new BigDecimal(0));
						logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
						map.put("LIST_FICHEROS", mapINFORME);

						if (mapINFORME != null) {
							String ruta_fichero = (String) mapINFORME.get("OFICHERO");
							formdata.put("V_RUTA2", ruta_fichero);
						}

						logger.debug("map:" + map);
						request.setAttribute(Constantes.AJAXCONTAINER, map);

					} catch (Exception e) {
						logger.error("Error en el servicio .....", e);

					}
				}
			}

			// this.cargarListas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr090Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	private void cargarListas(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map listValores = new HashMap();

			logger.debug("DESPUES_CARGAR_LISTAS_1 -------------------->");

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_LIQUIDA pac_iax_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug("DESPUES_CARGAR_LISTAS_2 -------------------->");

			Map m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(m);
			listValores.put("LSTEMPRESAS", this.tratarRETURNyMENSAJES(request, m, false));

			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug(m);
			listValores.put("LSTMESES", this.tratarRETURNyMENSAJES(request, m, false));
			// if (!isEmpty(CEMPRES)) {
			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LIQSPENDIENTES(CEMPRES);
			logger.debug(m);
			listValores.put("LSTPROCESOS", this.tratarRETURNyMENSAJES(request, m, false));

			// }
			BigDecimal PSUCURSAL = getCampoNumerico(request, "SUCURSAL");
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal("3"),
					usuario.getCidioma(), PSUCURSAL);
			logger.debug(map);
			listValores.put("LSTAGENTES", this.tratarRETURNyMENSAJES(request, map, false));

			Map mapsuc = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal("2"),
					usuario.getCidioma(), null);
			logger.debug(mapsuc);
			listValores.put("LSTASUC", this.tratarRETURNyMENSAJES(request, mapsuc, false));

			logger.debug("DESPUES_CARGAR_LISTAS_3 -------------------->");
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr090Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
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
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
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
		formdata.putAll(agente);

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
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					formdata.putAll(agente);
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

	public void m_ajax_cargar_procesos(HttpServletRequest request) {
		logger.debug("Axisctr090Service m_ajax_cargar_procesos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_LIQUIDA pac_iax_liquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			java.sql.Date FECLIQ = null;
			FECLIQ = AxisBaseService.stringToSqlDate(this.getHiddenCampoTextual(request, "FECLIQ"));
			BigDecimal PMODO = this.getCampoNumerico(request, "PMODO");

			Map m = pac_iax_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_PROC_CIERRES_LIQ(PMODO, FECLIQ, CEMPRES);
			logger.debug("---> PROCESOS CIERRES -----> : " + m);
			List getProcesos = (List) ajax.rellenarPlAContenedorAjax(m);

			if (!isEmpty(getProcesos) && getProcesos.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getProcesos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr090Service - m�todo m_ajax_cargar_procesos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

}
