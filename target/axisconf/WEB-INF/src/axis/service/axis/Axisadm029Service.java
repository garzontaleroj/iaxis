package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_DOMICILIACIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm029Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm029Service.java 26/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm029Service extends AxisBaseService {
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
		logger.debug("Axisadm029Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM029"),
							new String("REIMPRESIO"), null);

			logger.debug("----> listados:" + map);
			formdata.put("LISTMAPS", map.get("PCURCONFIGSINF"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_form", e);
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
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisadm029Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("DOM_"))
				request.getSession().removeAttribute(attribute);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	/*
	 * @SuppressWarnings("all") public void
	 * m_ajax_actualizar_combos(HttpServletRequest request) {
	 * logger.debug("Axisadm029Service m_actualizar_combos"); AjaxContainerService
	 * ajax = new AjaxContainerService(); UsuarioBean usuario =
	 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * Map<String, Map> ajaxResponse = new HashMap<String, Map>();
	 * 
	 * try { char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
	 * BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES"); BigDecimal CRAMO =
	 * getCampoNumerico(request, "CRAMO");
	 * 
	 * Map ramos = new HashMap(); Map productos = new HashMap();
	 * 
	 * PAC_IAX_LISTVALORES pacIaxListValores = new
	 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN));
	 * 
	 * switch (comboOrigen) { case 'E': // Cargar Ramos if (!isEmpty(CEMPRES)) {
	 * ramos =
	 * pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
	 * logger.debug(ramos); ajax.rellenarPlAContenedorAjax(ramos);
	 * ajaxResponse.put("CRAMO", ramos);
	 * request.getSession().setAttribute("DOM_LSTRAMOS",
	 * tratarRETURNyMENSAJES(request, ramos)); } break;
	 * 
	 * case 'R': // Cargar Productos if (!isEmpty(CRAMO)) { BigDecimal CTERMFIN =
	 * BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN productos =
	 * pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(CRAMO,
	 * CTERMFIN); logger.debug(productos);
	 * ajax.rellenarPlAContenedorAjax(productos); ajaxResponse.put("SPRODUC",
	 * productos); request.getSession().setAttribute("DOM_LSTPRODUCTOS",
	 * tratarRETURNyMENSAJES(request, productos)); } break; }
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axisadm029Service - m�todo m_actualizar_combos",
	 * e); ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 */

	/**
	 * @param request
	 */
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCDOM");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			String CADENA = getCampoTextual(request, "CADENA");

			// bug 18825/90046
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CREFERENCIA");
			//
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TAGENTE = getCampoTextual(request, "TAGENTE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TTOMADOR = getCampoTextual(request, "TTOMADOR");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			Date FINIREM = stringToSqlDate(getCampoTextual(request, "FINIREM"));
			Date FFINREM = stringToSqlDate(getCampoTextual(request, "FFINREM"));

			formdata.put("SPROCES", SPROCES);

			if (SPRODUC != null || (CADENA != null && !CADENA.equals(""))) {
				Map map = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DOMICILIACIONES__F_GET_PROCESO();
				logger.debug(map);
				SPROCDOM = (BigDecimal) map.get("PSPROCES");
				formdata.put("SPROCDOM", SPROCDOM);
			}

			m_obtener_marcados(request, SPROCDOM);

			logger.debug("SPROCDOM --->" + SPROCDOM);
			logger.debug("SPROCES --->" + SPROCES);
			logger.debug("FINIREM --->" + FINIREM);
			logger.debug("FFINREM --->" + FFINREM);

			if (!isEmpty(SPROCES)) {
				// bfp bug 21721 ini
				Map remMapa = new PAC_IAX_DOMICILIACIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION_CAB(CEMPRES, SPROCES, CCOBBAN, FINIREM,
								FFINREM);
				logger.debug(remMapa);
				List<Map> rMap = (List<Map>) tratarRETURNyMENSAJES(request, remMapa, false);
				logger.debug(rMap);
				formdata.putAll((Map) rMap.get(0));
			} else {
				formdata.put("CREMBAN", null);
				formdata.put("TESTDOM", null);
			}
			// bfp bug 21721 fi

			Map mapa = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(SPROCES, CEMPRES, CRAMO, SPRODUC, FEFECTO,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO, CAGENTE, TAGENTE,
							NNUMIDE, TTOMADOR, NRECIBO);
			logger.debug(mapa);

			List<Map> LST_DOMICILIACIONES = (List<Map>) tratarRETURNyMENSAJES(request, mapa, false);

			if (!isEmpty(LST_DOMICILIACIONES)) {
				SINPAQUETE sinPaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				/*
				 * if (isEmpty(LSTRECIBOS)) // No se han encontrado datos
				 * AbstractDispatchAction.guardarMensaje(request, "120135", null,
				 * Constantes.MENSAJE_INFO);
				 */

				request.getSession().setAttribute("REC_LSTRECIBOS", LST_DOMICILIACIONES);

				for (Map registro : LST_DOMICILIACIONES) {
					// Recuperar descripci�n empresa
					/*
					 * BigDecimal EMPRESA = (BigDecimal) registro.get("EMPRESA");
					 * 
					 * if (!isEmpty(EMPRESA)) { map = sinPaquete.ejecutaF_DESEMPRESA(EMPRESA, null,
					 * ""); if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					 * registro.put("EMPRESA", map.get("PTEMPRES")); }
					 * 
					 * // Formatear COBRADOR String COBRADOR = (String) registro.get("COBRADOR");
					 * BigDecimal CTIPBAN_COBRA = (BigDecimal) registro.get("CTIPBAN_COBRA");
					 * 
					 * if (!isEmpty(CTIPBAN_COBRA) && !isEmpty(COBRADOR)) { registro.put("COBRADOR",
					 * tratarRETURNyMENSAJES(request,
					 * pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN_COBRA, COBRADOR))); }
					 */

					// Formatear CCC
					String CBANCAR = (String) registro.get("CBANCAR");
					BigDecimal CTIPBAN_CBAN = (BigDecimal) registro.get("CTIPBAN_CBAN");

					if (!isEmpty(CTIPBAN_CBAN) && !isEmpty(CBANCAR)) {
						registro.put("CBANCAR", tratarRETURNyMENSAJES(request,
								pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN_CBAN, CBANCAR), false));
					}

					/*
					 * @deprecated Mostrar fichero por pantalla, no se usa. // Recuperar FICHERO
					 * String FICHERO = (String) registro.get("FICHERO"); if (!isEmpty(FICHERO))
					 * request.getSession().setAttribute("miFICHERO", FICHERO);
					 */

				}
			}
			String VOLVER = request.getAttribute("POST_CONSULTA") + "";
			if ("N".equals(VOLVER)) {
				request.setAttribute("POST_CONSULTA", "N");
			} else {
				request.setAttribute("POST_CONSULTA", "S");
			}
			request.setAttribute("LST_DOMICILIACIONES", LST_DOMICILIACIONES);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @param request
	 */
	public void m_obtener_marcados(HttpServletRequest request, BigDecimal SPROCES) {
		logger.debug("Axisadm029Service m_obtener_marcados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			String CADENA = getCampoTextual(request, "CADENA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			if (CADENA == null) {
				CADENA = "";
			}

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			String[] cadena = CADENA.split(";");

			PAC_IAX_DOMICILIACIONES pac_iax_adm = new PAC_IAX_DOMICILIACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String LISTA_REC = "";

			if (SPRODUC != null) {
				// Existen combo de productos

				Map mapa = pac_iax_adm.ejecutaPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(CEMPRES, SPROCES, SPRODUC,
						new BigDecimal("1"));
				logger.debug(mapa);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			} else {
				if (CADENA.contains(";")) {
					// Existen el multiregistro con los productos
					for (int i = 0; i < cadena.length; i++) {

						// Llamar a la funci�n para actualizar los valores
						Map mapa = pac_iax_adm.ejecutaPAC_IAX_DOMICILIACIONES__F_SET_PRODDOMIS(CEMPRES, SPROCES,
								new BigDecimal(cadena[i]), new BigDecimal("1"));
						logger.debug(mapa);
						BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * @param request
	 */
	public void m_domiciliar(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_domiciliar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCDOM");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date FFECCOB = stringToSqlDate(getCampoTextual(request, "FFECCOB"));

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CREFERENCIA");
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TAGENTE = getCampoTextual(request, "TAGENTE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TTOMADOR = getCampoTextual(request, "TTOMADOR");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			BigDecimal SPROCES_AUX = getCampoNumerico(request, "SPROCES_");

			if (!isEmpty(SPROCES_AUX) && isEmpty(SPROCES))
				formdata.put("SPROCES", SPROCES_AUX);

			SPROCES = getCampoNumerico(request, "SPROCES");

			Map map = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DOMICILIACIONES__F_DOMICILIAR(SPROCES, CEMPRES, FEFECTO, FFECCOB, CRAMO, SPRODUC,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO, CAGENTE, TAGENTE,
							NNUMIDE, TTOMADOR, NRECIBO);
			logger.debug(map);

			// BFP bug 21116 31/01/2012 encapsulant el codi existent dins de l'IF
			BigDecimal mm = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(mm) && (mm.intValue() == 0)) {

				formdata.remove("CCOBBAN");// BFP bug 21116 31/01/2012 mogut aqu�
				formdata.remove("CBANCO");
				formdata.remove("CTIPCUENTA");
				formdata.remove("FVENTAR");
				formdata.remove("CREFERENCIA");
				formdata.remove("DFEFECTO");

				formdata.remove("SPROCDOM");
				formdata.remove("SPROCES");
				formdata.remove("CEMPRES");
				formdata.remove("CRAMO");
				formdata.remove("CUENTA");
				formdata.remove("SPRODUC");
				formdata.remove("FEFECTO");
				formdata.remove("FFECCOB");// BFP bug 21116 31/01/2012 mogut aqu�

				Map SPROCES_ = new HashMap();
				SPROCES_.put("SPROCES_", map.get("SPROCES"));
				formdata.put("SPROCES_", map.get("SPROCES"));
				formdata.put("SPROCES", map.get("SPROCES"));
				BigDecimal csproces = (BigDecimal) map.get("SPROCES");

				String rutas = (String) map.get("NOMDR");

				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM029"),
								new String("REIMPRESIO"), null);

				List<Map> maps = (List<Map>) map.get("PCURCONFIGSINF");
				String MAPS = new String("|");
				for (Map registro : maps) {
					String CMAP = (String) registro.get("CMAP");
					if (!isEmpty(CMAP)) {
						MAPS = MAPS.toString() + CMAP.toString() + new String("|");
					}
				}

				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM029"),
								new String("REIMPRESIO"), null, MAPS,
								new String("|CSPROCES:" + csproces + "|CEMPRES:|CCOBBAN:|CIDIOMA:|"));

				ArrayList ficheros = new ArrayList();
				ficheros = (ArrayList) map.get("VTIMP");

				String ruta[] = StringUtils.splitByWholeSeparator(rutas, "||");
				Map a = null;

				for (int i = 0; i < ruta.length; i++) {
					Map NOMDR = new HashMap();
					NOMDR.put("FICHERO", ruta[i]);
					a = new HashMap();
					a.put("OB_IAX_IMPRESION", NOMDR);
					ficheros.add(a);
				}

				formdata.put("LIST_FICHEROS", ficheros);
				request.setAttribute("POST_CONSULTA", "S");
				request.setAttribute("RECARGAR", "S");

				Map paramEmpresaMap = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("EXT_FICHERO_DOMI", usuario.getCempres());
				tratarRETURNyMENSAJES(request, paramEmpresaMap);
				String extFicheroDomi = (String) paramEmpresaMap.get("RETURN");
				formdata.put("EXT_FICHERO_DOMI", extFicheroDomi);

			} // BFP bug 21116 31/01/2012

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_domiciliar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_domiciliar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			String CREMBAN = getCampoTextual(request, "CREMBAN");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CIDIOMA = usuario.getCidioma();

			Map map = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DOMICILIACIONES__F_SET_DOMICILIACION_CAB(CEMPRES, SPROCES, CCOBBAN, FEFECTO, null,
							null, null, CREMBAN, null, null, CIDIOMA);
			// (CEMPRES,SPROCES,CCOBBAN,FEFECTO,null,null,null,null,null,CIDIOMA);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_domiciliar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_retroceder(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_domiciliar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CIDIOMA = usuario.getCidioma();

			Map map = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DOMICILIACIONES__F_RETRO_DOMICILIACION(CEMPRES, SPROCES, FEFECTO, CIDIOMA);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_domiciliar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 */
	public void m_ajax_imprimir_previ(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_ajax_imprimir_previ");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String VPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "RETURN" };

			/*
			 * String VPARAMETROS = FFECHA.replaceAll("/",
			 * "")+'|'+CRAMO+'|'+SPRODUC+'|'+CEMPRES+'|'+SPROCDOM+'|'+
			 * CCOBBAN+'|'+CBANCO+'|'+CTIPCUENTA+'|'+FVENTAR+'|'+CREFERENCIA+'|'+ //bug
			 * 0020050 document.miForm.DFEFECTO.value DFFECHA.replaceAll("/", "");
			 */
			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM029"),
							new String("PREVI"), null);
			String CMAP = new String("");
			List<Map> maps = (List<Map>) map.get("PCURCONFIGSINF");
			String MAPS = new String("|");
			for (Map registro : maps) {
				CMAP = (String) registro.get("CMAP");
				if (!isEmpty(CMAP)) {
					MAPS = MAPS.toString() + CMAP.toString() + new String("|");
				}
			}

			/*
			 * map = new
			 * PAC_IAX_CFG((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).
			 * ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new
			 * String("AXISADM029"), new String("PREVI"), null, MAPS, VPARAMETROS );
			 */

			map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, VPARAMETROS);

			logger.debug("ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME" + map);

			/*
			 * formdata.put("LIST_FICHEROS",map.get("VTIMP"));
			 * request.setAttribute("POST_CONSULTA","S");
			 * request.setAttribute("RECARGAR","S");
			 */

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_imprimir_previ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/* ********************************************************** */

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisadm0295Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "RETURN" };

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_generar_resultados_maps(HttpServletRequest request) {
		logger.debug("Axisadm0295Service m_generar_resultados_maps");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String CMAPS = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM029"),
							new String("REIMPRESIO"), null, CMAPS, CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal SPROCES_ = getCampoNumerico(request, "SPROCES_");

			if (!isEmpty(SPROCES_) && isEmpty(SPROCES))
				formdata.put("SPROCES", SPROCES_);

			formdata.put("LIST_FICHEROS", map.get("VTIMP"));
			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("RECARGAR", "S");

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_generar_resultados_maps", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisadm029Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM029"),
							new String("REIMPRESIO"), null);

			logger.debug("----> listados:" + map);
			formdata.put("LISTMAPS", map.get("PCURCONFIGSINF"));

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal SPROCES_ = getCampoNumerico(request, "SPROCES_");

			logger.debug("SPROCES ---------------------------------------->" + SPROCES);
			logger.debug("SPROCES_ ---------------------------------------->" + SPROCES_);

			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCDOM");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			// bug 18825/90046
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CCOBBAN");
			//
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TAGENTE = getCampoTextual(request, "TAGENTE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TTOMADOR = getCampoTextual(request, "TTOMADOR");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			Date FINIREM = stringToSqlDate(getCampoTextual(request, "FINIREM"));
			Date FFINREM = stringToSqlDate(getCampoTextual(request, "FFINREM"));

			formdata.put("SPROCES", SPROCES);

			if (!isEmpty(SPROCES)) {
				// bfp bug 21721 ini
				Map remMapa = new PAC_IAX_DOMICILIACIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION_CAB(CEMPRES, SPROCES, CCOBBAN, FINIREM,
								FFINREM);
				logger.debug(remMapa);
				List<Map> rMap = (List<Map>) tratarRETURNyMENSAJES(request, remMapa, false);
				logger.debug(rMap);
				formdata.putAll((Map) rMap.get(0));
			} else {
				formdata.put("CREMBAN", null);
				formdata.put("TESTDOM", null);
			}
			// bfp bug 21721 fi

			map = new PAC_IAX_DOMICILIACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DOMICILIACIONES__F_GET_DOMICILIACION(SPROCES, CEMPRES, CRAMO, SPRODUC, FEFECTO,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO, CAGENTE, TAGENTE,
							NNUMIDE, TTOMADOR, NRECIBO);
			logger.debug(map);

			List<Map> LST_DOMICILIACIONES = (List<Map>) tratarRETURNyMENSAJES(request, map, false);

			if (!isEmpty(LST_DOMICILIACIONES)) {
				SINPAQUETE sinPaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				for (Map registro : LST_DOMICILIACIONES) {
					// Formatear CCC
					String CBANCAR = (String) registro.get("CBANCAR");
					BigDecimal CTIPBAN_CBAN = (BigDecimal) registro.get("CTIPBAN_CBAN");

					if (!isEmpty(CTIPBAN_CBAN) && !isEmpty(CBANCAR)) {
						registro.put("CBANCAR", tratarRETURNyMENSAJES(request,
								pacIaxCommon.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN_CBAN, CBANCAR), false));
					}

				}
			}
			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("LST_DOMICILIACIONES", LST_DOMICILIACIONES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_consultarDetRecibos(HttpServletRequest request, Axisadm029Action thisAction) {
		logger.debug("Axisadm029Action m_consultarDetRecibos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Push de los datos necesarios a la pila
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			if (!isEmpty(SSEGURO)) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			}

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCDOM");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CCOBBAN");

			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TAGENTE = getCampoTextual(request, "TAGENTE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TTOMADOR = getCampoTextual(request, "TTOMADOR");
			BigDecimal PARNRECIBO = getCampoNumerico(request, "PARNRECIBO");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			// thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "SPROCES", SPROCES);
			thisAction.topPila(request, "SPROCDOM", SPROCDOM);
			thisAction.topPila(request, "CEMPRES", CEMPRES);
			thisAction.topPila(request, "CRAMO", CRAMO);
			thisAction.topPila(request, "FEFECTO", FEFECTO);
			thisAction.topPila(request, "CCOBBAN", CCOBBAN);
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			thisAction.topPila(request, "CBANCO", CBANCO);
			thisAction.topPila(request, "CREFERENCIA", CREFERENCIA);
			thisAction.topPila(request, "FVENTAR", FVENTAR);
			thisAction.topPila(request, "DFEFECTO", DFEFECTO);
			thisAction.topPila(request, "CAGENTE", CAGENTE);
			thisAction.topPila(request, "CTIPCUENTA", CTIPCUENTA);
			thisAction.topPila(request, "NNUMIDE", NNUMIDE);
			thisAction.topPila(request, "TTOMADOR", TTOMADOR);
			thisAction.topPila(request, "TAGENTE", TAGENTE);

			logger.debug("Axisadm029Action m_consultarDetRecibos NRECIBO -->" + NRECIBO);
			logger.debug("Axisadm029Action m_consultarDetRecibos PARNRECIBO -->" + PARNRECIBO);

			thisAction.topPila(request, "NRECIBO", NRECIBO);

			request.setAttribute("buscar", "true");
			request.setAttribute("NRECIBO", PARNRECIBO);
			request.getSession().setAttribute("OCULTAR_LUPA_RECIBOS", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_consultarDetRecibos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_volverDetRec(HttpServletRequest request, Axisadm029Action thisAction) {
		logger.debug("Axisadm029Action m_volverDetRec");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));

			formdata.put("SPROCES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPROCES")));
			formdata.put("SPROCDOM", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPROCDOM")));
			formdata.put("CEMPRES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CEMPRES")));
			formdata.put("CRAMO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CRAMO")));
			formdata.put("FEFECTO", thisAction.removeTopPila(request, "FEFECTO"));
			formdata.put("CCOBBAN", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CCOBBAN")));
			formdata.put("SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPRODUC")));
			formdata.put("CBANCO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CBANCO")));
			formdata.put("FVENTAR", thisAction.removeTopPila(request, "FVENTAR"));
			formdata.put("DFEFECTO", thisAction.removeTopPila(request, "DFEFECTO"));
			formdata.put("CAGENTE", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CAGENTE")));
			formdata.put("CTIPCUENTA",
					bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CTIPCUENTA")));
			formdata.put("NNUMIDE", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NNUMIDE")));
			formdata.put("TTOMADOR", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "TTOMADOR")));
			formdata.put("TAGENTE", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "TAGENTE")));
			formdata.put("NRECIBO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NRECIBO")));
			logger.debug("Axisadm029Action m_volverDetRec NRECIBO -->"
					+ bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NRECIBO")));
			request.setAttribute("POST_CONSULTA", "N");
			thisAction.removeTopPila(request, "NRECIBO");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_volverDetRec", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

}
