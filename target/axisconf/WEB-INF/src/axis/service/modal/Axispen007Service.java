package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen007Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen007Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispen007Action thisAction) {
		logger.debug("Axispen007Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axispen007Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String NOMGES = getCampoTextual(request, "TNOMGES");
			String CODDGS = getCampoTextual(request, "CODDGS");
			BigDecimal CODGES = null;

			if (!isEmpty(CODDGS)) {
				HashMap m0 = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_CCODGES(CODDGS);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_CCODGES return: " + m0);
				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, m0))) {
					CODGES = (BigDecimal) m0.get("PCCODGES");
				} else {
					CODGES = new BigDecimal(0);
				}

			}
			PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(CODGES, null, null, NOMGES);
			logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS return:" + map);
			// Si la crida retorna error llencem excepcio.
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}
			// Preparem llista de gestores
			formdata.put("AXIS_GESTORAS", map.get("CODGESTORAS"));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen007Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
