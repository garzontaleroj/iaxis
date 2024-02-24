//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisper006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper006Action thisAction) {
		logger.debug("Axisper006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Cargar direcciones */

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String FACEPTAR = getCampoTextual(request, "faceptar");
			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			formdata.put("FACEPTAR", FACEPTAR);
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCIONES(SPERSON, CAGENTE);
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				List T_IAX_DIRECCIONES = (List) map.get("PDIRECCIONES");
				formdata.put("T_IAX_DIRECCIONES", T_IAX_DIRECCIONES);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper006Service.m_form", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_eliminarDireccion(HttpServletRequest request, Axisper006Action thisAction) {
		logger.debug("Axisper006Service m_eliminarDireccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_ESTDIRECCIONES(SPERSON, CDOMICI, null, null);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			request.setAttribute("CDOMICI", null);
			formdata.put("CDOMICI", null);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper006Service.m_eliminarDireccion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
