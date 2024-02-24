package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisrea037Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_tunnel_doc(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Axisrea037Service m_tunnel_doc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String fileAbsolutePath = this.getCampoTextual(request, "fileAbsolutePath");
			this.tunnelFichero(request, response, fileAbsolutePath);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_tunnel_doc", e);
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Funcionalidad simple de pedir un SPROCES desde PAC_IAX_REA por JSON
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recuperarsprocesajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (CEMPRES != null) {
				PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

				java.sql.Date FPERFIN = new java.sql.Date(new java.util.Date().getTime());
				String sFPERFIN = this.getCampoTextual(request, "FPERFIN");
				if (sFPERFIN != null && sFPERFIN.trim().length() > 0) {
					FPERFIN = this.stringToSqlDate(sFPERFIN);
				}
				Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_REGISTRA_PROCESO(FPERFIN, CEMPRES);
				logger.debug("map:" + map);
				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				}
				request.setAttribute(Constantes.AJAXCONTAINER, map);
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea037Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			m_cargar_valores(request);
			m_cargar_combos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea037Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar_combos(HttpServletRequest request) {
		logger.debug("Axisrea037Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRESA");
			/*
			 * BigDecimal CEMPRES=(BigDecimal)AbstractDispatchAction.topPila(request,
			 * "CEMPRES"); if (isEmpty(CEMPRES)) { CEMPRES=usuario.getCempres(); }
			 */

			/* Recupera combo compa�ias */
			Map map_companias = (HashMap) this.dbGetCompanias(request, usuario, new BigDecimal(0), new BigDecimal(4),
					new BigDecimal(1));
			List listaCompanias = (List) tratarRETURNyMENSAJES(request, map_companias, false);
			formdata.put("listaCompanias", listaCompanias);
			logger.debug(map_companias);

			/* Recupera combo contratos */
			Map map_contrato = (HashMap) this.dbGetContrato(request, usuario, CEMPRES);
			List listaContrato = (List) tratarRETURNyMENSAJES(request, map_contrato, false);
			formdata.put("listaContrato", listaContrato);
			logger.debug(map_contrato);

			/* Recupera combo versiones */
			List listaVersion = new ArrayList();
			List listaTramos = new ArrayList();

			HashMap map_version = new HashMap();
			if (!isEmpty(map_contrato) && listaContrato.size() >= 1) {
				/*
				 * Extraemos el valor del SCONTRA DE LA PRIMERA FILA, la primera vez que
				 * entramos en la pantalla
				 */

				BigDecimal SCONTRA = null;
				if (!isEmpty(getCampoNumerico(request, "SCONTRA"))) {
					SCONTRA = getCampoNumerico(request, "SCONTRA"); // Cogemos el valor de pantalla
				}

				if (!isEmpty(SCONTRA)) {
					map_version = (HashMap) this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
					listaVersion = (List) tratarRETURNyMENSAJES(request, map_version, false);

					map_version = (HashMap) this.dbGetTramo(request, usuario, SCONTRA);
					listaTramos = (List) tratarRETURNyMENSAJES(request, map_version, false);

				}

			}

			formdata.put("listaVersion", listaVersion);
			formdata.put("listaTramos", listaTramos);

			logger.debug(map_version);
			/* Borramos arrays auxiliares */
			listaContrato = null;
			listaVersion = null;
			listaTramos = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea037Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_cargar_valores(HttpServletRequest request) {
		logger.debug("Axisrea037Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			/* LSTESTADOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map));

			/* LSTTIPOAGENTE */
			map = pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BROKER();

			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

			/* reas */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
			logger.debug(map);
			LISTVALORES.put("LSTREASEGURADORAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);

			if ("true".equals(request.getParameter("buscarOnload"))) {
				formdata.put("FINICIO", new Date());
				m_buscar(request);
			}

			/* CARGAR RAMO - PRODUCTO */
			List listaRamos = new ArrayList();
			HashMap map_ramos = new HashMap();

			List listaProductos = new ArrayList();
			HashMap map_productos = new HashMap();

			BigDecimal CRAMO = null;
			if (!isEmpty(getCampoNumerico(request, "CRAMO"))) {
				CRAMO = getCampoNumerico(request, "CRAMO"); // Cogemos el valor de pantalla
			}
			BigDecimal CEMPRES = null;

			/* Recuperamos los ramos */
			map_ramos = (HashMap) this.dbGetRamo(request, usuario, CEMPRES);
			listaRamos = (List) tratarRETURNyMENSAJES(request, map_ramos, false);
			formdata.put("listaRamo", listaRamos);
			logger.debug(map_ramos);

			if (CRAMO != null) {
				/* Recuperamos los productos siempre y cuando est� informado el RAMO */
				map_productos = (HashMap) this.dbGetProducto(request, usuario, null, CEMPRES, CRAMO);
				listaProductos = (List) tratarRETURNyMENSAJES(request, map_productos, false);
			}
			formdata.put("listaProducto", listaProductos);
			logger.debug(map_productos);

			BigDecimal SPRODUC = null;
			if (!isEmpty(getCampoNumerico(request, "SPRODUC"))) {
				SPRODUC = getCampoNumerico(request, "SPRODUC"); // Cogemos el valor de pantalla
			}

			map = pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA();
			logger.debug(map);
			formdata.put("lstEstados", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea037Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisrea037Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		this.formattingNumericValues(request);
		try {
			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRESA");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

			BigDecimal COMPANIA = getCampoNumerico(request, "COMPANIA");
			// BUG 23830/157563 - 04/11/2013 - RCL - Nuevo campo de filtrado "Nro. de
			// Liquidaci�n"
			BigDecimal NUMPROCES = getCampoNumerico(request, "NUMPROCES");

			Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_CTATECNICA(CEMPRESA, CRAMO, SPRODUC, CCORRED, CCOMPANI,
					SCONTRA, NVERSIO, CTRAMO, FCIERRE, NPOLIZA, NCERTIF, NSINIES, CESTADO, COMPANIA, NUMPROCES);

			logger.debug("LSTCUENTAS###-->" + map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			logger.debug("RETURN######-->" + RETURN);

			if (!isEmpty(RETURN))
				for (int i = 0; i < (int) RETURN.size(); i++) {

					// String trozo=cadena[i];
					Integer valor = new Integer(i);

					HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro

					BigDecimal saldo = (BigDecimal) mapa.get("ISALDO");

					mapa.put("ILIQUIDA", saldo);
					mapa.put("NUM_LINEA", 1); // Ponemos el valor de l�nea a 1

				}

			logger.debug("LSTCUENTAS######-->" + RETURN);

			if (!isEmpty(RETURN)) {
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				formdata.put("LSTCUENTAS", RETURN);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea037Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_recargar_pantalla(HttpServletRequest request) {
		logger.debug("Axisrea037Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRESA");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal COMPANIA = getCampoNumerico(request, "COMPANIA");
			// BUG 23830/157563 - 04/11/2013 - RCL - Nuevo campo de filtrado "Nro. de
			// Liquidaci�n"
			BigDecimal NUMPROCES = getCampoNumerico(request, "NUMPROCES");

			BigDecimal SALDO_TOTAL = new BigDecimal("0");
			String elementos = getCampoTextual(request, "CADENA_VALORES");
			String cadena[] = new String[0];
			if (elementos != null) {
				cadena = elementos.split("x");
			}

			Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_CTATECNICA(CEMPRESA, CRAMO, SPRODUC, CCORRED, CCOMPANI,
					SCONTRA, NVERSIO, CTRAMO, FCIERRE, NPOLIZA, NCERTIF, NSINIES, CESTADO, COMPANIA, NUMPROCES);

			logger.debug(map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			/* Recomponer registros obtenidos */

			logger.debug("cadena:>>>>>>>>>>>>>>>>>>" + cadena);
			for (int i = 0; i < cadena.length; i++) {

				String trozo = cadena[i];
				Integer valor = new Integer(trozo);
				// logger.debug("(i):"+i+",valor:"+valor);
				// logger.debug(RETURN+" valor:"+valor);
				HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro
				// logger.debug("mapa"+mapa);
				BigDecimal saldo = (BigDecimal) mapa.get("ISALDO");
				// logger.debug("mapa"+saldo);
				mapa.put("ILIQUIDA", saldo);
				mapa.put("NUM_LINEA", 1); // Ponemos el valor de l�nea a 1

				/*
				 * SALDO_TOTAL = SALDO_TOTAL.add(saldo);
				 * logger.debug("SALDO_TOTAL="+SALDO_TOTAL);
				 */
			}

			/*
			 * logger.debug("SALDO_TOTAL fi = "+SALDO_TOTAL);
			 * formdata.put("SALDO_TOTAL",SALDO_TOTAL);
			 */

			if (!isEmpty(RETURN)) {
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				formdata.put("LSTCUENTAS", RETURN);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea037Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_actividad(HttpServletRequest request) {
		logger.debug("Axisarea025Service m_ajax_actualiza_actividad");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			Map map = this.dbGetActividad(request, usuario, SPRODUC, CRAMO);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea025Service - m�todo m_ajax_actualiza_actividad", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_tramos(HttpServletRequest request) {
		logger.debug("Axisarea025Service m_ajax_actualiza_tramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			Map map = this.dbGetTramo(request, usuario, SCONTRA);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea025Service - m�todo m_ajax_actualiza_tramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_producto(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualiza_producto");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal CEMPRES = null; // (BigDecimal)AbstractDispatchAction.topPila(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = this.dbGetProducto(request, usuario, null, CEMPRES, CRAMO);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualiza_producto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * ********************************** FUNCIONES ACCESO BBDD
	 * ************************************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */

	private Map dbGetContrato(HttpServletRequest request, UsuarioBean usuario, BigDecimal CEMPRES) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(CEMPRES);
		logger.debug("Map de contratos ------------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetCompanias(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC, BigDecimal TIPCOM,
			BigDecimal PAXISREA037) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(SPRODUC, TIPCOM, PAXISREA037);
		logger.debug("Map de companias ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetVersion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA, BigDecimal CEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRA);
		logger.debug("Map de version  ------------------------------------------------------>" + m);
		return m;
	}

	private Map dbGetRamo(HttpServletRequest request, UsuarioBean usuario, BigDecimal EMPRESA) throws Exception {
		// Map m = new
		// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(EMPRESA);//CCOMPANI
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, EMPRESA);
		logger.debug("Map de actividades ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetProducto(HttpServletRequest request, UsuarioBean usuario, String CTIPO, BigDecimal CEMPRES,
			BigDecimal CRAMO) throws Exception {
		Map m = // new
				// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(CTIPO,CEMPRES,CRAMO);
				new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, new BigDecimal("0"));
		logger.debug("Map de productos ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetActividad(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC, BigDecimal CRAMO)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
		logger.debug("Map de actividades ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetTramo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS(SCONTRA);
		logger.debug("Map de tramos ------------------------------------------------->" + m);
		return m;
	}

	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * ********************************** FUNCIONES AJAX
	 * FUNCIONES**********************************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */

	/**
	 *
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_version(HttpServletRequest request) {
		logger.debug("Axisarea037Service m_ajax_actualiza_version");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRESA");
			/*
			 * (BigDecimal)AbstractDispatchAction.topPila(request, "CEMPRES"); if
			 * (isEmpty(CEMPRES)) { CEMPRES=usuario.getCempres(); }
			 */

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			Map map = this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea037Service - m�todo m_ajax_actualiza_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 *
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_ramos(HttpServletRequest request) {
		logger.debug("Axisarea037Service m_ajax_actualiza_version");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRESA");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			Map map = this.dbGetRamo(request, usuario, CEMPRES);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea037Service - m�todo m_ajax_actualiza_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 *
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_importes(HttpServletRequest request) {
		logger.debug("Axisarea037Service m_ajax_actualiza_importes");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			/*
			 * *****************************************************************************
			 * **********
			 */
			/*
			 * ******************************** CAMPOS ENTRADA
			 * *************************************
			 */
			/*
			 * *****************************************************************************
			 * **********
			 */

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRESA");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

			BigDecimal COMPANIA = getCampoNumerico(request, "COMPANIA");
			// BUG 23830/157563 - 04/11/2013 - RCL - Nuevo campo de filtrado "Nro. de
			// Liquidaci�n"
			BigDecimal NUMPROCES = getCampoNumerico(request, "NUMPROCES");

			/*
			 * *****************************************************************************
			 * *********************
			 */
			/*
			 * ******************************* CAMPOS LINEA
			 * *****************************************************
			 */
			/*
			 * *****************************************************************************
			 * *********************
			 */
			BigDecimal linea = getCampoNumerico(request, "linea");
			BigDecimal seleccionado = getCampoNumerico(request, "seleccionado");
			BigDecimal nuevo_valor = new BigDecimal("0");
			BigDecimal suma_total = new BigDecimal("0");
			HashMap valores_out = new HashMap();
			ArrayList lista_valores_out = new ArrayList();

			Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_CTATECNICA(CEMPRESA, CRAMO, SPRODUC, CCORRED, CCOMPANI,
					SCONTRA, NVERSIO, CTRAMO, FCIERRE, NPOLIZA, NCERTIF, NSINIES, CESTADO, COMPANIA, NUMPROCES);
			logger.debug(map);
			List<Map> lista_valores = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(lista_valores)) {

				for (int i = 0; i < lista_valores.size(); i++) {

					BigDecimal valor = getCampoNumerico(request, "num_linea" + i);
					if (valor != null && valor.intValue() == 1) {
						BigDecimal IMPORTE = (BigDecimal) ((HashMap) lista_valores.get(i)).get("IMPORTE");
						suma_total.add(IMPORTE);

					}

				}

				valores_out.put("SUMA_TOTAL", suma_total);

			}

			BigDecimal campo = getCampoNumerico(request, "num_linea_" + linea);

			if (!isEmpty(lista_valores)) {
				if (campo != null & campo.intValue() == 1) {
					nuevo_valor = (BigDecimal) ((HashMap) lista_valores.get(linea.intValue())).get("IMPORTE");
				}
			}

			lista_valores_out.add(valores_out);
			valores_out.put("NUEVO_VALOR", nuevo_valor);

			ajax.guardarContenidoFinalAContenedorAjax(lista_valores_out);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea037Service - m�todo m_ajax_actualiza_importes", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_liquidar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_liquida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = null;
			BigDecimal SPRODUC = null;
			BigDecimal CCORRED = null;
			BigDecimal CCOMPANI = null;
			BigDecimal SCONTRA = null;
			BigDecimal NVERSIO = null;
			BigDecimal CTRAMO = null;
			java.sql.Date FCIERRE = null;
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal CLIQUIDAR = this.getCampoNumerico(request, "CLIQUIDAR") == null ? new BigDecimal(0)
					: this.getCampoNumerico(request, "CLIQUIDAR");
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA");
			// KBR 18/07/2014
			BigDecimal LASTCHECK = new BigDecimal(0);

			Map map = null;
			String datos_num_lineas = this.getCampoTextual(request, "datos_num_lineas"); // concadenacion de valores de
																							// datos_num_linea_*,
																							// separado por @
			if (datos_num_lineas == null)
				datos_num_lineas = "";
			logger.debug("datos_num_lineas:" + datos_num_lineas);
			String[] datos_num_lineasItems = StringUtils.split(datos_num_lineas, '@');
			logger.debug("datos_num_lineasItems:" + datos_num_lineasItems);
			int counter = 0;
			int counter_error = 0;
			boolean yaHabiaRETURN_0 = false;
			for (int i = 0; i < datos_num_lineasItems.length; i++) {
				if (datos_num_lineasItems[i].length() > 0) {
					logger.debug("datos_num_linea-Item:" + datos_num_lineasItems[i]);

					String[] datos_num_lineaItems = StringUtils.splitPreserveAllTokens(datos_num_lineasItems[i], "|"); // concadenacion
																														// de
																														// ${LSTCUENTAS.CEMPRES}|${LSTCUENTAS.SPRODUC}|${LSTCUENTAS.CCORRED}|${LSTCUENTAS.CCOMPANI}|${LSTCUENTAS.SCONTRA}|${LSTCUENTAS.NVERSIO}|${LSTCUENTAS.CTRAMO}|<fmt:formatDate
																														// value='${LSTCUENTAS.FCIERRE}'
																														// pattern='dd/MM/yyyy'/>
					CEMPRES = null;
					if (datos_num_lineaItems[0] != null && datos_num_lineaItems[0].trim().length() > 0)
						CEMPRES = new BigDecimal(datos_num_lineaItems[0]);
					SPRODUC = null;
					if (datos_num_lineaItems[1] != null && datos_num_lineaItems[1].trim().length() > 0)
						SPRODUC = new BigDecimal(datos_num_lineaItems[1]);
					CCORRED = null;
					if (datos_num_lineaItems[2] != null && datos_num_lineaItems[2].trim().length() > 0)
						CCORRED = new BigDecimal(datos_num_lineaItems[2]);
					CCOMPANI = null;
					if (datos_num_lineaItems[3] != null && datos_num_lineaItems[3].trim().length() > 0)
						CCOMPANI = new BigDecimal(datos_num_lineaItems[3]);
					SCONTRA = null;
					if (datos_num_lineaItems[4] != null && datos_num_lineaItems[4].trim().length() > 0)
						SCONTRA = new BigDecimal(datos_num_lineaItems[4]);
					NVERSIO = null;
					if (datos_num_lineaItems[5] != null && datos_num_lineaItems[5].trim().length() > 0)
						NVERSIO = new BigDecimal(datos_num_lineaItems[5]);
					CTRAMO = null;
					if (datos_num_lineaItems[6] != null && datos_num_lineaItems[6].trim().length() > 0)
						CTRAMO = new BigDecimal(datos_num_lineaItems[6]);
					FCIERRE = null;
					if (datos_num_lineaItems[7] != null && datos_num_lineaItems[7].trim().length() > 0)
						FCIERRE = stringToSqlDate(datos_num_lineaItems[7]);
					// KBR 16/07/2014 - Verificamos si es el ultimo registro y enviamos la marca a 1
					if (i == datos_num_lineasItems.length - 1)
						LASTCHECK = new BigDecimal(1);
					else
						LASTCHECK = new BigDecimal(0);
					map = pac_axis_rea.ejecutaPAC_IAX_REA__F_LIQUIDA_CTATEC_REA(CEMPRES, SPRODUC, CCORRED, CCOMPANI,
							SCONTRA, NVERSIO, CTRAMO, FCIERRE, SPROCES, CLIQUIDAR, CIAPROP, LASTCHECK);
					logger.debug(map);

					// roup-5] (Axisrea037Service.java:803) {RETURN=0,
					// MENSAJES=[{OB_IAX_MENSAJES={TIPERROR=2, CERROR=null, TERROR=N� proceso :
					// 293603}}]}

					if (map.get("RETURN").equals(BigDecimal.ZERO)) {
						counter++;
						if (!yaHabiaRETURN_0) {
							this.tratarRETURNyMENSAJES(request, map);
							yaHabiaRETURN_0 = true;
						}
					} else {
						// this.tratarRETURNyMENSAJES(request, map);
						counter_error++;
						if (!yaHabiaRETURN_0) {
							this.tratarRETURNyMENSAJES(request, map);
							yaHabiaRETURN_0 = true;
						}
					}

				}
			}

			if (!LASTCHECK.equals(BigDecimal.ZERO)) {
				String msg = null;
				if (counter_error > 0)
					msg = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), "9901850");
				else
					msg = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), "109904");

				thisAction.guardarMensaje(request, "verbatim:" + msg, null, Constantes.MENSAJE_INFO);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_liquida", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_companias(HttpServletRequest request) {
		logger.debug("Axisarea037Service m_ajax_actualiza_companias");
		this.formattingNumericValues(request);
		try {

			HashMap miDataObject = new HashMap();
			Map map = null;
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			// Si marcamos la opci�n nula del combo SPRODUC, mostraremos igual que al
			// iniciar la pantalla -> SPRODUC = 0
			if (SPRODUC == null) {
				SPRODUC = new BigDecimal(0);
			}
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(SPRODUC, new BigDecimal("4"),
					new BigDecimal("1"));
			miDataObject.put("COMPANIAS", tratarRETURNyMENSAJES(request, map, false));
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea037Service - m�todo m_ajax_actualiza_companias", e);
		}

	}

	public void m_cancelar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea038Service m_liquida");
		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = null;
			BigDecimal SPRODUC = null;
			BigDecimal CCORRED = null;
			BigDecimal CCOMPANI = null;
			BigDecimal SCONTRA = null;
			BigDecimal NVERSIO = null;
			BigDecimal CTRAMO = null;
			java.sql.Date FCIERRE = null;
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA");
			BigDecimal SPAGREA = null;

			Map map = null;
			String datos_num_lineas = this.getCampoTextual(request, "datos_num_lineas"); // concadenacion de valores de
																							// datos_num_linea_*,
																							// separado por @
			if (datos_num_lineas == null)
				datos_num_lineas = "";
			logger.debug("datos_num_lineas:" + datos_num_lineas);
			String[] datos_num_lineasItems = StringUtils.split(datos_num_lineas, '@');
			logger.debug("datos_num_lineasItems:" + datos_num_lineasItems);

			for (int i = 0; i < datos_num_lineasItems.length; i++) {
				if (datos_num_lineasItems[i].length() > 0) {
					logger.debug("datos_num_linea-Item:" + datos_num_lineasItems[i]);

					String[] datos_num_lineaItems = StringUtils.splitPreserveAllTokens(datos_num_lineasItems[i], "|"); // concadenacion
																														// de
																														// ${LSTCUENTAS.CEMPRES}|${LSTCUENTAS.SPRODUC}|${LSTCUENTAS.CCORRED}|${LSTCUENTAS.CCOMPANI}|${LSTCUENTAS.SCONTRA}|${LSTCUENTAS.NVERSIO}|${LSTCUENTAS.CTRAMO}|<fmt:formatDate
																														// value='${LSTCUENTAS.FCIERRE}'
																														// pattern='dd/MM/yyyy'/>
					CEMPRES = null;
					if (datos_num_lineaItems[0] != null && datos_num_lineaItems[0].trim().length() > 0)
						CEMPRES = new BigDecimal(datos_num_lineaItems[0]);
					SPRODUC = null;
					if (datos_num_lineaItems[1] != null && datos_num_lineaItems[1].trim().length() > 0)
						SPRODUC = new BigDecimal(datos_num_lineaItems[1]);
					CCORRED = null;
					if (datos_num_lineaItems[2] != null && datos_num_lineaItems[2].trim().length() > 0)
						CCORRED = new BigDecimal(datos_num_lineaItems[2]);
					CCOMPANI = null;
					if (datos_num_lineaItems[3] != null && datos_num_lineaItems[3].trim().length() > 0)
						CCOMPANI = new BigDecimal(datos_num_lineaItems[3]);
					SCONTRA = null;
					if (datos_num_lineaItems[4] != null && datos_num_lineaItems[4].trim().length() > 0)
						SCONTRA = new BigDecimal(datos_num_lineaItems[4]);
					NVERSIO = null;
					if (datos_num_lineaItems[5] != null && datos_num_lineaItems[5].trim().length() > 0)
						NVERSIO = new BigDecimal(datos_num_lineaItems[5]);
					CTRAMO = null;
					if (datos_num_lineaItems[6] != null && datos_num_lineaItems[6].trim().length() > 0)
						CTRAMO = new BigDecimal(datos_num_lineaItems[6]);
					FCIERRE = null;
					if (datos_num_lineaItems[7] != null && datos_num_lineaItems[7].trim().length() > 0)
						FCIERRE = stringToSqlDate(datos_num_lineaItems[7]);
					SPAGREA = null;
					if (datos_num_lineaItems[8] != null && datos_num_lineaItems[8].trim().length() > 0)
						SPAGREA = new BigDecimal(datos_num_lineaItems[8]);

					// 1� recuperamos la lista de movimientos
					Map lista = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MOVCTATECNICA(CEMPRES, SPRODUC, CCOMPANI,
							SCONTRA, NVERSIO, CTRAMO, FCIERRE, new BigDecimal("4"), null, CIAPROP, SPAGREA,
							BigDecimal.ZERO);
					logger.debug(lista);
					List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, lista);

					logger.debug(RETURN);

					if (RETURN != null) {
						// Por cada registro no
						for (int j = 0; j < RETURN.size(); j++) {

							HashMap mapa = (HashMap) RETURN.get(j); // Se busca el registro
							BigDecimal NVERSIO_FILA = (BigDecimal) mapa.get("NVERSIO");
							BigDecimal NNUMLIN = (BigDecimal) mapa.get("NNUMLIN");

							map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_RETEN_LIQUIDA(CCOMPANI, NVERSIO_FILA, SCONTRA,
									CTRAMO, NNUMLIN, null, null, null, null, new BigDecimal("1"), new BigDecimal("4"));

						}
					}

					// this.tratarRETURNyMENSAJES(request, map);

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea038Service - m�todo m_liquida", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
