package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin004Service.java
 * 
 * @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
 */
public class Axissin004Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin004Action thisAction) {
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axissin004Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista de recibos de un siniestro en funci�n de un SSEGURO. Guarda el
	 * resultado en un objeto/array T_IAX_RECIBOS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axissin004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRECIBOS_OLD(SSEGURO);
			List recibos = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("T_IAX_RECIBOS", recibos);
		} catch (Exception e) {
			logger.error("Error en el servicio axissin004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
