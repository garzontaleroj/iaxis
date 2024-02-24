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
import axis.mvc.control.modal.Axisrea054Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea054Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisrea054Action thisAction) {
		logger.debug("Axisrea054Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/* Desplegables */
			// cargarValoresDesplegables(request, usuario, formdata);
			/* m_buscar */
			BigDecimal psperson = getCampoNumerico(request, "SPERSON");
			BigDecimal pcagente = getCampoNumerico(request, "CAGENTE");

			logger.debug("SPERSON:" + psperson);
			logger.debug("CAGENTE" + pcagente);

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
			logger.error("Error en el m�todo Axisrea054Service.m_form", e);
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
	public void m_buscar(HttpServletRequest request, Axisrea054Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisrea054Service m_buscar");

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			logger.debug("SPERSON:" + SPERSON);
			logger.debug("CAGENTE" + CAGENTE);
			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));
			BigDecimal TIPOCUMULO = getCampoNumerico(request, "CESVALOR");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");

			Map map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(FCORTE, TIPOCUMULO.toString(),
					NNUMIDE);
			List<Map> lstTotalCumulo = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstTotalCumulo", lstTotalCumulo);

			logger.debug(formdata);
			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_SERIE(FCORTE,
					TIPOCUMULO.toString(), NNUMIDE);
			List<Map> lstTotalCumuloAnioSerie = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstTotalCumuloAnioSerie", lstTotalCumuloAnioSerie);

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR_POL(FCORTE, TIPOCUMULO.toString(),
					NNUMIDE);
			List<Map> lstCumuloDetallado = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstCumuloDetallado", lstCumuloDetallado);
			formdata.put("SPERSON", SPERSON);
			formdata.put("CAGENTE", CAGENTE);
			logger.debug(formdata);

			map = pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_PINTA_CONTRATOS(FCORTE, TIPOCUMULO.toString(),
					NNUMIDE);
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

			formdata.put("FCORTE", FCORTE);
			logger.debug(formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea054Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
