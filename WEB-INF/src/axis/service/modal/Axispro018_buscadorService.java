package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro018_buscadorService.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro018_buscadorService extends AxisBaseService {
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
		logger.debug("Axispro018_buscadorService m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			// logger.debug(map);

			Map LISTVALORES = new HashMap();
			LISTVALORES.put("LSTIDIOMAS", (List<Map>) tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro018_buscadorService - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axispro018_buscadorService m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			String TNCODINT = getCampoTextual(request, "TNCODINT");

			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_NCODINT(NCODINT, CIDIOMA, TNCODINT);
			logger.debug(map);

			List LSTNCODINT = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (map.get("MENSAJES") == null && !isEmpty(map.get("RETURN")))
				request.getSession().setAttribute("DATTECN_LSTNCODINT", LSTNCODINT);
			else
				// No se han encontrado datos
				AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro018_buscadorService - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
