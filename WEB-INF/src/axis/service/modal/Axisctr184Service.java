package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRESTAMOS;
import axis.mvc.control.modal.Axisctr184Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr184Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisctr184Action thisAction) {
		logger.debug("Axisctr184Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr184Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr184Action thisAction) {
		logger.debug("Axisctr184Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRESTAMOS pacIaxPrestamos = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String CTAPRES = getCampoTextual(request, "CTAPRES");

			formdata.put("SSEGURO", SSEGURO);
			formdata.put("NRIESGO", NRIESGO);
			formdata.put("CTAPRES", CTAPRES);

			logger.debug("-----> SSEGURO:" + SSEGURO + " NRIESGO:" + NRIESGO + " CTAPRES:" + CTAPRES);

			Map map = pacIaxPrestamos.ejecutaPAC_IAX_PRESTAMOS__F_GET_DETPRESTAMO_cuota(SSEGURO, NRIESGO, CTAPRES,
					new BigDecimal(2), new BigDecimal(0));
			logger.debug("---- detalle prestamo:" + map);

			Map prestamo = (Map) tratarRETURNyMENSAJES(request, map);

			List cuadros = null;
			List cuotas = null;
			List pagos = null;
			BigDecimal cestado = null;

			if (!isEmpty(prestamo)) {
				cuadros = (List) prestamo.get("CUADRO");
				cuotas = (List) prestamo.get("CUOTAS");
				pagos = (List) prestamo.get("PAGO");
				cestado = (BigDecimal) prestamo.get("CESTADO");

				logger.debug("---> cuadro:" + cuadros + " cuotas:" + cuotas);
				formdata.put("lstcuadros", cuadros);
				formdata.put("lstcuotas", cuotas);
				formdata.put("fvencim", prestamo.get("FFINPREST"));
				formdata.put("icapini", prestamo.get("ICAPINI"));
				formdata.put("icapini", prestamo.get("ICAPINI"));
				formdata.put("ticapitalcuota", prestamo.get("TICAPITALCUOTA"));
				formdata.put("tiinterescuota", prestamo.get("TIINTERESCUOTA"));
				formdata.put("tidemoracuota", prestamo.get("TIDEMORACUOTA"));
			}

			logger.debug("-----> SSEGURO:" + SSEGURO + " NRIESGO:" + NRIESGO + " CTAPRES:" + CTAPRES + " CESTADO:"
					+ cestado);
			/* modififcar valores multiregistro cuadros - totales */

			if (!isEmpty(pagos)) {
				for (int z = 0; z < pagos.size(); z++) {
					HashMap mapa_pago = (HashMap) ((HashMap) pagos.get(z)).get("OB_IAX_PRESTAMOPAGO");
					BigDecimal ICAPITAL_SUM = (BigDecimal) mapa_pago.get("ICAPITAL");
					// BigDecimal IINTERES_SUM = (BigDecimal)mapa_pago.get("IINTERES");
					// BigDecimal SUMA_1 = ICAPITAL_SUM.add(IINTERES_SUM);
					// ((HashMap)
					// ((HashMap)cuadros.get(j)).get("OB_IAX_PRESTCUADRO")).put("TOTAL_1",SUMA_1);
				}
			}

			/* modififcar valores multiregistro cuadros - totales */
			if (!isEmpty(cuadros)) {
				for (int j = 0; j < cuadros.size(); j++) {
					HashMap mapa_valores = (HashMap) ((HashMap) cuadros.get(j)).get("OB_IAX_PRESTCUADRO");
					BigDecimal ICAPITAL_SUM = (BigDecimal) mapa_valores.get("ICAPITAL");
					BigDecimal IINTERES_SUM = (BigDecimal) mapa_valores.get("IINTERES");
					BigDecimal IDEMORA_SUM = (BigDecimal) mapa_valores.get("IDEMORA");
					BigDecimal SUMA_1 = ICAPITAL_SUM.add(IINTERES_SUM).add(IDEMORA_SUM);
					((HashMap) ((HashMap) cuadros.get(j)).get("OB_IAX_PRESTCUADRO")).put("TOTAL_1", SUMA_1);
				}
			}
			if (!isEmpty(cuotas)) {
				/* modififcar valores multiregistro cuotas - totales */
				for (int i = 0; i < cuotas.size(); i++) {
					HashMap mapa_val = (HashMap) ((HashMap) cuotas.get(i)).get("OB_IAX_PRESTAMOCUOTAS");
					BigDecimal IDEMORA_SUM = (BigDecimal) mapa_val.get("IDEMORA");
					BigDecimal IINTERES_SUM = (BigDecimal) mapa_val.get("IINTERES");
					BigDecimal ICAPITAL_SUM = (BigDecimal) mapa_val.get("ICAPITAL");
					BigDecimal SUMA_A = IDEMORA_SUM.add(IINTERES_SUM);
					BigDecimal SUMA_2 = SUMA_A.add(ICAPITAL_SUM);
					((HashMap) ((HashMap) cuotas.get(i)).get("OB_IAX_PRESTAMOCUOTAS")).put("TOTAL_2", SUMA_2);
				}
			}

			formdata.remove("lstprestpagos");
			formdata.put("lstprestpagos", pagos);

			if (cestado.intValue() == 2) {
				formdata.remove("lstcuadros");
			} else {
				formdata.remove("lstcuadros");
				formdata.put("lstcuadros", cuadros);
			}
			formdata.remove("lstcuotas");
			formdata.put("lstcuotas", cuotas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr184Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
