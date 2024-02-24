package axis.service.axis;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_EVENTOS_SIN;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axissin035Service.java 11/12/2009
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axissin035Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axissin035Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String SINIESTRO = getCampoTextual(request, "SINIESTRO");
			formdata.put("SINIESTRO", SINIESTRO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin035Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axissin035Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CEVENTO = getCampoTextual(request, "CEVENTO");
			String DEVENTO = getCampoTextual(request, "DEVENTO");

			java.sql.Date FECHAINI = null;
			FECHAINI = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHAINI"));

			java.sql.Date FECHAFIN = null;
			FECHAFIN = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FECHAFIN"));

			Map map = new PAC_IAX_EVENTOS_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_EVENTOS_SIN__F_GET_EVENTOS(CEVENTO, DEVENTO, FECHAINI, FECHAFIN);
			logger.debug("---> eventos:" + map);
			tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("listaEventos", map.get("PEVENTOS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin035Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_borrar(HttpServletRequest request) {
		logger.debug("Axissin035Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CEVENTO = getCampoTextual(request, "CEVENTO");

			Map map = new PAC_IAX_EVENTOS_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_EVENTOS_SIN__F_DEL_EVENTO(CEVENTO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin035Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

}
