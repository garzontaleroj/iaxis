package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea055Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea055Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisrea055Action thisAction) {
		logger.debug("Axisrea055Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/* Desplegables */
			// cargarValoresDesplegables(request, usuario, formdata);
			/* m_buscar */
			m_buscar(request, thisAction);

			BigDecimal CMODO = getCampoNumerico(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new BigDecimal(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			formdata.put("CMODO", bigDecimalToString(CMODO));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea055Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisrea055Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea055Service m_buscar");

		try {

			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
			BigDecimal CESVALOR = getCampoNumerico(request, "CESVALOR");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal SERIE = getCampoNumerico(request, "SERIE");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if (SERIE == null) {
				Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL(FCORTE, NNUMIDE,
						SPERSON);
				List<Map> lstPolizas = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				formdata.put("lstPolizas", lstPolizas);
			} else if (SERIE != null) {

				Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_DEPURACION_MANUAL_SERIE(FCORTE,
						NNUMIDE, SERIE, SPERSON);
				List<Map> lstPolizas = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				formdata.put("lstPolizas", lstPolizas);
			}

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(FCORTE,
					CESVALOR.toString(), NNUMIDE);
			List<Map> lstPintaContratos = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstPintaContratos", lstPintaContratos);
			if (!isEmpty(map) && lstPintaContratos != null) {
				for (Map iLst : lstPintaContratos) {
					formdata.put("Q1", iLst.get("Q1"));
					formdata.put("Q2", iLst.get("Q2"));
					formdata.put("Q3", iLst.get("Q3"));
					formdata.put("Q4", iLst.get("Q4"));
					formdata.put("Q6", iLst.get("Q6"));
					formdata.put("Q7", iLst.get("Q7"));
					formdata.put("Q8", iLst.get("Q8"));
					formdata.put("Q9", iLst.get("Q9"));
					formdata.put("Q10", iLst.get("Q10"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea055Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
