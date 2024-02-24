package axis.service.modal;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisusu008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisusu008Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastorr</a>
 * @since Java 5.0
 */
public class Axisusu008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu008Action thisAction) {
		logger.debug("Axisusu008Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu008Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisusu008Action thisAction) {
		logger.debug("Axisusu008Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CROL = getCampoTextual(request, "CROL");
			String TROL = getCampoTextual(request, "TROL");
			Map map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_ROLES(CROL, TROL);
			logger.debug(map);

			List result = (List) tratarRETURNyMENSAJES(request, map, false);

			formdata.put("LSTROLS", result);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu008Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
