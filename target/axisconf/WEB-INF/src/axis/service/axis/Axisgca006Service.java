//Revision:# BYMKkCOq7Ru04X4xYtXg5Q== #
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

public class Axisgca006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca006Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca006Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000062", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca006Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");

			BigDecimal SGSFAVCLI = getCampoNumerico(request, "SGSFAVCLI");
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");
			String pPNTRAMIT = getCampoTextual(request, "NTRAMIT");
			Date pPTIPO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "TIPO"), "dd/MM/yyyy");
			String pPPARAMA = getCampoTextual(request, "PARAMA");
			String pPPARAMB = getCampoTextual(request, "PARAMB");

			Map mapReturnAGD_OBSERVACIONES = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_AGD_OBSERVACIONES(
					pPSSEGURO, pPNRECIBO, pPCAGENTE, pPNSINIES, pPNTRAMIT, pPTIPO, pPPARAMA, pPPARAMB, SGSFAVCLI);
			List<Map> listAGD_OBSERVACIONES = (List) tratarRETURNyMENSAJES(request, mapReturnAGD_OBSERVACIONES);

			formdata.put("LISAPUNTES_GESTION_CARTERA", listAGD_OBSERVACIONES);

			formdata.put("SGSFAVCLI", SGSFAVCLI);
			formdata.put("SSEGURO", pPSSEGURO);
			formdata.put("NRECIBO", pPNRECIBO);
			formdata.put("CAGENTE", pPCAGENTE);
			formdata.put("NSINIES", pPNSINIES);
			formdata.put("NTRAMIT", pPNTRAMIT);
			formdata.put("TIPO", pPTIPO);
			formdata.put("PARAMA", pPPARAMA);
			formdata.put("PARAMB", pPPARAMB);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000062", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}