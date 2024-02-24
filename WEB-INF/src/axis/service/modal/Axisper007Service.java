package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisper007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper007Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisper007Action thisAction) {
		logger.debug("Axisper007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Cargar direcciones */

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", bigDecimalToString(SPERSON));
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON, CAGENTE,
					new BigDecimal("1"));
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				List T_IAX_CCC = (List) map.get("PCCC");
				if (T_IAX_CCC != null) {
					PAC_IAX_COMMON PAC_IAX_COMMON = new PAC_IAX_COMMON(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					for (int i = 0; i < T_IAX_CCC.size(); i++) {
						Map obiaxccc = (Map) ((Map) T_IAX_CCC.get(i)).get("OB_IAX_CCC");
						Map CFORMAT = PAC_IAX_COMMON.ejecutaPAC_IAX_COMMON__F_FORMATCCC(
								new BigDecimal(String.valueOf(obiaxccc.get("CTIPBAN"))),
								(String) obiaxccc.get("CBANCAR"));
						obiaxccc.put("CBANCAR", CFORMAT.get("RETURN"));
					}
					formdata.put("T_IAX_CCC", T_IAX_CCC);
				}
			}

			Map map_tarjeta = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCUENTASBANCARIAS(SPERSON, CAGENTE,
					new BigDecimal("2"));
			logger.debug(map_tarjeta);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map_tarjeta))) {
				List T_IAX_TARJETA = (List) map_tarjeta.get("PCCC");
				if (T_IAX_TARJETA != null) {
					PAC_IAX_COMMON PAC_IAX_COMMON = new PAC_IAX_COMMON(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					for (int i = 0; i < T_IAX_TARJETA.size(); i++) {
						Map obiaxccc = (Map) ((Map) T_IAX_TARJETA.get(i)).get("OB_IAX_CCC");
						Map CFORMAT = PAC_IAX_COMMON.ejecutaPAC_IAX_COMMON__F_FORMATCCC(
								new BigDecimal(String.valueOf(obiaxccc.get("CTIPBAN"))),
								(String) obiaxccc.get("CBANCAR"));

						HashMap concatenar;
						try {
							PAC_IAX_PARAM param = new PAC_IAX_PARAM(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
							concatenar = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("CONCATENA_CUENTA",
									usuario.getCempres());

							if (concatenar.get("RETURN") != null && concatenar.get("RETURN").equals(BigDecimal.ONE)) {

								String CUENTACOMPLETA = (String) CFORMAT.get("RETURN");
								String CUENTA = CUENTACOMPLETA.substring(4, CUENTACOMPLETA.length());
								if (CUENTA.substring(0, 1).equals("-")) {
									CUENTA = CUENTA.substring(1, CUENTA.length()); // Si la primera posicion es un - se
																					// recorta, si no, no
								}
								obiaxccc.put("CBANCAR", CUENTA);
							} else
								obiaxccc.put("CBANCAR", CFORMAT.get("RETURN"));

						} catch (Exception e) {
							e.toString();
						}

					}
					formdata.put("T_IAX_TARJETA", T_IAX_TARJETA);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper007Service.m_form", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_eliminarCCC(HttpServletRequest request, Axisper007Action thisAction) {
		logger.debug("Axisper007Service m_eliminarCCC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CNORDBAN = getCampoNumerico(request, "CNORDBAN");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_ESTCCC(SPERSON, CNORDBAN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper007Service.m_eliminarCCC", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
