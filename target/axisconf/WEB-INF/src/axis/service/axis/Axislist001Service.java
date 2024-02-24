package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;
import oracle.sql.DATE;

public class Axislist001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos de una
	 * p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug("PRIMERA PARTE DE LA PANTALLA axissin001---------------------------------------->" + m);
		return (Map) tratarRETURNyMENSAJES(request, m);
	}

	public void m_init(HttpServletRequest request, Axislist001Action thisAction) {
		try {

			cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la p�liza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axislist001Action thisAction) {

		logger.debug("Axislist001Action m_form");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		try {

			cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist001Action - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarCombos(HttpServletRequest request, Axislist001Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		Map listValores = new HashMap();
		try {

			BigDecimal CAGENTE_PERSN = usuario.getCagente();
			formdata.put("CAGENTE_PERSN", CAGENTE_PERSN); // Es necesario para la opci�n de nueva persona

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDEC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			logger.debug("params SSEGURO-->" + SSEGURO);
			logger.debug("params NRIESGO-->" + NRIESGO);
			logger.debug("params SPRODUC-->" + SPRODUC);
			logger.debug("params CTIPDEC-->" + CTIPDEC);
			logger.debug("params CAGENTE-->" + CAGENTE);

			/* Calculamos el a�o actual */
			Date NANYO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "NANYO"));
			logger.debug("DATA 0 : " + getCampoTextual(request, "NANYO"));
			if (isEmpty(NANYO))
				NANYO = (Date) fcGetFechaActual();

			String fecha_anyo = AxisBaseService.datePrintfddMMyyyy(NANYO);

			logger.debug("String date" + fecha_anyo);

			fecha_anyo = fecha_anyo.substring(6, 10);
			formdata.put("NANYO", fecha_anyo);

			formdata.put("CIDIOMA", usuario.getCidioma());
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			SPRODUC = new BigDecimal(0);
			// this.getHiddenCampoNumerico(request, "SPRODUC");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(CEMPRES, whoami(this).toUpperCase(), CMODO, SPRODUC);

			logger.debug(map);
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				listValores.put("informes", map.get("PCURCONFIGSINF"));
			/* Lista informes */
			/*
			 * Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			 * BigDecimal("1021")); logger.debug(map); listValores.put("informes",
			 * (List)tratarRETURNyMENSAJES(request, map));
			 */

			/* Lista periodicidad */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1024")); // 800026
			logger.debug(map);
			listValores.put("periodicidad", (List) tratarRETURNyMENSAJES(request, map));
			/* Lista tipos */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1022"));
			logger.debug(map);
			listValores.put("tipos", (List) tratarRETURNyMENSAJES(request, map));

			/* Lista negocios */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1023"));
			logger.debug(map);
			listValores.put("negocios", (List) tratarRETURNyMENSAJES(request, map));

			/* Lista de meses */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("54"));
			logger.debug(map);
			listValores.put("meses", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listvalores", listValores);

			/* Lista de negocio */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("54"));
			logger.debug(map);
			listValores.put("negocio", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listvalores", listValores);

			/* Lista de facturacion */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("54"));
			logger.debug(map);
			listValores.put("facturacion", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listvalores", listValores);

			/* Lista de tipo */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("54"));
			logger.debug(map);
			listValores.put("tipo", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist00Service - m�todo cargarInfor", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	public int CalculaDias(int anyo, int mes) throws Exception {

		Calendar cal = new GregorianCalendar(anyo, mes - 1, 1); // primer d�a del mes por defecto
		int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		return days;
	}

	/**
	 * TODO -Para efectuar la demo del dia 08-01-08, este m�todo pasa temporalmente
	 * a ser de http request/response. Deberemos en js vaciar todo el displayTag
	 * para evitar que las garantias antiguas continuen en pantalla (cuando queramos
	 * cambiar fecha).
	 * 
	 * M�todo que se llama al cambiar la fecha de siniestro si y s�lo si hay un
	 * riesgo seleccionado. Con �sto, cargamos las garantias asociadas a la p�liza
	 * seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cargar_lista(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_ajax_cambiar_fecha_siniestro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "SRIESGO");
			DATE FSINIES = new DATE(ConversionUtil.getTimeStamp(getCampoTextual(request, "FSINIES")));
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");

			Map plGetPolGarantiasReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);
			List getPolGarantiasReturn = (List) ajax.rellenarPlAContenedorAjax(plGetPolGarantiasReturn);

			request.getSession().removeAttribute("T_IAX_GARANTIAS");

		} catch (Exception e) {
			logger.error("Axislist001Service m_ajax_cargar_lista - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_cargar_tipo(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_ajax_cambiar_fecha_siniestro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPO");
			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(CTIPAGE, CIDIOMA, null);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axislist001Service m_ajax_cargar_tipos - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_cargar_negocio(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_ajax_cargar_negocio");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal CNEGOCIO = getCampoNumerico(request, "CNEGOCIO");
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CEMPRESA = usuario.getCempres();
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_NEGOCIO(CNEGOCIO, CIDIOMA, CEMPRESA,
					SPRODUC);

			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axislist001Service m_ajax_cargar_negocio - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 */
	public void m_consultar(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axissin032Service m_consultar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila

			/*
			 * BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES"); BigDecimal
			 * SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			 * thisAction.topPila(request, "NSINIES", NSINIES); thisAction.topPila(request,
			 * "SSEGURO", SSEGURO);
			 */

			thisAction.topPila(request, "formdata_axislist001", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist001Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 */
	public void m_ejecutar(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001 m_ejecutar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			cargarCombos(request, thisAction);

			/* Recuperar variable con valores checkbox */

			BigDecimal TOT_FILAS = getCampoNumerico(request, "TOTAL_FILAS");
			String CODIGOSN = "";

			for (int i = 0; i < TOT_FILAS.intValue(); i++) {

				String valor = getCampoTextual(request, "CHK_" + i);
				if (valor != null) {
					String campo = getCampoTextual(request, "NORDEN_" + i);
					if ("".equals(CODIGOSN)) {

						CODIGOSN = campo;
					} else {
						CODIGOSN = CODIGOSN + "," + campo;
					}

				}
			}

			logger.debug("VALOR_FINAL:" + CODIGOSN);

			BigDecimal CINFORME = getCampoNumerico(request, "INFORME");
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CEMPRES = usuario.getCempres();

			Date FINIEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINICIO"));

			Date FFINEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFIN"));

			/* Calculamos el rango de fechas */
			if (FINIEFE == null && FFINEFE == null) {

				/*
				 * ******************************* ************************************
				 * ****************************
				 */

				BigDecimal NPERIOD = getCampoNumerico(request, "NPERIOD");
				BigDecimal ANYO = getCampoNumerico(request, "NANYO");
				String NMES = getCampoTextual(request, "NMES");
				BigDecimal NNMES = getCampoNumerico(request, "NMES");

				logger.debug(NPERIOD);
				logger.debug(ANYO);
				logger.debug(NMES);
				logger.debug(NNMES);

				NMES = getFullString(NMES, "0", 2);
				logger.debug("******NPERIOD:" + NPERIOD);
				if (NPERIOD.intValue() == 1) { // Opcion mensual 03 - 01/03/2010 hasta 31/03/2010
					FINIEFE = AxisBaseService.stringToSqlDate("01/" + NMES + "/" + ANYO);
					logger.debug("******NMES:" + NMES);
					logger.debug("******ANYO:" + ANYO);

					FFINEFE = AxisBaseService.stringToSqlDate(
							this.CalculaDias(ANYO.intValue(), NNMES.intValue()) + "/" + NMES + "/" + ANYO);

				} else if (NPERIOD.intValue() == 2) { // Opcion acumulado Anual
					FINIEFE = AxisBaseService.stringToSqlDate("01/01/" + ANYO);
					logger.debug("******" + NMES);

					FFINEFE = AxisBaseService.stringToSqlDate(
							this.CalculaDias(ANYO.intValue(), NNMES.intValue()) + "/" + NMES + "/" + ANYO);
				} else { // Opcion Interanual
//                       FINIEFE = AxisBaseService.stringToSqlDate("01/01/" + (ANYO.intValue()-1));        

					FINIEFE = AxisBaseService.stringToSqlDate("01/" + NMES + "/" + (ANYO.intValue() - 1)); // -- Bug
																											// 0019794 -
																											// 18/11/2011
																											// - FAL
					logger.debug("******" + NMES);
					FFINEFE = AxisBaseService.stringToSqlDate("01/" + NMES + "/" + ANYO);
				}

				/*
				 * ******************************* ************************************
				 * ****************************
				 */
			}

			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPO");
			BigDecimal CAGENTE = getCampoNumerico(request, "TIPOZONA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CNEGOCIO = getCampoNumerico(request, "CNEGOCIO");

			String SPRODUC = getCampoTextual(request, "SPRODUC");

			Map m = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_LANZAR_LIST001(CINFORME, CIDIOMA, CEMPRES, FINIEFE, FFINEFE, CTIPAGE,
							CAGENTE, SPERSON, CNEGOCIO, CODIGOSN, SPRODUC);

			String FICHERO = (String) m.get("P_FGENERADO");
			logger.debug("Fichero generado **********************************" + FICHERO);

			BigDecimal RESULTADO = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (RESULTADO.intValue() == 0) {
				request.setAttribute("OK", "OK");
				request.setAttribute("FICHERO", FICHERO);
			} else {
				request.setAttribute("OK", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist001Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private String getFullString(String cadena, String prefijo, int longitudMaxima) {
		StringBuffer res = new StringBuffer();
		for (int i = 0; i < (longitudMaxima - cadena.trim().length()); i++) {
			res.append(prefijo);
		}
		res.append(cadena);
		return res.toString();
	}

	/*
	 * *****************************************************************************
	 * ****************************************
	 */
	/*
	 * *****************************************************************************
	 * ****************************************
	 */
	/*
	 * *****************************************************************************
	 * ****************************************
	 */

	/**
	 */
	public void m_ajax_ejecutar(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001 m_ejecutar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			/* ************************************************************************** */
			/* ************************************************************************** */
			/* ************************************************************************** */

			/* Recuperar variable con valores checkbox */

			BigDecimal TOT_FILAS = getCampoNumerico(request, "TOTAL_FILAS");

			String CODIGOSN = getCampoTextual(request, "CADENA");

			logger.debug("VALOR_FINAL:" + CODIGOSN);

			BigDecimal CINFORME = getCampoNumerico(request, "INFORME");
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CEMPRES = usuario.getCempres();

			Date FINIEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINICIO"));

			Date FFINEFE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFIN"));

			/* Calculamos el rango de fechas */
			if (FINIEFE == null && FFINEFE == null) {

				/*
				 * ******************************* ************************************
				 * ****************************
				 */

				BigDecimal NPERIOD = getCampoNumerico(request, "NPERIOD");
				BigDecimal ANYO = getCampoNumerico(request, "NANYO");
				String NMES = getCampoTextual(request, "NMES");
				BigDecimal NNMES = getCampoNumerico(request, "NMES");

				logger.debug(NPERIOD);
				logger.debug(ANYO);
				logger.debug(NMES);
				logger.debug(NNMES);

				NMES = getFullString(NMES, "0", 2);
				logger.debug("******NPERIOD:" + NPERIOD);

				if (NPERIOD.intValue() == 1) { // Opcion mensual 03 - 01/03/2010 hasta 31/03/2010
					FINIEFE = AxisBaseService.stringToSqlDate("01/" + NMES + "/" + ANYO);
					logger.debug("******NMES:" + NMES);
					logger.debug("******ANYO:" + ANYO);
					FFINEFE = AxisBaseService.stringToSqlDate(
							this.CalculaDias(ANYO.intValue(), NNMES.intValue()) + "/" + NMES + "/" + ANYO);

				} else if (NPERIOD.intValue() == 2) { // Opcion acumulado Anual
					FINIEFE = AxisBaseService.stringToSqlDate("01/01/" + ANYO);
					logger.debug("******" + NMES);
					logger.debug("******NMES:" + NMES);
					logger.debug("******ANYO:" + ANYO);
					FFINEFE = AxisBaseService.stringToSqlDate(
							this.CalculaDias(ANYO.intValue(), NNMES.intValue()) + "/" + NMES + "/" + ANYO);
				} else { // Opcion Interanual
//                       FINIEFE = AxisBaseService.stringToSqlDate("01/01/" + (ANYO.intValue()-1));
					FINIEFE = AxisBaseService.stringToSqlDate("01/" + NMES + "/" + (ANYO.intValue() - 1)); // -- Bug
																											// 0019794 -
																											// 18/11/2011
																											// - FAL
					logger.debug("******NMES:" + NMES);
					logger.debug("******ANYO:" + ANYO);
					FFINEFE = AxisBaseService.stringToSqlDate(
							this.CalculaDias(NNMES.intValue(), ANYO.intValue()) + "/" + NMES + "/" + ANYO);
				}

				/*
				 * ******************************* ************************************
				 * ****************************
				 */
			}

			BigDecimal CTIPAGE = getCampoNumerico(request, "CTIPO");
			BigDecimal CAGENTE = getCampoNumerico(request, "TIPOZONA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CNEGOCIO = getCampoNumerico(request, "CNEGOCIO");

			String SPRODUC = getCampoTextual(request, "SPRODUC");

			Map m = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_LANZAR_LIST001(CINFORME, CIDIOMA, CEMPRES, FINIEFE, FFINEFE, CTIPAGE,
							CAGENTE, SPERSON, CNEGOCIO, CODIGOSN, SPRODUC);

			String FICHERO = (String) m.get("P_FGENERADO");
			logger.debug("Fichero generado **********************************" + FICHERO);

			BigDecimal RESULTADO = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			/*
			 * ***************************************************************************
			 */
			/*
			 * ***************************************************************************
			 */
			/*
			 * ***************************************************************************
			 */

			logger.debug(m);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Axislist001Service m_ajaxejecutar - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/*
	 * **************************************
	 * ********************************************
	 * ***********************************
	 */
	/*
	 * ************************************************* FUNCIONES PERSONA
	 * ***************************************************
	 */
	/*
	 * **************************************
	 * ********************************************
	 * ***********************************
	 */

	public void m_volver(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_volver");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			/*
			 * formdata.put("NSINIES", bigDecimalToString ((BigDecimal)
			 * thisAction.removeTopPila(request, "NSINIES"))); formdata.put("SSEGURO",
			 * bigDecimalToString ((BigDecimal) thisAction.removeTopPila(request,
			 * "SSEGURO")));
			 */
			// 032
			Map formdata_axissin032 = (Map) thisAction.removeTopPila(request, "formdata_axislist001"); // 01

			// logger.debug("formdata_axissin032
			// --------------------------------->"+formdata_axissin032);

			if (!isEmpty(formdata_axissin032))
				formdata.putAll(formdata_axissin032); // 01

			// actualizarFormatoFechas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volver_per(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin032");

			if (!this.isEmpty(formdata_axissin006)) {
				formdata.putAll(formdata_axissin006);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin032"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}
			logger.debug(AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			logger.debug(request.getSession().getAttribute("SPERSON_ALTA"));

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("SPERSONDEC_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("SPERSONDEC_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axislist001Action thisAction) {
		logger.debug("Axislist001Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axislist001Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
