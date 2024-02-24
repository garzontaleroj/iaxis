package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen008Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen008Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispen008Action thisAction) {
		logger.debug("Axispen008Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen008Service - m�todo m_form", e);
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

	public void m_busqueda_fondos(HttpServletRequest request, Axispen008Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String TNOM = getCampoTextual(request, "TNOM");
			String CCODFON = getCampoTextual(request, "CCODFON");
			BigDecimal CODFON = null;

			if (!isEmpty(CCODFON)) {
				HashMap m0 = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PENSIONES__F_GET_CCODFON(CCODFON);
				logger.debug(m0);

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, m0)))
					CODFON = (BigDecimal) m0.get("PCCODFON");
				else
					CODFON = new BigDecimal(0);
			}

			if (formdata.get("paginar") == null) {
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSIONES(CODFON, null, null, null, null, TNOM);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_FONPENSIONES return" + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores
				ArrayList listaFondos = (ArrayList<Map>) map.get("FONPENSIONES");
				logger.debug(listaFondos);
				formdata.put("AXIS_FONDOS", listaFondos);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen008Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
