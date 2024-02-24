package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr183Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr183Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisctr183Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void getDatos(HttpServletRequest request, Axisctr183Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NRIESGO = new BigDecimal("1");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal IPRIMAFINAN_PEN = getCampoNumerico(request, "IPRIMAFINAN_PEN");
			if (SSEGURO == null) {
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				formdata.put("SSEGURO", SSEGURO);
			}
			if (SSEGURO != null) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_DATOSCTASEGURO pacIaxdatoscta = new PAC_IAX_DATOSCTASEGURO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_CON pacIaxcON = new PAC_IAX_CON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				////////////////// DATOS POLIZA ////////////////////////////////////
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(datosPoliza)) {
					// Obtener el nombre del agente
					String Agente = String.valueOf(datosPoliza.get("CAGENTE"));
					if (!isEmpty(Agente)) {
						HashMap mapAgent = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(null,
								null, Agente, new BigDecimal(1));
						List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgent, false);
						Map agente = getObjetoDeLista(listaAgentes, Agente, "CODI");
						datosPoliza.put("axisctr183_agente", agente);
					}
				}
				request.setAttribute("datos_poliza", datosPoliza);

				List asegurados = (List) tratarRETURNyMENSAJES(request,
						dbLeeAsegurados(request, NRIESGO, (BigDecimal) datosPoliza.get("SPRODUC")));
				request.setAttribute("axisctr_asegurados", ((asegurados == null) ? new ArrayList() : asegurados));
				List tomadores = (List) tratarRETURNyMENSAJES(request, dbLeeTomadores(request));
				request.setAttribute("axisctr_tomadores", ((tomadores == null) ? new ArrayList() : tomadores));
				java.sql.Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));
				if (isEmpty(FECHA_ACTUAL)) {
					FECHA_ACTUAL = (Date) fcGetFechaActual();
				}

				/*
				 * BUG 24628 - 20120117 - JLTS Se comenta este bloque porque los datos correctos
				 * se deben tomar de DATOSECON, los cuales vienen en
				 * ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA ubicado adelante Map
				 * economicos = this.dbGetDatosEconomicos(request, usuario, SSEGURO, NRIESGO,
				 * FECHA_ACTUAL); logger.debug(economicos); if (!isEmpty(economicos)){
				 * formdata.putAll(economicos); }
				 */

				// bug 26085
				Map dcta = pacIaxdatoscta.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA(SSEGURO, NRIESGO,
						FECHA_ACTUAL, null, CMODO, null);
				logger.debug(dcta);
				HashMap ret = (HashMap) tratarRETURNyMENSAJES(request, dcta, false);
				logger.debug("ret put all:" + ret);

				if (!isEmpty(ret)) {
					formdata.putAll(ret); // BUG 25888/137463 - JLTS - Se traslada ac�, luego de ser !isEmpty
					if (ret.get("DATOSECON") != null) {
						logger.debug("ret.get(\"DATOSECON\"):" + ret.get("DATOSECON"));

						Map resc = (Map) ret.get("DATOSECON");
						logger.debug("resc: " + resc);

						BigDecimal valresc = (BigDecimal) resc.get("VALRESC");
						BigDecimal valpb = (BigDecimal) resc.get("VALPB");
						if (!isEmpty(valresc) && !isEmpty(valpb)) {
							BigDecimal valpu = valresc.subtract(valpb);
							formdata.put("VALRESCSPU", valpu);
						}

						formdata.putAll((HashMap) ret.get("DATOSECON"));

					}
				}

				if (isEmpty(IPRIMAFINAN_PEN)) {
					map = pacIaxcON.ejecutaPAC_IAX_CON__F_IMPORTE_FINANCIACION_PDTE(SSEGURO);
					logger.debug(map);
					BigDecimal retorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);
					if (!isEmpty(map.get("PIMPORTE"))) {
						BigDecimal PIMPORTE = (BigDecimal) map.get("PIMPORTE");
						formdata.put("IPRIMAFINAN_PEN", PIMPORTE);
						logger.debug("PAC_IAX_CON__F_IMPORTE_FINANCIACION_PDTE --IPRIMAFINAN_PEN:" + PIMPORTE);
					}
				}
			}

			PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
			logger.debug(mapa);
			request.setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr183Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				getDatos(request, thisAction);
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
				formdata.put("CMODO", CMODO);

			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public ActionForward m_aceptar(HttpServletRequest request, Axisctr183Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		ActionForward siguiente = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");

			BigDecimal pPIPRIMA_NP = getCampoNumerico(request, "IPRIMA_NP");
			BigDecimal pPICAPFALL_NP = getCampoNumerico(request, "ICAPFALL_NP");
			Date pPFVENCIM_NP = stringToSqlDate(getCampoTextual(request, "FVENCIM_NP"));
			Date pPFECHA = new java.sql.Date(new java.util.Date().getTime());
			String pPMODE = getCampoTextual(request, "CMODO");

			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_SP(pPSSEGURO, pPIPRIMA_NP,
					pPICAPFALL_NP, pPFVENCIM_NP, pPMODE, pPFECHA);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_CREARPROPUESTA_SP:" + map);
			tratarRETURNyMENSAJES(request, map, false);
			logger.debug("+map.get(\"MENSAJES\"):" + map.get("MENSAJES"));
			ArrayList errors = (ArrayList) map.get("MENSAJES");

			if ((errors == null) || (errors.size() == 0)) {
				AbstractDispatchAction.topPila(request, "SSEGURO", map.get("PSSOLICIT"));
				AbstractDispatchAction.topPila(request, "SPRODUC", null);
				siguiente = new ActionForward("/axis_axisctr009.do?operation=form");
			} else {
				getDatos(request, thisAction);
			}
			this.formattingNumericValues(request);
			return siguiente;
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return siguiente;
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	protected Map dbLeeAsegurados(HttpServletRequest request, BigDecimal NRIESGO, BigDecimal SPRODUC) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug("DATOS ASEGURADOS  axisctr038---------------------------------------->" + map);
		return map;
	}

	private Map dbLeeTomadores(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("RECUPERA TOMADORES axisctr038---------------------------------------->" + map);
		return map;

	}

	private Map dbGetDatosEconomicos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, Date FECHA) throws Exception {
		Map map;
		map = new PAC_IAX_DATOSCTASEGURO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO, NRIESGO, FECHA);
		logger.debug("OBTIENE DATOS ECONOMICOS axisctr183---------------------------------------->" + map);
		return (Map) tratarRETURNyMENSAJES(request, map);
	}

	private java.sql.Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}
	// ini bug 26085

	public void m_actualizar_valores_json(HttpServletRequest request) {
		// Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal NRIESGO = new BigDecimal("1");
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		BigDecimal IPRIMAFINAN_PEN = getCampoNumerico(request, "IPRIMAFINAN_PEN");
		logger.debug("NRIESGOOOOOOOOOOOOO" + NRIESGO);
		logger.debug("SSEGUROOOOOOOOOOOOOO" + SSEGURO);
		logger.debug("CMODOOOOOOOOOOOOOOOO" + CMODO);
		logger.debug("IPRIMAFINAN_PENNNNNNNNNNNNNNNN" + IPRIMAFINAN_PEN);
		if (SSEGURO == null) {
			SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			formdata.put("SSEGURO", SSEGURO);
		}
		java.sql.Date FECHA_ACTUAL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHA"));

		try {
			if (isEmpty(FECHA_ACTUAL)) {
				FECHA_ACTUAL = (Date) fcGetFechaActual();
			}
			logger.debug("FECHA_ACTUALlllllllllllll" + FECHA_ACTUAL);
			HashMap miDataObject = new HashMap();
			PAC_IAX_DATOSCTASEGURO pacIaxdatoscta = new PAC_IAX_DATOSCTASEGURO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map dcta = pacIaxdatoscta.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTSALDOPRORROGA(SSEGURO, NRIESGO, FECHA_ACTUAL,
					null, CMODO, IPRIMAFINAN_PEN);
			logger.debug("vuelta de llamada a funci�n:" + dcta);

			miDataObject.put("resultado", dcta);
			ajax.rellenarPlAContenedorAjax(dcta);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
