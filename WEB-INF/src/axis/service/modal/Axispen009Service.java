package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen009Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen009Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen009Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispen009Action thisAction) {
		logger.debug("Axispen009Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String CODDGS = getCampoTextual(request, "CODDGS");
			String NOMPLA = getCampoTextual(request, "NOMPLA");
			String FON_CODDGS = getCampoTextual(request, "FON_CODDGS");

			if ((CODDGS != null) || (NOMPLA != null) || (FON_CODDGS != null)) {
				// Si hi ha alg�n camp informat per pantalla busquem els plans
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(CODDGS, FON_CODDGS, null, null,
						NOMPLA, null);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES return:" + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map, true))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores
				ArrayList listaPlanes = (ArrayList<Map>) map.get("PLANPENSIONES");
				logger.debug(listaPlanes);
				formdata.put("AXIS_PLANES", listaPlanes);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen009Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
