package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FISCALIDAD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm084Service.java
 * 
 * @since Java 5.0
 */
public class Axisadm084Service extends AxisBaseService {
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
		logger.debug("Axisadm084Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm084Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// -- Bug 0084209 - 18/08/2010 - JMF
		finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisadm084Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Date FECHA_DESDE = this.stringToSqlDate(getCampoTextual(request, "FDESDE"));
			Date FECHA_HASTA = this.stringToSqlDate(getCampoTextual(request, "FHASTA"));
			String SFECHA_DESDE = new SimpleDateFormat("ddMMyyyy").format(FECHA_DESDE);
			String SFECHA_HASTA = new SimpleDateFormat("ddMMyyyy").format(FECHA_HASTA);
			BigDecimal PIDIOMA = usuario.getCidioma();

			PAC_IAX_FISCALIDAD pac_iax_fiscalidad = new PAC_IAX_FISCALIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_fiscalidad.ejecutaPAC_IAX_FISCALIDAD__F_FECU(PIDIOMA, SFECHA_DESDE, SFECHA_HASTA);
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// ecg 20100216 AXIS1633 Bug 13029 Recuperar y bajar fichero generado
			logger.debug("retorn exec, map :: " + codiRetorn + "," + map);
			formdata.put("LIST_FICHEROS", map.get("VIMP"));
			formdata.putAll(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm084Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
