package axis.service.axis;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SIN_IMPUESTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisimp010Action;
import axis.util.Constantes;

public class Axisimp010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisimp010Action thisAction) {
		logger.debug("Axisimp010Service m_form");
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisimp010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axisimp010Action thisAction) {
		logger.debug("Axisimp010Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pCPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
			BigDecimal pCPOBLAC = this.getCampoNumerico(request, "CPOBLAC");

			String pTPAIS = this.getCampoTextual(request, "TPAIS");
			formdata.put("TPAIS", pTPAIS);
			String pTPROVIN = this.getCampoTextual(request, "TPROVIN");
			formdata.put("TPROVIN", pTPROVIN);
			String pTPOBLAC = this.getCampoTextual(request, "TPOBLAC");
			formdata.put("TPOBLAC", pTPOBLAC);

			if (!isEmpty(pCPAIS) && !isEmpty(pCPAIS) && !isEmpty(pCPAIS)) {
				Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_DEFINICIONES_RETEICA(pCPAIS, pCPROVIN, pCPOBLAC);
				logger.debug("++++lstdefinicionesreteica:" + map);
				formdata.put("lstdefinicionesreteica", tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisimp010Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal pCPAIS = this.getCampoNumerico(request, "CPAIS");
		BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
		BigDecimal pCPOBLAC = this.getCampoNumerico(request, "CPOBLAC");

		Map map = new PAC_IAX_SIN_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_IMPUESTOS__F_GET_DEFINICIONES_RETEICA(pCPAIS, pCPROVIN, pCPOBLAC);
		logger.debug(map);
		formdata.put("lstdefinicionesreteica", tratarRETURNyMENSAJES(request, map));
	}

	public void m_aceptar(HttpServletRequest request, Axisimp010Action thisAction) {
		logger.debug("Axisimp010Service m_aceptar");
		try {

			BigDecimal pCPAIS = this.getCampoNumerico(request, "CPAIS");
			logger.debug("++++pCPAIS-->" + pCPAIS);
			BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
			logger.debug("++++pCPROVIN-->" + pCPROVIN);
			BigDecimal pCPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			logger.debug("++++pCPOBLAC-->" + pCPOBLAC);
			java.sql.Date pFDESDE = this.stringToSqlDate(request.getParameter("FDESDE"));
			logger.debug("++++FDESDE-->" + pFDESDE);
			String pVALORES = request.getParameter("valores_reteica");
			logger.debug("++++valores_reteica-->" + pVALORES);

			PAC_IAX_SIN_IMPUESTOS pac_iax_sin_impuestos = new PAC_IAX_SIN_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_sin_impuestos.ejecutaPAC_IAX_SIN_IMPUESTOS__F_SET_VALORES_RETEICA(pCPAIS, pCPROVIN,
					pCPOBLAC, pFDESDE, pVALORES);

			logger.debug(map);
			request.setAttribute("grabarOK", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
