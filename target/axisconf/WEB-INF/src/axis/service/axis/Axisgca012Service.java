//Revision:# sVByxLljg78IupeeGkSjNw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca012Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca012Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca012Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			AxisServiceDetValores service = new AxisServiceDetValores();

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");

			BigDecimal pPNCONCIACT = getCampoNumerico(request, "NCONCIACT");
			BigDecimal pPCCONACTA = getCampoNumerico(request, "CCONACTA");
			BigDecimal pPNCANTIDAD = getCampoNumerico(request, "NCANTIDAD");
			BigDecimal pPNVALOR = getCampoNumerico(request, "NVALOR");
			BigDecimal pPCRESPAGE = getCampoNumerico(request, "CRESPAGE");
			BigDecimal pPCRESPCIA = getCampoNumerico(request, "CRESPCIA");
			Date pPFSOLUCION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSOLUCION"),
					"dd/MM/yyyy");
			String pPTOBS = getCampoTextual(request, "TOBS");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUMOD = getCampoTextual(request, "CUSUMOD");
			Date pPFMODIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FMODIFI"), "dd/MM/yyyy");

			if (action != null && action.equals("FORM")) {

				Map mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(pPNCONCIACT, null, null);
				List<Map> listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request,
						mapReturnGCA_CONCILIACION_ACTA);

				Map ITMGCA_CONCILIACION_ACTA = null;
				for (Map m : listGCA_CONCILIACION_ACTA) {
					ITMGCA_CONCILIACION_ACTA = m;
				}

				formdata.put("ITMGCA_CONCILIACION_ACTA", ITMGCA_CONCILIACION_ACTA);

			}
			formdata.put("NCONCIACT", pPNCONCIACT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}