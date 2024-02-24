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
import axis.service.axis.AxisBaseService;
import axis.service.modal.Axisper030Service;

/**
 * Axisper030Action.java 07/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisper030Action extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());
	private Axisper030Service miServicio = new Axisper030Service();

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper030Action Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper030Action Form");

		miServicio.m_form(request);
		return mapping.findForward("form");

	}

	public ActionForward actualizardoc(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("Axisper030Action actualizardoc");

		miServicio.m_actualizardoc(request);
		return this.form(mapping, form, request, response);

	}

	public ActionForward ajax_f_cambiarcaducidad(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		log.info("Axisper03Action ajax_f_cambiarcaducidad");
		miServicio.m_ajax_f_cambiarcaducidad(request);
		return mapping.findForward("ajax");
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
