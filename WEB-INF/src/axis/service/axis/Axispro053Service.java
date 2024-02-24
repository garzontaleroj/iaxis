package axis.service.axis;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axispro053Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispro053Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axispro053Action thisAction) {
		logger.debug("Axispro053Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axispro053Service.class));
	}

	public void m_buscar(HttpServletRequest request, Axispro053Action thisAction) {
		logger.debug("Axispro053Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_MNTPROD pacIaxpPrd = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CCODIGO = getCampoTextual(request, "CCODIGO");
			logger.debug("CCODIGO=" + CCODIGO);
			String CVALAXIS = getCampoTextual(request, "CVALAXIS");
			logger.debug("CVALAXIS=" + CVALAXIS);
			String CVALEMP = getCampoTextual(request, "CVALEMP");
			logger.debug("CVALEMP=" + CVALEMP);

			Map map = pacIaxpPrd.ejecutaPAC_IAX_MNTPROD__F_GET_INTERFICIE(CCODIGO, CVALAXIS, CVALEMP);
			logger.debug(map);

			formdata.put("LSTINTERFICIES", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro053Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axispro053Service.class));
		}

	}

	public void m_eliminar(HttpServletRequest request, Axispro053Action thisAction) {

		logger.debug("Axispro053Service m_eliminar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			String CCODIGO = getCampoTextual(request, "CCODIGO_AUX");
			logger.debug("CCODIGO=" + CCODIGO);
			String CVALAXIS = getCampoTextual(request, "CVALAXIS_AUX");
			logger.debug("CVALAXIS=" + CVALAXIS);

			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_DEL_INTERFICIE(CCODIGO, CVALAXIS);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, no ha habido error

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro053Service - m�todo m_eliminar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axispro053Service.class));
		}
	}

}