//Revision:# FOTAK5m9sfo+A7cF7Y25hQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca007Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca007Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000072", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca007Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");

			BigDecimal pPCTIPAGD = getCampoNumerico(request, "CTIPAGD");
			BigDecimal pPSGSFAVCLI = getCampoNumerico(request, "SGSFAVCLI");
			BigDecimal pPIDOBS = getCampoNumerico(request, "IDOBS");

			String pPTTITOBS = getCampoTextual(request, "TTITOBS");
			String pPTOBS = getCampoTextual(request, "TOBS");
			BigDecimal pPCCONOBS = getCampoNumerico(request, "CCONOBS");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			String pPPARAMA = getCampoTextual(request, "PARAMA");
			String pPPARAMB = getCampoTextual(request, "PARAMB");

			Map mapTA = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTTIPOSAGENDA();

			formdata.put("PLSTTIPOSAGENDA", mapTA.get("PLSTTIPOSAGENDA"));

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTCONCEPTOS(pPCTIPAGD, null); // Tipo
																								// de
																								// agenda
			formdata.put("PLSTCONCEPTOS", map.get("PLSTCONCEPTOS"));

			if (action != null && action.equals("BUSCAR")) {

				Map mapReturnAGD_OBSERVACIONES = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(null, null, null, null, null, null,
								pPPARAMA, pPPARAMB, pPSGSFAVCLI);
				List<Map> listAGD_OBSERVACIONES = (List) tratarRETURNyMENSAJES(request, mapReturnAGD_OBSERVACIONES);

				Map DETAGD_OBSERVACIONES = null;
				if (listAGD_OBSERVACIONES != null)
					for (Map obj : listAGD_OBSERVACIONES) {
						DETAGD_OBSERVACIONES = obj;
					}
				formdata.put("DETAGD_OBSERVACIONES", DETAGD_OBSERVACIONES);
			}
			// @BRSP En esta seccion se deja preparado para guardar
			if (action != null && action.equals("GUARDAR")) {

				Map mapGuardar = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_AGD_OBSERVACIONES(
						usuario.getCempres(), pPIDOBS, new BigDecimal(2), null, pPTTITOBS, pPTOBS, null, null,
						new BigDecimal(10), null, null, null, null, null, null, null, null, null, pPCUSUALT, pPFALTA,
						null, null, pPSGSFAVCLI);

				if (tratarRETURNyMENSAJES(request, mapGuardar, false) != null) {

					request.setAttribute("grabarOK", true);
				}

				Map mapReturnAGD_OBSERVACIONES = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(null, null, null, null, null, null,
								pPPARAMA, mapGuardar.get("RETURN").toString(), pPSGSFAVCLI);
				List<Map> listAGD_OBSERVACIONES = (List) tratarRETURNyMENSAJES(request, mapReturnAGD_OBSERVACIONES);

				Map DETAGD_OBSERVACIONES = null;
				if (listAGD_OBSERVACIONES != null)
					for (Map obj : listAGD_OBSERVACIONES) {
						DETAGD_OBSERVACIONES = obj;
					}
				formdata.put("DETAGD_OBSERVACIONES", DETAGD_OBSERVACIONES);
			}

			formdata.put("CTIPAGD", pPCTIPAGD);
			formdata.put("SGSFAVCLI", pPSGSFAVCLI);
			formdata.put("IDOBS", pPIDOBS);
			formdata.put("TTITOBS", pPTTITOBS);
			formdata.put("TOBS", pPTOBS);
			formdata.put("CCONOBS", pPCCONOBS);
			formdata.put("FALTA", pPFALTA);
			formdata.put("CUSUALT", usuario.getCusuari());
			formdata.put("PARAMA", pPPARAMA);
			formdata.put("PARAMB", pPPARAMB);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000072", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
