//Revision:# RGBHJ78d3PZAHEXkuoxUAg== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfic003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axisfic003Action thisAction) {
		logger.debug("Axisfic003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			/* Cargar direcci�n (s�lo si hay CDOMICI) */
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

	String CMODO = getCampoTextual(request, "CMODO");//POST-123
			if (CMODO == null) {
				try {
					CMODO = new String(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
//			if (SFINANCI != null && (CMODO.equals(new BigDecimal("1")) || CMODO.equals(new BigDecimal("2")))) {
				m_buscar(request, thisAction);
//			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic003Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista de valores
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001075));
			logger.debug(map);
			listValores.put("lstEsValores", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic003Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que busca la declaraci�n de renta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisfic003Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic003Service m_buscar");

		try {

			Date FCORTE = stringToSqlDate(request.getParameter("FCORTE"));
			if (FCORTE == null) {
				try {
					FCORTE = stringToSqlDate(String.valueOf(request.getParameter("FCORTE")));
				} catch (Exception ex) {
					FCORTE = null;
				}
			}

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_RENTA(SFINANCI, FCORTE);
			List<Map> lstRenta = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			if (!isEmpty(map) && lstRenta != null) {
				formdata.put("lstRenta", lstRenta);
				for (Map iLstRenta : lstRenta) {
					if (SFINANCI.equals(iLstRenta.get("SFINANCI"))) {
						formdata.putAll(iLstRenta);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic003Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que almacena la Declaracion de renta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisfic003Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic003Service m_aceptar");

		try {

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
				if (SFINANCI == null) {
					try {
						SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
					} catch (Exception ex) {
						SFINANCI = null;
					}
				}
				String CMODO = getCampoTextual(request, "CMODO");
				Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
				BigDecimal CESVALOR = getCampoNumerico(request, "CESVALOR");
				BigDecimal IPATRILIQ = getCampoNumerico(request, "IPATRILIQ");
				BigDecimal IRENTA = getCampoNumerico(request, "IRENTA");

				Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_RENTA(SFINANCI, CMODO, FCORTE,
						CESVALOR, IPATRILIQ, IRENTA);

				logger.debug(map);

				request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
