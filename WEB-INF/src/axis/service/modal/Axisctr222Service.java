//Revision:# DHKFv+Ris0sMO1Njh86tmQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_UTILES;
import axis.mvc.control.modal.Axisctr222Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr222Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr222Service.class);

	public void m_init(HttpServletRequest request, Axisctr222Action thisAction) {
		logger.debug("Axisctr222Service m_init");
		try {
			request.getSession().removeAttribute("Axisctr222_lisa");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr222Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisctr222Action thisAction) {
		logger.debug("Axisctr222Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_UTILES pac_iax_util = new PAC_IAX_UTILES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		Date FEFECTO;
		try {

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(new BigDecimal(1));

			BigDecimal IVA = new BigDecimal(0);
			BigDecimal GASTOS = new BigDecimal(0);

			if (!isEmpty(map)) {
				Map OB_DATOS = (Map) map.get("RETURN");
				if (!isEmpty(OB_DATOS)) {
					IVA = (BigDecimal) OB_DATOS.get("IIPS");
					GASTOS = (BigDecimal) OB_DATOS.get("ICDERREG");
				}
			}

			BigDecimal IVAPESOS = new BigDecimal(0);
			BigDecimal GASTOSPESOS = new BigDecimal(0);
			HashMap miDataObject = new HashMap();
			ArrayList listaGarantias = (ArrayList) request.getSession().getAttribute("axisctr_garantias");
			if (listaGarantias == null) {
				listaGarantias = (ArrayList) request.getSession().getAttribute("garantiasGeneral");
			}

			Map garantias = new HashMap();
			List garan = new ArrayList();

			SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			java.util.Date fecha = null;
			if (getCampoTextual(request, "FEFECTO") != null) {
				fecha = formatoDelTexto.parse(getCampoTextual(request, "FEFECTO"));
			}

			if (fecha != null) {
				FEFECTO = new Date(fecha.getTime());
			} else {
				FEFECTO = null;
			}
			String CMONOUT = null;
			BigDecimal SUMACCAPITAL = new BigDecimal(0);
			BigDecimal SUMACPRIMA = new BigDecimal(0);

			// 27-03-2019 IAXIS-2081 BARTOLO HERRERA INICIO

			BigDecimal totalPrimaPesos = new BigDecimal(0);
			BigDecimal totalPrimaExt = new BigDecimal(0);

			// 27-03-2019 IAXIS-2081 BARTOLO HERRERA FIN

			for (int a = 0; a < listaGarantias.size(); a++) {

				BigDecimal CGARANT = (BigDecimal) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CGARANT");
				BigDecimal CMONCAP = (BigDecimal) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CMONCAP");
				BigDecimal COBLIGA = (BigDecimal) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("COBLIGA");
				/** Changed for IAXIS-4320 PK-19/06/2019 Start */
				/*
				 * BigDecimal IPRITAR =
				 * (BigDecimal)((Map)((Map)listaGarantias.get(a)).get("OB_IAX_GARANTIAS")).get(
				 * "IPRITAR");
				 */
				BigDecimal IPRIDEV = (BigDecimal) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("IPRIDEV");
				/** Changed for IAXIS-4320 PK-19/06/2019 End */
				BigDecimal ICAPITAL = (BigDecimal) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("ICAPITAL");
				String CMONINT = (String) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CMONCAPINT");
				String DESCRIPCION = (String) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
						.get("DESCRIPCION");
				String TMONCAP = (String) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS")).get("TMONCAP");
				String MONEDAFIN;
				if (COBLIGA.intValue() == 1) {
					/** Changed for IAXIS-4320 PK-19/06/2019 Start */
					/*
					 * if (IPRITAR == null) { IPRITAR =
					 * (BigDecimal)((Map)((Map)((Map)listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
					 * .get("PRIMAS")).get("IPRITAR"); }
					 */
					if (IPRIDEV == null) {
						IPRIDEV = (BigDecimal) ((Map) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
								.get("PRIMAS")).get("IPRIDEV");
					}
					/** Changed for IAXIS-4320 PK-19/06/2019 End */

					if (DESCRIPCION == null) {
						DESCRIPCION = (String) ((Map) ((Map) listaGarantias.get(a)).get("OB_IAX_GARANTIAS"))
								.get("TGARANT");
					}
					/** Changed for IAXIS-4320 PK-19/06/2019 Start */
					/*
					 * m = pac_iax_util.ejecutaPAC_IAX_UTILES__F_IMPORTE_CAMBIO(CMONINT, CMONOUT,
					 * null, IPRITAR);//27-03-2019 IAXIS-2081 BARTOLO HERRERA
					 */
					m = pac_iax_util.ejecutaPAC_IAX_UTILES__F_IMPORTE_CAMBIO(CMONINT, CMONOUT, null, IPRIDEV);
					/** Changed for IAXIS-4320 PK-19/06/2019 End */
					HashMap m2 = pac_iax_util.ejecutaPAC_IAX_UTILES__F_IMPORTE_CAMBIO(CMONINT, CMONOUT, null, ICAPITAL);// 27-03-2019
																														// IAXIS-2081
																														// BARTOLO
																														// HERRERA

					MONEDAFIN = (String) m.get("P_MONEDA_FINAL");
					BigDecimal IPRITARC;
					IPRITARC = (BigDecimal) m.get("RETURN");
					BigDecimal TASACAMB;
					TASACAMB = (BigDecimal) m.get("P_CAMBIO");
					IVAPESOS = IVA.multiply(TASACAMB);
					GASTOSPESOS = GASTOS.multiply(TASACAMB);
					BigDecimal ICAPITALC = (BigDecimal) m2.get("RETURN");
					SUMACCAPITAL = SUMACCAPITAL.add(ICAPITALC);
					SUMACPRIMA = SUMACPRIMA.add(ICAPITAL);

					// 27-03-2019 IAXIS-2081 BARTOLO HERRERA INICIO

					totalPrimaPesos = totalPrimaPesos.add(IPRITARC);

					/** Changed for IAXIS-4320 PK-19/06/2019 Start */
					/* totalPrimaExt = totalPrimaExt.add(IPRITAR); */
					totalPrimaExt = totalPrimaExt.add(IPRIDEV);
					/** Changed for IAXIS-4320 PK-19/06/2019 End */

					// 27-03-2019 IAXIS-2081 BARTOLO HERRERA FIN

					if (FEFECTO == null) {
						fecha = new java.util.Date();
						FEFECTO = new Date(fecha.getTime());
					}
					/** Changed for IAXIS-4320 PK-19/06/2019 Start */
					/*
					 * garantias = rellenaMapGarantias(CGARANT, DESCRIPCION, IPRITAR, TASACAMB,
					 * CMONCAP, CMONINT, TMONCAP, MONEDAFIN, ICAPITAL, ICAPITALC, IPRITARC,
					 * SUMACCAPITAL, IVA, IVAPESOS, FEFECTO);
					 */
					garantias = rellenaMapGarantias(CGARANT, DESCRIPCION, IPRIDEV, TASACAMB, CMONCAP, CMONINT, TMONCAP,
							MONEDAFIN, ICAPITAL, ICAPITALC, IPRITARC, SUMACCAPITAL, IVA, IVAPESOS, FEFECTO);
					/** Changed for IAXIS-4320 PK-19/06/2019 Start */
					garan.add(garantias);
				}
			}

			request.getSession().setAttribute("garantiasMoneda", ((garan == null) ? new ArrayList() : garan));
			request.getSession().setAttribute("SUMACCAPITAL", SUMACCAPITAL);
			request.getSession().setAttribute("SUMACPRIMA", SUMACPRIMA);
			request.getSession().setAttribute("IVA", IVA);
			request.getSession().setAttribute("IVAPESOS", IVAPESOS);
			request.getSession().setAttribute("GASTOS", GASTOS);
			request.getSession().setAttribute("GASTOSPESOS", GASTOSPESOS);

			// 27-03-2019 IAXIS-2081 BARTOLO HERRERA INICIO
			request.getSession().setAttribute("TOTALPRIMAPESOS", totalPrimaPesos);
			request.getSession().setAttribute("TOTALPRIMAEXT", totalPrimaExt);

			BigDecimal sumaTotal = totalPrimaPesos.add(GASTOS);
			request.getSession().setAttribute("TOTAL", sumaTotal);

			// 27-03-2019 IAXIS-2081 BARTOLO HERRERA FIN

			tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr222Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 *
	 * @param idGarant
	 * @param DESCRIPCION
	 * @param //IPRITAR   -> IPRIDEV
	 * @param TCAMBIO
	 * @param CMONCAP
	 * @param CMONINT
	 * @param TMONCAP
	 * @param MONCAPFINAL
	 * @param ICAPITAL
	 * @param ICAPITALC
	 * @param IPRITARC
	 * @param SUMACAPITAL
	 * @return
	 */
	/** Changed for IAXIS-4320 PK-19/06/2019 Start */
	private Map rellenaMapGarantias(BigDecimal idGarant, String DESCRIPCION,
			/* BigDecimal IPRITAR, */BigDecimal IPRIDEV, BigDecimal TCAMBIO, BigDecimal CMONCAP, String CMONINT,
			String TMONCAP, String MONCAPFINAL, BigDecimal ICAPITAL, BigDecimal ICAPITALC, BigDecimal IPRITARC,
			BigDecimal SUMACAPITAL, BigDecimal IVA, BigDecimal IVAPESOS, Date FCAMBIO) {
		Map m = new HashMap();
		BigDecimal id = idGarant;
		System.out.println("idGarant: " + idGarant);

		m.put("CGARANT", id);
		m.put("DESCRIPCION", DESCRIPCION);
		/* m.put("IPRITAR", IPRITAR); */
		m.put("IPRIDEV", IPRIDEV);
		/** Changed for IAXIS-4320 PK-19/06/2019 End */
		m.put("TCAMBIO", TCAMBIO);
		m.put("CMONCAP", CMONCAP);
		m.put("CMONCAPINT", CMONINT);
		m.put("CMONCAPFIN", MONCAPFINAL);
		m.put("TMONCAP", TMONCAP);
		m.put("ICAPITAL", ICAPITAL);
		m.put("ICAPITALC", ICAPITALC);
		m.put("IPRITARC", IPRITARC);
		m.put("SUMACAPITAL", SUMACAPITAL);
		m.put("IVA", IVA);
		m.put("IVAPESOS", IVAPESOS);
		m.put("FCAMBIO", FCAMBIO);

		return m;
	}

}
