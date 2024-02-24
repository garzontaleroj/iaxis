package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REENVIO_SER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm200Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm200Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm200Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap interfaceMap = null;

		try {
			PAC_IAX_REENVIO_SER pacIaxReenvioSer = new PAC_IAX_REENVIO_SER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			interfaceMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_BUSCAR_INTERFACE();
			logger.debug("interfaceMap : " + interfaceMap);
			List reenvioSer = (List<Map>) tratarRETURNyMENSAJES(request, interfaceMap);
			if (reenvioSer == null) {
				formdata.put("ERROR_REENVIO", new BigDecimal(1));
			} else {
				formdata.put("listaServicios", reenvioSer);
			}

			HashMap estadoMap = null;
			estadoMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_BUSCAR_ESTADO();
			logger.debug("estadoMap : " + estadoMap);
			List estadoList = (List<Map>) tratarRETURNyMENSAJES(request, estadoMap);
			if (estadoList == null) {
				formdata.put("ERROR_ESTADO", new BigDecimal(1));
			} else {
				formdata.put("listaEstados", estadoList);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo m_form ", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void ajax_documentos(HttpServletRequest request, Axisadm200Action thisAction) {
		logger.debug("Axisadm200Service ajax_documentos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal selectedPerson = AxisBaseService.getCampoNumerico(request, "selectedPerson");
			BigDecimal selectedAgente = AxisBaseService.getCampoNumerico(request, "selectedAgente");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(selectedPerson)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(selectedPerson, selectedAgente);
				logger.debug("Personas : " + map);
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);

			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo ajax_documentos : ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar_servicio_details(HttpServletRequest request) {
		logger.debug("Axisadm200Service buscar_servicio_details");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		String cinterf = null;
		String nnumIde = null;
		Date fInicio = null;
		Date fFin = null;
		String numPago = null;
		BigDecimal estado = null;
		try {
			estado = AxisBaseService.getCampoNumerico(request, "ESTADO_200");
			cinterf = AxisBaseService.getCampoTextual(request, "CINTERF");

			if (cinterf.equals("CONVI") && AxisBaseService.getCampoTextual(request, "TESTADO_CONVI") != null) {
				nnumIde = AxisBaseService.getCampoTextual(request, "TESTADO_CONVI").split("-")[2];
			}
			if ((cinterf.equals("I017")) || (cinterf.equals("I072"))
					|| (cinterf.equals("CONVI") && AxisBaseService.getCampoTextual(request, "TESTADO_CONVI") == null)) {
				nnumIde = AxisBaseService.getCampoTextual(request, "NNUMIDE_AGENCIA");
			} else {
				numPago = AxisBaseService.getCampoTextual(request, "NUM_PAGO");
			}
			fInicio = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			fFin = stringToSqlDate(getCampoTextual(request, "FFIN"));

			PAC_IAX_REENVIO_SER pacIaxReenvioSer = new PAC_IAX_REENVIO_SER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map solicitudMap = null;

			solicitudMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_GET_SERVICIO(cinterf, estado, nnumIde, fInicio,
					fFin, numPago);

			List listaSolicitud = (List) tratarRETURNyMENSAJES(request, solicitudMap);

			logger.debug("solicitudMap : " + solicitudMap + "\nestadoList : " + listaSolicitud);

			formdata.put("listaSolicitud", listaSolicitud);
			formdata.put("ESTADO_200", estado);
			formdata.put("CINTERF", cinterf);
			formdata.put("FINICIO", fInicio);
			formdata.put("FFIN", fFin);
			formdata.put("NUM_PAGO", numPago);

			if (AxisBaseService.getCampoTextual(request, "NNUMIDE_AGENCIA") != null) {
				formdata.put("NNUMIDE_AGENCIA", nnumIde);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo buscar_servicio_details ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_reintentarEntrada(HttpServletRequest request) {
		logger.debug("Axisadm200Service m_reintentarEntrada");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		String nnumIde = null;
		BigDecimal estado = null;
		String cinterf = null;
		BigDecimal sinterf = null;
		Date fInicio = null;
		Date fFin = null;
		String numPago = null;

		try {

			sinterf = AxisBaseService.getCampoNumerico(request, "SINTERF");
			estado = AxisBaseService.getCampoNumerico(request, "SELECTED_ESTADO");
			cinterf = AxisBaseService.getCampoTextual(request, "CINTERF");

			logger.debug("Axisadm200Service m_reintentarEntrada : CINTERF : "
					+ AxisBaseService.getCampoTextual(request, "CINTERF"));
			if (cinterf.equals("CONVI") && AxisBaseService.getCampoTextual(request, "TESTADO_CONVI") != null) {
				nnumIde = AxisBaseService.getCampoTextual(request, "TESTADO_CONVI").split("-")[2];
			}
			if ((cinterf.equals("I017")) || (cinterf.equals("I072"))
					|| (cinterf.equals("CONVI") && AxisBaseService.getCampoTextual(request, "TESTADO_CONVI") == null)) {
				nnumIde = AxisBaseService.getCampoTextual(request, "NNUMIDE_AGENCIA");
			} else {
				numPago = AxisBaseService.getCampoTextual(request, "NUM_PAGO");
			}

			fInicio = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			fFin = stringToSqlDate(getCampoTextual(request, "FFIN"));

			PAC_IAX_REENVIO_SER pacIaxReenvioSer = new PAC_IAX_REENVIO_SER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map reintentarMap = null;
			String mensaje = null;
			String intento = null;
			String psinterf = null;

			if ("I017".equals(cinterf)) {
				logger.debug("calling service : " + cinterf);
				reintentarMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_I017(sinterf, estado);
				logger.debug("calling service : reintentarMap : " + reintentarMap);
				if (reintentarMap != null) {
					mensaje = reintentarMap.get("RETURN").toString();
					psinterf = reintentarMap.get("RETURN").toString();
				} else {
					mensaje = sinterf.toString();
				}
			} else if ("I031".equals(cinterf)) {
				logger.debug("calling service : " + cinterf);
				reintentarMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_I031(sinterf, estado);
				logger.debug("calling service : reintentarMap : " + reintentarMap);
				try {
					mensaje = sinterf.toString();
					psinterf = reintentarMap.get("RETURN").toString();
					intento = reintentarMap.get("PNUMINTENTO").toString();
				} catch (Exception e) {
					logger.error("Error en el servicio Axisadm200Service - Sinterf viene Vacia ", e);
					psinterf = "";
					intento = "";
				}
			} else if ("CONVI".equals(cinterf)) {
				logger.debug("calling service : " + cinterf);
				reintentarMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_REINTENTAR_CONVI(sinterf, nnumIde);
				mensaje = sinterf.toString();
			}
			logger.debug("reintentarMap : " + reintentarMap);

			formdata.put("reintentarMap", reintentarMap);
			formdata.put("CINTERF", cinterf);
			formdata.put("FINICIO", fInicio);
			formdata.put("FFIN", fFin);
			formdata.put("NUM_PAGO", numPago);
			formdata.put("SINTERF", sinterf);

			if (AxisBaseService.getCampoTextual(request, "NNUMIDE_AGENCIA") != null) {
				formdata.put("NNUMIDE_AGENCIA", nnumIde);
			}

			if (("I031".equals(cinterf)) && ("3").equals(intento)) {
				if (psinterf.equals(mensaje)) {
					AbstractDispatchAction.guardarMensaje(request, "LA SINTERF: " + mensaje + " SE HA PROCESADO...",
							new Object[] {}, Constantes.MENSAJE_INFO);
					m_form(request);
				} else {
					AbstractDispatchAction.guardarMensaje(request,
							"LA SINTERF: " + mensaje + " SE HA PROCESADO - NUEVA SINTERF GENERADA : " + psinterf,
							new Object[] {}, Constantes.MENSAJE_INFO);
					m_form(request);
				}
			} else {
				AbstractDispatchAction.guardarMensaje(request, "LA SINTERF: " + mensaje + " SE HA PROCESADO...",
						new Object[] {}, Constantes.MENSAJE_INFO);
				m_form(request);
			}

			Map solicitudMap = null;
			if (psinterf == null || psinterf == "") {
				solicitudMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_GET_DATOS(sinterf, cinterf);
			} else {
				solicitudMap = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_GET_DATOS(
						BigDecimal.valueOf(Double.parseDouble(psinterf)), cinterf);
			}
			List listaSolicitud = (List) tratarRETURNyMENSAJES(request, solicitudMap);
			logger.debug("solicitudMap : " + solicitudMap + "\n List : " + listaSolicitud);
			formdata.put("listaSolicitud", listaSolicitud);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo m_reintentarEntrada ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			m_form(request);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_limpiar(HttpServletRequest request, Axisadm200Action thisAction) {
		logger.debug("Axisadm200Service m_limpiar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("listaSolicitud", null);
			formdata.put("ESTADO_200", null);
			formdata.put("CINTERF", null);
			formdata.put("NNUMIDE_AGENCIA", null);
			formdata.put("NOMBRE_AGENCIA", null);
			formdata.put("FINICIO", null);
			formdata.put("FFIN", null);
			formdata.put("NUM_PAGO", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo m_limpiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_reajustarParaCinterf(HttpServletRequest request, Axisadm200Action thisAction) {
		logger.debug("Axisadm200Service m_reajustarParaCinterf");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("listaSolicitud", null);
			formdata.put("ESTADO_200", null);
			formdata.put("NNUMIDE_AGENCIA", null);
			formdata.put("NOMBRE_AGENCIA", null);
			formdata.put("FINICIO", null);
			formdata.put("FFIN", null);
			formdata.put("NUM_PAGO", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - m�todo m_limpiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
