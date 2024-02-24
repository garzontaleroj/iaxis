package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_UTILES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist012Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axislist012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * MeTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axislist012Action thisAction) {
		logger.debug("Axislist012Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio axislist012Service - metodo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axislist012Service m_form");
		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
		logger.debug(SSEGURO);
		formdata.put("PRUEBA", SSEGURO);// sgm
		logger.debug(formdata);
	}

	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_ver_persona(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String CODI = getCampoTextual(request, "SPERSON");

			if (request.getSession().getAttribute("axisper008_listaPersonas") != null) {
				List listaPersonas = (List) request.getSession().getAttribute("axisper008_listaPersonas");
				Map persona = getObjetoDeLista(listaPersonas, CODI, "CODI");
				if (persona.get("TELEFONO") == null) {// si no tiene tlf fijo
					persona.put("TELEFONO", "0");
				}

				if (persona.get("TELEFONO_MOVIL") == null) {// si no tiene tlf MOVIL
					persona.put("TELEFONO_MOVIL", "0");
				}

				if (!isEmpty(persona)) {
					ajax.guardarContenidoFinalAContenedorAjax(persona);
					request.getSession().setAttribute("axisctr_persona", persona);
				}
				listaPersonas = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
	public void m_ajax_agregar_poliza(HttpServletRequest request) {
		logger.debug("m_ajax_agregar_poliza");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String SSEGURO2 = getCampoTextual(request, "SSEGURO");
			logger.debug(SSEGURO2);
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug(SSEGURO);

			PAC_IAX_ADM PAC_IAX_ADM = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = PAC_IAX_ADM.ejecutaPAC_IAX_ADM__F_GET_RECIBOS_SALDOS(SSEGURO);
			List REC_LSTRECIBOS = (List) map.get("CUR");
			if (REC_LSTRECIBOS.isEmpty()) {
				Exception e = null;
				request.setAttribute("mensajeerror", "Poliza no tiene recibos para abonar o son recibos extorno");
				AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}
			if (request.getSession().getAttribute("axisctr_listaPolizas") != null) {
				logger.debug("request.getSession().getAttribute(axisctr_listaPolizas)"
						+ request.getSession().getAttribute("axisctr_listaPolizas"));
				List listaPolizas = (List) request.getSession().getAttribute("axisctr_listaPolizas");
				Map poliza = getObjetoDeLista(listaPolizas, SSEGURO2, "SSEGURO");
				if (!isEmpty(poliza)) {

					if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
						formdata.put("REC_LSTRECIBOS", REC_LSTRECIBOS);
						logger.debug(formdata);
					}

					ajax.guardarContenidoFinalAContenedorAjax(REC_LSTRECIBOS);
					request.getSession().setAttribute("axisctr_listaPolizas", REC_LSTRECIBOS);
					logger.debug("polizadatos que envia" + REC_LSTRECIBOS);
				}
				listaPolizas = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			logger.debug("m_ajax_agregar_polizafin");
		}
	}

	public void m_ajax_crear_acuerdo(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String nitTomador = getCampoTextual(request, "nitTomador");
			String tomador = getCampoTextual(request, "tomador");
			BigDecimal codSucursal = this.getCampoNumerico(request, "codSucursal");
			String sucursal = getCampoTextual(request, "sucursal");
			String direccion = getCampoTextual(request, "direccion");
			String telefono = getCampoTextual(request, "telefono");
			String telefono_movil = getCampoTextual(request, "telefono_movil");
			String nitRepresentante = getCampoTextual(request, "nitRepresentante");
			String representante = getCampoTextual(request, "representante");
			BigDecimal valorNumero = this.getCampoNumerico(request, "valorNumero");
			String lugarGeneracion = getCampoTextual(request, "lugarGeneracion");
			java.sql.Date fexpedicion = this.stringToSqlDate(getCampoTextual(request, "fexpedicion"));
			BigDecimal nroCuotas = this.getCampoNumerico(request, "nroCuotas");
			BigDecimal crepresentante = new BigDecimal(2);
			String cusuario = usuario.getCusuari(); // JRVG IAXIS-5319 REPORTE ACUERDOS DE PAGO

			if (nitTomador.compareTo(nitRepresentante) == 0) {
				crepresentante = new BigDecimal(1);
			}

			PAC_IAX_UTILES pacIaxUtiles = new PAC_IAX_UTILES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapAcuerdoPago = pacIaxUtiles.ejecutaPAC_IAX_UTILES__F_SET_ACUERDO_PRIMA(nitTomador, tomador,
					codSucursal, sucursal, direccion, telefono, telefono_movil, nitRepresentante, representante,
					valorNumero, lugarGeneracion, fexpedicion, nroCuotas, crepresentante, cusuario);// JRVG IAXIS-5319
																									// REPORTE ACUERDOS
																									// DE PAGO

			ajax.guardarContenidoFinalAContenedorAjax(mapAcuerdoPago);
			request.getSession().setAttribute("AcuerdoPago", mapAcuerdoPago);
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_crear_acuerdo_detalles(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		try {

			BigDecimal ID_ACUERDO_PAGO = this.getCampoNumerico(request, "ID_ACUERDO_PAGO");
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			Map mapDetAcuerdoPago;
			// SGM 4134 REPORTE CUOTAS ACUERDOS DE PAGO
			if (TIPO.compareTo(BigDecimal.ONE) == 0) {
				String NPOLIZA = getCampoTextual(request, "NPOLIZA");
				String NRECIBO = getCampoTextual(request, "NRECIBO");
				BigDecimal SALDO = this.getCampoNumerico(request, "SALDO");
				BigDecimal VALOR_POLIZA = this.getCampoNumerico(request, "VALOR_POLIZA");
				logger.debug("SALDO" + SALDO);
				PAC_IAX_UTILES pacIaxUtiles = new PAC_IAX_UTILES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				mapDetAcuerdoPago = pacIaxUtiles.ejecutaPAC_IAX_UTILES__F_SET_POLIZAS_ACUERDO_PRIMA(ID_ACUERDO_PAGO,
						NPOLIZA, NRECIBO, SALDO, VALOR_POLIZA);

			} else {
				BigDecimal NRO_CUOTA = this.getCampoNumerico(request, "NRO_CUOTA");
				String PORCENTAJE = this.getCampoTextual(request, "PORCENTAJE");//INI TASK-55 ACUERDO PAGO 27/03/2023
				String VALOR_CUOTA = this.getCampoTextual(request, "VALOR_CUOTA");	
				java.sql.Date FECHA_PAGO = java.sql.Date.valueOf(getCampoTextual(request, "FECHA_PAGO"));
		
				PAC_IAX_UTILES pacIaxUtiles = new PAC_IAX_UTILES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				mapDetAcuerdoPago = pacIaxUtiles.ejecutaPAC_IAX_UTILES__F_SET_DET_ACUERDO_PRIMA(ID_ACUERDO_PAGO,
						NRO_CUOTA,PORCENTAJE,//FIN TASK-55 ACUERDO PAGO 24/03/2023
						VALOR_CUOTA, FECHA_PAGO);
			}

			ajax.guardarContenidoFinalAContenedorAjax(mapDetAcuerdoPago);
			request.getSession().setAttribute("AcuerdoPago", mapDetAcuerdoPago);
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
