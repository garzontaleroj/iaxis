package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPUESTOS;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisimp002Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 19/12/2008
 * @since Java 5.0
 */
public class Axisimp002Service extends AxisBaseService {
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
		logger.debug("Axisimp002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			// Recuperar lista de conceptos
			Map map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_GET_CCONCEP();
			logger.debug(map);

			formdata.put("LSTCONCEPTOS", tratarRETURNyMENSAJES(request, map));

			// Recuperar descripci�n CEMPRES
			map = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaF_DESEMPRESA(CEMPRES, null, "");
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				formdata.put("TEMPRES", map.get("PTEMPRES"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisimp002Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CCONCEP = getCampoNumerico(request, "CCONCEP");

			PAC_IAX_IMPUESTOS pac_iax_impuestos = new PAC_IAX_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_impuestos.ejecutaPAC_IAX_IMPUESTOS__F_SET_IMPEMPRES(CEMPRES, CCONCEP);
			logger.debug(map);
			request.setAttribute("grabarOK", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro028Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
