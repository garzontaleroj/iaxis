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
import axis.mvc.control.modal.Axismap011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap011Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axismap011Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismap011Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axismap011Action thisAction) {
		logger.debug("Axismap011Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			String node_value = this.getHiddenCampoTextual(request, "NODE_VALUE");
			String node_label = this.getHiddenCampoTextual(request, "NODE_LABEL");

			if (!isEmpty(node_value) && !isEmpty(node_label)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_OBJETO(node_value, node_label);
				logger.debug(m);
				formdata.put("obj", this.tratarRETURNyMENSAJES(request, m));

			}

			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");

			if (!isEmpty(NORDEN)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(CMAPEAD, NORDEN);
				logger.debug(m);
				ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);
				if (!isEmpty(lstobj) && lstobj.size() > 0)
					formdata.putAll((Map) lstobj.get(0));

			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap011Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axismap011Action thisAction) {
		logger.debug("Axismap011Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");
			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(CMAPEAD, null);
			logger.debug(m);
			formdata.put("lstdetalle", this.tratarRETURNyMENSAJES(request, m));

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_ARBOL(CMAPEAD);
			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);
			formdata.put("RED_ARBOL", RETURN);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismap011Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap011Action thisAction) {
		logger.debug("Axismap011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");
			BigDecimal NPOSICION = this.getHiddenCampoNumerico(request, "NPOSICION");
			String TTAG = this.getHiddenCampoTextual(request, "TTAG");
			BigDecimal NLONGITUD = this.getHiddenCampoNumerico(request, "NLONGITUD");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPDETALLE(CMAPEAD, NORDEN, NPOSICION, NLONGITUD, TTAG);
			logger.debug(m);

			try {
				BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

				formdata.put("ok", retorno);
			} catch (Exception ex) {
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
