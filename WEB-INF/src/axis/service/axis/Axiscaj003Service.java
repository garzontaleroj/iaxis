package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.axis.Axiscaj003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj003Action thisAction) {
		logger.debug("Axiscaj003Service m_form");
		this.formattingNumericValues(request);
		try {
			this.cargarDatos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscaj003Action thisAction) {
		logger.debug("Axiscaj003Service m_aceptar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_ajax_persona(HttpServletRequest request, Axiscaj003Action thisAction) {
		logger.debug("axiscaj003Service m_ajax_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("axiscaj003Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj003Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj003Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj003Service cargarDatos");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);
			logger.debug("MONEDAS OK");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj003Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ins_pago_recibos(HttpServletRequest request, Axiscaj003Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj003Service m_ins_pago_recibos");

			this.ins_pago_recibos(request);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj003Service.m_ins_pago_recibos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List ins_pago_recibos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		String LSTRECIBOS = "";
		formdata.put("LSTRECIBOS", LSTRECIBOS);
		logger.debug("+++++++LSTRECIBOS: " + LSTRECIBOS);

		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		formdata.put("SPERSON", SPERSON);
		logger.debug("+++++++SPERSON: " + SPERSON);

		BigDecimal IAUTOLIQ = this.getCampoNumerico(request, "IAUTOLIQ");
		formdata.put("IAUTOLIQ", IAUTOLIQ);
		logger.debug("+++++++IAUTOLIQ: " + IAUTOLIQ);

		BigDecimal IPAGSIN = this.getCampoNumerico(request, "IPAGSIN");
		formdata.put("IPAGSIN", IPAGSIN);
		logger.debug("+++++++IPAGSIN: " + IPAGSIN);

		BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
		formdata.put("IMOVIMI", IMOVIMI);
		logger.debug("+++++++IMOVIMI: " + IMOVIMI);

		String CMONOPE = this.getCampoTextual(request, "CMONOPE");
		formdata.put("CMONOPE", CMONOPE);
		logger.debug("+++++++CMONOPE: " + CMONOPE);

		String FICHEROS = this.getCampoTextual(request, "FICHEROS");
		formdata.put("FICHEROS", FICHEROS);
		logger.debug("+++++++FICHEROS: " + FICHEROS);

		BigDecimal CMETMOV = this.getCampoNumerico(request, "CMETMOV");
		formdata.put("CMETMOV", CMETMOV);
		logger.debug("+++++++CMETMOV: " + CMETMOV);

		String NCHEQUE = this.getCampoTextual(request, "NCHEQUE");
		formdata.put("NCHEQUE", NCHEQUE);
		logger.debug("+++++++NCHEQUE: " + NCHEQUE);

		BigDecimal CCHQORI = this.getCampoNumerico(request, "CCHQORI");
		formdata.put("CCHQORI", CCHQORI);
		logger.debug("+++++++CCHQORI: " + CCHQORI);

		BigDecimal CBANTRANS = this.getCampoNumerico(request, "CBANTRANS");
		formdata.put("CBANTRANS", CBANTRANS);
		logger.debug("+++++++CBANTRANS: " + CBANTRANS);

		CBANTRANS = (CBANTRANS == null) ? CCHQORI : CBANTRANS;

		String CCC = this.getCampoTextual(request, "CCC");
		formdata.put("CCC", CCC);
		logger.debug("+++++++CCC: " + CCC);

		BigDecimal CTIPTAR = this.getCampoNumerico(request, "CTIPTAR");
		formdata.put("CTIPTAR", CTIPTAR);
		logger.debug("+++++++CTIPTAR: " + CTIPTAR);

		BigDecimal NTARGET = this.getCampoNumerico(request, "NTARGET");
		formdata.put("NTARGET", NTARGET);
		logger.debug("+++++++NTARGET: " + NTARGET);

		String FCADTAR = this.getCampoTextual(request, "FCADTAR");
		formdata.put("FCADTAR", FCADTAR);
		logger.debug("+++++++FCADTAR: " + FCADTAR);

		Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_PAGOS_REC(LSTRECIBOS, SPERSON, new BigDecimal(0), IMOVIMI,
				IAUTOLIQ, IPAGSIN, CMONOPE, CMETMOV, NCHEQUE, CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR, null, null,
				null, null, null, null);

		formdata.put("LSTRECIBOS", LSTRECIBOS);
		logger.debug("+++++++LSTRECIBOS: " + LSTRECIBOS);

		logger.debug("++++map starifa " + map);
		BigDecimal rt = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		if (rt.intValue() == 0) {
			List listaSEQCAJA = new ArrayList();
			Map mseqCaja = new HashMap();
			mseqCaja.put("PSEQCAJA", (BigDecimal) map.get("PSEQCAJA"));
			listaSEQCAJA.add(mseqCaja);
			formdata.put("SEQCAJA", (BigDecimal) map.get("PSEQCAJA"));
			logger.debug("++++listaSEQCAJA " + listaSEQCAJA);
			return listaSEQCAJA;
		} else {
			return (List) map.get("MENSAJES");
		}
	}

}