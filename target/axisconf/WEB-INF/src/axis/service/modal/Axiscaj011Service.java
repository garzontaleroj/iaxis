//Revision:# GPQDNT4WKEgbZgbURGoj+Q== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA_CHEQUE;
import axis.jdbc.PAC_IAX_CASHDESK;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscaj011Action;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscaj011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axiscaj011Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axiscaj011Action thisAction) {
		logger.debug("Axiscaj011Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String pFFECHAC = this.getCampoTextual(request, "FFECHAC");
			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date fecha = null;
			try {

				fecha = formatoDelTexto.parse(pFFECHAC);

			} catch (Exception ex) {

				ex.printStackTrace();
			}

			formdata.put("FFECHAC", fecha);
			// logger.debug("++++FFECHAC: "+fecha);

			String pTNOMBRE = this.getCampoTextual(request, "TNOMBRE");
			formdata.put("TNOMBRE", pTNOMBRE);
			logger.debug("++++pTNOMBRE: " + pTNOMBRE);

			String pNNUMIDE = this.getCampoTextual(request, "NNUMIDE");
			formdata.put("NNUMIDE", pNNUMIDE);
			logger.debug("++++pNNUMIDE: " + pNNUMIDE);

			BigDecimal pCCHEQUE = this.getCampoNumerico(request, "CCHEQUE");
			formdata.put("CCHEQUE", pCCHEQUE);
			logger.debug("++++CCHEQUE: " + pCCHEQUE);

			BigDecimal pHCESTADO = this.getCampoNumerico(request, "HCESTADO");
			formdata.put("HCESTADO_ANT", pHCESTADO);
			logger.debug("++++HCESTADO: " + pHCESTADO);

			BigDecimal pHSCAJA = this.getCampoNumerico(request, "HSCAJA");
			formdata.put("HSCAJA", pHSCAJA);
			logger.debug("++++HSCAJA: " + pHSCAJA);

			BigDecimal pHNUMLIN = this.getCampoNumerico(request, "HNUMLIN");
			formdata.put("HNUMLIN", pHNUMLIN);
			logger.debug("++++pHNUMLIN: " + pHNUMLIN);

			Map map = null;
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (pHCESTADO.equals(new BigDecimal("2")))
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(483),
						"CHEQUE_VALIDADO");
			else if (pHCESTADO.equals(new BigDecimal("0")))
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(483),
						"CHEQUE_PENDIENTE");
			else if (pHCESTADO.equals(new BigDecimal("1")))
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(483),
						"CHEQUE_ACEPTADO");
			else
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(483), null);
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("CSITCHE", FORMAPAGO);
			logger.debug("++++ESCTADO: " + FORMAPAGO);

			PAC_IAX_CASHDESK pac_iax_cashdesk = new PAC_IAX_CASHDESK(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapD = pac_iax_cashdesk.ejecutaPAC_IAX_CASHDESK__F_GET_DATOSPAGO(pHSCAJA, pHNUMLIN);

			ArrayList valores = (ArrayList) this.tratarRETURNyMENSAJES(request, mapD, false);

			if (!isEmpty(valores)) {
				formdata.putAll((Map) valores.get(0));

				if (!isEmpty(formdata.get("CAUTORIZA")) && !isEmpty(formdata.get("CCOMERCIO"))
						&& !isEmpty(formdata.get("CPROCESO"))) {

					PAC_IAX_GESTION_PROCESOS pac_axis_gestprocesos = new PAC_IAX_GESTION_PROCESOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					Map sor = pac_axis_gestprocesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_TABLA_INTERMEDIA(
							(BigDecimal) formdata.get("CAUTORIZA"), (BigDecimal) formdata.get("CPROCESO"),
							(BigDecimal) formdata.get("CCOMERCIO"));
					tratarRETURNyMENSAJES(request, sor);
					formdata.put("OBTABLA", sor.get("POBTABLAPROCESO"));
				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj011Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_guardar(HttpServletRequest request, Axiscaj011Action thisAction) {
		logger.debug("Axiscaj011Service m_guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);
		HashMap guardar;
		try {

			String pFFECHAC = this.getCampoTextual(request, "FFECHAC");
			logger.debug("++++FFECHAC: " + this.stringToSqlDate(pFFECHAC));

			String NCCHEQUE = this.getCampoTextual(request, "NCHEQUE");
			logger.debug("++++NCCHEQUE: " + NCCHEQUE);

			BigDecimal pHCESTADO = this.getCampoNumerico(request, "CSITCHE");
			logger.debug("++++HCESTADO: " + pHCESTADO);

			BigDecimal pHCESTADO_ANT = this.getCampoNumerico(request, "HCESTADO");
			logger.debug("++++HCESTADO_ANT: " + pHCESTADO_ANT);

			BigDecimal pHSCAJA = this.getCampoNumerico(request, "HSCAJA");
			logger.debug("++++HSCAJA: " + pHSCAJA);

			Map map = new HashMap();

			Map map2 = new HashMap();
			PAC_IAX_CAJA_CHEQUE pac_axis_caja = new PAC_IAX_CAJA_CHEQUE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(SPERSON,
			// SPERSON,pCCHEQUE.toString());
			map = pac_axis_caja.ejecutaPAC_IAX_CAJA_CHEQUE__F_SET_ESTADOCHEQUES(pHSCAJA, pHCESTADO,
					this.stringToSqlDate(pFFECHAC));

			logger.debug(map);
			if (((BigDecimal) ajax.rellenarPlAContenedorAjax(map)).intValue() == 0) {
				formdata.put("GUARDADO", "0");
				map2 = pac_axis_caja.ejecutaPAC_IAX_CAJA_CHEQUE__F_INSERT_HISTORICO(pHSCAJA, NCCHEQUE, pHCESTADO,
						pHCESTADO_ANT, this.stringToSqlDate(pFFECHAC));
				ajax.rellenarPlAContenedorAjax(map2);
			} else {
				formdata.put("GUARDADO", "1");
			}

			logger.debug("$$$$$$$$$$$$ fin guardar pac_iax_caja_cheques: " + map);
		} catch (Exception e) {
			logger.error("Error al guardar axiscaj011Service ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(formdata);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void ajax_valida_protestado(HttpServletRequest request, Axiscaj011Action thisAction) {
		logger.debug("Axiscaj011Service m_valida_protestado");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);
		HashMap guardar;
		try {

			BigDecimal pHSCAJA = this.getCampoNumerico(request, "HSCAJA");
			formdata.put("HSCAJA", pHSCAJA);
			logger.debug("++++HSCAJA: " + pHSCAJA);

			Map map = new HashMap();
			PAC_IAX_CAJA_CHEQUE pac_axis_caja = new PAC_IAX_CAJA_CHEQUE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(SPERSON,
			// SPERSON,pCCHEQUE.toString());
			map = pac_axis_caja.ejecutaPAC_IAX_CAJA_CHEQUE__F_PROTESTADO(pHSCAJA);

			logger.debug(map);

			if (((BigDecimal) ajax.rellenarPlAContenedorAjax(map)).intValue() == 0) {
				formdata.put("VALIDADO", "0");
			} else {
				formdata.put("VALIDADO", "1");
			}

			logger.debug("$$$$$$$$$$$$ fin valida protestado servicios pac_iax_caja_cheques: " + map);
		} catch (Exception e) {
			logger.error("Error valida protestado axiscaj011Service ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(formdata);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

}
