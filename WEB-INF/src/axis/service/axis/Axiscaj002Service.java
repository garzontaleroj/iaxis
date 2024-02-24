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

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.axis.Axiscaj002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj002Action thisAction) {
		logger.debug("Axiscaj002Service m_form");
		this.formattingNumericValues(request);
		try {
			this.cargarDatos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj002Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj002Service cargarDatos");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(481), "FILTRO481_1");
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", FORMAPAGO);

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);

			Map bancos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(bancos);
			formdata.put("BANCOS", tratarRETURNyMENSAJES(request, bancos, false));

			/* Tipo cobro */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOCOBRO();
			logger.debug(map);
			List tipoCobro = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("tipoCobro", tipoCobro);

			/* Comercio */
			PAC_IAX_CAJA pac_axis_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_caja.ejecutaPAC_IAX_CAJA__F_COMERCIO_USUARIO();
			logger.debug(map);
			BigDecimal ret = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (ret.intValue() == 0) {
				formdata.put("CCOMERCIO", (BigDecimal) map.get("PCOMERCIO"));
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj001Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List ins_pago_inicial(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();

		logger.debug("request " + request);

		PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal PSPERSON = this.getCampoNumerico(request, "SPERSON");
		formdata.put("SPERSON", PSPERSON);
		logger.debug("+++++++PSPERSON: " + PSPERSON);

		BigDecimal PCTIPMOV = new BigDecimal(0);
		formdata.put("CTIPMOV", PCTIPMOV);
		logger.debug("+++++++PCTIPMOV: " + PCTIPMOV);

		BigDecimal PIMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
		formdata.put("IMOVIMI", PIMOVIMI);
		logger.debug("+++++++PIMOVIMI: " + PIMOVIMI);

		BigDecimal PSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		formdata.put("SPRODUC", PSPRODUC);
		logger.debug("+++++++PSPRODUC: " + PSPRODUC);

		String CMONEOP = this.getCampoTextual(request, "CMONEOP");
		formdata.put("CMONEOP", CMONEOP);
		logger.debug("+++++++CMONEOP: " + CMONEOP);

		BigDecimal PCMEDMOV = this.getCampoNumerico(request, "CMEDMOV");
		formdata.put("CMEDMOV", PCMEDMOV);
		logger.debug("+++++++PCMEDMOV: " + PCMEDMOV);

		String PNCHEQUE = this.getCampoTextual(request, "NCHEQUE");
		formdata.put("NCHEQUE", PNCHEQUE);
		logger.debug("+++++++PNCHEQUE: " + PNCHEQUE);

		BigDecimal CCHQORI = this.getCampoNumerico(request, "CCHQORI");
		formdata.put("CCHQORI", CCHQORI);
		logger.debug("+++++++CCHQORI: " + CCHQORI);

		BigDecimal PCBANTRANS = this.getCampoNumerico(request, "CBANTRANS");
		formdata.put("CBANTRANS", PCBANTRANS);
		logger.debug("+++++++PCBANTRANS: " + PCBANTRANS);

		PCBANTRANS = (PCBANTRANS == null) ? CCHQORI : PCBANTRANS;

		String PCCC = this.getCampoTextual(request, "CCC");
		formdata.put("CCC", PCCC);
		logger.debug("+++++++PCCC: " + PCCC);

		BigDecimal PCTIPTAR = this.getCampoNumerico(request, "CTIPTAR");
		formdata.put("CTIPTAR", PCTIPTAR);
		logger.debug("+++++++PCTIPTAR: " + PCTIPTAR);

		BigDecimal PNTARGET = this.getCampoNumerico(request, "NTARGET");
		formdata.put("NTARGET", PNTARGET);
		logger.debug("+++++++PNTARGET: " + PNTARGET);

		String PFCADTAR = this.getCampoTextual(request, "FCADTAR");
		formdata.put("FCADTAR", PFCADTAR);
		logger.debug("+++++++PFCADTAR: " + PFCADTAR);

		Date PFCAMBIO = stringToSqlDate(getCampoTextual(request, "FCAMBIO"));
		formdata.put("FCAMBIO", PFCAMBIO);
		logger.debug("+++++++PFCAMBIO: " + PFCAMBIO);

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

		Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_MOVTO_PINICIAL(PSPERSON, PCTIPMOV, PIMOVIMI, PSPRODUC,
				CMONEOP, PCMEDMOV, PNCHEQUE, PCBANTRANS, PCCC, PCTIPTAR, PNTARGET, PFCADTAR, PFCAMBIO, PCAUTORIZA,
				PNULTDIGTAR, PNCUOTAS, PCCOMERCIO);

		logger.debug("++++map  " + map);
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

	public void m_aceptar(HttpServletRequest request, Axiscaj002Action thisAction) {
		logger.debug("Axiscaj002Service m_aceptar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		boolean flagCorrecto = true;
		try {
			this.ins_pago_inicial(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj001Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_ajax_ins_pago_inicial(HttpServletRequest request) {
		logger.debug("axiscaj002Service m_ajax_ins_pago_inicial");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.ins_pago_inicial(request));
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj002Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_persona(HttpServletRequest request, Axiscaj002Action thisAction) {
		logger.debug("axiscaj002Service m_ajax_persona");
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
			logger.debug("axiscaj002Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj002Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_producto(HttpServletRequest request, Axiscaj002Action thisAction) {
		logger.debug("axiscaj002Service m_ajax_producto");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			PAC_IAX_MNTPROD pac_axis_producto = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_producto.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("axiscaj002Service m_ajax_producto map:" + map);
			logger.debug("axiscaj002Service Fin m_ajax_producto");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj002Service - m�todo m_ajax_producto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}
}
