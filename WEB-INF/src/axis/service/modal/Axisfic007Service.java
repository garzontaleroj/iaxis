//Revision:# XbystBF3UJbytlifpmbwMQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfic007Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisfic007Action thisAction) {
		logger.debug("Axisfic007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// Inicio IAXIS-3674 10/06/2019
			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
			Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));
			// Fin IAXIS-3674 10/06/2019

			String NCAMPO = getCampoTextual(request, "NCAMPO");
			if (NCAMPO == null) {
				try {
					NCAMPO = new String(request.getParameter("NCAMPO"));
				} catch (Exception ex) {
					NCAMPO = null;
				}
			}
			formdata.put("NCAMPO", NCAMPO);

			BigDecimal NNOMCAMP = getCampoNumerico(request, "NNOMCAMP");
			if (NNOMCAMP == null) {
				try {
					NNOMCAMP = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					NNOMCAMP = null;
				}
			}

			formdata.put("NNOMCAMP", NNOMCAMP);

			String TCAMPO = getCampoTextual(request, "TCAMPO");
			// Inicio IAXIS-3674 10/06/2019
			if (TCAMPO != null) {
				TCAMPO = TCAMPO.replace("XxX", "%");
			}
			// Fin IAXIS-3674 10/06/2019
			if (TCAMPO == null) {
				try {
					TCAMPO = null;
				} catch (Exception ex) {
					TCAMPO = null;
				}
			}

			formdata.put("TCAMPO", TCAMPO);

			// Inicio IAXIS-3674 10/06/2019
			if (SFINANCI != null && NMOVIMI != null) {
				Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_INDICADOR(SFINANCI, NMOVIMI);
				List<Map> lstIndicadorB = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				if (!isEmpty(map) && lstIndicadorB != null) {
					for (Map iLstIndicadorB : lstIndicadorB) {
						if (NMOVIMI.equals(iLstIndicadorB.get("NMOVIMI"))) {
							formdata.put("TCAMPO", iLstIndicadorB.get(NCAMPO));
						}
					}
				}
			} else if (SFINANCI != null && CFUENTE != null && FCONSULTA != null) {
				Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_ENDEUDA(SFINANCI, FCONSULTA, CFUENTE);
				List<Map> lstEndeuda = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				if (!isEmpty(map) && lstEndeuda != null) {
					for (Map iLstEndeuda : lstEndeuda) {
						if (SFINANCI.equals(iLstEndeuda.get("SFINANCI"))) {
							formdata.put("TCAMPO", iLstEndeuda.get(NCAMPO));
						}
					}
				}
			}
			// Fin IAXIS-3674 10/06/2019

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic007Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que almacena la Declaracion de renta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisfic007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic007Service m_aceptar");

		try {

			String NCAMPO = getCampoTextual(request, "NCAMPO");
			if (NCAMPO == null) {
				try {
					NCAMPO = "NCAMPO";
				} catch (Exception ex) {
					NCAMPO = null;
				}
			}
			formdata.put("NCAMPO", NCAMPO);

			BigDecimal NNOMCAMP = getCampoNumerico(request, "NNOMCAMP");
			formdata.put("NNOMCAMP", NNOMCAMP);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic007Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
