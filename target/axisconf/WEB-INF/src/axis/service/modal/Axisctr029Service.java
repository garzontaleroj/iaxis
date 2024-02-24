package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr029Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr029Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisctr029Action thisAction) {
		logger.debug("Axisctr029Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(NRIESGO)) {
				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLERIESGOPERSONAL(NRIESGO);
				logger.debug(map);
				List T_IAX_PERSONAS = (List) tratarRETURNyMENSAJES(request, map);
				formdata.put("T_IAX_PERSONAS", T_IAX_PERSONAS);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
