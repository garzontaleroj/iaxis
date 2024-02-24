package axis.mvc.control.modal;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * AxisConfirm.java 07/07/2008
 * 
 * @author <a href="dramon@csi-ti.com">david ramon</a>
 * @since Java 5.0
 */
public class AxisConfirm extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("AxisConfirm Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("AxisConfirmAction Form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio AxisConfirm - m�todo form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		return mapping.findForward("form");
	}

	/**
	 * Devuelve el par�metro RETURN de una llamada a una funci�n JDBC y parsea los
	 * MENSAJES si existen.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param map     El Map que retorna la funci�n JDBC.
	 * @return Object - El objeto contenido en RETURN.
	 * @trows IllegalArgumentException - Si alguno de los par�metros est� vac�o.
	 */
	private Object tratarRETURNyMENSAJES(HttpServletRequest request, Map map) {
		if (request == null)
			throw new IllegalArgumentException("El argumento request no puede ser nulo.");
		if (map == null)
			throw new IllegalArgumentException("El argumento map no puede ser nulo.");

		if (!AxisBaseService.isEmpty(map.get("MENSAJES")))
			AbstractDispatchAction.parsearMensajes(request, (List) map.get("MENSAJES"));

		return map.get("RETURN");
	}

}
