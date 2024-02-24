package axis.service;

import java.io.Serializable;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MENU;
import axis.mvc.control.FormlauncherAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class FormlauncherService extends AxisBaseService implements Serializable {

	private static final long serialVersionUID = 1612037164401932228L;
	static Log logger = LogFactory.getLog(FormlauncherService.class);

	public void m_init(HttpServletRequest request, FormlauncherAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.debug("Error", e);
		}
	}

	public void m_form(HttpServletRequest request, FormlauncherAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.debug("Error", e);
		}
	}

	public void m_launch(HttpServletRequest request, FormlauncherAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String form_act = (String) formdata.get("form_act");
		logger.debug("FORM_ACT: " + form_act);
		String stringUrl = "";
		try {
			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MENU pac_axis_menu = new PAC_IAX_MENU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (form_act.endsWith("_adf")) {
				HashMap ret = pac_axis_menu.ejecutaPAC_IAX_MENU__F_GET_URLADF(form_act);
				stringUrl = (String) this.tratarRETURNyMENSAJES(request, ret);
			} else {
				HashMap ret = pac_axis_menu.ejecutaPAC_IAX_MENU__F_GET_URLFORMS(form_act);
				stringUrl = (String) this.tratarRETURNyMENSAJES(request, ret);
			}
			request.setAttribute("stringUrl", stringUrl);

		} catch (Exception e) {
			logger.debug("Error", e);
		}
	}
}
