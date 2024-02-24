package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrea010Service.java 29/06/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisrea010Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea010Service m_form");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisrea010Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal SCUMULO = getCampoNumerico(request, "SCUMULO");

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CONSULTA_CESIONES(NPOLIZA, NCERTIF, NSINIES, NRECIBO, FEFEINI,
					FEFEFIN, NREEMB, SCUMULO);
			logger.debug(map);
			List<Map> LST_CESIONES = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(LST_CESIONES)) {
				for (Map cesion : LST_CESIONES) {
					BigDecimal CSITUAC = (BigDecimal) cesion.get("CSITUAC");
					if (!isEmpty(CSITUAC)) {
						// pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GETDESCRIPVALORES()
					}
				}
			}

			request.setAttribute("LST_CESIONES", LST_CESIONES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
