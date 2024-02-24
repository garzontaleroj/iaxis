package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb003Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a> - Finalizar Desarrollo -
 *         Modificaci�n Funciones PL
 * @since Java 5.0
 */
public class Axisrmb003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_REEMBOLSOS pac_axis_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");

			formdata.put("SSEGURO", SSEGURO);
			formdata.put("NRIESGO", NRIESGO);
			formdata.put("NREEMB", NREEMB);

			boolean look = (!isEmpty(formdata.get("OK")));

			if (isEmpty(NREEMB) && !look)
				this.dbInicializaReemb(request, SSEGURO, NRIESGO);
			else
				this.dbCargaRemmb(request, NREEMB);

			if (isEmpty(SSEGURO))
				SSEGURO = (BigDecimal) formdata.get("SSEGURO");
			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) formdata.get("NRIESGO");

			cargarCombos(request, SSEGURO, NRIESGO);
			cargarDatosPoliza(request, SSEGURO);
			formdata.remove("OK");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, BigDecimal SSEGURO, BigDecimal NRIESGO) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REEMBOLSOS pac_axis_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Lista tipo de cuentas */
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			logger.debug(map);
			listValores.put("tipCCC", (List) tratarRETURNyMENSAJES(request, map));

			/* Lista de estados */
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSREEMB();
			logger.debug(map);
			listValores.put("lstEstados", (List) tratarRETURNyMENSAJES(request, map));

			/* Lista de garantias */
			// map =
			// pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_GET_GARANREEMB(SSEGURO,NRIESGO,new
			// java.sql.Date( new Date().getTime()) ); //Necesitamos tres par�metros que no
			// tenemos en la pantalla 001
			java.sql.Date dataAlta;
			if (isEmpty(getCampoTextual(request, "FALTA")))
				dataAlta = new java.sql.Date(
						new SimpleDateFormat("yyyy-MM-dd").parse(String.valueOf(formdata.get("FALTA"))).getTime());
			else
				dataAlta = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FALTA"));

			map = pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_GET_GARANREEMB(SSEGURO, NRIESGO, dataAlta); // Necesitamos
																												// tres
																												// par�metros
																												// que
																												// no
																												// tenemos
																												// en la
																												// pantalla
																												// 001
			logger.debug(map);
			listValores.put("tipGaran", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio cargarCombos - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	private void cargarDatosPoliza(HttpServletRequest request, BigDecimal SSEGURO) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos p�liza
		Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug(map);

		// Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);

		// A�adimos datosPoliza en el Map formdata para poder mostrarlos en la vista
		if (!isEmpty(map.get("RETURN"))) {
			// Map OB_IAX_DATPOLIZA = new HashMap();
			// OB_IAX_DATPOLIZA.putAll(datosPoliza);
			formdata.put("NCERTIF", ((Map) map.get("RETURN")).get("NCERTIF"));
			formdata.put("TPRODUC", ((Map) map.get("RETURN")).get("TPRODUC"));
			formdata.put("TSITUAC", ((Map) map.get("RETURN")).get("TSITUAC"));
			formdata.put("NPOLIZA", ((Map) map.get("RETURN")).get("NPOLIZA"));
		}

		this.configForm(request, this.whoami(this));
	}

	/*
	 * Map map =
	 * pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
	 * logger.debug(map); Map formdata = (Map)
	 * request.getAttribute(Constantes.FORMDATA); Map datosPoliza = (Map)
	 * tratarRETURNyMENSAJES(request, map);
	 * 
	 * // A�adimos datosPoliza en el Map formdata para poder mostrarlos en la vista
	 * if (!isEmpty(datosPoliza)) { Map OB_IAX_DATPOLIZA = new HashMap();
	 * OB_IAX_DATPOLIZA.putAll(datosPoliza); formdata.put("OB_IAX_DATPOLIZA",
	 * OB_IAX_DATPOLIZA); }
	 * 
	 * // Tomadores p�liza map =
	 * pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(SSEGURO);
	 * logger.debug(map); List tomadores = (List) tratarRETURNyMENSAJES(request,
	 * map); if (!isEmpty(tomadores)) formdata.put("T_IAX_TOMADORES", tomadores); }
	 */

	private void dbInicializaReemb(HttpServletRequest request, BigDecimal SSEGURO, BigDecimal NRIESGO)
			throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REEMBOLSOS pac_axis_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_INICIALIZA_REEMB(SSEGURO, NRIESGO);
			logger.debug(map);
			map = (Map) tratarRETURNyMENSAJES(request, map);
			// formdata.putAll((Map)map.get("RETURN"));
			formdata.putAll(map);

			/*
			 * map =
			 * pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_RIESGO(SSEGURO,
			 * NRIESGO); logger.debug(map); if (!isEmpty(map))
			 * formdata.putAll((Map)map.get("RETURN"));
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio dbInicializaReemb - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	private void dbCargaRemmb(HttpServletRequest request, BigDecimal NREEMB) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REEMBOLSOS pac_axis_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMB(NREEMB);
			logger.debug(map);
			map = (Map) tratarRETURNyMENSAJES(request, map);
			// formdata.putAll((Map)map.get("RETURN"));
			formdata.putAll(map);

			/*
			 * map =
			 * pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTA_RIESGO(SSEGURO,
			 * NRIESGO); logger.debug(map); if (!isEmpty(map))
			 * formdata.putAll((Map)map.get("RETURN"));
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio dbInicializaReemb - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisrmb003Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map listValores = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_REEMBOLSOS pac_axis_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// grabar reembolso
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			if (isEmpty(CGARANT))
				CGARANT = getCampoNumerico(request, "CGARANTHIDDEN");

			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			if (isEmpty(CESTADO))
				CESTADO = getCampoNumerico(request, "CESTADOHIDDEN");

			String TOBSERV = getCampoTextual(request, "DESCRIPCION");
			String CBANCAR = getCampoTextual(request, "CBANCAR");

			BigDecimal CTIPIBAN = getCampoNumerico(request, "CTIPBAN");
			if (isEmpty(CTIPIBAN))
				CTIPIBAN = getCampoNumerico(request, "CTIPBANHIDDEN");

			BigDecimal CORIGEN = getCampoNumerico(request, "CORIGEN");
			Date FESTADO = stringToSqlDate(getCampoTextual(request, "FESTADO"));

			if (isEmpty(CORIGEN))
				CORIGEN = new BigDecimal(1);
			formdata.put("OK", "0");
			// request.getSession().setAttribute("PSNREEMB","1");
			Map map = new HashMap();
			// if (isEmpty(NREEMB)) {
			map = pac_axis_reembolsos.ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBOLSO(SSEGURO, NRIESGO, CGARANT, CESTADO,
					TOBSERV, CBANCAR, CTIPIBAN, CORIGEN, NREEMB);
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map.get("RETURN")) && !isEmpty(codiRetorn) && codiRetorn.intValue() == 0) {
				formdata.put("NREEMB", map.get("PONREEMB"));
				formdata.put("NREEMB_OUT", map.get("PONREEMB"));
				formdata.put("OK", "1");
				// request.getSession().setAttribute("PSNREEMB",map.get("PNREEMB");
			}

			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb003Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

}
