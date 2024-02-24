//Revision:# Yt7Nz2HpoUHI/efP7QN1kA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_DUPLICAR;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr018Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import oracle.sql.CLOB;

public class Axisctr018Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr018Service.class);
	Map leeHistPsu = null;
	Map leeHistPsuRet = null;

	public void m_init(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal num_fila = getCampoNumerico(request, "NUM_FILA");
			request.getSession().setAttribute("NUM_FILA", num_fila);

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = null;

			BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
					? (BigDecimal) request.getSession().getAttribute("SSEGURO_CONS")
					: getCampoNumerico(request, "SSEGURO");

			formdata.put("SSEGURO", SSEGURO);
			request.setAttribute("SSEGURO", SSEGURO);

			BigDecimal CANVI = (BigDecimal) formdata.get("CANVI");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");

			logger.debug("CANVI-->" + CANVI);
			logger.debug("SSEGURO-->" + SSEGURO);
			if (!AxisBaseService.isEmpty(SSEGURO) && (isEmpty(CANVI) || CANVI.intValue() != 0)) {
				logger.debug("entra a motius");

				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);

				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug("DATOS POLIZA: " + m);
				tratarRETURNyMENSAJES(request, m);
				Map datos_poliza = (Map) m.get("RETURN");
				logger.debug("pila-->" + AbstractDispatchAction.topPila(request));
				formdata.put("CRETENI", new BigDecimal(String.valueOf(datos_poliza.get("CRETENI"))));
				Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU",
						new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));

				logger.debug("parproducto:" + parproducto);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 0) {

					m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(SSEGURO, NMOVIMI);
					request.getSession().setAttribute("SSEGURO_CONS", SSEGURO);
					logger.debug("m:" + m);
					tratarRETURNyMENSAJES(request, m);
					request.setAttribute("polmvtreten", m.get("RETURN"));

				} else {

					formdata.put("permiteModificar", new BigDecimal(0));
					BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
					Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, null, "POL");

					logger.debug("col_psu:" + col_psu);
					BigDecimal cestpol = new BigDecimal(0);

					Object put = formdata.put("CESTPOL_PSU", col_psu.get("P_CESTPOL"));
					logger.debug("col_psu:" + col_psu.get("P_CESTPOL"));

					if (!isEmpty(col_psu.get("P_CESTPOL"))) {
						cestpol = new BigDecimal(String.valueOf(col_psu.get("P_CESTPOL")));
						if (cestpol.intValue() == 3)
							request.getSession().removeAttribute("PRETEN_T_IAX_PSU");
					}
					if (cestpol.intValue() != 3) {
						logger.debug("col_psu:" + col_psu.get("P_TPSUS"));

						Map PRETEN_T_IAX_PSU = new HashMap();

						logger.debug("col_psu:" + PRETEN_T_IAX_PSU.get("OBSERV"));

						CLOB clob = (CLOB) PRETEN_T_IAX_PSU.get("OBSERV");
						if (clob != null) {
							String clobStr;

							try {
								clobStr = clob.getSubString(1, (int) clob.length());
								PRETEN_T_IAX_PSU.put("OBSERV", clobStr);
								logger.debug(clobStr);
								logger.debug(PRETEN_T_IAX_PSU.get("OBSERV"));
								String TOBSERV;
								request.setAttribute("TOBSERV", clobStr);
							} catch (SQLException e) {
							}
						}

						request.setAttribute("PRETEN_T_IAX_PSU", col_psu.get("P_TPSUS"));
						formdata.put("TESTPOL_PSU", col_psu.get("P_TESTPOL"));

						formdata.put("CNIVELBPM_PSU", col_psu.get("P_CNIVELBPM"));
						formdata.put("TNIVELBPM_PSU", col_psu.get("P_TNIVELBPM"));
						formdata.put("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));

						// se pasa a una lista para poder recuperar en un multiregistro en pantalla.
						if (col_psu.get("POBPSU_RETENIDAS") != null
								&& ((HashMap) col_psu.get("POBPSU_RETENIDAS")).get("SSEGURO") != null) {
							List lst_observRet = new ArrayList();
							lst_observRet.add(col_psu.get("POBPSU_RETENIDAS"));
							formdata.put("LST_POBPSU_RETENIDAS", lst_observRet);
						}

						if (!isEmpty(col_psu.get("P_CNIVELBPM"))) {
							BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(col_psu.get("P_CNIVELBPM")));

							Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");
							logger.debug(mm);
							BigDecimal CNIVEL_USU = new BigDecimal(0);
							if (!isEmpty(mm.get("P_NIVEL")))
								CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

							if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
								formdata.put("permiteModificar", new BigDecimal(1));
							else
								formdata.put("permiteModificar", new BigDecimal(0));

						}

					}
					formdata.put("TIPODATOS", "PSU");

					logger.debug("a");
				}
				Map gestionIr = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR",
						new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));
				logger.debug(gestionIr);
				request.setAttribute("GESTION_IR", gestionIr.get("RETURN"));
				formdata.put("GESTION_IR", gestionIr.get("RETURN"));

			} else {
				request.removeAttribute("polmvtreten");
				request.removeAttribute("PRETEN_T_IAX_PSU");
				request.getSession().removeAttribute("PRETEN_T_IAX_PSU");
				formdata.remove("TESTPOL_PSU");
				formdata.remove("CNIVELBPM_PSU");
				formdata.remove("TNIVELBPM_PSU");
				formdata.remove("POBPSU_RETENIDAS");
				formdata.remove("LST_POBPSU_RETENIDAS");
				request.removeAttribute("TESTPOL_PSU");
				request.removeAttribute("CNIVELBPM_PSU");
				request.removeAttribute("TNIVELBPM_PSU");
				request.removeAttribute("POBPSU_RETENIDAS");
			}

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			Map listValores = new HashMap();
			// combo si/no
			HashMap mapa_aux = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(9));
			listValores.put("lstInspec1", tratarRETURNyMENSAJES(request, mapa_aux));
			// combo resultado inspecci�n
			mapa_aux = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(755));
			listValores.put("lstInspec2", tratarRETURNyMENSAJES(request, mapa_aux));
			formdata.put("listvalores", listValores);
			request.getSession().setAttribute("listvalores", listValores);

			// INI IAXIS-14419 -- 08/10/2020 BJHB

			BigDecimal FACT_ELECTRONICA = BigDecimal.ZERO;

			Map mapFactura = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_CONSULTA_FACTURA(SSEGURO, "POL");
			tratarRETURNyMENSAJES(request, mapFactura);
			if (!isEmpty(mapFactura.get("RETURN")))
				FACT_ELECTRONICA = new BigDecimal(mapFactura.get("RETURN").toString());

			formdata.put("FACT_ELECTRONICA", FACT_ELECTRONICA);

			// FIN IAXIS-14419 -- 08/10/2020 BJHB

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		request.getSession().setAttribute("CMODO", CMODO);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_cargar_motivos(HttpServletRequest request) {
		logger.debug("Axisctr018Service m_ajax_cargar_motivos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal num_fila = getCampoNumerico(request, "NUM_FILA");
			request.getSession().setAttribute("NUM_FILA", num_fila);
			Map m = null;
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO_M");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");

			logger.debug("SSEGURO00-->" + getCampoNumerico(request, "SSEGURO_M"));

			if (isEmpty(SSEGURO))
				SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
						? (BigDecimal) request.getSession().getAttribute("SSEGURO_CONS")
						: getCampoNumerico(request, "SSEGURO");

			logger.debug("SSEGURO-->" + SSEGURO);
			request.setAttribute("SSEGURO", SSEGURO);
			HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
			formdata.put("SSEGURO", SSEGURO);
			request.getSession().setAttribute("SSEGURO_CONS", SSEGURO);

			if (!AxisBaseService.isEmpty(SSEGURO)) {

				BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);

				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug("DATOS POLIZA: " + m);
				tratarRETURNyMENSAJES(request, m);
				Map datos_poliza = (Map) m.get("RETURN");
				logger.debug("pila-->" + AbstractDispatchAction.topPila(request));
				Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU",
						new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));

				logger.debug("parproducto:" + parproducto);

				/* INI SECCION INSPECCIONES RIESGOS */
				PAC_IAX_INSPECCION pac_iax_inspecciones = new PAC_IAX_INSPECCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map INSPECCION_RIESGO = new HashMap();
				INSPECCION_RIESGO = (Map) pac_iax_inspecciones.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(
						SSEGURO, isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, new BigDecimal(1));
				logger.debug("INSPECCION_RIESGO m_form:" + INSPECCION_RIESGO);
				ArrayList l_inspeccion_riesgo = (ArrayList) (tratarRETURNyMENSAJES(request, INSPECCION_RIESGO));
				if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION")))
					request.setAttribute("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));

				if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION")))
					request.setAttribute("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
				int size = l_inspeccion_riesgo == null ? 0 : l_inspeccion_riesgo.size();
				if (size > 0) {
					request.setAttribute("INSPECCION_RIESGO", l_inspeccion_riesgo);
				}

				Map gestionIr = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR",
						new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));
				logger.debug(gestionIr);
				request.setAttribute("GESTION_IR", gestionIr.get("RETURN"));
				formdata.put("GESTION_IR", gestionIr.get("RETURN"));
				/* FIN SECCION INSPECCIONES RIESGOS */

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 0) {

					List motivos = (List) request.getSession().getAttribute("polmvtreten_" + SSEGURO);
					// if (motivos == null) {
					// m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_POLMVTRETEN(SSEGURO);
					m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(SSEGURO, NMOVIMI);
					logger.debug("m nouss:" + m);
					motivos = (List) ajax.rellenarPlAContenedorAjax(m);

					request.getSession().setAttribute("polmvtreten_" + SSEGURO, motivos);
					gestionarOrdenacionTablas(request);
					/*
					 * } else { motivos = (List)request.getSession().getAttribute("polmvtreten_" +
					 * SSEGURO); gestionarOrdenacionTablas(request); }
					 */

					/*
					 * Rehacer la lista de motivos a�adiendole un indice que se recoger�
					 * posteriormente CODOBSERVA
					 */
					if (motivos != null) {
						for (int j = 0; j < motivos.size(); j++) {
							HashMap mapa = (HashMap) motivos.get(j);
							((HashMap) mapa.get("OB_IAX_POLMVTRETEN")).put("CODOBSERVA", new BigDecimal(j));
						}
					}

					request.getSession().setAttribute("polmvtreten", motivos);
					request.setAttribute("polmvtreten", motivos);
					// logger.debug(motivos);
					if (!isEmpty(l_inspeccion_riesgo))
						motivos.add(INSPECCION_RIESGO);

					ajax.guardarContenidoFinalAContenedorAjax(motivos);
				} else {

					BigDecimal NMOVIMI_psu = isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI;
					Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, null, null, "POL");

					ArrayList b = null;
					ArrayList bRetorno = new ArrayList();

					leeHistPsuRet = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(SSEGURO, null, NRIESGO,
							NMOVIMI);

					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsuRet)).intValue() == 0) {

						b = (ArrayList) leeHistPsuRet.get("P_THIS_PSU_RETENIDAS");

						if (b != null) {
							for (int i = 0; i < b.size(); i++) {

								Map mapa = (Map) b.get(i);
								Map mapa2 = (Map) mapa.get("OB_IAX_PSU_RETENIDAS");

								Iterator it = mapa2.entrySet().iterator();

								Map resultadoPsuRetenida = new HashMap();
								Map resultadoPsuRetenida2 = new HashMap();

								while (it.hasNext()) {
									Map.Entry e = (Map.Entry) it.next();

									resultadoPsuRetenida.put("H" + e.getKey(), e.getValue());

								}

								resultadoPsuRetenida2.put("OB_IAX_PSU_RETENIDAS", resultadoPsuRetenida);
								bRetorno.add(resultadoPsuRetenida2);

							}

						}

					}

					logger.debug("col_psu:" + col_psu);
					BigDecimal permiteModificar = new BigDecimal(0);
					// Guardamos lo que sea que haya devuelto al contenedor Ajax.
					Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(col_psu, new String[] {
							"P_TPSUS", "P_TESTPOL", "P_CESTPOL", "P_CNIVELBPM", "P_TNIVELBPM", "POBPSU_RETENIDAS" });
					if (resultadoAjax[0].equals(new BigDecimal(0))) {
						Map PRETEN_T_IAX_PSU = new HashMap();
						PRETEN_T_IAX_PSU.put("PTPSUS", resultadoAjax[1]);
						logger.debug(resultadoAjax[1]);
						logger.debug(PRETEN_T_IAX_PSU);
						request.setAttribute("PRETEN_T_IAX_PSU", resultadoAjax[1]);

						Map PTESTPOL = new HashMap();
						PTESTPOL.put("PTESTPOL", resultadoAjax[2]);
						Map PCESTPOL = new HashMap();
						PCESTPOL.put("PCESTPOL", resultadoAjax[3]);
						Map PCNIVELBPM = new HashMap();
						PCNIVELBPM.put("PCNIVELBPM", resultadoAjax[4]);
						Map PTNIVELBPM = new HashMap();
						PTNIVELBPM.put("PTNIVELBPM", resultadoAjax[5]);
						Map POBPSU_RETENIDAS = new HashMap();
						PTNIVELBPM.put("POBPSU_RETENIDAS", resultadoAjax[6]);
						Map TIPODATOS = new HashMap();
						TIPODATOS.put("TIPODATOS", "PSU");

						// se pasa a una lista para poder recuperar en un multiregistro en pantalla.
						Map LST_POBPSU_RETENIDAS = new HashMap();
						if (resultadoAjax[6] != null && (((HashMap) resultadoAjax[6]).get("SSEGURO")) != null) {
							List lst_observRet = new ArrayList();
							lst_observRet.add(resultadoAjax[6]);
							LST_POBPSU_RETENIDAS.put("LST_POBPSU_RETENIDAS", lst_observRet);
						}

						try {
							BigDecimal CNIVELBPM = new BigDecimal(String.valueOf(resultadoAjax[4]));

							Map mm = pacIaxPsu.ejecutaPAC_IAX_PSU__F_NIVEL_USUARIO(SSEGURO, "POL");

							logger.debug(mm);
							BigDecimal CNIVEL_USU = new BigDecimal(0);
							if (!isEmpty(mm.get("P_NIVEL")))
								CNIVEL_USU = new BigDecimal(String.valueOf(mm.get("P_NIVEL")));

							if (CNIVEL_USU.intValue() >= CNIVELBPM.intValue())
								permiteModificar = new BigDecimal(1);
						} catch (Exception e) {
						}
						Map permiteModificar2 = new HashMap();
						permiteModificar2.put("permiteModificar", permiteModificar);

						List RESULTADO = new ArrayList();
						RESULTADO.add(PRETEN_T_IAX_PSU);
						RESULTADO.add(PTESTPOL);
						RESULTADO.add(PCESTPOL);
						RESULTADO.add(TIPODATOS);
						RESULTADO.add(PCNIVELBPM);
						RESULTADO.add(PTNIVELBPM);
						RESULTADO.add(POBPSU_RETENIDAS);
						RESULTADO.add(LST_POBPSU_RETENIDAS);
						RESULTADO.add(permiteModificar2);
						RESULTADO.add(bRetorno);

						Map COBJASE = this.buscaCobjase(request,
								new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC"))));
						RESULTADO.add(COBJASE);

						Map gestionIr2 = new HashMap();
						gestionIr2.put("GESTION_IR", gestionIr.get("RETURN"));
						RESULTADO.add(gestionIr2);

						if (!isEmpty(INSPECCION_RIESGO.get("PRESULTADOINSPECCION"))) {
							Map CRESULTR = new HashMap();
							CRESULTR.put("CRESULTR", INSPECCION_RIESGO.get("PRESULTADOINSPECCION"));
							RESULTADO.add(CRESULTR);
						}
						if (!isEmpty(INSPECCION_RIESGO.get("PNECESITAINSPECCION"))) {
							Map CINSPREQ = new HashMap();
							CINSPREQ.put("CINSPREQ", INSPECCION_RIESGO.get("PNECESITAINSPECCION"));
							RESULTADO.add(CINSPREQ);
						}
						if (!isEmpty(l_inspeccion_riesgo)) {
							HashMap mmm = new HashMap();
							mmm.put("INSPECCION_RIESGO", INSPECCION_RIESGO);
							RESULTADO.add(mmm);
						}
						ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_ajax_cargar_motivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr017_lista");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_TEXT");
				String NOMBRE_TEXT = getCampoTextual(request, "NOMBRE_TEXT");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = isEmpty(getCampoNumerico(request, "NPOLIZA"))
						? getCampoNumerico(request, "NPOLIZA_WIZARD")
						: getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = isEmpty(getCampoNumerico(request, "NCERTIF"))
						? getCampoNumerico(request, "NCERTIF_WIZARD")
						: getCampoNumerico(request, "NCERTIF");
				BigDecimal NSOLICI = getCampoNumerico(request, "NSOLICI");
				String NUMIDE = getCampoTextual(request, "NUMIDE");
				String SNIP = getCampoTextual(request, "SNIP");
				String NOMBRE = getCampoTextual(request, "NOMBRE");
				BigDecimal CSITUAC = getCampoNumerico(request, "CRETENI");// getCampoNumerico (request, "CSITUAC");
				BigDecimal CRETENI = getCampoNumerico(request, "CRETENI");

				String CMATRIC = getCampoTextual(request, "CMATRICULA");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				String TNATRIE = getCampoTextual(request, "DESCRIPCION");
				String TDOMICI = getCampoTextual(request, "TDOMICI");

				String tipo = getCampoTextual(request, "tipo");

				// se guardan esos parametros de busqueda para cuando se regcarga la pantalla
				// despues de hacer una operacion de anulacion o emision
				HashMap axisctr017_filtro = new HashMap();

				axisctr017_filtro.put("CAGENTE_TEXT", CAGENTE);
				axisctr017_filtro.put("NOMBRE_TEXT", NOMBRE_TEXT);

				axisctr017_filtro.put("CAGENTE", CAGENTE);
				axisctr017_filtro.put("CRAMO", CRAMO);
				axisctr017_filtro.put("SPRODUC", SPRODUC);
				axisctr017_filtro.put("NPOLIZA", NPOLIZA);
				axisctr017_filtro.put("NCERTIF", NCERTIF);
				axisctr017_filtro.put("NSOLICI", NSOLICI);
				axisctr017_filtro.put("NUMIDE", NUMIDE);
				axisctr017_filtro.put("SNIP", SNIP);
				axisctr017_filtro.put("NOMBRE", NOMBRE);
				axisctr017_filtro.put("CSITUAC", CSITUAC);
				axisctr017_filtro.put("CRETENI", CRETENI);
				axisctr017_filtro.put("CMATRIC", CMATRIC);
				axisctr017_filtro.put("CPOSTAL", CPOSTAL);
				axisctr017_filtro.put("TNATRIE", TNATRIE);
				axisctr017_filtro.put("TDOMICI", TDOMICI);
				axisctr017_filtro.put("tipo", tipo);
				thisAction.topPila(request, "axisctr017_filtro", axisctr017_filtro);
				request.getSession().setAttribute("axisctr017_filtro", axisctr017_filtro);
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(CAGENTE, CRAMO, SPRODUC, NPOLIZA,
						NSOLICI, NCERTIF, NUMIDE, SNIP, NOMBRE, CSITUAC, CMATRIC, CPOSTAL, TDOMICI, TNATRIE, tipo, null,
						null, null, null, null);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				ArrayList axisctr017_lista = (ArrayList) m.get("RETURN");
				request.getSession().setAttribute("axisctr017_lista", axisctr017_lista);
				if (axisctr017_lista.size() > 0) {

					logger.debug(axisctr017_lista.get(0));
					logger.debug(
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.getSession().setAttribute("SSEGURO_CONS",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.setAttribute("SSEGURO",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					formdata.put("SSEGURO",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
				}

			} else {
				logger.debug("axisctr017 paginando");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr017Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_cargar_observacion(HttpServletRequest request) {
		logger.debug("Axisctr018Service m_ajax_cargar_observacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// Recogemos la recarga de motivos
			List motivos = (List) request.getSession().getAttribute("polmvtreten");
			BigDecimal fila_observa = getCampoNumerico(request, "fila_observa");
			HashMap contenido = new HashMap();

			for (int i = 0; i < motivos.size(); i++) {
				HashMap mapa = (HashMap) motivos.get(i);
				BigDecimal valor_cod = (BigDecimal) ((HashMap) mapa.get("OB_IAX_POLMVTRETEN")).get("CODOBSERVA"); // CODOBSERVA
																													// antes
																													// CMOTRET
				if (valor_cod.intValue() == fila_observa.intValue()) {
					contenido.put("TOBSERVA", (String) ((HashMap) mapa.get("OB_IAX_POLMVTRETEN")).get("TOBSERVA"));
					// contenido.put("TOBSERVA","CONTENIDO PRUEBA"+fila_observa);
				}
			}

			ajax.setAjaxContainer(contenido);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_ajax_cargar_observacion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_anular(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_anular");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NSUPLEM = getCampoNumerico(request, "NSUPLEM");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			// String TOBSERVA = getHiddenCampoTextual(request, "TOBSERVA");

			String OBS = getHiddenCampoTextual(request, "OBS");

			String POSTPPER = "NULL";
			BigDecimal PERPOST = BigDecimal.ZERO;

			Map map = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_RECHAZARPROPUESTA(SSEGURO, NMOVIMI, CMOTMOV, NSUPLEM, OBS,
							POSTPPER, PERPOST);
			logger.debug(map);

			BigDecimal rechazar = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug("--rechazar--" + rechazar);
			if (rechazar.equals(new BigDecimal(0))) {
				renovarLista(request, thisAction);
				formdata.put("CANVI", rechazar);
				formdata.put("SSEGUROIMP", SSEGURO);
				request.removeAttribute("SSEGURO");
				formdata.remove("SSEGURO");
				request.setAttribute("Imprimir", "1");
			}

			/*
			 * request.removeAttribute("SSEGURO"); formdata.remove("SSEGURO");
			 * request.getSession().removeAttribute("SSEGURO_CONS");
			 */
			logger.debug(getCampoNumerico(request, "SSEGURO"));

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Despues de algunas operaciones es recomendable de renovar la lista de la
	 * polizas retenidas
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void renovarLista(HttpServletRequest request, Axisctr018Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		BigDecimal solicituduplic = (BigDecimal) request.getSession().getAttribute("SOLICITUDUPLIC");
		HashMap axisctr017_filtro = (HashMap) thisAction.topPila(request, "axisctr017_filtro");
		if (isEmpty(axisctr017_filtro) && !isEmpty(request.getSession().getAttribute("axisctr017_filtro"))) {
			axisctr017_filtro = (HashMap) request.getSession().getAttribute("axisctr017_filtro");
			thisAction.topPila(request, "axisctr017_filtro", axisctr017_filtro);
		}
		logger.debug("recuperar y reconsultar PAC_IAX_PRODUCCION__F_GET_POLIZASRETEN con axisctr017_filtro:"
				+ axisctr017_filtro);
		// if (!isEmpty(axisctr017_filtro) && solicituduplic==null) { //
		// (BigDecimal)axisctr017_filtro.get("SNIP"),
		if (!isEmpty(axisctr017_filtro)) { // (BigDecimal)axisctr017_filtro.get("SNIP"),
			BigDecimal nSolicitud = new BigDecimal(0);
			if (solicituduplic == null) {
				nSolicitud = (BigDecimal) axisctr017_filtro.get("NSOLICI");
			} else {
				nSolicitud = solicituduplic;
			}
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_POLIZASRETEN(
					(BigDecimal) axisctr017_filtro.get("CAGENTE"), (BigDecimal) axisctr017_filtro.get("CRAMO"),
					(BigDecimal) axisctr017_filtro.get("SPRODUC"), (BigDecimal) axisctr017_filtro.get("NPOLIZA"),
					nSolicitud, (BigDecimal) axisctr017_filtro.get("NCERTIF"), (String) axisctr017_filtro.get("NUMIDE"),
					(String) axisctr017_filtro.get("SNIP"), (String) axisctr017_filtro.get("NOMBRE"),
					(BigDecimal) axisctr017_filtro.get("CSITUAC"), (String) axisctr017_filtro.get("CMATRIC"),
					(String) axisctr017_filtro.get("CPOSTAL"), (String) axisctr017_filtro.get("TDOMICI"),
					(String) axisctr017_filtro.get("TNATRIE"), (String) axisctr017_filtro.get("tipo"),
					(BigDecimal) axisctr017_filtro.get("csucursal"), (BigDecimal) axisctr017_filtro.get("cadn"),
					(String) axisctr017_filtro.get("CMOTOR"), (String) axisctr017_filtro.get("CCHASIS"),
					(String) axisctr017_filtro.get("NBASTID"));
			logger.debug("m:" + m);

			if (!isEmpty(tratarRETURNyMENSAJES(request, m, false))) {
				ArrayList axisctr017_lista = (ArrayList) tratarRETURNyMENSAJES(request, m, false);

				request.getSession().setAttribute("axisctr017_lista", axisctr017_lista);

				if (axisctr017_lista.size() > 0) {
					for (int i = 0; i < axisctr017_lista.size(); i++) {
						HashMap mm = (HashMap) axisctr017_lista.get(i);

						HashMap OB_IAX_POLIZASRETEN = (HashMap) mm.get("OB_IAX_POLIZASRETEN");
						OB_IAX_POLIZASRETEN.put("MARCAR", new BigDecimal(0));
					}

					logger.debug(axisctr017_lista.get(0));
					logger.debug(
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.getSession().setAttribute("SSEGURO_CONS",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));
					request.setAttribute("SSEGURO",
							((HashMap) ((HashMap) axisctr017_lista.get(0)).get("OB_IAX_POLIZASRETEN")).get("SSEGURO"));

				}
			} else {
				request.getSession().setAttribute("axisctr017_lista", null);
				request.removeAttribute("polmvtreten");
				request.removeAttribute("PRETEN_T_IAX_PSU");
				request.getSession().removeAttribute("PRETEN_T_IAX_PSU");
				formdata.remove("TESTPOL_PSU");
				formdata.remove("CNIVELBPM_PSU");
				formdata.remove("TNIVELBPM_PSU");
				formdata.remove("POBPSU_RETENIDAS");
				request.removeAttribute("TESTPOL_PSU");
				request.removeAttribute("CNIVELBPM_PSU");
				request.removeAttribute("TNIVELBPM_PSU");
				request.removeAttribute("POBPSU_RETENIDAS");

			}
		}
	}

	public void m_renovar(HttpServletRequest request, Axisctr018Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal TIPERROR = this.getCampoNumerico(request, "TIPERROR");
			BigDecimal CERROR = this.getCampoNumerico(request, "CERROR");
			String TERROR = this.getCampoTextual(request, "TERROR");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			renovarLista(request, thisAction);

			List MENSAJES = new ArrayList();
			HashMap OB_IAX_MENSAJES = new HashMap();
			OB_IAX_MENSAJES.put("TIPERROR", TIPERROR);
			OB_IAX_MENSAJES.put("CERROR", CERROR);
			OB_IAX_MENSAJES.put("TERROR", TERROR);
			MENSAJES.add(OB_IAX_MENSAJES);
			logger.debug(Constantes.MENSAJE_ERROR + "-" + TIPERROR);
			logger.debug("SSEGURO-" + SSEGURO);
			if ((!isEmpty(TIPERROR) && TIPERROR.intValue() == Constantes.MENSAJE_ERROR) && !isEmpty(CERROR)
					&& !isEmpty(TERROR)) {
				AbstractDispatchAction.guardarMensaje(request, "verbatim:" + TERROR, null, Constantes.MENSAJE_ERROR);
				formdata.put("SSEGURO", SSEGURO);
				logger.debug("SSEGURO-" + SSEGURO);
				request.setAttribute("SSEGURO", SSEGURO);
			} else {
				request.removeAttribute("SSEGURO");
				formdata.remove("SSEGURO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_consultar(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_consultar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisctr018", formdata);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			request.getSession().setAttribute("SSEGURO_CONS", SSEGURO);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_editar(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_editar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			// Push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisctr018", formdata);

			// Passformdata: Map "destinado" a convertirse en el "nuevo" formdata
			Map passformdata = new HashMap();
			passformdata.put("SSEGURO", formdata.get("SSEGURO"));
			passformdata.put("NRIESGO", new BigDecimal(1));
			passformdata.put("SPRODUC", formdata.get("SPRODUC"));
			String MODO_EDICION = this.getCampoTextual(request, "MODO_EDICION_TEXTO");
			logger.debug("MODO_EDICION" + MODO_EDICION);
			String CMODO = this.getCampoTextual(request, "MODO_EDICION_TEXTO");
			logger.debug("CMODO" + CMODO);
			HashMap Mapcerti = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ISALTACERTIFICERO(
							new BigDecimal(String.valueOf(formdata.get("SSEGURO"))));
			logger.debug("Es certificado cero :: " + Mapcerti.get("RETURN"));
			String CFORM = "AXISCTR018";

			logger.debug("CFORM" + CFORM);

			passformdata.put("CFORM", CFORM);

			logger.debug("CFORM" + CFORM);
			String CCAMPO;

			if (isEmpty(MODO_EDICION))
				MODO_EDICION = "ALTA_POLIZA";

			logger.debug("MODO_EDICION" + MODO_EDICION);

			if (Mapcerti.get("RETURN").toString().equals("1"))
				MODO_EDICION = "ALTA_COLECTIVO";
			// BUG9426-12032009-XVM: inici
			// passformdata.put("TTITULO", "CREDIT VIDA CAPITAL");
			if (usuario.getCagente() != null)
				passformdata.put("CAGENTE_TEXT", usuario.getCagente().toString());

			passformdata.put("CMODO", CMODO);

			if (MODO_EDICION == "ALTA_POLIZA") {
				CCAMPO = null;
				logger.debug("CCAMPO :: " + CCAMPO);
				passformdata.put("CCAMPO", CCAMPO);
				logger.debug(thisAction.topPila(request));

			} else {
				if (MODO_EDICION == "ALTA_COLECTIVO") {
					CCAMPO = null;
					logger.debug("CCAMPO :: " + CCAMPO);
					passformdata.put("CCAMPO", CCAMPO);
					logger.debug(thisAction.topPila(request));

				} else {
					String CMOTMOV = CMODO.substring(11, 14);
					logger.debug("CMOTMOV :: " + CMOTMOV);
					passformdata.put("CMOTMOV", CMOTMOV);
					BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
					CCAMPO = "BT_EDITAR";
					logger.debug("CCAMPO :: " + CCAMPO);
					passformdata.put("CCAMPO", CCAMPO);
					logger.debug(thisAction.topPila(request));
					Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SUPLEMENTOS__F_INICIALIZAR_SUPLEMENTO(SSEGURO, new BigDecimal(CMOTMOV),
									CMODO);
					logger.debug(map);

					BigDecimal initSuplementosReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

					if (new BigDecimal(0).equals(initSuplementosReturn)) {

						BigDecimal PMODFEFE = (BigDecimal) map.get("PMODFEFE");
						java.sql.Date PFEFECTO = (java.sql.Date) map.get("PFEFECTO");

						passformdata.put("PMODFEFE", PMODFEFE);
						passformdata.put("PFEFECTO", PFEFECTO);

						CCAMPO = "BT_EDITAR";

						passformdata.put("CFORM", CFORM);
						logger.debug("CCAMPO :: " + CCAMPO);
						passformdata.put("CCAMPO", CCAMPO);
						logger.debug("CFORM :: " + CFORM);

					}
				}
			}

			logger.debug(thisAction.topPila(request));
			logger.debug(formdata.get("SPRODUC"));

			passformdata.put("CMODO", MODO_EDICION);

			logger.debug("CCAMPO :: " + CCAMPO);
			passformdata.put("CCAMPO", CCAMPO);

			HashMap MapTitulo = (HashMap) new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(
							new BigDecimal(String.valueOf(formdata.get("SPRODUC"))));
			logger.debug("TITTULO :: " + MapTitulo.get("RETURN"));
			passformdata.put("TTITULO", MapTitulo.get("RETURN"));

			logger.debug(thisAction.topPila(request));
			// BUG9426-12032009-XVM: fi

			logger.debug(thisAction.topPila(request));
			ajax.guardarContenidoFinalAContenedorAjax(passformdata);
			logger.debug("axisctr018 passformdata:" + passformdata);
			request.setAttribute(Constantes.PASSFORMDATA, passformdata);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_editar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public String m_modificar(HttpServletRequest request) {
		logger.debug("Axisctr018Service m_modificar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");
			logger.debug("pila-->" + AbstractDispatchAction.topPila(request));

			BigDecimal SPRODUC = new BigDecimal(String.valueOf(datos_poliza.get("SPRODUC")));
			String CCAMPO = getCampoTextual(request, "CCAMPO");
			String CMODO = "MODIF_PROP_REVINSPEC";
			/*
			 * if ("BT_SOBREPRIMA".equals(CCAMPO)){ CMODO = "MODIF_PROP_801"; }else if
			 * ("BT_DATOS_AUTO".equals(CCAMPO)){ CMODO = "MODIF_PROP_422"; }else if
			 * ("BT_CONDUCTOR_AUTO".equals(CCAMPO)){ CMODO = "MODIF_PROP_426"; }
			 */
			String CFORM = "AXISCTR018";

			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_INICIALIZAR_MODIFICACION(SSEGURO, CMODO,
					CFORM, "BT_REVINSPEC");

			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				AbstractDispatchAction.topPila(request, "SSEGURO", map.get("OESTSSEGURO"));
				AbstractDispatchAction.topPila(request, "SSEGUROx", SSEGURO);
				AbstractDispatchAction.topPila(request, "MOVIMI", map.get("ONMOVIMI"));
				AbstractDispatchAction.topPila(request, "CMODO", CMODO);
				AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
				AbstractDispatchAction.topPila(request, "REVISARINSPECC", new BigDecimal(1));
				AbstractDispatchAction.topPila(request, "TTITULO", tratarRETURNyMENSAJES(request,
						new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));

				map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, CFORM, CCAMPO,
						BigDecimal.valueOf(2));
				logger.debug(map);

				return (String) tratarRETURNyMENSAJES(request, map);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr034Service - m�todo m_modificar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		}
	}

	/*
	 * public void m_emitir_propuesta(HttpServletRequest request, Axisctr018Action
	 * thisAction) { logger.debug("Axisctr018Service m_emitir_propuesta");
	 * UsuarioBean usuario =
	 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO); HashMap
	 * formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
	 * 
	 * try{
	 * 
	 * BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI"); BigDecimal SSEGURO
	 * = getCampoNumerico(request, "SSEGURO");
	 * 
	 * PAC_IAX_PRODUCCION pacIaxProduccion=new
	 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)); HashMap m=null; // EMITIR PROPUESTA // m =
	 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(SSEGURO,NMOVIMI
	 * ); BigDecimal emitirPropuesta = (BigDecimal) tratarRETURNyMENSAJES (request,
	 * m); if (emitirPropuesta.intValue()==0) { formdata.remove("SSEGURO"); }
	 * logger.debug (emitirPropuesta);
	 * 
	 * renovarLista(request, thisAction);
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axisctr018Service - m�todo m_emitir_propuesta",
	 * e); thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString()
	 * }, Constantes.MENSAJE_ERROR); }
	 * 
	 * }
	 */

	public void m_emitir_propuesta(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal PCPROPAGASUPL = getCampoNumerico(request, "PCPROPAGASUPL");
			BigDecimal GESTION_IR = getCampoNumerico(request, "GESTION_IR");

			if ((new BigDecimal("1")).equals(GESTION_IR)) {
				// esta validaci�n es necesaria pasarla si el producto tiene gestion_ir activado
				// a 1.
				PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Map mx =
				// PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPECCION(SSEGURO,"POL");
				// BUG 25221#c148539
				Map mx = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPEC_PEND(SSEGURO, "POL");
				logger.debug(mx);

				if (!new BigDecimal("0").equals(mx.get("RETURN"))) {
					// No deber�a poder emitirse ya que faltar�a pasar la inspecci�n del veh�culo.
					// mostrar error y no continuar con la emisi�n.
					// thisAction.guardarMensaje(request,"9905755", null,Constantes.MENSAJE_INFO);
					HashMap miDataObject = new HashMap();
					miDataObject.put("resultado", mx);
					ajax.rellenarPlAContenedorAjax(mx);
					return;
				}
			}

			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("POL", SSEGURO, NMOVIMI, null, PCPROPAGASUPL);
			logger.debug("+++++PROPAGA SUPLEMENTO  m_emitir_propuesta: " + m);

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = null;
			// EMITIR PROPUESTA //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIRPROPUESTA(SSEGURO, NMOVIMI);
			logger.debug(m);
			BigDecimal emitirPropuesta = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			if (emitirPropuesta.intValue() == 0) {
				formdata.remove("SSEGURO");
			}
			logger.debug(emitirPropuesta);
			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "OSSEGURO" });
			logger.debug(resultadoAjax[0]);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", SSEGURO);
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_COBRO_RETENIDO(SSEGURO, NMOVIMI);
				logger.debug(map);
				List RESULTADO = new ArrayList();
				Map OMOTRETEN = new HashMap();
				OMOTRETEN.put("OMOTRETEN ", map.get("RETURN"));

				RESULTADO.add(OMOTRETEN);
				RESULTADO.add(OSSEGURO);
				request.getSession().setAttribute("SSEGURO", SSEGURO);
				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_volver(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisctr018 = (Map) thisAction.removeTopPila(request, "formdata_axisctr018");
			if (!isEmpty(formdata_axisctr018))
				formdata.putAll(formdata_axisctr018);

			renovarLista(request, thisAction); // por si las moscas

			// AbstractDispatchAction.recargarThisForm() .parsearMensajes (request,
			// MENSAJES);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_permitir_anular(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_anular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_PERMITE_ANULARPROPUESTA(SSEGURO, NMOVIMI);
			// Faltar� cambiar por la nueva funci�n: PERMITE ANULAR PROPUESTA
			logger.debug(map);
			BigDecimal rechazar = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (rechazar.intValue() == 1) {
				// Si el mensaje de vuelta es 1: abrimos ventana modal
				request.setAttribute("PermisoAnulacion", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_anular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_inspeccionRiesgo(HttpServletRequest request, Axisctr018Action thisAction) {
		logger.debug("Axisctr018Service m_inspeccionRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			Map map = new PAC_IAX_INSPECCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INSPECCION__F_LANZA_SOLICITUD_INSP("POL", SSEGURO, NMOVIMI, null);
			logger.debug(map);
			BigDecimal insp = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			renovarLista(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_inspeccionRiesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_marcar_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("axisctr017_lista");

			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				HashMap OB_IAX_POLIZASRETEN = (HashMap) mm.get("OB_IAX_POLIZASRETEN");

				BigDecimal SSEGUROx = (BigDecimal) OB_IAX_POLIZASRETEN.get("SSEGURO");

				if (!isEmpty(SSEGURO) && SSEGURO.longValue() == SSEGUROx.intValue()) {
					logger.debug(MARCAR);
					OB_IAX_POLIZASRETEN.put("MARCAR", MARCAR);
				} else {
					if (isEmpty(SSEGURO)) {
						OB_IAX_POLIZASRETEN.put("MARCAR", MARCAR);
						logger.debug(MARCAR);
					}

				}

			}

			request.getSession().setAttribute("axisctr017_lista", tinfo);
			logger.debug(tinfo);
			Map m = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA_MARCAR(this.generarT_IAX_Info(request, usuario),
							null, SPROCES);
			logger.debug(m);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (RETURN.equals(new BigDecimal("0"))) {

				request.getSession().setAttribute("hayCambios", "true");
				miDataObject.put("hayCambios", "true");
				miDataObject.put("SPROCES", m.get("PSPROCES"));

			} else {
				miDataObject.put("hayCambios", "false");
				miDataObject.put("resultado", m);
				ajax.rellenarPlAContenedorAjax(m);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_emitir_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");

			Map m = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_EMISION_MASIVA(SPROCES);
			logger.debug(m);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (RETURN.equals(new BigDecimal("0"))) {
				request.getSession().setAttribute("hayCambios", "true");
				miDataObject.put("hayCambios", "true");
				miDataObject.put("emitir_reload", "true");
				miDataObject.put("resultado", m);
			} else {
				miDataObject.put("hayCambios", "false");
				miDataObject.put("resultado", m);
				ajax.rellenarPlAContenedorAjax(m);
				ArrayList tinfo = (ArrayList) request.getSession().getAttribute("axisctr017_lista");

				for (int i = 0; i < tinfo.size(); i++) {
					HashMap mm = (HashMap) tinfo.get(i);
					HashMap OB_IAX_POLIZASRETEN = (HashMap) mm.get("OB_IAX_POLIZASRETEN");
					OB_IAX_POLIZASRETEN.put("MARCAR", new BigDecimal(0));

				}

			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_compruebainspeccion_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mx = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_PERMITE_EMITIRINSPECCION(SSEGURO, "POL");
			logger.debug(mx);
			if (mx.equals(new BigDecimal("0"))) {

				request.getSession().setAttribute("hayCambios", "true");
				miDataObject.put("hayCambios", "true");

			} else {
				miDataObject.put("hayCambios", "false");
				miDataObject.put("resultado", mx);
				ajax.rellenarPlAContenedorAjax(mx);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList tinfo = (ArrayList) request.getSession().getAttribute("axisctr017_lista");

		int n = tinfo.size(); // numero de parametros

		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);
				BigDecimal SSEGURO = (BigDecimal) ((HashMap) ((HashMap) tinfo.get(i)).get("OB_IAX_POLIZASRETEN"))
						.get("SSEGURO");
				BigDecimal MARCADO = (BigDecimal) ((HashMap) ((HashMap) tinfo.get(i)).get("OB_IAX_POLIZASRETEN"))
						.get("MARCAR");
				paramObj = new ObIaxInfo("SSEGURO", String.valueOf(SSEGURO), "", MARCADO);
				paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
				paramsList[i] = paramObj;

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

	public void m_preguntaProgagaSupl_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			logger.debug("++++DENTRO PREGUNTA PROPAGA SUPLEMENTO");
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");

			BigDecimal SSEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));

			// nueva funcion que nos dir� que botones activar
			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO("POL", SSEGURO, NMOVIMI, null, null);
			logger.debug(m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	private Map buscaCobjase(HttpServletRequest request, BigDecimal sproduc) throws Exception {

		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(sproduc);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);

		return plCOBJASE;
	}

	public void m_validaDupSeguro_json(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			HashMap miDataObject = new HashMap();
			logger.debug("++++DENTRO VALIDA DUPLICAR SEGURO");
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");

			BigDecimal SSEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));

			Map m = new PAC_IAX_DUPLICAR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DUPLICAR__F_VALIDA_DUP_SEGURO(SSEGURO);
			logger.debug(m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_editarsupl(HttpServletRequest request, Axisctr018Action thisAction) throws Exception {

		logger.debug("Axisctr020Service m_volver");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			/* Recuperar la secci�n activa al volver de editar_suplementos */
			Map PILA = (HashMap) request.getSession().getAttribute("PASSTOPPILA");
			List SECACTIVA = ((isEmpty(PILA.get("SECACTIVA"))) ? null : (List) PILA.get("SECACTIVA"));
			if (!isEmpty(SECACTIVA) && SECACTIVA.size() > 0)
				request.setAttribute("SECACTIVA", SECACTIVA);

			// Desempilar formdata
			Map formdata_axisctr020 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr020");

			if (!isEmpty(formdata_axisctr020))
				formdata.putAll(formdata_axisctr020);

			// Comprobar suplementos pendientes de emitir
			Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_PENDIENTE_EMISION();
			logger.debug(map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			if (new BigDecimal(1).equals(RETURN)) {
				request.getSession().setAttribute("axisctr020_suplementosPendientes", Boolean.valueOf(true));
			} else
				request.getSession().removeAttribute("axisctr020_suplementosPendientes");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}

	}

	public void m_psucontrolseg_ajax(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			HashMap miDataObject = new HashMap();

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");

			List b = null;
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			leeHistPsu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO, pP_NVERSION, NRIESGO, NMOVIMI,
					null);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsu)).intValue() == 0) {

				b = (List) leeHistPsu.get("P_THIS_PSUCONTROLSEG");
			}

			List RESULTADO = new ArrayList();
			RESULTADO.add(b);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr018Service - m�todo m_ajax_cargar_motivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_haycontrolesmanuales(HttpServletRequest request) {
		logger.debug("Axisctr018Service m_ajax_haycontrolesmanuales");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/* Recuperar el SSEGURO */
			BigDecimal SSEGURO = this.getHiddenCampoNumerico(request, "SSEGURO");
			if (isEmpty(SSEGURO) && !isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO")))
				SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxPsu.ejecutaPAC_IAX_PSU__F_HAY_CONTROLES_MANUALES(SSEGURO, "POL");
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_ajax_haycontrolesmanuales", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

}
