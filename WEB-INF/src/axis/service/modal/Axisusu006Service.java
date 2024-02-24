package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_TERMINALES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisusu006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisusu006Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavier Pastor</a>
 * @since Java 5.0
 */
public class Axisusu006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu006Action thisAction) {
		logger.debug("Axisusu006Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisusu006Action thisAction) {
		logger.debug("Axisusu006Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CEMPRES = usuario.getCempres();
			String CMAQFISI = AxisBaseService.getCampoTextual(request, "CMAQFISI");
			String CTERMINAL = AxisBaseService.getCampoTextual(request, "CTERMINAL");

			PAC_IAX_TERMINALES pac_iax_terminal = new PAC_IAX_TERMINALES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_terminal.ejecutaPAC_IAX_TERMINALES__F_SET_TERMINAL(CEMPRES, CMAQFISI, CTERMINAL);
			logger.debug(map);

			BigDecimal respuesta = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug("M�quina actualizada?" + respuesta);

			if (new BigDecimal(0).equals(respuesta)) {
				request.setAttribute("RESPUESTA_OK", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu006Service  - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
