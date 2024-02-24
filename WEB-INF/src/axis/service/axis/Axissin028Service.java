package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SIN_RESCATES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin028Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin028Service extends AxisBaseService {

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axissin028Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la p�liza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin028Action thisAction) {

		logger.debug("Axissin001Service m_form");
		this.formattingNumericValues(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal estado = getCampoNumerico(request, "ESTADO");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		// TODO NRIESGO siempre sera 1
		BigDecimal NRIESGO = new BigDecimal("1");
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		BigDecimal CTIPCALC = getCampoNumerico(request, "CTIPCALC");
		Map objetoPantalla = new HashMap();
		try {
			/* Obtenemos la fecha actual */
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"), "dd/MM/yyyy");
			if ("true".equals(getCampoTextual(request, "BORRAR"))) {

				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					formdata.remove(keySet[i]);
				}
				formdata.put("SSEGURO", SSEGURO);
				formdata.put("NRIESGO", NRIESGO);
				formdata.put("NRIESGO", NRIESGO);
			}
			if (SSEGURO != null) {
				BigDecimal inicializa = this.dbInicializaPoliza(request, usuario, SSEGURO);
				if (inicializa.intValue() == 0) {
					Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);

					if (!isEmpty(datPolizaReturn)) {
						objetoPantalla.putAll(datPolizaReturn);
						//// Guardar SPRODUC en sesi�n para posterior llamada a
						//// PAC_IAX_CFG__F_GET_FORM_WIZARD()
						AbstractDispatchAction.topPila(request, "SPRODUC", datPolizaReturn.get("SPRODUC"));
					}
					if (estado == null) {
						estado = new BigDecimal("4");
					}
					List asegurados = (List) tratarRETURNyMENSAJES(request,
							dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
					List tomadores = (List) tratarRETURNyMENSAJES(request, dbLeeTomadores(request, usuario));
					Map gestion = (Map) tratarRETURNyMENSAJES(request, dbLeeDatosGestion(request, usuario));
					Map economicos = this.dbGetDatosEconomicos(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL);

					if ((estado == null) || (!estado.equals(new BigDecimal("5")))) {
						Map simulacion = (Map) this.dbGetValorSimulacion(request, usuario, SSEGURO, NRIESGO,
								FECHA_ACTUAL, null, estado, CTIPCALC, null, null, null);
						if (!isEmpty(simulacion)) {
							objetoPantalla.putAll(simulacion);
							formdata.put("BUSQUEDA", "1");
						}
					}

					if (!isEmpty(gestion))
						objetoPantalla.putAll(gestion);
					if (!isEmpty(economicos))
						objetoPantalla.putAll(economicos);

					// guardamos datos
					formdata.put("axissin_asegurados", ((asegurados == null) ? new ArrayList() : asegurados));
					formdata.put("axissin_tomadores", ((tomadores == null) ? new ArrayList() : tomadores));
					formdata.put("ESTADO", estado);
					formdata.put("FECHA", FECHA_ACTUAL);
					formdata.putAll(objetoPantalla);
					// Recuperem tots els camps de la pantalla necesaris
					getPreguntas(request);

					PAC_IAX_LISTVALORES_SIN pacIaxListValoresSin = new PAC_IAX_LISTVALORES_SIN(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map m = pacIaxListValoresSin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTRESC(SSEGURO, estado);
					logger.debug("---> cmotresc:" + m);
					formdata.put("LSTCMOTRESC", tratarRETURNyMENSAJES(request, m));

					PAC_IAX_LISTVALORES listValores = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					m = listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000943));
					formdata.put("LSTCTIPCALC", tratarRETURNyMENSAJES(request, m));

				}
			}

			PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
			logger.debug(mapa);
			request.setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			PAC_IAX_OPERATIVA_FINV pacIaxOperativaFinv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map fondos = pacIaxOperativaFinv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_DATOS_RESCATE(SSEGURO, CTIPCALC);
			formdata.put("fondos", (List) fondos.get("PFONDOS"));
			PAC_IAXPAR_PRODUCTOS parproductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map param = parproductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("RESCATE_UNIDAD_PEND", SPRODUC);

			formdata.put("resUniPend", tratarRETURNyMENSAJES(request, param));

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void getPreguntas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA();
		logger.debug(m);
		List T_IAX_PREGUNTAS = (List) tratarRETURNyMENSAJES(request, m);
		logger.debug(T_IAX_PREGUNTAS);
		logger.debug("PREG POL-->" + T_IAX_PREGUNTAS);

		List pregQuestSalut = null;
		List pregDespeses = null;
		if (!isEmpty(T_IAX_PREGUNTAS)) {
			pregQuestSalut = dividirPregPerCtipgru(T_IAX_PREGUNTAS, Constantes.CTIPGRU_QUESTIONARI_SALUT);
			pregDespeses = dividirPregPerCtipgru(T_IAX_PREGUNTAS, Constantes.CTIPGRU_DESPESES);
		}

		request.setAttribute("T_IAX_PREGUNTAS", T_IAX_PREGUNTAS);
		request.setAttribute("pregQuestSalut", pregQuestSalut);
		request.setAttribute("pregDespeses", pregDespeses);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_simular(HttpServletRequest request, Axissin028Action thisAction) {
		logger.debug("Axisctr020Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal IMPPENALI = getCampoNumerico(request, "IMPPENALI");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			// FECHA_ACTUAL = (Date)fcGetFechaActual();
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");

			// Bug 13829 - RSC - 20/05/2010
			BigDecimal IMPRCM = getCampoNumerico(request, "IMPRCM");
			BigDecimal PCTPCTRETEN = getCampoNumerico(request, "PCTPCTRETEN");
			BigDecimal MODALIDAD = getCampoNumerico(request, "MODALIDAD");
			logger.debug("------------------------------------------ Axisctr020Service m_emitirPropuesta MODALIDAD = "
					+ MODALIDAD);
			// Fin bug 13829

			// Bug 13829 - RSC - 20/05/2010
			if (MODALIDAD.intValue() == 1) { // -- Reset del importe de rescate
				if (CCAUSIN.intValue() == 4) {
					IMPORTE = null;
					IMPPENALI = null;
					IMPRCM = null;
					PCTPCTRETEN = null;
				}
			}
			// Fin bug 13829
			BigDecimal CTIPCALC = getCampoNumerico(request, "CTIPCALC");

			Map mapa = (Map) this.dbValidar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, CCAUSIN, IMPORTE,
					getInfoFondos(request, thisAction), CTIPCALC);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {

				// BigDecimal datos = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapa);
				// ajax.guardarContenidoFinalAContenedorAjax(mapa);

				Map map = (Map) this.dbSimular(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, CCAUSIN,
						CTIPCALC, IMPPENALI, IMPRCM, PCTPCTRETEN);

				if (!isEmpty(map)) {
					Map datosSimulacion = (Map) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(map);

				}
			} else {
				BigDecimal datosValidacion = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapa);
				ajax.guardarContenidoFinalAContenedorAjax(mapa);
			}
			getPreguntas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin028Service - m�todo m_simular", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
				BigDecimal TIPOOPER = getCampoNumerico(request, "CCAUSIN");
				BigDecimal IMPPENALI = getCampoNumerico(request, "IMPPENALI");

				// Bug 13829
				BigDecimal IMPRCM = getCampoNumerico(request, "IMPRCM");
				BigDecimal PCTPCTRETEN = getCampoNumerico(request, "PCTPCTRETEN");
				// Fin Bug 13829

				// Bug 13829 - RSC - 20/05/2010
				// if (TIPOOPER.intValue() == 4) {
				// IMPORTE = null;
				// }

				// Bug 18913/89115
				BigDecimal PCMOTRESC = getCampoNumerico(request, "CMOTRESC");
				BigDecimal CTIPCALC = getCampoNumerico(request, "CTIPCALC");

				BigDecimal resultado = (BigDecimal) this.dbAceptar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL,
						IMPORTE, IMPPENALI, TIPOOPER, IMPRCM, PCTPCTRETEN, PCMOTRESC,
						getInfoFondos(request, thisAction), CTIPCALC);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.formattingNumericValues(request);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_aceptar(HttpServletRequest request, Axissin028Action thisAction) {
		logger.debug("Axissin028Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
				BigDecimal TIPOOPER = getCampoNumerico(request, "CCAUSIN");
				BigDecimal IMPPENALI = getCampoNumerico(request, "IMPPENALI");

				// Bug 13829
				BigDecimal IMPRCM = getCampoNumerico(request, "IMPRCM");
				BigDecimal PCTPCTRETEN = getCampoNumerico(request, "PCTPCTRETEN");
				// Fin Bug 13829

				// Bug 18913/89115
				BigDecimal PCMOTRESC = getCampoNumerico(request, "CMOTRESC");
				BigDecimal CTIPCALC = getCampoNumerico(request, "CTIPCALC");
				Map m = this.dbAceptar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, IMPPENALI, TIPOOPER,
						IMPRCM, PCTPCTRETEN, PCMOTRESC, getInfoFondos(request, thisAction), CTIPCALC);

				if (!isEmpty(m)) {
					BigDecimal resultado = (BigDecimal) ajax.rellenarPlAContenedorAjax(m);
					// ajax.guardarContenidoFinalAContenedorAjax(m);

					if (resultado.intValue() == 0) {
						Map valores = new HashMap();
						valores.put("CODIGO", resultado);
						ajax.guardarContenidoFinalAContenedorAjax(valores);
					}
				}
			} else {
				List errores = (List) aviso.get("MENSAJES");
				String error = (String) ((Map) ((Map) errores.get(0)).get("OB_IAX_MENSAJES")).get("TERROR");
				ajax.guardarErrorAContenedorAjax(error);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin028Service - m�todo m_ajax_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

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

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los ASEGURADOS
	 * de una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @param NRIESGO
	 * @param FECHA   ACTUAL
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatosEconomicos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, Date FECHA) throws Exception {
		Map map;
		map = new PAC_IAX_DATOSCTASEGURO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO, NRIESGO, FECHA);
		logger.debug("OBTIENE DATOS ECONOMICOS axissin001---------------------------------------->" + map);
		return (Map) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Lee los asegurados de la p�liza.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal SPRODUC) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug("DATOS ASEGURADOS  axissin028---------------------------------------->" + map);
		return map;
	}

	/**
	 * Lee los datos gestion de la poliza
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeDatosGestion(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		logger.debug("DATOS GESTION POLIZA  axissin028---------------------------------------->" + map);
		return map;
	}

	/**
	 * Inicializa los datos de la p�liza
	 * 
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	protected BigDecimal dbInicializaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		logger.debug("CUENTAS BANCARIAS  axissin028---------------------------------------->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	protected Map dbAceptar(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal IMPPENALI, BigDecimal TIPOOPER, BigDecimal IMPRCM,
			BigDecimal PCTPCTRETEN, BigDecimal PCMOTRESC, TIaxInfo infoFondos, BigDecimal CTIPCALC) throws Exception {

		Map m = new PAC_IAX_SIN_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_RESCATES__F_RESCATE_POLIZA(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, IMPPENALI,
						TIPOOPER, IMPRCM, PCTPCTRETEN, PCMOTRESC, infoFondos, CTIPCALC);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los ASEGURADOS
	 * de una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SPERSON
	 * @param CEMPRES
	 * @param CAGENTE
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbEstCuentasBancarias(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			BigDecimal CAGENTE) throws Exception {
		Map map;
		map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON, CAGENTE);
		logger.debug("CUENTAS BANCARIAS  axissin028---------------------------------------->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Recalcula los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbSimular(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal PCCAUSIN, BigDecimal PCTIPCAL, BigDecimal pIMPPENALI,
			BigDecimal pIMPRCM, BigDecimal pCTPCTRETEN) throws Exception {
		/*
		 * Map map = new
		 * PAC_IAX_SIN_RESCATES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO,
		 * FECHA_ACTUAL, IMPORTE, PCCAUSIN);
		 */
		Map map = new PAC_IAX_SIN_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, PCCAUSIN,
						PCTIPCAL, pIMPPENALI, pIMPRCM, pCTPCTRETEN);
		logger.debug("DATOS RESCATES  axissin028---------------------------------------->" + map);
		return map;
	}

	/**
	 * Recalcula los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbValidar(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			Date FECHA_ACTUAL, BigDecimal PCCAUSIN, BigDecimal IMPORTE, TIaxInfo infoFondos, BigDecimal CTIPCALC)
			throws Exception {
		/*
		 * Map map = new
		 * PAC_IAX_SIN_RESCATES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_RESCATES__F_VALIDA_PERMITE_RESCATE(SSEGURO,
		 * NRIESGO, FECHA_ACTUAL, PCCAUSIN, IMPORTE);
		 */
		Map map = new PAC_IAX_SIN_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_RESCATES__F_VALIDA_PERMITE_RESCATE(SSEGURO, NRIESGO, FECHA_ACTUAL, PCCAUSIN,
						IMPORTE, infoFondos, CTIPCALC);
		logger.debug("DATOS RESCATES  axissin028---------------------------------------->" + map);
		return map;

	}

	/**
	 * M�todo que devuelve el SPERSON del primero de los tomadores
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal fcGetSperson(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA SPERSON  axissin028---------------------------------------->" + map);
		List lista_tomadores = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(lista_tomadores)) {
			return (BigDecimal) ((Map) ((Map) lista_tomadores.get(0)).get("OB_IAX_TOMADORES")).get("SPERSON");
		} else {
			return null;
		}

	}

	/**
	 * M�todo que devuelve el SPERSON del primero de los tomadores
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA TOMADORES axissin028---------------------------------------->" + map);
		return map;

	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbGetValorSimulacion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal CCAUSIN, BigDecimal PCTIPCAL,
			BigDecimal IMPPENALI, BigDecimal IMPRCM, BigDecimal PPCTRETEN) throws Exception {
		/*
		 * Map map = new
		 * PAC_IAX_SIN_RESCATES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO,
		 * FECHA_ACTUAL, IMPORTE, CCAUSIN);
		 */
		Map map = new PAC_IAX_SIN_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, CCAUSIN,
						PCTIPCAL, IMPPENALI, IMPRCM, PPCTRETEN);
		logger.debug("DATOS GESTION POLIZA  axissin028---------------------------------------->" + map);
		return (Map) tratarRETURNyMENSAJES(request, map);
	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		Date FECHA_ACTUAL = new Date(today.getTime());
		return FECHA_ACTUAL;

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAX_PREGUNTAS.get("OB_IAX_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAX_PREGUNTAS);
				objBorrar.add(OB_IAX_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAX_PREGUNTAS);
		}

		for (HashMap OB_IAX_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAX_PREGUNTAS);
		}

		return pregdividides;

	}

	public void m_cargarlistas(HttpServletRequest request, Axissin028Action thisAction) {

		logger.debug("Axissin001Service m_cargarlistas");
		this.formattingNumericValues(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal estado = getCampoNumerico(request, "ESTADO");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		try {

			if (SSEGURO != null) {
				PAC_IAX_LISTVALORES_SIN pacIaxListValoresSin = new PAC_IAX_LISTVALORES_SIN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m = pacIaxListValoresSin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTRESC(SSEGURO, estado);
				logger.debug("---> cmotresc:" + m);
				formdata.put("LSTCMOTRESC", tratarRETURNyMENSAJES(request, m));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public TIaxInfo getInfoFondos(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {

		logger.debug("Axissin001Service getInfoFondos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		List lista = new ArrayList();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CTIPCALC = getCampoNumerico(request, "CTIPCALC");

		Set keys = formdata.keySet();
		Iterator it = keys.iterator();
		while (it.hasNext()) {
			String key = (String) it.next();

			if (key.startsWith("ccesta") && !key.contains("_join")) {
				Map valores = new HashMap();
				BigDecimal ccesta = getCampoNumerico(request, key);
				valores.put("CCESTA", ccesta);
				if (CTIPCALC.equals(BigDecimal.ZERO)) {
					valores.put("percent", getCampoNumerico(request, "percent" + ccesta));
				} else {
					valores.put("import", getCampoNumerico(request, "import" + ccesta));
				}
				lista.add(valores);
			}

		}

		ObIaxInfo[] paramsList = new ObIaxInfo[lista.size()];
		// primero, llenar los parametros

		ObIaxInfo paramObj = null;
		int x = 0;
		for (int i = 0; i < lista.size(); i++) {
			HashMap mm = (HashMap) lista.get(i);
			if (CTIPCALC.equals(BigDecimal.ZERO)) {
				paramObj = new ObIaxInfo(mm.get("CCESTA").toString(), mm.get("percent").toString(), "",
						BigDecimal.ZERO);
			} else {
				paramObj = new ObIaxInfo(mm.get("CCESTA").toString(), mm.get("import").toString(), "", BigDecimal.ZERO);

			}
			paramObj._SQL_NAME = UsuarioBean.fixOwner(usuario.getCusuari(), "OB_IAX_INFO");
			paramsList[x] = paramObj;
			x++;
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(usuario.getCusuari(), "T_IAX_INFO");

		return params;

	}
}
