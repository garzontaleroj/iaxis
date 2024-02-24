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
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PRENOTIFICACIONES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm068Service.java 26/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm068Service extends AxisBaseService {
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
		logger.debug("Axisadm68Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM068"),
							new String("REIMPRESIO"), null);

			logger.debug("----> listados:" + map);
			formdata.put("LISTMAPS", map.get("PCURCONFIGSINF"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm68Service - m�todo m_form", e);
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
		logger.debug("Axisadm68Service borrarAtributosSession");

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
	 * logger.debug("Axisadm68Service m_actualizar_combos"); AjaxContainerService
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
	 * PAC_IAX_LISTVALORES(((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)));
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
	 * error("Error en el servicio Axisadm068Service - m�todo m_actualizar_combos",
	 * e); ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 */

	/**
	 * @param request
	 */
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisadm068Service m_consultar");
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

			formdata.put("SPROCES", SPROCES);

			if (SPRODUC != null || (CADENA != null && !CADENA.equals(""))) {
				Map map = new PAC_IAX_PRENOTIFICACIONES(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_PROCESO();
				logger.debug(map);
				SPROCDOM = (BigDecimal) map.get("PSPROCES");
				formdata.put("SPROCDOM", SPROCDOM);
			}

			m_obtener_marcados(request, SPROCDOM);

			Map mapa = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(SPROCES, CEMPRES, CRAMO, SPRODUC, FEFECTO,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO);
			logger.debug(mapa);

			List<Map> LST_DOMICILIACIONES = (List<Map>) tratarRETURNyMENSAJES(request, mapa, false);

			if (!isEmpty(LST_DOMICILIACIONES)) {
				SINPAQUETE sinPaquete = new SINPAQUETE(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
				PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

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
			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("LST_DOMICILIACIONES", LST_DOMICILIACIONES);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm068Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * @param request
	 */
	public void m_obtener_marcados(HttpServletRequest request, BigDecimal SPROCES) {
		logger.debug("Axisadm068Service m_domiciliar");
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

			PAC_IAX_PRENOTIFICACIONES pac_iax_adm = new PAC_IAX_PRENOTIFICACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

			String LISTA_REC = "";

			if (SPRODUC != null) {
				// Existen combo de productos

				Map mapa = pac_iax_adm.ejecutaPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(CEMPRES, SPROCES, SPRODUC,
						new BigDecimal("1"));
				logger.debug(mapa);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			} else {
				if (CADENA.contains(";")) {
					// Existen el multiregistro con los productos
					for (int i = 0; i < cadena.length; i++) {

						// Llamar a la funci�n para actualizar los valores
						Map mapa = pac_iax_adm.ejecutaPAC_IAX_PRENOTIFICACIONES__F_SET_PRODDOMIS(CEMPRES, SPROCES,
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
		logger.debug("Axisadm068Service m_domiciliar");
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

			Map map = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_DOMICILIAR(SPROCES, CEMPRES, FEFECTO, FFECCOB, CRAMO, SPRODUC,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERENCIA, DFEFECTO);
			logger.debug(map);
			// BFP bug 21116 31/01/2012 encapsulant el codi existent dins de l'IF
			BigDecimal mm = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(mm) && (mm.intValue() == 0)) {

				formdata.remove("SPROCDOM");// BFP bug 21116 31/01/2012 mogut aqu�
				formdata.remove("SPROCES");
				formdata.remove("CEMPRES");
				formdata.remove("CRAMO");
				formdata.remove("CUENTA");
				formdata.remove("SPRODUC");
				formdata.remove("FEFECTO");
				formdata.remove("FFECCOB");

				formdata.remove("CCOBBAN");
				formdata.remove("CBANCO");
				formdata.remove("CTIPCUENTA");
				formdata.remove("FVENTAR");
				formdata.remove("CREFERENCIA");
				formdata.remove("DFEFECTO");// BFP bug 21116 31/01/2012 mogut aqu�

				Map SPROCES_ = new HashMap();
				SPROCES_.put("SPROCES_", map.get("SPROCES"));
				formdata.put("SPROCES_", map.get("SPROCES"));
				formdata.put("SPROCES", map.get("SPROCES"));
				BigDecimal csproces = (BigDecimal) map.get("SPROCES");

				String rutas = (String) map.get("NOMDR");

				map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM068"),
								new String("REIMPRESIO"), null);

				List<Map> maps = (List<Map>) map.get("PCURCONFIGSINF");
				String MAPS = new String("|");
				for (Map registro : maps) {
					String CMAP = (String) registro.get("CMAP");
					if (!isEmpty(CMAP)) {
						MAPS = MAPS.toString() + CMAP.toString() + new String("|");
					}
				}

				map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM068"),
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

			}
			// BFP bug 21116 31/01/2012

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm068Service - m�todo m_domiciliar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 */
	// BUG 21120-0108594-20120228-JLTS-Se adiciona el m_redomiciliar
	public void m_redomiciliar(HttpServletRequest request) {
		logger.debug("Axisadm068Service m_redomiciliar");
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

			formdata.remove("SPROCDOM");
			formdata.remove("SPROCES");
			formdata.remove("CEMPRES");
			formdata.remove("CRAMO");
			formdata.remove("CUENTA");
			formdata.remove("SPRODUC");
			formdata.remove("FEFECTO");
			formdata.remove("FFECCOB");

			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERENCIA = getCampoTextual(request, "CREFERENCIA");
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			formdata.remove("CCOBBAN");
			formdata.remove("CBANCO");
			formdata.remove("CTIPCUENTA");
			formdata.remove("FVENTAR");
			formdata.remove("CREFERENCIA");
			formdata.remove("DFEFECTO");

			Map map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM068"),
							new String("REIMPRESIO"), null);

			List<Map> maps = (List<Map>) map.get("PCURCONFIGSINF");
			String MAPS = new String("|");
			for (Map registro : maps) {
				String CMAP = (String) registro.get("CMAP");
				if (!isEmpty(CMAP)) {
					MAPS = MAPS.toString() + CMAP.toString() + new String("|");
				}
			}

			map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM068"),
							new String("REIMPRESIO"), null, MAPS,
							new String("|CSPROCES:" + SPROCES + "|CEMPRES:|CCOBBAN:|CIDIOMA:|"));

			PAC_IAX_PRENOTIFICACIONES pac_iax_prenotificaciones = new PAC_IAX_PRENOTIFICACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map2 = pac_iax_prenotificaciones.ejecutaPAC_IAX_PRENOTIFICACIONES__F_DOMRECIBOS(CEMPRES, SPROCES,
					FFECCOB);

			ArrayList ficheros = new ArrayList();
			ficheros = (ArrayList) map.get("VTIMP");
			if (map2.get("VTIMP") != null)
				ficheros.add(((ArrayList) map2.get("VTIMP")).get(0));

			formdata.put("LIST_FICHEROS", ficheros);
			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("RECARGAR", "S");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm068Service - m�todo m_domiciliar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/* ********************************************************** */

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisadm0685Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "RETURN" };

			Map map = new PAC_IAX_MAP(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
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
			logger.error("Error en el servicio Axisctr068Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_generar_resultados_maps(HttpServletRequest request) {
		logger.debug("Axisadm0685Service m_generar_resultados_maps");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String CMAPS = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");

			Map map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM068"),
							new String("REIMPRESIO"), null, CMAPS, CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			formdata.put("LIST_FICHEROS", map.get("VTIMP"));
			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("RECARGAR", "S");

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm068Service - m�todo m_generar_resultados_maps", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisadm068Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			map = new PAC_IAX_CFG(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM068"),
							new String("REIMPRESIO"), null);

			logger.debug("----> listados:" + map);
			formdata.put("LISTMAPS", map.get("PCURCONFIGSINF"));

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal SPROCDOM = getCampoNumerico(request, "SPROCES");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));

			// bug 18825/90046
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CTIPCUENTA = getCampoNumerico(request, "CTIPCUENTA");
			String FVENTAR = getCampoTextual(request, "FVENTAR");
			String CREFERANCIA = getCampoTextual(request, "CCOBBAN");
			//
			Date DFEFECTO = stringToSqlDate(getCampoTextual(request, "DFEFECTO"));

			formdata.put("SPROCES", SPROCES);

			map = new PAC_IAX_PRENOTIFICACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRENOTIFICACIONES__F_GET_DOMICILIACION(SPROCES, CEMPRES, CRAMO, SPRODUC, FEFECTO,
							SPROCDOM, CCOBBAN, CBANCO, CTIPCUENTA, FVENTAR, CREFERANCIA, DFEFECTO);
			logger.debug(map);

			List<Map> LST_DOMICILIACIONES = (List<Map>) tratarRETURNyMENSAJES(request, map, false);

			if (!isEmpty(LST_DOMICILIACIONES)) {
				SINPAQUETE sinPaquete = new SINPAQUETE(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
				PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

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
			logger.error("Error en el servicio Axisadm068Service - m�todo m_recargar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
