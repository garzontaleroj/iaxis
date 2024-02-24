//Revision:# B5QdIHzlAtk9fY04ZZVjoA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_FORMULA;
import axis.jdbc.PAC_IAX_SIN_FRANQUICIAS;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.jdbc.PAC_IAX_VALIDACIONES_SIN;
import axis.mvc.control.modal.Axissin084Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin084Service extends AxisBaseService {
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
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Tipo Reserva
		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPRES();
		List lsttiporeserva = (List) tratarRETURNyMENSAJES(request, map);
		selectFirstItem(lsttiporeserva, "CATRIBU", "CESTTRA", formdata);
		listValores.put("tipo_reserva", lsttiporeserva);

		// Calculo
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL();
		listValores.put("tipo_manual", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1047));
		listValores.put("tipo_gasto", (List) tratarRETURNyMENSAJES(request, map));
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
		List monedas = (List) tratarRETURNyMENSAJES(request, map);
		listValores.put("lista_monedas", monedas);
		monedas = null;

		BigDecimal CAGENTE = usuario.getCagente();
		formdata.put("CAGENTE", CAGENTE);
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

		PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal CEMPRES = usuario.getCempres();

		Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("IMPUESTOS_SAP"), CEMPRES);
		if (!isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, m)))
				&& ((BigDecimal) tratarRETURNyMENSAJES(request, m)).equals(new BigDecimal(1))) {
			formdata.put("IMPUESTOS_SAP", ((BigDecimal) tratarRETURNyMENSAJES(request, m)));
			map = pac_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARIS(SSEGURO, NSINIES.toString(),
					NTRAMIT);
			listValores.put("lstdestinataris", (List) tratarRETURNyMENSAJES(request, map, false));

			if (!isEmpty(getCampoNumerico(request, "SPROFES"))) {
				PAC_IAX_SIN_IMP_SAP pac_axis_sin_imp_sap = new PAC_IAX_SIN_IMP_SAP(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
				Date FORDPAG = new Date(new java.util.Date().getTime());
				map = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(new BigDecimal(-1), // No
																												// tenemos
																												// el
																												// concepto
																												// de
																												// pago
						SPROFES, new BigDecimal(1), // IVA
						FORDPAG, NSINIES.toString(), NTRAMIT, null);
				List lstPIVA = (List<Map>) tratarRETURNyMENSAJES(request, map);
				if (lstPIVA == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPIVA, "CTIPIND", "PIVA_CTIPIND", formdata);
				formdata.put("lstPIVA", lstPIVA);
				String pPIVA_SAP = getCampoTextual(request, "PIVA_SAP");

				Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(NSINIES.toString(),
						NTRAMIT);
				List lstlocalizacion = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				selectFirstItem(lstlocalizacion, "NLOCALI", "NLOCALI", formdata);
				formdata.put("lstlocalizacion", lstlocalizacion);
				BigDecimal pPNLOCALI = getCampoNumerico(request, "NLOCALI");

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(new BigDecimal(-1), // No
																												// tenemos
																												// el
																												// concepto
																												// de
																												// pago,
						SPROFES, new BigDecimal(2), // RETEFUENTE
						FORDPAG, NSINIES.toString(), NTRAMIT, pPNLOCALI);
				List lstPRETENC = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPRETENC == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPRETENC, "CTIPIND", "PRETENC_CTIPIND", formdata);
				formdata.put("lstPRETENC", lstPRETENC);
				String pPRETENC_SAP = getCampoTextual(request, "PRETENC_SAP");

				m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(new BigDecimal(-1), // No
																												// tenemos
																												// el
																												// concepto
																												// de
																												// pago,
						SPROFES, new BigDecimal(3), // RETEIVA
						FORDPAG, NSINIES.toString(), NTRAMIT, pPNLOCALI);
				List lstPRETEIVA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
				if (lstPRETEIVA == null) {
					formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
				}
				selectFirstItem(lstPRETEIVA, "CTIPIND", "PRETEIVA_CTIPIND", formdata);
				formdata.put("lstPRETEIVA", lstPRETEIVA);
				String pPRETEIVA_SAP = getCampoTextual(request, "PRETEIVA_SAP");

				if (pPNLOCALI != null) {
					m1 = pac_axis_sin_imp_sap.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_INDICADOR_PROF(new BigDecimal(-1), // No
																													// tenemos
																													// el
																													// concepto
																													// de
																													// pago,
							SPROFES, new BigDecimal(4), // RETEICA
							FORDPAG, NSINIES.toString(), NTRAMIT, pPNLOCALI);
					List lstPRETEICA = (List<Map>) tratarRETURNyMENSAJES(request, m1);
					if (lstPRETEICA == null) {
						formdata.put("ERROR_IMPUESTOS", new BigDecimal(1));
					}
					selectFirstItem(lstPRETEICA, "CTIPIND", "PRETEICA_CTIPIND", formdata);
					formdata.put("lstPRETEICA", lstPRETEICA);
					String pPRETEICA_SAP = getCampoTextual(request, "PRETEICA_SAP");
				}

				BigDecimal PRETENC_CTIPIND = getCampoNumerico(request, "PRETENC_CTIPIND");
				BigDecimal PRETENC_SAP_NPORCENT = getCampoNumerico(request, "PRETENC_SAP_NPORCENT");

				BigDecimal PIVA_CTIPIND = getCampoNumerico(request, "PIVA_CTIPIND");
				BigDecimal PIVA_SAP_NPORCENT = getCampoNumerico(request, "PIVA_SAP_NPORCENT");

				BigDecimal PRETEIVA_CTIPIND = getCampoNumerico(request, "PRETEIVA_CTIPIND");
				BigDecimal PRETEIVA_SAP_NPORCENT = getCampoNumerico(request, "PRETEIVA_SAP_NPORCENT");

				BigDecimal PRETEICA_CTIPIND = getCampoNumerico(request, "PRETEICA_CTIPIND");
				BigDecimal PRETEICA_SAP_NPORCENT = getCampoNumerico(request, "PRETEICA_SAP_NPORCENT");
			}
		}

		request.setAttribute("listValores", listValores);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin084Action thisAction) {
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
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			formdata.put("NMOVIMI", NMOVIMI);
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			if (CTRAMIT == null) {
				// BUG 26902_0144285 - JLTS - 2013/05/17
				CTRAMIT = this.stringToBigDecimal((String) formdata.get("CTRAMIT"));
			}

			BigDecimal TFRANQ = getCampoNumerico(request, "TFRANQ");

			formdata.put("TFRANQ", TFRANQ);

			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");

			BigDecimal pctipgas = getCampoNumerico(request, "CTIPGAS");

			String pnsinies = isEmpty(getCampoTextual(request, "NSINIES")) ? String.valueOf(NSINIES)
					: getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "CTIPRES");

			BigDecimal pnmovres = getCampoNumerico(request, "NMOVRES");
			BigDecimal pcgarant = isEmpty(getCampoNumerico(request, "CGARANT")) ? getCampoNumerico(request, "VGARANTIA")
					: getCampoNumerico(request, "CGARANT");

			String modo = getCampoTextual(request, "MODO");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			if (!isEmpty(pnsinies) && !isEmpty(pntramit) && !isEmpty(pctipres) && !isEmpty(pnmovres)) {

				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_AMPARO(pnsinies, pntramit, pcgarant);

				Map map2 = (Map) map.get("OB_AMPARO");

				formdata.put("CESTTRA", map2.get("CTIPRES"));
				formdata.put("GARANTIA", map2.get("CGARANT"));
				formdata.put("CALCULO", map2.get("CCALRES"));
				formdata.put("IRESERVA", map2.get("ITOTRET"));
				formdata.put("IRESERVAACT", map2.get("IRESERVA"));
				formdata.put("ICAPRIE", map2.get("ICAPRIE"));
				formdata.put("IPENALI", map2.get("IPENALI"));
				formdata.put("FRESINI", map2.get("FRESINI"));
				formdata.put("VFRESINI", map2.get("FRESINI"));
				if (isEmpty(request.getParameter("NDIASBAJA"))) {
					formdata.put("NDIASBAJA", map2.get("NDIAS"));
				}
				formdata.put("FRESFIN", map2.get("FRESFIN"));
				formdata.put("IPREREC", map2.get("IPREREC"));
				formdata.put("IPAGO", map2.get("IPAGO"));
				formdata.put("IRECOBRO", map2.get("IRECOBRO"));
				formdata.put("FULTPAG", map2.get("FULTPAG"));
				formdata.put("SIDEPAG", map2.get("SIDEPAG"));
				formdata.put("CTIPGAS", map2.get("CTIPGAS"));
				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {

					if (isEmpty(formdata.get("CMONRES"))) {
						formdata.put("CMONRES", mmoneda.get("PCMONINT"));
					}

				}
				formdata.put("TMONRES", map2.get("TMONRES"));
				formdata.put("CSOLIDARIDAD_MODIF", map2.get("CSOLIDARIDAD_MODIF"));

				map = pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(new String("BAJA"), SPRODUC,
						pcgarant, CACTIVI);
				formdata.put("ESBAJA", tratarRETURNyMENSAJES(request, map));

			} else {

				Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {

					if (isEmpty(formdata.get("CMONRES"))) {
						formdata.put("CMONEDA", mmoneda.get("PCMONEDA"));
						formdata.put("TMONRES", mmoneda.get("PTMONEDA"));
						formdata.put("CMONRES", mmoneda.get("PCMONINT"));
					}

				}
			}

			cargarListas(request);

			if (true) {

				// Bug 0020472 - JMF - 09/12/2011: afegir porigen

				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS(SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
						FSINIES, new BigDecimal(1), CTRAMIT, NSINIES, pntramit, new BigDecimal(1));
				formdata.put("lista_garantias", tratarRETURNyMENSAJES(request, map));
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

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axissin084Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			formattingNumericValues(request);
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

			BigDecimal CTIPGAS = getCampoNumerico(request, "CTIPGAS");
			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal vctipres = getCampoNumerico(request, "VCESTTRA");
			BigDecimal CTIPRES = (ctipres == null) ? vctipres : ctipres; /* Si */

			String TTIPRES = getCampoTextual(request, "TTIPRES");
			BigDecimal NMOVRES = null;// getCampoNumerico(request, "NMOVRES");

			BigDecimal cgarant = getCampoNumerico(request, "GARANTIA");
			BigDecimal vcgarant = getCampoNumerico(request, "VGARANTIA");
			BigDecimal CGARANT = (cgarant == null) ? vcgarant : cgarant; /* Si */

			BigDecimal ccalres = getCampoNumerico(request, "CALCULO");
			BigDecimal vccalres = getCampoNumerico(request, "VCALCULO");
			BigDecimal CCALRES = (ccalres == null) ? vccalres : ccalres; /* Si */

			Date FMOVRES = stringToSqlDate(getCampoTextual(request, "FMOVRES"));
			String CMONRES = getCampoTextual(request, "CMONRES");
			BigDecimal ICAPRIE = getCampoNumerico(request, "ICAPRIE"); /* Si */
			formdata.put("ICAPRIE", ICAPRIE);
			BigDecimal IRESERVA = getCampoNumerico(request, "IRESERVA"); /* Si */
			BigDecimal IPENALI = getCampoNumerico(request, "IPENALI"); /* Si */
			BigDecimal IFRANQ = isEmpty(getCampoNumerico(request, "IFRANQ")) ? getCampoNumerico(request, "TFRANQ")
					: getCampoNumerico(request, "IFRANQ");

			BigDecimal PORICAPRIE = BigDecimal.ZERO;

			if (isEmpty(ICAPRIE)) {
				ICAPRIE = getCampoNumerico(request, "TCAPITAL");
				if (!isEmpty(IPENALI))
					IRESERVA = ICAPRIE.subtract(IPENALI);
			}

			if (isEmpty(IRESERVA) && !isEmpty(ICAPRIE) && !isEmpty(IPENALI)) {
				PORICAPRIE = new BigDecimal(1);
				IRESERVA = ICAPRIE.subtract(IPENALI);
			}

			formdata.put("IRESERVA", IRESERVA);
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal IINGRESO = getCampoNumerico(request, "IINGRESO");
			BigDecimal IRECOBRO = getCampoNumerico(request, "IRECOBRO");

			formdata.put("ICAPRIE", ICAPRIE);
			formdata.put("IPENALI", IPENALI);
			// Bug 11945 AMC
			BigDecimal IPREREC = getCampoNumerico(request, "IPREREC");
			formdata.put("IPREREC", IPREREC);
			String fresini = getCampoTextual(request, "FRESINI");
			// String vfresini = getCampoTextual(request, "VFRESINI");
			String ORIGEN = getCampoTextual(request, "ORIGEN");

			if (isEmpty(ORIGEN)) {
				ORIGEN = "axissin084";
			}

			// Date FRESINI=stringToSqlDate((fresini==null)?vfresini:fresini);/* Si */
			Date FRESINI = (fresini != null) ? stringToSqlDate(fresini) : null;
			BigDecimal NDIAS = getCampoNumerico(request, "NDIASBAJA") == null ? getCampoNumerico(request, "DIAS")
					: getCampoNumerico(request, "NDIASBAJA");

			Date FRESFIN = stringToSqlDate(getCampoTextual(request, "FRESFIN")); /* Si */
			Date FULTPAG = stringToSqlDate(getCampoTextual(request, "FULTPAG"));

			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			Date FANULAC = stringToSqlDate(getCampoTextual(request, "FANULAC"));
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			Date FCONTAB = stringToSqlDate(getCampoTextual(request, "FCONTAB"));

			BigDecimal PIVA = getCampoNumerico(request, "PIVA");
			BigDecimal PRETENC = getCampoNumerico(request, "PRETENC");
			BigDecimal PRETEIVA = getCampoNumerico(request, "PRETEIVA");
			BigDecimal PRETEICA = getCampoNumerico(request, "PRETEICA");

			BigDecimal PIVA_CTIPIND = getCampoNumerico(request, "PIVA_CTIPIND");
			BigDecimal PRETENC_CTIPIND = getCampoNumerico(request, "PRETENC_CTIPIND");
			BigDecimal PRETEIVA_CTIPIND = getCampoNumerico(request, "PRETEIVA_CTIPIND");
			BigDecimal PRETEICA_CTIPIND = getCampoNumerico(request, "PRETEICA_CTIPIND");
			BigDecimal PCSOLIDARIDAD = getCampoNumerico(request, "CSOLIDARIDAD");

			if (PCSOLIDARIDAD != null && PCSOLIDARIDAD.equals(new BigDecimal("1"))) {
				PCSOLIDARIDAD = new BigDecimal("1");
			} else {
				PCSOLIDARIDAD = new BigDecimal("0");
			}

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			if (pRETURN.intValue() == 1) {
				if (PORICAPRIE.intValue() == 1)
					formdata.put("IRESERVA", "");
				else
					formdata.put("ICAPRIE", "");
			}

			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAMPARO(NSINIES, NTRAMIT, CGARANT, IRESERVA, // pPRETENC_CTIPIND
								ICAPRIE, CMONRES); // pPITOTRET

				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (resultado.intValue() == 0) {
					request.setAttribute("OK", "OK"); // OK No ha habido error

				} else {

					request.setAttribute("OK", "KO"); // ERROR

				}
			}

			// ini bug 0024690
			BigDecimal SPRODUC = isEmpty(getCampoNumerico(request, "SPRODUC"))
					? new BigDecimal(request.getParameter("SPRODUC"))
					: getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = isEmpty(getCampoNumerico(request, "CACTIVI"))
					? new BigDecimal(request.getParameter("CACTIVI"))
					: getCampoNumerico(request, "CACTIVI");

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(SPRODUC, CACTIVI, NSINIES);
			// fin bug 0024690

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga las garantias a partir del SSEGURO
	 * 
	 * @param request
	 */
	public void m_ajax_garantias(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");

			if (CTRAMIT == null) {
				// BUG 26902_0144285 - JLTS - 2013/05/17
				CTRAMIT = this.stringToBigDecimal((String) formdata.get("CTRAMIT"));
			}

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Bug 0020472 - JMF - 09/12/2011: afegir porigen
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS(SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
					FSINIES, new BigDecimal(1), CTRAMIT, new BigDecimal(NSINIES), NTRAMIT, ctipres);

			if (!isEmpty(map)) {
				List listaGarantias = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(listaGarantias);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr084Service - m�todo m_ajax_garantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * Carga las garantias al abrir la pantalla de Garantias
	 * 
	 */

	public void m_garantias(HttpServletRequest request, Axissin084Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formattingNumericValues(request);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CTIPRES = getCampoNumerico(request, "CESTTRA");

			if (CTRAMIT == null) {
				CTRAMIT = (BigDecimal) formdata.get("CTRAMIT");
			}
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = null;

			if (SSEGURO != null) {
				// Bug 0020472 - JMF - 09/12/2011: afegir porigen
				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS(SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
						FSINIES, new BigDecimal(1), CTRAMIT, NSINIES, NTRAMIT, CTIPRES);
			}

			if (!isEmpty(map)) {
				List listaGarantias = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("lista_garantias", listaGarantias);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_franquicia_garantia(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap mapa = new HashMap();
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CGARANT = getCampoNumerico(request, "GARANTIA");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "CTIPRES");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_FRANQUICIA_GARANTIA(SSEGURO, NRIESGO,
					CGARANT);

			if (!isEmpty(map)) {
				BigDecimal importeFranquicia = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (importeFranquicia != null) {
					mapa.put("IMPORTE", importeFranquicia);
				}
			}

			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_CAPITALGAR(CGARANT, SSEGURO, NSINIES);

			if (!isEmpty(map)) {
				BigDecimal capital = (BigDecimal) map.get("PCAPITAL");
				if (capital != null) {
					mapa.put("CAPITAL", capital);
				}
			}

			ajax.guardarContenidoFinalAContenedorAjax(mapa);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_ajax_franquicia_garantia", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga las garantias a partir del SSEGURO
	 * 
	 * @param request
	 */
	public void m_ajax_guardar(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

			BigDecimal CTIPGAS = getCampoNumerico(request, "CTIPGAS");

			BigDecimal ctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal vctipres = getCampoNumerico(request, "VCESTTRA");
			BigDecimal CTIPRES = (ctipres == null) ? vctipres : ctipres; /* Si */

			String TTIPRES = getCampoTextual(request, "TTIPRES");
			BigDecimal NMOVRES = getCampoNumerico(request, "NMOVRES");

			BigDecimal cgarant = getCampoNumerico(request, "GARANTIA");
			BigDecimal vcgarant = getCampoNumerico(request, "VGARANTIA");
			BigDecimal CGARANT = (cgarant == null) ? vcgarant : cgarant; /* Si */

			BigDecimal ccalres = getCampoNumerico(request, "CALCULO");
			BigDecimal vccalres = getCampoNumerico(request, "VCALCULO");
			BigDecimal CCALRES = (ccalres == null) ? vccalres : ccalres; /* Si */

			Date FMOVRES = stringToSqlDate(getCampoTextual(request, "FMOVRES"));
			String CMONRES = getCampoTextual(request, "CMONRES");
			BigDecimal IRESERVA = getCampoNumerico(request, "IRESERVA"); /* Si */
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal IINGRESO = getCampoNumerico(request, "IINGRESO");
			BigDecimal IRECOBRO = getCampoNumerico(request, "IRECOBRO");
			BigDecimal ICAPRIE = getCampoNumerico(request, "ICAPRIE"); /* Si */
			BigDecimal IPENALI = getCampoNumerico(request, "IPENALI"); /* Si */
			BigDecimal IFRANQ = getCampoNumerico(request, "IFRANQ");

			String ORIGEN = getCampoTextual(request, "ORIGEN");
			String fresini = getCampoTextual(request, "FRESINI");
			// String vfresini = getCampoTextual(request, "VFRESINI");
			Date FRESINI = (fresini != null) ? stringToSqlDate(fresini) : null;
			BigDecimal NDIAS = getCampoNumerico(request, "NDIASBAJA") == null ? getCampoNumerico(request, "DIAS")
					: getCampoNumerico(request, "NDIASBAJA");

			Date FRESFIN = stringToSqlDate(getCampoTextual(request, "FRESFIN"));
			Date FULTPAG = stringToSqlDate(getCampoTextual(request, "FULTPAG"));

			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			Date FANULAC = stringToSqlDate(getCampoTextual(request, "FANULAC"));
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			Date FCONTAB = stringToSqlDate(getCampoTextual(request, "FCONTAB"));

			// Bug 11945 AMC
			BigDecimal IPREREC = getCampoNumerico(request, "IPREREC");
			BigDecimal PCSOLIDARIDAD = getCampoNumerico(request, "CSOLIDARIDAD");

			if (PCSOLIDARIDAD != null && PCSOLIDARIDAD.equals(new BigDecimal("1"))) {
				PCSOLIDARIDAD = new BigDecimal("1");
			} else {
				PCSOLIDARIDAD = new BigDecimal("0");
			}

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(NSINIES, NTRAMIT, CTIPRES, TTIPRES,
							NMOVRES, CGARANT, CCALRES, FMOVRES, CMONRES, IRESERVA, IPAGO, IINGRESO, IRECOBRO, ICAPRIE,
							IPENALI, FRESINI, FRESFIN, FULTPAG, SIDEPAG, SPROCES, FCONTAB, IPREREC, CTIPGAS,
							new String("RESER"), ORIGEN, IFRANQ, NDIAS, new BigDecimal(2), // pPCMOVRES
							null, // pPITOTIMP
							null, // pPPIVA
							null, // pPPRETENC
							null, // pPPRETEIVA
							null, // pPPRETEICA
							null, // pPIVA_CTIPIND
							null, // pPRETENC_CTIPIND
							null, // pPRETEIVA_CTIPIND
							null, // pPRETEICA_CTIPIND
							null, // SOLIDARIDAD
							PCSOLIDARIDAD); // pPITOTRET

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr084Service - m�todo m_ajax_garantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_calcular_importe(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			java.sql.Date FSINIES = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSINIES"));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			java.sql.Date FNOTIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNOTIFI"));
			java.sql.Date FECVAL = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FECVAL"));
			java.sql.Date FPERINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FPERINI"));
			java.sql.Date FPERFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FPERFIN"));

			BigDecimal CTIPRES = getCampoNumerico(request, "CESTTRA");

			PAC_IAX_VALIDACIONES_SIN pac_iax_validaciones_sin = new PAC_IAX_VALIDACIONES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_validaciones_sin.ejecutaPAC_IAX_VALIDACIONES_SIN__F_CALCIMPORTERES(CTIPRES, CGARANT,
					FPERINI, FPERFIN, SPRODUC);
			tratarRETURNyMENSAJES(request, map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			BigDecimal NDIAS = getCampoNumerico(request, "NDIASBAJA") == null ? getCampoNumerico(request, "DIAS")
					: getCampoNumerico(request, "NDIASBAJA");

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				PAC_IAX_SIN_FORMULA pac_axis_sin_formula = new PAC_IAX_SIN_FORMULA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_axis_sin_formula.ejecutaPAC_IAX_SIN_FORMULA__F_CAL_VALORA(FSINIES, SSEGURO, NRIESGO, NSINIES,
						NTRAMIT, CTRAMIT, SPRODUC, CACTIVI, CGARANT, CCAUSIN, CMOTSIN, FNOTIFI, FECVAL, FPERINI,
						FPERFIN, NDIAS, null);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(map);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_ajax_calcular_importe", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_fechareserva(HttpServletRequest request, Axissin084Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formattingNumericValues(request);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");
			BigDecimal pcgarant = getCampoNumerico(request, "GARANTIA");
			BigDecimal pctipgas = getCampoNumerico(request, "CTIPGAS");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_FECHARESERVA(pnsinies, pntramit, pctipres,
					pctipgas, psproduc, pcactivi, pcgarant);

			if (!isEmpty(map.get("PFPERINI"))) {
				formdata.put("FRESINI", map.get("PFPERINI"));
				formdata.put("VFRESINI", map.get("PFPERINI"));

			}

			map = pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(new String("BAJA"), psproduc,
					pcgarant, pcactivi);
			formdata.put("ESBAJA", tratarRETURNyMENSAJES(request, map));
			formdata.put("GARANTIA", pcgarant);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_fechareserva", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_cambiofresfin(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			java.sql.Date FPERFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FPERFIN"));
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "CESTTRA");
			BigDecimal pcgarant = getCampoNumerico(request, "CGARANT");
			String pnsinies = getCampoTextual(request, "NSINIES");

			Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_ACTFRESFIN(pnsinies, pntramit, pctipres, pcgarant,
					FPERFIN);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_ajax_cambiofresfin", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_calculipenali(HttpServletRequest request, Axissin084Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formattingNumericValues(request);

			PAC_IAX_SIN_FORMULA pac_axis_sin_formula = new PAC_IAX_SIN_FORMULA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal ICAPRIE = getCampoNumerico(request, "ICAPRIE");
			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pireserva = getCampoNumerico(request, "IRESERVA");
			java.sql.Date pfini = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRESINI"));
			java.sql.Date pffin = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRESFIN"));
			BigDecimal pcgarant = getCampoNumerico(request, "GARANTIA");

			if (isEmpty(ICAPRIE)) {
				ICAPRIE = pireserva;
			}

			Map m = pac_axis_sin_formula.ejecutaPAC_IAX_SIN_FORMULA__F_CAL_PENALI(pcgarant, pntramit, pnsinies, ICAPRIE,
					pfini, pffin);
			tratarRETURNyMENSAJES(request, m);
			BigDecimal ipenali = (BigDecimal) m.get("PIPENALI");
			formdata.put("IPENALI", ipenali);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_calculipenali", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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

	public void m_calculifranq(HttpServletRequest request, Axissin084Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formattingNumericValues(request);

			PAC_IAX_SIN_FRANQUICIAS pac_axis_sin_franquicia = new PAC_IAX_SIN_FRANQUICIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal ICAPRIE = getCampoNumerico(request, "ICAPRIE");
			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal psseguro = getCampoNumerico(request, "SSEGURO");
			BigDecimal pnmovimi = getCampoNumerico(request, "NMOVIMI");
			BigDecimal pnriesgo = getCampoNumerico(request, "NRIESGO");
			BigDecimal pireserva = getCampoNumerico(request, "IRESERVA");
			BigDecimal pcgarant = getCampoNumerico(request, "GARANTIA");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));

			if (isEmpty(ICAPRIE)) {
				ICAPRIE = pireserva;
			}

			Map m = pac_axis_sin_franquicia.ejecutaPAC_IAX_SIN_FRANQUICIAS__F_FRAN_TOT(psseguro, pnmovimi, pnriesgo,
					pcgarant, ICAPRIE, FSINIES);
			tratarRETURNyMENSAJES(request, m);
			BigDecimal ifranq = (BigDecimal) m.get("P_IFRANQ");
			formdata.put("TFRANQ", ifranq);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin084Service - m�todo m_calculifranq", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
