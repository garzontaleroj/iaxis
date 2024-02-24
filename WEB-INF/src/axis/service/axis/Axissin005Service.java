package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_RESCATES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin005Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin005Service extends AxisBaseService {

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
	public void m_init(HttpServletRequest request, Axissin005Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axissin005Action thisAction) {

		logger.debug("Axissin001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal estado = getCampoNumerico(request, "ESTADO");

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		request.getSession().setAttribute("SSEGURO", SSEGURO);

		// TODO: NRIESGO SIEMPRE SER� 1
		BigDecimal NRIESGO = new BigDecimal("1");

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

		Map objetoPantalla = new HashMap();

		try {
			/* Obtenemos la fecha actual */
			// Date FECHA_ACTUAL = (Date)fcGetFechaActual();
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"), "dd/MM/yyyy");
			logger.debug("FECHA_ACTUAL: " + FECHA_ACTUAL);
			if ("true".equals(getCampoTextual(request, "BORRAR"))) {

				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					formdata.remove(keySet[i]);
				}
				formdata.put("SSEGURO", SSEGURO);
				formdata.put("NRIESGO", NRIESGO);
				request.getSession().removeAttribute("axissin_asegurados");

			}

			if (SSEGURO != null) {
				BigDecimal inicializa = this.dbInicializaPoliza(request, usuario, SSEGURO);

				if (inicializa.intValue() == 0) {

					Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);
					AbstractDispatchAction.topPila(request, "SPRODUC", datPolizaReturn.get("SPRODUC"));

					if (!isEmpty(datPolizaReturn))
						objetoPantalla.putAll(datPolizaReturn);

					if (estado == null) {
						estado = new BigDecimal("4");
					}
					List asegurados = (List) tratarRETURNyMENSAJES(request,
							dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
					List tomadores = (List) tratarRETURNyMENSAJES(request, dbLeeTomadores(request, usuario));
					Map gestion = (Map) tratarRETURNyMENSAJES(request, dbLeeDatosGestion(request, usuario));
					Map economicos = this.dbGetDatosEconomicos(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL);
					Map simulacion = (Map) this.dbGetValorSimulacion(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL,
							null, estado);

					if (!isEmpty(gestion))
						objetoPantalla.putAll(gestion);
					if (!isEmpty(economicos))
						objetoPantalla.putAll(economicos);
					if (!isEmpty(simulacion))
						objetoPantalla.putAll(simulacion);

					// guardamos datos
					request.getSession().setAttribute("axissin_asegurados",
							((asegurados == null) ? new ArrayList() : asegurados));
					request.getSession().setAttribute("axissin_tomadores",
							((tomadores == null) ? new ArrayList() : tomadores));
					request.getSession().setAttribute("ESTADO", estado);
					request.getSession().setAttribute("FECHA", FECHA_ACTUAL);
					formdata.putAll(objetoPantalla);
					// formdata.put("IMPCAPRIS",2500); Para probar si existe un valor

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_tarifar(HttpServletRequest request, AbstractDispatchAction thisAction) {

	}

	public void m_simular(HttpServletRequest request, Axissin005Action thisAction) {
		logger.debug("Axisctr020Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			// FECHA_ACTUAL = (Date)fcGetFechaActual();
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");

			if (CCAUSIN.intValue() == 4) {
				IMPORTE = null;
			}

			Map mapa = (Map) this.dbValidar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, CCAUSIN, IMPORTE);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {

				// BigDecimal datos = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapa);
				// ajax.guardarContenidoFinalAContenedorAjax(mapa);

				Map map = (Map) this.dbSimular(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, CCAUSIN);

				if (!isEmpty(map)) {
					Map datosSimulacion = (Map) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(map);

				}

			} else {
				BigDecimal datosValidacion = (BigDecimal) ajax.rellenarPlAContenedorAjax(mapa);
				ajax.guardarContenidoFinalAContenedorAjax(mapa);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin005Service - m�todo m_simular", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
			BigDecimal TIPOOPER = getCampoNumerico(request, "CCAUSIN");
			BigDecimal IMPPENALI = getCampoNumerico(request, "IMPPENALI");

			if (TIPOOPER.intValue() == 4) {
				IMPORTE = null;
			}

			BigDecimal resultado = (BigDecimal) this.dbAceptar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL,
					IMPORTE, TIPOOPER, IMPPENALI);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	public void m_ajax_aceptar(HttpServletRequest request, Axissin005Action thisAction) {
		logger.debug("Axissin005Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPCAPRIS");
			BigDecimal TIPOOPER = getCampoNumerico(request, "CCAUSIN");
			BigDecimal IMPPENALI = getCampoNumerico(request, "IMPPENALI");

			Map m = this.dbAceptar(request, usuario, SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, TIPOOPER, IMPPENALI);

			if (!isEmpty(m)) {
				BigDecimal resultado = (BigDecimal) ajax.rellenarPlAContenedorAjax(m);
				// ajax.guardarContenidoFinalAContenedorAjax(m);

				if (resultado.intValue() == 0) {
					Map valores = new HashMap();
					valores.put("CODIGO", resultado);
					ajax.guardarContenidoFinalAContenedorAjax(valores);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin005Service - m�todo m_ajax_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {

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
		logger.debug("DATOS ASEGURADOS  axissin005---------------------------------------->" + map);
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
		logger.debug("DATOS GESTION POLIZA  axissin005---------------------------------------->" + map);
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
		logger.debug("CUENTAS BANCARIAS  axissin005---------------------------------------->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	protected Map dbAceptar(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO, BigDecimal NRIESGO,
			Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal TIPOOPER, BigDecimal IMPPENALI) throws Exception {
		Map m = new PAC_IAX_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RESCATES__F_RESCATE_POLIZA(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, IMPPENALI,
						TIPOOPER);
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
		logger.debug("CUENTAS BANCARIAS  axissin005---------------------------------------->" + map);
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
			java.sql.Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal PCCAUSIN) throws Exception {
		Map map = new PAC_IAX_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, PCCAUSIN);
		logger.debug("DATOS RESCATES  axissin005---------------------------------------->" + map);
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
			java.sql.Date FECHA_ACTUAL, BigDecimal PCCAUSIN, BigDecimal IMPORTE) throws Exception {
		Map map = new PAC_IAX_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RESCATES__F_VALIDA_PERMITE_RESCATE(SSEGURO, NRIESGO, FECHA_ACTUAL, PCCAUSIN, IMPORTE);
		logger.debug("DATOS RESCATES  axissin005---------------------------------------->" + map);
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
		logger.debug("RECUPERA SPERSON  axissin005---------------------------------------->" + map);
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
		logger.debug("RECUPERA TOMADORES axissin005---------------------------------------->" + map);
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
			BigDecimal NRIESGO, Date FECHA_ACTUAL, BigDecimal IMPORTE, BigDecimal CCAUSIN) throws Exception {
		Map map = new PAC_IAX_RESCATES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RESCATES__F_VALOR_SIMULACION(SSEGURO, NRIESGO, FECHA_ACTUAL, IMPORTE, CCAUSIN);
		logger.debug("DATOS GESTION POLIZA  axissin005---------------------------------------->" + map);
		return (Map) tratarRETURNyMENSAJES(request, map);
	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

}
