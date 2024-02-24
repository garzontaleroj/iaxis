//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_REA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.mvc.control.modal.Axissin014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin014Service extends AxisBaseService {
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
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
		if (isEmpty(CGARANT) && !isEmpty(formdata.get("CGARANT")))
			CGARANT = new BigDecimal(String.valueOf(formdata.get("CGARANT")));
		else {
			if (!isEmpty(formdata.get("CGARANTx")))
				CGARANT = new BigDecimal(String.valueOf(formdata.get("CGARANTx")));
		}
		String NSINIES = this.getCampoTextual(request, "NSINIES");
		logger.debug("NSINIES-->" + NSINIES);
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		logger.debug("NTRAMIT-->" + NTRAMIT);

		PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal CEMPRES = usuario.getCempres();

		Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("IMPUESTOS_SAP"), CEMPRES);
		logger.debug("---> PAREMPRESA:" + m);
		if (!isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, m)))
				&& ((BigDecimal) tratarRETURNyMENSAJES(request, m)).equals(new BigDecimal(1))) {
			formdata.put("IMPUESTOS_SAP", ((BigDecimal) tratarRETURNyMENSAJES(request, m)));

			BigDecimal SPROFES = ((BigDecimal) ((Map) ((Map) formdata.get("PAGO")).get("DESTINATARI")).get("SPROFES"));

			if (SPROFES != null) {
				PAC_IAX_SIN_IMP_SAP pac_axis_sin_imp_sap = new PAC_IAX_SIN_IMP_SAP(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal CCONCEP = ((BigDecimal) ((Map) formdata.get("PAGO")).get("CCONPAG"));
				logger.debug((((Map) formdata.get("PAGO")).get("FORDPAG")));
				Timestamp f = ((Timestamp) ((Map) formdata.get("PAGO")).get("FORDPAG"));
				String fs = new SimpleDateFormat("dd/MM/yyyy").format(f);
				Date FORDPAG = this.stringToSqlDate(fs.substring(0, 10));
				logger.debug("FORDPAG" + FORDPAG);

				Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(NSINIES, NTRAMIT);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION devuelve:" + m1);
				List lstlocalizacion = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				selectFirstItem(lstlocalizacion, "NLOCALI", "NLOCALI", formdata);
				formdata.put("lstlocalizacion", lstlocalizacion);
				BigDecimal pPNLOCALI = getCampoNumerico(request, "NLOCALI");

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(CCONCEP, SPROFES,
						new BigDecimal(1), // IVA
						FORDPAG, NSINIES, NTRAMIT, pPNLOCALI);
				logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
				List lstPIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPIVA == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPIVA, "CTIPIND", "PIVA_CTIPIND", formdata);
				formdata.put("lstPIVA", lstPIVA);
				String pPIVA_SAP = getCampoTextual(request, "PIVA_SAP");
				logger.debug("++++pPIVA_SAP" + pPIVA_SAP);

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(CCONCEP, SPROFES,
						new BigDecimal(2), // RETEFUENTE
						FORDPAG, NSINIES, NTRAMIT, pPNLOCALI);
				logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
				List lstPRETENC = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPRETENC == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPRETENC, "CTIPIND", "PRETENC_CTIPIND", formdata);
				formdata.put("lstPRETENC", lstPRETENC);
				String pPRETENC_SAP = getCampoTextual(request, "PRETENC_SAP");
				logger.debug("++++pPRETENC_SAP" + pPRETENC_SAP);

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(CCONCEP, SPROFES,
						new BigDecimal(3), // RETEIVA
						FORDPAG, NSINIES, NTRAMIT, pPNLOCALI);
				logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
				List lstPRETEIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPRETEIVA == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPRETEIVA, "CTIPIND", "PRETEIVA_CTIPIND", formdata);
				formdata.put("lstPRETEIVA", lstPRETEIVA);
				String pPRETEIVA_SAP = getCampoTextual(request, "PRETEIVA_SAP");
				logger.debug("++++pPRETEIVA_SAP" + pPRETEIVA_SAP);

				if (pPNLOCALI != null) {
					m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(CCONCEP, SPROFES,
							new BigDecimal(4), // RETEICA
							FORDPAG, NSINIES, NTRAMIT, pPNLOCALI);
					logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
					List lstPRETEICA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
					if (lstPRETEICA == null) {
						formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
					}
					selectFirstItem(lstPRETEICA, "CTIPIND", "PRETEICA_CTIPIND", formdata);
					formdata.put("lstPRETEICA", lstPRETEICA);
					String pPRETEICA_SAP = getCampoTextual(request, "PRETEICA_SAP");
					logger.debug("++++pPRETEICA_SAP" + pPRETEICA_SAP);
				}

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(CCONCEP, SPROFES,
						new BigDecimal(5), // IPOCONSUMO
						FORDPAG, NSINIES, NTRAMIT, pPNLOCALI);
				logger.debug("ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF devuelve:" + m1);
				List lstPIPOCONSUMO = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPIPOCONSUMO == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPIPOCONSUMO, "CTIPIND", "PIPOCONSUMO_CTIPIND", formdata);
				formdata.put("lstPIPOCONSUMO", lstPIPOCONSUMO);
				String pPIPOCONSUMO_SAP = getCampoTextual(request, "PIPOCONSUMO_SAP");
				logger.debug("++++pPIPOCONSUMO_SAP" + pPIPOCONSUMO_SAP);

				BigDecimal PRETENC_CTIPIND = getCampoNumerico(request, "PRETENC_CTIPIND");
				BigDecimal PRETENC_SAP_NPORCENT = getCampoNumerico(request, "PRETENC_SAP_NPORCENT");

				BigDecimal PIVA_CTIPIND = getCampoNumerico(request, "PIVA_CTIPIND");
				BigDecimal PIVA_SAP_NPORCENT = getCampoNumerico(request, "PIVA_SAP_NPORCENT");

				BigDecimal PRETEIVA_CTIPIND = getCampoNumerico(request, "PRETEIVA_CTIPIND");
				BigDecimal PRETEIVA_SAP_NPORCENT = getCampoNumerico(request, "PRETEIVA_SAP_NPORCENT");

				BigDecimal PRETEICA_CTIPIND = getCampoNumerico(request, "PRETEICA_CTIPIND");
				BigDecimal PRETEICA_SAP_NPORCENT = getCampoNumerico(request, "PRETEICA_SAP_NPORCENT");

				BigDecimal PIPOCONSUMO_CTIPIND = getCampoNumerico(request, "PIPOCONSUMO_CTIPIND");
				BigDecimal PIPOCONSUMO_SAP_NPORCENT = getCampoNumerico(request, "PIPOCONSUMO_SAP_NPORCENT");

			} else {
				formdata.put("lstlocalizacion", null);
				formdata.put("lstPIVA", null);
				formdata.put("lstPRETENC", null);
				formdata.put("lstPRETEIVA", null);
				formdata.put("lstPRETEICA", null);
				formdata.put("lstPIPOCONSUMO", null);
			}

		}

		m = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CONCEPGARAN(CGARANT);
		logger.debug(m);
		ArrayList listaConceptos = (ArrayList) this.tratarRETURNyMENSAJES(request, m, false);
		formdata.put("listaConceptos", listaConceptos);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin014Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.info("Axissin014Service m_form");

		try {
			formattingNumericValues(request);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");
			/* Parametros */
			/* bug 0022108 NTRAMIT */
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal SIDEPAGRECOB = getCampoNumerico(request, "SIDEPAGRECOB");
			BigDecimal CTIPRES = getCampoNumerico(request, "CTIPRES");
			BigDecimal CTIPGAS = getCampoNumerico(request, "CTIPGAS");
			formdata.put("CTIPGAS", CTIPGAS);
			logger.debug("++++CTIPGAS: " + CTIPGAS);
			BigDecimal NMOVRES = getCampoNumerico(request, "NMOVRES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			String NSINIES = getCampoTextual(request, "NSINIES");
			String isNew = this.getCampoTextual(request, "isNew");
			String SECCION = getCampoTextual(request, "SECCION");

			java.sql.Date FPERINI = this.stringToSqlDate(getCampoTextual(request, "FPERINI_AUX"));
			logger.debug("FPERINI-->" + FPERINI);
			formdata.put("FPERINI", FPERINI);
			java.sql.Date FPERFIN = this.stringToSqlDate(getCampoTextual(request, "FPERFIN_AUX"));
			logger.debug("FPERFIN-->" + FPERFIN);
			formdata.put("FPERFIN", FPERFIN);

			logger.debug("New:" + isNew);
			if (isEmpty(SIDEPAG)) {
				SIDEPAG = SIDEPAGRECOB;
				formdata.put("SIDEPAG", SIDEPAG);
			}
			formdata.put("SECCION", SECCION);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(SSEGURO, NSINIES,
					NTRAMIT, CTIPPAG, SIDEPAG);
			logger.debug("+++F_GET_OBJ_SINTRAMIPAGORECOB: " + map);
			if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map, false))) {
				formdata.put("PAGO", (Map) map.get("RETURN"));
				Map p = (Map) map.get("RETURN");
				if (isEmpty(isNew) || !isNew.equals("yes")) {
					ArrayList detalles = (ArrayList) p.get("PAGOGAR");
					for (int i = 0; i < detalles.size(); i++) {
						Map det = (Map) detalles.get(i);
						if (((Map) det.get("OB_IAX_SIN_TRAMI_PAGO_GAR")).get("NORDEN").equals(NORDEN)) {
							formdata.put("IVALCTUALobj",
									(BigDecimal) ((Map) det.get("OB_IAX_SIN_TRAMI_PAGO_GAR")).get("ISINRET"));
							logger.debug("++++ISINRET: "
									+ (BigDecimal) ((Map) det.get("OB_IAX_SIN_TRAMI_PAGO_GAR")).get("ISINRET"));
						}
					}
				}
			}
