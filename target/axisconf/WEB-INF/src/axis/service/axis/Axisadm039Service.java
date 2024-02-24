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

import axis.jdbc.PAC_IAX_TRANSFERENCIAS;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm039Service.java 26/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm039Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_REGISTROS_PENDIENTES();
			logger.debug(map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO))
				formdata.put("PHAYREGISTROS", map.get("PHAYREGISTROS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_init", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.put("TRANSFERIT",
					isEmpty(formdata.get("TRANSFERIT")) ? new BigDecimal(0) : formdata.get("TRANSFERIT"));
			formdata.put("GENERAT", isEmpty(formdata.get("GENERAT")) ? new BigDecimal(0) : formdata.get("GENERAT"));
			formdata.put("NREMESA",
					isEmpty(formdata.get("NREMESA")) ? formdata.get("NREMESA_cerca") : formdata.get("NREMESA"));

			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES_cerca");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DIAS_ABONO(CEMPRES);
			BigDecimal PNUMDIAS = (BigDecimal) map.get("PNUMDIAS");
			request.setAttribute("NUMDIAS", PNUMDIAS);
//            String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_form", e);

		} finally {
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR",
					"PAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_recargar_registrespendents(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.put("TRANSFERIT",
					isEmpty(formdata.get("TRANSFERIT")) ? new BigDecimal(0) : formdata.get("TRANSFERIT"));
			formdata.put("GENERAT", isEmpty(formdata.get("GENERAT")) ? new BigDecimal(0) : formdata.get("GENERAT"));
			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS(null, null, null, null,
					null, null, null, null, null, null, null, null);
			logger.debug(map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {

				ArrayList cur = (ArrayList) map.get("PCURTRANSFERENCIAS");
				if (!isEmpty(cur) && cur.size() > 0)
					formdata.put("transferencias", cur);

				map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(null, null);
				logger.debug(map);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
					formdata.put("TOTALTRANS", map.get("PTOTAL"));
				}

				map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_CUENTAS(null, null);
				logger.debug(map);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
					formdata.put("cuentas", map.get("PCURBANCOS"));
				}

			}

			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_form", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			formdata.put("TRANSFERIT",
					isEmpty(formdata.get("TRANSFERIT")) ? new BigDecimal(0) : formdata.get("TRANSFERIT"));
			formdata.put("GENERAT", isEmpty(formdata.get("GENERAT")) ? new BigDecimal(0) : formdata.get("GENERAT"));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES_cerca");
			BigDecimal CAGRUP = this.getCampoNumerico(request, "CAGRUP_cerca");
			BigDecimal CRAMO_cerca = this.getCampoNumerico(request, "CRAMO_cerca");
			BigDecimal SPRODUC_cerca = this.getCampoNumerico(request, "SPRODUC_cerca");
			java.sql.Date FABONOINI_cerca = this.stringToSqlDate(this.getCampoTextual(request, "FABONOINI_cerca"));
			java.sql.Date FABONOFIN_cerca = this.stringToSqlDate(this.getCampoTextual(request, "FABONOFIN_cerca"));
			java.sql.Date FTRANSINI_cerca = this.stringToSqlDate(this.getCampoTextual(request, "FTRANSINI_cerca"));
			java.sql.Date FTRANSFIN_cerca = this.stringToSqlDate(this.getCampoTextual(request, "FTRANSFIN_cerca"));
			BigDecimal CTRANSFERIDOS_cerca = this.getCampoNumerico(request, "CTRANSFERIDOS_cerca");
			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			BigDecimal NREMESA_cerca = this.getCampoNumerico(request, "NREMESA_cerca");

			BigDecimal VNREMESA_H = this.getCampoNumerico(request, "VNREMESA");
			String VCCC_H = this.getCampoTextual(request, "VCCC");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS_AGRUP(CEMPRES, CAGRUP,
					CRAMO_cerca, SPRODUC_cerca, FABONOINI_cerca, FABONOFIN_cerca, FTRANSINI_cerca, FTRANSFIN_cerca,
					CTRANSFERIDOS_cerca, tipos_cerca, NREMESA_cerca);
			logger.debug(map1);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map1)).equals(BigDecimal.ZERO)) {
				ArrayList cur = (ArrayList) map1.get("PCURTRANSFERENCIAS");
				List<Map> cur2 = (List<Map>) map1.get("PCURTRANSFERENCIAS");

				if (!isEmpty(cur) && cur.size() > 0) {
					BigDecimal VNREMESA;
					String VCCC;
					if (!isEmpty(VNREMESA_H) && !isEmpty(VCCC_H)) {
						VNREMESA = VNREMESA_H;
						VCCC = VCCC_H;
					} else {
						VNREMESA = (BigDecimal) cur2.get(0).get("NREMESA");
						VCCC = (String) cur2.get(0).get("CCC");
					}

					formdata.put("transferencias_agrup", cur);
					formdata.put("VNREMESA", VNREMESA);
					formdata.put("VCCC", VCCC);

					Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TRANSFERENCIAS(CEMPRES,
							CAGRUP, CRAMO_cerca, SPRODUC_cerca, FABONOINI_cerca, FABONOFIN_cerca, FTRANSINI_cerca,
							FTRANSFIN_cerca, CTRANSFERIDOS_cerca, tipos_cerca, VNREMESA, VCCC);
					// NREMESA_cerca);
					logger.debug(map);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
						cur = (ArrayList) map.get("PCURTRANSFERENCIAS");

						if (!isEmpty(cur) && cur.size() > 0) {
							formdata.put("transferencias", cur);

							map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(null, null);
							logger.debug(map);
							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
								formdata.put("TOTALTRANS", map.get("PTOTAL"));
							}

							map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_CUENTAS(VNREMESA, VCCC);
							logger.debug(map);
							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
								formdata.put("cuentas", map.get("PCURBANCOS"));
								SINPAQUETE SINPAQUETE = new SINPAQUETE(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
								map = SINPAQUETE.ejecutaF_PARINSTALACION_T("TRANSFERENCIAS_C");
								logger.debug(map);
								formdata.put("PATH", tratarRETURNyMENSAJES(request, map) + "\\");
							}
						}

					}

				}
			}

			String origen = this.getCampoTextual(request, "origen");
			if (!isEmpty(origen) && origen.equals("cercant"))
				formdata.remove("NREMESA");

			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_buscar", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_transferir(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_transferir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES_cerca");

			Date FABONO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FABONO"), "dd/MM/yyyy");
			logger.debug("FABONO=" + FABONO);

			Map map = new PAC_IAX_TRANSFERENCIAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRANSFERENCIAS__F_VALIDA_FABONO(FABONO);
			logger.debug("ejecutaPAC_IAX_TRANSFERENCIAS__F_VALIDA_FABONO()" + map);

			if (!((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
				formdata.put("CTRANSFERIDOS_cerca", new BigDecimal(0));
				ajax.guardarContenidoFinalAContenedorAjax(map);
			} else {

				map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_TRANSFERIR(CEMPRES, FABONO);
				logger.debug(map);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
					formdata.put("NREMESA", map.get("PNREMESA"));
					formdata.put("PARAMS", map.get("PARAMS_OUT"));
					// m_genfitxer(request);
					formdata.put("TRANSFERIT", new BigDecimal("1"));
				}
			}
			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_transferir", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_genfitxer(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_genfitxer");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NREMESA = this.getCampoNumerico(request, "NREMESA");

			Date FABONO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FABONO"), "dd/MM/yyyy");
			logger.debug("FABONO=" + FABONO);

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERACION_FICHERO(NREMESA, FABONO);
			logger.debug(map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
				formdata.put("GENERAT", new BigDecimal(1));
			}

			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_genfitxer", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_genfitxer_excel(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_genfitxer");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NREMESA = this.getCampoNumerico(request, "NREMESA");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL();
			logger.debug(map);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0) {
				formdata.put("PARAMS", map.get("PARAMS_OUT"));
				formdata.put("TRANSFERIT", new BigDecimal("1"));
			}

			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_genfitxer", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_genfitxerexcelpre(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_genfitxerexcelpre");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NREMESA = this.getCampoNumerico(request, "NREMESA");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias
					.ejecutaPAC_IAX_TRANSFERENCIAS__F_GENERAR_FICHERO_EXCEL(new BigDecimal("1"));
			logger.debug(map);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0) {
				formdata.put("PARAMS", map.get("PARAMS_OUT"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_genfitxer", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_updateMarcados(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_updateMarcados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal marcado = this.getCampoNumerico(request, "seleccionar");
			BigDecimal SREMESA = this.getCampoNumerico(request, "SREMESA");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_ACTUALIZA_REMESAS_PREVIO(SREMESA,
					marcado);
			logger.debug(map);
			this.tratarRETURNyMENSAJES(request, map);
			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_updateMarcados", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_updateMarcados(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_ajax_updateMarcados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal marcado = this.getCampoNumerico(request, "seleccionar");
			BigDecimal SREMESA = this.getCampoNumerico(request, "SREMESA");

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_ACTUALIZA_REMESAS_PREVIO(SREMESA,
					marcado);
			logger.debug(map);

			map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_TOTAL(null, null);
			logger.debug(map);
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, new String[] { "PTOTAL" });
			logger.debug(resultadoAjax[0]);
			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PTOTAL = new HashMap();
				PTOTAL.put("PTOTAL", resultadoAjax[1]);
				Map MENSAJES = new HashMap();
				MENSAJES.put("MENSAJES", map.get("MENSAJES"));
				Map RETURN = new HashMap();
				MENSAJES.put("RETURN", map.get("RETURN"));
				List RESULTADO = new ArrayList();
				RESULTADO.add(PTOTAL);
				RESULTADO.add(MENSAJES);
				RESULTADO.add(RETURN);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

			// ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_cargar_cuentas_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_salir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO();
			logger.debug(map);
			this.tratarRETURNyMENSAJES(request, map);
			formdata.put("SALIR", "1");
			String tipos_cerca = this.getCampoTextual(request, "tipos_cerca");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_GET_DESC_CONCEPTO(tipos_cerca);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);
			formdata.put("PTLITERA", m.get("PTLITERA"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_salir", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_fcambio(HttpServletRequest request) {
		logger.debug("Axisadm039Service m_fcambio");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NSREMESA = this.getCampoNumerico(request, "NSREMESA");
			Date NFCAMBIO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "NFCAMBIO"), "dd/MM/yyyy");
			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_SET_FCAMBIO(NSREMESA, NFCAMBIO);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			m_buscar(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_salir", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
