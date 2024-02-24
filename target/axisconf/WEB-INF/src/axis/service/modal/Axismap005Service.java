package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axismap005Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());
	private String SNIP;

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axismap005Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axismap005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = getCampoTextual(request, "CMAPEAD1");

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(CMAPEAD, null);
			log.debug(m);
			formdata.put("lstdetalle", this.tratarRETURNyMENSAJES(request, m));
			formdata.put("CMAPEAD", CMAPEAD);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap005Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");

			BigDecimal NLONGITUD = this.getCampoNumerico(request, "NLONGITUD");
			BigDecimal NPOSICION = this.getCampoNumerico(request, "NPOSICION");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			Map m = null;/*
							 * pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPDETALLE(CMAPEAD,
							 * NORDEN,NPOSICION,NLONGITUD);
							 */
			log.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.put("OK", "0");
			// this.configForm(request, whoami(AxismapDetalleModificarAction.class));
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

}
