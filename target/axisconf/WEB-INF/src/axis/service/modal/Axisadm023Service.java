package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm023Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm023Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm023Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES_AXISADM023");

			if (isEmpty(SPROCES)) {
				SPROCES = getCampoNumerico(request, "SPROCES");
				formdata.put("SPROCES_AXISADM023", SPROCES);
			}

			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_GET_DATOS_PROCESO(SPROCES);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map))
				formdata.putAll(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm023Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
