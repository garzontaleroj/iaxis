//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisgca014Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisgca014Service.java 08/07/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0 Servicio de la pantalla modal CITAS MEDICAS
 *        (ALTA/MODIFICACION)
 */
public class Axisgca014Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "static-access" })
	public void m_form(HttpServletRequest request, Axisgca014Action thisAction) {
		logger.debug("Axisgca014Service m_form");

		try {

			this.cargarCombos(request);

			String TCOLORI = getCampoTextual(request, "TCOLORI");
			BigDecimal CFICHERO = getCampoNumerico(request, "CFICHERO");
			String TCOLDEST = getCampoTextual(request, "TCOLDEST");
			String TDESCOLM = getCampoTextual(request, "TDESCOLM");
			String TFICHERO = getCampoTextual(request, "TFICHERO");

			@SuppressWarnings("rawtypes")
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			formdata.put("CFICHERO", CFICHERO);
			formdata.put("TFICHERO", TFICHERO);
			formdata.put("TCOLDEST", TCOLDEST);
			formdata.put("TDESCOLM", TDESCOLM);

			formdata.put("TCOLORI", TCOLORI.replace("$[]", "'"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	@SuppressWarnings("static-access")
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisgca014Service cargarCombos");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca014Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	@SuppressWarnings("static-access")
	public void m_aceptar(HttpServletRequest request, Axisgca014Action thisAction) {
		logger.debug("Axisgca014Action m_aceptar");

		try {

			String TCOLORI = getCampoTextual(request, "TCOLORI");
			BigDecimal CFICHERO = getCampoNumerico(request, "CFICHERO");
			String TCOLDEST = getCampoTextual(request, "TCOLDEST");

			PAC_IAX_GESTION_CAR pacGestionCar = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			@SuppressWarnings("rawtypes")
			Map resultado = pacGestionCar.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_MAPEO(CFICHERO, TCOLORI, TCOLDEST);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, resultado, false))) {
				request.setAttribute("grabarOK", true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca014Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		}
	}

}
