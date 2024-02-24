//Revision:# 1dYtonugVMU5Q+x538On9g== #
package axis.service.axis;

import java.io.File;
import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_COMISIONEGOCIO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_PSU;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr100Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr100Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	//////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////// ACCESO A BBDD ///////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////

	private void eliminarAtributosSession(HttpServletRequest request) {

		request.getSession().removeAttribute("lstsaldodeutors");
		request.getSession().removeAttribute("faceptar");
	}

	private void limpiaAtributosSession(HttpServletRequest request) {
		request.getSession().removeAttribute("faceptar");
		request.getSession().removeAttribute("lstsaldodeutors");
		request.getSession().removeAttribute("axisctr_parametrosGarantias");
		request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
		request.getSession().removeAttribute("axisctr100_datosGestion");
		request.getSession().removeAttribute("axisctr_datosGestion.CFORPAG");
		request.getSession().removeAttribute("axisctr100_datosRiesgo");
		request.getSession().removeAttribute("axisctr_opcionesDatosRenta");
		request.getSession().removeAttribute("TNATRIE");
		request.getSession().removeAttribute("axisctr100_selectedPerson");
		request.getSession().removeAttribute("lstperrevision");
		request.getSession().removeAttribute("num_garantias");
		request.getSession().removeAttribute("");
		request.getSession().removeAttribute("axisctr_CREVALI");
		request.getSession().removeAttribute("axisctr_PREVALI");
		request.getSession().removeAttribute("SPERSON");
		request.getSession().removeAttribute("NRIESGO");
		request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
		request.getSession().removeAttribute("axisctr_datosGestion");
		request.getSession().removeAttribute("axisctr100_preguntasPoliza");
		request.getSession().removeAttribute("axisctr100_pregQuestSalut");
		request.getSession().removeAttribute("axisctr100_pregDespeses");
		request.getSession().removeAttribute("axisPreguntas");
		request.getSession().removeAttribute("axisctr100_datosRiesgo");
		request.getSession().removeAttribute("axisctr100_datosGestion");
		request.getSession().removeAttribute("axisctr100_datosGestion_CFORPAG");
		request.getSession().removeAttribute("axisctr100_datosGestion_FEFECTO");
		request.getSession().removeAttribute("axisctr100_datosGestion_FVENCIM");
		request.getSession().removeAttribute("axisctr100_datosGestion_CDURACI");
		request.getSession().removeAttribute("axisctr100_datosGestion_NDURACI");
		request.getSession().removeAttribute("axisctr100_datosGestion_CRECFRA");
		request.getSession().removeAttribute("axisctr100_selectedPerson");
		request.getSession().removeAttribute("CACTIVI");
		request.getSession().removeAttribute("axisctr_multi_registro_tomadores");
		// ETM BUG 21924

		request.getSession().removeAttribute("axisctr100_datosGestion_PDTOCOM");
		request.getSession().removeAttribute("axisctr100_datosGestion_CTIPRETR");
		request.getSession().removeAttribute("axisctr100_datosGestion_CINDREVFRAN");
		request.getSession().removeAttribute("axisctr100_datosGestion_PRECARG");
		request.getSession().removeAttribute("axisctr100_datosGestion_PDTOTEC");
		request.getSession().removeAttribute("axisctr100_datosGestion_PRECCOM");

		request.getSession().removeAttribute("axisctr100_datosGestion_NEDAMAR");
		request.getSession().removeAttribute("lstNEDAMAR");
		request.getSession().removeAttribute("psu_critica");
	}

	private Map buscaCobjase(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(SPRODUC);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);

		logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

		return plCOBJASE;

	}

	public String obtienePreguntasEmision(UsuarioBean usuario, HttpServletRequest request,
			Axisctr100Action thisAction) {
		try {
			Map m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM();
			logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return (String) tratarRETURNyMENSAJES(request, m, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo obtienePreguntasEmision", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return null;
		}

	}

	public void m_init(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			///////////////////////////////////////////////////////////////
			///// Iniciar si el producto permite multiriesgos o no ////////

			permiteasseg(request, thisAction);
			request.getSession().setAttribute("simuOK", "KO");
			limpiaAtributosSession(request);
			request.getSession().setAttribute("BUSCANDO", this.getCampoTextual(request, "BUSCANDO"));
			AbstractDispatchAction.topPila(request, "ACCION_PSU", new BigDecimal(6)); // Accion simulaciones_psu
			///////////////////////////////////////////////////////////////
			/*
			 * Map m=pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GET_CODIGOSIMUL();
			 * BigDecimal axisctr100_SSEGURO=(BigDecimal)tratarRETURNyMENSAJES(request, m,
			 * false); request.setAttribute("axisctr100_SSEGURO", axisctr100_SSEGURO);
			 * logger.debug(axisctr100_SSEGURO); if (!isEmpty(axisctr100_SSEGURO)){ Map
			 * mx=new
			 * PAC_IAX_PSU(((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)))
			 * .ejecutaPAC_IAX_PSU__F_INICIA_PSU("EST",axisctr100_SSEGURO,new
			 * BigDecimal(6));
			 * logger.debug("PSU---------------------------------------->"+mx);
			 * tratarRETURNyMENSAJES(request, mx, false); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void initParametrosGarantias(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// PAR�METROS GARANT�AS: FORMA DE PAGO, TIPOS Y VALOR REVALORIZACION ELEGIBLES
		Map parametrosGarantias = new HashMap();

		eliminarAtributosSession(request);
		List formaPago = this.dbFormaPago(request, usuario);
		parametrosGarantias.put("formaPago", formaPago);

		BigDecimal CFORPAG = this.dbGetGarForPag(request, usuario);

		parametrosGarantias.put("CFORPAG", CFORPAG);
		BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
		if (!isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC")) && isEmpty(SPRODUC))
			SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
		logger.debug("SPPPRODUC-->" + SPRODUC);
		List tipoReval = this.dbGetTipReval(request, SPRODUC, usuario);
		parametrosGarantias.put("tipoRevalorizacion", tipoReval);

		request.getSession().setAttribute("axisctr_parametrosGarantias", parametrosGarantias);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista de
	 * revalorizaciones del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetTipReval(HttpServletRequest request, BigDecimal SPRODUC, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(SPRODUC);
		logger.debug("Map de Combo Tipo revalorizacion de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * M�todo que carga el tipo de forma de pago seleccionado por el usuario
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGetGarForPag(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
		logger.debug(map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista
	 * correspondiente a la forma de pago.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbFormaPago(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	public void m_form(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = false;
		try {
			eliminarAtributosSession(request);
			// Cargar datos de la pantalla de simulacion //
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			PAC_IAXPAR_PRODUCTOS pacIaxparProductos = new PAC_IAXPAR_PRODUCTOS(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Cargar datos descripcion //
			HashMap gar = new HashMap();
			logger.debug("--" + request.getSession().getAttribute("axisctr_parametrosGarantias"));
			if (!isEmpty(request.getSession().getAttribute("axisctr_parametrosGarantias")))
				gar = (HashMap) request.getSession().getAttribute("axisctr_parametrosGarantias");

			if (!isEmpty(gar.get("CFORPAG")))
				request.getSession().setAttribute("axisctr100_datosGestion_CFORPAG", gar.get("CFORPAG"));

			m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GET_CODIGOSIMUL();
			BigDecimal axisctr100_SSEGURO = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("axisctr100_SSEGURO", axisctr100_SSEGURO);
			AbstractDispatchAction.topPila(request, "ACCION_PSU", new BigDecimal(6)); // Accion simulaciones_psu
			logger.debug(axisctr100_SSEGURO);

			m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GET_SITUACION_SIMUL(axisctr100_SSEGURO);
			logger.debug("situacion simul->" + m);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, m))) {
				formdata.put("TSITUAC", m.get("PTSITSIMUL"));
				logger.debug("+++TSITUAC->" + formdata.get("TSITUAC"));

				formdata.put("CSITUAC", m.get("PCSITSIMUL"));
				logger.debug("+++CSITUAC->" + formdata.get("CSITUAC"));
			}

			// Cargar datos de gestion //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
			logger.debug("m gestion--> " + m);
			Map axisctr100_datosGestion = (Map) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("axisctr100_datosGestion", axisctr100_datosGestion);
			request.getSession().setAttribute("axisctr100_datosGestion", axisctr100_datosGestion);
			if (request.getSession().getAttribute("axisctr100_datosGestion_CFORPAG") == null) {
				// S�lo consultamos si el par�metro es igual a null
				BigDecimal axisctr100_datosGestion_CFORPAG = (BigDecimal) axisctr100_datosGestion.get("CFORPAG");
				logger.debug("CFORPAG-" + axisctr100_datosGestion_CFORPAG);
				request.getSession().setAttribute("axisctr100_datosGestion_CFORPAG", axisctr100_datosGestion_CFORPAG);
			}

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_aux = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
			logger.debug("map_aux-->" + map_aux);
			Map datosGestion_aux = (Map) tratarRETURNyMENSAJES(request, map_aux);
			if (datosGestion_aux != null) {
				axisctr100_datosGestion.put("convempvers", datosGestion_aux.get("CONVEMPVERS"));
				axisctr100_datosGestion.put("SPRODUC", datosGestion_aux.get("SPRODUC"));
			}

			if (request.getSession().getAttribute("axisctr_parametrosGarantias") != null) {
				// HashMap
				// datosGestion07=(HashMap)request.getSession().getAttribute("axisctr_datosGestion");
				HashMap datosGestion07 = (HashMap) request.getSession().getAttribute("axisctr_parametrosGarantias");
				logger.debug("datosGestion07-" + datosGestion07);
				if (datosGestion07.get("CFORPAG") != null) {
					BigDecimal CFORPAG07 = (BigDecimal) datosGestion07.get("CFORPAG");
					logger.debug("CFORPAG07-" + CFORPAG07);
					logger.debug("LA VARIABLE RECIGIDA DE LA PANTALLA 7: "
							+ request.getSession().getAttribute("axisctr_datosGestion.CFORPAG"));
					request.getSession().setAttribute("axisctr100_datosGestion_CFORPAG", CFORPAG07);
				}
			}
			// Colocar el numero de simulacion en sesion
			if (axisctr100_datosGestion != null) {

			}
			logger.debug(axisctr100_datosGestion);

			/* Tipo retribucion ETM 21924 */
			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPRETRIBU(null);
			logger.debug(m);
			List tipoRetribu = (List) tratarRETURNyMENSAJES(request, m);
			axisctr100_datosGestion.put("tipoRetribu", tipoRetribu);
			/* revalorizacion de franquicia bug 21924 --etm */
			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREVALFRANQ();
			logger.debug(m);
			List revalFran = (List) tratarRETURNyMENSAJES(request, m);
			axisctr100_datosGestion.put("revalFran", revalFran);
			/* FIN ETM */

			// Carga datos forma de pago //
			m = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
			List axisctr100_comboFormaPago = (List) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("axisctr100_comboFormaPago", axisctr100_comboFormaPago);
			logger.debug(axisctr100_comboFormaPago);
			// Cargar datos de tipo duracion //
			m = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPDURACION();
			List axisctr100_comboTipoDuracion = (List) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("axisctr100_comboTipoDuracion", axisctr100_comboTipoDuracion);
			logger.debug(axisctr100_comboTipoDuracion);
			initPreguntas(request, usuario);
			// Cargar datos Riesgos //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
			List axisctr100_datosRiesgos = (List) tratarRETURNyMENSAJES(request, m, false);
			request.getSession().setAttribute("axisctr100_datosRiesgo", axisctr100_datosRiesgos); // meter variable en
																									// session
			logger.debug(axisctr100_datosRiesgos);
			// Cargar datos econ�micos //
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
			Map axisctr100_primasPoliza = (Map) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("axisctr100_primasPoliza", axisctr100_primasPoliza);
			logger.debug(axisctr100_primasPoliza);

			// Cargar los datos economicos en una lista
			List axisctr100_datosEconomicos = new ArrayList();
			axisctr100_datosEconomicos.add(axisctr100_primasPoliza);
			request.setAttribute("axisctr100_datosEconomicos", axisctr100_datosEconomicos);

			/* Lista idiomas */
			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			List idiomas = (List) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute("idiomas", idiomas);
			idiomas = null;

			/* ForPagRent */
			if (isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC"))) {
				AbstractDispatchAction.topPila(request, "SPRODUC", this.getCampoNumerico(request, "SPROD"));
			}
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			Map map = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(SPRODUC);
			logger.debug(map);
			List CFORPAGREN = (List) tratarRETURNyMENSAJES(request, map, false);
			Map opcionesDatosRenta = new HashMap();
			opcionesDatosRenta.put("CFORPAGREN", CFORPAGREN);

			/* Lista actividades */
			m = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(
					new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC"))), null);
			logger.debug(m);
			request.setAttribute("lstcactivi", tratarRETURNyMENSAJES(request, m, false));

			/* PerRevision */
			map = pacIaxparProductos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PERREVISION(SPRODUC);
			logger.debug(map);
			List NDURPER = (List) tratarRETURNyMENSAJES(request, map, false);
			// opciones
			opcionesDatosRenta.put("NDURPER", NDURPER);
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
			List monedas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("monedasPago", monedas);
			monedas = null;
			logger.debug("monedas -----------------> " + map);

			request.getSession().setAttribute("axisctr_opcionesDatosRenta", opcionesDatosRenta);

			request.getSession().setAttribute("TNATRIE", axisctr100_SSEGURO);

			request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson + "");

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEDADESPROD(SPRODUC);
			logger.debug(map);
			List lstNEDAMAR = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("lstNEDAMAR", lstNEDAMAR);

			// BUG9427-13032009-XVM
			if (isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO"))) {
				AbstractDispatchAction.topPila(request, "SSEGURO", this.getCampoNumerico(request, "SEGURO"));
			}

			request.getSession().setAttribute("lstperrevision", NDURPER);

			BigDecimal num_garantias = obtiene_filas(request, usuario, SPRODUC);
			request.getSession().setAttribute("num_garantias", num_garantias);

			this.m_getRiesgo(request, axisctr100_datosRiesgos);
			List listaTomadores = this.dbLeeTomadores(request, usuario);
			request.setAttribute("axisctr_tomadores", ((listaTomadores == null) ? new ArrayList() : listaTomadores));
			BigDecimal multiRegistro = this.dbPermitirMultiRegistro(request, usuario);

			if (multiRegistro != null)
				request.getSession().setAttribute("axisctr_multi_registro_tomadores",
						new Integer(multiRegistro.intValue()));
			SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}
			m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PREG_COND_TOMASEG", SPRODUC);
			logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
			formdata.put("PREG_COND_TOMASEG", (BigDecimal) tratarRETURNyMENSAJES(request, m, false));

			/*
			 * if (!isEmpty(axisctr100_SSEGURO)){ Map mx=new
			 * PAC_IAX_PSU(((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)))
			 * .ejecutaPAC_IAX_PSU__F_INICIA_PSU("EST",axisctr100_SSEGURO,new
			 * BigDecimal(6));
			 * logger.debug("PSU---------------------------------------->"+mx);
			 * tratarRETURNyMENSAJES(request, mx, false); }
			 */
			if (!isEmpty(axisctr100_SSEGURO)) { // Si estamos en simulacion lanzamos la PSU

				Map col_psu = new PAC_IAX_PSU(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_PSU__F_GET_COLEC_PSU(axisctr100_SSEGURO, null, null, "EST");
				logger.debug("col_psu:" + col_psu);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, col_psu)).intValue() == 0) {
					request.setAttribute("PTESTPOL", col_psu.get("P_TESTPOL"));
					request.setAttribute("PCESTPOL", col_psu.get("P_CESTPOL"));
					request.setAttribute("PCNIVELBPM", col_psu.get("P_CNIVELBPM"));
					request.setAttribute("PTNIVELBPM", col_psu.get("P_TNIVELBPM"));
					request.setAttribute("POBPSU_RETENIDAS", col_psu.get("POBPSU_RETENIDAS"));
					request.setAttribute("PTPSUS", col_psu.get("P_TPSUS"));

					logger.debug(col_psu.get("POBPSU_RETENIDAS"));
					if (!isEmpty(col_psu.get("POBPSU_RETENIDAS"))) {
						HashMap mm = (HashMap) col_psu.get("POBPSU_RETENIDAS");
						logger.debug(m.get("NOCONTINUA"));
						if (!isEmpty(mm.get("NOCONTINUA"))) {
							request.setAttribute("PERMITE_EMITIR", mm.get("NOCONTINUA"));
							request.setAttribute("CCRITICO", mm.get("CCRITICO"));
						}
					}
				}
			}
			map = buscaCobjase(request);
			formdata.put("COBJASE", map.get("COBJASE"));
			// formdata.put("CCOMPANI", usuario.getCempres());

			PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal spereal = null;

			try {
				spereal = (BigDecimal) ((Map) ((Map) listaTomadores.get(0)).get("OB_IAX_TOMADORES")).get("SPEREAL");
			} catch (Exception e) {
				spereal = null;
			}

			String FEFECTOstr = getHiddenCampoTextual(request, "FEFECTO");
			java.util.Date ahora = new java.util.Date();
			SimpleDateFormat formateador = new SimpleDateFormat("dd/MM/yyyy");
			FEFECTOstr = FEFECTOstr == null ? formateador.format(ahora) : FEFECTOstr;
			Date FEFECTO = AxisBaseService.stringToSqlDate(FEFECTOstr, "dd/MM/yyyy");

			BigDecimal CAGENTE = (BigDecimal) AbstractDispatchAction.topPila(request, "CAGENTE");
			if (isEmpty(CAGENTE) && !isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
				CAGENTE = (BigDecimal) ((HashMap) request.getSession().getAttribute("axisctr_agente")).get("CODI");
			}

			m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TIENECONVCOMESP(spereal, CAGENTE, SPRODUC,
					FEFECTO);

			logger.debug("--> tiene convenio: " + m);
			BigDecimal PCONVENIO = (BigDecimal) m.get("PCONVENIO");
			if (!isEmpty(PCONVENIO) && PCONVENIO.equals(new BigDecimal(1))) {
				// formdata.put("CTIPCOM", new BigDecimal(92));
				formdata.put("CTIPCOM", new BigDecimal(92));
				Map mapGestComision = pacIaxProduccion
						.ejecutaPAC_IAX_PRODUCCION__F_LEEGESTIONCOMISION(new BigDecimal(92));
				logger.debug(mapGestComision);
				List listGestComision = (List) tratarRETURNyMENSAJES(request, mapGestComision);

				BigDecimal guardat = new BigDecimal(0);
				if (!isEmpty(listGestComision)) {
					for (int i = 0; i < listGestComision.size(); i++) {
						Map obj = (Map) listGestComision.get(i);
						Map obj2 = (Map) obj.get("OB_IAX_GSTCOMISION");

						BigDecimal cmodcom = (BigDecimal) obj2.get("CMODCOM");
						BigDecimal pcomisi = (BigDecimal) obj2.get("PCOMISI");

						if (pcomisi == null)
							pcomisi = new BigDecimal(0);

						BigDecimal ninialt = (BigDecimal) obj2.get("NINIALT");
						BigDecimal nfinalt = (BigDecimal) obj2.get("NFINALT");

						Map comisi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION(cmodcom,
								pcomisi, ninialt, nfinalt);
						if ((comisi.get("RETURN") != null && comisi.get("RETURN") instanceof BigDecimal)
								&& (((BigDecimal) comisi.get("RETURN")).intValue() != 0)) {
							guardat = new BigDecimal(1);
						}
						logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISION: " + comisi);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			permiteasseg(request, thisAction);
			if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO"))) {
				AbstractDispatchAction.topPila(request, "CMODO", this.getCampoTextual(request, "CMOD"));
			}
			if (isEmpty(AbstractDispatchAction.topPila(request, "TTITULO"))) {
				logger.debug("titulo : " + this.getCampoTextual(request, "TTITUL"));
				AbstractDispatchAction.topPila(request, "TTITULO", this.getCampoTextual(request, "TTITUL"));
			}
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void permiteasseg(HttpServletRequest request, Axisctr100Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Map map = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG();
			BigDecimal codigoLlamada = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + codigoLlamada);
			if (codigoLlamada != null) {
				request.getSession().setAttribute("axisctr_multi_registro_asegurados",
						new Integer(codigoLlamada.intValue()));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo permiteasseg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void m_getRiesgo(HttpServletRequest request, List axisctr100_datosRiesgos) {
		logger.debug("Axisctr100Service m_getRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			eliminarAtributosSession(request);
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			logger.debug("NRIESGO 1-->" + NRIESGO);

			if ((isEmpty(NRIESGO) || NRIESGO.intValue() == 0)
					&& !isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			logger.debug("NRIESGO 2-->" + NRIESGO);
			if (isEmpty(NRIESGO) || NRIESGO.intValue() == 0) {
				if (!isEmpty(axisctr100_datosRiesgos) && axisctr100_datosRiesgos.size() > 0) {
					HashMap r = (HashMap) axisctr100_datosRiesgos.get(0);
					HashMap OB_IAX_GESTRIESGOS = (HashMap) r.get("OB_IAX_GESTRIESGOS");
					NRIESGO = new BigDecimal(String.valueOf(OB_IAX_GESTRIESGOS.get("NRIESGO")));
				}
			}

			Map map = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);

			logger.debug(map);

			boolean isNeedTarificar = true;
			Map OB_IAX_RIESGOS = (Map) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("obj OB_IAX_RIESGOS-->" + OB_IAX_RIESGOS);
			logger.debug("gara-->" + OB_IAX_RIESGOS.get("GARANTIAS"));
			if (!isEmpty(OB_IAX_RIESGOS.get("GARANTIAS"))) {

				isNeedTarificar = isNeedTarificar((List<HashMap>) OB_IAX_RIESGOS.get("GARANTIAS"));

				if (!isNeedTarificar) {
					Map m = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA("EST",
									(BigDecimal) request.getAttribute("axisctr100_SSEGURO"));
					logger.debug("reval-->" + m);
					// Map revalorizacion = (Map)tratarRETURNyMENSAJES(request,m);
					BigDecimal PREVALI = (BigDecimal) m.get("PREVALI");
					BigDecimal CREVALI = (BigDecimal) m.get("PCREVALI");
					if (CREVALI != null) {
						request.getSession().setAttribute("axisctr_CREVALI", CREVALI);
					}
					if (PREVALI != null) {
						request.getSession().setAttribute("axisctr_PREVALI", PREVALI);
					}

					this.initParametrosGarantias(request, usuario);
				}
				List<HashMap> garantiasEntrada = this.getGarantiasSelecEntrada((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List<HashMap> garantiasSortida = this.getGarantiasSelecSalida((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				List<HashMap> garantiasGeneral = this
						.getGarantiasSelecGenerales((List) OB_IAX_RIESGOS.get("GARANTIAS"));
				request.setAttribute("garantiasEntrada",
						((garantiasEntrada == null) ? new ArrayList() : garantiasEntrada));
				request.setAttribute("garantiasSortida",
						((garantiasSortida == null) ? new ArrayList() : garantiasSortida));
				request.setAttribute("garantiasGeneral",
						((garantiasGeneral == null) ? new ArrayList() : garantiasGeneral));

			}
			request.setAttribute("NRIESGO", NRIESGO);
			request.setAttribute("isNeedTarificar", isNeedTarificar);
			request.setAttribute("OB_IAX_RIESGOS", OB_IAX_RIESGOS);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_getRiesgo", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(AbstractDispatchAction.topPila(request, "CMODO"))) {
				AbstractDispatchAction.topPila(request, "CMODO", this.getCampoTextual(request, "CMOD"));
			}
			if (isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC"))) {
				AbstractDispatchAction.topPila(request, "SPRODUC", this.getCampoNumerico(request, "SPROD"));
			}
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private boolean isNeedTarificar(List<HashMap> garanties) {

		boolean needTarificar = false;

		for (HashMap g : garanties) {
			HashMap gar = (HashMap) g.get("OB_IAX_GARANTIAS");
			if (!isEmpty(gar.get("PRIMAS"))) {
				HashMap PRIMAS = (HashMap) gar.get("PRIMAS");
				if (!isEmpty(PRIMAS.get("NEEDTARIFAR"))) {
					BigDecimal NEEDTARIFAR = new BigDecimal(String.valueOf(PRIMAS.get("NEEDTARIFAR")));
					if (NEEDTARIFAR.intValue() == 1)
						return true;
				}
			}
		}

		return needTarificar;
	}

	/**
	 * M�todo que obtiene las garantias de entrada a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecEntrada(List lista_garantias) {

		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 3 || ctipo.intValue() == 4)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecSalida(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 5 || ctipo.intValue() == 8 || ctipo.intValue() == 9)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�as
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecGenerales(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo.intValue() != 5 && ctipo.intValue() != 8 && ctipo.intValue() != 9 && ctipo.intValue() != 3
						&& ctipo.intValue() != 4) {
					lista_aux.add(((HashMap) lista_garantias.get(i)));
				}

			}
		}
		return lista_aux;
	}

	public BigDecimal m_guardar_riesgo(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_guardar_riesgo");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			formdata.put("TIPO", TIPO);
			eliminarAtributosSession(request);
			// Recoger par�metros asegurado
			String SPERSON;
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
			String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); // tipo de documento
			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI"); // tipo persona
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal COCUPACION = getCampoNumerico(request, "COCUPACION");
			BigDecimal CESTCIV = getCampoNumerico(request, "CESTCIV");

			String fecha = getCampoTextual(request, "FNACIMI");
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			java.sql.Date FNACIMI = this.stringToSqlDate(fecha, "dd/MM/yyyy");

			// Recoger dato SPERSON DE SESION
			if (request.getSession().getAttribute("SPERSON2MODIFY") != null) {
				SPERSON = String.valueOf(request.getSession().getAttribute("SPERSON2MODIFY"));
			} else {
				SPERSON = "0";
			}

			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			/* Validaciones sobre los datos del asegurado */
			PAC_IAX_VALIDACIONES pacIaxValidacion = new PAC_IAX_VALIDACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			BigDecimal axisctr100_grabarAseg;
			// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant
			m_grabar_preguntas(request, thisAction);
			if ((TIPO != null) && (TIPO.intValue() == 1)) {
				if
				// !isEmpty(CSEXPER)&&!isEmpty(FNACIMI)&&
				(!isEmpty(SPERSON) && !isEmpty(CTIPIDE) && !isEmpty(TIDENTI)) {
					// Llamar a funci�n grabar asegurado BigDecimal pPSPERSON, BigDecimal pPCSEXPER,
					// pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTAPELLI1, PTAPELLI2, BigDecimal pPCTIPIDE,
					// pPTIDENTI

					m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GRABATOMADORES(new BigDecimal(SPERSON), CSEXPER,
							FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2, TAPELLI1, TAPELLI2, CTIPIDE, TIDENTI,
							CDOMICI, CPOBLAC, CPROVIN, CPAIS, COCUPACION, CESTCIV);
					axisctr100_grabarAseg = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
					request.setAttribute("axisctr100_sexo", axisctr100_grabarAseg);
					logger.debug(axisctr100_grabarAseg);
					// m = pacIaxValidacion.ejecutaPAC_IAX_VALIDACIONES__F_VALIDATOMADORES();
					// BigDecimal axisctr100_validaAseg = (BigDecimal)tratarRETURNyMENSAJES(request,
					// m, false);
				} else {
					axisctr100_grabarAseg = new BigDecimal(1);
					request.setAttribute("axisctr100_sexo", new BigDecimal(1));
				}

			} else {
				if
				// !isEmpty(CSEXPER)&&!isEmpty(FNACIMI)&&
				(!isEmpty(SPERSON) && !isEmpty(CTIPIDE) && !isEmpty(TIDENTI)) {
					// Llamar a funci�n grabar asegurado BigDecimal pPSPERSON, BigDecimal pPCSEXPER,
					// pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTAPELLI1, PTAPELLI2, BigDecimal pPCTIPIDE,
					// pPTIDENTI
					m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GRABAASEGURADOS(new BigDecimal(SPERSON),
							CSEXPER, FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2, TAPELLI1, TAPELLI2, CTIPIDE,
							TIDENTI, CESTCIV);
					axisctr100_grabarAseg = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
					request.setAttribute("axisctr100_sexo", axisctr100_grabarAseg);
					logger.debug(axisctr100_grabarAseg);
					if (axisctr100_grabarAseg.intValue() == 0) {
						m = pacIaxValidacion.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS();
						BigDecimal axisctr100_validaAseg = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
					} else {
						this.m_form(request, thisAction);
						String CFORM = "axisctr100"; // getCampoTextual(request, "FORM_ACT");
						request.setAttribute(Constantes.FORWARDACTION,
								AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, "BT_ANADIR"));

						return new BigDecimal(1);
					}
				} else {
					axisctr100_grabarAseg = new BigDecimal(1);
					request.setAttribute("axisctr100_sexo", new BigDecimal(1));
				}
				Map map = new PAC_IAX_VALIDACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
				logger.debug(map);
				this.tratarRETURNyMENSAJES(request, map, false);
			}

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPDIR = getHiddenCampoNumerico(request, "CTIPDIR");
			BigDecimal CSIGLAS = getHiddenCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getHiddenCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getHiddenCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getHiddenCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getHiddenCampoTextual(request, "CPOSTAL");

			BigDecimal CVIAVP = getCampoNumerico(request, "CVIAVP");
			BigDecimal CLITVP = getCampoNumerico(request, "CLITVP");
			BigDecimal CBISVP = getCampoNumerico(request, "CBISVP");
			BigDecimal CORVP = getCampoNumerico(request, "CORVP");
			BigDecimal NVIAADCO = getCampoNumerico(request, "NVIAADCO");
			BigDecimal CLITCO = getCampoNumerico(request, "CLITCO");
			BigDecimal CORCO = getCampoNumerico(request, "CORCO");
			BigDecimal NPLACACO = getCampoNumerico(request, "NPLACACO");
			BigDecimal COR2CO = getCampoNumerico(request, "COR2CO");
			BigDecimal CDET1IA = getCampoNumerico(request, "CDET1IA");
			String TNUM1IA = getCampoTextual(request, "TNUM1IA");
			BigDecimal CDET2IA = getCampoNumerico(request, "CDET2IA");
			String TNUM2IA = getCampoTextual(request, "TNUM2IA");
			BigDecimal CDET3IA = getCampoNumerico(request, "CDET3IA");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TNUM3IA = getCampoTextual(request, "TNUM3IA");

			/*
			 *
			 * TODO de momento se programa para autos en pantalla axisctr061 if
			 * (!isEmpty(SPERSON) && !isEmpty(CPAIS) &&!isEmpty(CPROVIN)
			 * &&!isEmpty(CPOBLAC)){ Map
			 * map=pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION(SPERSON,
			 * CAGENTE, CDOMICI, CTIPDIR, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL,
			 * CPOBLAC, CPROVIN, CPAIS, CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO,
			 * CORCO, NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA, TNUM2IA, CDET3IA,
			 * TNUM3IA);
			 * 
			 * logger.debug(map); }
			 */

			// Borramos el atributo SPERSON - SPERSON2MODIFY
			request.getSession().removeAttribute("SPERSON");
			request.getSession().removeAttribute("SPERSON2MODIFY");

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// if (axisctr100_grabarAseg!=null&&axisctr100_grabarAseg.intValue()==0) {
				// Si todo ha ido OK. Volvemos a recuperar los datos del riesgo
				this.m_form(request, thisAction);
				logger.debug(axisctr100_grabarAseg);
				String CFORM = "axisctr100"; // getCampoTextual(request, "FORM_ACT");
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, "BT_ANADIR"));
				m_grabar_datos_gestion(request, thisAction);
				return new BigDecimal(0);
			} else {
				this.m_form(request, thisAction);
				String CFORM = "axisctr100"; // getCampoTextual(request, "FORM_ACT");
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, "BT_ANADIR"));

				return new BigDecimal(1);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_guardar_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_siguiente(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_siguiente");
		try {
			eliminarAtributosSession(request);
			// Antes de continuar con la emision llamamos a la funcion grabar emision con el
			// parametro recogido
			String RESEMI = getCampoTextual(request, "RESEMI");

			BigDecimal NOGUARDARPREG = getCampoNumerico(request, "NOGUARDARPREG");

			if (isEmpty(NOGUARDARPREG)) {
				// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant
				m_grabar_preguntas(request, thisAction);
			}

			HashMap m2 = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m2);
			request.setAttribute("PLSTAVISOS", m2.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PREG_COND_TOMASEG", SPRODUC);
				logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
				BigDecimal PREG_COND_TOMASEG = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

				if (PREG_COND_TOMASEG.intValue() == 1) {
					BigDecimal ASEGCOND = getCampoNumerico(request, "ASEGCOND");
					BigDecimal TOMCOND = getCampoNumerico(request, "TOMCOND");
					BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

					if (!isEmpty(ASEGCOND) || !isEmpty(TOMCOND)) {

						Map map = new PAC_IAX_PRODUCCION_AUT(
								((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
								.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(
										isEmpty(NRIESGO) ? new BigDecimal(1) : NRIESGO);
						logger.debug(map);
						List<Map> T_IAX_AUTCONDUCTORES = (List<Map>) tratarRETURNyMENSAJES(request, map);
						if (!isEmpty(T_IAX_AUTCONDUCTORES)) {
							BigDecimal SPERSON = (BigDecimal) ((HashMap) ((HashMap) T_IAX_AUTCONDUCTORES.get(0))
									.get("OB_IAX_AUTCONDUCTORES")).get("SPERSON");

							if (!isEmpty(TOMCOND)) {
								m = new PAC_IAX_SIMULACIONES(
										((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
										.ejecutaPAC_IAX_SIMULACIONES__F_INSERTTOMADORES(SPERSON);
								logger.debug(m);
							}

							if (!isEmpty(ASEGCOND)) {
								m = new PAC_IAX_PRODUCCION(
										((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
										.ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(SPERSON, null);
								logger.debug(m);
							}
						}

					}

				}

				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(new BigDecimal(RESEMI), null);
				logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
				tratarRETURNyMENSAJES(request, m, false);
				/// COMPROBAR RETURN=1 ERROR....
				// BUG 9195 ACC 20022009
				try {
					request.getSession().removeAttribute("NRIESGO");
				} catch (Exception e) {

				} // BUG 9195 ACC 20022009
				BigDecimal ret = (BigDecimal) m.get("RETURN");
				if (ret != null && ret.intValue() == 1) {
					// en caso de error en la simulaci�n de la contrataci�n de la poliza, se sigue
					// con modo simulaciones
					AbstractDispatchAction.topPila(request, "CMODO", "SIMULACION");
				} else {
					AbstractDispatchAction.topPila(request, "ACCION_PSU", null); // Accion psu lo quitamos si vamos a
																					// contratar
					request.getSession().removeAttribute("psu_critica");
					AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
				}
				AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal("1"));
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, "Axisctr100", "BT_EMITIR"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_siguiente", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_anterior(HttpServletRequest request, Axisctr100Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("Axisctr100Service m_anterior");
		try {
			this.m_form(request, thisAction);

			// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant
			m_grabar_preguntas(request, thisAction);

			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_siguiente_corr", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	public BigDecimal m_siguiente_corr(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_siguiente_corr");
		try {
			this.m_form(request, thisAction);

			eliminarAtributosSession(request);
			// Antes de continuar con la emision llamamos a la funcion grabar emision con el
			// parametro recogido
			String RESEMI = getCampoTextual(request, "RESEMI");
			BigDecimal CSITUAC = this.getHiddenCampoNumerico(request, "CSITUAC");
			// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant
			m_grabar_preguntas(request, thisAction);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_SIMULACIONES__F_EMISIONSIMULACION(new BigDecimal(RESEMI), CSITUAC);
			logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
			BigDecimal OK = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			if (!isEmpty(OK) && OK.intValue() == 1) {
				return new BigDecimal(1);
			}
			m = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
			logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
			// BUG 9195 ACC 20022009
			try {
				request.getSession().removeAttribute("NRIESGO");
			} catch (Exception e) {

			} // BUG 9195 ACC 20022009

			AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal("1"));
			// request.setAttribute(Constantes.FORWARDACTION,
			// AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, "Axisctr100",
			// "BT_EMITIR"));
			request.getSession().removeAttribute("psu_critica");
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), "BT_SIGUIENTE"));

			return new BigDecimal(0);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_siguiente_corr", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return new BigDecimal(1);
		}

	}

	public BigDecimal m_garantias(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_garantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			eliminarAtributosSession(request);
			//////////// Actualizamos el valor del NRIESGO para la pantalla Axisctr007
			String NRIESGO = getCampoTextual(request, "NRIESGO"); // recogemos el valor seleccionado de riesgo y lo
																	// pasamos a sesion
			// bug 9195 ACC 220209 request.getSession().setAttribute("NRIESGO", NRIESGO);

			AbstractDispatchAction.topPila(request, "NRIESGO", new BigDecimal(NRIESGO)); // bug 9195 ACC 220209

			/////////// Actualizamos el valor de CFORPAF para ir a la pantalla Axisctr007 y
			/////////// lo colocamos en session
			HashMap axisctr_datosGestion = new HashMap();
			axisctr_datosGestion.put("CFORPAG", request.getSession().getAttribute("axisctr100_datosGestion_CFORPAG"));
			request.getSession().setAttribute("axisctr_datosGestion", axisctr_datosGestion);

			// LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n
			String CFORM = getCampoTextual(request, "FORM_ACT");
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, null));
			// LCF
			// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant
			m_grabar_preguntas(request, thisAction);
			Map map = new PAC_IAX_VALIDACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
			logger.debug(map);

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				return (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);
			} else {
				return new BigDecimal(1);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_garantias", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return new BigDecimal(1);
		}

	}

	// funcion que graba las preguntas

	public void m_grabar_preguntas(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_grabar_preguntas");
		try {
			eliminarAtributosSession(request);
			List preguntas = (List) request.getSession().getAttribute("axisctr100_preguntasPoliza");
			logger.debug("preguntas sin merged grabades ::" + preguntas);
			List<HashMap> pregQuestSalut = (List) request.getSession().getAttribute("axisctr100_pregQuestSalut");
			List<HashMap> pregDespeses = (List) request.getSession().getAttribute("axisctr100_pregDespeses");
			if (!isEmpty(pregQuestSalut))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}

			if (!isEmpty(pregDespeses))
				for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses) {
					preguntas.add(OB_IAXPAR_PREGUNTAS);
				}
			logger.debug("preguntas merged grabades ::" + preguntas);
			if (!isEmpty(preguntas)) {
				// Guardar preguntas. La pantalla puede esconder el mutiregistro de
				// preguntas/respuestas.
				// En ese caso, recuperamos las respuestas desde una variable de sesi�n
				if (!isEmpty(request.getSession().getAttribute("axisPreguntas"))) {
					guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA", "axisPreguntas");
					request.getSession().removeAttribute("axisPreguntas");
				} else
					guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_grabar_preguntas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ajax_grabar_preguntas(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_grabar_preguntas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxcontainer = new HashMap();
		HashMap mapa_primas = new HashMap();
		try {
			eliminarAtributosSession(request);
			String NRIESGO = getCampoTextual(request, "NRIESGO");
			List riesgos = (ArrayList) request.getSession().getAttribute("axisctr100_datosRiesgo");

			BigDecimal CPREGUN = this.getCampoNumerico(request, "CPREGUN");
			BigDecimal CRESPUE = this.getCampoNumerico(request, "CRESPUE");
			String TRESPUE = this.getCampoTextual(request, "TRESPUE");
			Map m = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABAPREGUNTASPOLIZA(CPREGUN, CRESPUE, TRESPUE);
			logger.debug(m);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			if (resultado.intValue() == 0) {
				if (!isEmpty(riesgos)) {
					// Borrar datos de la lista de Riesgos
					if (ajaxcontainer.containsValue(riesgos)) {
						ajaxcontainer = quitaObjetoDeLista(riesgos, NRIESGO, "NRIESGO", "OB_IAX_GESTRIESGOS");
					}
					Map map = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
							.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
					List axisctr100_datosRiesgos = (List) tratarRETURNyMENSAJES(request, map, false);
					logger.debug(axisctr100_datosRiesgos);

					riesgos = null;
					ArrayList lista = new ArrayList();
					if (!isEmpty(axisctr100_datosRiesgos)) {
						for (int i = 0; i < axisctr100_datosRiesgos.size(); i++) { //
							Map mapa = (Map) ((Map) axisctr100_datosRiesgos.get(i)).get("OB_IAX_GESTRIESGOS");
							lista.add(i, mapa);
						}
					}
					ajaxcontainer.put("LISTA", lista);
				}

				mapa_primas = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
				// List lista_primas = (List)tratarRETURNyMENSAJES(request,map);
				logger.debug("mapa_primas-->" + mapa_primas);
				ajaxcontainer.putAll(mapa_primas);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_grabar_preguntas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
		}

	}

	public void m_ajax_abrir_riesgo(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_abrir_riesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		HashMap mapa_primas = new HashMap();
		try {
			eliminarAtributosSession(request);
			String SPERSON2MODIFY = getCampoTextual(request, "SPERSON2MODIFY");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			String CMODOASEGU = CMODO;
			// String CFORM=(String )AbstractDispatchAction.topPila(request).get("CFORM");
			String CFORM = "axisctr100";

			// String CAMPO="BT_RIESGO";
			String CAMPO = getCampoTextual(request, "CAMPO");

			BigDecimal CFG_ALTA_ASEGU = getCampoNumerico(request, "CFG_ALTA_ASEGU");
			String BT_BOTON = getCampoTextual(request, "BT_BOTON");
			formdata.put("CFG_ALTA_ASEGU", CFG_ALTA_ASEGU);
			if (CFG_ALTA_ASEGU != null && CFG_ALTA_ASEGU.intValue() == 1 && BT_BOTON.equals("ASEGURADO")) {
				CMODOASEGU = "ALTA_ASEG_SIMUL";
			}
			request.getSession().setAttribute("CMODOASEGU", CMODOASEGU);
			PAC_IAX_CFG pAC_IAX_CFG = new PAC_IAX_CFG(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m1 = pAC_IAX_CFG.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, CFORM, CAMPO,
					Constantes.SIGUIENTE);
			logger.debug(m1);
			String RETURN = String.valueOf(m1.get("RETURN"));
			String formRumbo = "";
			HashMap orden;

			// 0026223 RSAG101 - Producto RC Argentina. Simulaci�n)

			PAC_IAX_PARAM param = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("ORDEN_DATOS_VEHICULO", usuario.getCempres());

			if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {

				request.getSession().setAttribute("Mostrar", 1);

			} else {

				request.getSession().setAttribute("Mostrar", 0);

			}

			if (!isEmpty(RETURN)) {
				File fichero = new File(Constantes.REALPATH + "/WEB-INF/jsp/axis/"
						+ ((String) m1.get("RETURN")).toLowerCase() + ".jsp"); // ecg20110914 AXIS-WLS1SERVER . new
																				// File's con lowercases

				if (!fichero.exists()) {
					fichero = new File(Constantes.REALPATH + "/WEB-INF/jsp/modal/"
							+ ((String) m1.get("RETURN")).toLowerCase() + ".jsp"); // ecg20110914 AXIS-WLS1SERVER . new
																					// File's con lowercases
					if (fichero.exists())
						formRumbo = "modal_" + ((String) m1.get("RETURN")).toLowerCase() + ".do"
								+ "?operation=init&NRIESGO=" + NRIESGO + "&SPERSON2MODIFY=" + SPERSON2MODIFY;

				} else
					formRumbo = "axis_" + ((String) m1.get("RETURN")).toLowerCase() + ".do" + "?operation=init&NRIESGO="
							+ NRIESGO + "&SPERSON2MODIFY=" + SPERSON2MODIFY;

				if (fichero.exists()) {
					m1.put("saltar_modal", formRumbo);
					m1.put("form", ((String) m1.get("RETURN")).toLowerCase());
				}

			}
			ajax.rellenarPlAContenedorAjax(m1);
			ajax.guardarContenidoFinalAContenedorAjax(m1);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_abrir_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}
	// funcion que graba los datos gestion

	public void m_grabar_datos_gestion(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_grabar_datos_gestion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			eliminarAtributosSession(request);

			BigDecimal INTTEC = getHiddenCampoNumerico(request, "INTTEC");
			Date FPPREN = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FPPREN"));

			String fefecto = getHiddenCampoTextual(request, "FEFECTO");
			String fvencim = getHiddenCampoTextual(request, "FVENCIM");
			Date FEFECTO = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"), "dd/MM/yyyy");
			BigDecimal CDURACI = getHiddenCampoNumerico(request, "CDURACI");
			BigDecimal CRECFRA = getHiddenCampoNumerico(request, "CRECFRA");
			BigDecimal NDURCOB = getHiddenCampoNumerico(request, "NDURCOB");
			BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");
			BigDecimal CCOMPANI = getHiddenCampoNumerico(request, "CCOMPANI");
			logger.debug(NDURCOB);
			// ********ETM BUG 21924
			BigDecimal PDTOCOM = getHiddenCampoNumerico(request, "PDTOCOM");
			BigDecimal CTIPRETR = getHiddenCampoNumerico(request, "CTIPRETR");
			BigDecimal CINDREVFRAN = getHiddenCampoNumerico(request, "CINDREVFRAN");
			BigDecimal PRECARG = getHiddenCampoNumerico(request, "PRECARG");
			BigDecimal PDTOTEC = getHiddenCampoNumerico(request, "PDTOTEC");
			BigDecimal PRECCOM = getHiddenCampoNumerico(request, "PRECCOM");
			logger.debug(PRECARG);

			if (isEmpty(NDURCOB))
				NDURCOB = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("NDURCOB");
			if (isEmpty(CDURACI))
				// Si no es modificable, pillar el valor original
				CDURACI = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CDURACI");

			BigDecimal NDURACI = getHiddenCampoNumerico(request, "NDURACI");
			if (isEmpty(NDURACI))
				NDURACI = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("DURACION");

			BigDecimal NEDAMAR = getHiddenCampoNumerico(request, "NEDAMAR");
			if (isEmpty(NEDAMAR))
				// Si no es modificable, pillar el valor original
				NEDAMAR = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("NEDAMAR");

			NEDAMAR = isEmpty(NEDAMAR) ? getHiddenCampoNumerico(request, "NEDAMAR") : NEDAMAR;

			Date FVENCIM = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FVENCIM"), "dd/MM/yyyy");

			BigDecimal CFORPAG = getHiddenCampoNumerico(request, "CFORPAG");
			if (isEmpty(CFORPAG))
				// Si no es modificable, pillar el valor original
				CFORPAG = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CFORPAG");

			BigDecimal PCAPFALL = getCampoNumerico(request, "PCAPFALL");
			BigDecimal PDOSCAB = getCampoNumerico(request, "PDOSCAB");
			BigDecimal CFORPAGREN = getCampoNumerico(request, "CFORPAGREN");
			BigDecimal NDURPER = getCampoNumerico(request, "NDURPER");

			if (isEmpty(NDURPER))
				// Si no es modificable, pillar el valor original
				NDURPER = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("NDURPER");

			if (isEmpty(PCAPFALL))
				// Si no es modificable, pillar el valor original
				PCAPFALL = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("PCAPFALL");

			if (isEmpty(PDOSCAB))
				// Si no es modificable, pillar el valor original
				PDOSCAB = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("PDOSCAB");

			if (isEmpty(CFORPAGREN))
				// Si no es modificable, pillar el valor original
				CFORPAGREN = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CFORPAGREN");

			if (isEmpty(CCOMPANI)) {
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map_aux = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DETPOLIZA();
				logger.debug("map_aux-->" + map_aux);
				Map datosGestion_aux = (Map) tratarRETURNyMENSAJES(request, map_aux);
				if (datosGestion_aux != null) {
					CCOMPANI = (BigDecimal) datosGestion_aux.get("CCOMPANI");
				}
			}

			/* Poner datos en sesi�n */
			request.getSession().setAttribute("axisctr100_datosGestion_CFORPAG", CFORPAG);
			request.getSession().setAttribute("axisctr100_datosGestion_FEFECTO", fefecto);
			request.getSession().setAttribute("axisctr100_datosGestion_FVENCIM", fvencim);
			request.getSession().setAttribute("axisctr100_datosGestion_CDURACI", CDURACI);
			request.getSession().setAttribute("axisctr100_datosGestion_NDURACI", NDURACI);
			request.getSession().setAttribute("axisctr100_datosGestion_CRECFRA", CRECFRA);
			// ********ETM BUG 21924

			request.getSession().setAttribute("axisctr100_datosGestion_PDTOCOM", PDTOCOM);
			request.getSession().setAttribute("axisctr100_datosGestion_CTIPRETR", CTIPRETR);
			request.getSession().setAttribute("axisctr100_datosGestion_CINDREVFRAN", CINDREVFRAN);
			request.getSession().setAttribute("axisctr100_datosGestion_PRECARG", PRECARG);
			request.getSession().setAttribute("axisctr100_datosGestion_PDTOTEC", PDTOTEC);
			request.getSession().setAttribute("axisctr100_datosGestion_PRECCOM", PRECCOM);

			request.getSession().setAttribute("axisctr100_datosGestion_NEDAMAR", NEDAMAR);

			BigDecimal CMONPOL = getHiddenCampoNumerico(request, "CMONPOL");

			BigDecimal CDOMPER = getHiddenCampoNumerico(request, "CDOMPER");

			Date FRENOVA = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FRENOVA"), "dd/MM/yyyy");

			// BUG 41143/229973 - 17/03/2016 - JAEG
			Date FEFEPLAZO = stringToSqlDate(getCampoTextual(request, "FEFEPLAZO"));
			Date FVENCPLAZO = stringToSqlDate(getCampoTextual(request, "FVENCPLAZO"));

			request.getSession().setAttribute("axisctr100_datosGestion_FEFEPLAZO", FEFEPLAZO);
			request.getSession().setAttribute("axisctr100_datosGestion_FVENCPLAZO", FVENCPLAZO);
			// BUG 41143/229973 - 17/03/2016 - JAEG

			BigDecimal CTIPCOM = getHiddenCampoNumerico(request, "CTIPCOM");
			/* Grabar Datos Gesti�n */
			// bug 20761: afegir ncuotar
			// bug 24685 2013-02-12 AEG Preimpresos se agrgan tres parametros nulos a la
			// llamada
			// BUG 41143/229973 - 17/03/2016 - JAEG (FEFEPLAZO - FVENCPLAZO)
			Map grabarDatosGestion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(FEFECTO, CDURACI, NDURACI, FVENCIM, CFORPAG, null,
							null, CTIPCOM, PDTOCOM, CIDIOMA, null, null, null, null, NDURPER, PCAPFALL, PDOSCAB,
							CFORPAGREN, NDURCOB, CRECFRA, null, INTTEC, FPPREN, null, null, null, CCOMPANI, null, null,
							null, null, CMONPOL, CTIPRETR, CINDREVFRAN, PRECARG, PDTOTEC, PRECCOM, null, FRENOVA, null,
							null, null, NEDAMAR, null, null, null, null, null, FEFEPLAZO, FVENCPLAZO, null);

			// fin bug 24685 2013-02-12 AEG Preimpresos se agrgan tres parametros nulos a la
			// llamada
			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(grabarDatosGestion));
			logger.debug(grabarDatosGestion);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_grabar_datos_gestion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// funci�n para borrar registro de la lista de asegurados

	public void m_ajax_borrar_aseg(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_borrar_aseg");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = new HashMap();
		HashMap mapa_primas = new HashMap();
		Map ajaxcontainer = new HashMap();
		try {
			eliminarAtributosSession(request);
			logger.debug("request.getSession().getAttribute(\"axisctr100_datosRiesgo\")"
					+ request.getSession().getAttribute("axisctr100_datosRiesgo"));
			if (request.getSession().getAttribute("axisctr100_datosRiesgo") != null) {
				String SPERSON = getCampoTextual(request, "SPERSONID");
				List asegurados = (ArrayList) request.getSession().getAttribute("axisctr100_datosRiesgo");
				logger.debug("asegurados " + asegurados);
				// Borrar de BD
				BigDecimal validaEliminarDB = this.dbEliminaAseg(request, thisAction, new BigDecimal(SPERSON));
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

				if (validaEliminarDB.equals(new BigDecimal(0))) {
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();

					// Cargar datos Riesgos //
					List axisctr100_datosRiesgo = (List) tratarRETURNyMENSAJES(request, map, false);
					logger.debug("axisctr100_datosRiesgo-->" + axisctr100_datosRiesgo);
					request.getSession().setAttribute("axisctr100_datosRiesgo", axisctr100_datosRiesgo);
					ajaxcontainer.put("axisctr100_datosRiesgo", axisctr100_datosRiesgo);
					logger.debug(axisctr100_datosRiesgo);
					axisctr100_datosRiesgo = null;

					mapa_primas = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
					// List lista_primas = (List)tratarRETURNyMENSAJES(request,map);
					ajaxcontainer.putAll(mapa_primas);
				}
			}
		}

		catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_borrar_aseg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
		}
	}

	// funci�n para borrar registro de la lista de riesgos

	public void m_ajax_borrar_riesgo(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_borrar_riesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap map = new HashMap();
		HashMap mapa_primas = new HashMap();
		Map ajaxcontainer = new HashMap();
		try {
			eliminarAtributosSession(request);
			if (request.getSession().getAttribute("axisctr100_datosRiesgo") != null) {
				String NRIESGO = getCampoTextual(request, "NRIESGO");
				List riesgos = (ArrayList) request.getSession().getAttribute("axisctr100_datosRiesgo");
				// Borrar de BD
				BigDecimal validaEliminarDB = this.dbEliminaRiesgo(request, thisAction, NRIESGO);

				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));

				if (validaEliminarDB.equals(new BigDecimal(0))) {
					// Borrar datos de la lista de Riesgos
					quitaObjetoDeLista(riesgos, NRIESGO, "NRIESGO", "OB_IAX_GESTRIESGOS");
					map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
					// Cargar datos Riesgos //

					List axisctr100_datosRiesgos = (List) tratarRETURNyMENSAJES(request, map, false);
					request.getSession().setAttribute("axisctr100_datosRiesgo", axisctr100_datosRiesgos);
					ajaxcontainer.put("riesgos", axisctr100_datosRiesgos);
					logger.debug(axisctr100_datosRiesgos);
					riesgos = null;

					mapa_primas = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
					// List lista_primas = (List)tratarRETURNyMENSAJES(request,map);
					ajaxcontainer.putAll(mapa_primas);

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_borrar_riesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
		}
	}

	public void m_ajax_continuar_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			Map m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM();
			String mensaje = (String) this.tratarRETURNyMENSAJES(request, m);

			/*
			 * if (!isEmpty(mensaje)){
			 * 
			 * 
			 * }else{ ArrayList preguntas = new ArrayList();
			 * 
			 * if (!isEmpty( m.get("preguntas"))){ preguntas =
			 * (ArrayList)m.get("preguntas");
			 * 
			 * 
			 * 
			 * 
			 * }
			 * 
			 * }
			 */

			miDataObject.put("resultado", m);
			miDataObject.put("texto", this.tratarRETURNyMENSAJES(request, m));
			if (!isEmpty(m.get("preguntas")))
				miDataObject.put("preguntas", m.get("preguntas"));
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr061Service - m�todo m_ajax_continuar_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*
	 * Funci�n que llama a la func�n F_GET_PREGASEGESTOM Antes de continuar con la
	 * emisi�n de la p�liza
	 **/

	public void m_ajax_continuar(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_continuar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			eliminarAtributosSession(request);
			Map m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_SIMULACIONES__F_GET_PREGASGESTOM();
			logger.debug("Map de p�reguntas riesgo----------------------------------------" + m);

			// TODO: REvisar chapuza y substituir pos mensaje correcto ajax.

			if (isEmpty(m.get("MENSAJES"))) {
				ajaxcontainer.put("ERROR", "0");
				ajaxcontainer.put("smserror", "");

			} else {

				///////// cogemos el primer mensaje de error //////
				List MENSAJES = (List) m.get("MENSAJES");

				HashMap mensaje = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
				BigDecimal TIPERROR = (BigDecimal) OB_IAX_MENSAJES.get("TIPERROR");
				BigDecimal CERROR = (BigDecimal) OB_IAX_MENSAJES.get("CERROR");
				String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");

				ajaxcontainer.put("ERROR", "1");
				ajaxcontainer.put("smserror", TERROR);
			}

			String pregunta = (String) tratarRETURNyMENSAJES(request, m, false);
			if (pregunta != null) {
				ajaxcontainer.put("texto", pregunta);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_continuar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
		}
	}

	// Funciones de actualizaci�n BBDD

	public BigDecimal dbEliminaRiesgo(HttpServletRequest request, Axisctr100Action thisAction, String NRIESGO) {
		logger.debug("Axisctr100Service dbEliminaRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			eliminarAtributosSession(request);

			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Eliminar Riesgo de la BBDD //
			m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_ELIMINARIESGO(new BigDecimal(NRIESGO));
			BigDecimal axisctr100_eliminaRiesgo = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			logger.debug(axisctr100_eliminaRiesgo);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return axisctr100_eliminaRiesgo;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo dbEliminaRiesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return new BigDecimal(1);
		}

	}

	/**
	 * Elimina el asegurado seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	public BigDecimal dbEliminaAseg(HttpServletRequest request, Axisctr100Action thisAction, BigDecimal SPERSON) {
		logger.debug("Axisctr100Service dbEliminaRiesgo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			eliminarAtributosSession(request);

			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Eliminar Riesgo de la BBDD //
			m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_ELIMINAASEG(SPERSON);
			BigDecimal axisctr100_eliminaAseg = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			logger.debug(axisctr100_eliminaAseg);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return axisctr100_eliminaAseg;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo dbEliminaRiesgo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			return new BigDecimal(1);
		}

	}

	public void m_guardar_simulacion(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_guardar_simulacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			HashMap m = null;
			////////// grabar
			////////// datos//////////////////////////////////////////////////////////////
			// xpl 11091ahora se grabaran las preguntas por ajax para poder gestionar cuando
			////////// se tenga que tarificar
			// o no dependiendo del ctarpol (bbdd).
			// m_grabar_preguntas(request, thisAction);
			// m_grabar_datos_gestion(request,thisAction);
			////////////////////////////////////////////////////////////////////////////////////
			eliminarAtributosSession(request);
			BigDecimal okPSU = new BigDecimal(0);
			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO"))) {
				Map mx = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_SIMULACIONES__F_INICIA_PSU("EST",
								(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"), new BigDecimal(6),
								"BT_GUARDAR");
				logger.debug("PSU---------------------------------------->" + mx);
				okPSU = (BigDecimal) tratarRETURNyMENSAJES(request, mx, false);
			}
			if (okPSU.intValue() == 0) {

				/////////////// validar datos simulaci�n
				/////////////// ////////////////////////////////////////////

				PAC_IAX_SIMULACIONES pacIaxSimValida = new PAC_IAX_SIMULACIONES(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
				m = pacIaxSimValida.ejecutaPAC_IAX_SIMULACIONES__F_VALIDACIONES("GUARDAR_SIMULACION");
				logger.debug(m);
				BigDecimal axisctr100_validaSim = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
				////////////////////////////////////////////////////////////////////////////////////

				PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
						((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
				HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
				BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
				request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

				if (pRETURN != null && pRETURN.intValue() != 1) {
					if (axisctr100_validaSim.intValue() == 0) {
						// Guardamos el resultado de la simulacion //
						m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GRABARSIMULACION();
						logger.debug(m);
						BigDecimal axisctr100_datosGrabar = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
						logger.debug(axisctr100_datosGrabar);
						boolean GRABAR_SIM = axisctr100_datosGrabar.equals(new BigDecimal(0));

						if (GRABAR_SIM) {
							request.getSession().setAttribute("simuOK", "OK");
						} else {
							request.getSession().setAttribute("simuOK", "KO");
						}

					} else
						request.getSession().setAttribute("simuOK", "KO");

				} else
					request.getSession().setAttribute("simuOK", "KO");
			} else
				request.getSession().setAttribute("simuOK", "KO");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_guardar_simulacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_imprimir(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			eliminarAtributosSession(request);
			// Implementar impresion pantalla
			BigDecimal okPSU = new BigDecimal(0);
			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO"))) {
				Map mx = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_SIMULACIONES__F_INICIA_PSU("EST",
								(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"), new BigDecimal(6),
								" BT_IMPRIMIR");
				logger.debug("PSU---------------------------------------->" + mx);
				okPSU = (BigDecimal) tratarRETURNyMENSAJES(request, mx, false);
			}
			if (okPSU.intValue() == 0) {
				HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
				BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
				request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

				if (pRETURN != null && pRETURN.intValue() != 1) {

					PAC_IAX_SIMULACIONES pacIaxSimValida = new PAC_IAX_SIMULACIONES(
							((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
					Map m = pacIaxSimValida.ejecutaPAC_IAX_SIMULACIONES__F_VALIDACIONES("IMPRIMIR_SIMULACION");
					logger.debug(m);
					BigDecimal axisctr100_validaSim = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
					////////////////////////////////////////////////////////////////////////////////////

					if (axisctr100_validaSim.intValue() == 0) {
						request.setAttribute("OK_IMP", "OK");
					}
				} else {
					request.setAttribute("OK_IMP", "KO");
				}

			} else {
				request.setAttribute("OK_IMP", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_imprimir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ajax_grabar_datos(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_grabar_datos");
		try {
			eliminarAtributosSession(request);
			m_grabar_datos_gestion(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_grabar_datos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ajax_grabar_datos_fp(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_ajax_grabar_datos_fp");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map ajaxcontainer = new HashMap();
		HashMap map = new HashMap();
		HashMap mapa_primas = new HashMap();

		try {
			eliminarAtributosSession(request);

			BigDecimal INTTEC = getHiddenCampoNumerico(request, "INTTEC");
			Date FPPREN = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FPPREN"));

			String fefecto = getHiddenCampoTextual(request, "FEFECTO");
			String fvencim = getHiddenCampoTextual(request, "FVENCIM");
			Date FEFECTO = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FEFECTO"), "dd/MM/yyyy");
			BigDecimal CDURACI = getHiddenCampoNumerico(request, "CDURACI");
			BigDecimal NDURCOB = getHiddenCampoNumerico(request, "NDURCOB");
			logger.debug(NDURCOB);
			if (isEmpty(NDURCOB))
				NDURCOB = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("NDURCOB");
			if (isEmpty(CDURACI))
				// Si no es modificable, pillar el valor original
				CDURACI = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CDURACI");

			BigDecimal NDURACI = getHiddenCampoNumerico(request, "NDURACI");
			if (isEmpty(NDURACI))
				NDURACI = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("DURACION");

			BigDecimal NEDAMAR = getHiddenCampoNumerico(request, "NEDAMAR");

			Date FVENCIM = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FVENCIM"), "dd/MM/yyyy");

			BigDecimal CFORPAG = getHiddenCampoNumerico(request, "CFORPAG");
			BigDecimal CIDIOMA = getHiddenCampoNumerico(request, "CIDIOMA");
			BigDecimal CRECFRA = getHiddenCampoNumerico(request, "CRECFRA");
			// ********ETM BUG 21924
			BigDecimal PDTOCOM = getHiddenCampoNumerico(request, "PDTOCOM");
			BigDecimal CTIPRETR = getHiddenCampoNumerico(request, "CTIPRETR");
			BigDecimal CINDREVFRAN = getHiddenCampoNumerico(request, "CINDREVFRAN");
			BigDecimal PRECARG = getHiddenCampoNumerico(request, "PRECARG");
			BigDecimal PDTOTEC = getHiddenCampoNumerico(request, "PDTOTEC");
			BigDecimal PRECCOM = getHiddenCampoNumerico(request, "PRECCOM");
			if (isEmpty(CFORPAG))
				// Si no es modificable, pillar el valor original
				CFORPAG = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CFORPAG");

			BigDecimal PCAPFALL = getCampoNumerico(request, "PCAPFALL");
			BigDecimal PDOSCAB = getCampoNumerico(request, "PDOSCAB");
			BigDecimal CFORPAGREN = getCampoNumerico(request, "CFORPAGREN");
			BigDecimal NDURPER = getCampoNumerico(request, "NDURPER");
			BigDecimal CCOMPANI = getHiddenCampoNumerico(request, "CCOMPANI");

			if (isEmpty(NDURPER))
				// Si no es modificable, pillar el valor original
				NDURPER = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("NDURPER");

			if (isEmpty(PCAPFALL))
				// Si no es modificable, pillar el valor original
				PCAPFALL = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("PCAPFALL");

			if (isEmpty(PDOSCAB))
				// Si no es modificable, pillar el valor original
				PDOSCAB = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("PDOSCAB");

			if (isEmpty(CFORPAGREN))
				// Si no es modificable, pillar el valor original
				CFORPAGREN = (BigDecimal) ((Map) request.getSession().getAttribute("axisctr100_datosGestion"))
						.get("CFORPAGREN");

			/* Poner datos en sesi�n */
			request.getSession().setAttribute("axisctr100_datosGestion_CFORPAG", CFORPAG);
			request.getSession().setAttribute("axisctr100_datosGestion_FEFECTO", fefecto);
			request.getSession().setAttribute("axisctr100_datosGestion_FVENCIM", fvencim);
			request.getSession().setAttribute("axisctr100_datosGestion_CDURACI", CDURACI);
			request.getSession().setAttribute("axisctr100_datosGestion_NDURACI", NDURACI);
			request.getSession().setAttribute("axisctr100_datosGestion_CRECFRA", CRECFRA);
			// ********ETM BUG 21924
			request.getSession().setAttribute("axisctr100_datosGestion_PDTOCOM", PDTOCOM);
			request.getSession().setAttribute("axisctr100_datosGestion_CTIPRETR", CTIPRETR);
			request.getSession().setAttribute("axisctr100_datosGestion_CINDREVFRAN", CINDREVFRAN);
			request.getSession().setAttribute("axisctr100_datosGestion_PRECARG", PRECARG);
			request.getSession().setAttribute("axisctr100_datosGestion_PDTOTEC", PDTOTEC);
			request.getSession().setAttribute("axisctr100_datosGestion_PRECCOM", PRECCOM);
			request.getSession().setAttribute("axisctr100_datosGestion_NEDAMAR", NEDAMAR);
			/* Grabar Datos Gesti�n */
			String NRIESGO = getCampoTextual(request, "NRIESGO");
			List riesgos = (ArrayList) request.getSession().getAttribute("axisctr100_datosRiesgo");

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			BigDecimal CMONPOL = getHiddenCampoNumerico(request, "CMONPOL");

			Date FRENOVA = AxisBaseService.stringToSqlDate(getHiddenCampoTextual(request, "FRENOVA"), "dd/MM/yyyy");
			BigDecimal CTIPCOM = getHiddenCampoNumerico(request, "CTIPCOM");
			// bug 20761: afegir ncuotar

			// BUG 41143/229973 - 17/03/2016 - JAEG
			Date FEFEPLAZO = stringToSqlDate(getHiddenCampoTextual(request, "FEFEPLAZO"));
			Date FVENCPLAZO = stringToSqlDate(getHiddenCampoTextual(request, "FVENCPLAZO"));

			request.getSession().setAttribute("axisctr100_datosGestion_FEFEPLAZO", FEFEPLAZO);
			request.getSession().setAttribute("axisctr100_datosGestion_FVENCPLAZO", FVENCPLAZO);
			// BUG 41143/229973 - 17/03/2016 - JAEG

			// BUG 41143/229973 - 17/03/2016 - JAEG (FEFEPLAZO - FVENCPLAZO)
			// bug 24685 2013-02-12 AEG Preimpresos se agrgan tres parametros nulos a la
			// llamada
			Map grabarDatosGestion = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDATOSGESTION(FEFECTO, CDURACI,
					NDURACI, FVENCIM, CFORPAG, null, null, CTIPCOM, PDTOCOM, CIDIOMA, null, null, null, null, NDURPER,
					PCAPFALL, PDOSCAB, CFORPAGREN, NDURCOB, CRECFRA, null, INTTEC, FPPREN, null, null, null, CCOMPANI,
					null, null, null, null, CMONPOL, CTIPRETR, CINDREVFRAN, PRECARG, PDTOTEC, PRECCOM, null, FRENOVA,
					null, null, null, NEDAMAR, null, null, null, null, null, FEFEPLAZO, FVENCPLAZO, null);
			// bug fin24685 2013-02-12 AEG Preimpresos se agrgan tres parametros nulos a la
			// llamada

			logger.debug(grabarDatosGestion);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, grabarDatosGestion, false);

			if (resultado.intValue() == 0) {
				// Borrar datos de la lista de Riesgos
				if (ajaxcontainer.containsValue(riesgos)) {
					ajaxcontainer = quitaObjetoDeLista(riesgos, NRIESGO, "NRIESGO", "OB_IAX_GESTRIESGOS");
				}
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();
				List axisctr100_datosRiesgos = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(axisctr100_datosRiesgos);
				riesgos = null;
				ArrayList lista = new ArrayList();
				for (int i = 0; i < axisctr100_datosRiesgos.size(); i++) { //
					Map mapa = (Map) ((Map) axisctr100_datosRiesgos.get(i)).get("OB_IAX_GESTRIESGOS");
					lista.add(i, mapa);
				}
				ajaxcontainer.put("LISTA", lista);

				mapa_primas = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASPOLIZA();
				// List lista_primas = (List)tratarRETURNyMENSAJES(request,map);
				ajaxcontainer.putAll(mapa_primas);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_grabar_datos_fp", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajaxcontainer);
		}

	}

	public void m_actualiza_persona(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			eliminarAtributosSession(request);
			// carga los valores si los hay de la persona seleccionada en Axisper001
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Obtener los datos de la persona

			String SPERSON = (String) request.getSession().getAttribute("SPERSON");
			String SPERSON_antiguo = (String) request.getSession().getAttribute("SPERSON2MODIFY");

			// Cambia Persona
			// Codigo delAsegurado Antiguo, Codigo del Nuevo Asegurado, "A".
			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(new BigDecimal(SPERSON_antiguo),
					new BigDecimal(SPERSON), "A");

			BigDecimal resultado_insert = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			logger.debug(resultado_insert);

			// Boramos tanto el SPERSON como el SPERSON2MODIFY de SESSION
			request.getSession().removeAttribute("SPERSON");
			request.getSession().removeAttribute("SPERSON2MODIFY");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_actualiza_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void initPreguntas(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		List preguntas = this.dbGetDatosPreguntas(request, usuario);
		List respuestas = this.dbLeePreguntasPoliza(request, usuario);

		/* Combinar preguntas con respuestas usuario */
		inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");
		logger.debug(
				"GUARDAMOS RESPUESTAS EN SESSION PORQUE PODEMOS TENER DESACTIVO EL MULTIREGISTRO PREGUNTAS/RESPUESTAS: "
						+ request.getSession().getAttribute("axisPreguntas"));

		logger.debug("Preguntas/Respuestas despu�s del merge -> " + preguntas);

		List pregQuestSalut = null;
		List pregDespeses = null;
		if (!isEmpty(preguntas)) {
			pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);

			pregDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);

		}

		// Guardar lista de preguntas para mostrarla en la pantalla mediante un
		// DisplayTag
		// es guarden els diferents grups de preguntes
		request.getSession().setAttribute("axisctr100_pregQuestSalut",
				((pregQuestSalut == null) ? new ArrayList() : pregQuestSalut));
		request.getSession().setAttribute("axisctr100_pregDespeses",
				((pregDespeses == null) ? new ArrayList() : pregDespeses));
		request.getSession().setAttribute("axisctr100_preguntasPoliza",
				((preguntas == null) ? new ArrayList() : preguntas));

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAXPAR_PREGUNTAS);
				objBorrar.add(OB_IAXPAR_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAXPAR_PREGUNTAS);
		}

		for (HashMap OB_IAXPAR_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAXPAR_PREGUNTAS);
		}

		return pregdividides;

	}

	////////////////////////////////////////////

	private List dbGetDatosPreguntas(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PREGPOLIZA();
		logger.debug("Map de Datos/Riesgos---------------------------------------->" + m);
		List preguntas = (List) tratarRETURNyMENSAJES(request, m, false);

		return preguntas;
	}

	private List dbLeePreguntasPoliza(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA();
		logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
		List respuestas = (List) tratarRETURNyMENSAJES(request, m, false);

		return respuestas;
	}

	public void m_formula(HttpServletRequest request, Axisctr100Action thisAction) {
		try {
			/* validaci�n de la grabaci�n de datos de la simulaci�n */
			eliminarAtributosSession(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_formula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_cerrar_asegurado(HttpServletRequest request, Axisctr100Action thisAction) {
		try {
			/* validaci�n de la grabaci�n de datos de la simulaci�n */
			request.getSession().removeAttribute("SPERSON");
			request.getSession().removeAttribute("SPERSON2MODIFY");
			request.getSession().setAttribute("CMODOASEGU", "SIMULACION");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_cerrar_asegurado", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Actualiza el campo de vencimiento y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_actualiza_fvencim(HttpServletRequest request) {
		logger.debug("Axisctr100Service m_ajax_actualiza_fvencim");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			eliminarAtributosSession(request);
			BigDecimal NDURACI = new BigDecimal(String.valueOf(request.getParameter("NDURACI")));
			BigDecimal CDURACI = getCampoNumerico(request, "CDURACI");
			Date FEFECTO = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FEFECTO"), "dd/MM/yyyy");
			Map map = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI(FEFECTO, NDURACI, CDURACI);
			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_SET_NDURACI()" + map);

			// Bug 23117 - RSC - 13/08/2012
			Map map3 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_FRENOVA(FEFECTO, CDURACI);
			map.putAll(map3);
			// Fin Bug 23117

			if (!isEmpty(map)) {
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_actualiza_fvencim", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Actualiza el campo de vencimiento y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_guardarActivitat(HttpServletRequest request) {
		logger.debug("Axisctr100Service m_ajax_guardarActivitat");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			request.getSession().setAttribute("CACTIVI", CACTIVI);
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_ACTIVIDAD(CACTIVI);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(map)) {
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_guardarActivitat", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public BigDecimal m_buscar_datos_persona(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_buscar_datos_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = true;
		try {
			eliminarAtributosSession(request);
			// carga los valores de los combos
			// m_cargar_valores(request,thisAction);
			// carga los valores si los hay de la persona seleccionada en Axisper001
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Obtener los datos de la persona
			String SPERSON = getCampoTextual(request, "SPERSON");
			request.getSession().setAttribute("SPERSON", SPERSON);
			request.getSession().setAttribute("SPERSON2MODIFY", SPERSON);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(new BigDecimal(SPERSON), null);

			BigDecimal resultado_insert = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			logger.debug(resultado_insert);

			if (resultado_insert.intValue() == 0) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(new BigDecimal(SPERSON));

				Map axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m, false);
				request.setAttribute("axisctr101_datosPersona", axisctr101_datosPersona);
				request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson + ""); // Se ha
																										// seleccionado
																										// una persona
				logger.debug(axisctr101_datosPersona);
			} else
				request.getSession().removeAttribute("SPERSON2MODIFY");
			this.m_form(request, thisAction);
			String CFORM = "axisctr100"; // getCampoTextual(request, "FORM_ACT");
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, "BT_ANADIR"));
			m_grabar_datos_gestion(request, thisAction);
			Map map = new PAC_IAX_VALIDACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
			logger.debug(map);
			return (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_buscar_datos_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal m_modificar_datos_persona(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_modificar_datos_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		boolean selectedPerson = true;
		try {
			eliminarAtributosSession(request);
			// carga los valores si los hay de la persona seleccionada en Axisper001
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			// Obtener los datos de la persona
			String SPERSON = getCampoTextual(request, "SPERSON");
			String SPERSON2MODIFY = getCampoTextual(request, "SPERSON2MODIFY");
			String SPERSONAUX = (String) request.getSession().getAttribute("SPERSON2MODIFY");

			request.getSession().setAttribute("SPERSON", SPERSON);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(new BigDecimal(SPERSON2MODIFY),
					new BigDecimal(SPERSON), "A");

			BigDecimal resultado_insert = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
			logger.debug(resultado_insert);

			if (resultado_insert.intValue() == 0 || SPERSON.equals(SPERSON2MODIFY)) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(new BigDecimal(SPERSON));

				Map axisctr101_datosPersona = (Map) tratarRETURNyMENSAJES(request, m, false);
				request.setAttribute("axisctr101_datosPersona", axisctr101_datosPersona);
				request.getSession().setAttribute("axisctr100_selectedPerson", selectedPerson + ""); // Se ha
																										// seleccionado
																										// una persona
				////////////////
				request.getSession().setAttribute("SPERSON2MODIFY", SPERSON);
				////////////////
				logger.debug(axisctr101_datosPersona);
			} else {
				request.getSession().removeAttribute("SPERSON2MODIFY");
			}

			String CFORM = "axisctr100"; // getCampoTextual(request, "FORM_ACT");
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, "BT_ANADIR"));
			m_grabar_datos_gestion(request, thisAction);
			Map map = new PAC_IAX_VALIDACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSGSTPREGPOL();
			logger.debug(map);
			return (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_modificar_datos_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar el numero de
	 * lineas que deben mostrarse en la tabla garantias
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @return
	 * @throws Exception
	 */
	private BigDecimal obtiene_filas(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("NUM_GARAN_PANT", SPRODUC);
		logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
	}

	private List dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("LISTA DE TOMADORES BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Borra un tomador pasado por SPERSON de la lista de personas de sesi�n.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_delete_tomador(HttpServletRequest request) {
		logger.debug("Axisctr010Service m_ajax_delete_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			List listaTomadores = this.dbLeeTomadores(request, usuario);
			// Borrar de BD
			Map eliminaTomador = this.dbEliminaTomador(request, usuario, SPERSON);
			BigDecimal eliminaTomadorReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaTomador);
			if (eliminaTomadorReturn.equals(new BigDecimal(0))) {
				// Borrar de la lista de sesi�n
				ajax.setAjaxContainer(
						quitaObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_TOMADORES"));
				// Borrar el axisctr_tomador (tomador seleccionado) en caso que est�
				// seleccionado
				if ((request.getSession().getAttribute("axisctr_tomador") != null)
						&& ((BigDecimal) ((HashMap) request.getSession().getAttribute("axisctr_tomador"))
								.get("SPERSON")).equals(SPERSON))
					request.getSession().removeAttribute("axisctr_tomador");
				listaTomadores = null;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_delete_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private Map dbEliminaTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_SIMULACIONES__F_ELIMINATOMADOR(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve 1 � 0 seg�n se permitan o no multiregistros.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbPermitirMultiRegistro(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAXPAR_PRODUCTOS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTITOMADOR();
		logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	private Map dbEliminaConduc(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_SIMULACIONES__F_ELIMINACONDUCTOR(SPERSON);
		logger.debug(map);
		return map;
	}

	private List dbLeeConductores(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {

		Map map = new PAC_IAX_PRODUCCION_AUT(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
				.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
		logger.debug("LISTA DE TOMADORES BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	public void m_ajax_delete_conductor(HttpServletRequest request) {
		logger.debug("Axisctr010Service m_ajax_delete_conductor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_CONDUCTOR");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			List listaConductores = this.dbLeeConductores(request, usuario, NRIESGO);
			// Borrar de BD
			Map eliminaConductor = this.dbEliminaConduc(request, usuario, SPERSON);
			BigDecimal eliminaConductorReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaConductor);
			if (eliminaConductorReturn.equals(new BigDecimal(0))) {
				// Borrar de la lista de sesi�n
				ajax.setAjaxContainer(quitaObjetoDeLista(listaConductores, bigDecimalToString(SPERSON), "SPERSON",
						"OB_IAX_AUTCONDUCTORES"));
				// Borrar el axisctr_tomador (tomador seleccionado) en caso que est�
				// seleccionado
				if ((request.getSession().getAttribute("axisctr_conductor") != null)
						&& ((BigDecimal) ((HashMap) request.getSession().getAttribute("axisctr_conductor"))
								.get("SPERSON")).equals(SPERSON))
					request.getSession().removeAttribute("axisctr_conductor");
				listaConductores = null;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_delete_conductor", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// Bug: 0027955/0152213 - JSV (05/09/2013)

	public void m_ajax_set_riesgo(HttpServletRequest request) {
		logger.debug("Axisctr100Service m_ajax_set_riesgo");
		AjaxContainerService ajax = new AjaxContainerService(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal TIPO = this.getCampoNumerico(request, "TIPO");
			String SPERSON;
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
			String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); // tipo de documento
			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI"); // tipo persona
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal COCUPACION = getCampoNumerico(request, "COCUPACION");
			BigDecimal CESTCIV = getCampoNumerico(request, "CESTCIV");

			String fecha = getCampoTextual(request, "FNACIMI");
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			java.sql.Date FNACIMI = this.stringToSqlDate(fecha, "dd/MM/yyyy");

			// Recoger dato SPERSON DE SESION
			if (request.getSession().getAttribute("SPERSON2MODIFY") != null) {
				SPERSON = String.valueOf(request.getSession().getAttribute("SPERSON2MODIFY"));
			} else {
				SPERSON = "0";
			}

			PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			/* Validaciones sobre los datos del asegurado */
			PAC_IAX_VALIDACIONES pacIaxValidacion = new PAC_IAX_VALIDACIONES(
					((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
			HashMap m = null;
			BigDecimal axisctr100_grabarAseg;
			// Bug 11993 - CRE - Ajustes PPJ Din�mico/Pla Estudiant

			if ((TIPO != null) && (TIPO.intValue() == 1)) {
				if
				// !isEmpty(CSEXPER)&&!isEmpty(FNACIMI)&&
				(!isEmpty(SPERSON) && !isEmpty(CTIPIDE) && !isEmpty(TIDENTI)) {
					// Llamar a funci�n grabar asegurado BigDecimal pPSPERSON, BigDecimal pPCSEXPER,
					// pPFNACIMI, pPNNUMNIF, pPTNOMBRE, pPTAPELLI1, PTAPELLI2, BigDecimal pPCTIPIDE,
					// pPTIDENTI

					m = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_TESTTOMADORES(new BigDecimal(SPERSON), CSEXPER,
							FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2, TAPELLI1, TAPELLI2, CTIPIDE, TIDENTI,
							CDOMICI, CPOBLAC, CPROVIN, CPAIS, COCUPACION, CESTCIV);
					axisctr100_grabarAseg = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);
					request.setAttribute("axisctr100_sexo", axisctr100_grabarAseg);
					logger.debug(axisctr100_grabarAseg);
					// m = pacIaxValidacion.ejecutaPAC_IAX_VALIDACIONES__F_VALIDATOMADORES();
					// BigDecimal axisctr100_validaAseg = (BigDecimal)tratarRETURNyMENSAJES(request,
					// m, false);
				} else {
					axisctr100_grabarAseg = new BigDecimal(1);
					request.setAttribute("axisctr100_sexo", new BigDecimal(1));
				}

			}
			ajax.rellenarPlAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_delete_conductor", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_rechazar_simulacion(HttpServletRequest request, Axisctr100Action thisAction) {
		logger.debug("Axisctr100Service m_rechazar_simulacion");
		try {
			if (!isEmpty(AbstractDispatchAction.topPila(request, "SSEGURO"))) {
				Map m = new PAC_IAX_SIMULACIONES(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
						.ejecutaPAC_IAX_SIMULACIONES__F_RECHAZAR_SIMUL(
								(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"));
				logger.debug("return---------------------------------------->" + m);
				BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

				boolean okk = ok.equals(new BigDecimal(0));

				if (okk) {
					request.getSession().setAttribute("simuOK", "OK");
				} else {
					request.getSession().setAttribute("simuOK", "KO");
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_rechazar_simulacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr100Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_actividad(HttpServletRequest request) {
		logger.debug("Axisctr100Service m_ajax_actualizar_actividad");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			String NVERSION = getCampoTextual(request, "NVERSION");
			String ob_iax = getCampoTextual(request, "OB_IAX");

			ob_iax = ob_iax.replaceAll("\\{", "");
			ob_iax = ob_iax.replaceAll("\\}", "");

			Map map_ob_iax = new HashMap();
			// Map map_ob_iax2 = new HashMap();
			String[] pairs = ob_iax.split(",");
			for (int i = 0; i < pairs.length; i++) {
				String pair = pairs[i];
				for (int j = i + 1; j < pairs.length; j++) {
					if (!pairs[j].contains("=")) {
						pair.concat(pairs[j]);
						i++;
					} else {
						break;
					}
				}
				String[] keyValue = pair.split("=");
				String keyUno = keyValue[0].trim();
				String keyDos = keyValue[1].trim();
				map_ob_iax.put(keyUno, keyDos);
			}

			logger.debug("######MAP####### " + map_ob_iax);

			// map_ob_iax2 = Splitter.on(",").withKeyValueSeparator("=").split(ob_iax);

			// logger.debug("#####SPLITTER######## "+map_ob_iax2);

			// ajax.guardarContenidoFinalAContenedorAjax(TDESCRI);
			// ajax.guardarContenidoFinalAContenedorAjax(NVERSION);

			BigDecimal idversion = null;
			BigDecimal idconv = null;
			String tcodconv = null;
			BigDecimal cestado = null;
			BigDecimal cperfil = null;
			String tdescri = null;
			BigDecimal corganismo = null;
			BigDecimal cvida = null;
			BigDecimal nversion = null;
			BigDecimal cestadovers = null;
			BigDecimal nversion_ant = null;
			String testado = null;
			String tperfil = null;
			String torganismo = null;
			String testadovers = null;
			String tvida = null;
			String tobserv = null;

			if (!isEmpty(map_ob_iax.get("IDVERSION")) && !(map_ob_iax.get("IDVERSION").equals("null")))
				idversion = new BigDecimal(map_ob_iax.get("IDVERSION").toString());
			if (!isEmpty(map_ob_iax.get("IDCONV")) && !(map_ob_iax.get("IDCONV").equals("null")))
				idconv = new BigDecimal(String.valueOf(map_ob_iax.get("IDCONV")));
			tcodconv = map_ob_iax.get("TCODCONV").toString();
			if (!isEmpty(map_ob_iax.get("CESTADO")) && !(map_ob_iax.get("CESTADO").equals("null")))
				cestado = new BigDecimal(map_ob_iax.get("CESTADO").toString());
			if (!isEmpty(map_ob_iax.get("CPERFIL")) && !(map_ob_iax.get("CPERFIL").equals("null")))
				cperfil = new BigDecimal(map_ob_iax.get("CPERFIL").toString());
			tdescri = map_ob_iax.get("TDESCRI").toString();
			if (!isEmpty(map_ob_iax.get("CPERFIL")) && !(map_ob_iax.get("CPERFIL").equals("null")))
				corganismo = new BigDecimal(map_ob_iax.get("CPERFIL").toString());
			if (!isEmpty(map_ob_iax.get("CVIDA")) && !(map_ob_iax.get("CVIDA").equals("null")))
				cvida = new BigDecimal(map_ob_iax.get("CVIDA").toString());
			if (!isEmpty(map_ob_iax.get("NVERSION")) && !(map_ob_iax.get("NVERSION").equals("null")))
				nversion = new BigDecimal(map_ob_iax.get("NVERSION").toString());
			if (!isEmpty(map_ob_iax.get("CESTADOVERS")) && !(map_ob_iax.get("CESTADOVERS").equals("null")))
				cestadovers = new BigDecimal(map_ob_iax.get("CESTADOVERS").toString());
			if (!isEmpty(map_ob_iax.get("NVERSION_ANT")) && !(map_ob_iax.get("NVERSION_ANT").equals("null")))
				nversion_ant = new BigDecimal(map_ob_iax.get("NVERSION_ANT").toString());
			testado = map_ob_iax.get("TESTADO").toString();
			tperfil = map_ob_iax.get("TPERFIL").toString();
			torganismo = map_ob_iax.get("TORGANISMO").toString();
			testadovers = map_ob_iax.get("TESTADOVERS").toString();
			tvida = map_ob_iax.get("TVIDA").toString();
			tobserv = map_ob_iax.get("TOBSERV").toString();

			request.getSession().setAttribute("NVERSION_ANT", nversion_ant);

			// Map map = new
			// PAC_IAX_CONVENIOS_EMP((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_CONVENIOS_EMP__F_SET_GRABARCONVEMPVERS(idversion,idconv,tcodconv,cestado,cperfil,tdescri,corganismo,cvida,nversion,cestadovers,nversion_ant,testado,tperfil,
			// torganismo,testadovers,tvida,tobserv);
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_GRABARCONVEMPVERS(idversion, idconv, tcodconv, cestado, cperfil,
							tdescri, corganismo, cvida, nversion, cestadovers, nversion_ant, testado, tperfil,
							torganismo, testadovers, tvida, tobserv);

			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_actualizar_actividad", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
