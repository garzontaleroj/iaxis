package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap008Service.java
 * 
 * @since Java 5.0
 */
public class Axismap008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axismap008Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismap008Action thisAction) {
		logger.debug("Axismap008Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			String node_value = this.getCampoTextual(request, "NODE_VALUE");
			String node_label = this.getCampoTextual(request, "NODE_LABEL");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");
			if (!isEmpty(node_value) && !isEmpty(node_label)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_OBJETO(node_value, node_label);
				logger.debug(m);
				formdata.put("obj", this.tratarRETURNyMENSAJES(request, m));

				ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

				// BigDecimal NORDFILL = (BigDecimal)((Map)lstobj.get(0)).get("NORDEN");

				formdata.putAll((Map) lstobj.get(0));

			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axismap008Action thisAction) {
		logger.debug("Axismap008Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");
			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_LSTTABLAHIJOS(CMAPEAD);
			logger.debug(m);

			formdata.put("lsttablahijos", this.tratarRETURNyMENSAJES(request, m));

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_ARBOL(CMAPEAD);
			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);
			formdata.put("RED_ARBOL", RETURN);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismap008Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap008Action thisAction) {
		logger.debug("Axismap008Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");

			String TPARE = this.getCampoTextual(request, "TPARE");

			String TTAG = this.getCampoTextual(request, "TTAG");

			BigDecimal NORDFILL = this.getCampoNumerico(request, "NORDFILL");
			BigDecimal CATRIBUTS = this.getCampoNumerico(request, "CATRIBUTS");
			BigDecimal CTABLAFILLS = this.getCampoNumerico(request, "CTABLAFILLS");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPXML(CMAPEAD, TPARE, NORDFILL, TTAG, CATRIBUTS, CTABLAFILLS,
					NORDEN);
			logger.debug(m);

			BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			formdata.put("ok", retorno);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap008Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
