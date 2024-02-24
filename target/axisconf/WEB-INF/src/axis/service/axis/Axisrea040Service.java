//Revision:# mYXB0YFgMTsiP64v9hkFrA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisrea040Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			// m_cargar_valores(request);
			m_cargar_combos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar_combos(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_cargar_combos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRESA");
			/*
			 * BigDecimal CEMPRES=(BigDecimal)AbstractDispatchAction.topPila(request,
			 * "CEMPRES"); if (isEmpty(CEMPRES)) { CEMPRES=usuario.getCempres(); }
			 */
			/* Recupera combo contratos */
			Map map_contrato = (HashMap) this.dbGetContrato(request, usuario, CEMPRES);
			List listaContrato = (List) tratarRETURNyMENSAJES(request, map_contrato, false);
			formdata.put("listaContrato", listaContrato);
			logger.debug(map_contrato);

			/* Recupera combo versiones */
			List listaVersion = new ArrayList();
			List listaTramos = new ArrayList();
			List listaGarantia = new ArrayList();

			HashMap map_version = new HashMap();
			if (!isEmpty(map_contrato) && listaContrato.size() >= 1) {
				/*
				 * Extraemos el valor del SCONTRA DE LA PRIMERA FILA, la primera vez que
				 * entramos en la pantalla
				 */

				BigDecimal SCONTRA = null;
				if (!isEmpty(getCampoNumerico(request, "SCONTRA"))) {
					SCONTRA = getCampoNumerico(request, "SCONTRA"); // Cogemos el valor de pantalla
				}

				BigDecimal NVERSIO = null;
				if (!isEmpty(getCampoNumerico(request, "NVERSIO"))) {
					NVERSIO = getCampoNumerico(request, "NVERSIO"); // Cogemos el valor de pantalla
				}

				if (!isEmpty(SCONTRA)) {
					map_version = (HashMap) this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
					listaVersion = (List) tratarRETURNyMENSAJES(request, map_version, false);

					map_version = (HashMap) this.dbGetTramo(request, usuario, SCONTRA, NVERSIO);
					listaTramos = (List) tratarRETURNyMENSAJES(request, map_version, false);

				}

				Map map_garantias = new HashMap();

				BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
				if (!isEmpty(NSINIES)) {
					map_garantias = this.dbGetGarantiasSin(request, usuario, NSINIES);
				} else {
					BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
					if (!isEmpty(NPOLIZA)) {
						map_garantias = this.dbGetGarantiasPol(request, usuario, NPOLIZA);
					}
				}

				listaGarantia = (List) tratarRETURNyMENSAJES(request, map_garantias, false);
			}

			formdata.put("listaVersion", listaVersion);
			formdata.put("listaTramos", listaTramos);
			formdata.put("listaGarantia", listaGarantia);

			logger.debug(map_version);
			/* Borramos arrays auxiliares */

			Map listValores = new HashMap();
			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_axis_listValoresRea = new PAC_IAX_LISTVALORES_REA(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CDEBHAB = this.getCampoNumerico(request, "CDEBHAB");
			Map m = pac_axis_listValoresRea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPO_MOVCTA();
			// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA();
			logger.debug(m);
			listValores.put("lstconcep", (List) tratarRETURNyMENSAJES(request, m));

			// if (!isEmpty(CDEBHAB)) {
			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(19));
			// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CDEBHAB);
			logger.debug(m);
			listValores.put("lsttipocta", (List) tratarRETURNyMENSAJES(request, m));
			// }

			m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017));
			logger.debug(m);
			listValores.put("lstcfiscal", (List) tratarRETURNyMENSAJES(request, m));

			m = pac_axis_listValoresRea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA();
			logger.debug(m);
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, m));

			formdata.put("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private Map dbGetGarantia(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, null);
		logger.debug("Map de garantias ------------------------------------------------------>" + m);
		return m;
	}

	public void m_reparte(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_reparte");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

			BigDecimal IIMPORT = getCampoNumerico(request, "IIMPORT");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			String NIDENTIF = getCampoTextual(request, "NIDENTIF");
			BigDecimal CCONCEPTO = getCampoNumerico(request, "CCONCEPTO");
			BigDecimal CDEBHAB = getCampoNumerico(request, "CDEBHAB");
			String CEVENTO = getCampoTextual(request, "CEVENTO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NID = getCampoNumerico(request, "NID");

			Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_MOVMANUAL_REA(SCONTRA, NVERSIO, CTRAMO, FCIERRE, TDESCRI,
					NIDENTIF, CCONCEPTO, CDEBHAB, IIMPORT, NSINIES, NPOLIZA, NCERTIF, CEVENTO, CGARANT, NID);

			logger.debug("LISTA_DEVUELTA###-->" + map);

			// ArrayList datos = (ArrayList) tratarRETURNyMENSAJES(request, map,false);
			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			logger.debug("RETURN######-->" + RETURN);

			formdata.put("NID", map.get("PNIDOUT"));

			/*
			 * if (!isEmpty(RETURN)) for (int i=0; i<(int)RETURN.size(); i++) {
			 * 
			 * //String trozo=cadena[i]; Integer valor=new Integer(i);
			 * 
			 * HashMap mapa=(HashMap)RETURN.get(valor); // Se busca el registro
			 * 
			 * BigDecimal saldo=(BigDecimal)mapa.get("ISALDO");
			 * 
			 * mapa.put("ILIQUIDA", saldo); mapa.put("NUM_LINEA", 1); //Ponemos el valor de
			 * l�nea a 1
			 * 
			 * }
			 * 
			 * logger.debug("LSTCUENTAS######-->"+RETURN);
			 */

			if (!isEmpty(RETURN)) {
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				formdata.put("LSTCUENTAS", RETURN);
				formdata.put("guardado", "0");
				formdata.put("borrado", "0");

			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
				formdata.put("guardado", "1"); // lo veo
				formdata.put("borrado", "1");
			}
			m_cargar_combos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_tramos(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_ajax_actualiza_tramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");

			Map map = this.dbGetTramo(request, usuario, SCONTRA, NVERSIO);

			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_ajax_actualiza_tramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private Map dbGetContrato(HttpServletRequest request, UsuarioBean usuario, BigDecimal CEMPRES) throws Exception {
		// INI - 4818 - ML - OBTENER TODOS LOS CONTRATOS
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(CEMPRES);
		// Map m=new
		// PAC_IAX_LISTVALORES_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS_XL(CEMPRES);
		// FIN - 4818 - ML - OBTENER TODOS LOS CONTRATOS
		logger.debug("Map de contratos ------------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetVersion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA, BigDecimal CEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRA);
		logger.debug("Map de version  ------------------------------------------------------>" + m);
		return m;
	}

	private Map dbGetTramo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA, BigDecimal NVERSIO)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOSTRAMOS_FIL(SCONTRA, NVERSIO);
		logger.debug("Map de tramos ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetGarantiasPol(HttpServletRequest request, UsuarioBean usuario, BigDecimal NPOLIZA)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT_POL(NPOLIZA);
		logger.debug("Map de tramos ------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetGarantiasSin(HttpServletRequest request, UsuarioBean usuario, BigDecimal NSINIES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT_SIN(NSINIES);
		logger.debug("Map de tramos ------------------------------------------------->" + m);
		return m;
	}

	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * ********************************** FUNCIONES AJAX
	 * FUNCIONES**********************************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */
	/*
	 * *****************************************************************************
	 * ****************
	 */

	/**
	 *
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_version(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_ajax_actualiza_version");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRESA");
			/*
			 * (BigDecimal)AbstractDispatchAction.topPila(request, "CEMPRES"); if
			 * (isEmpty(CEMPRES)) { CEMPRES=usuario.getCempres(); }
			 */

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			Map map = this.dbGetVersion(request, usuario, SCONTRA, CEMPRES);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_ajax_actualiza_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualiza_pantalla(HttpServletRequest request) {
		logger.debug("Axisarea040Service m_ajax_actualiza_pantalla");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			logger.debug("------- Actualiza pantalla");

			// ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea040Service - m�todo m_ajax_actualiza_pantalla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_garantias(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_ajax_actualiza_garantias");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			List listaGarantias = new ArrayList();
			Map map_garantias = new HashMap();

			BigDecimal SPRODUC = null;
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			if (!isEmpty(NSINIES)) {
				// Si NSINIES is not null, recuperamos el SPRODUC a partir de el
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTASINI2(null, null, null, null,
						this.bigDecimalToString(NSINIES), null, null, null, null, null, null, null, null, null, null,
						null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null, null, null, null);
				logger.debug(map);
				List listaSiniestros = (List) tratarRETURNyMENSAJES(request, map);
				if (listaSiniestros.size() > 0 && listaSiniestros.get(0) != null)
					SPRODUC = (BigDecimal) ((Map) listaSiniestros.get(0)).get("SPRODUC");
			} else {
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
				if (!isEmpty(NPOLIZA)) {
					// Si NPOLIZA is not null, recuperamos el SPRODUC a partir de el
					PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					HashMap map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(null, null, NPOLIZA,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, null, null, null, null, null, null, null, null, null, SCONTRA, null, null, null, null,
							null, null, null, null);
					logger.debug(map);
					List plReturn = (List) tratarRETURNyMENSAJES(request, map);

					if (plReturn.size() > 0 && plReturn.get(0) != null)
						SPRODUC = (BigDecimal) ((Map) plReturn.get(0)).get("SPRODUC");
				}
			}

			// FIXME: Enlloc d'agafar les garanties a partir del SPRODUC, agafar a partir
			// del SSEGURO or NSINIES
			map_garantias = (HashMap) this.dbGetGarantia(request, usuario, null, SPRODUC);
			logger.debug(map_garantias);

			logger.debug("------- Nuevos valores combos:" + map_garantias);

			ajax.guardarContenidoFinalAContenedorAjax(map_garantias);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_ajax_actualiza_tramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualiza_garantias_fil(HttpServletRequest request) {
		logger.debug("Axisrea040Service m_ajax_actualiza_garantias_fil");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			Map map_garantias = new HashMap();

			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			if (!isEmpty(NSINIES)) {
				map_garantias = this.dbGetGarantiasSin(request, usuario, NSINIES);
			} else {
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				if (!isEmpty(NPOLIZA)) {
					map_garantias = this.dbGetGarantiasPol(request, usuario, NPOLIZA);
				}
			}

			logger.debug(map_garantias);

			logger.debug("------- Nuevos valores combos:" + map_garantias);

			ajax.guardarContenidoFinalAContenedorAjax(map_garantias);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_ajax_actualiza_garantias_fil", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea040Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NID = this.getHiddenCampoNumerico(request, "NID");

			Map map = null;

			map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_MOVMANUAL_REA(NID, new BigDecimal(1));
			logger.debug(map);

			this.tratarRETURNyMENSAJES(request, map);
			if (((BigDecimal) map.get("RETURN")).intValue() == 0) {
				formdata.put("guardado", "1"); // NO lo veo
				formdata.put("borrado", "1");
			} else {
				formdata.put("guardado", "0"); // lo veo
				formdata.put("borrado", "1");
			}
			formdata.put("NID", "");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cancelar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea040Service m_cancelar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NID = this.getHiddenCampoNumerico(request, "NID");

			Map map = null;

			map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_MOVMANUAL_REA(NID, new BigDecimal(0));
			logger.debug(map);

			this.tratarRETURNyMENSAJES(request, map);

			if (((BigDecimal) map.get("RETURN")).intValue() == 0) {
				formdata.put("borrado", "1");
				formdata.put("guardado", "1"); // NO lo veo
			} else {
				formdata.put("borrado", "0"); // lo veo
				formdata.put("guardado", "0"); // lo veo
			}
			formdata.put("NID", "");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea040Service - m�todo m_cancelar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
