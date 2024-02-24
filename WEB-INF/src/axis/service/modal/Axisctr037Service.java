package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONPROPUESTA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr037Service.java 14/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr037Service extends AxisBaseService {
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
		logger.debug("Axisctr037Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			/*
			 * BigDecimal SSEGURO = new
			 * BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")
			 * )); //PRETEN_NMOVIMI logger.debug("SSEGURO :: "+SSEGURO);
			 */

			// BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			BigDecimal SSEGURO = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
			BigDecimal SPRODUC = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SPRODUC")));

			// PRETEN_NMOVIMI
			logger.debug("SSEGURO :: " + SSEGURO);
			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_GET_FECHACANCEL(SSEGURO, SPRODUC);
			logger.debug("info :: " + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("FCANCEL", map.get("PFCANCEL"));
				// request.getSession().setAttribute("PRETEN_FEFECTO_OUT",map.get("PFEFECTO"));
				formdata.put("FCANCELNUEVA", map.get("PFCANCELNUEVA"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr037Service - m�todo m_form", e);
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
	 * @return True si la grabaci�n ha ido bien, false si ha ido mal
	 */
	@SuppressWarnings("all")
	public void m_acceptar(HttpServletRequest request) {
		logger.debug("Axisctr037Service m_acceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal SSEGURO = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_SSEGURO")));
			BigDecimal NMOVIMI = new BigDecimal(String.valueOf(request.getSession().getAttribute("PRETEN_NMOVIMI")));
			java.sql.Date FCANCELNUEVA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FCANCELNUEVA"));

			PAC_IAX_GESTIONPROPUESTA pacIaxGestionPropuesta = new PAC_IAX_GESTIONPROPUESTA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxGestionPropuesta.ejecutaPAC_IAX_GESTIONPROPUESTA__F_CAMBIO_FCANCEL(SSEGURO, NMOVIMI,
					FCANCELNUEVA);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK_acceptar", "0");
				if (!isEmpty(map.get("MENSAJES")))
					request.getSession().setAttribute("PRETEN_MENSAJES",
							((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("CERROR"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr037Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}