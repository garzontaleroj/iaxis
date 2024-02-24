package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/* Ventana correspondiente a alta de siniestros:
 * Al entrar en consulta de siniestros nos salta la pantalla modal axissin002 de
 * b�squeda de siniestro. Se podr� buscar por los siguientes par�metros:
 * DATOS POLIZA
 *   ?	P�liza - NPOLIZA
 *   ?	Certificado puede ser nulo - NCERTIF
 *   ?  Fecha efecto - FEFECTO
 *   ?  Fecha vencimiento - FVENCIM
 *   ?  Fecha anulacion - FANULAC
 *   ?  Situaci�n - CSITUAC
 *   ?  Riesgo - TRIESGO
 *   ULTIMO RECIBO
 *   ?  Num recibo - NRECIBO
 *   ?  Fecha efecto - FEFECTO_REC   real:FEFECTO
 *   ?  Fecha vencimiento - FVENCIM_REC
 *   ?  Importe - ICONCEP
 *   ?  Situaci�n - CESTREC
 *   DATOS SINIESTRO
 *   ?  Siniestro - NSINIES
 *   ?  Tramitador - CTRAINT / CTRAEXT
 *   ?  Situaci�n - CESTSIN
 *   ?  Fecha Ocurrecia - FSINIES
 *   ?  Hora de ocurrencia - HSINIES???
 *   ?  Fecha recepcion - FNOTIFI
 *   ?  Causas - CCAUSIN
 *   ?  Motivo - CMOTSIN
 *   ?  Responsabilidad - CCULPAB???
 *   ?  Zona de ocurrencia - ???
 *   ?  Descripci�n Siniestro - TSINIES
 * ninguno de estos par�metros de b�squeda es obligatorio.
 * Si no se introduce ninguno de estos par�metros, el buscador mostrar� toda
 * la lista de p�lizas-siniestros
 *                                                               (**) Nombres a�n por establecer

*/

/**
 * Axissin003Service.java
 * 
 * @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner Villas</a>
 */
public class Axissin003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axissin003Action thisAction) {
		logger.debug("Axissin003Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axissin003Action thisAction) {
		logger.debug("Axissin003Service m_form");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	/**
	 * Realiza la carga de los datos p�liza (incluyendo tomadores y �ltimo recibo) y
	 * siniestro para un SSEGURO y NSINIES dado.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cargarDatos(HttpServletRequest request, Axissin003Action thisAction) {
		logger.debug("Axissin003Service m_cargarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			cargarDatosPoliza(request, pac_axis_siniestros, pac_axis_producccion, SSEGURO);
			cargarDatosSiniestro(request, pac_axis_siniestros, NSINIES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin003Service - m�todo m_cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarDatosPoliza(HttpServletRequest request, PAC_IAX_SINIESTROS pac_axis_siniestros,
			PAC_IAX_PRODUCCION pac_axis_producccion, BigDecimal SSEGURO) throws Exception {

		// Datos p�liza
		Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug(map);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);

		// A�adimos datosPoliza en el Map formdata para poder mostrarlos en la vista

		if (!isEmpty(datosPoliza)) {
			Map OB_IAX_DATPOLIZA = new HashMap();
			OB_IAX_DATPOLIZA.putAll(datosPoliza);
			formdata.put("OB_IAX_DATPOLIZA", OB_IAX_DATPOLIZA);
		}

		// Tomadores p�liza
		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES_OLD(SSEGURO);
		logger.debug(map);
		List tomadores = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(tomadores))
			formdata.put("T_IAX_TOMADORES", tomadores);

		// �ltimo recibo
		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO_OLD(SSEGURO);
		logger.debug(map);
		List lastRecibo = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(lastRecibo))
			formdata.put("T_IAX_LASTRECIBO", lastRecibo);

		Map datPol = (Map) formdata.get("OB_IAX_DATPOLIZA");
		BigDecimal SPRODUC = isEmpty(getCampoNumerico(request, "SPRODUC"))
				? !isEmpty(datPol.get("SPRODUC")) ? (BigDecimal) datPol.get("SPRODUC") : null
				: getCampoNumerico(request, "SPRODUC");
		request.getSession().setAttribute("SPRODUC", SPRODUC);

		if (isEmpty(SPRODUC) && !isEmpty(formdata.get("SPRODUC"))) {
			SPRODUC = (BigDecimal) formdata.get("SPRODUC");
		}
		logger.debug("aaa->" + SPRODUC);
		if (!isEmpty(SPRODUC))
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);

		this.configForm(request, whoami(this));

	}

	private void cargarDatosSiniestro(HttpServletRequest request, PAC_IAX_SINIESTROS pac_axis_siniestros,
			BigDecimal NSINIES) throws Exception {
		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO_OLD(NSINIES);
		logger.debug(map);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map);

		// A�adimos datosSiniestro en el Map formdata para poder mostrarlos en la vista
		if (!isEmpty(datosSiniestro)) {
			Map OB_IAX_SINIESTRO = new HashMap();
			OB_IAX_SINIESTRO.putAll(datosSiniestro);
			formdata.put("OB_IAX_SINIESTRO", OB_IAX_SINIESTRO);
		}

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		request.getSession().setAttribute("SPRODUC", SPRODUC);

		if (isEmpty(SPRODUC) && !isEmpty(formdata.get("SPRODUC"))) {
			SPRODUC = (BigDecimal) formdata.get("SPRODUC");
		}
		logger.debug("aaa->" + SPRODUC);
		if (!isEmpty(SPRODUC))
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);

		this.configForm(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/

	/*********************************************************************************************************************/
	public

			void m_consultarPoliza(HttpServletRequest request, Axissin003Action thisAction) {
		logger.debug("Axissin003Service m_consultarPoliza");
		try {
			// Push de los datos necesarios a la pila
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NSINIES", NSINIES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin003Service - m�todo m_consultarPoliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));
	}

	public void m_volver(HttpServletRequest request, Axissin003Action thisAction) {
		logger.debug("Axissin003Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NSINIES")));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
			formdata.put("SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPRODUC")));
			m_cargarDatos(request, thisAction);
			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin003Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}
}