///
			if (!isEmpty(SSEGURO)) {
				PAC_IAX_REA pacIaxRea = new PAC_IAX_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CONSULTA_DET_CESIONES(SSEGURO);
				// logger.debug(mapa);--se quita porque puede devolver demasiados datos y peta
				// el log
				request.setAttribute("T_IAX_CESIONESREA", tratarRETURNyMENSAJES(request, mapa));

				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(
						(BigDecimal) getCampoNumerico(request, "SSEGURO"));
				logger.debug(mapa);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}

			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_ULTIM_MOVPAGORECOB(SSEGURO, NSINIES, NTRAMIT,
					CTIPPAG, SIDEPAG);
			logger.debug(map);
			if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map, false))) {
				formdata.put("ULTMOVPAG", (Map) map.get("RETURN"));
			}
			if (!isEmpty(isNew) && isNew.equals("yes")) {
				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJRESERVAS_CALC(SSEGURO, NSINIES, NTRAMIT);
				logger.debug(map);
				List llista = (List) tratarRETURNyMENSAJES(request, map, false);
				if (!isEmpty(llista)) {
					formdata.put("RESERVAS", llista);
					if (llista.get(0) != null) {
						try {
							BigDecimal cgarant = (BigDecimal) ((HashMap) ((HashMap) llista.get(0))
									.get("OB_IAX_SIN_TRAMI_RESERVA")).get("CGARANT");
							formdata.put("CGARANTx", cgarant);
							logger.debug("Garantia seleccionada: " + cgarant);
						} catch (Exception e) {
							logger.debug(e.getMessage());
						}

						for (int i = 0; i < llista.size(); i++) {
							HashMap reserva = ((HashMap) ((HashMap) llista.get(0)).get("OB_IAX_SIN_TRAMI_RESERVA"));
							if (((BigDecimal) reserva.get("CTIPRES")).equals(CTIPRES)
									&& ((BigDecimal) reserva.get("CTIPRES")).equals(NTRAMIT)
									&& ((BigDecimal) reserva.get("CTIPRES")).equals(NMOVRES)) {
								BigDecimal ctipgas = (BigDecimal) reserva.get("CTIPGAS");
								logger.debug("++++CTIPGAS RESERVA: " + ctipgas);

								if (isEmpty(formdata.get("CTIPGAS"))) {
									formdata.put("CTIPGAS", ctipgas);
								}
							}
						}
						BigDecimal ctipgas = (BigDecimal) ((HashMap) ((HashMap) llista.get(0))
								.get("OB_IAX_SIN_TRAMI_RESERVA")).get("CTIPGAS");
						logger.debug("++++CTIPGAS RESERVA: " + ctipgas);

						if (isEmpty(formdata.get("CTIPGAS"))) {
							formdata.put("CTIPGAS", ctipgas);
						}
					}
				}
			}

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAM_PAGRECOB_GAR(SSEGURO, NSINIES,
						NTRAMIT, CTIPPAG, SIDEPAG, CTIPRES, NMOVRES, NORDEN);
				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map, false))) {
					Map OB_PAGRECOB_GAR = (Map) map.get("RETURN");
					if (!isEmpty(OB_PAGRECOB_GAR.get("RESERVA"))) {
						Map OB_RESERVA = (Map) OB_PAGRECOB_GAR.remove("RESERVA");
						Map OB_IAX_SIN_TRAMI_RESERVA = new HashMap();
						OB_IAX_SIN_TRAMI_RESERVA.put("OB_IAX_SIN_TRAMI_RESERVA", OB_RESERVA);
						ArrayList<Map> reserva = new ArrayList();
						reserva.add(OB_IAX_SIN_TRAMI_RESERVA);
						formdata.put("CGARANT", OB_RESERVA.get("CGARANT"));
						if (!isEmpty(NMOVRES) && !isEmpty(CTIPRES)) {
							for (Map res : reserva) {
								HashMap OB_IAX_SIN_TRAMI_RESERVAS = (HashMap) res.get("OB_IAX_SIN_TRAMI_RESERVA");
								BigDecimal nmov = new BigDecimal(
										String.valueOf(OB_IAX_SIN_TRAMI_RESERVAS.get("NMOVRES")));
								BigDecimal ctip = new BigDecimal(
										String.valueOf(OB_IAX_SIN_TRAMI_RESERVAS.get("CTIPRES")));
								if (NMOVRES.intValue() == nmov.intValue() && ctip.intValue() == CTIPRES.intValue())
									formdata.put("IVALACTUAL", OB_IAX_SIN_TRAMI_RESERVAS.get("IVALACTUAL"));
								logger.debug("++++CTIPGAS RESERVA: " + OB_IAX_SIN_TRAMI_RESERVAS.get("CTIPGAS"));

								if (isEmpty(formdata.get("CTIPGAS"))) {
									formdata.put("CTIPGAS", OB_IAX_SIN_TRAMI_RESERVAS.get("CTIPGAS"));
								}

							}
						}
						OB_PAGRECOB_GAR.put("RESERVAS", reserva);
					}
					formdata.putAll(OB_PAGRECOB_GAR);
				}
			}
			this.cargarListas(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin014Action thisAction) {

		logger.info("Axissin014Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		formattingNumericValues(request);
		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal CTIPRES = getCampoNumerico(request, "CTIPRES");
			logger.debug("CTIPRES-->" + CTIPRES);
			BigDecimal CTIPGAS = getCampoNumerico(request, "CTIPGAS");
			logger.debug("CTIPGAS-->" + CTIPGAS);
			BigDecimal NMOVRES = getCampoNumerico(request, "NMOVRES");
			logger.debug("NMOVRES-->" + NMOVRES);
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			logger.debug("SIDEPAG-->" + SIDEPAG);
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			logger.debug("CTIPPAG-->" + CTIPPAG);
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			logger.debug(CGARANT);
			java.sql.Date FPERINI = this.stringToSqlDate(request.getParameter("FPERINI"));
			logger.debug("FPERINI-->" + FPERINI);
			java.sql.Date FPERFIN = this.stringToSqlDate(request.getParameter("FPERFIN"));
			logger.debug("FPERFIN-->" + FPERFIN);
			java.sql.Date FCAMBIO = this.stringToSqlDate(getCampoTextual(request, "FCAMBIO"));
			logger.debug("FCAMBIO-->" + FPERFIN);
			BigDecimal ISINRETPAG = getCampoNumerico(request, "ISINRETPAG");
			logger.debug("ISINRETPAG-->" + ISINRETPAG);
			BigDecimal IFRANQPAG = getCampoNumerico(request, "IFRANQPAG");
			logger.debug("IFRANQPAG-->" + IFRANQPAG);
			BigDecimal IRETENCPAG = getCampoNumerico(request, "IRETENCPAG");
			logger.debug("IRETENCPAG-->" + IRETENCPAG);
			BigDecimal IFRANQ = getCampoNumerico(request, "IFRANQ");
			logger.debug("IFRANQ-->" + IFRANQ);
			BigDecimal IRETENC = getCampoNumerico(request, "IRETENC");
			logger.debug("IRETENC-->" + IRETENC);
			BigDecimal ISUPLID = getCampoNumerico(request, "ISUPLID");
			logger.debug("ISUPLID-->" + ISUPLID);
			BigDecimal IIVA = getCampoNumerico(request, "IIVA");
			logger.debug("IIVA-->" + IIVA);
			BigDecimal ISINRET = getCampoNumerico(request, "ISINRET");
			logger.debug("ISINRET-->" + ISINRET);
			BigDecimal IIVAPAG = getCampoNumerico(request, "IIVAPAG");
			logger.debug("IIVAPAG-->" + IIVAPAG);
			BigDecimal ISUPLIDPAG = getCampoNumerico(request, "ISUPLIDPAG");
			logger.debug("ISUPLIDPAG-->" + ISUPLIDPAG);
			String CMONRES = this.getCampoTextual(request, "CMONRES");
			logger.debug("CMONRES-->" + CMONRES);
			String CMONPAG = this.getCampoTextual(request, "CMONPAG");
			logger.debug("CMONPAG-->" + CMONPAG);
			BigDecimal IRESRCM = getCampoNumerico(request, "IRESRCM"); // IRESRCM
			logger.debug("IRESRCM-->" + IRESRCM);
			BigDecimal IRESRED = getCampoNumerico(request, "IRESRED"); // IRESRED
			logger.debug("IRESRED-->" + IRESRED);
			BigDecimal PIVA = getCampoNumerico(request, "PIVA");
			logger.debug("PIVA-->" + PIVA);
			BigDecimal PRETENC = getCampoNumerico(request, "PRETENC");
			logger.debug("PRETENC-->" + PRETENC);
			BigDecimal CCONPAG = getCampoNumerico(request, "CCONPAG");
			logger.debug("CCONPAG-->" + CCONPAG);
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			logger.debug("NORDEN-->" + NORDEN);

			BigDecimal PRETEIVA = getCampoNumerico(request, "PRETEIVA");
			logger.debug("PRETEIVA-->" + PRETEIVA);
			BigDecimal PRETEICA = getCampoNumerico(request, "PRETEICA");
			logger.debug("PRETEICA-->" + PRETEICA);
			BigDecimal IRETEIVA = getCampoNumerico(request, "IRETEIVA");
			logger.debug("IRETEIVA-->" + IRETEIVA);
			BigDecimal IRETEICA = getCampoNumerico(request, "IRETEICA");
			logger.debug("IRETEICA-->" + IRETEICA);
			BigDecimal IRETEIVAPAG = getCampoNumerico(request, "IRETEIVAPAG");
			logger.debug("IRETEIVAPAG-->" + IRETEIVAPAG);
			BigDecimal IRETEICAPAG = getCampoNumerico(request, "IRETEICAPAG");
			logger.debug("IRETEICAPAG-->" + IRETEICAPAG);
			BigDecimal PICA = getCampoNumerico(request, "PICA");
			logger.debug("PICA-->" + PICA);
			BigDecimal IICA = getCampoNumerico(request, "IICA");
			logger.debug("IICA-->" + IICA); /// ?????
			BigDecimal IICAPAG = getCampoNumerico(request, "IICAPAG");
			logger.debug("IICAPPAG-->" + IICAPAG);

			BigDecimal IOTROSGAS = getCampoNumerico(request, "IOTROSGAS");
			logger.debug("IOTROSGAS-->" + IOTROSGAS);
			BigDecimal IBASEIPOC = getCampoNumerico(request, "IBASEIPOC");
			logger.debug("IBASEIPOC-->" + IBASEIPOC);
			BigDecimal PIPOCONSUMO = getCampoNumerico(request, "PIPOCONSUMO");
			logger.debug("PIPOCONSUMO-->" + PIPOCONSUMO);
			BigDecimal PIPOCONSUMO_CTIPIND = getCampoNumerico(request, "PIPOCONSUMO_CTIPIND");
			logger.debug("PIPOCONSUMO_CTIPIND-->" + PIPOCONSUMO_CTIPIND);
			BigDecimal IIPOCONSUMO = getCampoNumerico(request, "IIPOCONSUMO");
			logger.debug("IIPOCONSUMO-->" + IIPOCONSUMO);

			BigDecimal PIOTROSGASPAG = getCampoNumerico(request, "PIOTROSGASPAG");
			logger.debug("PIOTROSGASPAG-->" + PIOTROSGASPAG);
			BigDecimal PIBASEIPOCPAG = getCampoNumerico(request, "PIBASEIPOCPAG");
			logger.debug("PIBASEIPOCPAG-->" + PIBASEIPOCPAG);
			BigDecimal PIIPOCONSUMOPAG = getCampoNumerico(request, "PIIPOCONSUMOPAG");
			logger.debug("PIIPOCONSUMOPAG-->" + PIIPOCONSUMOPAG);

			BigDecimal PRETENC_CTIPIND = getCampoNumerico(request, "PRETENC_CTIPIND");
			logger.debug("PRETENC_CTIPIND-->" + PRETENC_CTIPIND);
			BigDecimal PIVA_CTIPIND = getCampoNumerico(request, "PIVA_CTIPIND");
			logger.debug("PIVA_CTIPIND-->" + PIVA_CTIPIND);
			BigDecimal PRETEIVA_CTIPIND = getCampoNumerico(request, "PRETEIVA_CTIPIND");
			logger.debug("PRETEIVA_CTIPIND-->" + PRETEIVA_CTIPIND);
			BigDecimal PRETEICA_CTIPIND = getCampoNumerico(request, "PRETEICA_CTIPIND");
			logger.debug("PRETEICA_CTIPIND-->" + PRETEICA_CTIPIND);

			BigDecimal ITOTIMP = getCampoNumerico(request, "ITOTIMP"); // ITOTIMP
			logger.debug("ITOTIMP-->" + ITOTIMP);
			BigDecimal ITOTRET = getCampoNumerico(request, "ITOTRET"); // ITOTRET
			logger.debug("ITOTRET-->" + ITOTRET);

			formdata.put("RECARGA", "1"); // Se est� recargando la p�gina
			String isNew = this.getCampoTextual(request, "isNew");
			Map map = new HashMap();
			/* if (!isEmpty(isNew) && isNew.equals("yes")) { */
			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAM_PAGRECOB_GAR(SSEGURO, NTRAMIT,
					CTIPPAG, SIDEPAG, CTIPRES, CTIPGAS, NMOVRES, CGARANT, FPERINI, FPERFIN, CMONRES, ISINRET, IIVA,
					ISUPLID, IRETENC, IFRANQ, CMONPAG, ISINRETPAG, IIVAPAG, ISUPLIDPAG, IRETENCPAG, IFRANQPAG, FCAMBIO,
					IRESRED, IRESRCM, PIVA, PRETENC, CCONPAG, NORDEN, PRETEIVA, PRETEICA, IRETEIVA, IRETEICA,
					IRETEIVAPAG, IRETEICAPAG, PICA, IICA, IICAPAG, PIVA_CTIPIND, PRETENC_CTIPIND, PRETEIVA_CTIPIND,
					PRETEICA_CTIPIND, ITOTIMP, ITOTRET, IOTROSGAS, IBASEIPOC, PIPOCONSUMO, PIPOCONSUMO_CTIPIND,
					IIPOCONSUMO, PIOTROSGASPAG, PIBASEIPOCPAG, PIIPOCONSUMOPAG);

			/*
			 * }else{ // TODO!!!! DONDE EST� GAR2??? en el taller NO!!!! map =
			 * pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAM_PAGRECOB_GAR2(
			 * SSEGURO, NTRAMIT, CTIPPAG, SIDEPAG, CTIPRES, CTIPGAS, NMOVRES, CGARANT,
			 * FPERINI, FPERFIN, CMONRES, ISINRET, IIVA, ISUPLID, IRETENC, IFRANQ, CMONPAG,
			 * ISINRETPAG, IIVAPAG, ISUPLIDPAG, IRETENCPAG, IFRANQPAG, FCAMBIO, IRESRED,
			 * IRESRCM, PIVA, PRETENC,CCONPAG,NORDEN, PRETEIVA, PRETEICA, IRETEIVA,
			 * IRETEICA, IRETEIVAPAG,IRETEICAPAG, PICA,IICA,IICAPAG, PRETENC_CTIPIND,
			 * PIVA_CTIPIND, PRETEIVA_CTIPIND, PRETEICA_CTIPIND, ITOTIMP, ITOTRET);
			 * 
			 * 
			 * }
			 */
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			} else {
				formdata.put("MENSAJES_MANTENER", map.get("MENSAJES"));

			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cargarFranquicia(HttpServletRequest request, Axissin014Action thisAction) {

		logger.info("Axissin014Service m_cargarFranquicia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formattingNumericValues(request);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal IVALACTUAL = getCampoNumerico(request, "IVALACTUAL");
			BigDecimal IVALCTUALobj = getCampoNumerico(request, "IVALCTUALobj");
			logger.debug("IVALACTUAL : " + IVALACTUAL);
			logger.debug("IVALCTUALobj : " + IVALCTUALobj);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (true) {
				// if (!isEmpty(CGARANT)) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(SSEGURO, NRIESGO,
						CGARANT);
				logger.debug(map);

				if (!isEmpty(map)) {
					BigDecimal importeFranquicia = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
					if (importeFranquicia != null) {
						formdata.put("IFRANQ", importeFranquicia);

					}
				}
			} else {
				formdata.put("IFRANQ", null);

			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin014Service - m�todo m_cargarFranquicia", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_reserva_inicial(HttpServletRequest request) {
		logger.debug("Axissin014Service m_ajax_reserva_inicial");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			/* C�digo inicial */

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap mapa_franquicia = new HashMap();

			if (!isEmpty(CGARANT)) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(SSEGURO, NRIESGO,
						CGARANT);
				if (!isEmpty(map)) {
					BigDecimal importeFranquicia = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
					if (importeFranquicia != null) {
						mapa_franquicia.put("IFRANQ", importeFranquicia);

					}
				}

				ajax.rellenarPlAContenedorAjax(map);

			}

			ajax.guardarContenidoFinalAContenedorAjax(mapa_franquicia);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin014Service - m�todo m_ajax_reserva_inicial", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualitza_imports(HttpServletRequest request) {
		logger.debug("Axissin014Service m_ajax_actualitza_imports");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal IRCMBRUT = getCampoNumerico(request, "IRCMBRUT");
			BigDecimal IREDUCCION = getCampoNumerico(request, "IREDUCCION");
			BigDecimal ISINRET = getCampoNumerico(request, "ISINRET");
			BigDecimal ISUPLID = getCampoNumerico(request, "ISUPLID");
			BigDecimal PRETENC = getCampoNumerico(request, "PRETENC");
			BigDecimal PIVA = getCampoNumerico(request, "PIVA");
			BigDecimal PICA = getCampoNumerico(request, "PICA");
			BigDecimal PRETEIVA = getCampoNumerico(request, "PRETEIVA");
			BigDecimal PRETEICA = getCampoNumerico(request, "PRETEICA");

			BigDecimal PCCALIMP = getCampoNumerico(request, "CCALIMP");
			BigDecimal PSIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			Date PFORDPAG = this.stringToSqlDate(this.getCampoTextual(request, "FORDPAG"));
			BigDecimal PCTIPGAS = getCampoNumerico(request, "CTIPGAS");
			BigDecimal PCCONCEP = getCampoNumerico(request, "CCONCEP");
			BigDecimal PCAGENTE = getCampoNumerico(request, "CAGENTE");

			BigDecimal PRETENC_CTIPIND = getCampoNumerico(request, "PRETENC_CTIPIND");
			BigDecimal PIVA_CTIPIND = getCampoNumerico(request, "PIVA_CTIPIND");
			BigDecimal PRETEIVA_CTIPIND = getCampoNumerico(request, "PRETEIVA_CTIPIND");
			BigDecimal PRETEICA_CTIPIND = getCampoNumerico(request, "PRETEICA_CTIPIND");
			BigDecimal PIPOCONSUMO_CTIPIND = getCampoNumerico(request, "PIPOCONSUMO_CTIPIND");

			BigDecimal IOTROSGAS = getCampoNumerico(request, "IOTROSGAS");
			BigDecimal IBASEIPOC = getCampoNumerico(request, "IBASEIPOC");
			BigDecimal PIPOCONSUMO = getCampoNumerico(request, "PIPOCONSUMO");
			String CMONRES = this.getCampoTextual(request, "CMONRES");
			String CMONPAG = this.getCampoTextual(request, "CMONPAG");
			BigDecimal CTIPRES = getCampoNumerico(request, "CTIPRES");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

			BigDecimal VALORPESOS = getCampoNumerico(request, "VALORPESOS");

			// INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
			BigDecimal IFRANQ_IN = getCampoNumerico(request, "IFRANQ");
			// FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_OBJCALCULA_IMPORTS_DETPAGOS(IRCMBRUT, IREDUCCION,
					ISINRET, ISUPLID, PRETENC, PIVA, PICA, PRETEIVA, PRETEICA, PCCALIMP, PSIDEPAG, PSPERSON, PFORDPAG,
					PCTIPGAS, PCCONCEP, PCAGENTE,
					// INI AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY
					// IOTROSGAS, IBASEIPOC, PIPOCONSUMO, CMONRES, CMONPAG, CTIPRES, CGARANT,
					// VALORPESOS);
					IOTROSGAS, IBASEIPOC, PIPOCONSUMO, CMONRES, CMONPAG, CTIPRES, CGARANT, VALORPESOS, IFRANQ_IN);
			// FIN AMANTIUM - 17/12/2021 - IAXIS-16338 - PROPERTY

			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin014Service - m�todo m_ajax_actualitza_imports", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void selectFirstItem(List llista, String atribute, String inputName, Map formdata) {
		Map map = null;
		if ((llista != null) && (llista.size() == 1)) {
			if (llista.get(0) != null) {
				map = (Map) llista.get(0);
				formdata.put(inputName, map.get(atribute));
			}
		}
	}

}
