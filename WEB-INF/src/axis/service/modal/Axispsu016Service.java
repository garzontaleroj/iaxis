package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PSU;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispsu003Service.java 2/02/2010
 * 
 * @since Java 5.0
 */
public class Axispsu016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */

	public void m_form(HttpServletRequest request) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Entrada que indica si la pantalla ser� editable
			request.setAttribute("EDITABLE", this.getCampoNumerico(request, "EDITABLE"));

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGUROS");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMIS");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal CCONTROL = this.getCampoNumerico(request, "CCONTROLS");
			BigDecimal CAREA = this.getCampoNumerico(request, "CAREA");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			String PTABLAS = this.getCampoTextual(request, "PTABLAS");
			BigDecimal pP_NVERSION = this.getCampoNumerico(request, "NVERSIONS");

			@SuppressWarnings("rawtypes")
			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_HIS_PSUCONTROLSEG(SSEGURO, pP_NVERSION, NRIESGO, NMOVIMI,
					CCONTROL);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

				List b = (List) m.get("P_THIS_PSUCONTROLSEG");

				formdata.putAll((Map) ((Map) b.get(0)).get("OB_IAX_PSU"));

				this.m_obtener_combos(request);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispsu003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axispsu003Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			HashMap listValores = new HashMap();

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(445));
			listValores.put("estadocontrol", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800068));
			listValores.put("tipocontrol", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(693));
			listValores.put("origenestado", (List) tratarRETURNyMENSAJES(request, map));

			request.setAttribute("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispsu003Service - m�todo m_obtener_combos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
