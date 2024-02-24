//Revision:# Yn6ikatx4XPBqnMO65Ty8g== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG_FILE;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisint001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisint001Service.java
 * 
 * @author XPL Fecha: 10/05/2010 PROP�SITO (descripci�n Service): Ejemplo :
 *         Mantenimiento de logs de procesos de carga
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 10/05/2010
 *         XPL(iniciales) 1. Creaci�n del Service. 14455: ENSA101 - Proc�s de
 *         c�rrega de fitxers
 */
public class Axisint001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisint001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
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
	public void m_form(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		try {
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			// Si SPROCES esta informado buscamos los datos
			if (SPROCES == null) {
				SPROCES = this.getCampoNumerico(request, "SPROCESBUSQ");
			}
			if (SPROCES != null) {
				formdata.put("SPROCES", SPROCES);
				this.m_buscarFicherosCarga(request, thisAction);
				this.m_cargarCombos(request, thisAction);
				this.m_getMaximRegistros(request);
			}

			String CMODO = this.getCampoTextual(request, "CMODO");
			logger.debug("--- CMODO:" + CMODO);

			AbstractDispatchAction.topPila(request, "CMODO", CMODO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos AJAX
	 ********************************************************/

	/*********************************************************************************************************************/
	public void m_ajax_busqueda_lineas(HttpServletRequest request) {
		logger.debug("Axisint001Service m_ajax_busqueda_lineas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_GESTION_PROCESOS pac_axis_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal CESTADOLINEA = this.getCampoNumerico(request, "CESTADOLINEA");
			BigDecimal CTIPO = this.getCampoNumerico(request, "CTIPO");
			String VALOR = this.getCampoTextual(request, "VALOR");
			String IDINT = this.getCampoTextual(request, "IDINT");
			String IDEXT = this.getCampoTextual(request, "IDEXT");
			BigDecimal CREVISADO = this.getCampoNumerico(request, "CREVISADO");

			Map map = pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(SPROCES, null, CTIPO,
					VALOR, IDINT, IDEXT, CESTADOLINEA, CREVISADO);
			logger.debug(map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("ctrlLinea", map.get("PCURCARGALINEA"));
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_ajax_busqueda_lineas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_errores(HttpServletRequest request) {
		logger.debug("Axisint001Service m_ajax_busqueda_errores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_GESTION_PROCESOS pac_axis_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal NLINEA = this.getCampoNumerico(request, "NLINEA");
			BigDecimal NERROR = this.getCampoNumerico(request, "NERROR");

			Map map = pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA_ERROR(SPROCES, NLINEA,
					NERROR);
			logger.debug(map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("ctrlLineaError", map.get("PCURCARGALINEA_ERRS"));
				if (!isEmpty(map.get("PCURCARGALINEA_ERRS")) && isEmpty(NERROR)) {
					ArrayList PCURCARGALINEA_ERRS = (ArrayList) map.get("PCURCARGALINEA_ERRS");
					if (PCURCARGALINEA_ERRS.size() > 0) {
						Map m = (Map) PCURCARGALINEA_ERRS.get(0);
						NERROR = new BigDecimal(String.valueOf(m.get("NERROR")));
						formdata.put("NERROR", NERROR);
					}
				}
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_ajax_busqueda_errores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_navegar(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_navegar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			String NSINIESselected = getCampoTextual(request, "NSINIESselected");

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal NLINEAINDX = getCampoNumerico(request, "NLINEAINDX");

			thisAction.topPila(request, "SPROCES", SPROCES);
			thisAction.topPila(request, "NLINEA", NLINEA);
			thisAction.topPila(request, "NLINEAINDX", NLINEAINDX);

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "SPERSON", SPERSON);
			thisAction.topPila(request, "NRECIBO", NRECIBO);
			thisAction.topPila(request, "NTRAMIT", NTRAMIT);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			thisAction.topPila(request, "formdata_axisint001", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volver(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", (String) thisAction.removeTopPila(request, "NSINIES"));

			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON")));
			formdata.put("NRECIBO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NRECIBO")));
			formdata.put("NTRAMIT", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NTRAMIT")));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));

			formdata.put("SPROCES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPROCES")));
			formdata.put("NLINEA", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NLINEA")));
			formdata.put("NLINEAINDX",
					bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NLINEAINDX")));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * Metodos Reproceso
	 ***************************************************/

	/*********************************************************************************************************************/
	public void m_reprocesar(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_reprocesar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_CFG_FILE pac_iax_cfg_file = new PAC_IAX_CFG_FILE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CPROCESO = this.getCampoNumerico(request, "CPROCESO");
			String TFICHERO = this.getCampoTextual(request, "TFICHERO");
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal CVALIDA = this.getCampoNumerico(request, "IDVALIDACION");
			// BigDecimal IDVALIDA= new
			// BigDecimal((char[])request.getAttribute("IDVALIDA"));

			if (CVALIDA.equals(new BigDecimal(1))) {
				Map map = pac_iax_cfg_file.ejecutaPAC_IAX_CFG_FILE__F_EJECUTA_PROCESO(CPROCESO, TFICHERO, SPROCES,
						CVALIDA);
				logger.debug(map);

				if (!isEmpty((List) map.get("MENSAJES"))) {
					Map mensajes = (Map) ((List) map.get("MENSAJES")).get(0);
					if (!isEmpty(mensajes)) {
						if (!isEmpty(mensajes.get("OB_IAX_MENSAJES"))) {
							if (!isEmpty(((Map) mensajes.get("OB_IAX_MENSAJES")).get("TERROR")))
								formdata.put("resultReprocesar", ((Map) mensajes.get("OB_IAX_MENSAJES")).get("TERROR"));
						}
					}
				}
				tratarRETURNyMENSAJES(request, map);

				formdata.put("CVALIDA", CVALIDA);

			} else {
				Map map = pac_iax_cfg_file.ejecutaPAC_IAX_CFG_FILE__F_EJECUTA_PROCESO(CPROCESO, TFICHERO, SPROCES,
						null);
				logger.debug(map);

				if (!isEmpty((List) map.get("MENSAJES"))) {
					Map mensajes = (Map) ((List) map.get("MENSAJES")).get(0);
					if (!isEmpty(mensajes)) {
						if (!isEmpty(mensajes.get("OB_IAX_MENSAJES"))) {
							if (!isEmpty(((Map) mensajes.get("OB_IAX_MENSAJES")).get("TERROR")))
								formdata.put("resultReprocesar", ((Map) mensajes.get("OB_IAX_MENSAJES")).get("TERROR"));
						}
					}
				}
				tratarRETURNyMENSAJES(request, map);

				formdata.put("CVALIDA", CVALIDA);

			}
			;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_reprocesar", e);
		}
	}

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisint001Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal registroOK = new BigDecimal(1);
			String strCMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");
			String[] C_FICHERO_OUT = { "RETURN" };
			List<String> lstCMAP = Arrays.asList(strCMAP.split(","));
			Map mapResp = new HashMap();
			for (String CMAP : lstCMAP) {
				Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, CPARAMETROS);
				logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);
				mapResp.put("RESPUESTA" + CMAP, map);
			}

			ajax.guardarContenidoFinalAContenedorAjax(mapResp);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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

	private void m_buscarFicherosCarga(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint002Service m_buscarFicherosCarga");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_GESTION_PROCESOS pac_axis_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			Map map = pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERA(SPROCES, null, null,
					null, null, null, null);
			logger.debug("PAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_CABECERARetorna: " + map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("ctrlCabecera", map.get("PCURCARGA"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_buscarFicherosCarga", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Metodo que recupera el parametro N_MAX_REG ( Numero maximos de filas
	 * devuletas por una select
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void m_getMaximRegistros(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("N_MAX_REG_CTRL");
		if (m.get("RETURN") != null) {
			formdata.put("MAXREGISTROS", m.get("RETURN"));
		} else {
			m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("N_MAX_REG");
			if (m.get("RETURN") != null) {
				formdata.put("MAXREGISTROS", m.get("RETURN"));
			} else {
				formdata.put("MAXREGISTROS", Integer.MAX_VALUE);
			}
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. PFA 19052010 BUG 14455
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint002Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.error("m_cargarCombos Formdata: " + formdata.toString());
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800019));
			listValores.put("lstestadolin", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800018));
			listValores.put("lsttipolin", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint002Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", ((!isEmpty(listValores)) ? listValores : new HashMap()));
		}
	}

	// @SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		// this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES2");

			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO2");
			// BigDecimal CPROCESO=isEmpty((String)AbstractDispatchAction.topPila(request,
			// "CPROCESO"))?null:new
			// BigDecimal((String)AbstractDispatchAction.topPila(request, "CPROCESO"));

			// this.getHiddenCampoNumerico(request, "SPRODUC");
			// String CLISTADO=this.getHiddenCampoTextual(request, "CLISTADO");
			// String CMODO=(String)AbstractDispatchAction.topPila(request, "CMODO");

			/*
			 * String PPARAMS=this.getHiddenCampoTextual(request, "PPARAMS"); if
			 * (PPARAMS.toUpperCase().indexOf("CEMPRES")==-1) {
			 * PPARAMS+="CEMPRES:"+usuario.getCempres()+"|"; }
			 */
			if (isEmpty(CEMPRES))
				CEMPRES = usuario.getCempres();

			logger.debug("va llamar pl");

			// Map map=new
			// PAC_IAX_CFG((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(CEMPRES,
			// whoami(this).toUpperCase(), CMODO, SPRODUC, "|"+CLISTADO+"|", PPARAMS);
			Map map = new PAC_IAX_GESTION_PROCESOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_FICHEROS(CEMPRES, SPROCES, CPROCESO);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

				formdata.put("LIST_FICHEROS", map.get("VTIMP"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Metodo que obtiene un objeto con toda la informaci�n de la tabla que toque.
	 * 
	 * @param request
	 */
	public void m_ActualizaTablaErr(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_ActualizaTablaErr");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		String NOMBRECAPA = getCampoTextual(request, "NOMBRECAPA");
		String NOMBREDIV = getCampoTextual(request, "NOMBREDIV");
		BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
		BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");
		BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
		try {
			PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA_TEXT(SPROCES,
					CPROCESO, NLINEA);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("TCOLUMNAS", map.get("PTEXTO"));
			formdata.put("NOMBRECAPA", NOMBRECAPA);
			formdata.put("NOMBREDIV", NOMBREDIV);
			formdata.put("NLINEA", NLINEA);
			ajax.guardarContenidoFinalAContenedorAjax(formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_cargaTabla", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	public void m_busqueda_lineas(HttpServletRequest request, Axisint001Action thisAction) {
		logger.debug("Axisint001Service m_busqueda_lineas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_GESTION_PROCESOS pac_axis_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal CESTADOLINEA = this.getCampoNumerico(request, "CESTADOLINEA");
			BigDecimal CTIPO = this.getCampoNumerico(request, "CTIPO");
			String VALOR = this.getCampoTextual(request, "VALOR");
			String IDINT = this.getCampoTextual(request, "IDINT");
			String IDEXT = this.getCampoTextual(request, "IDEXT");
			BigDecimal CREVISADO = this.getCampoNumerico(request, "CREVISADO");

			Map map = pac_axis_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_CTRL_LINEA(SPROCES, null, CTIPO,
					VALOR, IDINT, IDEXT, CESTADOLINEA, CREVISADO);
			logger.debug(map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				List listacargas = (List) map.get("PCURCARGALINEA");
				formdata.put("ctrlLinea", listacargas);
			}

			Map m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("N_MAX_REG");
			if (m.get("RETURN") != null) {
				formdata.put("MAXREGPAG", m.get("RETURN"));
			} else {
				formdata.put("MAXREGPAG", 300);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisint001Service - m�todo m_busqueda_lineas", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
