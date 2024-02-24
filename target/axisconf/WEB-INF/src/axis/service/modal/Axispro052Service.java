package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro052Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro052Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro052Action thisAction) {
		logger.debug("Axispro052Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		String CCODIGO = getCampoTextual(request, "CCODIGO");
		logger.debug("CCODIGO=" + CCODIGO);
		String CVALAXIS = getCampoTextual(request, "CVALAXIS");
		logger.debug("CVALAXIS=" + CVALAXIS);
		String CVALAXISDEF = getCampoTextual(request, "CVALAXISDEF");
		logger.debug("CVALAXISDEF=" + CVALAXISDEF);
		String CVALEMP = getCampoTextual(request, "CVALEMP");
		logger.debug("CVALEMP=" + CVALEMP);
		String CVALDEF = getCampoTextual(request, "CVALDEF");
		logger.debug("CVALDEF=" + CVALDEF);
		String SPRODUC = getCampoTextual(request, "SPRODUC");
		logger.debug("SPRODUC=" + SPRODUC);

		formdata.put("CCODIGO", CCODIGO);
		formdata.put("CVALAXIS", CVALAXIS);
		formdata.put("CVALAXISDEF", CVALAXISDEF);
		formdata.put("CVALEMP", CVALEMP);
		formdata.put("CVALDEF", CVALDEF);
		formdata.put("SPRODUC", SPRODUC);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axispro052Service.class));

	}

	public void m_guardar(HttpServletRequest request, Axispro052Action thisAction) {

		logger.debug("Axispro052Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.setAttribute("OK", "!OK");
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			logger.debug(CAGENTE);

			String CCODIGO = getCampoTextual(request, "CCODIGO");
			logger.debug(CCODIGO);
			String CVALAXIS = getCampoTextual(request, "CVALAXIS");
			logger.debug(CVALAXIS);
			String CVALEMP = getCampoTextual(request, "CVALEMP");
			logger.debug(CVALEMP);
			String CVALDEF = getCampoTextual(request, "CVALDEF");
			logger.debug(CVALDEF);
			String CVALAXISDEF = getCampoTextual(request, "CVALAXISDEF");
			logger.debug(CVALAXISDEF);

			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_INTERFICIE(CCODIGO, CVALAXIS, CVALEMP, CVALDEF,
					CVALAXISDEF);
			logger.debug("ejecutaPAC_IAX_MNTPROD__F_SET_INTERFICIE return:" + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, no ha habido error
			} else {
				thisAction.guardarMensaje(request, "1000052", new Object[] { map.get("MENSAJES") },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro052Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axispro052Service.class));
		}

	}

}
