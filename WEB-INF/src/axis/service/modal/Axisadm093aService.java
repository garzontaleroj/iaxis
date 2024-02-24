/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.jdbc.PAC_IAX_LIQUIDA;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093aService extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	Log log = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/***************************************************************************************************************/
	/***********************************************
	 * STARTING FUNCTIONS
	 *******************************************/
	/***************************************************************************************************************/
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm093aService m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CFITXER = getCampoTextual(request, "CFITXER");
			String SDESCRIPCIO;
			String SGUIA;
			logger.debug("Fitxer map:" + CFITXER);
			if (CFITXER != null) {
				Map m = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GET_DATMAP(CFITXER);
				logger.debug("map PAC_IAX_MAP.F_GET_DATMAP-->" + m);
				formdata.put("F_GET_DATMAP", m);
				Map m2 = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GET_TIPOMAP(CFITXER);
				logger.debug("map PAC_IAX_MAP.F_GET_TIPOMAP-->" + m2);
				formdata.put("F_GET_TIPOMAP", m2);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093aService - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_existe_poliza(HttpServletRequest request) throws Exception {
		logger.debug("Axisadm093aService m_form");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_LIQUIDA pacIaxLiquida = new PAC_IAX_LIQUIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPNPOLIZA = getCampoNumerico(request, "POLICY");
			String pTablas;
			pTablas = "TNOMBRE";
			Map map = pacIaxLiquida.ejecutaPAC_IAX_LIQUIDA__F_GET_SSEGURO(pPNPOLIZA, new BigDecimal(0), pTablas);

			ajax.rellenarPlAContenedorAjax(map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093aService - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
