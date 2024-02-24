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
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin083Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin083Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCONTINGENCIA();

		listValores.put("tipo_contin", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTRIESGOS();

		listValores.put("tipo_riesgo", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCLASEPROCESO();

		listValores.put("clase_proceso", (List) tratarRETURNyMENSAJES(request, map));
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstinstanciaproceso();

		listValores.put("instancia_proceso", (List) tratarRETURNyMENSAJES(request, map));
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstcontingenciafallo();

		listValores.put("contingencia_fallo", (List) tratarRETURNyMENSAJES(request, map));
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstcalifmotivo();

		listValores.put("calificacion_motivo", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin083Action thisAction) {
		logger.debug("Axispro083Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String NSINIES = getCampoTextual(request, "NSINIES");
			formdata.put("NSINIES", NSINIES);
			String NTRAMIT = getCampoTextual(request, "NTRAMIT");
			formdata.put("NTRAMIT", NTRAMIT);

			if (NSINIES != null) {
				/* Cargar datos maxima perdida del ultimo movimiento bug 3603 */
				Map m = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_MAX_TRAMITA_ESTSINI(NSINIES);
				ArrayList valores = (ArrayList) m.get("RETURN");
				if (valores.size() > 0) {
					Map result = (Map) valores.get(0);

					formdata.put("NMAXPP", result.get("NMAXPP"));
					formdata.put("NCONTIN", result.get("NCONTIN"));
					formdata.put("NCAUSA", result.get("NRIESGO"));
					formdata.put("TOBS", result.get("COBSERV"));
					formdata.put("NCLASEPRO", result.get("NCLASEPRO"));
					formdata.put("NINSTPROC", result.get("NINSTPROC"));
					formdata.put("NFALLOCP", result.get("NFALLOCP"));
					formdata.put("NCALMOT", result.get("NCALMOT"));
					formdata.put("FCONTINGEN", result.get("FCONTINGEN"));
					formdata.put("TOBSFALLO", result.get("TOBSFALLO"));

				}
			}

			cargarListas(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin083Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin083Action thisAction) {
		logger.debug("AXISSIN083Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT");
			BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
			BigDecimal NMAXPP = this.getCampoNumerico(request, "NMAXPP");
			BigDecimal NCONTIN = this.getCampoNumerico(request, "NCONTIN");
			BigDecimal NCAUSA = this.getCampoNumerico(request, "NCAUSA");
			String TOBS = getHiddenCampoTextual(request, "TOBS");

			BigDecimal NCLASEPRO = this.getCampoNumerico(request, "NCLASEPRO");
			BigDecimal NINSTPROC = this.getCampoNumerico(request, "NINSTPROC");
			BigDecimal NFALLOCP = this.getCampoNumerico(request, "NFALLOCP");
			BigDecimal NCALMOT = this.getCampoNumerico(request, "NCALMOT");
			java.sql.Date FCONTINGEN = this.stringToSqlDate(getCampoTextual(request, "FCONTINGEN"));
			String TOBSFALLO = getCampoTextual(request, "TOBSFALLO");

			formdata.put("NSINIES", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_INS_ESTIMASINI(NSINIES, NTRAMIT, NMOVIMI, NMAXPP,
					NCONTIN, NCAUSA, TOBS, NCLASEPRO, NINSTPROC, NFALLOCP, NCALMOT, FCONTINGEN, TOBSFALLO);

			if (!map.get("RETURN").equals(new BigDecimal(0))) {
				tratarRETURNyMENSAJES(request, map);
			} else {
				request.setAttribute("OK", "OK");
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));
		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN083Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
