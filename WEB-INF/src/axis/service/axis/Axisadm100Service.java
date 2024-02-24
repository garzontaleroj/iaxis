package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DINCARTERA;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROYPROVIS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm100Service.java 01/12/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0
 */
public class Axisadm100Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String PROYRESERV = getCampoTextual(request, "PROYRESERV");
			// String VCIDIOMA = getCampoTextual(request, "VCIDIOMA");
			// String VCEMPRES = getCampoTextual(request, "VCEMPRES");

			BigDecimal VCIDIOMA = (BigDecimal) usuario.getCidioma();
			BigDecimal VCEMPRES = (BigDecimal) usuario.getCempres();

			formdata.put("VCIDIOMA", VCIDIOMA);
			formdata.put("VCEMPRES", VCEMPRES);

			Integer SHOW_RADIO_PROD = (Integer) AbstractDispatchAction.topPila(request, "SHOW_RADIO_PROD");
			formdata.put("SHOW_RADIO_PROD", SHOW_RADIO_PROD);

			if (isEmpty(PROYRESERV)) {
				formdata.put("PROYRESERV", "CARTERA");
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					formdata.put("PROYRESERV", "PREVI_CARTERA");
			}

			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal RADIO_FREQ = getCampoNumerico(request, "RADIO_FREQ");
			BigDecimal NPOLIZA = isEmpty(getCampoNumerico(request, "NPOLIZA"))
					? getCampoNumerico(request, "NPOLIZA_WIZARD")
					: getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = isEmpty(getCampoNumerico(request, "NCERTIF"))
					? getCampoNumerico(request, "NCERTIF_WIZARD")
					: getCampoNumerico(request, "NCERTIF");
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("NCERTIF", NCERTIF);
			logger.debug("user:" + usuario.getCidioma() + "empresa:" + usuario.getCempres());

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(1);

			if (isEmpty(RADIO))
				RADIO_FREQ = new BigDecimal(1);

			formdata.put("RADIO", RADIO);
			formdata.put("RADIO_FREQ", RADIO_FREQ);
			formdata.put("CFICHERO", "");
			formdata.put("CFICHERO2", "");
			formdata.put("CFICHERO3", "");
			// formdata.put("JGM_PROCES","");
			formdata.put("NPROCESO", "");

			if (isEmpty(SPROCAR)) {
				Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_GET_PROCESO();
				logger.debug("map dincartera -->" + m);
				formdata.put("SPROCAR", m.get("PSPROCES"));
			} else
				formdata.put("JGM_PROCES", "");

			this.cargarCombos(request);

			Map LSTVALORES = (Map) formdata.get("LSTVALORES");

			if (!isEmpty(CEMPRES) || !isEmpty(NPOLIZA))
				m_actualitzarMeses(request);

			if (!isEmpty(LSTVALORES) && !isEmpty(RAMO)) {
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				String tipo = this.getCampoTextual(request, "tipo");
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS("IPROVPRY", RAMO,
						new BigDecimal(1));
				logger.debug(map);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));

			}

			BigDecimal PRODUCT_1 = BigDecimal.ZERO;
			BigDecimal PRODUCT_2 = BigDecimal.ZERO;

			String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");
			if (RADIO.equals(new BigDecimal("1")) && !isEmpty(productosSeleccionados)) {
				PRODUCT_1 = new BigDecimal(0);
				PRODUCT_2 = new BigDecimal(0);
			}

			if (RADIO.equals(new BigDecimal("2")) && !isEmpty(NPOLIZA)) {
				PAC_IAX_DINCARTERA pacIaxDinCartera = new PAC_IAX_DINCARTERA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxDinCartera.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_POLIZA(NPOLIZA);
				logger.debug(map);
				PRODUCT_1 = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				// NULL, poliza no existe por tanto no miramos m�s parametros
				if (PRODUCT_1 != null) {
					map = pacIaxDinCartera.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_POLIZA(NPOLIZA);
					logger.debug(map);
					PRODUCT_2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				}
			}

			formdata.put("PRODUCT_1", PRODUCT_1 == null ? BigDecimal.ZERO : PRODUCT_1);
			formdata.put("PRODUCT_2", PRODUCT_2 == null ? BigDecimal.ZERO : PRODUCT_2);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que comprueba la extensi�n del fichero y, si no coincide con la de
	 * .csv la borra y, a�ade en cualquier caso esta �ltima
	 * 
	 * @param CFICHERO
	 * @return
	 * @throws Exception
	 */
	private static String comprobarFichero(String CFICHERO) throws Exception {
		if (isEmpty(CFICHERO))
			return CFICHERO;

		String regExprExt = "[a-zA-Z0-9]+[\\.[a-zA-Z0-9]+]+";

		Pattern mask = Pattern.compile(regExprExt);
		Matcher matcher = mask.matcher(CFICHERO);

		if (matcher.matches()) {
			String[] CFICHEROTmp = CFICHERO.split("\\.");
			CFICHERO = CFICHEROTmp[0];
		} else {
			// Per for�ar un error en la pantalla al recuperar la info.
			CFICHERO = "-0";
		}

		CFICHERO = CFICHERO + ".csv";
		return CFICHERO;
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisfis050Service m_ajax_generar_resultados_map");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String PSPROCES = getCampoTextual(request, "SPROCES");
		String PCTIPO = getCampoTextual(request, "REPORT");
		String CMAP = "";
		if (PCTIPO.equals("1")) {
			CMAP = "ListParamPR";
		} else if (PCTIPO.equals("2")) {
			CMAP = "ListProyReserva";
		}
		BigDecimal CEMPRES = new BigDecimal(17);
		String CEXPORT = "CSV";

		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CEMAIL = null;

		PARAMETROS__.put("PSPROCES", PSPROCES);
		TPARAMETROS__.put("TPSPROCES", "1");

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);

			logger.debug("map:" + map);
			request.setAttribute(Constantes.AJAXCONTAINER, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_ajax_generar_resultados_map", e);

		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisadm100Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			List lista_empresas;

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LSTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			if (isEmpty(CEMPRES)) {

				lista_empresas = (List) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(lista_empresas) && lista_empresas.size() == 1) {
					HashMap hashEmp = (HashMap) lista_empresas.get(0);
					CEMPRES = new BigDecimal(String.valueOf(hashEmp.get("CEMPRES")));
				}
			}

			/* Recuperar lista de Agentes */
			String tipo = this.getCampoTextual(request, "tipo");

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS("IPROVPRY", new BigDecimal(17));
			logger.debug(map);
			LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));

			if (!isEmpty(CEMPRES) && !isEmpty(SPROCAR)) {

				String PROYRESERV = getCampoTextual(request, "PROYRESERV");

				if (isEmpty(PROYRESERV)) {
					PROYRESERV = "CARTERA";
					String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

					if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
						PROYRESERV = "PREVI_CARTERA";
				}

				map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(CEMPRES, RAMO, SPRODUC, SPROCAR, PROYRESERV);
				logger.debug(map);
				logger.debug("JGM empr:" + CEMPRES + "prod:" + SPRODUC);

				formdata.put("LSTPRODCARTERA", map.get("PCURPRCAR"));
				formdata.put("CEMPRES", CEMPRES);
				m_actualitzarMeses(request);
			}

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_actualitzarMeses(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_actualitzarMesos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug(map2);
			formdata.put("LSTMESESCARTERA2", tratarRETURNyMENSAJES(request, map2));
			formdata.put("LSTMESESCARTERA", tratarRETURNyMENSAJES(request, map2));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_actualitzarMesos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_actualitzarAnyo(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_actualitzarMesos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NMES = getCampoNumerico(request, "NMES");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(String.valueOf(request.getParameter("RADIO")));

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_GET_ANYO_CARTERA(CEMPRES, NPOLIZA, NMES, SPROCAR);
			logger.debug(map);

			formdata.put("NANYO", map.get("PNANYO"));
			formdata.put("RADIO", RADIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_actualitzarAnyo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajaxseleccionarProd(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_seleccionarProd");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SELECCIO = getCampoNumerico(request, "SELECCIO");

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(CEMPRES, SPROCAR, SPRODUC, SELECCIO);
			logger.debug(map);

			// formdata.put("NANYO",tratarRETURNyMENSAJES(request, map));
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			String PROYRESERV = getCampoTextual(request, "PROYRESERV");

			if (isEmpty(PROYRESERV)) {
				PROYRESERV = "CARTERA";
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					PROYRESERV = "PREVI_CARTERA";
			}

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");

			map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(NPOLIZA, CEMPRES, PROYRESERV, SPROCAR);
			logger.debug(map);
			// formdata.put("LSTMESESCARTERA",map.get("RETURN"));

			// Si actualizarParProductos = 1 actualizaremos el valor PRODUCT_1 y PRODUCT_2
			// para el conjunto de productos seleccionados
			// actualizarParProductos ser� igual 0, solo cuando vengamos de
			// seleccionar/deseleccionar todos los productos, en este caso no nos interesa
			// para cada selecci�n
			// de producto actualizar el valor PRODUCT_1 y PRODUCT_2, sino que lo haremos
			// una �nica vez con la funci�n m_ajax_actualizarParametrosProductos
			BigDecimal actualizarParProductos = getCampoNumerico(request, "actualizarParProductos");
			BigDecimal PRODUCT_1 = BigDecimal.ZERO;
			BigDecimal PRODUCT_2 = BigDecimal.ZERO;
			if (actualizarParProductos.intValue() == 1) {
				String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");
				PRODUCT_1 = new BigDecimal(0);
				PRODUCT_2 = new BigDecimal(0);
			}
			map.put("PRODUCT_1", PRODUCT_1 == null ? BigDecimal.ZERO : PRODUCT_1);
			map.put("PRODUCT_2", PRODUCT_2 == null ? BigDecimal.ZERO : PRODUCT_2);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_seleccionarProd", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualizarParametrosProductos(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_ajax_actualizarParametrosProductos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			Map map = new HashMap();
			String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");

			map.put("PRODUCT_1", new BigDecimal(0));

			map.put("PRODUCT_2", new BigDecimal(0));

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_ajax_actualizarParametrosProductos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajaxregistrar(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_ajaxregistrar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String MODO = getCampoTextual(request, "PROYRESERV");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal MES = getCampoNumerico(request, "NMES");
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");

			java.sql.Date FINICIO = null;
			String sFINICIO = this.getCampoTextual(request, "FINICIO");
			if (sFINICIO != null && sFINICIO.trim().length() > 0) {
				FINICIO = this.stringToSqlDate(sFINICIO);
			}

			Map map = new PAC_IAX_PROYPROVIS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROYPROVIS__F_INICIALIZA_PROCESO(MES, ANYO, CEMPRES, FINICIO);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_ajaxregistrar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal m_procesar(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_procesar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String MODO = request.getParameter("PROYRESERV");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal MES = getCampoNumerico(request, "NMES");
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO_FREQ");
			BigDecimal SPRODUC = stringToBigDecimal((String) formdata.get("SPRODUC_V"));// getCampoNumerico(request,
																						// "SPRODUC");
			BigDecimal SPROCES = (BigDecimal) stringToBigDecimal((String) formdata.get("SPROCES"));//
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");

			Map map = new PAC_IAX_PROYPROVIS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROYPROVIS__F_CALCULO_PROYPROVIS(SPROCES, RADIO, MES, ANYO, SPRODUC, NPOLIZA,
							NCERTIF, "R");
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

			BigDecimal registroOK = ((BigDecimal) tratarRETURNyMENSAJES(request, map));

			if (registroOK.intValue() == 0) {
				formdata.put("SPROCES", null);
				formdata.put("SPROCAR", null);
				formdata.put("SPRODUC", null);
				formdata.put("R", null);
				formdata.put("CRAMO", null);
				formdata.put("NPOLIZA", null);
				formdata.put("NCERTIF", null);
				formdata.put("NRENOVA", null);
				formdata.put("NMES", null);
				formdata.put("NANYO", null);
			}

			formdata.put("LSTPRODCARTERA", map.get("PCURPRCAR"));

			return new BigDecimal(0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_procesar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

		return new BigDecimal(0);
	}

	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisadm100Service m_imprimir");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String MODO = getCampoTextual(request, "PROYRESERV");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			logger.debug("CEMPRES :" + CEMPRES);
			BigDecimal MES = getCampoNumerico(request, "NMES");
			logger.debug("NMES :" + MES);
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");
			logger.debug("NANYO :" + ANYO);
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			logger.debug("RADIO :" + RADIO);
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			logger.debug("SPROCAR :" + SPROCAR);
			BigDecimal SPROCES = getCampoNumerico(request, "NPROCES");
			logger.debug("NPROCES :" + SPROCES);

			BigDecimal NLISTADO2 = getCampoNumerico(request, "NLISTADO2");
			logger.debug("NLISTADO2 :" + NLISTADO2);
			BigDecimal NLISTADO1 = getCampoNumerico(request, "NLISTADO1");
			logger.debug("NLISTADO1 :" + NLISTADO1);

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(String.valueOf(request.getParameter("RADIO")));

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_LISTADO_CARTERA("REPORT", CEMPRES, "1", SPROCES, MES, ANYO, SPROCAR);
			logger.debug(map); // "ESTADO PRODUCTE"

			// BigDecimal registroOK = (BigDecimal)tratarRETURNyMENSAJES(request, map) ;

			// if( registroOK.intValue() == 0){
			logger.debug("OK! REIMPRESSIO");
			// }

			formdata.put("RADIO", RADIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm100Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
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
			String PROYRESERV = this.getCampoTextual(request, "PROYRESERV");
			BigDecimal NMES = this.getCampoNumerico(request, "NMES");
			BigDecimal NANYO = this.getCampoNumerico(request, "NANYO");

			java.sql.Date FINICIO = new java.sql.Date(new java.util.Date().getTime());
			String sFINICIO = null;
			if (sFINICIO != null && sFINICIO.trim().length() > 0) {
				FINICIO = this.stringToSqlDate(sFINICIO);
			}

			if (CEMPRES != null) {
				PAC_IAX_DINCARTERA pac_axis_dincartera = new PAC_IAX_DINCARTERA(
						(Connection) request.getAttribute(Constantes.DB01CONN));

				java.sql.Date FPERFIN = new java.sql.Date(new java.util.Date().getTime());
				String sFPERFIN = this.getCampoTextual(request, "FPERFIN");
				if (sFPERFIN != null && sFPERFIN.trim().length() > 0) {
					FPERFIN = this.stringToSqlDate(sFPERFIN);
				}
				Map map = pac_axis_dincartera.ejecutaPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(PROYRESERV, NMES, NANYO,
						CEMPRES, FINICIO);
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

}
