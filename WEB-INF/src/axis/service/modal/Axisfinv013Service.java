package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfinv013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisfinv013Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv013Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv013Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map monedas = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
			logger.debug("Monedas" + monedas);
			// Map managers =
			// pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETALORES(new
			// BigDecimal(8000937));

			PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map managers = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(null, null, null, null);

			logger.debug("managers:" + managers);
			request.setAttribute("monedas", (List) monedas.get("RETURN"));
			request.setAttribute("managers", (List) managers.get("CODGESTORAS"));

			// TODO: ssss

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv013Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
