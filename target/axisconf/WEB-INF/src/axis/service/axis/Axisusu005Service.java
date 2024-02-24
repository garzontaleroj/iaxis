package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_TERMINALES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisusu005Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisusu005Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavier Pastor</a>
 * @since Java 5.0
 */
public class Axisusu005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu005Action thisAction) {
		logger.debug("Axisusu005Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu005Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisusu005Action thisAction) {
		logger.debug("Axisusu005Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = usuario.getCempres();
			String CMAQFISI = getCampoTextual(request, "CMAQFISI");
			String CTERMINAL = getCampoTextual(request, "CTERMINAL");

			PAC_IAX_TERMINALES pac_iax_terminal = new PAC_IAX_TERMINALES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_terminal.ejecutaPAC_IAX_TERMINALES__F_CONSULTA_TERMINALES(CEMPRES, CMAQFISI, CTERMINAL);
			logger.debug(map);

			List LSTMAQUINAS = (List) tratarRETURNyMENSAJES(request, map);

			request.setAttribute("LSTMAQUINAS", LSTMAQUINAS);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu005Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar(HttpServletRequest request, Axisusu005Action thisAction) {
		logger.debug("Axisusu005Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = usuario.getCempres();
			String CMAQFISI = AxisBaseService.getCampoTextual(request, "CMAQFISIDEL");
			String CTERMINAL = AxisBaseService.getCampoTextual(request, "CTERMINALDEL");

			PAC_IAX_TERMINALES pac_iax_terminal = new PAC_IAX_TERMINALES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_terminal.ejecutaPAC_IAX_TERMINALES__F_DEL_TERMINAL(CEMPRES, CMAQFISI, CTERMINAL);
			logger.debug(map);
			logger.debug("M�quina borrada?" + (BigDecimal) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu005Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}