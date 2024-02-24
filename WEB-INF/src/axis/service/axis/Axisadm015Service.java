package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm015Service.java
 * 
 * @since Java 5.0
 */
public class Axisadm015Service extends AxisBaseService {
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
		logger.debug("Axisadm015Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm015Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// -- Bug 0015209 - 18/08/2010 - JMF
		finally {
			this.configForm(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisadm015Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Date PINICOBERTURA = stringToSqlDate(getCampoTextual(request, "PINICOBERTURA"));
			Date PFINCOBERTURA = stringToSqlDate(getCampoTextual(request, "PFINCOBERTURA"));
			String PFICHERO = getCampoTextual(request, "PFICHERO");
			BigDecimal PTIPOENVIO = new BigDecimal(getCampoTextual(request, "PTIPOENVIO"));

			Map map = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_LANZAR_COBFALLECIMIENTO(PINICOBERTURA, PFINCOBERTURA, PFICHERO,
							PTIPOENVIO);
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// ecg 20100216 AXIS1633 Bug 13029 Recuperar y bajar fichero generado
			logger.debug("retorn exec, map :: " + codiRetorn + "," + map);
			formdata.putAll(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm015Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
