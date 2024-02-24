package axis.service;

import java.io.Serializable;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AjaxpAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class AjaxpService implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 2991468008825173417L;
	static Log logger = LogFactory.getLog(AjaxpService.class);

	public void m_form(HttpServletRequest request, AjaxpAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// if (request.getAttribute(Constantes.AJAXPCONTENTYPE)==null) {
			// request.setAttribute(Constantes.AJAXPCONTENTYPE, "text/plain;
			// charset=windows-1252");
			// }
			// logger.debug("ajaxp
			// AJAXPCONTENTYPE:"+request.getAttribute(Constantes.AJAXPCONTENTYPE)+"
			// AJAXPCONTAINER:"+request.getAttribute(Constantes.AJAXPCONTAINER));

			// request.getAttribute(Constantes.AJAXPCONTAINER);
			// request.setAttribute("ajaxpMessage", ajaxpMessage);
		} catch (Exception e) {
			logger.debug("Error", e);
		}

	}

}
