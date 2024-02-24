package axis.service.modal;

import java.math.BigDecimal;
import java.sql.SQLException;
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
import axis.mvc.control.modal.Axispsu003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import oracle.sql.CLOB;

/**
 * Axispsu003Service.java 2/02/2010
 * 
 * @since Java 5.0
 */
public class Axispsu003Service extends AxisBaseService {
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
		logger.debug("Axispsu003Service m_form");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Entrada que indica si la pantalla ser� editable
			request.setAttribute("EDITABLE", this.getCampoNumerico(request, "EDITABLE"));

			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal CCONTROL = this.getCampoNumerico(request, "CCONTROL");
			BigDecimal CAREA = this.getCampoNumerico(request, "CAREA");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");
			String PTABLAS = this.getCampoTextual(request, "PTABLAS");
			logger.debug(SSEGURO);
			logger.debug(NMOVIMI);
			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GET_DET_PSU(SSEGURO, NMOVIMI, NRIESGO, CGARANT, CCONTROL, PTABLAS);
			logger.debug(m);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.putAll((Map) m.get("P_TPSUS"));

			if (!isEmpty(m.get("P_TPSUS"))) {
				HashMap mm = (HashMap) m.get("P_TPSUS");

				CLOB clob = (CLOB) mm.get("OBSERV");
				if (clob != null) {
					String clobStr;

					try {
						clobStr = clob.getSubString(1, (int) clob.length());
						mm.put("OBSERV", clobStr);
						logger.debug(clobStr);
						logger.debug(mm.get("OBSERV"));
						String TOBSERV;
						request.setAttribute("TOBSERV", clobStr);
					} catch (SQLException e) {
					}
				}
			}

			this.m_obtener_combos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispsu003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
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

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**             
	 */

	public void m_aceptar(HttpServletRequest request, Axispsu003Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PSU pacIaxPsu = new PAC_IAX_PSU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			BigDecimal CCONTROL = this.getCampoNumerico(request, "CCONTROL");
			BigDecimal NOCURRE = this.getCampoNumerico(request, "NOCURRE");
			BigDecimal NVALORTOPE = this.getCampoNumerico(request, "NVALORTOPE");
			BigDecimal NVALORSUPER = this.getCampoNumerico(request, "NVALORSUPER");
			BigDecimal NVALORINF = this.getCampoNumerico(request, "NVALORINF");
			BigDecimal NVALOR = this.getCampoNumerico(request, "NVALOR");
			BigDecimal NIVELR = this.getCampoNumerico(request, "NIVELR");
			BigDecimal CGARANT = this.getCampoNumerico(request, "CGARANT");

			String TOBSERV = this.getCampoTextual(request, "OBSERV");

			logger.debug(TOBSERV);
			BigDecimal CAUTREC = this.getCampoNumerico(request, "CAUTREC");
			String PTABLAS = this.getCampoTextual(request, "PTABLAS");
			BigDecimal MODO = this.getCampoNumerico(request, "MODO");
			BigDecimal ESTABLOQUEA = this.getCampoNumerico(request, "ESTABLOQUEA");
			BigDecimal AUTMANUAL = this.getCampoNumerico(request, "AUTMANUAL");
			String RISKNUM = this.getCampoTextual(request, "RISKNUM");

			Map m = pacIaxPsu.ejecutaPAC_IAX_PSU__F_GESTION_CONTROL(SSEGURO, NRIESGO, NMOVIMI, CGARANT, CCONTROL,
					TOBSERV, CAUTREC, NVALORTOPE, NOCURRE, NVALOR, NVALORINF, NVALORSUPER, NIVELR, ESTABLOQUEA,
					AUTMANUAL, PTABLAS, MODO, RISKNUM);
			logger.debug(m);
			logger.debug(TOBSERV);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.put("OK", "0");
			formdata.put("TOBSERV ", TOBSERV);
			logger.debug(TOBSERV);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispsu003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private CLOB get(String string) {
		// TODO Auto-generated method stub
		return null;
	}
}
