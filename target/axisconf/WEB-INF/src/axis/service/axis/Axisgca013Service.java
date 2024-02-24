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

public class Axisgca013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca013Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca013Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca013Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			AxisServiceDetValores service = new AxisServiceDetValores();
			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapReturnGCA_CARGACONC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CARGACONC(null,
					null);
			List<Map> listGCA_CARGACONC = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CARGACONC);

			formdata.put("LIST_FICHEROS", listGCA_CARGACONC);
			String action = getCampoTextual(request, "action");

			BigDecimal pPCFICHERO = getCampoNumerico(request, "CFICHERO");

			if (action != null && action.equals("BUSCAR")) {
				Map mapReturnMapeo = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_MAPEO(pPCFICHERO);
				List<Map> LIST_MAPEO = (List) tratarRETURNyMENSAJES(request, mapReturnMapeo);

				formdata.put("LIST_MAPEO", LIST_MAPEO);

			}

			formdata.put("CFICHERO", pPCFICHERO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca013Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}