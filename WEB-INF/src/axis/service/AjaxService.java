package axis.service;

import java.io.Serializable;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.control.AjaxAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class AjaxService implements Serializable {

	private static final long serialVersionUID = -4382542457032888901L;
	static Log logger = LogFactory.getLog(AjaxService.class);

	public void m_form(HttpServletRequest request, AjaxAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String ajaxMessage = new ConversionUtil().printAsXML(request.getAttribute(Constantes.AJAXCONTAINER), "ajax",
					true, true, "yyyyMMddHHmmss", true);
			request.setAttribute("ajaxMessage", ajaxMessage);
		} catch (Exception e) {
			logger.debug("Error", e);
		}

	}

}
