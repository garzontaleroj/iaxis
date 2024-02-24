//Revision:# qXeYPeUWtpv6UgzZ/xaq7Q== #
package axis.service.axis;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_AGENSEGU;
import axis.jdbc.PAC_IAX_BASESTECNICAS;
import axis.jdbc.PAC_IAX_BLOQUEO;
import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_CODA;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_CONVENIOS_EMP;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
//INI - IAXIS-15524 - JLTS - 12/08/2021
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRESTAMOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_RECHAZO;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_UTILES;
//FIN - IAXIS-15524 - JLTS - 12/08/2021
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr020Action;
import axis.mvc.control.axis.Axissin006Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;

public class Axisctr020Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr020Service.class);
	Map leeHistPsu = null;
	Map leeHistPsuRet = null;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	private

			void limpiarSessiones(HttpServletRequest request) {

		request.getSession().removeAttribute("axisctr_multi_registro_tomadores");
		request.getSession().removeAttribute("axisctr_tomadores");
		request.getSession().removeAttribute("axisctr_tomador");
		request.getSession().removeAttribute("Preguntar_asegurado");
		request.getSession().removeAttribute("axisctr_multi_registro_asegurados");
		request.getSession().removeAttribute("axisctr_asegurados");
		request.getSession().removeAttribute("axisctr_asegurado");
		request.getSession().removeAttribute("axisctr_opcionesDatosGestion");
		request.getSession().removeAttribute("axisctr_datosGestion");
		request.getSession().removeAttribute("axisctr_opcionesDatosRenta");
		request.getSession().removeAttribute("bt_ctrhost");
		request.getSession().removeAttribute("cargaHost");

	}

	public void m_form(HttpServletRequest request, Axisctr020Action thisAction) {

		logger.debug("Axisctr020Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata2 = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.cargarcombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		try {

			@SuppressWarnings("unused")
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			// IAXIS-5125 SE MODIFICA PARA QUE SE IDENTIFIQUE CUANDO VIENE DESDE LA PANTALLA
			// BUSQUEDA ANTECEDENTES
			// O MANTENIMIENTO DE PERSONAS EN CONSUULA DE POLIZA
			// Y PONGA LA PANTALLA DE BUSQUEDA DE POLIZAS EN MODO CONSULTA
			if ((CMODO == null || CMODO.isEmpty())) {
				if (formdata2.get("CMODO") != null) {
					if (formdata2.get("CMODO").equals("CONSULTA_SINIESTROS")
							|| formdata2.get("CMODO").equals("MANTTO_PER")
							|| formdata2.get("CMODO").equals("ALTA_SINIESTROS")
							|| formdata2.get("CMODO").equals("PRE_SINIESTROS")
							|| formdata2.get("CMODO").equals("MODIF_SINIESTROS")) {
						CMODO = "CONSULTA";
						AbstractDispatchAction.topPila(request, "CMODO", CMODO);
					}
				}
			}

			this.limpiarSessiones(request);

			BigDecimal CHANGEMODO = getCampoNumerico(request, "CHANGEMODO");

			// Bug 27766
			if (!isEmpty(getCampoTextual(request, "CMODO_CTR020"))) {
				AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
			} // Fin Bug 27766
			else if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO_INI"))
					&& (isEmpty(CHANGEMODO) || (!isEmpty(CHANGEMODO) && CHANGEMODO.intValue() != 1))) {
				logger.debug("in change modo 1:" + AbstractDispatchAction.topPila(request, "CMODO"));
				AbstractDispatchAction.topPila(request, "CMODO_INI", AbstractDispatchAction.topPila(request, "CMODO"));
				formdata2.put("CMODO", AbstractDispatchAction.topPila(request, "CMODO"));
			} else if (!isEmpty(CHANGEMODO) && CHANGEMODO.intValue() == 1) {
				logger.debug("in change modo 2:" + AbstractDispatchAction.topPila(request, "CMODO_INI"));
				logger.debug("Modo antiguo:" + AbstractDispatchAction.topPila(request, "CMODO"));
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_INI"));
			}

			if (isEmpty(getCampoNumerico(request, "NCONTADOR"))) {
				formdata2.put("NCONTADOR", 0);
			}
			request.getSession().removeAttribute("axisctr007_primera_vez");
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_AGENSEGU pacIaxAgensegu = new PAC_IAX_AGENSEGU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* RKV: bug 9131 */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* RKV: bug 9131 */
			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* AMC: bug 10385 */
			PAC_IAX_OPERATIVA_FINV pacIaxOperativaFinv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_GESTIONPROPUESTA PACIAXGESTIONPROPUESTA = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Bug 11392 - AMC - 11/02/2010 */
			PAC_IAX_RENTAS pacIaxRentas = new PAC_IAX_RENTAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			/* Bug 18176 - ICV - 05/04/2011 */
			PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Bug 19238/104039 - AMC - 17/01/2012 */
			PAC_IAX_PRESTAMOS pacIaxPrestamos = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Bug 20893/111636 - 02/05/2012 - AMC */
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* Bug 36596/211417 - 05/08/2015 - YDA */
			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_DOCREQUERIDA pacIaxDocrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NESCENA = getCampoNumerico(request, "NESCENA");
			BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");

			formdata2.put("SSEGURO", SSEGURO);
			formdata2.put("NESCENA", NESCENA);
			if (SSEGURO != null) {
				// Recupero las secciones modificadas desde alg�n flujo y las desplego

				Map PILA = ((isEmpty(request.getSession().getAttribute("PASSTOPPILA"))) ? null
						: (HashMap) request.getSession().getAttribute("PASSTOPPILA"));
				List SECACTIVA = ((!isEmpty(PILA) && !isEmpty(PILA.get("SECACTIVA"))) ? (List) PILA.get("SECACTIVA")
						: null);
				if (!isEmpty(SECACTIVA) && SECACTIVA.size() > 0) {
					request.setAttribute("SECACTIVA", SECACTIVA);
				} else {
					if (!isEmpty(this.getCampoTextual(request, "SECACTIVA"))) {
						logger.debug("sec-->" + this.getCampoTextual(request, "SECACTIVA"));
						SECACTIVA = new ArrayList();
						SECACTIVA.add(this.getCampoTextual(request, "SECACTIVA"));
						request.setAttribute("SECACTIVA", SECACTIVA);
					}
				}

				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(SSEGURO);
				logger.debug(map);
				request.getSession().setAttribute("CMONEDAPROD", map.get("RETURN"));

				if (!Boolean.valueOf(true).equals(request.getSession().getAttribute("axisctr020_suplementosPendientes"))
						|| request.getAttribute("axisctr020_polizaEmitida") != null) {
					// Si hay suplementos pendientes, o bien hemos emitido p�liza, no hay que
					// ejecutar esto
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map, false);
					request.removeAttribute("axisctr020_polizaEmitida");
				}

				////////////////// DATOS POLIZA ////////////////////////////////////
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(datosPoliza)) {
					// INICI: modificacio de bug 29600 12/01/2014
					pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(
							(BigDecimal) (datosPoliza.get("SPRODUC")));
					logger.debug(map);
					request.getSession().setAttribute("CMONEDAPROD", map.get("RETURN"));
					logger.debug("JBN: CMONEDAPROD(2): " + map.get("RETURN"));

					// INICI: modificacio de bug 29600 12/01/2014

					// Guardar SPRODUC en sesi�n para posterior llamada a
					// PAC_IAX_CFG__F_GET_FORM_WIZARD()
					request.getSession().setAttribute("SPRODUC", datosPoliza.get("SPRODUC"));
					// INI - IAXIS-15524 - JLTS - 12/08/2021
					request.getSession().setAttribute("CACTIVI", datosPoliza.get("CACTIVI"));
					// FIN - IAXIS-15524 - JLTS - 12/08/2021

					BigDecimal NCERTIF_COL = (BigDecimal) datosPoliza.get("NCERTIF");
					formdata2.put("NCERTIF_COL", NCERTIF_COL);
					logger.debug("NCERTIF_COL: " + NCERTIF_COL);

					if (datosPoliza.get("NCERTIF").equals(new BigDecimal(0))) {
						formdata2.put("NCERTIFDEP", new BigDecimal(0));
					} else {
						formdata2.put("NCERTIFDEP", new BigDecimal(1));
					}

					// Bug 23860 18/12/2012
					request.getSession().setAttribute("NCERTIF", datosPoliza.get("NCERTIF"));
					// Fin 23860 Bug
					// BUG 39659 28/01/2016
					BigDecimal nrenovcolm = null;
					if (!isEmpty(datosPoliza.get("NANUALI"))) {
						nrenovcolm = ((BigDecimal) datosPoliza.get("NANUALI")).add(new BigDecimal(-1));
					}
					request.getSession().setAttribute("NRENOVCOLM", nrenovcolm);
					datosPoliza.put("NRENOVCOLM", nrenovcolm);
					// Fi 39659

					BigDecimal CSITUAC_COL = (BigDecimal) datosPoliza.get("CSITUAC");
					formdata2.put("CSITUAC_COL", CSITUAC_COL);
					logger.debug("CSITUAC_COL: " + CSITUAC_COL);

					initParametrosRentasIrregulares(new BigDecimal(String.valueOf(datosPoliza.get("SPRODUC"))), request,
							usuario);

					// Obtener el nombre del agente
					String Agente = String.valueOf(datosPoliza.get("CAGENTE"));
					if (!isEmpty(Agente)) {
						HashMap mapAgent = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_DAT(null,
								null, Agente, new BigDecimal(1));
						List listaAgentes = (List) tratarRETURNyMENSAJES(request, mapAgent, false);
						Map agente = getObjetoDeLista(listaAgentes, Agente, "CODI");
						datosPoliza.put("axisctr020_agente", agente);
					}

					// Obtener datos Promotor bug 19372/91763 - 12/09/2011 - AMC
					Map promotor = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE((BigDecimal) datosPoliza.get("CPROMOTOR"),
									(BigDecimal) datosPoliza.get("CAGENTE"), new String("POL"));

					Map pro = (Map) promotor.get("OBPERSONA");
					logger.debug("-----> pro:" + pro);
					if (!isEmpty(pro)) {
						String TPROMOTOR = new String(
								pro.get("NNUMIDE") + " - " + pro.get("TNOMBRE") + "," + pro.get("TAPELLI1") + " "
										+ ((pro.get("TAPELLI2") != null) ? pro.get("TAPELLI2") : ""));
						datosPoliza.put("axisctr020_promotor", TPROMOTOR);
					}
					// Procesar formateo cuenta bancaria
					String CBANCAR = (String) datosPoliza.get("CBANCAR");

					if (!isEmpty(CBANCAR)) {
						map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_COMMON__F_FORMATCCC((BigDecimal) datosPoliza.get("CTIPBAN"), CBANCAR);
						logger.debug(map);
						CBANCAR = (String) tratarRETURNyMENSAJES(request, map, false);
						if (!isEmpty(CBANCAR))
							datosPoliza.put("CBANCAR", CBANCAR);
					}

					/* AMC: bug 9217 */
					map = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITE_SUPL_PROD(usuario.getCusuari(),
							new BigDecimal(288), (BigDecimal) datosPoliza.get("SPRODUC"));
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map, false);

					request.setAttribute("suple_clausulas", map.get("P_PERMITE"));
					Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU",
							(BigDecimal) datosPoliza.get("SPRODUC"));
					logger.debug(parproducto);

					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {
						BigDecimal NMOVIMI = null; // isEmpty(datosPoliza.get("NMOVIMI")) ? new BigDecimal(1) : new
													// BigDecimal(String.valueOf(datosPoliza.get("NMOVIMI")));

						Map col_psu = null;
						if (Boolean.valueOf(true)
								.equals(request.getSession().getAttribute("axisctr020_suplementosPendientes"))) {

							Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
							tratarRETURNyMENSAJES(request, m);
							Map datos_poliza_est = (Map) m.get("RETURN");
							BigDecimal SSEGURO_EST = (datos_poliza_est.get("SSEGURO") != null)
									? (BigDecimal) datos_poliza_est.get("SSEGURO")
									: null;

							col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO_EST, NMOVIMI, null, "EST");

							// leeHistPsu.clear();
							// leeHistPsuRet.clear();
							// leeHistPsu=pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO,
							// pP_NVERSION, NRIESGO, NMOVIMI, null);
							leeHistPsuRet = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(SSEGURO, null,
									NRIESGO, NMOVIMI);

						} else {
							col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(
									new BigDecimal(String.valueOf(datosPoliza.get("SSEGURO"))), NMOVIMI, null, "POL");

							// leeHistPsu=pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO,
							// pP_NVERSION, NRIESGO, NMOVIMI, null);
							leeHistPsuRet = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(SSEGURO, null,
									NRIESGO, NMOVIMI);

						}

