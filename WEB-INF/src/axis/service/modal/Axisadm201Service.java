package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REENVIO_SER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm201Action;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm201Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisadm201Action thisAction) {
		try {
			request.getSession().removeAttribute("Axisper008_listaPersonas");
		} catch (Exception e) {
			log.error("Error", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesión, en caso que hubiera, para
	 * poder realizar una búsqueda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petición del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			formdata.put("CINTERF", AxisBaseService.getCampoTextual(request, "CINTERF"));
			formdata.put("SINTERF", AxisBaseService.getCampoNumerico(request, "SINTERF"));
		} catch (Exception e) {
			log.error("Error", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void ajax_getReqResDetail(HttpServletRequest request, Axisadm201Action thisAction) {
		logger.debug("Axisadm201Service ajax_getReqResDetail");
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal estado = null;
		BigDecimal sinterf = null;
		String cinterf = null;
		String testadoConvi = null;
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			estado = AxisBaseService.getCampoNumerico(request, "ESTADO");
			sinterf = AxisBaseService.getCampoNumerico(request, "SINTERF");
			cinterf = AxisBaseService.getCampoTextual(request, "CINTERF");
			testadoConvi = AxisBaseService.getCampoTextual(request, "TESTADO_CONVI");
			Map map = null;

			PAC_IAX_REENVIO_SER pacIaxReenvioSer = new PAC_IAX_REENVIO_SER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(sinterf)) {
				if (!cinterf.equalsIgnoreCase("CONVI")) {
					map = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA(sinterf, estado, cinterf);
				} else {
					map = pacIaxReenvioSer.ejecutaPAC_IAX_REENVIO_SER_P_GET_ENTSALIDA_CONVI(sinterf, estado, cinterf,
							testadoConvi.split("-")[1]);
				}
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);

			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
			formdata.put("ESTADO", estado);
			formdata.put("CINTERF", cinterf);
			formdata.put("SINTERF", sinterf);
			m_form(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm200Service - método ajax_documentos : ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
