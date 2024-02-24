package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MANDATOS;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisman001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisman001Service.java
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisman001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String pmodo;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisman001Action thisAction) {

		try {
			logger.debug("Axisman001Service m_init");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			request.getSession().setAttribute("listmandatos", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("Axisman001Service m_form");
		try {

			this.cargar_valores(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void cargar_valores(HttpServletRequest request, Axisman001Action thisAction) {

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Map map = null;
			/*
			 * map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			 * BigDecimal(486));; logger.debug(map);
			 */

			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_CONSCOBRADORESBANC();
			logger.debug(map);
			List plReturn = (List) tratarRETURNyMENSAJES(request, map);

			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", FORMAPAGO);

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(487));
			logger.debug(map);
			List CACCION = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ACCIONES", CACCION);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(489));
			logger.debug(map);
			List CESTADOS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ESTADOS", CESTADOS);

			// bug 20326/99335 - 01/12/2011 BFP
			Map bancos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			logger.debug(bancos);
			formdata.put("BANCOS", tratarRETURNyMENSAJES(request, bancos, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(800049), "CATRIBU>3");
			;
			logger.debug(map);
			List LSTCTIPTAR = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCTIPTAR", LSTCTIPTAR);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * 
	 * @param request
	 */
	public void busqueda_mandatos(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("Axisman001Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String pPNNUMIDE = this.getCampoTextual(request, "NNUMIDE");
			String pPNOMBRE = this.getCampoTextual(request, "TNOMBRE");
			BigDecimal pPFORMAPAGO = this.getCampoNumerico(request, "CMETMOV");
			BigDecimal pPCBANCO = this.getCampoNumerico(request, "CBANCO") == null
					? this.getCampoNumerico(request, "CINSEMI")
					: this.getCampoNumerico(request, "CBANCO");
			String pPSUCURSAL = this.getCampoTextual(request, "CSUCURSAL");
			String pPCBANCAR = this.getCampoTextual(request, "CNCTACTE");
			BigDecimal pPTIPOTARJETA = this.getCampoNumerico(request, "CTIPCC");
			String pPNUMTARJETA = this.getCampoTextual(request, "CNUMTAR");
			BigDecimal pPINSTEMISORA = this.getCampoNumerico(request, "CINSEMI");
			BigDecimal pPMANDATO = this.getCampoNumerico(request, "CMANDATO");
			BigDecimal pPACCION = this.getCampoNumerico(request, "CACCION");
			BigDecimal pPESTADO = this.getCampoNumerico(request, "CESTADO");
			logger.debug(pPESTADO);
			BigDecimal pPDEUDORMANDANTE = this.getHiddenCampoNumerico(request, "HTIPOPERSONA");
			String pCONSULTA = (String) request.getSession().getAttribute("CONSULTA");
			logger.debug(pCONSULTA);
			/* *************** TRATAMIENTO FVENCIM ****************** */
			String FVENCIM_CADENA = getCampoTextual(request, "FVENCIM");
			java.sql.Date FVENCIM = stringToSqlDate(getCampoTextual(request, "FVENCIM"));

			String FVENCIMs = null;
			if (!isEmpty(FVENCIM_CADENA)) {
				Calendar calendar = Calendar.getInstance();
				int ANYO = new Integer(FVENCIM_CADENA.substring(3, 7));
				int MES = 0;
				String mes = FVENCIM_CADENA.substring(0, 2);

				MES = this.getMes(mes);

				calendar.set(ANYO, MES, 1);
				int maxDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);

				FVENCIM = stringToSqlDate(maxDay + "/" + FVENCIM_CADENA);
				FVENCIMs = maxDay + "/" + FVENCIM_CADENA;
				formdata.put("FVENCIM", FVENCIM);
			}
			/* ******************************************************* */
			logger.debug(FVENCIM);
			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS(pPNNUMIDE, pPNOMBRE, pPDEUDORMANDANTE,
					FVENCIMs, pPFORMAPAGO, pPCBANCO, pPCBANCAR, pPTIPOTARJETA, pPNUMTARJETA, pPINSTEMISORA, pPMANDATO,
					pPACCION, pPSUCURSAL, pPESTADO, new BigDecimal(pCONSULTA));
			logger.debug(m);
			List plReturn = (List) tratarRETURNyMENSAJES(request, m);

			request.getSession().setAttribute("listmandatos", plReturn);

			this.cargar_valores(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_recargar(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("Axisman001Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			if (!isEmpty(SSEGURO)) {
				PAC_IAX_COMMON pac_axis_common = new PAC_IAX_COMMON(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map m = pac_axis_common.ejecutaPAC_IAX_COMMON__F_GET_NPOLIZA(SSEGURO, "POL");
				logger.debug(m);
				if (!isEmpty(m.get("ONPOLIZA")))
					formdata.put("NPOLIZA", m.get("ONPOLIZA"));
				if (!isEmpty(m.get("ONCERTIF")))
					formdata.put("NCERTIF", m.get("ONCERTIF"));

			}
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IIMPORT");
			formdata.put("IIMPORT", IMPORTE);
			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarlistas(HttpServletRequest request, Axisman001Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
		Map m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA();
		logger.debug(m);
		listValores.put("lstconcep", (List) tratarRETURNyMENSAJES(request, m));

		if (!isEmpty(CCONCEPTO)) {
			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CCONCEPTO);
			logger.debug(m);
			listValores.put("lsttipocta", (List) tratarRETURNyMENSAJES(request, m));
		}

		m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017));
		logger.debug(m);
		listValores.put("lstcfiscal", (List) tratarRETURNyMENSAJES(request, m));

		formdata.put("listvalores", listValores);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_guardar(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("Axisman001Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CMETMOV = this.getCampoNumerico(request, "CMETMOV");
			formdata.put("CMETMOV", CMETMOV);
			logger.debug("+++++++CMETMOV: " + CMETMOV);

			String NCHEQUE = this.getCampoTextual(request, "NCHEQUE");
			formdata.put("NCHEQUE", NCHEQUE);
			logger.debug("+++++++NCHEQUE: " + NCHEQUE);

			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			formdata.put("IMOVIMI", IMOVIMI);
			logger.debug("+++++++IMOVIMI: " + IMOVIMI);

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
			CCC = (CCC == null) ? NCHEQUE : CCC;

			List lista = (List) request.getSession().getAttribute("fp");
			int con = 1;
			if (lista != null) {
				con = lista.size() + 1;
			} else {
				con = 1;
				lista = new ArrayList();
			}
			HashMap formaPago = new HashMap();
			formaPago.put("numlin", con);
			formaPago.put("medioPago", CMETMOV);
			formaPago.put("banco", CBANTRANS);
			formaPago.put("numero", CCC);
			formaPago.put("importe", IMOVIMI);

			Map map = null;
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_GETDESCRIPVALORES(new BigDecimal(481), CMETMOV);
			String medioPagoDesc = (String) tratarRETURNyMENSAJES(request, map, false);
			formaPago.put("medioPagoDesc", medioPagoDesc);

			if (CBANTRANS != null) {
				PAC_IAX_COBRADOR pac_iax_cobrador = new PAC_IAX_COBRADOR(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_cobrador.ejecutaPAC_IAX_COBRADOR__F_GET_DESBANCO(CBANTRANS);
				logger.debug("----> TBANCO axisadm060:" + map.get("PTBANCO"));
				String banco = (String) map.get("PTBANCO");
				formaPago.put("bancoDesc", banco);
			}

			lista.add(formaPago);

			request.getSession().setAttribute("fp", lista);
			/*
			 * PAC_IAX_LIQUIDA pac_axis_liquida = new
			 * PAC_IAX_LIQUIDA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
			 * )); BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			 * BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); BigDecimal
			 * NNUMLIN = this.getCampoNumerico(request, "NNUMLIN"); BigDecimal CDEBHAB =
			 * this.getCampoNumerico(request, "CDEBHAB"); BigDecimal IMPORTE =
			 * this.getCampoNumerico(request, "IIMPORT"); formdata.put("IIMPORT",IMPORTE);
			 * String NDOCUME = this.getCampoTextual(request, "NDOCUME"); String TDESCRIP =
			 * this.getCampoTextual(request, "TDESCRIP"); BigDecimal MODO =
			 * this.getCampoNumerico(request, "PMODO"); BigDecimal NRECIBO =
			 * this.getCampoNumerico(request, "NRECIBO"); BigDecimal NSINIES =
			 * this.getCampoNumerico(request, "NSINIES"); BigDecimal CCONCEPTO =
			 * this.getCampoNumerico(request, "CCONCEPTO"); BigDecimal SSEGURO =
			 * this.getCampoNumerico(request, "SSEGURO"); BigDecimal NPOLIZA =
			 * this.getCampoNumerico(request, "NPOLIZA"); BigDecimal NCERTIF =
			 * this.getCampoNumerico(request, "NCERTIF"); java.sql.Date FFECMOV =
			 * this.stringToSqlDate(this.getCampoTextual(request, "FFECMOV")); java.sql.Date
			 * FVALOR = this.stringToSqlDate(this.getCampoTextual(request, "FVALOR")); if
			 * (isEmpty(FVALOR)) FVALOR = new Date(new java.util.Date().getTime());
			 * BigDecimal CFISCAL = this.getCampoNumerico(request, "CFISCAL");
			 * 
			 * BigDecimal ok = new BigDecimal(0); if (isEmpty(SSEGURO) &&
			 * !isEmpty(NPOLIZA)){ Map map =
			 * pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_GET_SSEGURO(NPOLIZA,NCERTIF,"POL")
			 * ; ok = (BigDecimal)this.tratarRETURNyMENSAJES(request,map);
			 * logger.debug(map); logger.debug(!isEmpty(map.get("PSSEGURO"))); if
			 * (ok.intValue() == 0 && !isEmpty(map.get("PSSEGURO"))){
			 * formdata.put("SSEGURO",map.get("PSSEGURO")); SSEGURO =
			 * (BigDecimal)map.get("PSSEGURO"); } } if (!isEmpty(SSEGURO) || ok.intValue()
			 * == 0 ){ Map m = pac_axis_liquida.ejecutaPAC_IAX_LIQUIDA__F_SET_CTA(CEMPRES,
			 * CAGENTE, SSEGURO, NNUMLIN, CDEBHAB, IMPORTE, NDOCUME, TDESCRIP, MODO,
			 * NRECIBO, NSINIES, CCONCEPTO, FFECMOV, FVALOR, CFISCAL); logger.debug(m); if
			 * (((BigDecimal)tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO)) {
			 * formdata.put("OK", "0"); this.m_salir(request, thisAction); } }
			 * cargarlistas(request,thisAction);
			 */
			formdata.put("OK", "0");
			// this.m_salir(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_salir(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("Axisman001Service m_salir");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		try {
			logger.debug("modo al entrar-->" + pmodo);
			AbstractDispatchAction.topPila(request, "CMODO", pmodo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman001Service - m�todo m_salir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_persona(HttpServletRequest request, Axisman001Action thisAction) {
		logger.debug("axisman001Service m_ajax_persona");
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
			logger.debug("axisman01 Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio axisman001Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public int getMes(String mes) {
		Calendar calendar = Calendar.getInstance();
		if (mes.equals("01")) {
			return calendar.JANUARY;
		} else if (mes.equals("02")) {
			return calendar.FEBRUARY;
		} else if (mes.equals("03")) {
			return calendar.MARCH;
		} else if (mes.equals("04")) {
			return calendar.APRIL;
		} else if (mes.equals("05")) {
			return calendar.MAY;
		} else if (mes.equals("06")) {
			return calendar.JUNE;
		} else if (mes.equals("07")) {
			return calendar.JULY;
		} else if (mes.equals("08")) {
			return calendar.AUGUST;
		} else if (mes.equals("09")) {
			return calendar.SEPTEMBER;
		} else if (mes.equals("10")) {
			return calendar.OCTOBER;
		} else if (mes.equals("11")) {
			return calendar.NOVEMBER;
		} else if (mes.equals("12")) {
			return calendar.DECEMBER;
		} else {
			return calendar.DECEMBER;
		}
	}
}
