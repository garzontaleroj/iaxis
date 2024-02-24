package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin064Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin064Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Método que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axissin064Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			logger.debug("Axissin064Service m_init");
			BigDecimal NUEVO = this.getHiddenCampoNumerico(request, "NUEVO");
			String CMODO = getCampoTextual(request, "CMODO");

			logger.debug("NUEVO : " + NUEVO);
			logger.debug("CMODO : " + CMODO);

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
	public void m_form(HttpServletRequest request, Axissin064Action thisAction) {
		logger.debug("Axisagd004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		if (!isEmpty(getCampoTextual(request, "CMODO"))) {
			AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
			formdata.put("CMODOS", getCampoTextual(request, "CMODO"));
		}
		try {

			cargarValoresDesplegables(request, usuario, formdata);
			logger.debug("NSINIES_AUX --------> " + formdata.get("NSINIES_AUX"));
			logger.debug("SSEGURO --------> " + formdata.get("SSEGURO"));
			/* IAXIS-3602 INITIAL */
			request.getSession().setAttribute("TTRAMIT", formdata.get("TTRAMIT"));
			/* AXIS-3602 END */
			this.m_cargarDocumentos(request);
			this.m_cargarTrammites(request);
			this.m_cargarPagos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin064Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void m_cargarDocumentos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String NSINIES = getCampoTextual(request, "NSINIES_AUX");

		HashMap map = null;

		map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTSOLDOC(NSINIES);

		List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaDocument", listaAgentes);
	}

	private void m_cargarTrammites(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String NSINIES = getCampoTextual(request, "NSINIES_AUX");

		HashMap map = null;

		map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTRAMIT(NSINIES);

		List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaTramit", listaAgentes);
	}

	private List m_cargarPagos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String NSINIES = getCampoTextual(request, "NSINIES_AUX");
		BigDecimal TRAMITE = getCampoNumerico(request, "TRAMITE");

		HashMap map = null;

		map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPAGOS(NSINIES, TRAMITE);

		List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaPagos", listaAgentes);

		return listaAgentes;
	}

	public void m_ajax_busqueda_pagos(HttpServletRequest request) {
		logger.debug("Axissin064Service m_ajax_busqueda_pagos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.m_cargarPagos(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin064Service - método m_ajax_busqueda_pagos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_descargar(HttpServletRequest request, Axissin064Action thisAction) {
		logger.debug("Axissin064Service m_descargar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = new BigDecimal(24);
		String CMAP = new String();
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CEMAIL = null;
		String CEXPORT = "PDF";
		String DOCUMENTO = getCampoTextual(request, "DOCUMENTO");
		String RECLAMO = getCampoTextual(request, "RECLAMO");
		String TRAMITAC = getCampoTextual(request, "TRAMITAC");
		String NPAGO = getCampoTextual(request, "NPAGO");
		String SSEGURO = getCampoTextual(request, "SSEGURO");

		// INICIO MODIFICACION RAFAEL BORDUCHI 3-06-2019
		String NIT = getCampoTextual(request, "NIT");
		String SUMA = getCampoTextual(request, "SUMA");
		String CONCEPTO = getCampoTextual(request, "CONCEPTO");
		// FIN MODIFICACION RAFAEL BORDUCHI 3-06-2019

		// INICIO IAXIS 3602 Informe tecnico Shubhendu
		String DEPLAZO = getCampoTextual(request, "DEPLAZO");
		String Interventor = getCampoTextual(request, "Interventor");
		String Supervisor = getCampoTextual(request, "Supervisor");
		java.sql.Date FELABORACION = this.stringToSqlDate(getCampoTextual(request, "FELABORACION"));
		String FUENTEDEINFO = getCampoTextual(request, "FUENTEDEINFO");
		String TTRAMIT = (String) request.getSession().getAttribute("TTRAMIT");

		if (DOCUMENTO.equals("73")) {
			CMAP = "hojadeRuta";
			PARAMETROS__.put("RECLAMO", RECLAMO);
			TPARAMETROS__.put("TRECLAMO", "1");
			PARAMETROS__.put("PIDIOMA", CIDIOMA.toString());
			TPARAMETROS__.put("TPIDIOMA", "1");
		} else if (DOCUMENTO.equals("74")) {
			CMAP = "ordendePago";
			PARAMETROS__.put("PSSINIES", RECLAMO);
			TPARAMETROS__.put("TPSSINIES", "1");
			PARAMETROS__.put("PSSEGURO", SSEGURO);
			TPARAMETROS__.put("TPSSEGURO", "1");

			// INICIO MODIFICACION RAFAEL BORDUCHI 3-06-2019
			PARAMETROS__.put("PSPERSONA", NIT);
			TPARAMETROS__.put("TPSPERSONA", "1");
			PARAMETROS__.put("PSVALOR", SUMA);
			TPARAMETROS__.put("TPSVALOR", "1");
			PARAMETROS__.put("PSCONCEPTO", CONCEPTO);
			TPARAMETROS__.put("TPSCONCEPTO", "1");
			// FIN MODIFICACION RAFAEL BORDUCHI 3-06-2019
		} else if (DOCUMENTO.equals("75")) {
			CMAP = "informeTechnico";
			CEXPORT = "DOCx";
			PARAMETROS__.put("PSSINIES", RECLAMO);
			TPARAMETROS__.put("TPSSINIES", "1");
			PARAMETROS__.put("PSSEGURO", SSEGURO);
			TPARAMETROS__.put("TPSSEGURO", "1");
			PARAMETROS__.put("PTTRAMIT", TTRAMIT);
			TPARAMETROS__.put("TPTTRAMIT", "1");
			HashMap maps = null;
			try {
				maps = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__f_inforeme_technico(RECLAMO, DEPLAZO, Interventor, Supervisor,
								FUENTEDEINFO, FELABORACION);
			} catch (Exception e) {
				logger.error("Error en el servicio Axissin064service - método m_ejecutar", e);
			}
		} else if (DOCUMENTO.equals("76")) {

			// pagare bug 2485 recuperamos datos
			String VALPAGARE = getCampoTextual(request, "VALPAGARE");
			VALPAGARE = VALPAGARE.replace(".", "");
			String RESOLUCION = getCampoTextual(request, "RESOLUCION");
			String DATERESOLU = getCampoTextual(request, "DATERESOLU");
			String VALINTERES = getCampoTextual(request, "VALINTERES");
			VALINTERES = VALINTERES.replace(".", "");
			BigDecimal PORCEQUIVALE = getCampoNumerico(request, "PORCEQUIVALE");
			String DATEOBLIGA = getCampoTextual(request, "DATEOBLIGA");
			String VALCUOTA = getCampoTextual(request, "VALCUOTA");
			VALCUOTA = VALCUOTA.replace(".", "");
			BigDecimal NUMCUOTAS = getCampoNumerico(request, "NUMCUOTAS");
			BigDecimal PORCINTERES = getCampoNumerico(request, "PORCINTERES");
			String VALXCUOTA = getCampoTextual(request, "VALXCUOTA");
			VALXCUOTA = VALXCUOTA.replace(".", "");
			String DATEFIRSTPAGO = getCampoTextual(request, "DATEFIRSTPAGO");
			BigDecimal CTIPCC = getCampoNumerico(request, "CTIPCC");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal CCUENTA = getCampoNumerico(request, "CCUENTA");
			String REFDOS = getCampoTextual(request, "REFDOS");
			String DATEACUERDOPAGO = getCampoTextual(request, "DATEACUERDOPAGO");
			String CIUDADACUERDO = getCampoTextual(request, "CIUDADACUERDO");
			String CORREO1 = getCampoTextual(request, "CORREO1");
			String CORREO2 = getCampoTextual(request, "CORREO2");

			CMAP = "AcuerdoDePago";
			PARAMETROS__.put("NSINIES", RECLAMO);
			TPARAMETROS__.put("TNSINIES", "1");
			PARAMETROS__.put("VALORPAGARE", VALPAGARE);
			TPARAMETROS__.put("TVALORPAGARE", "1");
			if (RESOLUCION == null) {
				PARAMETROS__.put("RESOLUCION", " ");
				PARAMETROS__.put("DATERESOLU", " ");
			} else {
				PARAMETROS__.put("RESOLUCION", RESOLUCION.toString());
				PARAMETROS__.put("DATERESOLU", DATERESOLU);
			}
			TPARAMETROS__.put("TRESOLUCION", "1");
			TPARAMETROS__.put("TDATERESOLU", "1");
			PARAMETROS__.put("VALORINTERECES", VALINTERES);
			TPARAMETROS__.put("TVALORINTERECES", "1");
			PARAMETROS__.put("PORCEQUIVALE", PORCEQUIVALE.toString());
			TPARAMETROS__.put("TPORCEQUIVALE", "1");
			PARAMETROS__.put("DATEOBLIGA", DATEOBLIGA);
			TPARAMETROS__.put("TDATEOBLIGA", "1");
			PARAMETROS__.put("VALORCUOTA", VALCUOTA);
			TPARAMETROS__.put("TVALORCUOTA", "1");
			PARAMETROS__.put("NUMCUOTAS", NUMCUOTAS.toString());
			TPARAMETROS__.put("TNUMCUOTAS", "1");
			PARAMETROS__.put("PORCINTERES", PORCINTERES.toString());
			TPARAMETROS__.put("TPORCINTERES", "1");
			PARAMETROS__.put("VALORCUOTAI", VALXCUOTA);
			TPARAMETROS__.put("TVALORCUOTAI", "1");
			PARAMETROS__.put("DATEPRIMERPAGO", DATEFIRSTPAGO);
			TPARAMETROS__.put("TDATEPRIMERPAGO", "1");
			PARAMETROS__.put("CTIPCC", CTIPCC.toString());
			TPARAMETROS__.put("TCTIPCC", "1");
			PARAMETROS__.put("CBANCO", CBANCO.toString());
			TPARAMETROS__.put("TCBANCO", "1");
			PARAMETROS__.put("CCUENTA", CCUENTA.toString());
			TPARAMETROS__.put("TCCUENTA", "1");
			PARAMETROS__.put("REFDOS", REFDOS);
			TPARAMETROS__.put("TREFDOS", "1");
			PARAMETROS__.put("DATEACUERDOPAGO", DATEACUERDOPAGO);
			TPARAMETROS__.put("TDATEACUERDOPAGO", "1");
			PARAMETROS__.put("CIUDADACUERDO", CIUDADACUERDO);
			TPARAMETROS__.put("TCIUDADACUERDO", "1");
			PARAMETROS__.put("CORREO1", CORREO1);
			TPARAMETROS__.put("TCORREO1", "1");
			PARAMETROS__.put("CORREO2", CORREO2);
			TPARAMETROS__.put("TCORREO2", "1");
			try {
				Map TIPOREPORTE = new HashMap();
				TIPOREPORTE = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_TIPO_REPORTE_PAGARE(RECLAMO);
				PARAMETROS__.put("TIPOREPORTE", (String) tratarRETURNyMENSAJES(request, TIPOREPORTE));
				TPARAMETROS__.put("TTIPOREPORTE", "1");

			} catch (Exception e) {
				logger.error("AB Error en el servicio Axissin064service - CONSULTA TIPO REPORTE", e);
			}

		}

		// FIN IAXIS 3602 Informe tecnico Shubhendu
		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			System.out.println(ajax.getAjaxContainer());
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - método m_ejecutar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();
		logger.debug("NUMERO DE PARAMETROS " + keyArray.length);
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

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();

		try {

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_lstvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_lstvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(map);
			listValores.put("tipBANCO", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_lstvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCC(new BigDecimal("1"));
			logger.debug(map);
			listValores.put("tipBCC_cuentas", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el método Axisper014Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
