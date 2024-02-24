package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr099Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr099Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr099Service extends AxisBaseService {
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
		logger.debug("Axisctr099Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_GSTCESTGEST();
			logger.debug(map);
			LISTVALORES.put("GSTCESTGEST", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr099Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_guardar_cambios(HttpServletRequest request, Axisctr099Action thisAction) {

		logger.debug("Axisctr099Service m_guardar_cambios");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recogemos todos los campos necesarios para el alta /modificacion de la
			// pantalla
			// se utilizar�n los que sean necesarios para uno u otro tipo

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CMOTRET = getCampoNumerico(request, "CMOTRET");
			BigDecimal NMOTRET = getCampoNumerico(request, "NMOTRET");
			BigDecimal CESTGEST = getCampoNumerico(request, "NCESTGEST");
			BigDecimal CAPLTOD = getCampoNumerico(request, "NCAPLTOD");

			/* Grabamos el cuerpo */

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_ACT_ESTADOGESTION(SSEGURO, NRIESGO,
					NMOVIMI, CMOTRET, NMOTRET, CESTGEST, CAPLTOD);
			logger.debug(map);

			((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue();

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr099Service - m�todo m_guardar_cambios", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}