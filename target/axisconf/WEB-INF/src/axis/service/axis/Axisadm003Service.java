//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

// INI -IAXIS-4515 - JLTS - 02/07/2019 - Se adiciona import
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_CODA;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_CORRETAJE;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LIQUIDACOR;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_UTILES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm003Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axispro018Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	private

			String getInfoString(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!isEmpty(fieldValue) && !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// 18176
			logger.debug("CMODO ENTRO -----------> " + AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug("CMODO_REC ENTRO -----------> " + AbstractDispatchAction.topPila(request, "CMODO_REC"));

			if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO_REC"))) {
				if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO")))
					AbstractDispatchAction.topPila(request, "CMODO_REC", "NO");
				else
					AbstractDispatchAction.topPila(request, "CMODO_REC",
							AbstractDispatchAction.topPila(request, "CMODO"));
			}

			if (AbstractDispatchAction.topPila(request, "CMODO_REC").equals("NO"))
				AbstractDispatchAction.topPila(request, "CMODO", null);
			else
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_REC"));

			logger.debug("CMODO DESP -----------> " + AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug("CMODO REC DESP -----------> " + AbstractDispatchAction.topPila(request, "CMODO_REC"));
			// INI IAXIS-3590 - JLTS - 01/02/2019 Se adiciona NRECIBO
			AbstractDispatchAction.topPila(request, "NRECIBO", AbstractDispatchAction.topPila(request, "NRECIBO"));
			// FIN IAXIS-3590 - JLTS - 01/02/2019 Se adiciona NRECIBO
			// 18176

			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			if (isEmpty(NRECIBO) && !isEmpty(request.getAttribute("NRECIBO")))
				NRECIBO = new BigDecimal(String.valueOf(request.getAttribute("NRECIBO")));

			if (isEmpty(NRECIBO) && !isEmpty(request.getParameter("NRECIBO")))
				NRECIBO = new BigDecimal(String.valueOf(request.getParameter("NRECIBO")));

			String miOffsetRecibos = request.getParameter("miOffsetRecibos");

			if (!isEmpty(miOffsetRecibos)) {
				request.setAttribute("REC_miOffsetRecibos", miOffsetRecibos); // LCF sesi�n
			}

			if (!isEmpty(NRECIBO)) {
				formdata.put("NRECIBO", NRECIBO);
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				// Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO);
				Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO_MV(NRECIBO, new BigDecimal(0));
				logger.debug(map);

				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map);
				// INI IAXIS-3590 - JLTS - 01/02/2019 Se adiciona CAGENTE
				BigDecimal CAGENTE = (BigDecimal) OB_IAX_RECIBOS.get("CAGENTE");
				formdata.put("CAGENTE", CAGENTE);
				// FIN IAXIS-3590 - JLTS - 01/02/2019 Se adiciona CAGENTE
				// INI -IAXIS-10627 -JLTS -20/01/2020 Se adiciona NMOVIMI
				BigDecimal NMOVIMI = (BigDecimal) OB_IAX_RECIBOS.get("NMOVIMI");
				logger.debug("NMOVIOMI=" + NMOVIMI);
				// FIN -IAXIS-10627 -JLTS -20/01/2020

				if (!isEmpty(OB_IAX_RECIBOS)) {

					// Formateo CBANCAR
					BigDecimal CTIPBAN = (BigDecimal) OB_IAX_RECIBOS.get("CTIPBAN");
					String CBANCAR = (String) OB_IAX_RECIBOS.get("CBANCAR");

					// INI - IAXIS-3590 - HB - 24/04/2019
					////////////////// DATOS POLIZA ////////////////////////////////////
					PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					BigDecimal SSEGURO = (BigDecimal) OB_IAX_RECIBOS.get("SSEGURO");
					logger.debug("SSEGURO:" + SSEGURO);

					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map, false);

					HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
					logger.debug(datPoliza);
					tratarRETURNyMENSAJES(request, datPoliza);

					Map datos_poliza = (Map) datPoliza.get("RETURN");
					logger.debug(datos_poliza);
					request.setAttribute("datos_poliza", datos_poliza);
					PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					if (!isEmpty(datos_poliza)) {
						//////////// Coaseguro ////////////
						map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO();
						Map coa = (HashMap) map.get("RETURN");
						logger.debug("----> datos coaseguro:" + coa);
						request.setAttribute("DATCOASEGURO", coa);

						// Inicio IAXIS-3591 17/07/2019

						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_INFO_COA(NRECIBO);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map, false);
						ArrayList listaCompanias = (ArrayList) map.get("RETURN");
						request.setAttribute("detalleCompaniasCoa", listaCompanias);
						// Fin IAXIS-3591 17/07/2019

						// Ini IAXIS-14222 JRVG 25/08/2020 -- Porc. partic. Local Coaseguro Cedido
						BigDecimal PCESCOA = BigDecimal.ZERO;
						for (int i = 0; i < listaCompanias.size(); i++) {
							BigDecimal PORC = ((BigDecimal) ((Map) listaCompanias.get(i)).get("PCESCOA"));
							PCESCOA = PCESCOA.add(PORC);
						}
						formdata.put("PCESCOA", PCESCOA);
						formdata.put("PARTICIPACION", new BigDecimal(100));
						// Fin IAXIS-14222 JRVG 25/08/2020

						//////////// Corretaje ////////////
						// INI -IAXIS-10627 -21/01/2020. Se adiciona el paar�metro pPNOMIVI
						map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECORRETAJE(NMOVIMI);
						// FIN -IAXIS-10627 -21/01/2020.
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map, false);
						ArrayList lista_corretaje = (ArrayList) map.get("RETURN");

						// INI IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision
						// Inicio IAXIS-3591 17/07/2019
						PAC_IAX_CORRETAJE pacIaxCorretaje = new PAC_IAX_CORRETAJE(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map mapa = pacIaxCorretaje.ejecutaPAC_IAX_CORRETAJE__F_LEECORRETAJE(SSEGURO, NRECIBO);
						logger.debug(mapa);
						tratarRETURNyMENSAJES(request, mapa, false);
						ArrayList listaValoresCorretaje = (ArrayList) mapa.get("RETURN");

						request.setAttribute("listaValoresCorretaje", listaValoresCorretaje);

						// INI IAXIS-3590 - JLTS - 01/02/2019 Se verifica CORRETAJE
						if (listaValoresCorretaje.size() > 1) {
							formdata.put("HAYCORRETAJE", new BigDecimal(1));
						} else {
							formdata.put("HAYCORRETAJE", BigDecimal.ZERO);
						}
						// FIN IAXIS-3590 - JLTS - 01/02/2019 Se verifica CORRETAJE
						request.setAttribute("lista_corretaje", lista_corretaje);
						// Fin IAXIS-3591 17/07/2019
						// FIN IAXIS-3590 - JLTS - 01/02/2019 Se verifica CORRETAJE

						Map list = pacIaxCorretaje.ejecutaPAC_IAX_CORRETAJE__F_CORRETAJE(NRECIBO);
						logger.debug(list);
						tratarRETURNyMENSAJES(request, list, false);
						ArrayList listaCorretaje = (ArrayList) list.get("RETURN");
						request.setAttribute("listaCorretaje", listaCorretaje);
						// FIN IAXIS-12960 - JRVG - 05/03/2020 bug en comisiones por cambios de emision

						//////////// Moneda ////////////

						map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(SSEGURO);
						logger.debug("moneda:" + map);
						logger.debug(map);
						request.getSession().setAttribute("CMONEDAPROD", map.get("RETURN"));

					}

					map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
					logger.debug("moneda SEGURO:" + map);
					String vtrm = map.get("RETURN").toString();
					// request.getSession().setAttribute("TRM", vtrm);
					logger.debug("trm:" + vtrm);
					// FIN - IAXIS-3590 - HB - 24/04/2019

					/*
					 * { PAC_ECO_TIPOCAMBIO pac_eco_tipocambio=new
					 * PAC_ECO_TIPOCAMBIO((java.sql.Connection)request.getAttribute(Constantes.
					 * DB01CONN)); .OB_IAX_RECIBOS.TESTREC map1=
					 * pac_eco_tipocambio.ejecutaPAC_ECO_TIPOCAMBIO__F_IMPORTE_CAMBIO(
					 * map.get("RETURN"),"COP",);; }
					 */
					/*
					 * else {
					 * 
					 * }
					 */
					// INI - IAXIS-3590 - HB - 24/04/2019
					if ("COP".equals(vtrm)) {
						request.getSession().setAttribute("TRM", OB_IAX_RECIBOS.get("IMPORTE"));
					} else {
						// request.getSession().setAttribute("TRM", OB_IAX_RECIBOS.get("IMPORTE"));
						// request.getSession().setAttribute("TRM", OB_IAX_RECIBOS.get("TESTREC"));
						// request.getSession().setAttribute("TRM", "Harshitaaa");
						PAC_IAX_UTILES pac_eco_tipocambio = new PAC_IAX_UTILES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						// Date temp=Date.valueOf(OB_IAX_RECIBOS.get("FEMISIO").toString());
						SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date FEMISIO = null;
						if (OB_IAX_RECIBOS.get("FEMISIO") != null) {
							FEMISIO = Date.valueOf(OB_IAX_RECIBOS.get("FEMISIO").toString().split(" ")[0]);
						}

						// Date FEMISIO = OB_IAX_RECIBOS.get("FEMISIO").toString();
						int var = 1;
						HashMap map1 = (HashMap) pac_eco_tipocambio.ejecutaPAC_IAX_UTILES__F_IMPORTE_CAMBIO(vtrm, "COP",
								FEMISIO, new BigDecimal(OB_IAX_RECIBOS.get("IMPORTE").toString()));
						logger.debug("Value after:" + map1);
						BigDecimal TASACAMB;
						TASACAMB = (BigDecimal) map1.get("P_CAMBIO");
						request.getSession().setAttribute("TASACAMB", TASACAMB);
					}
					// FIN - IAXIS-3590 - HB - 24/04/2019

					if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN)) {
						map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
						logger.debug(map);
						if (!"".equals(tratarRETURNyMENSAJES(request, map)))
							OB_IAX_RECIBOS.put("CBANCAR", map.get("RETURN"));
					}

					/* Import pendent del rebut, XPL */
					map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NRECIBO, null);
					logger.debug(map);
					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
						BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
						OB_IAX_RECIBOS.put("IMPPENDIENTE", IMPPEN);
					}
					ArrayList<Map> movrecibos = (ArrayList<Map>) OB_IAX_RECIBOS.get("MOVRECIBO");

					// INI IAXIS3589 SGM 22/04/2019 SE AGREGAN ABONOS Y SALDO TOTAL DEL RECIBO
					BigDecimal VIMPORTE; // IAXIS-14223 JRVG 19/08/2020
					BigDecimal VIIMPORTE;
					BigDecimal VTOTALPRIMA = BigDecimal.ZERO;
					BigDecimal TOTALIIMPORTE = BigDecimal.ZERO;

					Boolean pagado = false;
					// INI IAXIS-13877 JRVG 14/07/2020
					// INI IAXIS-14223 JRVG 19/08/2020
					BigDecimal TOTALIIMPORTE2 = BigDecimal.ZERO;
					BigDecimal TOTALIIMPORTE_MONPOL2 = BigDecimal.ZERO;
					BigDecimal TOTALIIMPORTE_MONPOL = BigDecimal.ZERO;
					// INI IAXIS-14408 JRVG 05/10/2020
					BigDecimal TOTAL_ABONO2 = BigDecimal.ZERO;
					BigDecimal TOTAL_ABONO = BigDecimal.ZERO;
					BigDecimal TOTAL_ABONO_MONPOL2 = BigDecimal.ZERO;
					BigDecimal TOTAL_ABONO_MONPOL = BigDecimal.ZERO;
					// INI IAXIS-15552 JRVG 28/05/2021
					BigDecimal VCCONCEP;
					BigDecimal VIMPORTE_PRIMA = BigDecimal.ZERO;
					BigDecimal VIMPORTE_IVA = BigDecimal.ZERO;
					BigDecimal VIMPORTE_GASTO = BigDecimal.ZERO;
					// FIN IAXIS-15552 JRVG 28/05/2021
					// FIN IAXIS-14408 JRVG 05/10/2020
					// FIN IAXIS-14408 JRVG 05/10/2020
					// FIN IAXIS-14223 JRVG 19/08/2020
					int acumulador = 0;
					Boolean devuelto = false;
					// FIN IAXIS-13877 JRVG 14/07/2020
					// FIN IAXIS3589 SGM 22/04/2019 SE AGREGAN ABONOS Y SALDO TOTAL DEL RECIBO
					for (Map m : movrecibos) {
						HashMap oim = (HashMap) m.get("OB_IAX_MOVRECIBO");
						logger.debug("oim : " + oim);
						logger.debug("oim.get(\"SMOVREC\")-->" + oim.get("SMOVREC"));
						logger.debug("oim.get(\"CESTREC\")-->" + oim.get("CESTREC"));
						BigDecimal VESTADORECIBO = (BigDecimal) oim.get("CESTREC");
						// INI IAXIS-13877 JRVG 14/07/2020
						BigDecimal VCESTANT = (BigDecimal) oim.get("CESTANT");
						// FIN IAXIS-13877 JRVG 14/07/2020

						if (VESTADORECIBO.intValue() == 1) {
							pagado = true;
						}
						/* Import pendent de cada moviment del rebut, XPL */

						Map map2 = new HashMap();

						map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NRECIBO,
										new BigDecimal(String.valueOf(oim.get("SMOVREC"))));
						logger.debug(map);
						if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
							BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
							oim.put("IMPPENDIENTE", IMPPEN);
							VTOTALPRIMA = IMPPEN;

							/* Detall de tots els moviments rebut, XPL */
							map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_CODA__F_GET_DETMOVRECIBOS(NRECIBO,
											new BigDecimal(String.valueOf(oim.get("SMOVREC"))));

							map2 = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_CODA__F_GET_DETMOVRECIBOSC(NRECIBO,
											new BigDecimal(String.valueOf(oim.get("SMOVREC"))));
							// INI IAXIS-13877 JRVG 14/07/2020
							if (VCESTANT.intValue() == 1) {
								devuelto = true;
								acumulador += acumulador + 1;
							} else {
								devuelto = false;
							}
							// INI IAXIS-14408 JRVG 05/10/2020 SE SUMA EL IMPORTE CORRESPONDIENTE A LA
							// CANCELACI�N
							if (VESTADORECIBO.intValue() == 3) {
								if (!isEmpty(map2.get("PCURDETMOVRECIBO"))) {
									ArrayList<Map> movrec = ((ArrayList<Map>) (map2.get("PCURDETMOVRECIBO")));
									logger.debug(movrec);
									for (int i = 0; i < movrec.size(); i++) {
										VIMPORTE = (BigDecimal) ((Map) (((List) (map2.get("PCURDETMOVRECIBO"))).get(i)))
												.get("IIMPORTE");
										TOTALIIMPORTE_MONPOL = TOTALIIMPORTE_MONPOL.add(VIMPORTE);
										VIIMPORTE = (BigDecimal) ((Map) (((List) (map2.get("PCURDETMOVRECIBO")))
												.get(i))).get("IIMPORTE2");
										TOTALIIMPORTE = TOTALIIMPORTE.add(VIIMPORTE);
									}
								}
							}
							// FIN IAXIS-14408 JRVG 05/10/2020
							// INI IAXIS3589 SGM 22/04/2019 SE AGREGAN ABONOS Y SALDO TOTAL DEL RECIBO
							// INI IAXIS-14223 JRVG 19/08/2020
							if (devuelto == true && acumulador == 1) {
								if (!isEmpty(map.get("PCURDETMOVRECIBO"))) {
									ArrayList<Map> movimirec = ((ArrayList<Map>) (map.get("PCURDETMOVRECIBO")));
									logger.debug(movimirec);
									for (int i = 0; i < movimirec.size(); i++) {
										VIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO"))).get(i)))
												.get("IIMPORTE");
										TOTALIIMPORTE_MONPOL2 = TOTALIIMPORTE_MONPOL2.add(VIMPORTE);
										TOTAL_ABONO_MONPOL2 = TOTAL_ABONO_MONPOL2.add(VIMPORTE); // IAXIS-14408 JRVG
																									// 05/10/2020
										VIIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO"))).get(i)))
												.get("IIMPORTE2");
										TOTALIIMPORTE2 = TOTALIIMPORTE2.add(VIIMPORTE);
										TOTAL_ABONO2 = TOTAL_ABONO2.add(VIIMPORTE); // IAXIS-14408 JRVG 05/10/2020
									}
								}
							} else {
								if (!isEmpty(map.get("PCURDETMOVRECIBO"))) {
									ArrayList<Map> movimirec = ((ArrayList<Map>) (map.get("PCURDETMOVRECIBO")));
									logger.debug(movimirec);
									for (int i = 0; i < movimirec.size(); i++) {
										VIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO"))).get(i)))
												.get("IIMPORTE");
										TOTALIIMPORTE_MONPOL = TOTALIIMPORTE_MONPOL.add(VIMPORTE);
										TOTAL_ABONO_MONPOL = TOTAL_ABONO_MONPOL.add(VIMPORTE); // IAXIS-14408 JRVG
																								// 05/10/2020
										VIIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO"))).get(i)))
												.get("IIMPORTE2");
										TOTALIIMPORTE = TOTALIIMPORTE.add(VIIMPORTE);
										TOTAL_ABONO = TOTAL_ABONO.add(VIIMPORTE); // IAXIS-14408 JRVG 05/10/2020

										// INI IAXIS-15552 JRVG 28/05/2021
										VCCONCEP = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO"))).get(i)))
												.get("CCONCEP");
										if (VCCONCEP.intValue() == 0 || VCCONCEP.intValue() == 50) { // PRIMA
											VIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO")))
													.get(i))).get("IIMPORTE");
											VIMPORTE_PRIMA = VIMPORTE_PRIMA.add(VIMPORTE);
										} else if (VCCONCEP.intValue() == 4 || VCCONCEP.intValue() == 86) { // IVA
											VIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO")))
													.get(i))).get("IIMPORTE");
											VIMPORTE_IVA = VIMPORTE_IVA.add(VIMPORTE);
										} else if (VCCONCEP.intValue() == 14) { // GASTO
											VIMPORTE = (BigDecimal) ((Map) (((List) (map.get("PCURDETMOVRECIBO")))
													.get(i))).get("IIMPORTE");
											VIMPORTE_GASTO = VIMPORTE_GASTO.add(VIMPORTE);
										}
										// FIN IAXIS-15552 JRVG 28/05/2021
									}
								}
							}
							// FIN IAXIS-14223 JRVG 19/08/2020
							// FIN IAXIS3589 SGM 22/04/2019 SE AGREGAN ABONOS Y SALDO TOTAL DEL RECIBO
							// FIN IAXIS-13877 JRVG 14/07/2020
							if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
								oim.put("DETMOVRECIBO", map.get("PCURDETMOVRECIBO"));
							}

							if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map2))) {
								oim.put("DETMOVRECIBO2", map2.get("PCURDETMOVRECIBO"));
							}
						}
					}
					// INI -IAXIS-4995 - JLTS - 08/08/2019. Se cambia el VTOTALPRIMA por
					// TOTALIIMPORTE
					// INI IAXIS-13877 JRVG 14/07/2020 SE AGREGA TOTALIIMPORTE2 PAR REVERSIONES DE
					// RECIBOS CON ABONO
					// INI IAXIS-14223 JRVG 19/08/2020
					if (acumulador == 1) {
						formdata.put("TOTALIIMPORTE", TOTALIIMPORTE2);
						formdata.put("TOTAL_ABONO", TOTAL_ABONO2); // IAXIS-14408 JRVG 05/10/2020
						formdata.put("TOTALIIMPORTE_MONPOL", TOTALIIMPORTE_MONPOL2);
						formdata.put("TOTAL_ABONO_MONPOL", TOTAL_ABONO_MONPOL2); // IAXIS-14408 JRVG 05/10/2020
						// INI IAXIS-15552 JRVG 28/05/2021
						formdata.put("VIMPORTE_PRIMA", VIMPORTE_PRIMA);
						formdata.put("VIMPORTE_IVA", VIMPORTE_IVA);
						formdata.put("VIMPORTE_GASTO", VIMPORTE_GASTO);
						// FIN IAXIS-15552 JRVG 28/05/2021

					} else {
						formdata.put("TOTALIIMPORTE", TOTALIIMPORTE);
						formdata.put("TOTAL_ABONO", TOTAL_ABONO); // IAXIS-14408 JRVG 05/10/2020
						formdata.put("TOTALIIMPORTE_MONPOL", TOTALIIMPORTE_MONPOL);
						formdata.put("TOTAL_ABONO_MONPOL", TOTAL_ABONO_MONPOL); // IAXIS-14408 JRVG 05/10/2020
						// INI IAXIS-15552 JRVG 28/05/2021
						formdata.put("VIMPORTE_PRIMA", VIMPORTE_PRIMA);
						formdata.put("VIMPORTE_IVA", VIMPORTE_IVA);
						formdata.put("VIMPORTE_GASTO", VIMPORTE_GASTO);
						// FIN IAXIS-15552 JRVG 28/05/2021
					}
					// FIN IAXIS-14223 JRVG 19/08/2020
					// IAXIS-13877 JRVG 14/07/2020
					// FIN -IAXIS-4995 - JLTS - 08/08/2019. Se cambia el VTOTALPRIMA por
					// TOTALIIMPORTE
					logger.debug(formdata);
					formdata.put("OB_IAX_RECIBOS", OB_IAX_RECIBOS);
					logger.debug(ConversionUtil.printAsXML(OB_IAX_RECIBOS, "OB_IAX_RECIBOS"));

					map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_RECDOCS(NRECIBO);
					logger.debug(map);
					ArrayList<Map> OB_IAX_DOCSRECIBO = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map);
					formdata.put("OB_IAX_DOCSRECIBO", OB_IAX_DOCSRECIBO);

					if (VisibleTag.esComponenteVisible(request, "axisadm003", "DSP_DETALLE")) {
						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO_DET(usuario.getCempres(), NRECIBO,
								usuario.getCidioma());
						logger.debug(map);
						ArrayList<Map> OB_IAX_RECIBODET = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_RECIBODET", (Map) OB_IAX_RECIBODET.get(0));
					}

					if (VisibleTag.esComponenteVisible(request, "axisadm003", "DSP_RECIBOS_COMP")) {
						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_RECIBOS_COMP(NRECIBO, usuario.getCidioma());
						logger.debug(map);
						ArrayList<Map> OB_IAX_RECIBOCOMP = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_RECIBOCOMP", OB_IAX_RECIBOCOMP);

					}

					if (VisibleTag.esComponenteVisible(request, "axisadm003", "DSP_ADM_RECUNIF")) {
						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DETRECIBO_GTIAS(NRECIBO, usuario.getCidioma(), null,
								null);
						logger.debug(map);
						ArrayList<Map> OB_IAX_RECIBOGTIAS = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_RECIBOGTIAS", OB_IAX_RECIBOGTIAS);
						// INI IAXIS-3590 - JLTS - 01/02/2019 Se adiciona PORC_COMIS
						// INI Bug IAXIS- 11902 - JRVG - 24/02/2020
						BigDecimal PORC_COMIS = ((BigDecimal) ((Map) OB_IAX_RECIBOGTIAS.get(0)).get("PORC_COMIS"));
						// BigDecimal PORC_COMIS =
						// ((BigDecimal)((Map)OB_IAX_RECIBOGTIAS.get(0)).get("PORC_COMIS")).setScale(2,BigDecimal.ROUND_HALF_UP);
						// FIN Bug IAXIS- 11902 - JRVG - 24/02/2020
						formdata.put("PORC_COMIS", PORC_COMIS);
						// FIN IAXIS-3590 - JLTS - 01/02/2019 Se adiciona PORC_COMIS

						// INI IAXIS-3264 - JLTS - 19/01/2020 Se adiciona CMOTMOV_BAJA
						BigDecimal CMOTMOV_BAJA = ((BigDecimal) ((Map) OB_IAX_RECIBOGTIAS.get(0)).get("CMOTMOV_BAJA"));
						formdata.put("CMOTMOV_BAJA", CMOTMOV_BAJA);
						// INI IAXIS-3264 - JLTS - 19/01/2020 Se adiciona CMOTMOV_BAJA
					}

					if (VisibleTag.esComponenteVisible(request, "axisadm003", "DSP_IMP_DETALLE")) {
						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_ADM_RECUNIF(NRECIBO, usuario.getCidioma());
						logger.debug(map);
						ArrayList<Map> OB_IAX_RECUNIF = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_RECUNIF", OB_IAX_RECUNIF);
					}

					if (!isEmpty(OB_IAX_RECIBOS.get("SSEGURO"))) {
						PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						map = pac_iax_produccion
								.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA((BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"));
						logger.debug(map);
						Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_GENPOLIZA", OB_IAX_GENPOLIZA);
						// logger.debug(ConversionUtil.printAsXML(OB_IAX_GENPOLIZA,
						// "OB_IAX_GENPOLIZA"));

						// INI BUG 3324 - SGM Interacci�n del Rango DIAN con la p�liza (No. Certificado)
						if (VisibleTag.esComponenteVisible(request, "axisadm003", "NCERTDIAN")) {
							map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CERTDIAN(
									(BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"), NRECIBO);
							logger.debug(map);
							String NCERTDIAN = (String) map.get("RETURN");
							formdata.put("NCERTDIAN", NCERTDIAN);
							logger.debug(map.get("RETURN"));
						}
						// FIN BUG 3324 - SGM Interacci�n del Rango DIAN con la p�liza (No. Certificado)

						// INI IAXIS-3590 - JRVG Cargar tomadores
						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_INFO_TOM(NRECIBO);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map, false);
						ArrayList tomador = (ArrayList) map.get("RETURN");
						request.setAttribute("detalleTomador", tomador);
						BigDecimal SPERSON = (BigDecimal) ((Map) tomador.get(0)).get("SPERSON");
						String TD_NOMBRE = (String) ((Map) tomador.get(0)).get("TD_NOMBRE");
						BigDecimal CAGRUPA = (BigDecimal) ((Map) tomador.get(0)).get("CAGRUPA");
						formdata.put("SPERSON", SPERSON);
						formdata.put("TD_NOMBRE", TD_NOMBRE);
						formdata.put("CAGRUPA", CAGRUPA);
						// FIN IAXIS-3590 - JRVG Cargar tomadores

						map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS(
								(BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"), NRECIBO, null);
						ArrayList OB_IAX_IMPAGOS = (ArrayList) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_IMPAGOS", OB_IAX_IMPAGOS);

						// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
						// INI - IAXIS-3590 - HB - 24/04/2019
						// PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas=new
						// PAC_IAX_ECO_MONEDAS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
						map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(
								(BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"));
						logger.debug(map);
						request.getSession().setAttribute("CMONEDAPROD", map.get("RETURN"));

						BigDecimal MONEDAORIGEN = getCampoNumerico(request, "IMPORTE_MON");
						// FIN - IAXIS-3590 - HB - 24/04/2019

					}
				}

				// Miramos las acciones del recibo
				PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_ACCIONES(NRECIBO, new BigDecimal(0));
				logger.debug("ACCIONES RECIBO -----------> " + map);
				List T_IAX_ACCIONES = (List) tratarRETURNyMENSAJES(request, map, false);
				BigDecimal PSALTAR = (BigDecimal) map.get("PSALTAR");

				if (!BigDecimal.ZERO.equals(PSALTAR)) {
					// Si PSALTAR no es 0, miramos la longitud de la lista devuelta
					// para saber si mostrar o no el icono de "Gesti�n Recibos"
					// Si la lista viene vac�a, TAMPOCO tenemos que saltar.
					if (isEmpty(T_IAX_ACCIONES))
						PSALTAR = BigDecimal.ZERO;
				}
				formdata.put("PSALTAR", PSALTAR);

				PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				String pParam = this.getInfoString(request);
				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(new BigDecimal(2), null, pParam);
				logger.debug(m);
				BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, m))) ? new BigDecimal(0)
						: (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				if (ok.intValue() == 0) {
					formdata.put("PLSTAGENDA", m.get("PLSTAGDOBS"));
				}

				// Bug 17155 : A�adir datos carga fichero a SINIESTROS
				PAC_IAX_GESTION_PROCESOS pac_gestion_procesos = new PAC_IAX_GESTION_PROCESOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map carga_fichero = pac_gestion_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(
						new BigDecimal("2"), null, null, null, NRECIBO); // 2: RECIBO
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, carga_fichero, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_fichero = (ArrayList) carga_fichero.get("PCURCARGA");
					request.setAttribute("carga_fichero_datos", lista_fichero);
				}

				// CARGAMOS LA AGENDA TAREAS DE USUARIOS
				/* Bug 18176 - ICV - 05/04/2011 */
				PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("2"),
						NRECIBO.toString(), null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
					request.setAttribute("lstagdagenda", lista_agenda);
				}

				PAC_IAX_LIQUIDACOR pacIaxliquida = new PAC_IAX_LIQUIDACOR(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				m = pacIaxliquida.ejecutaPAC_IAX_LIQUIDACOR__F_GET_LSTLIQUIDA_REC(NRECIBO);

				ok = (isEmpty(this.tratarRETURNyMENSAJES(request, m))) ? new BigDecimal(0)
						: (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				if (ok.intValue() == 0) {
					formdata.put("LSTLIQREC", m.get("P_LIQUIDAREC"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_unificar_recibos(HttpServletRequest request) {
		logger.debug("Axisadm003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String LISTA_REC = "";
			for (int i = 0; i < CUENTA.intValue(); i++) {

				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);
				if (!isEmpty(SELEC)) {
					if (SELEC.intValue() != 0) { // La casilla est� seleccionada

						BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
						LISTA_REC = LISTA_REC + NRECIBO + ";";
					}
				}
			}

			Map mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_AGRUPARECIBO(LISTA_REC);
			logger.debug(mapa);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {
				BigDecimal NRECIBO_UNIFICADO = (BigDecimal) mapa.get("P_NRECUNIF");
				// formdata.put("NRECIBO", new BigDecimal("2002036")); //TODO:UNIFICADO
				request.setAttribute("NRECIBO", NRECIBO_UNIFICADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que realiza los pasos necesarios para acceder a cualquier pantalla de
	 * gesti�n de cobros. Importante: Se a�aden 2 par�metros: acceso_externo y
	 * pantalla_origen para que cualquiera de las pantallas de cobro puedan saber si
	 * se ejecuta su pantalla accediendo desde men� o desde cualquier otra.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_gestion_cobros(HttpServletRequest request, Axisadm003Action thisAction) {
		logger.debug("Axisadm003Service m_gestion_cobros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String CFORM = getCampoTextual(request, "CFORM");

			logger.debug("ENTRO GESTION DE COBROS CFORM ----------> " + CFORM);

			if (!isEmpty(CFORM)) {
				request.setAttribute("subpantalla_mdl", "DSP_RECIBOS");
				thisAction.topPila(request, "formdata_axisadm003", formdata);

				// Para modificar recibos mediante flujo externo, necesitamos obligatoriamente
				// estas dos l�neas para
				// que la pantallas de gesti�n de cobros las puedan procesar
				thisAction.topPila(request, "acceso_externo", true);
				thisAction.topPila(request, "pantalla_origen", "axisadm003");
				request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

				thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
						new ActionForward("/axis_" + CFORM.trim().toLowerCase() + ".do?operation=init"));
				thisAction.topPila(request, Constantes.SALTARORIGENACTION,
						new ActionForward("/axis_axisadm003.do?operation=volverGestionCobros"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_gestion_cobros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que controla la vuelta una vez se ha ejecutado una de las pantallas de
	 * cobro. Libera todo lo que hayamos a�adido en el m�todo m_gestion_cobros para
	 * gestionar esas pantallas, como los par�metros acceso_externo y
	 * pantalla_origen.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_volverGestionCobros(HttpServletRequest request, Axisadm003Action thisAction) {
		logger.debug("Axisadm003Service m_volverGestionCobros");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axisadm003 = (Map) thisAction.removeTopPila(request, "formdata_axisadm003");

			// Borramos los par�metros que inicialmente se enviaron a las pantallas de
			// gesti�n de cobro
			thisAction.removeTopPila(request, "acceso_externo");
			thisAction.removeTopPila(request, "pantalla_origen");

			request.setAttribute("subpantalla", "DSP_RECIBOS");

			if (!AxisBaseService.isEmpty(formdata_axisadm003))
				formdata.putAll(formdata_axisadm003);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_volverGestionCobros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			// this.configSuplementos(request);
		}
	}

	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axisadm003Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			BigDecimal NRIESGO = getHiddenCampoNumerico(request, "NRIESGO");
			BigDecimal IT1DTO = getCampoNumerico(request, "IT1DTO");
			BigDecimal IT1REC = getCampoNumerico(request, "IT1REC");
			BigDecimal IPRINET = getCampoNumerico(request, "IPRINET");
			BigDecimal IT1CON = getCampoNumerico(request, "IT1CON");
			BigDecimal IIPS = getCampoNumerico(request, "IIPS");
			BigDecimal IDGS = getCampoNumerico(request, "IDGS");
			BigDecimal IARBITR = getCampoNumerico(request, "IARBITR");
			BigDecimal ICOMBRU = getCampoNumerico(request, "ICOMBRU");
			BigDecimal IFNG = getCampoNumerico(request, "IFNG");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			Date FVENCIM = stringToSqlDate(getCampoTextual(request, "FVENCIM"));
			String CRECCIA = getCampoTextual(request, "CRECCIA");
			BigDecimal CVALIDADO = getCampoNumerico(request, "CVALIDADO");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_SET_IMPRECIBO(NRECIBO, NRIESGO, IT1DTO, IPRINET, IT1REC,
					IT1CON, IIPS, IDGS, IARBITR, IFNG, FEFECTO, FVENCIM, CRECCIA, ICOMBRU, CVALIDADO);
			logger.debug(mapa);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {
				request.setAttribute("OK", "OK");
			} else {
				request.setAttribute("OK", "KO");
			}

			formdata.put("BUSCA", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// etm ini

	public void m_sincronizar(HttpServletRequest request) {
		logger.debug("Axisadm003Service m_sincronizar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRECIBO = getHiddenCampoNumerico(request, "NRECIBO");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_SINCRONIZA_SAP(NRECIBO);
			logger.debug(mapa);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {
				request.setAttribute("OK", "OK");
			} else {
				request.setAttribute("OK", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_sincronizar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// etm fin

	public void m_borrar_agenda(HttpServletRequest request, Axisadm003Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal IDOBS = getCampoNumerico(request, "IDOBS");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_AGENDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(IDOBS);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm003Action m_borrar_agenda", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_act_imp(HttpServletRequest request, Axisadm003Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal PNRECIBO = getCampoNumerico(request, "PNRECIBO");
			BigDecimal PNDOCUME = getCampoNumerico(request, "PNDOCUME");

			Map map = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ADM__F_SET_DOCIMP(PNRECIBO, PNDOCUME);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm003Action m_act_imp", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	// Ini IAXIS-3590 - JLTS - 26/04/2019
	public void m_consultarPer(HttpServletRequest request, Axisadm003Action thisAction) {
		logger.debug("Axisadm003Service m_consultarPer");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Push de los datos necesarios a la pila
			// BigDecimal SSEGURO = getCampoNumerico (request, "SSEGURO");
			BigDecimal SPERSON_AUX = new BigDecimal(String.valueOf(request.getParameter("SPERSON_AUX"))); // A consultar
			BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON"))); // Actual
			logger.debug("m_consultar ---------------------> " + SPERSON_AUX);
			// formdata.put("SPERSON",SPERSON_AUX);

			thisAction.topPila(request, "formdata_axisadm003", formdata);
			thisAction.topPila(request, "SPERSON_AUX", SPERSON);
			thisAction.topPila(request, "SPERSON", SPERSON_AUX);

			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA_RECIB_PER");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

			// String CMODO=(String) AbstractDispatchAction.topPila(request, "CMODO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - mtodo m_consultarPer", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volverPer(HttpServletRequest request, Axisadm003Action thisAction) {
		logger.debug("Axisadm003Service m_volverPer");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisper009 = (Map) thisAction.removeTopPila(request, "formdata_axisper009");
			if (!isEmpty(formdata_axisper009)) {
				formdata.putAll(formdata_axisper009);
			}
			// formdata.put("SPERSON", bigDecimalToString ((BigDecimal)
			// thisAction.removeTopPila(request, "SPERSON_AUX"))); //El anterior

			// formdata.put("NRECIBO", bigDecimalToString ((BigDecimal)
			// thisAction.removeTopPila(request, "NRECIBO")));
			thisAction.topPila(request, "SPERSON", (BigDecimal) AbstractDispatchAction.topPila(request, "SPERSON"));
			thisAction.topPila(request, "NRECIBO", (BigDecimal) AbstractDispatchAction.topPila(request, "NRECIBO"));
			thisAction.topPila(request, "CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO_AUX"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - metodo m_volverPer", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// Fin IAXIS-3590 - JLTS - 26/04/2019

}
