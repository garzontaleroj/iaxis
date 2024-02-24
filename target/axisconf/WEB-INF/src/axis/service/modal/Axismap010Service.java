package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.modal.Axismap010Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap010Action.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axismap010Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismap010Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axismap010Action thisAction) {
		logger.debug("Axismap010Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");
			BigDecimal CTABLA = this.getCampoNumerico(request, "CTABLA");
			BigDecimal NVECES = this.getCampoNumerico(request, "NVECES");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(CTABLA) && !isEmpty(NVECES)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCABTRATAR(CMAPEAD);
				logger.debug(m);
				// formdata.put("cabtratar", this.tratarRETURNyMENSAJES(request, m));
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))) {
					ArrayList<HashMap> mm = (ArrayList<HashMap>) this.tratarRETURNyMENSAJES(request, m);

					for (HashMap mmm : mm) {

						if (((BigDecimal) mmm.get("CTABLA")).intValue() == CTABLA.intValue()
								&& ((BigDecimal) mmm.get("NVECES")).intValue() == NVECES.intValue())
							formdata.putAll(mmm);

					}
				}
			}
			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axismap010Action thisAction) {
		logger.debug("Axismap010Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(502));
			formdata.put("lstQuery", this.tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap010Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axismap010Action thisAction) {
		logger.debug("Axismap010Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");

			BigDecimal CTABLA = this.getCampoNumerico(request, "CTABLA");
			BigDecimal NVECES = this.getCampoNumerico(request, "NVECES");
			String TSENTEN = this.getCampoTextual(request, "TSENTEN");
			BigDecimal CPARAM = this.getCampoNumerico(request, "CPARAM");
			BigDecimal CPRAGMA = this.getCampoNumerico(request, "CPRAGMA");
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPCABTRATAR(CMAPEAD, CTABLA, NVECES, TSENTEN, CPARAM,
					CPRAGMA);
			logger.debug(m);

			BigDecimal retorno = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

			formdata.put("ok", retorno);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap010Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

}
