//Revision:# 7DodBy0BmytSziSdaPkXOw== #
package axis.service.modal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisciiu001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisciiu001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos en pantalla
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarDatos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String CODIGO = getCampoTextual(request, "CODIGO");
		logger.debug("CODIGO: " + CODIGO);

		String LITERAL = getCampoTextual(request, "LITERAL");
		logger.debug("LITERAL: " + LITERAL);

		String CODIGO_CONSULTA = getCampoTextual(request, "CODIGO_CONSULTA");

		String DESC = getCampoTextual(request, "DESC");
		if (DESC != null) {
			DESC = DESC.toUpperCase();
		}

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		logger.debug("CODIGO: " + CODIGO);
		// Datos display
		Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CIIU(CODIGO, DESC);
		logger.debug(map);
		List params = (List) tratarRETURNyMENSAJES(request, map, false);

		request.setAttribute("T_IAX_GETCONSULTA", !isEmpty(params) ? params : new ArrayList());

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisciiu001Action thisAction) {
		logger.debug("Axisciiu001Service m_form");
		try {
			cargarDatos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisciiu001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
