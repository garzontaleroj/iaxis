//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
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

import axis.jdbc.PAC_IAX_GEDOX;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * AxisfileuploadAction.java 07/07/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class AxisfileuploadAction extends AbstractDispatchAction {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			ActionForward init(ActionMapping mapping, ActionForm form, HttpServletRequest request,
					HttpServletResponse response) throws IOException, ServletException {
		logger.debug("AxisfileuploadAction Init");
		return this.form(mapping, form, request, response);
	}

	public ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		logger.debug("AxisfileuploadAction Form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_CATEGOR();
			logger.debug(map);
			formdata.put("LSTCATEGOR", tratarRETURNyMENSAJES(request, map));

			String TIPO;
			if (AxisBaseService.isEmpty(AxisBaseService.getCampoTextual(request, "TIPO"))) {
				TIPO = "";
			} else {
				TIPO = AxisBaseService.getCampoTextual(request, "TIPO");
			}
			formdata.put("TIPO", TIPO);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisfileuploadAction - m�todo form", e);
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
