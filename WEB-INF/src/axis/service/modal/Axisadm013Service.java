package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CIERRES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm013Service.java 01/09/2008
 * 
 * @author <a href="jcolldeforns@csi-ti.com">Joan Colldeforns</a>
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm013Service extends AxisBaseService {
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
		logger.debug("Axisadm013Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map lstValores = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Recuperar request parameters provinentes de la AXISADM012 */
			String status = getCampoTextual(request, "status");

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			if ("modify".equals(status)) {
				// Es una modificaci�n
				String FPERINI = getCampoTextual(request, "FPERINI");
				request.setAttribute("FPERINI", FPERINI);
				Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_GET_CIERRE(CEMPRES, CTIPO, stringToSqlDate(FPERINI));

				logger.debug(map);

				map = (Map) tratarRETURNyMENSAJES(request, map);
				if (map != null)
					formdata.putAll(map);
			}

			if (!"new".equals(status)) {
				Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_CONFIG_CIERRE(CEMPRES, CTIPO);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					BigDecimal PPREVIO = (BigDecimal) map.get("PPREVIO");
					BigDecimal FECMODIF = (BigDecimal) map.get("PFECMODIF");
					map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE_NUEVO(PPREVIO);
					logger.debug(map);
					lstValores.put("lstEstadoCierres", tratarRETURNyMENSAJES(request, map));

					if (isEmpty(formdata.get("FECMODIF"))) {
						formdata.put("FECMODIF", String.valueOf(FECMODIF));
					}
				}
			}

			/* Cargar ListValores */

			// Buscar empresa activa
			BigDecimal currentCEMPRES = usuario.getCempres();
			Map map = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaF_DESEMPRESA(currentCEMPRES, null, "");
			logger.debug(map);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				formdata.put("TEMPRES", map.get("PTEMPRES"));
			}

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCIERRE(CEMPRES);
			logger.debug(map);
			lstValores.put("lstTipoCierres", tratarRETURNyMENSAJES(request, map));

			formdata.put("lstValores", lstValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm013Service - m�todo m_form", e);
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
	 * Graba/Modifica el cierre.
	 * 
	 * @param request
	 * @return True si la grabaci�n ha ido bien, false si ha ido mal
	 */
	@SuppressWarnings("all")
	public boolean m_guardar(HttpServletRequest request) {
		logger.debug("Axisadm013Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			Date FPERINI = stringToSqlDate(getCampoTextual(request, "FPERINI"));
			Date FPERFIN = stringToSqlDate(getCampoTextual(request, "FPERFIN"));
			Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));

			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_SET_CIERRES(CEMPRES, CTIPO, CESTADO, FPERINI, FPERFIN,
					FCIERRE);
			logger.debug(map);
			BigDecimal guardarOK = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("guardarOK", guardarOK);
			return BigDecimal.ZERO.equals(guardarOK);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm013Service - m�todo m_guardar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return false;
		}
	}

	/**
	 * Valida el cierre.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_validar(HttpServletRequest request) {
		logger.debug("Axisadm013Service m_validar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_GET_VALIDACION(CEMPRES, CTIPO);
			logger.debug(map);

			formdata.remove("FCIERRE");
			formdata.remove("FPERINI");
			formdata.remove("FPERFIN");

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

				try {
					request.setAttribute("FCIERRE", sdf.format((java.sql.Date) map.get("PFCIERRE")));
				} catch (Exception e) {
				}
				try {
					request.setAttribute("FPERINI", sdf.format((java.sql.Date) map.get("PFPERINI")));
				} catch (Exception e) {
				}
				try {
					request.setAttribute("FPERFIN", sdf.format((java.sql.Date) map.get("PFPERFIN")));
				} catch (Exception e) {
				}

				formdata.put("FECMODIF", map.get("PMODIF"));

				formdata.put("status", "validated");

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm013Service - m�todo m_validar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}