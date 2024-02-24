package axis.service.modal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PARPERSONA;
import axis.mvc.control.modal.Axiscom002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscom002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos en pantalla
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarDatos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String CODIGO_LITERAL = getCampoTextual(request, "CODIGO_LITERAL");
		logger.debug("CODIGO_LITERAL: " + CODIGO_LITERAL);

		String CODIGO_CONSULTA = getCampoTextual(request, "CODIGO_CONSULTA");
		logger.debug("CODIGO_CONSULTA: " + CODIGO_CONSULTA);

		String CODIGO_CONDICION = getCampoTextual(request, "CODIGO_CONDICION");

		String DESC = getCampoTextual(request, "DESC");
		logger.debug("DESC: " + DESC);

		/*
		 * String CODIGO_CONDICION = (( isEmpty(CODIGO_CONDICION_TMP) ) ? null :
		 * ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "|" : CODIGO_CONDICION_TMP + "|" +
		 * DESC ));
		 */

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_PARPERSONA pac_iax_parpersona = new PAC_IAX_PARPERSONA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		// logger.debug ("CODIGO_CONSULTA_TMP: "+CODIGO_CONSULTA_TMP);
		// Datos display
		Map map = pac_iax_parpersona.ejecutaPAC_IAX_PARPERSONA__F_GET_DETPARAM(CODIGO_CONSULTA, DESC,
				usuario.getCidioma());
		logger.debug(map);
		List params = (List) tratarRETURNyMENSAJES(request, map, false);

		request.setAttribute("T_IAX_GETCONSULTA", !isEmpty(params) ? params : new ArrayList());
		request.setAttribute("CODIGO_LITERAL", CODIGO_LITERAL);
		request.setAttribute("CODIGO_CONSULTA", CODIGO_CONSULTA);
		// request.setAttribute("CODIGO_CP", CODIGO_CP);
		// request.setAttribute("CODIGO_GARANTIA", CODIGO_GARANTIA);
		// request.setAttribute("CODIGO_AGR", CODIGO_AGR);
		request.setAttribute("DESC", DESC);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axiscom002Action thisAction) {
		logger.debug("Axiscom002Service m_form");
		try {
			cargarDatos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscom002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
