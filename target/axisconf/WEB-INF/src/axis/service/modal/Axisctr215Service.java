package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PROVISIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr215Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr215Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que carga el detalle del riesgo asegurado.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr215Action thisAction) {
		logger.debug("Axisctr215Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			BigDecimal SSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = getHiddenCampoNumerico(request, "NMOVIMI");
			BigDecimal CGARANT = getHiddenCampoNumerico(request, "CGARANT");

			java.sql.Date FECHA = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FECHA"));

			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			// if (!isEmpty (NRIESGO)) {
			Map map = new PAC_IAX_PROVISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PROVISIONES__F_DETALLE_PU(SSEGURO, NRIESGO, CGARANT, NMOVIMI, FECHA);
			logger.debug(map);
			List PROVISION = (List) tratarRETURNyMENSAJES(request, map);
			// formdata.put("PROVISION", PROVISION);
			logger.debug(PROVISION);
			// Map provi = (Map)PROVISION.get(0);

			formdata.put("PROVISION", PROVISION);
			/*
			 * formdata.put("FINIEFE", provi.get("FINIEFE")); formdata.put("NDETGAR",
			 * provi.get("NDETGAR")); formdata.put("ICAPITAL", provi.get("ICAPITAL"));
			 * formdata.put("IPRIANU", provi.get("IPRIANU")); formdata.put("IPROVRES",
			 * provi.get("IPROVRES"));
			 */

			// }
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr215Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
