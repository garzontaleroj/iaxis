package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axiscaj015Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscaj015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axiscaj015Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axiscaj015Action thisAction) {
		logger.debug("Axiscaj015Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			logger.debug("m_form");
			this.cargarDatos(request, thisAction);
			logger.debug("Parametros para PAC_IAX_ADM");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CEMPRES = usuario.getCempres();
			BigDecimal pPNRECIBO = this.getCampoNumerico(request, "NRECIBO");
			BigDecimal pPNPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPITEM = this.getCampoNumerico(request, "ITEM");
			BigDecimal pPCESTREC = new BigDecimal("0");
			String pPCMONPAG = this.getCampoTextual(request, "CMONOPE");
			BigDecimal pPTIPO = this.getCampoNumerico(request, "TIPO");
			BigDecimal pPSPERSON = this.getCampoNumerico(request, "NNUMIDE");
			Date pFEMISIO = stringToSqlDate(getCampoTextual(request, "FEMISIO"));

			Map map = null;
			PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(pPCMONPAG);
			logger.debug("++++map: " + map);
			BigDecimal moneda = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("++++moneda: " + moneda);

			map = null;
			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSRECIBOS_MULTIMONEDA(CEMPRES, pPNRECIBO, pPNPOLIZA, pPITEM,
					pPCESTREC, moneda, pPTIPO, pPSPERSON, CIDIOMA, pFEMISIO);
			logger.debug("++++map: " + map);

			List LSTRECIBOS = (List) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("++++fecha_pago: " + pFEMISIO);
			formdata.put("FEMISIO", pFEMISIO);
			logger.debug("++++recibos: " + LSTRECIBOS);
			formdata.put("LSTRECIBOS", LSTRECIBOS);
			logger.debug("++++moneda: " + pPCMONPAG);
			formdata.put("moneda", pPCMONPAG);
			logger.debug("Fin try");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj015Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axiscaj015Action thisAction) {
		logger.debug("Axiscaj015Service guardar");

		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", pSPERSON);
			logger.debug("++++SPERSON: " + pSPERSON);

			String pSPERSON2 = this.getCampoTextual(request, "SPERSON");
			formdata.put("pSPERSON2", pSPERSON2);
			logger.debug("++++pSPERSON2: " + pSPERSON2);

			BigDecimal CMETMOV = this.getCampoNumerico(request, "CMETMOV");
			formdata.put("CMETMOV", CMETMOV);
			logger.debug("++++CMETMOV: " + CMETMOV);

			String CMETMOV2 = this.getCampoTextual(request, "CMETMOV");
			formdata.put("CMETMOV2", CMETMOV2);
			logger.debug("++++CMETMOV2: " + CMETMOV2);

			BigDecimal NCHEQUE = this.getCampoNumerico(request, "NCHEQUE");
			formdata.put("NCHEQUE", NCHEQUE);
			logger.debug("++++NCHEQUE: " + NCHEQUE);
			BigDecimal CCHQORI = this.getCampoNumerico(request, "CCHQORI");
			formdata.put("CCHQORI", CCHQORI);
			logger.debug("++++CCHQORI: " + CCHQORI);
			BigDecimal CBANTRANS = this.getCampoNumerico(request, "CBANTRANS");
			formdata.put("CBANTRANS", CBANTRANS);
			logger.debug("++++CBANTRANS: " + CBANTRANS);
			BigDecimal CCC = this.getCampoNumerico(request, "CCC");
			formdata.put("CCC", CCC);
			logger.debug("++++CCC: " + CCC);
			BigDecimal CTIPTAR = this.getCampoNumerico(request, "CTIPTAR");
			formdata.put("CTIPTAR", CTIPTAR);
			logger.debug("++++CTIPTAR: " + CTIPTAR);
			BigDecimal NTARGET = this.getCampoNumerico(request, "NTARGET");
			formdata.put("NTARGET", NTARGET);
			logger.debug("++++NTARGET: " + NTARGET);
			BigDecimal FCADTAR = this.getCampoNumerico(request, "FCADTAR");
			formdata.put("FCADTAR", FCADTAR);
			logger.debug("++++FCADTAR: " + FCADTAR);
			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			formdata.put("IMOVIMI", IMOVIMI);
			logger.debug("++++IMOVIMI: " + IMOVIMI);
			BigDecimal NNUMIDE = this.getCampoNumerico(request, "NNUMIDE");
			formdata.put("NNUMIDE", NNUMIDE);
			logger.debug("++++NNUMIDE: " + NNUMIDE);
			BigDecimal TNOMBRE = this.getCampoNumerico(request, "TNOMBRE");
			formdata.put("TNOMBRE", TNOMBRE);
			logger.debug("++++TNOMBRE: " + TNOMBRE);
			BigDecimal MONPAG = this.getCampoNumerico(request, "MONPAG");
			formdata.put("MONPAG", MONPAG);
			logger.debug("++++MONPAG: " + MONPAG);
			BigDecimal SMONPAG = this.getCampoNumerico(request, "SMONPAG");
			formdata.put("SMONPAG", SMONPAG);
			logger.debug("++++SMONPAG: " + SMONPAG);
			BigDecimal FEMISIO = this.getCampoNumerico(request, "FEMISIO");
			formdata.put("FEMISIO", FEMISIO);
			logger.debug("++++FEMISIO: " + FEMISIO);

			// Bug 0032660/0190245 - 12/11/2014 - JMF
			BigDecimal PCAUTORIZA = this.getCampoNumerico(request, "CAUTORIZA");
			formdata.put("CAUTORIZA", PCAUTORIZA);
			logger.debug("+++++++PCAUTORIZA: " + PCAUTORIZA);

			BigDecimal PNULTDIGTAR = this.getCampoNumerico(request, "NULTDIGTAR");
			formdata.put("NULTDIGTAR", PNULTDIGTAR);
			logger.debug("+++++++PNULTDIGTAR: " + PNULTDIGTAR);

			BigDecimal PNCUOTAS = this.getCampoNumerico(request, "NCUOTAS");
			formdata.put("NCUOTAS", PNCUOTAS);
			logger.debug("+++++++PNCUOTAS: " + PNCUOTAS);

			BigDecimal PCCOMERCIO = this.getCampoNumerico(request, "CCOMERCIO");
			formdata.put("CCOMERCIO", PCCOMERCIO);
			logger.debug("+++++++PCCOMERCIO: " + PCCOMERCIO);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj015Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_persona(HttpServletRequest request, Axiscaj015Action thisAction) {
		logger.debug("axiscaj015Service m_ajax_persona");
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
			logger.debug("axiscaj015 Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj015Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj015Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj015Service cargarDatos");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(481), "FILTRO481_2");
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", FORMAPAGO);
			logger.debug("FORMAPAGO OK");

			Map bancos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(bancos);
			formdata.put("BANCOS", tratarRETURNyMENSAJES(request, bancos, false));
			logger.debug("BANCOS OK");

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
			logger.debug(map);
			List tipoCobro = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("tipoCobro", tipoCobro);
			logger.debug("tipoCobro OK");

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(484));
			logger.debug(map);
			List LSTCTIPTAR = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCTIPTAR", LSTCTIPTAR);
			logger.debug("LSTCTIPTAR OK");

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);
			logger.debug("MONEDAS OK");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj015Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ins_pago_recibos(HttpServletRequest request, Axiscaj015Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj015Service m_ins_pago_recibos");
			this.ins_pago_recibos(request);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj015Service.m_ins_pago_recibos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_ins_pago_recibos(HttpServletRequest request) {
		logger.debug("axiscaj015Service m_ajax_ins_pago_inicial");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			logger.debug("Ini");
			ajax.guardarContenidoFinalAContenedorAjax(this.ins_pago_recibos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj015Service - m�todo m_ajax_ins_pago_recibos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List ins_pago_recibos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		String LSTRECIBOSINS = this.getCampoTextual(request, "LSTRECIBOSINS");
		logger.debug("+++++++LSTRECIBOSINS: " + LSTRECIBOSINS);
		LSTRECIBOSINS = LSTRECIBOSINS.replaceAll("\\.", ",");
		formdata.put("LSTRECIBOSINS", LSTRECIBOSINS);
		logger.debug("+++++++LSTRECIBOSINS: " + LSTRECIBOSINS);

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

		String CMONOPE = this.getCampoTextual(request, "moneda");
		formdata.put("CMONOPE", CMONOPE);
		logger.debug("+++++++CMONOPE: " + CMONOPE);

		BigDecimal CMETMOV = this.getCampoNumerico(request, "CMETMOV");
		formdata.put("CMETMOV", CMETMOV);
		logger.debug("+++++++CMETMOV: " + CMETMOV);

		String FICHEROS = this.getCampoTextual(request, "FICHEROS");
		formdata.put("FICHEROS", FICHEROS);
		logger.debug("+++++++FICHEROS: " + FICHEROS);

		Map map = null;
		PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(CMONOPE);
		logger.debug("++++map: " + map);
		BigDecimal CMONEDA = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("CMONEDA", CMONEDA);
		logger.debug("+++++++CMONEDA: " + CMONEDA);

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

		Date FEMISIO = this.stringToSqlDate(this.getCampoTextual(request, "FEMISIO"));
		formdata.put("FEMISIO", FEMISIO);
		logger.debug("+++++++FEMISIO: " + FEMISIO);

		BigDecimal IDIFCAMBIO = this.getCampoNumerico(request, "IMOVDIF");
		formdata.put("IMOVDIF", IDIFCAMBIO);
		logger.debug("+++++++IMOVDIF: " + IDIFCAMBIO);

		// Bug 0032660/0190245 - 12/11/2014 - JMF
		BigDecimal PCAUTORIZA = this.getCampoNumerico(request, "CAUTORIZA");
		formdata.put("CAUTORIZA", PCAUTORIZA);
		logger.debug("+++++++PCAUTORIZA: " + PCAUTORIZA);

		BigDecimal PNULTDIGTAR = this.getCampoNumerico(request, "NULTDIGTAR");
		formdata.put("NULTDIGTAR", PNULTDIGTAR);
		logger.debug("+++++++PNULTDIGTAR: " + PNULTDIGTAR);

		BigDecimal PNCUOTAS = this.getCampoNumerico(request, "NCUOTAS");
		formdata.put("NCUOTAS", PNCUOTAS);
		logger.debug("+++++++PNCUOTAS: " + PNCUOTAS);

		BigDecimal PCCOMERCIO = this.getCampoNumerico(request, "CCOMERCIO");
		formdata.put("CCOMERCIO", PCCOMERCIO);
		logger.debug("+++++++PCCOMERCIO: " + PCCOMERCIO);

		map = null;

		logger.debug("LSTRECIBOSINS:" + LSTRECIBOSINS + ", SPERSON:" + SPERSON + ", new BigDecimal(0) , IMOVIMI:"
				+ IMOVIMI + ", IAUTOLIQ:" + IAUTOLIQ + ", IPAGSIN:" + IPAGSIN + ", CMONOPE:" + CMONOPE + ", CMETMOV:"
				+ CMETMOV + ", NCHEQUE:" + NCHEQUE + ", CBANTRANS:" + CBANTRANS + ", CCC:" + CCC + ", CTIPTAR:"
				+ CTIPTAR + ", NTARGET:" + NTARGET + ", FCADTAR:" + FCADTAR + ", FEMISIO:" + FEMISIO + ", IDIFCAMBIO:"
				+ IDIFCAMBIO + ", PCAUTORIZA:" + PCAUTORIZA + ", PNULTDIGTAR:" + PNULTDIGTAR + ", PNCUOTAS:" + PNCUOTAS
				+ ", PCCOMERCIO:" + PCCOMERCIO);

		map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_PAGOS_REC(LSTRECIBOSINS, SPERSON, new BigDecimal(0), IMOVIMI,
				IAUTOLIQ, IPAGSIN, CMONOPE, CMETMOV, NCHEQUE, CBANTRANS, CCC, CTIPTAR, NTARGET, FCADTAR, FEMISIO,
				IDIFCAMBIO, PCAUTORIZA, PNULTDIGTAR, PNCUOTAS, PCCOMERCIO);

		logger.debug("++++map starifa " + map);
		BigDecimal rt = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		if (rt.intValue() == 0) {
			List listaSEQCAJA = new ArrayList();
			Map mseqCaja = new HashMap();
			mseqCaja.put("PSEQCAJA", (BigDecimal) map.get("PSEQCAJA"));
			listaSEQCAJA.add(mseqCaja);
			formdata.put("SEQCAJA", (BigDecimal) map.get("PSEQCAJA"));
			logger.debug("++++listaSEQCAJA " + listaSEQCAJA);
			formdata.put("guardar", "0");
			return listaSEQCAJA;
		} else {
			return (List) map.get("MENSAJES");
		}
	}

	public void m_volver(HttpServletRequest request, Axiscaj015Action thisAction) {
		logger.debug("Axiscaj015Service m_volver");
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}