//						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsu)).intValue() == 0) {
//
//							List b = (List) leeHistPsu.get("P_THIS_PSUCONTROLSEG");
//
//							formdata2.put("P_TPSUCONTRSEG_HIST", b);
//
//						}
						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsuRet)).intValue() == 0) {

							List b = (List) leeHistPsuRet.get("P_THIS_PSU_RETENIDAS");

							formdata2.put("P_TPSU", b);

						}

						logger.debug("col_psu:" + col_psu);
						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
							request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
							request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
							request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));
							request.setAttribute("CNIVELBPM", col_psu.get("P_CNIVELBPM"));
							request.setAttribute("TNIVELBPM", col_psu.get("P_TNIVELBPM"));
							request.setAttribute("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));
							request.setAttribute("TIPODATOS", "PSU");

						}
					}

				}

				// Bug 27500 13/032014
				BigDecimal CFOLNUM = (BigDecimal) datosPoliza.get("NUMFOLIO");
				if (CFOLNUM != null && CFOLNUM.intValue() != 0) {
					datosPoliza.put("CFOLNUM", CFOLNUM);
				}

				Timestamp FMANDATO = (Timestamp) datosPoliza.get("FMANDATO");
				java.sql.Date CFECMAN = FMANDATO == null ? null : new java.sql.Date(FMANDATO.getTime());
				datosPoliza.put("CFECMAN", CFECMAN);

				String SUCURSAL = (String) datosPoliza.get("SUCURSAL");
				datosPoliza.put("CSUCURSAL", SUCURSAL);
				// fin Bug 27500

				request.setAttribute("datos_poliza", datosPoliza);
				BigDecimal CRETENI = (BigDecimal) datosPoliza.get("CRETENI");
				formdata2.put("CRETENI", CRETENI);
				/////////////////////////////////////////////////////////////////////

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
				logger.debug(map);
				Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("datosgestion", datosGestion);

				/* DATOS DE CONVNIO */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug("Datos_Convenio" + map);
				Map datosDetPoliza = (Map) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("datosconvenio", datosDetPoliza.get("CONVEMPVERS"));

				// Bug 36596 IGIL ini
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CITASMEDICAS();
				logger.debug(map);
				List lista = (ArrayList) tratarRETURNyMENSAJES(request, map);
				if (lista != null) {
					formdata2.put("T_IAX_CITAMEDICA", lista);
					request.setAttribute("T_IAX_CITAMEDICA", map.get("RETURN"));
				}
				// Bug 36596 IGIL fin
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("tomadores", map.get("RETURN"));

				// Bug 38374/218532 YDA
				BigDecimal SPERSONTOMA = new BigDecimal(0);
				ArrayList tomadorespol = (ArrayList) map.get("RETURN");
				if (!isEmpty(tomadorespol)) {
					for (int i = 0; i < tomadorespol.size(); i++) {
						BigDecimal orden = (BigDecimal) ((Map) ((Map) tomadorespol.get(i)).get("OB_IAX_TOMADORES"))
								.get("NORDTOM");
						if (orden.intValue() == 1) {
							SPERSONTOMA = (BigDecimal) ((Map) ((Map) tomadorespol.get(i)).get("OB_IAX_TOMADORES"))
									.get("SPERSON");
						}
					}
				}
				// Fin Bug 38374/218532 YDA

				map = pacIaxAgensegu.ejecutaPAC_IAX_AGENSEGU__F_GET_CONSULTAAPUNTES(null, null, null, null, null, null,
						null, SSEGURO);
				logger.debug("Agenda-->" + map);

				// Bug 11177.NMM.i.S'amaguen els que est�n anul�lats ( cestado = 2).
				ArrayList agendasenseanulats = new ArrayList();
				if (!isEmpty(tratarRETURNyMENSAJES(request, map, false))) {
					ArrayList<Map> agendaambanulats = (ArrayList<Map>) tratarRETURNyMENSAJES(request, map, false);
					for (Map m : agendaambanulats) {
						BigDecimal estat = (BigDecimal) m.get("CESTADO");
						if (estat.intValue() != 2)
							agendasenseanulats.add(m);
					}
				} // f.

				request.setAttribute("lstagenda", agendasenseanulats);

				/*
				 * map = new
				 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMISIONES(); logger.debug
				 * (map); List comisiones = (List) tratarRETURNyMENSAJES(request, map);
				 * 
				 * map = new
				 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(); logger.debug
				 * (map); List gestionComisiones = (List) tratarRETURNyMENSAJES(request, map);
				 * 
				 * // Merge de la segunda lista en la primera if (!isEmpty (gestionComisiones))
				 * { for (int i = 0; i < gestionComisiones.size(); i++) { Map outerMap = (Map)
				 * gestionComisiones.get(i); Map OB_IAX_GSTCOMISION = (Map) outerMap.get
				 * ("OB_IAX_GSTCOMISION"); // A�adir en el objeto de comisiones el objeto
				 * gesti�n comisi�n if (!isEmpty(comisiones.get(i))) { Map COMISION = (Map)
				 * comisiones.get(i); COMISION.put ("CMODCOM", (BigDecimal)
				 * OB_IAX_GSTCOMISION.get("CMODCOM") ); COMISION.put ("PCOMISI", (BigDecimal)
				 * OB_IAX_GSTCOMISION.get("PCOMISI") ); } } }
				 * 
				 * request.getSession().setAttribute ("axisctr_definicionComisiones",
				 * !isEmpty(comisiones) ? comisiones : new ArrayList());
				 */

				// Bug 11177.NMM.f.
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
				logger.debug(map);
				List<Map> T_IAX_GESTRIESGOS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_GESTRIESGOS);
				/* VCL: bug 16255 */
				if (!isEmpty(T_IAX_GESTRIESGOS)) {
					// BigDecimal
					// NUMRIESGO=(BigDecimal)((Map)map.get("OB_IAX_GESTRIESGOS")).get("NRIESGO");
					for (Map Mrisc : T_IAX_GESTRIESGOS) {
						BigDecimal NUMRIESGO = (BigDecimal) ((Map) Mrisc.get("OB_IAX_GESTRIESGOS")).get("NRIESGO");
						// Consultem les dades totals de cada risc, per obtenir el camp FEFECTO i
						// incloure'l a la taula.
						Map mapRisc = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NUMRIESGO);
						Map OB_IAX_RIESGOS = (Map) tratarRETURNyMENSAJES(request, mapRisc, false);
						java.sql.Timestamp FEFECTO = (java.sql.Timestamp) OB_IAX_RIESGOS.get("FEFECTO");
						((Map) Mrisc.get("OB_IAX_GESTRIESGOS")).put("FEFECTO", FEFECTO);
					}
				}
				/* Fi VCL: bug 16255 */
				request.setAttribute("T_IAX_GESTRIESGOS", T_IAX_GESTRIESGOS);

				if (!isEmpty(T_IAX_GESTRIESGOS)) {
					try {
						// Mirar si hay un riesgo seleccionado
						boolean trobat = false;
						NRIESGO = getCampoNumerico(request, "NRIESGO");

						if (!isEmpty(NRIESGO)) {
							for (Map Mrisc : T_IAX_GESTRIESGOS) {
								BigDecimal risc = (BigDecimal) ((Map) Mrisc.get("OB_IAX_GESTRIESGOS")).get("NRIESGO");
								if (NRIESGO.equals(risc)) {
									trobat = true;
									break;
								}
							}
						}

						if (!trobat)
							NRIESGO = null;
						logger.debug(trobat);

						// Si no hay ning�n riesgo seleccionado, seleccionar el primer RIESGO
						if (isEmpty(NRIESGO)) {
							NRIESGO = (BigDecimal) ((Map) ((Map) T_IAX_GESTRIESGOS.get(0)).get("OB_IAX_GESTRIESGOS"))
									.get("NRIESGO");
							Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
							formdata.put("NRIESGO", bigDecimalToString(NRIESGO));
						}
						// Recuperar el riesgo
						m_getRiesgo(request, thisAction);

					} catch (Exception e) {
						logger.error("Error en el servicio Axisctr020Service - m�todo m_form 1", e);
						// El primer registro de la tabla no contiene un NRIESGO
					}

				}

				/* ASEGURADOS INN */
				PAC_IAX_CONVENIOS_EMP pac_iax_convenios_emp = new PAC_IAX_CONVENIOS_EMP(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map inn = pac_iax_convenios_emp.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_ASEGURADOS_INNOM(SSEGURO, NRIESGO,
						null, null, null);
				logger.debug(inn);
				ArrayList lista_aseginn = (ArrayList) tratarRETURNyMENSAJES(request, inn, false);
				request.setAttribute("ASEGURADOS_INNOM", lista_aseginn);

				/* PREGUNTAS */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNPOLIZACONSULTA();
				logger.debug(map);
				List T_IAX_PREGUNTAS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_PREGUNTAS);
				List pregQuestSalut = null;
				List pregDespeses = null;
				if (!isEmpty(T_IAX_PREGUNTAS)) {
					pregQuestSalut = dividirPregPerCtipgru(T_IAX_PREGUNTAS, 1); // Constantes.CTIPGRU_QUESTIONARI_SALUT);
					pregDespeses = dividirPregPerCtipgru(T_IAX_PREGUNTAS, 2); // Constantes.CTIPGRU_DESPESES);
				}

				request.setAttribute("T_IAX_PREGUNTAS", T_IAX_PREGUNTAS);
				request.setAttribute("pregQuestSalut", pregQuestSalut);
				request.setAttribute("pregDespeses", pregDespeses);
				/* 36596/211429 Rechazos/Cancelaciones de P�liza */
				Map retMap = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PSU_RETENIDAS();
				List T_IAX_PSU_RETENIDAS = (List) tratarRETURNyMENSAJES(request, retMap, false);
				List<Map> ENFERMEDADES = null;

				if (T_IAX_PSU_RETENIDAS != null) {
					Map obIax = (Map) ((Map) T_IAX_PSU_RETENIDAS.get(0)).get("OB_IAX_PSU_RETENIDAS");
					ENFERMEDADES = (List) obIax.get("ENFERMEDADES");

					if (ENFERMEDADES != null) {
						if (ENFERMEDADES.get(0) != null) {
							Iterator it = ENFERMEDADES.get(0).entrySet().iterator();
							while (it.hasNext()) {
								Map.Entry pair = (Map.Entry) it.next();
								if ("OBJECT".equals(pair.getKey())) {
									if (pair.getValue() == null) {
										ENFERMEDADES = null;
									}
								}
							}
						}
					}
				}

				request.setAttribute("T_IAX_PSU_RETENIDAS", T_IAX_PSU_RETENIDAS);
				request.setAttribute("ENFERMEDADES", ENFERMEDADES);
				/* RETORNOS */
				Map mapa_prod_retorno = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEERETORNO();
				logger.debug("************************************" + mapa_prod_retorno);
				ArrayList lista_retornos = (ArrayList) tratarRETURNyMENSAJES(request, mapa_prod_retorno, false);
				request.setAttribute("lista_retornos", lista_retornos);

				/* CLAUSULAS PROD */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPROD();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				ArrayList lista_clausulasprod = (ArrayList) map.get("RETURN");
				if (lista_clausulasprod != null) {
					for (int i = 0; i < lista_clausulasprod.size(); i++) {
						BigDecimal codi_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasprod.get(i))
								.get("OB_IAX_CLAUSULAS")).get("SCLAGEN");
						BigDecimal clausula_params = (BigDecimal) ((Map) ((Map) lista_clausulasprod.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CPARAMS");
						if ((clausula_params != null) && (clausula_params.intValue() <= 0)) {
							HashMap n = pacIaxparProductos
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(codi_clausula);
							String descripcion = (String) n.get("RETURN");
							((Map) ((Map) lista_clausulasprod.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
									descripcion);
						} else {
							// recuperem els parametres de la clusula
							HashMap n = pacIaxparProductos
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(codi_clausula, SSEGURO);
							String descripcion = (String) n.get("RETURN");
							((Map) ((Map) lista_clausulasprod.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
									descripcion);
						}
					}
				}
				request.setAttribute("clausulasprod", lista_clausulasprod);

				/* CLAUSULAS PROD MULT */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASPRODMULT(null, null);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				ArrayList lista_clausulasprodmult = (ArrayList) map.get("RETURN");
				if (lista_clausulasprodmult != null) {
					for (int i = 0; i < lista_clausulasprodmult.size(); i++) {
						BigDecimal codi_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasprodmult.get(i))
								.get("OB_IAX_CLAUSULAS")).get("SCLAGEN");
						BigDecimal cnordcla_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasprodmult.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CIDENTITY");
						BigDecimal clausula_params = (BigDecimal) ((Map) ((Map) lista_clausulasprodmult.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CPARAMS");
						if ((clausula_params != null) && (clausula_params.intValue() <= 0)) {
							HashMap n = pacIaxparProductos
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(codi_clausula);
							String descripcion = (String) n.get("RETURN");
							((Map) ((Map) lista_clausulasprodmult.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
									descripcion);
						} else {
							// recuperem els parametres de la clusula
							HashMap n = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPARMULT(
									codi_clausula, cnordcla_clausula, SSEGURO);
							String descripcion = (String) n.get("RETURN");
							((Map) ((Map) lista_clausulasprodmult.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
									descripcion);
						}
					}
				}
				request.setAttribute("clausulasprodmult", lista_clausulasprodmult);

				/* CLAUSULAS ESPECIFICAS */
				HashMap m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(null, "CONSULTA");
				logger.debug("m:" + m);

				logger.debug(m);
				tratarRETURNyMENSAJES(request, m);
				ArrayList lista_clausulasEsp = (ArrayList) m.get("RETURN");
				if (lista_clausulasEsp != null) {
					for (int i = 0; i < lista_clausulasEsp.size(); i++) {
						BigDecimal codi_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasEsp.get(i))
								.get("OB_IAX_CLAUSULAS")).get("SCLAGEN");
						BigDecimal clausula_params = (BigDecimal) ((Map) ((Map) lista_clausulasEsp.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CPARAMS");
						BigDecimal CTIPO = (BigDecimal) ((Map) ((Map) lista_clausulasEsp.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CTIPO");
						if ((new BigDecimal(2).equals(CTIPO)) || ((new BigDecimal(3).equals(CTIPO)))) {
							if ((clausula_params != null) && (clausula_params.intValue() <= 0)) {
								HashMap n = pacIaxparProductos
										.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(codi_clausula);
								String descripcion = (String) n.get("RETURN");
								((Map) ((Map) lista_clausulasEsp.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
										descripcion);
							} else {
								// recuperem els parametres de la clusula
								HashMap n = pacIaxparProductos
										.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(codi_clausula, SSEGURO);
								String descripcion = (String) n.get("RETURN");
								((Map) ((Map) lista_clausulasEsp.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
										descripcion);
							}
						}
					}
				}

				request.setAttribute("clausulasesp", lista_clausulasEsp);

				/* CLAUSULAS ESPECIFICAS POR RIESGO */
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULASESP(NRIESGO, "CONSULTA");
				logger.debug("m:" + m);

				logger.debug(m);
				tratarRETURNyMENSAJES(request, m);
				ArrayList lista_clausulasEspRies = (ArrayList) m.get("RETURN");
				if (lista_clausulasEspRies != null) {
					for (int i = 0; i < lista_clausulasEspRies.size(); i++) {
						BigDecimal codi_clausula = (BigDecimal) ((Map) ((Map) lista_clausulasEspRies.get(i))
								.get("OB_IAX_CLAUSULAS")).get("SCLAGEN");
						BigDecimal clausula_params = (BigDecimal) ((Map) ((Map) lista_clausulasEspRies.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CPARAMS");
						BigDecimal CTIPO = (BigDecimal) ((Map) ((Map) lista_clausulasEspRies.get(i))
								.get("OB_IAX_CLAUSULAS")).get("CTIPO");
						if ((new BigDecimal(2).equals(CTIPO)) || ((new BigDecimal(3).equals(CTIPO)))) {
							if ((clausula_params != null) && (clausula_params.intValue() <= 0)) {
								HashMap n = pacIaxparProductos
										.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULA(codi_clausula);
								String descripcion = (String) n.get("RETURN");
								((Map) ((Map) lista_clausulasEspRies.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
										descripcion);
							} else {
								// recuperem els parametres de la clusula
								HashMap n = pacIaxparProductos
										.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCCLAUSULAPAR(codi_clausula, SSEGURO);
								String descripcion = (String) n.get("RETURN");
								((Map) ((Map) lista_clausulasEspRies.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
										descripcion);
								// ((Map)((Map)lista_clausulasEsp.get(i)).get("OB_IAX_CLAUSULAS")).put("TCLAESP",
								// descripcion);
							}
						}
					}
				}

				logger.debug("---> lista_clausulasEspRies:" + lista_clausulasEspRies);
				request.setAttribute("clausulasespries", lista_clausulasEspRies);

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_RECIBOS();
				logger.debug(map);
				List<Map> recibos = (List<Map>) tratarRETURNyMENSAJES(request, map, false);

				BigDecimal NRECIBO_sel = getCampoNumerico(request, "NRECIBO_sel"); // Recuperamos el campo
				BigDecimal NRECIBO_aux = null;

				// Comparamos el recibo seleccionado con los presentes en la seccion recibos

				if (!isEmpty(recibos) && !isEmpty(NRECIBO_sel)) {
					for (int k = 0; k < recibos.size(); k++) {
						HashMap mapa_recibos = (HashMap) ((HashMap) recibos.get(k)).get("OB_IAX_DETRECIBO");
						BigDecimal NRECIBO_area = (BigDecimal) mapa_recibos.get("NRECIBO");
						if (NRECIBO_area.intValue() == NRECIBO_sel.intValue()) {
							NRECIBO_aux = NRECIBO_area; // Si alguno coincide se actualiza el valor
						}
					}
					NRECIBO_sel = NRECIBO_aux; // Ahora actualizamos el valor del recibo seleccionado, y si es
												// ncecesario lo actualizamos
				}

				//
				if (isEmpty(NRECIBO_sel)) { // Si es null ya no lo recuperamos
					if (!isEmpty(recibos)) {
						HashMap mapa_recibos_sel = (HashMap) ((HashMap) recibos.get(0)).get("OB_IAX_DETRECIBO");
						NRECIBO_sel = (BigDecimal) mapa_recibos_sel.get("NRECIBO");
						formdata2.put("NRECIBO_sel", NRECIBO_sel);
					}
				}
				BigDecimal MONEDAORIGEN = getCampoNumerico(request, "IMPORTE_MON");
				/* CORRETAJE */
				// INI -IAXIS-10627 -21/01/2020. Se adiciona el paar�metro pPNOMIVI

				// BARTOLO HERRERA 19/03/2020 inicio

				Map map_ultmov = new PAC_IAX_UTILES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_UTILES__F_GET_ULTMOV(SSEGURO, BigDecimal.ONE);

				BigDecimal ultmov = new BigDecimal(map_ultmov.get("VULTMOV").toString());
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEECORRETAJE(ultmov);

				// BARTOLO HERRERA 19/03/2020 fin

				// FIN -IAXIS-10627 -21/01/2020.
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				ArrayList lista_corretaje = (ArrayList) map.get("RETURN");

				request.setAttribute("lista_corretaje", lista_corretaje);

				/* IMPAGADOS RECUPERADO */
				// Se recupera la lista con el valor seleccionado de NREL_sel
				map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS(SSEGURO, NRECIBO_sel, null);
				ArrayList OB_IAX_IMPAGOS = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("OB_IAX_IMPAGOS", OB_IAX_IMPAGOS);

				/* IMPAGADOS */
				/*
				 * map=pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS(SSEGURO,null,null);
				 * ArrayList OB_IAX_IMPAGOS= (ArrayList) tratarRETURNyMENSAJES(request, map,
				 * false); request.setAttribute("OB_IAX_IMPAGOS",OB_IAX_IMPAGOS);
				 */

				/* RKV: bug 8725 */
				if (VisibleTag.esComponenteVisible(request, "axisctr020", "BT_ACCION") && !isEmpty(recibos)) {
					PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					for (Map recibo : recibos) {
						recibo = (Map) recibo.get("OB_IAX_DETRECIBO");
						BigDecimal NRECIBO = (BigDecimal) recibo.get("NRECIBO");
						map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_ACCIONES(NRECIBO,
								new BigDecimal(0));
						logger.debug(map);
						List T_IAX_ACCIONES = (List) tratarRETURNyMENSAJES(request, map, false);
						BigDecimal PSALTAR = (BigDecimal) map.get("PSALTAR");

						if (!BigDecimal.ZERO.equals(PSALTAR)) {
							// Si PSALTAR no es 0, miramos la longitud de la lista devuelta
							// para saber si mostrar o no el icono de "Gesti�n Recibos"
							// Si la lista viene vac�a, TAMPOCO tenemos que saltar.
							if (isEmpty(T_IAX_ACCIONES))
								PSALTAR = BigDecimal.ZERO;
						}
						recibo.put("PSALTAR", PSALTAR);
						/*
						 * XPL, descomentar cuando se hayan subido las funciones del pac_coda para pagos
						 * parciales
						 */
						map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NRECIBO, null);
						logger.debug(map);
						if (!isEmpty(map.get("RETURN"))
								&& new BigDecimal(String.valueOf(map.get("RETURN"))).intValue() == 0) {
							BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
							recibo.put("IMPPENDIENTE", IMPPEN);
						}
					}
				}
				/* RKV: bug 8725 */

				request.setAttribute("recibos", recibos);

				/* RKV: bug 9131 */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ADMITECERTIFICADOS();
				logger.debug(map);
				BigDecimal admiteCertificados = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("ADMITECERTIFICADOS", admiteCertificados);

				if (BigDecimal.ONE.equals(admiteCertificados)) {
					map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_NAMETOMADORCERO(SSEGURO, BigDecimal.ONE);
					logger.debug(map);
					request.setAttribute("NAMETOMADORCERO", tratarRETURNyMENSAJES(request, map, false));
				}
				/* RKV: bug 9131 */

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MVTPOLIZA();
				logger.debug("moviments :: " + map);
				List movimientos = (List) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("mvtpoliza", movimientos);
				// INI SGM
				if (!isEmpty(movimientos)) {
					for (int i = 0; i < movimientos.size(); i++) {
						BigDecimal NMOVIMI_AUX = (BigDecimal) ((Map) (movimientos.get(i))).get("NMOVIMI");
						if ((new BigDecimal(1)).equals(NMOVIMI_AUX)) {
							logger.debug("NCERTDIAN :: " + (String) ((Map) (movimientos.get(i))).get("NCERTDIAN"));
							String NCERTDIAN = String.valueOf((String) ((Map) (movimientos.get(i))).get("NCERTDIAN"));
							formdata2.put("NCERTDIAN", NCERTDIAN);
							logger.debug(formdata2);
						}
					}
				}
				// FIN SGM

				BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");

				// NMOVIMI,
				map = PACIAXGESTIONPROPUESTA.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_SOLICITUDSUPLEMENTOS(SSEGURO, null,
						null); // NRIESGO);
				logger.debug("solicitudes :: " + map);
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {

					m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800025));
					logger.debug(m);
					request.setAttribute("lstestadossolsupl", (List) tratarRETURNyMENSAJES(request, m, false));
					request.setAttribute("lstsolicituds", map.get("PSOLICITUDES"));
				}

				/* MOT.RETENCION. PARA SUPLEMENTOS */
				map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_MVTRETENCION();
				logger.debug("m:" + map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("mvtretencion_sup", map.get("RETURN"));

				if (!isEmpty(movimientos)) {
					try {
						Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
						NMOVIMI = getCampoNumerico(request, "NMOVIMI");
						BigDecimal canviNmovimi = isEmpty(getCampoNumerico(request, "canviNmovimi")) ? new BigDecimal(0)
								: getCampoNumerico(request, "canviNmovimi");

						if (canviNmovimi.intValue() != 1)
							NMOVIMI = (BigDecimal) ((Map) movimientos.get(0)).get("NMOVIMI");
						logger.debug(NMOVIMI);

						/*
						 * if(isEmpty(NMOVIMI) || NMOVIMI.equals(new BigDecimal(-9999)) ){ NMOVIMI =
						 * (BigDecimal) ((Map) movimientos.get(0)).get("NMOVIMI"); }
						 */
						formdata.put("NMOVIMI", bigDecimalToString(NMOVIMI));

						/* INI SECCION INSPECCIONES */
						PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
								((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
						Map listValores = new HashMap();
						// combo si/no
						HashMap mapa_aux = pac_axis_listValores
								.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(9));
						listValores.put("lstInspec1", tratarRETURNyMENSAJES(request, mapa_aux));
						// combo resultado inspecci�n
						mapa_aux = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(755));
						listValores.put("lstInspec2", tratarRETURNyMENSAJES(request, mapa_aux));
						request.setAttribute("listvalores", listValores);

						PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO(
								"GESTION_IR", (BigDecimal) datosPoliza.get("SPRODUC"));
						logger.debug(parproducto);

						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {

							mapa_aux = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(
									SSEGURO, isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, NRIESGO);
							logger.debug(mapa_aux);
							List l_aux = (List) (tratarRETURNyMENSAJES(request, mapa_aux));
							int size = l_aux == null ? 0 : l_aux.size();
							if (size > 0) {
								request.setAttribute("INSPECCION_RIESGO", l_aux);
							}
							if (!isEmpty(mapa_aux.get("PRESULTADOINSPECCION")))
								formdata.put("CRESULTR", mapa_aux.get("PRESULTADOINSPECCION"));

							if (!isEmpty(mapa_aux.get("PNECESITAINSPECCION")))
								formdata.put("CINSPREQ", mapa_aux.get("PNECESITAINSPECCION"));
							/* FIN SECCION INSPECCIONES */
							// formdata.put("NMOVIMI", "2");
							// }
						}
						// Mirar si esta cargado el ultimo movimiento siempre
						BigDecimal NMOVIMI_ULTIMO = (BigDecimal) ((Map) movimientos.get(0)).get("NMOVIMI");
						formdata.put("NMOVIMI_ULTIMO", bigDecimalToString(NMOVIMI_ULTIMO));

						// Recuperar el Motivo de retenci�n
						m_getMotivos(request, thisAction);

						PAC_IAX_BASESTECNICAS pac_iax_basestec = new PAC_IAX_BASESTECNICAS(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						String NRIESGO_aux = String.valueOf(formdata.get("NRIESGO"));
						if (isEmpty(NRIESGO_aux))
							NRIESGO_aux = String.valueOf(NRIESGO);
						/* Fecha vencimiento prevista LCF */
						if (!isEmpty(NRIESGO_aux)) {
							Map bases = pac_iax_basestec.ejecutaPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(SSEGURO,
									new BigDecimal(NRIESGO_aux), NMOVIMI, "SEG");

							Map datos_base = (Map) tratarRETURNyMENSAJES(request, bases, false);
							logger.debug(datos_base);
							request.setAttribute("DATOSBASICOS", datos_base);

							/* Seccion bases t�cnicas */
							logger.debug("----------> ob_iax_basestecnicas:" + bases);
							request.setAttribute("OB_IAX_BASESTECNICAS", tratarRETURNyMENSAJES(request, bases, false));

							gestionarOrdenacionTablas(request);
						}
					} catch (Exception e) {
						logger.error("Error en el servicio Axisctr020Service - m�todo m_form 2", e);
						// El primer registro de la tabla no contiene un NMOVIMI
					}

				}

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DOCUMENTACION();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("documentacion", map.get("RETURN"));

				// Bug 10024-11/05/2009-AMC
				map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_MVTDIFERIDOS(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("diferidos", map.get("RETURN"));

				// Bug 10385 - 13/07/2009 - AMC
				map = pacIaxOperativaFinv.ejecutaPAC_IAX_OPERATIVA_FINV__F_LEEDISTRIBUCIONFINV(SSEGURO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("perfil_inv", map.get("RETURN"));

				// Bug 11392 - AMC - 11/02/2010
				map = pacIaxRentas.ejecutaPAC_IAX_RENTAS__F_GET_DAT_RENTA(SSEGURO);
				logger.debug("---- datos renta:" + map);
				List datos = (List) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(datos)) {
					formdata2.putAll((HashMap) datos.get(0));
				}

				map = pacIaxRentas.ejecutaPAC_IAX_RENTAS__F_GET_PAGOS_RENTA(SSEGURO);
				logger.debug("---- pagos renta:" + map);
				List pagos = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(pagos)) {
					request.setAttribute("PAGOS_REN", pagos);
				}

				// Bug 15965-13/09/2010-JRB
				map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI_RIESGO(SSEGURO, NRIESGO);
				logger.debug("Siniestros Riesgo-->" + map);
				List lstsiniestros_riesgo = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(lstsiniestros_riesgo)) {
					request.setAttribute("lstsiniestros_riesgo", lstsiniestros_riesgo);
				}
				map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_CONSULTA_LSTSINI_RIESGO(SSEGURO, null);
				logger.debug("Siniestros-->" + map);
				List lstsiniestros = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(lstsiniestros)) {
					request.setAttribute("lstsiniestros", lstsiniestros);
				}

				// Bug 12342 - 22/12/2009 - AMC
				/*
				 * BigDecimal NRIESGO=getCampoNumerico(request, "NRIESGO");
				 * 
				 * BigDecimal NMOVIMI=(BigDecimal)((Map)movimientos.get(0)).get("NMOVIMI"); map
				 * = new
				 * PAC_IAX_BASESTECNICAS((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)).ejecutaPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(SSEGURO,NRIESGO,
				 * NMOVIMI,"SEG");
				 * 
				 * logger.debug("----------> ob_iax_basestecnicas:"+map);
				 * request.setAttribute("OB_IAX_BASESTECNICAS",tratarRETURNyMENSAJES(request,
				 * map));
				 * 
				 * gestionarOrdenacionTablas(request);
				 */

				// Bug 14598
				/*
				 * PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos=new
				 * PAC_IAX_OBTENERDATOS((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)); Map
				 * evolu=pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(
				 * SSEGURO, null); tratarRETURNyMENSAJES(request, evolu, false);
				 * request.setAttribute("evoluprovmatseg", evolu.get("RETURN"));
				 */
				// Fin Bug 14598

				// Bug 17155 : A�adir datos carga fichero
				PAC_IAX_GESTION_PROCESOS pac_gestion_procesos = new PAC_IAX_GESTION_PROCESOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map carga_fichero = pac_gestion_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(
						new BigDecimal("1"), null, SSEGURO, null, null); // CTIPO = 2 .- CCOMPANI,SSGURO,NSINIES,NRECIBO
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, carga_fichero, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_fichero = (ArrayList) carga_fichero.get("PCURCARGA");
					request.setAttribute("carga_fichero_datos", lista_fichero);
				}

				map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("1"),
						SSEGURO.toString(), null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
					request.setAttribute("lstagdagenda", lista_agenda);
				}
				PAC_IAX_INFORMES pac_iax_informes = new PAC_IAX_INFORMES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				m = pac_iax_informes.ejecutaPAC_IAX_INFORMES__F_GET_DOCUMENTACION(SSEGURO);
				logger.debug("documentacion : " + m);
				request.setAttribute("axisgedox", tratarRETURNyMENSAJES(request, m, false));

				/* Bug 19852/95570 - AMC - 26/10/2011 */
				map = pacIaxOperativaFinv.ejecutaPAC_IAX_OPERATIVA_FINV__F_OP_PDTES_VALORAR(usuario.getCempres(),
						SSEGURO, usuario.getCidioma());
				logger.debug("-->ocultar impresora:" + map);
				String literal = null;
				if (!isEmpty(map.get("PLITERAL"))) {
					literal = (String) map.get("PLITERAL");
				}

				BigDecimal oculimpre = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

				request.setAttribute("litimpresion", literal);
				request.setAttribute("oculimpre", oculimpre);
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

				PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

				logger.debug(mmoneda);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
					request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
					request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
					request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

				}

				// Bug 38374/218532 YDA
				BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_CON");
				if (SPERSON == null)
					SPERSON = SPERSONTOMA;
				PAC_IAX_CTACLIENTE pac_iax_ctacliente = new PAC_IAX_CTACLIENTE(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				// System.out.println("SPERSON = "+SPERSON+" SSEGURO = "+SSEGURO+" SPRODUC =
				// "+SPRODUC);
				map = pac_iax_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(SPERSON, SSEGURO, SPRODUC,
						null, null, null, null, null);
				logger.debug("Map: " + map);
				List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata2.put("OBTENERMOVIMIENTOS", resultados);
				// Bug 38374/218532 YDA

				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), whoami(this).toUpperCase(),
								"DETALLE_PRIMAS", new BigDecimal(0));

				logger.debug(map);
				request.setAttribute("informes", map.get("PCURCONFIGSINF"));

				// Bug 19238/104039 - 17/01/2012 - AMC
				map = pacIaxPrestamos.ejecutaPAC_IAX_PRESTAMOS__F_GET_LSTPRESTAMOS(SSEGURO, NRIESGO);
				logger.debug("---- prestamos:" + map);
				List prestamos = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(prestamos)) {
					request.setAttribute("PRESTAMOS", prestamos);
				}

				/* Bug 20893/111636 - 02/05/2012 - AMC */
				m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("GEODIRECCION", usuario.getCempres());
				logger.debug("---> geo:" + m);
				formdata2.put("GEODIRECCION", tratarRETURNyMENSAJES(request, m));

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDETCOASEGURO();
				Map coa = (HashMap) map.get("RETURN");
				logger.debug("----> datos coaseguro:" + coa);
				request.setAttribute("DATCOASEGURO", coa);

				PAC_IAX_PARAM pacIaxParam = new PAC_IAX_PARAM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapResult = pacIaxParam.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("N_MAX_REG");
				BigDecimal N_MAX_REG = (BigDecimal) tratarRETURNyMENSAJES(request, mapResult);
				if (isEmpty(N_MAX_REG)) {
					N_MAX_REG = null;
				}
				// bug 22839
				PAC_IAX_DATOSCTASEGURO pacIaxDatosCtaSeguro = new PAC_IAX_DATOSCTASEGURO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map datoscolect = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATCOLECT(SSEGURO, null,
						N_MAX_REG);
				Map OB_IAX_DATOSCOLECTIVO = (Map) tratarRETURNyMENSAJES(request, datoscolect);
				request.getSession().setAttribute("datoscolect", OB_IAX_DATOSCOLECTIVO);

				String TABLAS = "SEG";
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ES_COL_ADMIN(SSEGURO, TABLAS);
				logger.debug("F_ES_COL_ADMIN: " + m);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata2.put("ES_COL_ADMIN", m.get("ES_COL_ADMIN"));
				}

				// bug 27305
				map = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_PENDIENTE_EMISION();
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				// request.setAttribute("ES_SUPL_MULTP", map.get("RETURN"));
				formdata2.put("ES_SUPL_MULTP", map.get("RETURN"));

				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ES_AGE_LIDER(SSEGURO, NMOVIMI);
				logger.debug("F_ES_AGE_LIDER: " + m);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata2.put("ES_AGE_LIDER", m.get("ES_AGE_LIDER"));
				}

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEGESCOBRO();
				ArrayList lstGestCobros = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
				if (lstGestCobros != null && lstGestCobros.size() > 0) {
					HashMap mapGesCobros = (HashMap) lstGestCobros.get(0);
					HashMap mapDataGesCobros = (HashMap) mapGesCobros.get("OB_IAX_GESCOBROS");
					BigDecimal cdomici = (BigDecimal) mapDataGesCobros.get("CDOMICI");
					ArrayList<HashMap> direcciones = (ArrayList) mapDataGesCobros.get("DIRECCIONES");
					for (HashMap OB_IAX_DIRECCIONES : direcciones) {
						HashMap direc = (HashMap) OB_IAX_DIRECCIONES.get("OB_IAX_DIRECCIONES");
						BigDecimal dircdomici = (BigDecimal) direc.get("CDOMICI");
						if (dircdomici.equals(cdomici)) {
							String tDomici = (String) direc.get("TDOMICI");
							mapDataGesCobros.put("TDOMICIGESTCOBRO", tDomici);
						}
					}
				}
				logger.debug("----> gestor de cobros:" + map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("gestorescobro", map.get("RETURN"));

				map = pac_iax_obtenerdatos.callPAC_IAX_OBTENERDATOS__F_LEE_ENFERMEDADES(SSEGURO);
				logger.debug("Enfermedades:" + map);
				List enfermedadesundw = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("enfermedadesundw", enfermedadesundw);

				map = pac_iax_obtenerdatos.callPAC_IAX_OBTENERDATOS__F_LEE_PREGUNTAS(SSEGURO);
				logger.debug("Preguntas:" + map);
				List preguntasundw = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("preguntasundw", preguntasundw);

				map = pac_iax_obtenerdatos.callPAC_IAX_OBTENERDATOS__F_LEE_ACCIONES(SSEGURO);
				logger.debug("Preguntas:" + map);
				List accionesundw = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("accionesundw", accionesundw);

				String tablas = " ";
				BigDecimal nriesgo = new BigDecimal(1);
				map = pac_iax_obtenerdatos.callPAC_IAX_OBTENERDATOS__F_GET_EXCLUSIONES(SSEGURO, nriesgo, tablas);
				logger.debug("Exclusiones map :" + map);
				List exclusionesundw = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("exclusionesundw", exclusionesundw);

				Map cuapres = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEE_PRESTCUADROSEG(SSEGURO);
				request.setAttribute("T_IAX_PRESTCUADROSEG", tratarRETURNyMENSAJES(request, cuapres, false));

				/* Bug 26373 JMT - 04/04/2016 - JMT */
				/* DATOS CONTACTO */
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSCONTACTO(
						(BigDecimal) datosPoliza.get("NPOLIZA"), (BigDecimal) datosPoliza.get("NCERTIF"));
				logger.debug(map);

				List T_IAX_DATOS_CONTACTO = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(T_IAX_DATOS_CONTACTO);
				request.setAttribute("T_IAX_DATOS_CONTACTO", T_IAX_DATOS_CONTACTO);

				// PLEDGE INI
				PAC_IAX_BLOQUEO pacIaxBloqueo = new PAC_IAX_BLOQUEO(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				int nPignoraciones = 0;
				map = pacIaxBloqueo.ejecutaPAC_IAX_BLOQUEO__F_GET_BLOQUEOS(SSEGURO);
				logger.debug(map);
				List T_IAX_MVTPOLIZAPIGNORADA = (List) tratarRETURNyMENSAJES(request, map);
				if (T_IAX_MVTPOLIZAPIGNORADA != null) {
					nPignoraciones = T_IAX_MVTPOLIZAPIGNORADA.size();
				}
				formdata2.put("T_IAX_MVTPOLIZAPIGNORADA", T_IAX_MVTPOLIZAPIGNORADA);
				// PLEDGE FIN
				Map mdocrequi = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(SSEGURO,
						new BigDecimal(1));
				request.setAttribute("docu_requerida", tratarRETURNyMENSAJES(request, mdocrequi, false));
			}

			Map dPol = (Map) request.getAttribute("datos_poliza");
			if (!isEmpty(SSEGURO)) {
				Map mapContragaran = new PAC_IAX_CONTRAGARAN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_SEG(SSEGURO);
				logger.debug(mapContragaran);
				List listaContragaran = (ArrayList) tratarRETURNyMENSAJES(request, mapContragaran);
				formdata2.put("T_IAX_CONTRAGARAN", listaContragaran);
				request.setAttribute("T_IAX_CONTRAGARAN", mapContragaran.get("RETURN"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));

			// RCL 09/07/2013 - INICI BUG 23860
			if (Boolean.valueOf(true).equals(request.getSession().getAttribute("axisctr020_suplementosPendientes"))) {
				try {
					PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
					tratarRETURNyMENSAJES(request, m);
					Map datos_poliza_est = (Map) m.get("RETURN");
					BigDecimal SSEGURO_EST = (datos_poliza_est.get("SSEGURO") != null)
							? (BigDecimal) datos_poliza_est.get("SSEGURO")
							: null;

					AbstractDispatchAction.topPila(request, "SSEGURO", SSEGURO_EST);
					AbstractDispatchAction.topPila(request, "PTABLAS", "EST");
				} catch (Exception e) {
					logger.error("Error en el servicio Axisctr020Service - m�todo m_form", e);
					thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
							Constantes.MENSAJE_ERROR);
				}
			} else {
				Map datosPoliza = (Map) request.getAttribute("datos_poliza");
				if (!isEmpty(datosPoliza)) {
					AbstractDispatchAction.topPila(request, "SSEGURO",
							new BigDecimal(String.valueOf(datosPoliza.get("SSEGURO"))));
					AbstractDispatchAction.topPila(request, "PTABLAS", "POL");
				}
			}
			// RCL 09/07/2013 - FI BUG 23860

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);

		}

	}

	public void m_imprimir_detalle_primas_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			logger.debug(AbstractDispatchAction.topPila(request, "SPRODUC"));
			BigDecimal SPRODUC = isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));

			if (isEmpty(CEMPRES))
				CEMPRES = usuario.getCempres();

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), whoami(this).toUpperCase(),
							"DETALLE_PRIMAS", new BigDecimal(0));

			logger.debug(map);
			String CLISTADO = "";
			String CMODO = "DETALLE_PRIMAS";
			String PPARAMS = this.getHiddenCampoTextual(request, "PPARAMS");
			if (!isEmpty(map.get("PCURCONFIGSINF"))) {
				ArrayList listado = (ArrayList) map.get("PCURCONFIGSINF");
				if (listado.size() > 0) {
					HashMap mm = (HashMap) listado.get(0);
					CLISTADO = String.valueOf(mm.get("CMAP"));
					CMODO = String.valueOf(mm.get("TEVENTO"));
					PPARAMS = String.valueOf(mm.get("LPARAMS"));

				}

			}

			PPARAMS = "|SSEGURO:" + this.getHiddenCampoTextual(request, "SSEGURO") + "|CEMPRES:" + CEMPRES + "|NRIESGO:"
					+ this.getHiddenCampoTextual(request, "NRIESGO") + "|PTABLAS:"
					+ this.getHiddenCampoTextual(request, "PTABLAS") + "|CIDIOMA:" + usuario.getCidioma();

			map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(CEMPRES, whoami(this).toUpperCase(), CMODO,
							new BigDecimal(0), "|" + CLISTADO + "|", PPARAMS);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

				miDataObject.put("lstinforme", map.get("VTIMP"));
				miDataObject.put("resultado", map);
				ajax.rellenarPlAContenedorAjax(map);

			} else {
				miDataObject.put("resultado", map);
				ajax.rellenarPlAContenedorAjax(map);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	private String getInfoString(HttpServletRequest request) {
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

	private List dividirFranqPerCtipgru(List<HashMap> franquicias, int CTIPGRU) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			BigDecimal CTIPGRUobj = (BigDecimal) franq.get("CTIPVISGRUP");
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				franqdividides.add(OB_IAX_BONFRANSEG);
				objBorrar.add(OB_IAX_BONFRANSEG);
			}

		}

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
			franquicias.remove(OB_IAX_BF_PROACTGRUP);
		}

		return franqdividides;

	}

	private List dividirFranqLibres(List<HashMap> franquicias, List<HashMap> franquiciasgar) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			logger.debug("franq-->" + franq);
			BigDecimal CTIPGRUPSUBGRUP = (BigDecimal) franq.get("CTIPGRUPSUBGRUP");
			if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 3) {
				franqdividides.add(OB_IAX_BONFRANSEG);
				objBorrar.add(OB_IAX_BONFRANSEG);
			} else {
				if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 4) {
					objBorrar.add(OB_IAX_BONFRANSEG);
					franquiciasgar.add(OB_IAX_BONFRANSEG);
				}

			}
		}
		logger.debug("franqdividides-->" + franqdividides);
		for (HashMap OB_IAX_BONFRANSEG : objBorrar) {
			franquicias.remove(OB_IAX_BONFRANSEG);
		}

		return franqdividides;

	}

	private void m_getRiesgo(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_getRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			// BUG: 0027953/0151258 - JSV 21/08/2013 - INI

			Map mapmod = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
			logger.debug("------ auto recuperado:" + mapmod);
			mapmod = (Map) tratarRETURNyMENSAJES(request, mapmod);
			request.setAttribute("TMODALIDAD", mapmod.get("TMODALIDAD"));

			// BUG: 0027953/0151258 - JSV 21/08/2013 - INI

			PAC_IAX_DATOSCTASEGURO pacIaxDatosCtaSeguro = new PAC_IAX_DATOSCTASEGURO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);

			logger.debug(map);

			Map OB_IAX_RIESGOS = (Map) tratarRETURNyMENSAJES(request, map, false);

			if (!isEmpty(OB_IAX_RIESGOS)) {

				if (!isEmpty(OB_IAX_RIESGOS.get("BONFRANSEG"))) {
					List franquicias = (List) OB_IAX_RIESGOS.get("BONFRANSEG");
					// INI IAXIS-4936
					franquicias = obtenerDetCtipMin(franquicias, request);
					// FIN IAXIS-4936
					List franqtecnicas = null;
					List bonusmalus = null;
					List franqtecnicaslibres = null;
					List bonusmaluslibres = null;
					List franqgartecnicaslibres = new ArrayList();
					List franqgarlibres = new ArrayList();
					List bonusmalusgarlibres = new ArrayList();
					if (!isEmpty(franquicias)) {
						franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
						franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas
																											// libres
						bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
						bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
					}

					OB_IAX_RIESGOS.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));

					OB_IAX_RIESGOS.put("franqtecnicas", franqtecnicas);
					OB_IAX_RIESGOS.put("franqtecnicaslibres", franqtecnicaslibres);
					OB_IAX_RIESGOS.put("bonusmalus", bonusmalus);
					OB_IAX_RIESGOS.put("bonusmaluslibres", bonusmaluslibres);
					OB_IAX_RIESGOS.put("franqgartecnicaslibres", franqgartecnicaslibres);
					OB_IAX_RIESGOS.put("franqgarlibres", franqgarlibres);
					OB_IAX_RIESGOS.put("bonusmalusgarlibres", bonusmalusgarlibres);

				}

				if (!isEmpty(OB_IAX_RIESGOS.get("PREGUNTAS"))) {
					List preguntas = (List) OB_IAX_RIESGOS.get("PREGUNTAS");
					List pregQuestSalut = null;
					List pregDespeses = null;
					if (!isEmpty(preguntas)) {
						pregQuestSalut = dividirPregPerCtipgru(preguntas, 1); // Constantes.CTIPGRU_QUESTIONARI_SALUT);
						pregDespeses = dividirPregPerCtipgru(preguntas, 2); // Constantes.CTIPGRU_DESPESES);
					}

					OB_IAX_RIESGOS.put("pregQuestSalut", pregQuestSalut);
					OB_IAX_RIESGOS.put("pregDespeses", pregDespeses);

					logger.debug("PREG RISC-->" + OB_IAX_RIESGOS.get("PREGUNTAS"));
				}

				// Consultar la DESCRIPCI�N del BENEFICIARIO
				Map BENEFICIARIO = (Map) OB_IAX_RIESGOS.get("BENEFICIARIO");

				if (!isEmpty(BENEFICIARIO)) {
					String DESCRIPCION = "";
					BigDecimal CTIPO = (BigDecimal) BENEFICIARIO.get("CTIPO");
					// Poner una cosa u otra en funci�n de si tiene SCLABEN
					if (new BigDecimal(1).equals(CTIPO)) {
						DESCRIPCION = (String) BENEFICIARIO.get("TCLAESP");
					} else if (new BigDecimal(2).equals(CTIPO)) {
						DESCRIPCION = (String) BENEFICIARIO.get("TCLABEN");
					}
					DESCRIPCION = DESCRIPCION.replaceAll("(\r\n|\r|\n|\n\r)", "<br>");
					BENEFICIARIO.put("DESCRIPCION", DESCRIPCION);
				}

				List rentasIrregulares = this.dbLeeRentasIrregulares(request, usuario, NRIESGO);
				logger.debug("rentas-->" + rentasIrregulares);

				java.util.Date d = new java.util.Date();
				java.sql.Date sqlDate = new java.sql.Date(d.getTime());

				/* RKV: bug 9342 */
				Map datoseconomicos = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO, NRIESGO,
						sqlDate);
				logger.debug(datoseconomicos);

				Map OB_IAX_DATOSECONOMICOS = (Map) tratarRETURNyMENSAJES(request, datoseconomicos, false);
				OB_IAX_RIESGOS.put("OB_IAX_DATOSECONOMICOS", OB_IAX_DATOSECONOMICOS);

				/* RKV: bug 9342 */
				Map movctaseguros = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS(SSEGURO,
						NRIESGO, null, null);
				logger.debug(movctaseguros);

				List OB_IAX_DATOSCTASEGURO = (List) movctaseguros.get("RETURN");
				OB_IAX_RIESGOS.put("T_IAX_DATOSCTASEGURO", OB_IAX_DATOSCTASEGURO);

				Map movctaseguros_shw = pacIaxDatosCtaSeguro
						.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTENERMOVIMIENTOS_SHW(SSEGURO, NRIESGO, null, null);
				logger.debug(movctaseguros_shw);

				List OB_IAX_DATOSCTASEGURO_SHW = (List) movctaseguros_shw.get("RETURN");
				OB_IAX_RIESGOS.put("T_IAX_DATOSCTASEGURO_SHW", OB_IAX_DATOSCTASEGURO_SHW);
				// A�adir BENEFICIARIO en LISTA
				List OB_IAX_BENEFICIARIOS = new ArrayList();
				OB_IAX_BENEFICIARIOS.add(BENEFICIARIO);
				OB_IAX_RIESGOS.put("OB_IAX_BENEFICIARIOS", OB_IAX_BENEFICIARIOS);

				List garantiasEntrada = this.getGarantiasSelecEntrada((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List garantiasSortida = this.getGarantiasSelecSalida((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List garantiasGeneral = this.getGarantiasSelecGenerales((List) OB_IAX_RIESGOS.get("GARANTIAS"));

				request.getSession().setAttribute("garantiasEntrada",
						((garantiasEntrada == null) ? new ArrayList() : garantiasEntrada));
				request.getSession().setAttribute("garantiasSortida",
						((garantiasSortida == null) ? new ArrayList() : garantiasSortida));
				request.getSession().setAttribute("garantiasGeneral",
						((garantiasGeneral == null) ? new ArrayList() : garantiasGeneral));

				// logger.debug("garantiasGeneral:"+garantiasGeneral);
				ArrayList partidas = new ArrayList();
				ArrayList garantiasg = new ArrayList();
				// INI - IAXIS-15524 - JLTS - 12/08/2021
				ArrayList creaseg = new ArrayList();
				// FIN - IAXIS-15524 - JLTS - 12/08/2021
				for (int i = 0; i < garantiasGeneral.size(); i++) {
					HashMap garantia = (HashMap) garantiasGeneral.get(i);
					HashMap gar = (HashMap) garantia.get("OB_IAX_GARANTIAS");

					BigDecimal CPARTIDA = new BigDecimal("0");

					if (!isEmpty(gar.get("CPARTIDA")))
						CPARTIDA = new BigDecimal(String.valueOf(gar.get("CPARTIDA")));

					if (CPARTIDA.intValue() != 1)
						garantiasg.add(garantia);
					else
						partidas.add(garantia);

					// INI - IAXIS-15524 - JLTS - 12/08/2021
					// AbstractDispatchAction.topPila(request, "SPRODUC",
					// request.getSession().getAttribute("SPRODUC"));
					BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("SPRODUC");
					BigDecimal PCACTIVI = (BigDecimal) request.getSession().getAttribute("CACTIVI");
//BigDecimal SPRODUC=isEmpty((String)AbstractDispatchAction.topPila(request, "SPRODUC"))?null:new BigDecimal((String)AbstractDispatchAction.topPila(request, "SPRODUC"));
					// BigDecimal PCACTIVI=(BigDecimal)AbstractDispatchAction.topPila(request,
					// "CACTIVI");
					BigDecimal PCGARANT;
					PCGARANT = new BigDecimal(String.valueOf(gar.get("CGARANT")));
					if (!isEmpty(PCGARANT)) {
						Map map1 = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPROD__F_GET_GESTIONGARAN(SPRODUC, PCACTIVI, PCGARANT);
						logger.debug(map1);
						Map OB_IAX_PRODGARDATGESTION = (Map) tratarRETURNyMENSAJES(request, map1);
						BigDecimal CREASEG = new BigDecimal(String.valueOf(OB_IAX_PRODGARDATGESTION.get("CREASEG")));
						if (CREASEG.intValue() == 1) {
							logger.debug(OB_IAX_PRODGARDATGESTION);
							creaseg.add(PCGARANT);
						}
					}
				}
				if (!isEmpty(creaseg))
					request.getSession().setAttribute("creaseg", creaseg);
				// FIN - IAXIS-15524 - JLTS - 12/08/2021
				request.getSession().setAttribute("garantias_ori", garantiasg);
				garantiasg = reestructurarGarantias(request, (List<HashMap>) garantiasg);

				request.getSession().setAttribute("garantiasGeneral",
						((garantiasg == null) ? new ArrayList() : garantiasg));

				if (!isEmpty(partidas)) {
					logger.debug("lipartidas=" + partidas);
					request.getSession().setAttribute("num_partidas", partidas.size());
					partidas = reestructurarGarantias(request, partidas);
					// request.getSession().setAttribute("axisctr_partidas", ((lipartidas==null)?new
					// ArrayList():lipartidas));
					request.getSession().setAttribute("axisctr_partidas", partidas);
				}

				if (!isEmpty(rentasIrregulares)) {
					request.getSession().setAttribute("rentasIrregulares",
							((rentasIrregulares == null) ? new ArrayList() : rentasIrregulares));

				}

			}

			request.setAttribute("OB_IAX_RIESGOS", OB_IAX_RIESGOS);

			// Para testear qu� hay dentro...
			// logger.debug(ConversionUtil.printAsXML(OB_IAX_RIESGOS, "OB_IAX_RIESGOS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_getRiesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	// INI IAXIS-4936
	/**
	 * Agrega al HashMap que contiene los deducibles el DetValores del tipo de
	 * importe
	 * 
	 * @param franquicias
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private List obtenerDetCtipMin(List<HashMap> franquicias, HttpServletRequest request) throws Exception {

		for (HashMap OB_IAX_BONFRANSEG : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BONFRANSEG.get("OB_IAX_BONFRANSEG");
			logger.debug(franq);
			BigDecimal CtipMin = new BigDecimal(franq.get("CIMPMIN").toString());

			Map map = null;
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_GETDESCRIPVALORES(new BigDecimal(1104), CtipMin);
			String CTIPMIN = (String) tratarRETURNyMENSAJES(request, map, false);
			franq.put("CTIPMIN", CTIPMIN);
		}

		return franquicias;
	}

	// FIN IAXIS-4936
	public static ArrayList reestructurarGarantias(HttpServletRequest request, List<HashMap> li) {
		boolean situat = false;

		ArrayList resultat = new ArrayList();
		try {

			for (int i = 0; i < li.size(); i++) {
				HashMap garantia = (HashMap) li.get(i);
				HashMap gar = (HashMap) garantia.get("OB_IAX_GARANTIAS");
				if (!isEmpty(gar)) {
					// logger.debug(gar.get("CGARPADRE"));
					BigDecimal CGARPADRE = isEmpty(gar.get("CGARPADRE")) ? new BigDecimal(0)
							: new BigDecimal(String.valueOf(gar.get("CGARPADRE")));
					BigDecimal CVISIBLE = isEmpty(gar.get("CVISIBLE")) ? new BigDecimal(1)
							: new BigDecimal(String.valueOf(gar.get("CVISIBLE")));
					BigDecimal CGARANT = new BigDecimal(String.valueOf(gar.get("CGARANT")));
					if (CGARPADRE.intValue() == 0 && CVISIBLE.intValue() == 1) {
						// resultat.add((HashMap)li.get(i));
						resultat.add(garantia);
						mirarquipenja(CGARANT.intValue(), li, resultat, gar);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultat;

	}

	private static void mirarquipenja(int cgarant, List li, ArrayList resultat, HashMap garPadre) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");

			BigDecimal CGARPADRE = isEmpty(garh.get("CGARPADRE")) ? new BigDecimal(0)
					: new BigDecimal(String.valueOf(garh.get("CGARPADRE")));
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));
			BigDecimal CVISIBLE = isEmpty(garh.get("CVISIBLE")) ? new BigDecimal(1)
					: new BigDecimal(String.valueOf(garh.get("CVISIBLE")));

			if (CGARPADRE.intValue() == cgarant && CVISIBLE.intValue() == 1) {

				if (isEmpty(garPadre.get("T_IAX_HIJOS"))) {
					ArrayList hijos = new ArrayList();
					hijos.add(garantia);
					garPadre.put("T_IAX_HIJOS", hijos);
				} else {
					ArrayList hhh = (ArrayList) garPadre.get("T_IAX_HIJOS");
					if (!existe(hhh, CGARANT))
						hhh.add(garantia);
				}

				// resultat.add(garantia);
				mirarquipenja(CGARANT.intValue(), li, resultat, garh);
			}

		}
	}

	private static boolean existe(ArrayList li, BigDecimal pCGARANT) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garantia = (HashMap) li.get(i);
			HashMap garh = (HashMap) garantia.get("OB_IAX_GARANTIAS");
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));

			if (CGARANT.intValue() == pCGARANT.intValue())
				return true;
		}

		return false;

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAX_PREGUNTAS.get("OB_IAX_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			// logger.debug("CTIPGRUobj-->"+CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAX_PREGUNTAS);
				objBorrar.add(OB_IAX_PREGUNTAS);
			}

			// logger.debug("PREG-->"+OB_IAX_PREGUNTAS);
		}

		for (HashMap OB_IAX_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAX_PREGUNTAS);
		}

		return pregdividides;

	}

	/**
	 * M�todo que se encarga de: 1-Recuperar los motivos de retenci�n de un
	 * movimiento de p�liza en cuesti�n. 2-Cargar el �ltimo movimiento del
	 * multiregistro (el que aparece primero), para poder recuperar tmotret para la
	 * primera l�nea de resumen de la pantalla (Motivo retenci�n: XXXXXXXX)
	 * 
	 * @param request
	 * @param thisAction
	 */
	private void m_getMotivos(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_getMotivos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata2 = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map = null;
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (isEmpty(SPRODUC))
				SPRODUC = new BigDecimal(String.valueOf(request.getSession().getAttribute("SPRODUC")));

			// PSU
			Map parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PSU", SPRODUC);
			logger.debug(parproducto);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {

				Map col_psu = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(SSEGURO, NMOVIMI, null, "POL");
				logger.debug("col_psu:" + col_psu);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
					request.setAttribute("PTESTPOL_HIST", col_psu.get("P_TESTPOL"));
					request.setAttribute("PCESTPOL_HIST", col_psu.get("P_CESTPOL"));
					request.setAttribute("PTPSUS_HIST", col_psu.get("P_TPSUS"));
					request.setAttribute("CNIVELBPM_HIST", col_psu.get("P_CNIVELBPM"));
					request.setAttribute("TNIVELBPM_HIST", col_psu.get("P_TNIVELBPM"));
					request.setAttribute("POBPSU_RETENIDAS_HIST", col_psu.get("POBPSU_RETENIDAS"));
					request.setAttribute("TIPODATOS_HIST", "PSU");

				}

				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

				BigDecimal pP_NVERSION = getCampoNumerico(request, "NVERSION");

				// leeHistPsu=pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO,
				// pP_NVERSION, NRIESGO, NMOVIMI, null);
				leeHistPsuRet = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSU_RETENIDAS(SSEGURO, null, NRIESGO, NMOVIMI);

//				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsu)).intValue() == 0) {
//
//					List b = (List) leeHistPsu.get("P_THIS_PSUCONTROLSEG");
//
//					formdata2.put("P_TPSUCONTRSEG_HIST", b);
//
//				}
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, leeHistPsuRet)).intValue() == 0) {

					List b = (List) leeHistPsuRet.get("P_THIS_PSU_RETENIDAS");

					formdata2.put("P_TPSU_RETEN_HIST", b);

				}

			} else {

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(SSEGURO, NMOVIMI);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("mvtretencion", map.get("RETURN"));

				// Cargar siempre el �ltimo movimiento para cargar siempre en el resumen su
				// TMOTRET y para no cargarlo en sesi�n
				BigDecimal NMOVIMI_ULTIMO = getCampoNumerico(request, "NMOVIMI_ULTIMO");
				String tmotret = null;

				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MOTRETENMOV(SSEGURO, NMOVIMI_ULTIMO);
				logger.debug(map);
				List ultimo_movimiento = (List) tratarRETURNyMENSAJES(request, map, false);

				if (!isEmpty(ultimo_movimiento)) {
					try {
						tmotret = (String) ((Map) ((Map) ultimo_movimiento.get(0)).get("OB_IAX_POLMVTRETEN"))
								.get("TMOTRET");
					} catch (Exception e) {
						tmotret = null;
					}
				}
				request.setAttribute("tmotret", tmotret);
			}

			parproducto = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("GESTION_IR", SPRODUC);
			logger.debug(parproducto);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, parproducto)).intValue() == 1) {
				// Historico inspecciones riesgo del movimiento.
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_GET_ORD_INSPEC_MOD_CONSULTA(SSEGURO,
						isEmpty(NMOVIMI) ? new BigDecimal(1) : NMOVIMI, NRIESGO);
				logger.debug("Historico inspecciones movimiento : " + map);
				List l_aux = (List) (tratarRETURNyMENSAJES(request, map));
				int size = l_aux == null ? 0 : l_aux.size();
				if (size > 0) {
					request.setAttribute("INSPECCION_RIESGO_HIST", l_aux);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_getMotivos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de: 1-Recuperar los motivos de retenci�n de un
	 * movimiento de p�liza en cuesti�n. 2-Cargar el �ltimo movimiento del
	 * multiregistro (el que aparece primero), para poder recuperar tmotret para la
	 * primera l�nea de resumen de la pantalla (Motivo retenci�n: XXXXXXXX)
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_deletemov(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_deletemov");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map map = null;
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV_REGISTRO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI_REGISTRO");
			BigDecimal ACCION = new BigDecimal("3"); // Valor fijo en el caso de rechazo.
			String TOBSERV = getCampoTextual(request, "TOBSERV_REGISTRO");
			PAC_IAX_RECHAZO pacIaxRechazo = new PAC_IAX_RECHAZO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pacIaxRechazo.ejecutaPAC_IAX_RECHAZO__RECHAZO(SSEGURO, CMOTMOV, NMOVIMI, ACCION, TOBSERV);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_deletemov", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo que graba un cobro de recibo (especificado en el modal AXCTR023) a BD.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cobrar_recibo(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_cobrar_recibo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CTIPCOB = getCampoNumerico(request, "CTIPCOB");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			// TODO: Ojo, si el CTIPBAN = 2 no representa al IBAN, no funcionar�! Ojo al
			// cambiarlo!
			if (!isEmpty(CBANCAR) && new BigDecimal(2).equals(CTIPBAN)) {
				// Si es IBAN, quitar guiones y espacios en blanco
				CBANCAR = CBANCAR.replaceAll("-", "").replaceAll(" ", "").trim();
			}

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_COBROREC(CTIPCOB, NRECIBO, CBANCAR, CTIPBAN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_cobrar_recibo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	/**
	 * M�todo que comprueba si la p�liza est� en situaci�n de editar suplementos, en
	 * caso que as� sea, realiza una llamada a BD para saber a qu� pantalla hemos de
	 * saltar para editar suplementos. Devuelve un ActionForward conteniendo la
	 * pantalla a saltar.
	 * 
	 * @param request
	 * @param thisAction
	 * @return ActionForward - Un ActionForward que encapsula el action de la
	 *         pantalla a saltar.
	 */
	public void m_inicializar_suplemento(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_inicializar_suplemento");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map resultadoFinal = new HashMap();
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			AbstractDispatchAction.topPila(request, "CMOTMOV", CMOTMOV);
			logger.debug("CMOTMOV: " + AbstractDispatchAction.topPila(request, "CMOTMOV"));
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			logger.debug("SSEGURO: " + SSEGURO);
			logger.debug("CMODO: " + CMODO);
			Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_INICIALIZAR_SUPLEMENTO(SSEGURO, CMOTMOV, CMODO);
			logger.debug(map);
			BigDecimal initSuplementosReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

			if (new BigDecimal(0).equals(initSuplementosReturn)) {

				BigDecimal PMODFEFE = (BigDecimal) map.get("PMODFEFE");
				java.sql.Date PFEFECTO = (java.sql.Date) map.get("PFEFECTO");

				resultadoFinal.put("PMODFEFE", PMODFEFE);
				resultadoFinal.put("PFEFECTO", PFEFECTO);

				ajax.guardarContenidoFinalAContenedorAjax(resultadoFinal);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr20Service - m�todo m_inicializar_suplemento", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}

	}
	// 22839 ini m_permitesuplemento

	public void m_ajax_permitesuplem(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_ajax_permitesuplem");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO_HIJO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr24Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// 22839 fin

	/**
	 * M�todo que comprueba si la p�liza est� en situaci�n de editar suplementos, en
	 * caso que as� sea, realiza una llamada a BD para saber a qu� pantalla hemos de
	 * saltar para editar suplementos. Devuelve un ActionForward conteniendo la
	 * pantalla a saltar.
	 * 
	 * @param request
	 * @param thisAction
	 * @return ActionForward - Un ActionForward que encapsula el action de la
	 *         pantalla a saltar.
	 */
	public ActionForward m_editar_suplemento(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_editar_suplemento");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		List SECACTIVA = null;

		try {
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			BigDecimal CMOTMOV_ALT = getCampoNumerico(request, "CMOTMOV_ALT");
			java.sql.Date PFEFECTO;
			PFEFECTO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "PFEFECTO"));
			logger.debug("1 :." + PFEFECTO);

			if (isEmpty(PFEFECTO))
				PFEFECTO = AxisBaseService.stringToSqlDate(String.valueOf(request.getParameter("PFEFECTO")));
			logger.debug("2 :." + PFEFECTO);

			if (isEmpty(PFEFECTO)) {
				try {
					PFEFECTO = new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd")
							.parse(String.valueOf(request.getParameter("PFEFECTO"))).getTime());
					logger.debug("3 :." + PFEFECTO);
				} catch (Exception e) {
					try {
						PFEFECTO = new java.sql.Date(new SimpleDateFormat("yyyy/MM/dd")
								.parse(String.valueOf(request.getParameter("PFEFECTO"))).getTime());
						logger.debug("4 :." + PFEFECTO);
					} catch (Exception ex) {
						PFEFECTO = null;
					}
				}

			}

			logger.debug("5 :." + PFEFECTO);
			AbstractDispatchAction.topPila(request, "FEFECTO_SUPLEMENTO", PFEFECTO);
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			String CMODO = new String();
			logger.debug("------ CMOTMOV_ALT=" + CMOTMOV_ALT);
			if (isEmpty(CMOTMOV_ALT))
				CMODO = "SUPLEMENTO_" + CMOTMOV;
			else
				CMODO = "SUPLEMENTO_" + CMOTMOV_ALT;

			logger.debug("------ CMODO=" + CMODO);
			// BUG 724 - 23/01/2018 - JLTS se adidionan los ultimos 4 campos a la funcion
			// con null
			Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_EDITARSUPLEMENTO(SSEGURO, PFEFECTO, CMOTMOV);
			logger.debug(map);
			// CONF-274-25/11/2016-JLTS- Ini
			AbstractDispatchAction.topPila(request, "PESTSSEGURO", map.get("PESTSSEGURO"));
			// CONF-274-25/11/2016-JLTS- Fin

			BigDecimal SSEGURO_OUT = null;
			if (!isEmpty(map.get("PESTSSEGURO")))
				SSEGURO_OUT = new BigDecimal(String.valueOf(map.get("PESTSSEGURO")));

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map, false))) {

				// Bug 28263/153355 - 01/10/2013 - AMC
				BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
				BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
				BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
				logger.debug("---> NNUMCASO:" + NNUMCASO + " NCASO_BPM:" + NCASO_BPM + " NSOLICI_BPM:" + NSOLICI_BPM);

				if (!isEmpty(NNUMCASO) || (!isEmpty(NCASO_BPM) && isEmpty(NSOLICI_BPM))
						|| (!isEmpty(NCASO_BPM) && !isEmpty(NSOLICI_BPM))) {
					map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_SET_CASOBPM(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
					logger.debug(map);
				}

				// Ejecutar FORM_WIZARD para saber d�nde saltar
				// Recuperar SPRODUC de Datos P�liza, que hemos puesto en sessi�n.
				BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("SPRODUC");

				// Bug 23860 18/12/2012
				BigDecimal NCERTIF = (BigDecimal) request.getSession().getAttribute("NCERTIF");
				// Fin Bug 23860 18/12/2012

				// request.getSession().removeAttribute("SPRODUC");
				// request.getSession().removeAttribute("NCERTIF");
				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, "AXISCTR020",
								"BT_SUPLE_" + CMOTMOV.toString(), Constantes.SIGUIENTE);
				logger.debug(map);

				String PANTALLA_DESTINO = (String) tratarRETURNyMENSAJES(request, map, false);
				// Nos devolver� la pantalla destino, ej: AXCTR006;

				if (!isEmpty(PANTALLA_DESTINO)) {
					// Apilaremos primero el formdata...
					AbstractDispatchAction.topPila(request, "formdata_axisctr020", formdata);

					// Preparar Map de puente con los datos a pasar al siguiente flujo
					// 1- Secci�n donde queremos editar el suplemento
					if (!isEmpty(request.getSession().getAttribute("PASSTOPPILA")) && !isEmpty(
							(List) ((Map) request.getSession().getAttribute("PASSTOPPILA")).get("SECACTIVA"))) {
						SECACTIVA = (List) ((Map) request.getSession().getAttribute("PASSTOPPILA")).get("SECACTIVA");
					} else {
						SECACTIVA = new ArrayList();
					}
					SECACTIVA.add(getCampoTextual(request, "SECACTIVA"));
					// 2-Cargamos el passtoppila
					Map passTopPila = new HashMap();
					passTopPila.put("SECACTIVA", SECACTIVA);
					passTopPila.put("SPRODUC", SPRODUC);
					passTopPila.put("NCERTIF", NCERTIF);
					passTopPila.put("CMODO", CMODO);
					passTopPila.put("CMOTMOV", CMOTMOV);
					passTopPila.put("NRIESGO", NRIESGO);
					passTopPila.put("SSEGURO", SSEGURO);
					passTopPila.put("SSEGURO_OUT", SSEGURO_OUT); // ara el sseguro es el de la taula d'estudi
					passTopPila.put("FEFECTO_SUPLEMENTO", PFEFECTO);
					request.setAttribute(Constantes.PASSTOPPILA, passTopPila);
					request.getSession().setAttribute("PASSTOPPILA", passTopPila);

					// Construimos un ActionForward para la pantalla de destino y lo devolvemos
					String formRumbo = "";

					File fichero = new File(
							Constantes.REALPATH + "/WEB-INF/jsp/axis/" + PANTALLA_DESTINO.toLowerCase() + ".jsp"); // AXIS-WLS1SERVER-Ready

					if (!fichero.exists()) {
						fichero = new File(
								Constantes.REALPATH + "/WEB-INF/jsp/modal/" + PANTALLA_DESTINO.toLowerCase() + ".jsp"); // AXIS-WLS1SERVER-Ready
						if (fichero.exists())
							formRumbo = "modal_" + PANTALLA_DESTINO.toLowerCase() + ".do?operation=form"; // AXIS-WLS1SERVER-Ready

					} else
						formRumbo = "axis_" + PANTALLA_DESTINO.toLowerCase() + ".do?operation=form"; // AXIS-WLS1SERVER-Ready

					formRumbo = "/" + formRumbo;
					return new ActionForward(formRumbo);
				} else {

					logger.debug("edit temp");
					// Limpiar temporales
					pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES();
				}
			}

			return null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_editar_suplemento", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return null;
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias

			// Bug 23860 18/12/2012
			AbstractDispatchAction.topPila(request, "NCERTIF", request.getSession().getAttribute("NCERTIF"));
			// Fin 23860 bug 18/12/2012

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	/**
	 * M�todo invocado al clicar el bot�n Emitir. Emite la propuesta y, si ha ido
	 * bien, esconde el bot�n Emitir.
	 * 
	 * @param request
	 */
	public void m_emitirPropuesta(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal PCPROPAGASUPL = getCampoNumerico(request, "PCPROPAGASUPL");
			logger.debug("++++ PCPROPAGASUPL" + PCPROPAGASUPL);
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal SEGURO = (new BigDecimal(String.valueOf(datos_poliza.get("SSEGURO"))));
			logger.debug("++++ SEGURO" + SEGURO);
			BigDecimal NMOVIMI = isEmpty(datos_poliza.get("NMOVIMI")) ? null
					: new BigDecimal(String.valueOf(datos_poliza.get("NMOVIMI")));

			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_SET_PROPAGA_SUPLEMENTO("EST", SEGURO, NMOVIMI, null, PCPROPAGASUPL);
			logger.debug("+++++PROPAGA SUPLEMENTO EMITIR: " + m);

			Map map = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_EMITIRPROPUESTA();
			logger.debug(map);

			Map PILA = (HashMap) request.getSession().getAttribute("PASSTOPPILA");

			/* recuperar el SSEGURO */
			BigDecimal SSEGURO = (BigDecimal) PILA.get("SSEGURO");

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);

			Map hayError = new HashMap();
			hayError.put("hayError", map.get("RETURN"));

			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);
			RESULTADO.add(hayError);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// Si ha ido bien, ya no mostramos el bot�n Emitir, por lo que eliminamos las
			// vars de sesi�n correspondientes
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			if (new BigDecimal(0).equals(RETURN)) {
				request.getSession().removeAttribute("axisctr020_suplementosPendientes");
				request.getSession().removeAttribute("PASSTOPPILA");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr24Service - m�todo m_emitirPropuesta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que cancela la edici�n de suplementos y carga la pantalla s�lo en modo
	 * consulta de p�liza
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_limpiar_suplemento(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_limpiar_suplemento");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES();

			request.getSession().removeAttribute("PASSTOPPILA");
			request.getSession().removeAttribute("axisctr020_suplementosPendientes");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_limpiar_suplemento", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}

	}

	/**
	 * M�todo invocado al volver del cambio de flujo. Se encarga de comprobar si hay
	 * suplementos pendientes de emisi�n, y en dicho caso, mostrar el bot�n de
	 * Emitir en la JSP.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_volver(HttpServletRequest request, Axisctr020Action thisAction) {
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

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_RETENERPROPUESTA();
			logger.debug(map);

			BigDecimal SSEGURO = (BigDecimal) map.get("OSSEGURO");

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);
			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			// ajax.rellenarPlAContenedorAjax (map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_emitirPropuesta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.configSuplementos(request);
		}

	}

	public void m_actualizarestadosolicitud(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_actualizarestadosolicitud");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CPREGUN = getCampoNumerico(request, "CPREGUN");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

			Map map = new PAC_IAX_GESTIONPROPUESTA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONPROPUESTA__F_SET_ACTUALIZARESTADO_SUPL(SSEGURO, NMOVIMI, NRIESGO, CMOTMOV,
							CGARANT, CPREGUN, CESTADO);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_actualizarestadosolicitud", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}

	}

	private List dbLeeRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(NRIESGO);
		logger.debug("Map rentas irregulares---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	private void initParametrosRentasIrregulares(BigDecimal SPRODUC, HttpServletRequest request, UsuarioBean usuario)
			throws Exception {

		// BigDecimal SPRODUC =
		// (BigDecimal)AbstractDispatchAction.topPila(request, "SPRODUC");
		List lista_anyos = this.dbLeeAnyosRentasIrregulares(request, usuario, SPRODUC);
		logger.debug("Map de lista_anyos---------------------------------------->" + lista_anyos);
		request.getSession().setAttribute("axisctr_lista_anyos", lista_anyos);
	}

	private List dbLeeAnyosRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(SPRODUC);
		logger.debug("Map de lista_anyos BBDD---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * M�todo que obtiene las garantias de entrada a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecEntrada(List lista_garantias) {

		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && ctipo.intValue() == 3) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecSalida(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 5 || ctipo.intValue() == 8 || ctipo.intValue() == 9)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�as
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecGenerales(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo.intValue() != 5 && ctipo.intValue() != 8 && ctipo.intValue() != 9 && ctipo.intValue() != 3
						&& ctipo.intValue() != 4) {

					BigDecimal ctipgar = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
							.get("CTIPGAR");

					if (!isEmpty(ctipgar) && ctipgar.intValue() != 8) {
						lista_aux.add(((HashMap) lista_garantias.get(i)));
					}

				}

			}
		}
		return lista_aux;
	}

	public void m_consultarDetRecibos(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_consultarDetRecibos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Push de los datos necesarios a la pila
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NRECIBO", request.getParameter("NRECIBO"));

			request.setAttribute("buscar", "true");
			request.setAttribute("NRECIBO", request.getParameter("NRECIBO"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_consultarDetRecibos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	public void m_volverDetRec(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_volverDetRec");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
			// formdata.put("NRECIBO", bigDecimalToString ((BigDecimal)
			// thisAction.removeTopPila(request, "NRECIBO")));
			thisAction.removeTopPila(request, "NRECIBO");

			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_volverDetRec", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
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
	public void m_gestion_cobros(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_gestion_cobros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String CFORM = getCampoTextual(request, "CFORM");

			if (!isEmpty(CFORM)) {
				request.getSession().setAttribute("subpantalla_mdl", "DSP_RECIBOS");
				thisAction.topPila(request, "formdata_axisctr020", formdata);

				// Para modificar recibos mediante flujo externo, necesitamos obligatoriamente
				// estas dos l�neas para
				// que la pantallas de gesti�n de cobros las puedan procesar
				thisAction.topPila(request, "acceso_externo", true);
				thisAction.topPila(request, "pantalla_origen", "axisctr020");
				request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

				thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
						new ActionForward("/axis_" + CFORM.trim().toLowerCase() + ".do?operation=init"));
				thisAction.topPila(request, Constantes.SALTARORIGENACTION,
						new ActionForward("/axis_axisctr020.do?operation=volverGestionCobros"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_gestion_cobros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	/**
	 * M�todo para cobrar por host directamente de un recibo cargado en la pantalla.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cobro_host(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_cobro_host");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().setAttribute("subpantalla_mdl", "DSP_RECIBOS");

			thisAction.topPila(request, "formdata_axisctr020", formdata);

			// Para modificar recibos mediante flujo externo, necesitamos obligatoriamente
			// estas dos l�neas para
			// que la pantallas de gesti�n de cobros las puedan procesar
			thisAction.topPila(request, "acceso_externo", true);
			thisAction.topPila(request, "pantalla_origen", "axisctr020");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

			thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axisadm016.do?operation=init"));
			thisAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisctr020.do?operation=volverGestionCobros"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_cobro_host", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
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
	public void m_volverGestionCobros(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_volverGestionCobros");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axisctr020 = (Map) thisAction.removeTopPila(request, "formdata_axisctr020");

			// Borramos los par�metros que inicialmente se enviaron a las pantallas de
			// gesti�n de cobro
			thisAction.removeTopPila(request, "acceso_externo");
			thisAction.removeTopPila(request, "pantalla_origen");

			request.setAttribute("subpantalla", "DSP_RECIBOS");

			if (!AxisBaseService.isEmpty(formdata_axisctr020))
				formdata.putAll(formdata_axisctr020);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_volverGestionCobros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	/**
	 * M�todo para cambiar el estado de los suplementos diferidos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public
	// Bug 10024-11/05/2009-AMC
	void m_cambioestdiferir(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_cambioestdiferir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		List SECACTIVA = null;
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTMOV = getCampoNumerico(request, "PCMOTMOV");
			BigDecimal PCESTADO = getCampoNumerico(request, "PCESTADO");

			// Inicializaci�n para que habra la secci�n al volver
			String seccion = getCampoTextual(request, "SECACTIVA");
			logger.debug("----------------------- seccion:" + seccion);

			if (!isEmpty(request.getSession().getAttribute("PASSTOPPILA"))
					&& !isEmpty((List) ((Map) request.getSession().getAttribute("PASSTOPPILA")).get("SECACTIVA"))) {
				SECACTIVA = (List) ((Map) request.getSession().getAttribute("PASSTOPPILA")).get("SECACTIVA");
			} else {
				SECACTIVA = new ArrayList();
			}
			SECACTIVA.add(getCampoTextual(request, "SECACTIVA"));
			// 2-Cargamos el passtoppila
			Map passTopPila = new HashMap();
			passTopPila.put("SECACTIVA", SECACTIVA);

			request.setAttribute(Constantes.PASSTOPPILA, passTopPila);
			request.getSession().setAttribute("PASSTOPPILA", passTopPila);

			Map m = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SUPLEMENTOS__F_ANULAR_ABRIR_DIFERIDO(CMOTMOV, SSEGURO, PCESTADO);
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_cambioestdiferir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			AbstractDispatchAction.topPila(request, "SPRODUC", request.getSession().getAttribute("SPRODUC"));
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	public void m_actualiza_evoluprov(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_actualiza_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSEGURO = this.getHiddenCampoNumerico(request, "PSSEGURO");
			String TABLA = " ";
			if (PSSEGURO == null)
				PSSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal PNESCENA = this.getHiddenCampoNumerico(request, "PNESCENA");
			if (PNESCENA == null)
				PNESCENA = getCampoNumerico(request, "NESCENA");

			if (PNESCENA == null) {
				if (!isEmpty(PSSEGURO)) {
					Map mesce = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(PSSEGURO,
							TABLA);
					BigDecimal minesce = (BigDecimal) tratarRETURNyMENSAJES(request, mesce, false);
					PNESCENA = minesce;
				}
			}

			formdata.put("NESCENA", PNESCENA);
			formdata.put("SSEGURO", PSSEGURO);
			// System.out.println("PSSEGURO = "+PSSEGURO+" PNESCENA = "+PNESCENA);

			if (!isEmpty(PSSEGURO)) {
				Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA,
						PNESCENA);
				List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
				formdata.put("evoluprovmatseg", evolu);
				ajax.guardarContenidoFinalAContenedorAjax(evolu);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_actualiza_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr020Service.class));
		}
	}

	public void m_actualizar_provisiones(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_actualizar_provisiones");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			/* Cargar provisiones garantias */
			Map map = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEPROVISIONESGAR(SSEGURO);
			logger.debug(map);
			List garantias = (List) ajax.rellenarPlAContenedorAjax(map);

			/* Cargar provisiones garantias */
			Map map2 = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEPROVISIONPOL(SSEGURO);
			logger.debug(map2);
			Map provpol = (Map) ajax.rellenarPlAContenedorAjax(map2);

			HashMap mapdef = new HashMap();
			mapdef.put("GARANPROV", garantias);
			mapdef.put("PROVPOL", provpol);

			ajax.guardarContenidoFinalAContenedorAjax(mapdef);
			formdata.put("GARANDEF", mapdef);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_actualizar_provisiones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.configSuplementos(request);
		}
	}

	public void m_consultarSiniestro(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_consultarSiniestro");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIES);
			formdata.put("NSINIESselected", NSINIES);
			request.setAttribute("NSINIESselected", NSINIES);
			thisAction.topPila(request, "formdata_axisctr020", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_consultarSiniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volverSinies(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_volverSinies");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", (String) thisAction.removeTopPila(request, "NSINIES"));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_volverSinies", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
	// bug 22839 ini

	public void m_consultarBajacertif(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_consultarBajacertif");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO_BAJA");
			String SSEGURO_PADRE = (String) formdata.get("SSEGURO");

			formdata.remove("SSEGURO");
			formdata.put("SSEGURO", SSEGURO);
			try {
				formdata.put("CAMPO_SSEG", new BigDecimal(SSEGURO_PADRE));
			} catch (Exception e) {
				formdata.put("CAMPO_SSEG", new BigDecimal("0"));
			}

			request.removeAttribute("SSEGURO");
			request.setAttribute("SSEGURO", SSEGURO);
			formdata.put("CMODO_ORI", AbstractDispatchAction.topPila(request, "CMODO"));
			thisAction.topPila(request, "CMODO", "CONSULTA");
			thisAction.topPila(request, "formdata_axisctr020", formdata);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_consultarBajacertif", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volverBajacertif(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_volverBajacertif");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// UsuarioBean
		// usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata_axisctr020 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr020");
		if (!isEmpty(formdata_axisctr020)) {
			BigDecimal SSEGURO = (BigDecimal) formdata_axisctr020.get("CAMPO_SSEG");
			formdata.remove("SSEGURO");
			formdata.put("SSEGURO", SSEGURO); // ponemos el padre
			AbstractDispatchAction.topPila(request, "CMODO", (String) formdata_axisctr020.get("CMODO_ORI"));
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}
	// bug 22839 fin

	public void m_consultarCuadros(HttpServletRequest request, Axisctr020Action thisAction) {
		logger.debug("Axisctr020Service m_consultarCuadros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			request.setAttribute("subpantalla", "DSP_SALDODEUTOR");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_consultarCuadros", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.configSuplementos(request);
		}
	}

	public void m_ajax_cargar_impagados(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_ajax_cargar_impagados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal MOVREC = getCampoNumerico(request, "MOVREC");

			Map map = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS(SSEGURO, NRECIBO, MOVREC);
			logger.debug("ejecutaPAC_IAX_ADM__F_GET_IMPAGADOS: " + map);

			if (!isEmpty(map)) {
				List listaImpagados = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(listaImpagados);
			}
			request.getSession().removeAttribute("cargaHost");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_ajax_cargar_impagados", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrar_agenda(HttpServletRequest request, Axisctr020Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal IDOBS = getCampoNumerico(request, "IDOBS");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_AGENDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(IDOBS);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el m�todo axisctr020Action m_borrar_agenda", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo invocado al clicar el bot�n Emitir Colectivo. Emite la propuesta y, si
	 * ha ido bien, esconde el bot�n Emitir.
	 * 
	 * @param request
	 */
	public void m_emitirPropuestaColectiva(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_emitirPropuestaColectiva");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			// EMITIR PROPUESTA //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EMITIR_COL_ADMIN(SSEGURO);
			logger.debug(m);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(m, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);

			Map hayError = new HashMap();
			hayError.put("hayError", m.get("RETURN"));

			// si es 0 se continua con la emisi�n, si es 1 NO.
			hayError.put("continuaEmitir", m.get("PCONTINUAEMITIR"));

			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);
			RESULTADO.add(hayError);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_emitirPropuestaColectiva", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo invocado al clicar el bot�n Abrir Suplemento. Emite la propuesta y, si
	 * ha ido bien, esconde el bot�n Emitir.
	 * 
	 * @param request
	 */
	public void m_abrirSuplemColectivo(HttpServletRequest request) {
		logger.debug("Axisctr020Service m_abrirSuplemColectivo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			// EMITIR PROPUESTA //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ABRIR_SUPLEMENTO(SSEGURO);
			logger.debug(m);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(m, new String[] { "OSSEGURO" });

			/* Rellenar SSEGURO a contenedor AJAX */
			Map OSSEGURO = new HashMap();
			OSSEGURO.put("OSSEGURO", SSEGURO);

			Map hayError = new HashMap();
			hayError.put("hayError", m.get("RETURN"));

			List RESULTADO = new ArrayList();
			RESULTADO.add(OSSEGURO);
			RESULTADO.add(hayError);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_abrirSuplemColectivo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axissin006Action thisAction) {
		logger.debug("Axisctr020Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_CON");
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO_CON");
			logger.debug(SPERSON);
			formdata.put("SSEGURO_axisctr020", SSEGURO);
			thisAction.topPila(request, "formdata_axisctr020", formdata);
			return SPERSON;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			return SPERSON;

		}
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_per(HttpServletRequest request, Axissin006Action thisAction) {
		logger.debug("Axissin006Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisctr020 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisctr020");

			if (!this.isEmpty(formdata_axisctr020)) {
				formdata.putAll(formdata_axisctr020);
				formdata.put("SSEGURO_CON", formdata.get("SSEGURO_axisctr020"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_valdocrequerida(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_ajax_valdocrequerida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// Recuperem l'sseguro
			////////////////// DATOS POLIZA //////////////
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap datPoliza = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + datPoliza);
			tratarRETURNyMENSAJES(request, datPoliza);
			Map datos_poliza = (Map) datPoliza.get("RETURN");
			BigDecimal pSSEGURO = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;

			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : new BigDecimal(1);
			BigDecimal pNMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			BigDecimal pSPRODUC = (datos_poliza.get("SPRODUC") != null) ? (BigDecimal) datos_poliza.get("SPRODUC")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;

			PAC_IAX_DOCREQUERIDA pacIaxrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE(pSSEGURO, pNMOVIMI,
					pSPRODUC, pCACTIVI);
			logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_AVISO_DOCREQ_PENDIENTE: " + map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_enviarCorreo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
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
					.ejecutaPAC_IAX_SUPLEMENTOS__F_PREGUNTA_PROPAGA_SUPLEMENTO("EST", SSEGURO, NMOVIMI, null, null);
			logger.debug(m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarcombos(HttpServletRequest request, Axisctr020Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		if (!isEmpty(SSEGURO)) {
			try {
				PAC_IAX_OBTENERDATOS pac_axis_listValores = new PAC_IAX_OBTENERDATOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Escenarios de proyeccion
				Map map = pac_axis_listValores.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(SSEGURO, null);
				listValores.put("tipEscen", (List) tratarRETURNyMENSAJES(request, map, false));
				formdata.put("listValores", listValores);
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}
	}

	// BUG 26373 ini

	public void m_ajax_update_datos_contacto(HttpServletRequest request) {
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		logger.debug("Axisctr020Service AJAX ajax_update_datos_contacto");
		AjaxContainerService ajax = new AjaxContainerService(request);
		try {
			BigDecimal NPOLIZA = getCampoNumerico(request, "POLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "CERTIF");
			BigDecimal SPERSON = getCampoNumerico(request, "PERSONA");
			BigDecimal TPERSON = getCampoNumerico(request, "TIPOPER");
			BigDecimal MAIL = getCampoNumerico(request, "MAIL");
			BigDecimal TEL = getCampoNumerico(request, "TEL");

			// Grabar a BD
			Map grabarDatosContacto = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GUARDADATOSCONTACTO(NPOLIZA,
					NCERTIF, SPERSON, TPERSON, MAIL, TEL);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_ajax_updated_datos_contacto", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// BUG 26373 fin
	public void cargarContragarantias(HttpServletRequest request, Map formdata) {
		logger.debug("Axisctr009Service argarContragarantias");
		try {

			Map mapContragaran = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			logger.debug(mapContragaran);
			List listaContragaran = (ArrayList) tratarRETURNyMENSAJES(request, mapContragaran);

			formdata.put("T_IAX_CONTRAGARAN", listaContragaran);
			request.setAttribute("T_IAX_CONTRAGARAN", mapContragaran.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service  -  argarContragarantias", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	// INICIO CONF-172
	public void m_guardar_supl(HttpServletRequest request) {
		logger.debug("Axisctr024Service m_emitirPropuesta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARPROPUESTA(new BigDecimal(1));

			ajax.rellenarPlAContenedorAjax(map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			// ajax.rellenarPlAContenedorAjax (map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr020Service - m�todo m_emitirPropuesta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
	// FIN CONF-172
}
