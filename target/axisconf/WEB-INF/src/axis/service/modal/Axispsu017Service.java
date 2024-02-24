package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

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
public class Axispsu017Service extends AxisBaseService {
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

	@SuppressWarnings({ "unused", "static-access" })
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispsu003Service m_form");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Entrada que indica si la pantalla ser� editable
			request.setAttribute("EDITABLE", this.getCampoNumerico(request, "EDITABLE"));

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGUROS");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMIS");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");

			BigDecimal CCONTROL = this.getCampoNumerico(request, "CCONTROL");
			BigDecimal CAREA = this.getCampoNumerico(request, "CAREA");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			String PTABLAS = this.getCampoTextual(request, "PTABLAS");
			BigDecimal pP_NVERSION = this.getCampoNumerico(request, "NVERSIONS");

			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_LEE_PSU_SUBESTADOSPROP(SSEGURO, pP_NVERSION, null, NMOVIMI);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

				List b = (List) m.get("P_TPSU_SUBESTADOSPROP");

				formdata.put("P_TPSU_SUBESTADOSPROP", b);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispsu003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
