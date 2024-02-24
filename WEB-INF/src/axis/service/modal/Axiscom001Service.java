package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscom001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscom001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Mtodo que carga los datos en pantalla
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

		String CODIGO_CP = getCampoTextual(request, "CODIGO_CP");
		if (!isEmpty(CODIGO_CP))
			CODIGO_CP = CODIGO_CP.toUpperCase();
		logger.debug("CODIGO_CP: " + CODIGO_CP);

		BigDecimal CODIGO_GARANTIA = getCampoNumerico(request, "CODIGO_GARANTIA");
		logger.debug("CODIGO_GARANTIA: " + CODIGO_GARANTIA);

		String CODIGO_AGR = getCampoTextual(request, "CODIGO_AGR");
		logger.debug("CODIGO_AGR: " + CODIGO_AGR);

		String CODIGO_CONDICION_TMP = getCampoTextual(request, "CODIGO_CONDICION");

		if (CODIGO_CONDICION_TMP == null)
			CODIGO_CONDICION_TMP = "";
		logger.debug("CODIGO_CONDICION_TMP: " + CODIGO_CONDICION_TMP);

		String DESC = getCampoTextual(request, "DESC");
		logger.debug("DESC: " + DESC);

		/*
		 * String CODIGO_CONDICION = (( isEmpty(CODIGO_CONDICION_TMP) ) ? null :
		 * ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "|" : CODIGO_CONDICION_TMP + "|" +
		 * DESC ));
		 */
		String CODIGO_CONDICION;

		if (CODIGO_CONSULTA.equals("LISTA_POBLACION")) {

			if (this.isEmpty(CODIGO_CP)) {
				CODIGO_CP = "";
			}
			CODIGO_CONDICION = ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "|" + CODIGO_CP + "||"
					: CODIGO_CONDICION_TMP + "|" + CODIGO_CP + "|" + DESC + "|");

		} else if (CODIGO_CONSULTA.equals("LISTA_DIR_LOCALIDAD")) {

			if (this.isEmpty(CODIGO_CP)) {
				CODIGO_CP = "";
			}
			CODIGO_CONDICION = ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "|" + CODIGO_CP + "||"
					: CODIGO_CONDICION_TMP + "|" + CODIGO_CP + "|" + DESC + "|");

		} else if (CODIGO_CONSULTA.equals("LISTA_REEMBACTOS")) {

			CODIGO_CONDICION = ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "||" + CODIGO_GARANTIA + "|" + CODIGO_AGR
					: CODIGO_CONDICION_TMP + "|" + DESC + "|" + CODIGO_GARANTIA + "|" + CODIGO_AGR);

		} else if ((CODIGO_CONSULTA.equals("LISTA_POBLACION_GARAN1"))
				|| (CODIGO_CONSULTA.equals("LISTA_POBLACION_GARAN2"))
				|| (CODIGO_CONSULTA.equals("LISTA_POBLACION_GARAN3"))) {
			if (isEmpty(DESC)) {
				DESC = " ";
			}
			CODIGO_CONDICION = DESC;
			logger.debug("CODIGO_CONDICION2: " + CODIGO_CONDICION);
		} else {
			CODIGO_CONDICION = ((isEmpty(DESC)) ? CODIGO_CONDICION_TMP + "|" : CODIGO_CONDICION_TMP + "|" + DESC);
		}
		logger.debug("CODIGO_CONDICION: " + CODIGO_CONDICION);

		String CODIGO_CONSULTA_TMP = (CODIGO_CONSULTA.equals("LISTA_PAIS_RESIDENCIA")
				|| CODIGO_CONSULTA.equals("LISTA_PAIS_NACIONALIDAD")) ? "LISTA_PAIS" : CODIGO_CONSULTA;

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		logger.debug("CODIGO_CONSULTA_TMP: " + CODIGO_CONSULTA_TMP);
		// Datos display
		Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO_CONSULTA_TMP,
				CODIGO_CONDICION);
		logger.debug(map);
		List params = (List) tratarRETURNyMENSAJES(request, map, false);

		request.setAttribute("T_IAX_GETCONSULTA", !isEmpty(params) ? params : new ArrayList());
		request.setAttribute("CODIGO_LITERAL", CODIGO_LITERAL);
		request.setAttribute("CODIGO_CONSULTA", CODIGO_CONSULTA);
		request.setAttribute("CODIGO_CP", CODIGO_CP);
		request.setAttribute("CODIGO_GARANTIA", CODIGO_GARANTIA);
		request.setAttribute("CODIGO_AGR", CODIGO_AGR);
		request.setAttribute("DESC", DESC);
	}

	/**
	 * Mtodo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axiscom001Action thisAction) {
		logger.debug("Axiscom001Service m_form");
		try {
			cargarDatos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscom001Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
