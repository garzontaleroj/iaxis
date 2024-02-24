//Revision:# xV3p6S75OlJcMtlcuiRlcQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper053Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper053Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper053Action thisAction) {
		logger.debug("Axisper053Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		String NIT_PROVEEDOR = getHiddenCampoTextual(request, "NIT_PROVEEDOR");
		BigDecimal CRESPONSABLE_IVA = getCampoNumerico(request, "RESPONSABLE_IVA");
		String CFISCALES_ADQUIRIENTE = getHiddenCampoTextual(request, "FISCALES_ADQUIRIENTE");
		String CORREO_FACT_ELECT = getHiddenCampoTextual(request, "CORREO_FACT_ELECT");

		logger.debug("Axisper053Service m_form SPERSON :" + SPERSON);
		logger.debug("Axisper053Service m_form NIT_PROVEEDOR :" + NIT_PROVEEDOR);
		logger.debug("Axisper053Service m_form CRESPONSABLE_IVA :" + CRESPONSABLE_IVA);
		logger.debug("Axisper053Service m_form CFISCALES_ADQUIRIENTE :" + CFISCALES_ADQUIRIENTE);
		logger.debug("Axisper053Service m_form CORREO_FACT_ELECT :" + CORREO_FACT_ELECT);

		try {
			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CFISCALES_ADQUIRIENTE)) {
				Map map = pac_axis_persona
						.ejecutaPAC_IAX_DESCVALORES__F_GET_FISCALES_ADQUIRIENTE(CFISCALES_ADQUIRIENTE);
				logger.debug(map);
				Map fiscales_adquiriente = new HashMap();
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					formdata.put("TFISCALES_ADQUIRIENTE", map.get("RETURN"));
				} else {
					fiscales_adquiriente.put("TFISCALES_ADQUIRIENTE", "");
				}
			}
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper053Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */
	private void cargarValoresDesplegables(HttpServletRequest request, Axisper053Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABLE_IVA();
			logger.debug("Axisper053Service cargarValoresDesplegables :" + map);
			listValores.put("tipResponsable_IVA", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper053Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	public void grabarFactElec(HttpServletRequest request, Axisper053Action thisAction) {
		logger.debug("Axisper053Service grabarFactElec");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON"); // (BigDecimal)formdata.get("SPERSON");
			String NIT_PROVEEDOR = (String) formdata.get("NIT_PROVEEDOR");
			String CRESPONSABLE_IVA = (String) formdata.get("RESPONSABLE_IVA");
			String CFISCALES_ADQUIRIENTE = (String) formdata.get("FISCALES_ADQUIRIENTE");
			String CORREO_FACT_ELECT = (String) formdata.get("CORREO_FACT_ELECT");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_FACT_ELECTRONICA(SPERSON, NIT_PROVEEDOR,
					new BigDecimal(CRESPONSABLE_IVA), CFISCALES_ADQUIRIENTE, CORREO_FACT_ELECT);
			logger.debug("Axisper053Service grabarFactElec: map: " + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 1) {
				AbstractDispatchAction.guardarMensaje(request, map.get("RETURN").toString(), new Object[] {},
						Constantes.MENSAJE_INFO);
			} else {
				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper026Service.m_grabarRegimen", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
