package axis.service.axis;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTTABLAS;
import axis.mvc.control.axis.Axismnt002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axismnt002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, Axismnt002Action thisAction) {
		logger.debug("Axismnt002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (request.getSession().getAttribute("axismnt002_lista") == null || formdata.get("paginar") == null) {
				// recuperar nueva lista y dejarla en le session como axismnt002_lista
				HashMap ejecuta = new PAC_IAX_MNTTABLAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTTABLAS__F_GET_TABLAS();
				request.getSession().setAttribute("axismnt002_lista", this.tratarRETURNyMENSAJES(request, ejecuta));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axismnt002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_init(HttpServletRequest request, Axismnt002Action thisAction) {
		logger.debug("Axismnt002Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("axismnt002_lista");
		} catch (Exception e) {
			logger.error("Error en el servicio axismnt002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
