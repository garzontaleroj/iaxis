package axis.service.modal;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm097Service extends AxisBaseService {

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
		logger.debug("Axisadm039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm039Service - m�todo m_form", e);

		} finally {
			AbstractDispatchAction.topPila(request, "EJECUTAR_A_SALIR",
					"PAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
