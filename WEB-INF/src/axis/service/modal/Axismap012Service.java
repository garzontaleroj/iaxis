package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap012Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axismap012Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismap012Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismap012Action thisAction) {
		logger.debug("Axismap012Service m_form");
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
			BigDecimal NVECES = this.getHiddenCampoNumerico(request, "NVECES");
			String TCAMPO = this.getHiddenCampoTextual(request, "TCAMPO");
			BigDecimal CTABLA = this.getHiddenCampoNumerico(request, "CTABLA");
			String TCONDICION = this.getHiddenCampoTextual(request, "TCONDICION");
			String TSETWHERE = this.getHiddenCampoTextual(request, "TSETWHERE");

			if (!isEmpty(NORDEN) && !isEmpty(NVECES) && !isEmpty(TCAMPO) && !isEmpty(TCONDICION) && !isEmpty(TSETWHERE)
					&& !isEmpty(CTABLA)) {
				/*
				 * Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETTRATAR(CMAPEAD, NORDEN);
				 * logger.debug(m);
				 */
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_UNICO_MAPDETTRATAR(CMAPEAD, TCONDICION, CTABLA, NVECES,
						TCAMPO, NORDEN, TSETWHERE);
				logger.debug(m);

				ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);
				if (!isEmpty(lstobj) && lstobj.size() > 0)
					formdata.putAll((Map) lstobj.get(0));

			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap012Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axismap012Action thisAction) {
		logger.debug("Axismap012Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(503));
			formdata.put("lstTipo", this.tratarRETURNyMENSAJES(request, map));
			logger.debug(map);
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(501));
			formdata.put("lstCarga", this.tratarRETURNyMENSAJES(request, map));
			logger.debug(map);
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(504));
			logger.debug(map);
			formdata.put("lstSetWhere", this.tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap012Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap012Action thisAction) {
		logger.debug("Axismap012Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getHiddenCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getHiddenCampoTextual(request, "CMAPEAD");

			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");
			BigDecimal NVECES = this.getHiddenCampoNumerico(request, "NVECES");
			String TCAMPO = this.getHiddenCampoTextual(request, "TCAMPO");
			BigDecimal CTABLA = this.getHiddenCampoNumerico(request, "CTABLA");
			String CTIPCAMPO = this.getHiddenCampoTextual(request, "CTIPCAMPO");
			String TMASCARA = this.getHiddenCampoTextual(request, "TMASCARA");
			String TCONDICION = this.getHiddenCampoTextual(request, "TCONDICION");
			String TSETWHERE = this.getHiddenCampoTextual(request, "TSETWHERE");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// String pPCMAPEAD, String pPTCONDICION, java.math.BigDecimal pPCTABLA,
			// java.math.BigDecimal pPNVECES, String pPTCAMPO, String pPCTIPCAMPO, String
			// pPTMASCARA, java.math.BigDecimal pPNORDEN, String pPTSETWHERE) throws
			// Exception {
			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPDETTRATAR(CMAPEAD, TCONDICION, CTABLA, NVECES, TCAMPO,
					CTIPCAMPO, TMASCARA, NORDEN, TSETWHERE);
			logger.debug(m);

			try {
				BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

				formdata.put("ok", retorno);
			} catch (Exception ex) {
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap012Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
