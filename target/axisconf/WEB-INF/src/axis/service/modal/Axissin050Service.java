//Revision:# Nj+i6chcig2MuBnwSfyh8A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin050Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin050Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_siniestros = new PAC_IAX_SINIESTROS(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		// Tipo Reserva
		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPRES();
		listValores.put("tipo_reserva", (List) tratarRETURNyMENSAJES(request, map));

		// Calculo
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL();
		listValores.put("tipo_manual", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1047));
		listValores.put("tipo_gasto", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
		List monedas = (List) tratarRETURNyMENSAJES(request, map);
		listValores.put("lista_monedas", monedas);
		monedas = null;
		logger.debug("monedas -----------------> " + map);

		request.setAttribute("listValores", listValores);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin050Action thisAction) {
		logger.debug("Axissin050Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formattingNumericValues(request);

			BigDecimal SPRODUC = isEmpty(getCampoNumerico(request, "SPRODUC"))
					? new BigDecimal(request.getParameter("SPRODUC"))
					: getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = isEmpty(getCampoNumerico(request, "CACTIVI"))
					? new BigDecimal(request.getParameter("CACTIVI"))
					: getCampoNumerico(request, "CACTIVI");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));

			logger.debug(CCAUSIN);
			logger.debug(CMOTSIN);
			logger.debug(NSINIES);
			logger.debug(SSEGURO);
			logger.debug(NRIESGO);

			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");

			BigDecimal pctipgas = getCampoNumerico(request, "CTIPGAS");

			String pnsinies = isEmpty(getCampoTextual(request, "NSINIES")) ? String.valueOf(NSINIES)
					: getCampoTextual(request, "NSINIES");

			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
			if (pntramit == null) {
				pntramit = (BigDecimal) getCampoNumerico(request, "indexTramitacio");
			}
			BigDecimal pctipres = getCampoNumerico(request, "CTIPRES");

			BigDecimal pnmovres = getCampoNumerico(request, "NMOVRES");
			BigDecimal pcgarant = isEmpty(getCampoNumerico(request, "CGARANT")) ? getCampoNumerico(request, "VGARANTIA")
					: getCampoNumerico(request, "CGARANT");
			logger.debug("-----> garantia:" + pcgarant);

			String modo = getCampoTextual(request, "MODO");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			ArrayList tinfo = (ArrayList) request.getSession().getAttribute("listaRes");

			if (!isEmpty(pnsinies) && !isEmpty(pntramit) && (request.getAttribute("OK") != "KO")) {

				/* ***************** Recuperamos la lista de siniestros ******************* */
				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(SPRODUC, CACTIVI, pnsinies);
				logger.debug(map);

				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVA_MULTIPLE(pnsinies, pntramit,
						pctramit);
				ArrayList listReservas = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
				request.getSession().setAttribute("listaRes", listReservas);
				ArrayList lista_res_final = null;
				if (!isEmpty(listReservas)) {
					Map mapa_reservas = (Map) listReservas.get(0);
					Map cuerpo = (Map) mapa_reservas.get("OB_IAX_SIN_TRAMI_RESERVA_MULT");
					lista_res_final = (ArrayList) cuerpo.get("RESERVAS");
				}
				request.getSession().setAttribute("listReservas", lista_res_final);
				logger.debug("RESEVRAS::::::: " + map);
				// request.getSession().setAttribute ("axisctr_reservas", listReservas);

				/* ************************************************************************ */

				ArrayList tinfo2 = (ArrayList) request.getSession().getAttribute("listaRes");

				logger.debug("llega::::::: ");

				for (int i = 0; i < tinfo2.size(); i++) {
					HashMap mm = (HashMap) tinfo2.get(i);

					// Map mapa_reservas = (Map)tinfo.get(0);
					Map cuerpo = (Map) mm.get("OB_IAX_SIN_TRAMI_RESERVA_MULT");
					ArrayList lista_res_final2 = (ArrayList) cuerpo.get("RESERVAS");

					BigDecimal CTIPRES_obj = (BigDecimal) cuerpo.get("CTIPRES");

					for (int j = 0; j < lista_res_final2.size(); j++) {
						HashMap mm2 = (HashMap) lista_res_final2.get(j);
						HashMap OB_IAX_SIN_TRAMI_RESERVA = (HashMap) mm2.get("OB_IAX_SIN_TRAMI_RESERVA");
						BigDecimal CGARANT_obj = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("CGARANT");
						// BigDecimal NMOVRES_obj = (BigDecimal)OB_IAX_SIN_TRAMI_RESERVA.get("NMOVRES");
						// ;

						BigDecimal IRESERVA = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IRESERVA");
						BigDecimal IPREREC = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPREREC");
						BigDecimal ICAPRIE = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("ICAPRIE");
						BigDecimal IPENALI = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPENALI");
						BigDecimal ICAPGAR = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("ICAPGAR");

						OB_IAX_SIN_TRAMI_RESERVA.put("IRESERVA_ORIG", IRESERVA);
						OB_IAX_SIN_TRAMI_RESERVA.put("ICAPRIE_ORIG", ICAPRIE);
						OB_IAX_SIN_TRAMI_RESERVA.put("IPREREC_ORIG", IPREREC);
						OB_IAX_SIN_TRAMI_RESERVA.put("IPENALI_ORIG", IPENALI);
						OB_IAX_SIN_TRAMI_RESERVA.put("ICAPGAR_ORIG", ICAPGAR);

					}
				}

				/* ************************************************************************ */

			}
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");

			request.getSession().setAttribute("indexTramitacio", indexTramitacio);
			formdata.put("indexTramitacio", indexTramitacio);
			formdata.put("SSEGURO", SSEGURO);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CACTIVI", CACTIVI);
			formdata.put("NSINIES", NSINIES);
			formdata.put("NRIESGO", NRIESGO);
			formdata.put("MODO", modo);
			formdata.put("NMOVRES", pnmovres);
			formdata.put("CTIPRES", pctipres);
			formdata.put("CTIPGAS", pctipgas);

			cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin050Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axissin050Action thisAction) {

		logger.debug("Axissin050Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formattingNumericValues(request);

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			String entra = "no";
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
				BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");

				ArrayList tinfo = (ArrayList) request.getSession().getAttribute("listaRes");

				logger.debug(tinfo);

				// for (int a=0;a<)

				for (int i = 0; i < tinfo.size(); i++) {
					HashMap mm = (HashMap) tinfo.get(i);

					// Map mapa_reservas = (Map)tinfo.get(0);
					Map cuerpo = (Map) mm.get("OB_IAX_SIN_TRAMI_RESERVA_MULT");
					ArrayList lista_res_final = (ArrayList) cuerpo.get("RESERVAS");

					BigDecimal CTIPRES = (BigDecimal) cuerpo.get("CTIPRES");

					for (int j = 0; j < lista_res_final.size(); j++) {
						HashMap mm2 = (HashMap) lista_res_final.get(j);

						HashMap OB_IAX_SIN_TRAMI_RESERVA = (HashMap) mm2.get("OB_IAX_SIN_TRAMI_RESERVA");
						BigDecimal CGARANT = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("CGARANT");

						formattingNumericValues(request);
						String NSINIES = getCampoTextual(request, "NSINIES");
						BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

						BigDecimal NMOVRES = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("NMOVRES");
						Map map2 = new HashMap();
						if (!isEmpty(NSINIES) && !isEmpty(NTRAMIT) && !isEmpty(CTIPRES) && !isEmpty(NMOVRES)) {

							Map map = new PAC_IAX_SINIESTROS((Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVA(NSINIES, NTRAMIT, CTIPRES, NMOVRES, null);
							logger.debug("---> reserva:" + map);

							map2 = (Map) map.get("OB_RESERVA");

						}

						BigDecimal CTIPGAS = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("CTIPGAS"))
								? ((!isEmpty(map2.get("CTIPGAS"))) ? new BigDecimal(String.valueOf(map2.get("CTIPGAS")))
										: null)
								: getCampoNumerico(request, "CTIPGAS");
						String TTIPRES = isEmpty((String) OB_IAX_SIN_TRAMI_RESERVA.get("TTIPRES"))
								? ((!isEmpty(map2.get("TTIPRES"))) ? String.valueOf(map2.get("CTIPGAS")) : null)
								: getCampoTextual(request, "TTIPRES");
						// BigDecimal CGARANT =
						// isEmpty((BigDecimal)OB_IAX_SIN_TRAMI_RESERVA.get("CGARANT")) ?
						// ((!isEmpty(map2.get("CGARANT"))) ? new BigDecimal(
						// String.valueOf(map2.get("CGARANT"))) : null) : getCampoNumerico(request,
						// "CGARANT");

						BigDecimal CCALRES = new BigDecimal("1");

						Date FMOVRES = stringToSqlDate(getCampoTextual(request, "FMOVRES"));
						String CMONRES = isEmpty(OB_IAX_SIN_TRAMI_RESERVA.get("CMONRES"))
								? ((!isEmpty(map2.get("CMONRES"))) ? String.valueOf(map2.get("CMONRES")) : null)
								: getCampoTextual(request, "CMONRES");

						// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
						// 24786
						// BigDecimal ICAPRIE = isEmpty(getCampoNumerico(request, "ICAPRIE")) ?
						// ((!isEmpty(map2.get("ICAPRIE"))) ? new BigDecimal(
						// String.valueOf(map2.get("ICAPRIE"))) : null) : getCampoNumerico(request,
						// "ICAPRIE");
						BigDecimal ICAPRIE = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("ICAPRIE");

						// BigDecimal IPENALI = isEmpty(getCampoNumerico(request, "IPENALI")) ?
						// ((!isEmpty(map2.get("IPENALI"))) ? new BigDecimal(
						// String.valueOf(map2.get("IPENALI"))) : null) : getCampoNumerico(request,
						// "IPENALI");
						BigDecimal IPENALI = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPENALI");
						BigDecimal IPENALI_ORIG = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPENALI_ORIG");

						// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
						// 24786
						// BigDecimal IRESERVA = isEmpty(getCampoNumerico(request, "IRESERVA")) ?
						// ((!isEmpty(map2.get("IRESERVA"))) ? new BigDecimal(
						// String.valueOf(map2.get("IRESERVA"))) : null) : getCampoNumerico(request,
						// "IRESERVA");
						BigDecimal IRESERVA = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IRESERVA");
						BigDecimal IRESERVA_ORIG = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IRESERVA_ORIG");

						BigDecimal IFRANQ = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IFRANQ");

						if (isEmpty(IRESERVA)) {
							ICAPRIE = IRESERVA;
							IPENALI = IRESERVA;
						}

						if (isEmpty(ICAPRIE)) {
							ICAPRIE = IRESERVA;
							if (!isEmpty(IPENALI))
								IRESERVA = ICAPRIE.subtract(IPENALI);
							else
								IRESERVA = ICAPRIE;
						}

						if (isEmpty(IRESERVA) && !isEmpty(ICAPRIE) && !isEmpty(IPENALI)) {
							IRESERVA = ICAPRIE.subtract(IPENALI);
						}

						BigDecimal IPAGO = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPAGO"))
								? ((!isEmpty(map2.get("IPAGO"))) ? new BigDecimal(String.valueOf(map2.get("IPAGO")))
										: null)
								: getCampoNumerico(request, "IPAGO");
						BigDecimal IINGRESO = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IINGRESO"))
								? ((!isEmpty(map2.get("IINGRESO")))
										? new BigDecimal(String.valueOf(map2.get("IINGRESO")))
										: null)
								: getCampoNumerico(request, "IINGRESO");
						// BigDecimal IRECOBRO =
						// isEmpty((BigDecimal)OB_IAX_SIN_TRAMI_RESERVA.get("IRECOBRO")) ?
						// ((!isEmpty(map2.get("IRECOBRO"))) ? new BigDecimal(
						// String.valueOf(map2.get("IRECOBRO"))) : null) : getCampoNumerico(request,
						// "IRECOBRO");
						BigDecimal IRECOBRO = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IRECOBRO");
						BigDecimal IRECOBRO_ORIG = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IRECOBRO_ORIG");

						// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
						// 24786
						// BigDecimal IPREREC = isEmpty(getCampoNumerico(request, "IPREREC")) ?
						// ((!isEmpty(map2.get("IPREREC"))) ? new BigDecimal(
						// String.valueOf(map2.get("IPREREC"))) : null) : getCampoNumerico(request,
						// "IPREREC");
						BigDecimal IPREREC = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPREREC");
						BigDecimal IPREREC_ORIG = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("IPREREC_ORIG");

						String fresini = isEmpty(OB_IAX_SIN_TRAMI_RESERVA.get("FRESINI"))
								? ((!isEmpty(map2.get("FRESINI"))) ? String.valueOf(map2.get("FRESINI")) : null)
								: getCampoTextual(request, "FRESINI");
						String vfresini = isEmpty(OB_IAX_SIN_TRAMI_RESERVA.get("VFRESINI"))
								? ((!isEmpty(map2.get("VFRESINI"))) ? String.valueOf(map2.get("VFRESINI")) : null)
								: getCampoTextual(request, "VFRESINI");

						String ORIGEN = "AXISSIN050";

						Date FRESINI = stringToSqlDate((fresini == null) ? vfresini : fresini);/* Si */

						Date FRESFIN = stringToSqlDate((String) OB_IAX_SIN_TRAMI_RESERVA.get("FRESFIN")); /* Si */
						Date FULTPAG = stringToSqlDate((String) OB_IAX_SIN_TRAMI_RESERVA.get("FULTPAG"));

						BigDecimal SIDEPAG = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("SIDEPAG"))
								? ((!isEmpty(map2.get("SIDEPAG"))) ? new BigDecimal(String.valueOf(map2.get("SIDEPAG")))
										: null)
								: getCampoNumerico(request, "SIDEPAG");
						BigDecimal SPROCES = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("SPROCES"))
								? ((!isEmpty(map2.get("SPROCES"))) ? new BigDecimal(String.valueOf(map2.get("SPROCES")))
										: null)
								: getCampoNumerico(request, "SPROCES");

						Date FCONTAB = stringToSqlDate((String) OB_IAX_SIN_TRAMI_RESERVA.get("FCONTAB"));

						HashMap ma = this.f_Get_Avisos(request, this.whoami(this));
						BigDecimal pRETURNa = (BigDecimal) this.tratarRETURNyMENSAJES(request, ma);
						request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

						if (pRETURNa != null && pRETURNa.intValue() != 1) {

							BigDecimal SPRODUC = isEmpty((BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("SPRODUC"))
									? new BigDecimal(request.getParameter("SPRODUC"))
									: getCampoNumerico(request, "SPRODUC");
							PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
									(Connection) request.getAttribute(Constantes.DB01CONN));
							Map mmoneda = (Map) pac_iaxpar_productos
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

							logger.debug("mmoneda:" + mmoneda);
							if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
									&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0)
								CMONRES = isEmpty(CMONRES) ? String.valueOf(mmoneda.get("PCMONINT")) : CMONRES;

							if (((!isEmpty(IRESERVA) && !isEmpty(IRESERVA_ORIG))
									&& (IRESERVA.intValue() != IRESERVA_ORIG.intValue()))
									|| ((!isEmpty(IPREREC) && !isEmpty(IPREREC_ORIG))
											&& (IPREREC.intValue() != IPREREC_ORIG.intValue()))
									|| (!isEmpty(IRESERVA) && isEmpty(IRESERVA_ORIG))
									|| (isEmpty(IRESERVA) && !isEmpty(IRESERVA_ORIG))
									|| (!isEmpty(IPREREC) && isEmpty(IPREREC_ORIG))
									|| (isEmpty(IPREREC) && !isEmpty(IPREREC_ORIG)))

							{

								Map map = new PAC_IAX_SINIESTROS((Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(NSINIES, NTRAMIT,
												CTIPRES, TTIPRES, NMOVRES, CGARANT, CCALRES, FMOVRES, CMONRES, IRESERVA,
												IPAGO, IINGRESO, IRECOBRO, ICAPRIE, IPENALI, FRESINI, FRESFIN, FULTPAG,
												SIDEPAG, SPROCES, FCONTAB, IPREREC, CTIPGAS, new String("RESER"),
												ORIGEN, IFRANQ, null, // pPNDIAS
												new BigDecimal(1), // pPCMOVRES
												null, // pPITOTIMP
												null, // pPPIVA
												null, // pPPRETENC
												null, // pPPRETEIVA
												null, // pPPRETEICA
												null, // pPIVA_CTIPIND
												null, // pPRETENC_CTIPIND
												null, // pPRETEIVA_CTIPIND
												null, // pPRETEICA_CTIPIND
												null, // pPITOTRET
												BigDecimal.ZERO); // SOLIDARIDAD

								logger.debug(map);

								if (!isEmpty(map)) {

									BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

									logger.debug(map);
									logger.debug(resultado);
									if (resultado.intValue() == 0) {
										request.setAttribute("OK", "OK"); // OK No ha habido error

									} else {
										entra = "si";
										request.setAttribute("OK", "KO"); // ERROR

									}
								}
							}

						}

					}
				}

				if (entra == "no") {

					// joan Bug 0024964
					String pCTRAMITAD = null;
					Map map = new PAC_IAX_SINIESTROS((Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);

					BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

					logger.debug(map);
					logger.debug(resultado);
					if (resultado.intValue() == 0) {
						request.setAttribute("OK", "OK"); // OK No ha habido error

					} else {
						request.setAttribute("OK", "KO"); // ERROR

					}
				} else {
					request.setAttribute("OK", "KO"); // ERROR

				}

			}

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal SPRODUC = isEmpty(getCampoNumerico(request, "SPRODUC"))
					? new BigDecimal(request.getParameter("SPRODUC"))
					: getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = isEmpty(getCampoNumerico(request, "CACTIVI"))
					? new BigDecimal(request.getParameter("CACTIVI"))
					: getCampoNumerico(request, "CACTIVI");
			Map map = new PAC_IAX_SINIESTROS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(SPRODUC, CACTIVI, NSINIES);
			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin050Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga las garantias a partir del SSEGURO
	 * 
	 * @param request
	 */
	public void m_ajax_guardar_fila(HttpServletRequest request) {
		logger.debug("Axissin050Service m_ajax_garantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			/*
			 * ****************************************** llamada
			 * ****************************************
			 */

			formattingNumericValues(request);
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal vctipres = getCampoNumerico(request, "VCESTTRA");
			BigDecimal CTIPRES = (ctipres == null) ? vctipres : ctipres; /* Si */
			BigDecimal NMOVRES = getCampoNumerico(request, "NMOVRES");
			Map map2 = new HashMap();
			/*
			 * if(!isEmpty(NSINIES)&&!isEmpty(NTRAMIT)&&!isEmpty(CTIPRES)&&!isEmpty(NMOVRES)
			 * ){
			 * 
			 * Map map = new
			 * PAC_IAX_SINIESTROS((Connection)request.getAttribute(Constantes.DB01CONN)).
			 * ejecutaPAC_IAX_SINIESTROS__F_GET_RESERVA(NSINIES,NTRAMIT,CTIPRES,NMOVRES);
			 * logger.debug("---> reserva:"+map);
			 * 
			 * map2 = (Map)map.get("OB_RESERVA");
			 * 
			 * 
			 * 
			 * }
			 */

			// BigDecimal CTIPGAS = isEmpty(getCampoNumerico(request, "CTIPGAS")) ?
			// ((!isEmpty(map2.get("CTIPGAS"))) ? new BigDecimal(
			// String.valueOf(map2.get("CTIPGAS"))) : null) : getCampoNumerico(request,
			// "CTIPGAS");
			// String TTIPRES = isEmpty(getCampoTextual(request, "TTIPRES")) ?
			// ((!isEmpty(map2.get("TTIPRES"))) ? String.valueOf(map2.get("CTIPGAS")) :
			// null) : getCampoTextual(request, "TTIPRES");
			// BigDecimal CGARANT = isEmpty(getCampoNumerico(request, "CGARANT")) ?
			// ((!isEmpty(map2.get("CGARANT"))) ? new BigDecimal(
			// String.valueOf(map2.get("CGARANT"))) : null) : getCampoNumerico(request,
			// "CGARANT");

			BigDecimal CTIPGAS = getCampoNumerico(request, "CTIPGAS");
			String TTIPRES = getCampoTextual(request, "TTIPRES");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			BigDecimal CCALRES = new BigDecimal("1");

			Date FMOVRES = stringToSqlDate(getCampoTextual(request, "FMOVRES"));
			// String CMONRES = isEmpty(getCampoTextual(request, "CMONRES")) ?
			// ((!isEmpty(map2.get("CMONRES"))) ? String.valueOf(map2.get("CMONRES")) :
			// null) : getCampoTextual(request, "CMONRES");
			String CMONRES = getCampoTextual(request, "CMONRES");

			// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
			// 24786
			// BigDecimal ICAPRIE = isEmpty(getCampoNumerico(request, "ICAPRIE")) ?
			// ((!isEmpty(map2.get("ICAPRIE"))) ? new BigDecimal(
			// String.valueOf(map2.get("ICAPRIE"))) : null) : getCampoNumerico(request,
			// "ICAPRIE");
			BigDecimal ICAPRIE = getCampoNumerico(request, "ICAPRIE");

			// BigDecimal IPENALI = isEmpty(getCampoNumerico(request, "IPENALI")) ?
			// ((!isEmpty(map2.get("IPENALI"))) ? new BigDecimal(
			// String.valueOf(map2.get("IPENALI"))) : null) : getCampoNumerico(request,
			// "IPENALI");
			BigDecimal IPENALI = getCampoNumerico(request, "IPENALI");

			// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
			// 24786
			// BigDecimal IRESERVA = isEmpty(getCampoNumerico(request, "IRESERVA")) ?
			// ((!isEmpty(map2.get("IRESERVA"))) ? new BigDecimal(
			// String.valueOf(map2.get("IRESERVA"))) : null) : getCampoNumerico(request,
			// "IRESERVA");
			BigDecimal IRESERVA = getCampoNumerico(request, "IRESERVA");

			logger.debug("IRESERVA######=" + IRESERVA);
			logger.debug("ICAPRIE######=" + ICAPRIE);
			logger.debug("IPENALI######=" + IPENALI);

			if (isEmpty(IRESERVA)) {
				ICAPRIE = IRESERVA;
				IPENALI = IRESERVA;
			}

			if (isEmpty(ICAPRIE)) {
				ICAPRIE = IRESERVA;
				if (!isEmpty(IPENALI))
					IRESERVA = ICAPRIE.subtract(IPENALI);
				else
					IRESERVA = ICAPRIE;
			}

			if (isEmpty(IRESERVA) && !isEmpty(ICAPRIE) && !isEmpty(IPENALI)) {
				IRESERVA = ICAPRIE.subtract(IPENALI);
			}

			// BigDecimal IPAGO = isEmpty(getCampoNumerico(request, "IPAGO")) ?
			// ((!isEmpty(map2.get("IPAGO"))) ? new BigDecimal(
			// String.valueOf(map2.get("IPAGO"))) : null) : getCampoNumerico(request,
			// "IPAGO");
			// BigDecimal IINGRESO = isEmpty(getCampoNumerico(request, "IINGRESO")) ?
			// ((!isEmpty(map2.get("IINGRESO"))) ? new BigDecimal(
			// String.valueOf(map2.get("IINGRESO"))) : null) : getCampoNumerico(request,
			// "IINGRESO");
			// BigDecimal IRECOBRO = isEmpty(getCampoNumerico(request, "IRECOBRO")) ?
			// ((!isEmpty(map2.get("IRECOBRO"))) ? new BigDecimal(
			// String.valueOf(map2.get("IRECOBRO"))) : null) : getCampoNumerico(request,
			// "IRECOBRO");

			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal IINGRESO = getCampoNumerico(request, "IINGRESO");
			BigDecimal IRECOBRO = getCampoNumerico(request, "IRECOBRO");

			// ahora siempre quieren que se guarde el valor que ingresan, sea nulo o no. Bug
			// 24786
			// BigDecimal IPREREC = isEmpty(getCampoNumerico(request, "IPREREC")) ?
			// ((!isEmpty(map2.get("IPREREC"))) ? new BigDecimal(
			// String.valueOf(map2.get("IPREREC"))) : null) : getCampoNumerico(request,
			// "IPREREC");
			BigDecimal IPREREC = getCampoNumerico(request, "IPREREC");

			// String fresini = isEmpty(getCampoTextual(request, "FRESINI")) ?
			// ((!isEmpty(map2.get("FRESINI"))) ? String.valueOf(map2.get("FRESINI")) :
			// null) : getCampoTextual(request, "FRESINI");
			// String vfresini = isEmpty(getCampoTextual(request, "VFRESINI")) ?
			// ((!isEmpty(map2.get("VFRESINI"))) ? String.valueOf(map2.get("VFRESINI")) :
			// null) : getCampoTextual(request, "VFRESINI");

			String fresini = getCampoTextual(request, "FRESINI");
			String vfresini = getCampoTextual(request, "VFRESINI");

			String ORIGEN = getCampoTextual(request, "ORIGEN");

			Date FRESINI = stringToSqlDate((fresini == null) ? vfresini : fresini);/* Si */

			Date FRESFIN = stringToSqlDate(getCampoTextual(request, "FRESFIN")); /* Si */
			Date FULTPAG = stringToSqlDate(getCampoTextual(request, "FULTPAG"));

			// BigDecimal SIDEPAG = isEmpty(getCampoNumerico(request, "SIDEPAG")) ?
			// ((!isEmpty(map2.get("SIDEPAG"))) ? new BigDecimal(
			// String.valueOf(map2.get("SIDEPAG"))) : null) : getCampoNumerico(request,
			// "SIDEPAG");
			// BigDecimal SPROCES = isEmpty(getCampoNumerico(request, "SPROCES")) ?
			// ((!isEmpty(map2.get("SPROCES"))) ? new BigDecimal(
			// String.valueOf(map2.get("SPROCES"))) : null) : getCampoNumerico(request,
			// "SPROCES");

			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			Date FCONTAB = stringToSqlDate(getCampoTextual(request, "FCONTAB"));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal SPRODUC = isEmpty(getCampoNumerico(request, "SPRODUC"))
						? new BigDecimal(request.getParameter("SPRODUC"))
						: getCampoNumerico(request, "SPRODUC");
				PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

				logger.debug(mmoneda);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0)
					CMONRES = isEmpty(CMONRES) ? String.valueOf(mmoneda.get("PCMONINT")) : CMONRES;

				// request.getSession().setAttribute ("axisctr_reservas", listReservas);

				ArrayList tinfo = (ArrayList) request.getSession().getAttribute("listaRes");

				for (int i = 0; i < tinfo.size(); i++) {
					HashMap mm = (HashMap) tinfo.get(i);

					// Map mapa_reservas = (Map)tinfo.get(0);
					Map cuerpo = (Map) mm.get("OB_IAX_SIN_TRAMI_RESERVA_MULT");
					ArrayList lista_res_final = (ArrayList) cuerpo.get("RESERVAS");

					BigDecimal CTIPRES_obj = (BigDecimal) cuerpo.get("CTIPRES");

					for (int j = 0; j < lista_res_final.size(); j++) {
						HashMap mm2 = (HashMap) lista_res_final.get(j);

						HashMap OB_IAX_SIN_TRAMI_RESERVA = (HashMap) mm2.get("OB_IAX_SIN_TRAMI_RESERVA");
						BigDecimal CGARANT_obj = (BigDecimal) OB_IAX_SIN_TRAMI_RESERVA.get("CGARANT");
						// BigDecimal NMOVRES_obj = (BigDecimal)OB_IAX_SIN_TRAMI_RESERVA.get("NMOVRES");
						// ;

						if ((CTIPRES_obj.intValue() == CTIPRES.intValue())
								&& ((isEmpty(CGARANT_obj) && isEmpty(CGARANT))
										|| (CGARANT_obj.intValue() == CGARANT.intValue()))) {

							OB_IAX_SIN_TRAMI_RESERVA.put("NMOVRES", NMOVRES);
							OB_IAX_SIN_TRAMI_RESERVA.put("CCALRES", CCALRES);
							OB_IAX_SIN_TRAMI_RESERVA.put("FMOVRES", FMOVRES);
							OB_IAX_SIN_TRAMI_RESERVA.put("CMONRES", CMONRES);
							OB_IAX_SIN_TRAMI_RESERVA.put("IRESERVA", IRESERVA);
							OB_IAX_SIN_TRAMI_RESERVA.put("IPAGO", IPAGO);
							OB_IAX_SIN_TRAMI_RESERVA.put("IINGRESO", IINGRESO);
							OB_IAX_SIN_TRAMI_RESERVA.put("IRECOBRO", IRECOBRO);
							OB_IAX_SIN_TRAMI_RESERVA.put("ICAPRIE", ICAPRIE);
							OB_IAX_SIN_TRAMI_RESERVA.put("IPENALI", IPENALI);
							OB_IAX_SIN_TRAMI_RESERVA.put("FRESINI", FRESINI);
							OB_IAX_SIN_TRAMI_RESERVA.put("FRESFIN", FRESFIN);
							OB_IAX_SIN_TRAMI_RESERVA.put("FULTPAG", FULTPAG);
							OB_IAX_SIN_TRAMI_RESERVA.put("SIDEPAG", SIDEPAG);
							OB_IAX_SIN_TRAMI_RESERVA.put("SPROCES", SPROCES);
							OB_IAX_SIN_TRAMI_RESERVA.put("FCONTAB", FCONTAB);
							OB_IAX_SIN_TRAMI_RESERVA.put("IPREREC", IPREREC);
							OB_IAX_SIN_TRAMI_RESERVA.put("CTIPGAS", CTIPGAS);
							OB_IAX_SIN_TRAMI_RESERVA.put("ORIGEN", ORIGEN);

							/*
							 * CCALRES=null, IRECOBRO=null, TGARANT=Incendio i Afines, FRESINI=null,
							 * TMONRES=Unidad de Fomento, NSINIES=null, CSELECC=1, IPREREC_MONCIA=null,
							 * CMONRES=UF, FRESFIN=null, NMOVRES=null, IINGRESO_MONCIA=null, CMONRESINT=UF,
							 * FMOVRES=null, IPAGO_MONCIA=null, FULTPAG=null, FMODIFI=null, FCAMBIO=null,
							 * CUSUALT=null, IRESERVA=null, IPENALI_MONCIA=null, IVALACTUAL=null,
							 * IRECOBRO_MONCIA=null, ICAPRIE_MONCIA=null, FCONTAB=null, ICAPGAR=10000,
							 * TTIPRES=null, IPAGO=null, FALTA=null, SIDEPAG=null, IPREREC=null,
							 * CTIPGAS=null, IINGRESO=null, TCALRES=null, IRESERVA_MONCIA=null, NDIAS=null,
							 * SPROCES=null, CTIPRES=null, IPENALI=null, CGARANT=2003, NTRAMIT=null,
							 * TTIPGAS=null, CUSUMOD=null, ICAPRIE=null
							 */
						}

					}
				}

				/*
				 * Map map = new
				 * PAC_IAX_SINIESTROS((Connection)request.getAttribute(Constantes.DB01CONN)).
				 * ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(NSINIES, NTRAMIT,
				 * CTIPRES, TTIPRES, NMOVRES, CGARANT, CCALRES, FMOVRES, CMONRES, IRESERVA,
				 * IPAGO, IINGRESO, IRECOBRO, ICAPRIE, IPENALI, FRESINI, FRESFIN, FULTPAG,
				 * SIDEPAG, SPROCES, FCONTAB, IPREREC, CTIPGAS, new String("RESER"), ORIGEN);
				 */

				// NSINIES, NTRAMIT, CTIPRES, TTIPRES, NMOVRES, CGARANT, CCALRES, FMOVRES,
				// CMONRES, IRESERVA,IPAGO, IINGRESO,IRECOBRO, ICAPRIE, IPENALI,FRESINI,
				// FRESFIN,FULTPAG,SIDEPAG, SPROCES, FCONTAB, IPREREC, CTIPGAS, RESER, ORIGEN);

				// logger.debug(map);

				/*
				 * if (!isEmpty(map)) { BigDecimal resulGarantias =
				 * (BigDecimal)tratarRETURNyMENSAJES(request, map);
				 * ajax.rellenarPlAContenedorAjax(map);
				 * ajax.guardarContenidoFinalAContenedorAjax(map);
				 * //ajax.guardarErrorAContenedorAjax("Error");
				 * 
				 * 
				 * }
				 */
			}
			/*
			 * *****************************************************************************
			 * **************
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin050Service - m�todo m_ajax_guardar_fila", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
