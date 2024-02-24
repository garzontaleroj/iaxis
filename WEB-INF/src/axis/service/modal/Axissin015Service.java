package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin015Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

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
		// Carga de las PAC_IAX PL/SQL

		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Tipo apuntes
		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPREG();
		listValores.put("tipo_apunte", (List) tratarRETURNyMENSAJES(request, map));

		// tipo estados
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCESTAGE();
		listValores.put("tipo_estado", (List) tratarRETURNyMENSAJES(request, map));

		// tipo manual
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMANUAL();
		listValores.put("tipo_manual", (List) tratarRETURNyMENSAJES(request, map));

		request.setAttribute("listValores", listValores);

	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarDatos(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		if (isEmpty(NTRAMIT))
			NTRAMIT = getCampoNumerico(request, "indexTramitacio");
		BigDecimal NLINAGE = getCampoNumerico(request, "NLINAGE");

		// Llamamos a la parte de consulta de la funcion
		Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).

				ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIAGENDA(NSINIES, NTRAMIT, NLINAGE);
		Map mapa_final = (Map) tratarRETURNyMENSAJES(request, map);
		// Cargamos el mapa con el resultado en pantalla
		formdata.putAll(mapa_final);

	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void borrarDatos(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		BigDecimal NLINAGE = getCampoNumerico(request, "NLINAGE");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

		// Llamamos a la parte de consulta de la funcion
		Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMIAGENDA(NSINIES, NTRAMIT, NLINAGE, SPRODUC, CACTIVI);

		// Cargamos el mapa con el resultado en pantalla
		formdata.putAll(map);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin015Action thisAction) {
		logger.debug("Axissin015Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin015Service m_form");

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String MODO = getCampoTextual(request, "MODO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			HashMap datos_prueba = new HashMap();

			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");

			request.getSession().setAttribute("indexTramitacio", indexTramitacio);
			formdata.put("indexTramitacio", indexTramitacio);
			formdata.put("SSEGURO", SSEGURO);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("MODO", MODO);
			formdata.put("NSINIES", NSINIES);

			cargarListas(request);
			// S�lo cuando el modo sea alta
			if ("MOD".equals(MODO)) {
				cargarDatos(request);

			} else {
				formdata.put("CMANUAL", 0); // En modo alta siempre ser� manual
				formdata.put("CESTAGE", 0);
				formdata.put("FALTA", fcGetFechaActual());
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin015Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin015Action thisAction) {

		logger.debug("Axissin015Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NLINAGE = getCampoNumerico(request, "NLINAGE");

			BigDecimal CTIPREG = getCampoNumerico(request, "CTIPREG"); /* Si */
			BigDecimal CMANUAL = getCampoNumerico(request, "CMANUAL"); /* Si */
			BigDecimal CESTAGE = getCampoNumerico(request, "CESTAGE"); /* Si */

			String TTITAGE = getCampoTextual(request, "TTITAGE"); /* Si */
			String TLINAGE = getCampoTextual(request, "TLINAGE"); /* Si */

			Date FALTA = stringToSqlDate(getCampoTextual(request, "FALTA")); /* Si */
			Date FFINAGE = stringToSqlDate(getCampoTextual(request, "FFINAGE")); /* Si */

			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAGENDA(NSINIES, NTRAMIT, NLINAGE, CTIPREG, CMANUAL,
							CESTAGE, FFINAGE, TTITAGE, TLINAGE);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (resultado.intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			} else {
				request.setAttribute("OK", "KO"); // ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin015Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		// String fecha = FECHA_ACTUAL.toString();
		// String fecha_final =
		// fecha.substring(8,10)+"/"+fecha.substring(5,7)+"/"+fecha.substring(0,4);
		// return fecha_final;
		return FECHA_ACTUAL;

	}

}
