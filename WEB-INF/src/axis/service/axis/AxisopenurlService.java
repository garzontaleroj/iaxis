package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MENU;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.axis.AxisopenurlAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * AxisformService Lanzador de una url
 * <ul>
 * <li><code>axisopenurl</code>: Lanzador en una nueva pantalla
 * <li><code>Fecha creaci�n</code>: 23/05/2008
 * </ul>
 */
public class AxisopenurlService extends AxisBaseService {
	static Log logger = LogFactory.getLog(AxisopenurlService.class);

	public void m_form(HttpServletRequest request, AxisopenurlAction thisAction) throws Exception {
		String url = "";
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// Carga de las PAC_IAX PL/SQL
			if (isEmpty((String) formdata.get("URL"))) {
				BigDecimal cmenu = new BigDecimal((String) formdata.get("CMENU"));
				PAC_IAX_MENU pac_axis_menu = new PAC_IAX_MENU(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				HashMap ret = pac_axis_menu.ejecutaPAC_IAX_MENU__F_GET_URL(cmenu);
				url = (String) this.tratarRETURNyMENSAJES(request, ret);
				formdata.put("CVISTA", ret.get("PNVISTA"));
				BigDecimal CEMPRES = usuario.getCempres();
				Map m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("SIS_EXTERNO_PRB", CEMPRES);
				String SIS_EXTERNO_PRB = (String) m.get("RETURN");

				if (!isEmpty(SIS_EXTERNO_PRB)) {
					HashMap tok = pac_axis_menu.ejecutaPAC_IAX_MENU__F_GET_TOKEN();
					String token = (String) this.tratarRETURNyMENSAJES(request, tok);
					url = url + SIS_EXTERNO_PRB + "=" + token;
					formdata.put("URL", url);
				} else {
					formdata.put("URL", url);
				}
			}
			request.setAttribute(Constantes.FORMDATA, formdata);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.debug("Error", e);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
