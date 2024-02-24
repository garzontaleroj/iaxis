//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_VALIDACIONES_SIN;
import axis.mvc.control.modal.Axissin013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(con);
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(con);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(con);

		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		Map map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTVAL();
		listValores.put("lstestval", (List) tratarRETURNyMENSAJES(request, map, false));
		map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1051));
		listValores.put("lcsubpag", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin013Action thisAction) {
		logger.debug("Axissin013Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin011Service m_form");

		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(con);
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			formdata.put("NRIESGO", NRIESGO);

			BigDecimal SIDEPAGRECOB = getCampoNumerico(request, "SIDEPAGRECOB");
			BigDecimal indexPago = getCampoNumerico(request, "indexPago");
			logger.debug("indexPago ::" + indexPago);
			String NSINIES = getCampoTextual(request, "NSINIES");

			if (isEmpty(SIDEPAG)) {
				SIDEPAG = SIDEPAGRECOB;
				formdata.put("SIDEPAG", SIDEPAG);
			}
			logger.debug("SIDEPAG ::" + SIDEPAG);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(SSEGURO, NSINIES,
					NTRAMIT, CTIPPAG, SIDEPAG);
			logger.debug(map);
			if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
				formdata.put("PAGO", (Map) map.get("RETURN"));
			}

			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_ULTIM_MOVPAGORECOB(SSEGURO, NSINIES, NTRAMIT,
					CTIPPAG, SIDEPAG);
			logger.debug(map);
			if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
				formdata.put("ULTMOVPAG", (Map) map.get("RETURN"));
			}

			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private BigDecimal m_getNumberValor(HttpServletRequest request, String id, Map OB_PAGRECOB) {

		return isEmpty(getHiddenCampoNumerico(request, id)) ? (BigDecimal) OB_PAGRECOB.get(id)
				: getHiddenCampoNumerico(request, id);
	}

	private String m_getStringValor(HttpServletRequest request, String id, Map OB_PAGRECOB) {

		return isEmpty(getHiddenCampoTextual(request, id)) ? (String) OB_PAGRECOB.get(id)
				: getHiddenCampoTextual(request, id);
	}

	private java.sql.Date m_getDateValor(HttpServletRequest request, String id, Map OB_PAGRECOB) {

		java.sql.Date retorn = null;
		if (!isEmpty(getHiddenCampoTextual(request, id))) {
			retorn = this.stringToSqlDate(getHiddenCampoTextual(request, id));
		} else if (OB_PAGRECOB.get(id) != null) {
			java.sql.Timestamp vtemp = (java.sql.Timestamp) OB_PAGRECOB.get(id);
			retorn = new java.sql.Date(vtemp.getTime());
		}
		return retorn;
	}

	public void m_guardar(HttpServletRequest request, Axissin013Action thisAction) {

		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(con);

			PAC_IAX_VALIDACIONES_SIN pac_iax_validaciones_sin = new PAC_IAX_VALIDACIONES_SIN(con);

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);

			String NCHEQUE = getCampoTextual(request, "NCHEQUE");
			logger.debug("NCHEQUE-->" + NCHEQUE);
			BigDecimal CESTPAG = getCampoNumerico(request, "CESTPAG");
			logger.debug("CESTPAG-->" + CESTPAG);
			// BigDecimal CESTVAL = getCampoNumerico(request, "CESTVAL");
			BigDecimal CESTVAL = isEmpty(getCampoNumerico(request, "CESTVAL")) ? getCampoNumerico(request, "VCESTVAL")
					: getCampoNumerico(request, "CESTVAL");

			logger.debug("CESTVAL-->" + CESTVAL);
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			logger.debug("SIDEPAG-->" + SIDEPAG);
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			logger.debug("CTIPPAG-->" + CTIPPAG);
			BigDecimal NMOVPAG = getCampoNumerico(request, "NMOVPAG");
			logger.debug(NMOVPAG);
			java.sql.Date FCONTAB = this.stringToSqlDate(getCampoTextual(request, "FCONTAB"));
			logger.debug("FCONTAB-->" + FCONTAB);
			java.sql.Date FEFEPAG = this.stringToSqlDate(getCampoTextual(request, "FEFEPAG"));

			BigDecimal CESTPAGANT = getCampoNumerico(request, "VTESTPAG");
			logger.debug("CESTPAGANT-->" + CESTPAGANT);

			BigDecimal CSUBPAGANT = getCampoNumerico(request, "VTSUBPAG");
			logger.debug("CESTPAGANT-->" + CESTPAGANT);

			BigDecimal CSUBPAG = isEmpty(getCampoNumerico(request, "CSUBPAG")) ? getCampoNumerico(request, "VCSUBPAG")
					: getCampoNumerico(request, "CSUBPAG");

			Map map12 = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PAGRECOB(NSINIES, NTRAMIT, SIDEPAG);

			logger.debug(map12);
			if (!isEmpty((Map) map12.get("OB_PAGRECOB"))) {
				// formdata.putAll((Map)map12.get("OB_PAGRECOB"));
				Map OB_PAGRECOB = (Map) map12.get("OB_PAGRECOB");
				Map mapa_dest = (Map) ((Map) map12.get("OB_PAGRECOB")).get("DESTINATARI");
				BigDecimal isinret = (BigDecimal) ((Map) map12.get("OB_PAGRECOB")).get("ISINRET");
				logger.debug("------- isinret:" + isinret);
				Map mapa_persona = (Map) mapa_dest.get("PERSONA");

				String CBANCAR = (String) ((Map) map12.get("OB_PAGRECOB")).get("CBANCAR");
				if (isEmpty(CBANCAR))
					CBANCAR = (String) mapa_persona.get("CBANCAR");

				BigDecimal SPERSON = (BigDecimal) mapa_persona.get("SPERSON");

				BigDecimal CTIPDES = m_getNumberValor(request, "CTIPDES", OB_PAGRECOB);
				BigDecimal CTIPBAN = m_getNumberValor(request, "CTIPBAN", OB_PAGRECOB);

				logger.debug("CTIPBAN-->" + CTIPBAN);
				logger.debug("CBANCAR-->" + CBANCAR);
				logger.debug("CTIPPAG-->" + CTIPPAG);
				BigDecimal CCONPAG = m_getNumberValor(request, "CCONPAG", OB_PAGRECOB);

				logger.debug("CCONPAG-->" + CCONPAG);
				BigDecimal CCAUIND = m_getNumberValor(request, "CCAUIND", OB_PAGRECOB);

				logger.debug("CCAUIND-->" + CCAUIND);
				BigDecimal CFORPAG = m_getNumberValor(request, "CFORPAG", OB_PAGRECOB);

				logger.debug("CFORPAG-->" + CFORPAG);
				BigDecimal ISINRET = m_getNumberValor(request, "ISINRET", OB_PAGRECOB);

				logger.debug("ISINRET-->" + ISINRET);
				BigDecimal ICONRET = m_getNumberValor(request, "ICONRET", OB_PAGRECOB);

				logger.debug(ICONRET);
				BigDecimal IRESRED = m_getNumberValor(request, "IRESRED", OB_PAGRECOB);
				logger.debug(IRESRED);
				BigDecimal IRESRCM = m_getNumberValor(request, "IRESRCM", OB_PAGRECOB);
				logger.debug(IRESRCM);
				BigDecimal ISINRETPAG = m_getNumberValor(request, "ISINRETPAG", OB_PAGRECOB);
				logger.debug(ISINRETPAG);
				BigDecimal IFRANQ = m_getNumberValor(request, "IFRANQ", OB_PAGRECOB);
				logger.debug(IFRANQ);
				BigDecimal ISUPLID = m_getNumberValor(request, "ISUPLID", OB_PAGRECOB);
				logger.debug(ISUPLID);
				BigDecimal IIVA = m_getNumberValor(request, "IIVA", OB_PAGRECOB);
				logger.debug(IIVA);
				BigDecimal PRETENC = m_getNumberValor(request, "PRETENC", OB_PAGRECOB);
				logger.debug(PRETENC);
				BigDecimal ICONRETP = m_getNumberValor(request, "ICONRETP", OB_PAGRECOB);
				logger.debug(ICONRETP);
				BigDecimal IRETENCPAG = m_getNumberValor(request, "IRETENCPAG", OB_PAGRECOB);
				logger.debug(IRETENCPAG);
				BigDecimal IIVAPAG = m_getNumberValor(request, "IIVAPAG", OB_PAGRECOB);
				logger.debug(IIVAPAG);
				BigDecimal ISUPLIDPAG = m_getNumberValor(request, "ISUPLIDPAG", OB_PAGRECOB);
				logger.debug(ISUPLIDPAG);
				BigDecimal IFRANQPAG = m_getNumberValor(request, "IFRANQPAG", OB_PAGRECOB);
				logger.debug(IFRANQPAG);
				String NFACREF = this.m_getStringValor(request, "NFACREF", OB_PAGRECOB);
				logger.debug("NFACREF-->" + NFACREF);
				java.sql.Date FORDPAG = this.stringToSqlDate(this.m_getStringValor(request, "FORDPAG", OB_PAGRECOB));
				logger.debug("FORDPAG-->" + FORDPAG);
				java.sql.Date FCAMBIO = this.m_getDateValor(request, "FCAMBIO", OB_PAGRECOB);
				logger.debug("FCAMBIO-->" + FCAMBIO);
				java.sql.Date FFACREF = this.m_getDateValor(request, "FFACREF", OB_PAGRECOB);
				logger.debug("FFACREF-->" + FFACREF);
				String CMONRES = this.m_getStringValor(request, "CMONRES", OB_PAGRECOB);
				logger.debug(CMONRES);
				String CMONPAG = this.m_getStringValor(request, "CMONPAG", OB_PAGRECOB);
				logger.debug(CMONPAG);

				// bug 0024690 de ASN
				BigDecimal IRETENC = m_getNumberValor(request, "IRETENC", OB_PAGRECOB);

				// BUG 39142/229176 INICIO
				BigDecimal CULTPAG = m_getNumberValor(request, "CULTPAG", OB_PAGRECOB);
				logger.debug("CULTPAG-->" + CULTPAG);

				BigDecimal IRETEIVA = m_getNumberValor(request, "IRETEIVA", OB_PAGRECOB);
				logger.debug("IRETEIVA-->" + IRETEIVA);

				BigDecimal IRETEICA = m_getNumberValor(request, "IRETEICA", OB_PAGRECOB);
				logger.debug("IRETEICA-->" + IRETEICA);

				BigDecimal IRETEIVAPAG = m_getNumberValor(request, "IRETEIVAPAG", OB_PAGRECOB);
				logger.debug("IRETEIVAPAG-->" + IRETEIVAPAG);

				BigDecimal IRETEICAPAG = m_getNumberValor(request, "IRETEICAPAG", OB_PAGRECOB);
				logger.debug("IRETEICAPAG-->" + IRETEICAPAG);

				BigDecimal IICA = m_getNumberValor(request, "IICA", OB_PAGRECOB);
				logger.debug("IICA-->" + IICA);

				BigDecimal IICAPAG = m_getNumberValor(request, "IICAPAG", OB_PAGRECOB);
				logger.debug("IICAPAG-->" + IICAPAG);

				BigDecimal CAGENTE = m_getNumberValor(request, "CAGENTE", OB_PAGRECOB);
				logger.debug("CAGENTE-->" + CAGENTE);

				BigDecimal NPERSREL = m_getNumberValor(request, "NPERSREL", OB_PAGRECOB);
				logger.debug("NPERSREL-->" + NPERSREL);

				BigDecimal CDOMICI = m_getNumberValor(request, "CDOMICI", OB_PAGRECOB);
				logger.debug("CDOMICI-->" + CDOMICI);

				BigDecimal CTRIBUTACION = m_getNumberValor(request, "CTRIBUTACION", OB_PAGRECOB);
				logger.debug("CTRIBUTACION-->" + CTRIBUTACION);

				// BUG 39142/229176 FIN
				BigDecimal CBANCO = m_getNumberValor(request, "CBANCO", OB_PAGRECOB);

				BigDecimal COFICI = m_getNumberValor(request, "COFICI", OB_PAGRECOB);

				BigDecimal CCIUDAD = m_getNumberValor(request, "CCIUDAD", OB_PAGRECOB);

				BigDecimal IOTROSGAS = m_getNumberValor(request, "IOTROSGAS", OB_PAGRECOB);

				String TOBSERVA = this.m_getStringValor(request, "TOBSERVA", OB_PAGRECOB);

				Map mapGuardandoCabecera = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(
						SSEGURO, SIDEPAG, NSINIES, NTRAMIT, CTIPDES, CTIPPAG, CCONPAG, CCAUIND, CFORPAG, FORDPAG,
						CTIPBAN, CBANCAR, CMONRES, ISINRET, ICONRET, PRETENC, IRETENC, IIVA, ISUPLID, IFRANQ, IRESRED,
						IRESRCM, CMONPAG, ISINRETPAG, ICONRETP, IRETENCPAG, IIVAPAG, ISUPLIDPAG, IFRANQPAG, FCAMBIO,
						NFACREF, FFACREF, SPERSON, null, CULTPAG, NCHEQUE, IRETEIVA, IRETEICA, IRETEIVAPAG, IRETEICAPAG,
						IICA, IICAPAG, CAGENTE, NPERSREL, CDOMICI, CTRIBUTACION, CBANCO, COFICI, CCIUDAD, null,
						TOBSERVA, IOTROSGAS, null, null, null, null, null);

				logger.debug("grabando pagos-->" + mapGuardandoCabecera);
				// tratarRETURNyMENSAJES(request, mapGuardandoCabecera);

				// }

				if (((BigDecimal) tratarRETURNyMENSAJES(request, mapGuardandoCabecera)).intValue() == 0) {
					// -- bug 14241 - JGM - 03/06/2010 -- Validaci�n del importe
					Map map1 = pac_iax_validaciones_sin.ejecutaPAC_IAX_VALIDACIONES_SIN__F_MOVPAGO(SIDEPAG, CESTPAG,
							CESTVAL, CSUBPAG);

					logger.debug(map1);

					if (((BigDecimal) tratarRETURNyMENSAJES(request, map1)).intValue() == 0) {
						// OK.Cridoalpagament

						Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_MOVPAGRECOB(NTRAMIT,
								SIDEPAG, NMOVPAG, CESTPAG, null, CESTVAL, FCONTAB, CTIPPAG, CESTPAGANT, CSUBPAG,
								CSUBPAGANT);
						logger.debug(map);

						if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						}

					} else {
						PAC_IAX_LISTVALORES_SIN pac_iax_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(con);

						BigDecimal PESTVALANT = getCampoNumerico(request, "VTESTVAL");
						BigDecimal PESTPAGANT = getCampoNumerico(request, "VTESTPAG");

						Map map_pa = pac_iax_listvalores_sin
								.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(PESTVALANT, PESTPAGANT, CESTVAL);

						Map listValores = new HashMap();
						listValores.put("lcestpag", (List) tratarRETURNyMENSAJES(request, map_pa));
						formdata.put("listValores", listValores);
					}

				} else {
					PAC_IAX_LISTVALORES_SIN pac_iax_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(con);

					BigDecimal PESTVALANT = getCampoNumerico(request, "VTESTVAL");
					BigDecimal PESTPAGANT = getCampoNumerico(request, "VTESTPAG");

					Map map_pa = pac_iax_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(PESTVALANT,
							PESTPAGANT, CESTVAL);

					Map listValores = new HashMap();
					listValores.put("lcestpag", (List) tratarRETURNyMENSAJES(request, map_pa));
					formdata.put("listValores", listValores);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_ajax_pago(HttpServletRequest request) {
		logger.debug("Axissin013Service m_ajax_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		AjaxContainerService ajax = new AjaxContainerService();
		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			PAC_IAX_LISTVALORES_SIN pac_iax_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(con);

			BigDecimal PESTVALANT = getCampoNumerico(request, "ESTVALANT");
			BigDecimal PESTPAGANT = getCampoNumerico(request, "ESTPAGANT");
			BigDecimal PESTVAL = getCampoNumerico(request, "ESTVAL");

			Map map = pac_iax_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSCTESTMOV(PESTVALANT, PESTPAGANT,
					PESTVAL);

			logger.debug("----->" + map);

			if (!isEmpty(map)) {
				List listaGarantias = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(listaGarantias);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin013Service - m�todo m_ajax_pago", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_carga_parametro(HttpServletRequest request) {
		logger.debug("Axissin013Service m_ajax_carga_parametro");

		AjaxContainerService ajax = new AjaxContainerService();
		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal CEMPRES = usuario.getCempres();
			String CPARAM = getCampoTextual(request, "CPARAM");

			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(CPARAM, CEMPRES);
			logger.debug("---> PAREMPRESA:" + m);

			if (!isEmpty(m)) {
				BigDecimal ret = ((BigDecimal) tratarRETURNyMENSAJES(request, m));
				Map m1 = new HashMap();
				m1.put("NVALPAR", ret);
				List lPara = new ArrayList();

				lPara.add(m1);

				ajax.guardarContenidoFinalAContenedorAjax(lPara);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin013Service - m�todo m_ajax_carga_parametro", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_contratos(HttpServletRequest request) {
		logger.debug("Axissin013Service m_ajax_cargar_contratos");

		AjaxContainerService ajax = new AjaxContainerService();
		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal PIPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal PSSEGURO = getCampoNumerico(request, "SSEGURO");
			String PNSINIES = getCampoTextual(request, "NSINIES");

			PAC_IAX_CON pac_iax_con = new PAC_IAX_CON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_con.ejecutaPAC_IAX_CON__F_LISTA_CONTRATOS_PAGO(PIPAGO, PSPERSON, PNSINIES, PSSEGURO);
			logger.debug("---> CONTRATOS:" + m);

			if (!isEmpty(m) && ((BigDecimal) tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				List listaContratos = (List) m.get("PCURCONTRATOS");
				ajax.guardarContenidoFinalAContenedorAjax(listaContratos);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin013Service - m�todo m_ajax_cargar_contratos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_valida_compensacion(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = usuario.getCempres();

			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("COMPENSACION_DEUDA"), CEMPRES);
			logger.debug("---> PAREMPRESA:" + m);
			if (!isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, m)))
					&& ((BigDecimal) tratarRETURNyMENSAJES(request, m)).equals(new BigDecimal(1))) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_VALIDA_COMPENSACION(SSEGURO, NRIESGO,
						NSINIES, SIDEPAG);
				logger.debug("++++map ejecutaPAC_IAX_SINIESTROS__F_VALIDA_COMPENSACION: " + map);

				if (!isEmpty(map) && ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					List retorno = new ArrayList();
					Map r = new HashMap();
					r.put("PTLITERA", map.get("PTLITERA"));
					retorno.add(r);
					logger.debug("++++retorno: " + retorno);
					ajax.guardarContenidoFinalAContenedorAjax(retorno);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin016Service - m�todo m_ajax_valida_compensacion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_compensacion_pagos(HttpServletRequest request, Axissin013Action thisAction) {
		logger.debug("Axissin013Service m_compensacion_pagos");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_COMPENSA_CARTERA(SSEGURO, NRIESGO, NSINIES,
					SIDEPAG);
			logger.debug("++++map ejecutaPAC_IAX_SINIESTROS__F_COMPENSA_CARTERA: " + map);

			if (!isEmpty(map) && ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_compensacion_pagos", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
