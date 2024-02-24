//Revision:# wMBof6ed/Xp34vT/zCjQJA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca003Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca003Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca003Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");
			BigDecimal NSINIES_R = getCampoNumerico(request, "NSINIES_R");
			BigDecimal NTRAMIT_R = getCampoNumerico(request, "NTRAMIT_R");
			BigDecimal NPOLIZA_R = getCampoNumerico(request, "NPOLIZA_R");
			String pPTTITOBS = getCampoTextual(request, "TTITOBS");
			String pPTOBS = getCampoTextual(request, "TOBS");
			String pPCUSUALT_GR = usuario.getUsuario();

			if (action != null && action.equals("GUARDAR")) {
				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_SIN_APUNTES_REC(null, NSINIES_R,
						NTRAMIT_R, NPOLIZA_R, pPTTITOBS, null, pPCUSUALT_GR, pPTOBS);
				this.tratarRETURNyMENSAJES(request, map);

			}
			Map mapReturnGESTION_CARTERA_RECOBRO = pac_IAX_GESTION_CAR
					.ejecutaPAC_IAX_GESTION_CAR__F_GET_GESTION_CARTERA_RECOBRO(null, null, null, null, null, null, null,
							null, null, NSINIES_R, NTRAMIT_R, NPOLIZA_R);
			List<Map> GCA_CONCILIACIONCABS = (List) tratarRETURNyMENSAJES(request, mapReturnGESTION_CARTERA_RECOBRO);

			formdata.put("GCA_CONCILIACIONCABS", GCA_CONCILIACIONCABS);

			Map mapReturnSIN_APUNTES_REC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_SIN_APUNTES_REC(null,
					NSINIES_R, NTRAMIT_R, NPOLIZA_R, null, null, null, null);
			List<Map> listSIN_APUNTES_REC = (List) tratarRETURNyMENSAJES(request, mapReturnSIN_APUNTES_REC);

			formdata.put("LISTSIN_APUNTES_REC", listSIN_APUNTES_REC);

			formdata.put("NSINIES_R", NSINIES_R);
			formdata.put("NTRAMIT_R", NTRAMIT_R);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}