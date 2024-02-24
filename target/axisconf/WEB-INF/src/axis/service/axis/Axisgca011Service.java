//Revision:# sja3AyAyxn+MQYbIzHcMQg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca011Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca011Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca011Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			AxisServiceDetValores service = new AxisServiceDetValores();
			String action = getCampoTextual(request, "action");

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSIDCON = getCampoNumerico(request, "SIDCON");
			BigDecimal pNLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal pCESTADOI = getCampoNumerico(request, "CESTADOI");
			BigDecimal pCESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pCCRUCE = getCampoNumerico(request, "CCRUCE");
			BigDecimal pCCRUCEDET = getCampoNumerico(request, "CCRUCEDET");
			String pPTOBSERVA = getCampoTextual(request, "TOBSERVA");

			service.addDetvalores(request, 668, "LS_ESTADOS");
			service.addDetvalores(request, 54, "LS_MESES");

			service.addDetvalores(request, 4001, "LS_CESTADOI");
			service.addDetvalores(request, 4001, "LS_CESTADO");
			service.addDetvalores(request, 4002, "LS_CCRUCE");

			service.addDetvalores(request, 4003, "LS_CCRUCEDET_6");
			service.addDetvalores(request, 4004, "LS_CCRUCEDET_7");
			service.addDetvalores(request, 4005, "LS_CCRUCEDET_NO6NO7");

			if (action != null && action.equals("GUARDAR")) {

				Map mapReturnGCA_CONCILIACIONCAB = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONDET(new BigDecimal("1"), pPSIDCON, pNLINEA,
								null, null, null, null, null, null, null, null, null, null, null, null, null, null,
								null, null, null, null, null, null, pCCRUCE, pCCRUCEDET, pCESTADOI, pCESTADO,
								pPTOBSERVA, null, null, null, null);
				if (BigDecimal.ZERO.equals(this.tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACIONCAB, false))) {
					request.setAttribute("grabarOK", true);
				}
			}

			Map DETGCA_CONCILIACIONDET = null;
			Map mapReturnGCA_CONCILIACIONCAB = pac_IAX_GESTION_CAR
					.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONDET(pPSIDCON, pNLINEA, null, null, null, null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
							null, pCCRUCE, null, null, null, null, null, null, null, null);

			List<Map> listGCA_CONCILIACIONDET = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACIONCAB);

			if (listGCA_CONCILIACIONDET != null)
				for (Map obj : listGCA_CONCILIACIONDET) {
					DETGCA_CONCILIACIONDET = obj;
				}
			if (action != null && action.equals("FORMIN")) {
				DETGCA_CONCILIACIONDET = new HashMap();
				DETGCA_CONCILIACIONDET.put("SIDCON", pPSIDCON);
				DETGCA_CONCILIACIONDET.put("NLINEA", pNLINEA);
				DETGCA_CONCILIACIONDET.put("CESTADOI", pCESTADOI);
				DETGCA_CONCILIACIONDET.put("CESTADO", pCESTADO);
				DETGCA_CONCILIACIONDET.put("CCRUCE", pCCRUCE);
				DETGCA_CONCILIACIONDET.put("CCRUCEDET", pCCRUCEDET);
				DETGCA_CONCILIACIONDET.put("TOBSERVA", pPTOBSERVA);
			}

			formdata.put("DETGCA_CONCILIACIONDET", DETGCA_CONCILIACIONDET);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca011Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}