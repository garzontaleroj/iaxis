//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AYUDA;
import axis.mvc.control.AyudaAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.AyudaTag;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class AyudaService extends AxisBaseService implements Serializable {

	private static final long serialVersionUID = -1423324515104530200L;
	static Log logger = LogFactory.getLog(AyudaService.class);

	/**
	 * Recupera del "cache" de ayuda todos los registros que corresponden a CIDIOMA
	 * y CFORM y lo mete como un ArrayList en la request.
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_form(HttpServletRequest request, AyudaAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String LOCALE = (String) request.getSession().getAttribute(Constantes.LOCALE);
			BigDecimal CIDIOMA = ConversionUtil.locale2CIDIOMA(LOCALE);
			String CFORM = request.getParameter("CFORM").toUpperCase();
			// no lo necesitamos String CITEM=request.getParameter("CITEM").toUpperCase();
			HashMap reg = null;
			ArrayList ayudalista = new ArrayList();
			logger.debug("Ses olicita la yuada completa para " + CIDIOMA + " " + CFORM);
			for (Object rego : AyudaTag.ayudacursor) {
				reg = (HashMap) rego;
				if (reg.get("CIDIOMA").equals(CIDIOMA) && reg.get("CFORM").equals(CFORM)) {
					ayudalista.add(reg);
				}
			}
			request.setAttribute("ayudalista", ayudalista);
		} catch (Exception e) {
			logger.debug("Error", e);
		}
	}

	public void m_ayudaTitulo(HttpServletRequest request, AyudaAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String LOCALE = (String) request.getSession().getAttribute(Constantes.LOCALE);
			BigDecimal CIDIOMA = ConversionUtil.locale2CIDIOMA(LOCALE);
			String CFORM = request.getParameter("CFORM").toUpperCase();
			// no lo necesitamos String CITEM=request.getParameter("CITEM").toUpperCase();
			logger.debug("Ses olicita la yuada completa para " + CIDIOMA + " " + CFORM);

			PAC_IAX_AYUDA paxIaxAyuda = new PAC_IAX_AYUDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap map = paxIaxAyuda.ejecutaPAC_IAX_AYUDA__F_GET_AYUDA(CIDIOMA, CFORM);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			if (BigDecimal.ZERO.equals(resultado)) {
				// montar en sesion ayudalista la ayuda para que la pinte la pantalla
				request.setAttribute("ayudalista", map.get("AYUDACURSOR"));
			}
		} catch (Exception e) {
			logger.debug("Error", e);
		}
	}
}