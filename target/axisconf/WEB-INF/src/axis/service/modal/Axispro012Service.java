package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro012Action thisAction) {
		logger.debug("Axispro012Service m_form");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro012Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que actualiza los datos de gesti�n de la pantalla via AJAX.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_set_dur_period(HttpServletRequest request, Axispro012Action thisAction) {
		logger.debug("Axispro012Service m_ajax_set_dur_period");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			Date FINICIO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINICIO"));
			BigDecimal NDURPER = getCampoNumerico(request, "NDURPER");
			BigDecimal NDURPEROLD = getCampoNumerico(request, "NDURPEROLD");

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos display
			Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_DURPERIOD(SPRODUC, FINICIO, NDURPER, NDURPEROLD);
			logger.debug(map);
			BigDecimal params = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

			if (new BigDecimal("0").equals(params))
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
			else
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro012Service - m�todo m_ajax_set_dur_period", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
