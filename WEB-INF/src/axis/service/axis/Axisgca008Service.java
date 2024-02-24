//Revision:# 8RL0VLXp+l7uU/NgyoAxEw== #
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

public class Axisgca008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca008Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca008Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca008Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			AxisServiceDetValores service = new AxisServiceDetValores();
			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapReturnGCA_CARGACONC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CARGACONC(null,
					null);
			List<Map> listGCA_CARGACONC = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CARGACONC);

			String action = getCampoTextual(request, "action");

			BigDecimal pPSIDCON = getCampoNumerico(request, "SIDCON");
			BigDecimal pPACON = getCampoNumerico(request, "ACON");
			BigDecimal pPMCON = getCampoNumerico(request, "MCON");
			String pPTDESC = getCampoTextual(request, "TDESC");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
			String pPNNUMIDEAGE = getCampoTextual(request, "NNUMIDEAGE");
			BigDecimal pPCFICHERO = getCampoNumerico(request, "CFICHERO");
			BigDecimal pPSPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal pPCESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pPNCODACTA = getCampoNumerico(request, "NCODACTA");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUMOD = getCampoTextual(request, "CUSUMOD");
			Date pPFMODIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FMODIFI"), "dd/MM/yyyy");

			service.addDetvalores(request, 54, "LS_MESES");
			service.addDetvalores(request, 8001043, "LS_DOCUMENTOS");
			request.setAttribute("LS_GCA_CARGACONC", listGCA_CARGACONC);
			service.addSucursales(request, "LS_SUCURSALES", new BigDecimal(2), usuario.getCidioma());

			if (action != null && action.equals("ACEPTAR")) {
				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONCAB(pPSIDCON, pPACON,
						pPMCON, pPTDESC, pPCSUCURSAL, pPNNUMIDEAGE, pPCFICHERO, pPSPROCES, pPCESTADO, pPNCODACTA,
						pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
				this.tratarRETURNyMENSAJES(request, map);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca008Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
