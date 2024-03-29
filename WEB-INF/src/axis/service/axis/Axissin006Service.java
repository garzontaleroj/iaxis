//Revision:# dO59dUY3fZDRcsB23cnTSA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AGENDA;
// ini bug 0021662
import axis.jdbc.PAC_IAX_CFG;
// fin bug 0021662
import axis.jdbc.PAC_IAX_DESCVALORES;
//25803
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_GESTION_PROCESOS;
import axis.jdbc.PAC_IAX_LISTADO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_COMPENSACIONES;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
/* ini Bug 26044 - 02/09/2013 - dlF */
import axis.jdbc.SINPAQUETE;
/* fin Bug 26044 */
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin006Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
// ini bug 0021662

public class Axissin006Service extends AxisBaseService {
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	private Map dbGetRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);
		return (Map) tratarRETURNyMENSAJES(request, map, false);
	}

	/**
	 * Mtodo que llama a la funcin pl correspondiente para cargar los RIESGOS de una
	 * pliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolRiesgos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(SSEGURO);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	public void m_init(HttpServletRequest request, Axissin006Action thisAction) {

		try {
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO"); // ALTA-CONSULTA
			request.getSession().setAttribute("CMODO", CMODO);
			if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO"))
					&& isEmpty(AbstractDispatchAction.topPila(request, "CMODO_SIN"))) {
				AbstractDispatchAction.topPila(request, "CMODO_SIN", AbstractDispatchAction.topPila(request, "CMODO"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - mtodo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin006Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO_SIN"))) {
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_SIN"));
			}
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			formdata.put("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1)
				m_cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public BigDecimal m_avisos(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			formdata.put("PLSTAVISOS", m.get("PLSTAVISOS"));
			return pRETURN;

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - mtodo m_avisos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private String getInfoString(HttpServletRequest request, String NSINIES, BigDecimal NTRAMIT) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!isEmpty(fieldValue) && !fieldValue.equals("undefined") && !fieldName.equals("NSINIES")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}
			cadena.append("#").append("NSINIES").append(";").append(NSINIES);
			cadena.append("#").append("NTRAMIT").append(";").append(NTRAMIT);
			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	/**
	 * Realiza la carga de los datos pliza (incluyendo tomadores y ltimo recibo) y
	 * siniestro para un SSEGURO y NSINIES dado.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cargarDatos(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (isEmpty(formdata.get("OB_IAX_SINIESTRO"))) {
				cargarDatosPoliza(request, pac_axis_siniestros, pac_axis_producccion, SSEGURO);
				cargarDatosSiniestro(request, pac_axis_siniestros, NSINIES, thisAction);
			}

			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");

			Map mapReturnSIN_TRAMITA_APOYOS = pac_axis_siniestros
					.ejecutaPAC_IAX_SINIESTROS__F_GET_SIN_TRAMITA_APOYO(null, pPNSINIES, pPNTRAMIT);
			List<Map> listSIN_TRAMITA_APOYOS = (List) tratarRETURNyMENSAJES(request, mapReturnSIN_TRAMITA_APOYOS);
			formdata.put("LISTSIN_TRAMITA_APOYOS", listSIN_TRAMITA_APOYOS);

			// m_cargarCombos(request,thisAction);

			request.setAttribute("NSINIES", NSINIES);
			request.setAttribute("NTRAMIT", pPNTRAMIT);
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String pParam = this.getInfoString(request, NSINIES, pPNTRAMIT);

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(new BigDecimal(4), null, pParam);
			BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, m))) ? new BigDecimal(0)
					: (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			if (ok.intValue() == 0) {
				formdata.put("PLSTAGENDA", m.get("PLSTAGDOBS"));
			}

			m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(new BigDecimal(5), null, pParam);
			ok = (isEmpty(this.tratarRETURNyMENSAJES(request, m))) ? new BigDecimal(0)
					: (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			if (ok.intValue() == 0) {
				formdata.put("PLSTAGENDA_TRAMI", m.get("PLSTAGDOBS"));
			}

			/* Cargar datos maxima perdida probable - riesgo - contingencia bug 3603 */
			m = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITA_ESTSINI(pPNSINIES, pPNTRAMIT);

			formdata.put("LISTSIN_MXPP_RC", (List) tratarRETURNyMENSAJES(request, m));

			/*
			 * ************************************ RECUPERAR ASEGURADOS
			 * *******************************
			 */
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
			List asegurados = (List) tratarRETURNyMENSAJES(request,
					dbLeeAsegurados(request, NRIESGO, (BigDecimal) datosPoliza.get("SPRODUC")));
			request.setAttribute("axisctr_asegurados", ((asegurados == null) ? new ArrayList() : asegurados));

			// Bug 17155 : Aadir datos carga fichero a SINIESTROS
			PAC_IAX_GESTION_PROCESOS pac_gestion_procesos = new PAC_IAX_GESTION_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map carga_fichero = pac_gestion_procesos.ejecutaPAC_IAX_GESTION_PROCESOS__F_GET_CARGA_FICHERO(
					new BigDecimal("3"), null, SSEGURO, NSINIES, null);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, carga_fichero, false);
			if (resultado.intValue() == 0) {
				ArrayList lista_fichero = (ArrayList) carga_fichero.get("PCURCARGA");
				request.setAttribute("carga_fichero_datos", lista_fichero);
			}
			// Bug 25800 : Preguntas siniestros
			this.initPreguntas(request, thisAction, (Map) formdata.get("OB_IAX_SINIESTRO"));

			BigDecimal NTRAMIT = this.getCampoNumerico(request, "indexTramitacio");
			if (NTRAMIT == null) {
				NTRAMIT = (BigDecimal) formdata.get("indexTramitacio");
				if (NTRAMIT == null) {
					NTRAMIT = new BigDecimal(0);
				}
			}
			formdata.put("indexTramitacio", NTRAMIT);

			/* Bug 26044 - 02/09/2013 - dlF */
			SINPAQUETE sinpaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = sinpaquete.ejecutaF_PARPRODUCTOS_V((BigDecimal) datosPoliza.get("SPRODUC"), "PRINT_RECHAZO_SIN");
			formdata.put("PRINT_RECHAZO_SIN", tratarRETURNyMENSAJES(request, m));
			/* fin 26044 - 02/09/2013 - dlF */

			// Bug 28506 : Aadir informacin reaseguro
			if (!isEmpty(NSINIES)) {
				Map datos_reaseguro = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_INF_REASEGURO(NSINIES);
				formdata.put("DATOS_REASEGURO", tratarRETURNyMENSAJES(request, datos_reaseguro));
			}
			// Fin Bug 28506 : Aadir informacin reaseguro

			this.cargarListasLocalizacion(request);

			if (!isEmpty(NSINIES) && !isEmpty(NTRAMIT)) {
				this.m_cargarJudicial(request, thisAction);
				this.m_cargarFiscal(request, thisAction);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - mtodo m_cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_inicializarDatos(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// IAXIS-5125 Si viene desde la pantalla mantenimiento de personas en los modos
			// MANTTO_PER o CONSULTA, debe ingresar en modo Consulta al modulo de siniestros
			// Se agrega validacion cuando el CMODO es null
			if (!isEmpty(formdata.get("CMODO"))
					&& (formdata.get("CMODO").equals("MANTTO_PER") || formdata.get("CMODO").equals("CONSULTA")))
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA_SINIESTROS");// IAXIS-5289

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			String NSINIESselected = getCampoTextual(request, "NSINIESselected");

			formdata.put("NSINIES", NSINIESselected);
			//
			if (!isEmpty(SSEGURO)) {
				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales
				// que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(
						(BigDecimal) getCampoNumerico(request, "SSEGURO"));
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}

			Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);

			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("CACTIVI", datosPoliza.get("CACTIVI"));
			SPRODUC = new BigDecimal(String.valueOf(datosPoliza.get("SPRODUC")));
			CACTIVI = new BigDecimal(String.valueOf(datosPoliza.get("CACTIVI")));
			BigDecimal CEMPRES = new BigDecimal(String.valueOf(datosPoliza.get("CEMPRES")));

			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(SPRODUC, CACTIVI,
					NSINIESselected);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				this.m_cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - mtodo m_inicializaDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargaDatosMinTramintacion(HttpServletRequest request, Map NUEVO) {
		ArrayList tramitaciones_min = new ArrayList();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		HashMap prueba = (HashMap) NUEVO;
		Map clase = new HashMap();
		ArrayList BLOQUE_TRAMITACIONES = (ArrayList) NUEVO.get("TRAMITACIONES");

		for (int i = 0; i < BLOQUE_TRAMITACIONES.size(); i++) {
			Map mapa_trami = (Map) BLOQUE_TRAMITACIONES.get(i);
			HashMap mapa_min = (HashMap) mapa_trami.get("OB_IAX_SIN_TRAMITACION");
			HashMap mapa_final = new HashMap();
			Iterator it = mapa_min.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry e = (Map.Entry) it.next();
				mapa_final.put(e.getKey(), e.getValue());
			}
			mapa_final.put("CEMPRES", request.getSession().getAttribute("CEMPRES"));

			ArrayList<HashMap> mapa_mov = (ArrayList) mapa_final.get("MOVIMIENTOS");
			BigDecimal NMOVTRA = new BigDecimal(-1);
			BigDecimal itemTramite = isEmpty(formdata.get("indexTramitacio")) ? new BigDecimal(0)
					: new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));

			Map moviment = new HashMap();
			for (HashMap ob_movimiento : mapa_mov) {
				HashMap m = (HashMap) ob_movimiento.get("OB_IAX_SIN_TRAMI_MOVIMIENTO");

				BigDecimal ob_nmovtra = new BigDecimal(String.valueOf(m.get("NMOVTRA")));
				if (itemTramite.equals(new BigDecimal(i))) {
					BigDecimal CESTTRA = new BigDecimal(String.valueOf(m.get("CESTTRA")));
					formdata.put("CESTTRA_MOV", CESTTRA);
				}

				if (NMOVTRA.intValue() < ob_nmovtra.intValue()) {
					NMOVTRA = ob_nmovtra;
					moviment = ob_movimiento;
				}
			}

			mapa_final.remove("MOVIMIENTOS");
			mapa_final.put("MOVIMIENTOS", moviment);
			mapa_final.remove("DESTINATARIOS");
			mapa_final.remove("LOCALIZACIONES");
			mapa_final.remove("PAGOS");
			mapa_final.remove("RECOBROS");
			mapa_final.remove("AGENDA");
			mapa_final.remove("RESERVAS");
			mapa_final.remove("AMPAROS");
			mapa_final.remove("DANYOS");
			tramitaciones_min.add(i, mapa_final);

		}
		request.getSession().setAttribute("tramitaciones_min", tramitaciones_min);
	}

	private void dbInicializaPol(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		// Inicializar flujo
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		tratarRETURNyMENSAJES(request, map, false);
	}

	private void cargarDatosPoliza(HttpServletRequest request, PAC_IAX_SINIESTROS pac_axis_siniestros,
			PAC_IAX_PRODUCCION pac_axis_producccion, BigDecimal SSEGURO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Datos pliza

		// bug 18749 -29/06/2011-AMC
		dbInicializaPol(request, usuario, SSEGURO);

		Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("SPRODUC", datosPoliza.get("SPRODUC"));
		formdata.put("P_RAMO", datosPoliza.get("CRAMO"));
		request.getSession().setAttribute("CEMPRES", datosPoliza.get("CEMPRES"));
		// Aadimos datosPoliza en el Map formdata para poder mostrarlos en la
		// vista
		if (!isEmpty(datosPoliza)) {
			Map OB_IAX_DATPOLIZA = new HashMap();
			OB_IAX_DATPOLIZA.putAll(datosPoliza);
			formdata.put("OB_IAX_DATPOLIZA", OB_IAX_DATPOLIZA);
			request.getSession().setAttribute("CTIPCOA", datosPoliza.get("CTIPCOA"));
		}
		// bug 18749 -29/06/2011-AMC
		map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TACTIVI", datosGestion.get("TACTIVI"));
		formdata.put("CACTIVI", datosGestion.get("CACTIVI"));
		// Fi bug 18749 -29/06/2011-AMC
		// Tomadores pliza
		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(SSEGURO);
		List tomadores = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(tomadores))
			formdata.put("T_IAX_TOMADORES", tomadores);

		// ltimo recibo
		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO(SSEGURO);

		List lastRecibo = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(lastRecibo))
			formdata.put("T_IAX_LASTRECIBO", lastRecibo);
		List polRiesgosReturn = this.dbGetPolRiesgos(request, usuario, SSEGURO);
		formdata.put("T_IAX_RIESGOS", polRiesgosReturn);

		formdata.put("RIESGOASE",
				((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
						? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("RIESGOASE")
						: null);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void cargarDatosSiniestro(HttpServletRequest request, PAC_IAX_SINIESTROS pac_axis_siniestros,
			String NSINIES, Axissin006Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map);
		String CMODO_SIN = (String) thisAction.topPila(request, "CMODO_SIN");
		if (!isEmpty(CMODO_SIN))
			thisAction.topPila(request, "CMODO", CMODO_SIN);

		int x = 0;
		if (!isEmpty(datosSiniestro)) {

			if (!"CONSULTA_SINIESTROS".equals(CMODO_SIN) && !"MODIF_SINIESTROS_CERRADO".equals(CMODO_SIN)) {
				List<Map> movimientos = (ArrayList) datosSiniestro.get("MOVIMIENTOS");
				if (!isEmpty(movimientos)) {
					Map m = (HashMap) movimientos.get(0).get("OB_IAX_SIN_MOVSINIESTRO");
					if (!isEmpty(m)) {
						int CESTSIN = (BigDecimal) m.get("CESTSIN") == null ? -100
								: ((BigDecimal) m.get("CESTSIN")).intValue();
						switch (CESTSIN) {
						case 1:// terminada
						case 2:// rechazada
						case 3:// anulada
//							thisAction.topPila(request, "CMODO", "MODIF_SINIESTROS_CERRADO");
//							break;
						default:
							break;
						}
					}
				}
			}

			ArrayList lista_riesgos = (ArrayList) formdata.get("T_IAX_RIESGOS");
			request.getSession().setAttribute("lista_riesgos", lista_riesgos);
			if (!isEmpty(datosSiniestro.get("CTIPDEC"))) {
				BigDecimal SSEGURO = (BigDecimal) datosSiniestro.get("SSEGURO");
				BigDecimal NRIESGO = (BigDecimal) datosSiniestro.get("NRIESGO");
				BigDecimal CTIPDEC = (BigDecimal) datosSiniestro.get("CTIPDEC");
				if (!isEmpty(CTIPDEC)) {

					if (CTIPDEC.intValue() == 1 || CTIPDEC.intValue() == 2) {
						// dbInicializaPol(request, usuario, SSEGURO); bug 18749
						// -29/06/2011-AMC
						Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);

						List polAsegReturn = (List) OB_IAX_RIESGOS.get("RIESGOASE");
						formdata.put("T_IAX_ASEGURADOS", polAsegReturn);
					} else {
						if (CTIPDEC.intValue() == 3) {
							// dbInicializaPol(request, usuario, SSEGURO); bug
							// 18749 -29/06/2011-AMC

							Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);
							List polConductoresReturn = (List) OB_IAX_RIESGOS.get("RIESAUTOS");
							formdata.put("T_IAX_CONDUCTORES", polConductoresReturn);
						}
					}
				}
			}
			ArrayList tramitaciones = (ArrayList) datosSiniestro.get("TRAMITACIONES");

			// Aadimos datosSiniestro en el Map formdata para poder mostrarlos
			// en la vista
			Map OB_IAX_SINIESTRO = new HashMap();
			OB_IAX_SINIESTRO.putAll(datosSiniestro);

			if (isEmpty(formdata.get("indexReserva")))
				formdata.put("indexReserva", new BigDecimal(0));

			if (isEmpty(formdata.get("indexGestio")))
				formdata.put("indexGestio", new BigDecimal(0));

			if (isEmpty(formdata.get("indexTramitacio"))) {
				formdata.put("indexTramitacio", new BigDecimal(0));
				formdata.put("NTRAMIT", new BigDecimal(0));
			}

			if (this.getCampoNumerico(request, "CTRAMIT") == null) {
				formdata.put("CTRAMIT", new BigDecimal(0));
			} else {
				formdata.put("CTRAMIT", this.getCampoNumerico(request, "CTRAMIT"));
			}

			if (isEmpty(formdata.get("indexDestinarario"))) {
				formdata.put("indexDestinarario", new BigDecimal(0));
				formdata.put("NDEST", new BigDecimal(0));
			}

			// ini Bug 0022099
			if (isEmpty(formdata.get("indexTramiteMov"))) {
				formdata.put("indexTramiteMov", new BigDecimal(0));
			}
			// fin Bug 0022099

			BigDecimal index = new BigDecimal(0);
			if (!isEmpty(formdata.get("indexTramitacio"))) {
				index = getCampoNumerico(request, "indexTramitacio");
			}
			if (!isEmpty(datosSiniestro.get("TRAMITACIONES"))) {

				List tram = (List) datosSiniestro.get("TRAMITACIONES");
				Map tramitacio = ((Map) ((Map) tram.get(index.intValue())).get("OB_IAX_SIN_TRAMITACION"));

				String sidepago = String.valueOf(formdata.get("SIDEPAG"));

				BigDecimal sidepag = null;
				if (!isEmpty(sidepago) && sidepago != "null") {
					sidepag = new BigDecimal(sidepago);
				}

				if (!isEmpty(tramitacio.get("PAGOS"))) {
					List pagos = (List) tramitacio.get("PAGOS");

					x = 0;
					if (!isEmpty(sidepag)) {
						for (int i = 0; i < pagos.size(); i++) {
							Map pago = (Map) pagos.get(i);
							if (sidepag.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
								x = i;
						}
					}

					formdata.put("indexPago", new BigDecimal(x));
					Map pago = (Map) pagos.get(x);
					formdata.put("SIDEPAG", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
				}

			}

			if (isEmpty(formdata.get("SIDEPAG")))
				formdata.put("SIDEPAG", new BigDecimal(0));
			if (isEmpty(formdata.get("indexPago")))
				formdata.put("indexPago", new BigDecimal(0));
			if (isEmpty(formdata.get("indexPago_ofi"))) {
				formdata.put("indexPago_ofi", new BigDecimal(0));
				// TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS

				if (!isEmpty(datosSiniestro.get("TRAMITACIONES"))) {
					List tram = (List) datosSiniestro.get("TRAMITACIONES");
					Map tramitacio = ((Map) ((Map) tram.get(index.intValue())).get("OB_IAX_SIN_TRAMITACION"));
					if (!isEmpty(tramitacio.get("PAGOS_OFI"))) {
						List pagos = (List) tramitacio.get("PAGOS_OFI");
						x = 0;
						String SIDEPAG_ofistring = String.valueOf(formdata.get("SIDEPAG_OFI"));

						BigDecimal SIDEPAG_OFI = null;
						if (!isEmpty(SIDEPAG_ofistring) && SIDEPAG_ofistring != "null") {
							SIDEPAG_OFI = new BigDecimal(SIDEPAG_ofistring);
						}
						if (!isEmpty(SIDEPAG_OFI)) {
							for (int i = 0; i < pagos.size(); i++) {
								Map pago = (Map) pagos.get(i);
								if (SIDEPAG_OFI.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
									x = i;
							}
						}

						formdata.put("indexPago_ofi", new BigDecimal(x));
						Map pago = (Map) pagos.get(x);
						formdata.put("SIDEPAG_OFI", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
					}

				}
				if (isEmpty(formdata.get("SIDEPAG_OFI")))
					formdata.put("SIDEPAG_OFI", new BigDecimal(0));
				if (isEmpty(formdata.get("indexPago_ofi")))
					formdata.put("indexPago_ofi", new BigDecimal(0));
				// s'ha d'agafar el primer SIDEPAG, el de la posici 0!
			}

			if (!isEmpty(datosSiniestro.get("TRAMITACIONES"))) {
				List tram = (List) datosSiniestro.get("TRAMITACIONES");

				Map tramitacio = ((Map) ((Map) tram.get(index.intValue())).get("OB_IAX_SIN_TRAMITACION"));

				String sidepagreco = String.valueOf(formdata.get("SIDEPAGRECOB"));

				BigDecimal sidepagrecob = null;
				if (!isEmpty(sidepagreco) && !sidepagreco.equals("null")) {
					sidepagrecob = new BigDecimal(sidepagreco);
				}

				if (!isEmpty(tramitacio.get("RECOBROS"))) {
					List pagos = (List) tramitacio.get("RECOBROS");
					x = 0;
					if (!isEmpty(sidepagrecob)) {
						for (int i = 0; i < pagos.size(); i++) {
							Map pago = (Map) pagos.get(i);
							if (sidepagrecob.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
								x = i;
						}
					}

					formdata.put("indexRecobro", new BigDecimal(x));
					Map pago = (Map) pagos.get(x);
					formdata.put("SIDEPAGRECOB", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
				}

			}

			if ((OB_IAX_SINIESTRO.get("TRAMITES") != null)) {
				if (OB_IAX_SINIESTRO.get("TRAMITES") instanceof List) {
					if (((List) (OB_IAX_SINIESTRO.get("TRAMITES"))).size() > 0) {
						PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

						List TRAMITES = (List) (OB_IAX_SINIESTRO.get("TRAMITES"));
						for (int i = 0; i < TRAMITES.size(); i++) {
							HashMap TRAMITE = (HashMap) TRAMITES.get(i);
							Map OB_IAX_SIN_TRAMITE = (Map) TRAMITE.get("OB_IAX_SIN_TRAMITE");

							if (OB_IAX_SIN_TRAMITE.get("CTRAMTE").equals(new BigDecimal(9999))) {
								formdata.put("PERRELACIONADAS", 1);
								String VNSINIES = (String) OB_IAX_SIN_TRAMITE.get("NSINIES");
								Map m = pac_axis_sintramite
										.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE9999(new BigDecimal(VNSINIES));
								formdata.put("NTRAMIT9999", m.get("PNTRAMIT"));

								m = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(VNSINIES,
										(BigDecimal) m.get("PNTRAMIT"));
								ArrayList perrel = (ArrayList) m.get("PLISTAPERSREL");
								formdata.put("LISTPERRELACIONADAS", perrel);

								TRAMITES.remove(i);

							}
						}

					}
				}
			}

			if (isEmpty(formdata.get("SIDEPAGRECOB"))) {
				formdata.put("SIDEPAGRECOB", new BigDecimal(0));
			}
			if (isEmpty(formdata.get("indexRecobro")))
				formdata.put("indexRecobro", new BigDecimal(0));

			// }

			if (isEmpty(formdata.get("indexRecobro_ofi"))) {
				formdata.put("indexRecobro_ofi", new BigDecimal(0));
				// s'ha d'agafar el primer SIDEPAG, el de la posici 0!

				if (!isEmpty(datosSiniestro.get("TRAMITACIONES"))) {
					List tram = (List) datosSiniestro.get("TRAMITACIONES");
					Map tramitacio = ((Map) ((Map) tram.get(index.intValue())).get("OB_IAX_SIN_TRAMITACION"));
					if (!isEmpty(tramitacio.get("RECOBROS_OFI"))) {
						List pagos = (List) tramitacio.get("RECOBROS_OFI");
						String sidepagreco_OFI = String.valueOf(formdata.get("SIDEPAGRECOB_OFI"));

						BigDecimal SIDEPAGRECOB_OFI = null;
						if (!isEmpty(sidepagreco_OFI) && !sidepagreco_OFI.equals("null")) {
							SIDEPAGRECOB_OFI = new BigDecimal(sidepagreco_OFI);
						}

						if (!isEmpty(tramitacio.get("RECOBROS"))) {
							pagos = (List) tramitacio.get("RECOBROS");
							x = 0;
							if (!isEmpty(SIDEPAGRECOB_OFI)) {
								for (int i = 0; i < pagos.size(); i++) {
									Map pago = (Map) pagos.get(i);
									if (SIDEPAGRECOB_OFI
											.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
										x = i;
								}
							}

							Map pago = (Map) pagos.get(x);
							formdata.put("indexRecobro_ofi", new BigDecimal(x));
							formdata.put("SIDEPAGRECOB_OFI", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
						}

					}
					if (isEmpty(formdata.get("SIDEPAGRECOB_OFI")))
						formdata.put("SIDEPAGRECOB_OFI", new BigDecimal(0));
					if (isEmpty(formdata.get("indexRecobro")))
						formdata.put("indexRecobro", new BigDecimal(0));
				}
			}

			if (!isEmpty(NSINIES)) {

				this.cargarDetallsRerserva(request, tramitaciones, NSINIES);
				Map RESERVASINIESTRO = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_ULTIMARESERVA(NSINIES);
				Map PAGOSSINIESTRO = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PAGOSPORSINIESTRO(NSINIES,
						new BigDecimal(2));
				Map RECOBROSSINIESTRO = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PAGOSPORSINIESTRO(NSINIES,
						new BigDecimal(7));
				// FI RESUMS
				BigDecimal NPAGOS = new BigDecimal(0);
				BigDecimal NTRAMITA = new BigDecimal(0);
				ArrayList arPagos = (ArrayList) PAGOSSINIESTRO.get("PAGOSPORSINISTRO");
				if (arPagos.size() > 0) {
					NPAGOS = new BigDecimal(1);

				}

				Map CLASIFICACIONSINIESTRO = pac_axis_siniestros
						.ejecutaPAC_IAX_SINIESTROS__F_GET_CLASIFICASINIESTRO(NSINIES, NPAGOS, NTRAMITA);
				if (CLASIFICACIONSINIESTRO.get("CLAS_SINIESTRO") != null) {
					ArrayList arrsinclasifica = (ArrayList) CLASIFICACIONSINIESTRO.get("CLAS_SINIESTRO");
					HashMap sinclamap = (HashMap) arrsinclasifica.get(0);
					OB_IAX_SINIESTRO.put("CCLASIN", sinclamap.get("TATRIBU"));
				}

				Map resumenes = new HashMap();
				resumenes.put("RESERVAS", RESERVASINIESTRO.get("ULT_RESERVA"));
				resumenes.put("PAGOS", PAGOSSINIESTRO.get("PAGOSPORSINISTRO"));
				resumenes.put("RECOBROS", RECOBROSSINIESTRO.get("PAGOSPORSINISTRO"));
				OB_IAX_SINIESTRO.put("RESUMEN", resumenes);
				// CARGAMOS LA AGENDA
				/* Bug 18176 - ICV - 05/04/2011 */
				PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("0"),
						NSINIES.toString(), null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, null);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
					request.setAttribute("lstagdagenda", lista_agenda);
				}

				BigDecimal NTRAMIT = isEmpty(formdata.get("indexTramitacio")) ? new BigDecimal(0)
						: new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));

				formdata.put("NTRAMIT", NTRAMIT);

				map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("0"),
						NSINIES.toString(), null, null, null, null, null, null, null, null, null, null, null, null,
						null, null, NTRAMIT);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				if (resultado.intValue() == 0) {
					ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
					request.setAttribute("lstagdagenda_tram", lista_agenda);
				}

				cargaDatosMinTramintacion(request, OB_IAX_SINIESTRO);

			} else {
				if (isEmpty(OB_IAX_SINIESTRO.get("FNOTIFI")))
					OB_IAX_SINIESTRO.put("FNOTIFI", new Date());

				cargaDatosMinTramintacion(request, OB_IAX_SINIESTRO);
			}

			BigDecimal pPNTRAMTE = null;
			BigDecimal CTRAMTE = null;
			if ((OB_IAX_SINIESTRO.get("TRAMITES") != null)) {
				if (OB_IAX_SINIESTRO.get("TRAMITES") instanceof List) {
					if (((List) (OB_IAX_SINIESTRO.get("TRAMITES"))).size() > 0) {
						pPNTRAMTE = getCampoNumerico(request, "NTRAMTE");

						CTRAMTE = getCampoNumerico(request, "CTRAMTE");
						ArrayList listatramites = (ArrayList) OB_IAX_SINIESTRO.get("TRAMITES");
						HashMap tramitelist = (HashMap) listatramites.get(0);
						HashMap tramiteob = (HashMap) tramitelist.get("OB_IAX_SIN_TRAMITE");
						if (pPNTRAMTE == null) {
							if (!isEmpty(tramiteob.get("NTRAMTE"))) {
								pPNTRAMTE = new BigDecimal(String.valueOf(tramiteob.get("NTRAMTE")));
							} else {
								pPNTRAMTE = new BigDecimal(0);
							}
						}
						if (isEmpty(CTRAMTE)) {
							if (!isEmpty(tramiteob.get("CTRAMTE"))) {
								CTRAMTE = new BigDecimal(String.valueOf(tramiteob.get("CTRAMTE")));
							} else {
								CTRAMTE = new BigDecimal(0);
							}
						}

						PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map mapObjTramite = pac_axis_sintramite
								.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(pPNTRAMTE);
						OB_IAX_SINIESTRO.put("TRAMITACIONES", mapObjTramite.get("PTRAMITACIONES"));
						ArrayList m = (ArrayList) mapObjTramite.get("PTRAMITACIONES");
						if (!isEmpty(m)) {
							Map trami = new HashMap();
							if (!isEmpty(formdata.get("indexTramitacio"))) {
								BigDecimal i = new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));

								if (m.size() > i.intValue()) {
									Map mm = (Map) m.get(i.intValue());
									trami = (Map) mm.get("OB_IAX_SIN_TRAMITACION");
									formdata.put("NTRAMIT", trami.get("NTRAMIT"));
									// formdata.put("indexTramitacio",new
									// BigDecimal(0));
								} else {
									Map mm = (Map) m.get(0);
									trami = (Map) mm.get("OB_IAX_SIN_TRAMITACION");
									formdata.put("NTRAMIT", trami.get("NTRAMIT"));
									formdata.put("indexTramitacio", new BigDecimal(0));
								}
							} else {
								Map mm = (Map) m.get(0);
								trami = (Map) mm.get("OB_IAX_SIN_TRAMITACION");
								formdata.put("NTRAMIT", trami.get("NTRAMIT"));
								formdata.put("indexTramitacio", new BigDecimal(0));
							}

							Map tramitacio = trami;

							String sidepago = String.valueOf(formdata.get("SIDEPAG"));

							BigDecimal sidepag = null;
							if (!isEmpty(sidepago) && sidepago != "null") {
								sidepag = new BigDecimal(sidepago);
							}

							if (!isEmpty(tramitacio.get("PAGOS"))) {
								List pagos = (List) tramitacio.get("PAGOS");

								x = 0;
								if (!isEmpty(sidepag)) {
									for (int i = 0; i < pagos.size(); i++) {
										Map pago = (Map) pagos.get(i);
										if (sidepag.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
											x = i;
									}
								}

								formdata.put("indexPago", new BigDecimal(x));
								Map pago = (Map) pagos.get(x);
								formdata.put("SIDEPAG", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
							}

							if (isEmpty(formdata.get("SIDEPAG")))
								formdata.put("SIDEPAG", new BigDecimal(0));
							if (isEmpty(formdata.get("indexPago")))
								formdata.put("indexPago", new BigDecimal(0));
							if (isEmpty(formdata.get("indexPago_ofi"))) {
								formdata.put("indexPago_ofi", new BigDecimal(0));
							}

							String sidepagreco = String.valueOf(formdata.get("SIDEPAGRECOB"));

							BigDecimal sidepagrecob = null;
							if (!isEmpty(sidepagreco) && !sidepagreco.equals("null")) {
								sidepagrecob = new BigDecimal(sidepagreco);
							}

							if (!isEmpty(tramitacio.get("RECOBROS"))) {
								List pagos = (List) tramitacio.get("RECOBROS");
								x = 0;
								if (!isEmpty(sidepagrecob)) {
									for (int i = 0; i < pagos.size(); i++) {
										Map pago = (Map) pagos.get(i);
										if (sidepagrecob
												.equals(((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG")))
											x = i;
									}
								}

								formdata.put("indexRecobro", new BigDecimal(x));
								Map pago = (Map) pagos.get(x);
								formdata.put("SIDEPAGRECOB", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
							}

							PAC_IAX_AGENDA pacIaxAgenda = new PAC_IAX_AGENDA(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
							map = pacIaxAgenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(null, null, new BigDecimal("0"),
									NSINIES.toString(), null, null, null, null, null, null, null, null, null, null,
									null, null, null, null, (BigDecimal) tramitacio.get("NTRAMIT"));
							BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
							if (resultado.intValue() == 0) {
								ArrayList lista_agenda = (ArrayList) map.get("PLSTAGENDA");
								request.setAttribute("lstagdagenda_tram", lista_agenda);
							}

							cargaDatosMinTramintacion(request, OB_IAX_SINIESTRO);
						}

						Map tramiteobx = (Map) this.tratarRETURNyMENSAJES(request, mapObjTramite);
						if (!isEmpty(tramiteobx.get("CTRAMTE"))) {
							CTRAMTE = new BigDecimal(String.valueOf(tramiteobx.get("CTRAMTE")));
						}

					}
				}
			}

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001090"));
			List listaClases = (List) tratarRETURNyMENSAJES(request, map4);
			formdata.put("listaClases", !isEmpty(listaClases) ? listaClases : new ArrayList());

			formdata.put("NTRAMTE", pPNTRAMTE);

			formdata.put("OB_IAX_SINIESTRO", OB_IAX_SINIESTRO);

			if (!isEmpty(request.getParameter("SGESTIO"))) {
				ArrayList tr = (ArrayList) OB_IAX_SINIESTRO.get("TRAMITACIONES");
				if (tr.size() > 0) {
					Map m = (Map) tr.get(((BigDecimal) formdata.get("indexTramitacio")).intValue());
					ArrayList g = (ArrayList) ((Map) m.get("OB_IAX_SIN_TRAMITACION")).get("GESTIONES");
					if (g != null) {
						for (int i = 0; i < g.size(); i++) {
							if (((BigDecimal) ((Map) ((Map) g.get(i)).get("OB_IAX_SIN_TRAMITA_GESTION")).get("SGESTIO"))
									.equals(new BigDecimal(request.getParameter("SGESTIO")))) {
								formdata.put("indexGestio", i);
							}
						}
					}
				}
			}

			if (!isEmpty(formdata.get("indexGestio"))) {
				PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				ArrayList t = (ArrayList) OB_IAX_SINIESTRO.get("TRAMITACIONES");
				if (t.size() > 0) {
					Map m = (Map) t.get(((BigDecimal) formdata.get("indexTramitacio")).intValue());
					ArrayList gs = (ArrayList) ((Map) m.get("OB_IAX_SIN_TRAMITACION")).get("GESTIONES");
					if (!gs.isEmpty()) {
						BigDecimal iGestio = new BigDecimal(0);
						try {
							iGestio = (BigDecimal) formdata.get("indexGestio");
						} catch (ClassCastException e) {
							try {
								iGestio = new BigDecimal((String) formdata.get("indexGestio"));
							} catch (ClassCastException ee) {
								iGestio = new BigDecimal((Integer) formdata.get("indexGestio"));
							}
						}

						Map g = (Map) gs.get(iGestio.intValue());
						Map o = (Map) g.get("OB_IAX_SIN_TRAMITA_GESTION");

						BigDecimal SGESTION = (BigDecimal) o.get("SGESTIO");

						map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GESTION_MODIFICABLE(SGESTION);

						if (tratarRETURNyMENSAJES(request, map).equals(new BigDecimal(0))) {
							formdata.put("MODIFICABLE", map.get("PSI_O_NO"));
							formdata.put("SGESTIO", SGESTION);
						}
					}
				}
			}

			if (!isEmpty(CTRAMTE))
				formdata.put("CTRAMTE", CTRAMTE);

			BigDecimal cal_indexTramite = new BigDecimal(0);
			if (!isEmpty(formdata.get("indexTramite"))) {
				cal_indexTramite = getCampoNumerico(request, "indexTramite");
			}
			formdata.put("indexTramite", cal_indexTramite);

		}
	}

	private void cargarDetallsRerserva(HttpServletRequest request, ArrayList<Map> tramitaciones, String NSINIES)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		formdata.put("VALIDARESERVA", new BigDecimal(0));
		if (tramitaciones.size() > 0) {

			for (Map tramitacio : tramitaciones) {
				Map tram = (Map) tramitacio.get("OB_IAX_SIN_TRAMITACION");
				ArrayList<Map> reservas = (ArrayList) tram.get("RESERVAS");
				if (!isEmpty(reservas)) {
					formdata.put("VALIDARESERVA", new BigDecimal(1));
					for (Map reserva : reservas) {
						Map reserv = (Map) reserva.get("OB_IAX_SIN_TRAMI_RESERVA");
						BigDecimal NTRAMIT = new BigDecimal(String.valueOf(reserv.get("NTRAMIT")));

						BigDecimal CGARANT = isEmpty(reserv.get("CGARANT")) ? null
								: new BigDecimal(String.valueOf(reserv.get("CGARANT")));
						BigDecimal CTIPRES = new BigDecimal(String.valueOf(reserv.get("CTIPRES")));
						BigDecimal CTIPGAS = null;
						if (reserv.get("CTIPGAS") != null) {
							CTIPGAS = new BigDecimal(String.valueOf(reserv.get("CTIPGAS")));
						}
						BigDecimal NMOVRES = new BigDecimal(String.valueOf(reserv.get("NMOVRES")));

						java.sql.Date FRESINI = null;
						try {
							Timestamp d = (Timestamp) reserv.get("FRESINI");
							FRESINI = new java.sql.Date(d.getTime());
						} catch (Exception e) {
						}

						BigDecimal SIDEPAG = null;
						try {
							SIDEPAG = new BigDecimal(String.valueOf(reserv.get("SIDEPAG")));
						} catch (Exception e) {
							SIDEPAG = null;
						}

						Map PAGOSRESERVA = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_DETALLESPAGOS(NSINIES,
								NTRAMIT, CTIPRES, new BigDecimal(2), CGARANT, SIDEPAG, NMOVRES);
						Map RECOBROSRESERVA = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_DETALLESPAGOS(
								NSINIES, NTRAMIT, CTIPRES, new BigDecimal(7), CGARANT, SIDEPAG, NMOVRES);

						Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_MOV_RESERVA(NSINIES, NTRAMIT,
								CTIPRES, CTIPGAS, CGARANT, NMOVRES, SPRODUC, CACTIVI);

						Map map2 = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_PERDELRESERVA(NSINIES, NTRAMIT,
								CTIPRES, CTIPGAS, CGARANT, FRESINI, SPRODUC, CACTIVI);

						reserv.put("PAGOSRESERVA", PAGOSRESERVA.get("DETALLESPAGOS"));
						reserv.put("RECOBROSRESERVA", RECOBROSRESERVA.get("DETALLESPAGOS"));
						reserv.put("MODIFICABLE", map.get("PMODIFICABLE"));
						reserv.put("BORRAR", map2.get("PMODIFICABLE"));

					}
				}
			}
		}
	}

	public void m_recargarRadios(HttpServletRequest request, Axissin006Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			formdata.put("indexReserva", new BigDecimal(0));
			formdata.put("indexPago", new BigDecimal(0));
			formdata.put("indexRecobro", new BigDecimal(0));
			this.cargarCodis(request);
			/*
			 * Map sinistre = (Map)formdata.get("OB_IAX_SINIESTRO"); ArrayList tramitaciones
			 * = (ArrayList) sinistre.get("TRAMITACIONES");
			 * this.cargarDetallsRerserva(request,tramitaciones,this.
			 * getCampoNumerico(request,"NSINIES"));
			 */

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 m_recargarRadios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_recargarPagos(HttpServletRequest request, Axissin006Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			if (this.getCampoTextual(request, "subpantalla").equalsIgnoreCase("tramitaciones")
					&& this.getCampoTextual(request, "seccion").equalsIgnoreCase("tramitaciones_gestion")) {
				PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SGESTION = this.getCampoNumerico(request, "SGESTION");

				Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GESTION_MODIFICABLE(SGESTION);
				if (tratarRETURNyMENSAJES(request, map).equals(new BigDecimal(0))) {
					formdata.put("MODIFICABLE", map.get("PSI_O_NO"));
					formdata.put("SGESTIO", SGESTION);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 m_recargarPagos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_cargarCombos(HttpServletRequest request, Axissin006Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NSINIES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			Date FSINIES = getCampoTextual(request, "FBAJA") != null ? sdf.parse(getCampoTextual(request, "FBAJA"))
					: null;
			java.sql.Date FSINIES_2 = FSINIES != null ? new java.sql.Date(FSINIES.getTime()) : null;
			/*
			 * Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON(
			 * ); logger.debug(map); listValores.put("tipPerson", (List)
			 * tratarRETURNyMENSAJES(request, map));
			 */

			// Map map =
			// pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(SPRODUC,SSEGURO,CACTIVI,NRIESGO,FSINIES_2);
			// listValores.put("causasini", (List)
			// tratarRETURNyMENSAJES(request, map));

			Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC();

			listValores.put("lstmediodec", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA();

			listValores.put("lstreclama", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC();

			listValores.put("lsttipodec", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB();

			listValores.put("lstresponsab", (List) tratarRETURNyMENSAJES(request, map));

			// Lista pases
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo vas
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();

			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CAUSASINI(SPRODUC);

			listValores.put("lstcausas", (List) tratarRETURNyMENSAJES(request, m));

			request.setAttribute("listValores", listValores);
			// Bug 18748: LCOL701-Campo fraude en alta/modificaci?n/consulta de
			// siniestros
			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1034"));
			List gestion = (List) tratarRETURNyMENSAJES(request, map3);
			request.setAttribute("lsfraudes", !isEmpty(gestion) ? gestion : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * AJAX
	 ********************************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 **/
	public void m_ajax_cargar_motivos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NSINIES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CCAUSA = getCampoNumerico(request, "CCAUSA");

			Date FSINIES = getCampoTextual(request, "FBAJA") != null ? sdf.parse(getCampoTextual(request, "FBAJA"))
					: null;
			java.sql.Date FSINIES_2 = FSINIES != null ? new java.sql.Date(FSINIES.getTime()) : null;

			Map plReturn = null;
			/*
			 * new PAC_IAX_LISTVALORES_SIN((java.sql.Connection)request.getAttribute
			 * (Constantes.DB01CONN)).
			 * ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(SPRODUC, CCAUSA, SSEGURO,
			 * CACTIVI, NRIESGO, FSINIES_2);
			 */
			List getMotivosReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);

			HashMap motivo = new HashMap();
			motivo.put("MOTIVO", motivo);
			ArrayList prueba = new ArrayList();
			prueba.add(motivo);
			ajax.guardarContenidoFinalAContenedorAjax(prueba);

			if (!isEmpty(getMotivosReturn) && getMotivosReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMotivosReturn);
				request.getSession().setAttribute("axisadm_listaAsientos", getMotivosReturn);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm008Service - mtodo m_ajax_cargar_asientos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private void cargaListaAsientos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTASIENTO(EMPRESA);

		List listaAsientos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaAsientos", listaAsientos != null ? listaAsientos : new ArrayList());
		listaAsientos = null;
	}

	// bug 0021662

	public void m_generar_resultados_maps(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String CMAPS = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISSIN006"),
							new String("RESUMEN"), null, CMAPS, CPARAMETROS);

			// formdata.put("LIST_FICHEROS",map.get("VTIMP"));

			// ini bug 0021662
			if (map != null) {
				ArrayList lista = (ArrayList) map.get("VTIMP");
				if (lista != null && lista.size() > 0) {
					Map mapafic = (Map) lista.get(0);
					Map objeto = (Map) mapafic.get("OB_IAX_IMPRESION");
					String ruta_fichero = (String) objeto.get("FICHERO");
					formdata.put("V_RUTA", ruta_fichero);
				}
			}
			// fin bug 0021662

			request.setAttribute("POST_CONSULTA", "S");
			request.setAttribute("RECARGAR", "S");

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_generar_resultados_maps", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/

	/*********************************************************************************************************************/
	public

			void m_consultarAgente(HttpServletRequest request, Axissin006Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_SIN");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			String isEdit = AxisBaseService.getCampoTextual(request, "isEdit");
			thisAction.topPila(request, "CMODO_ORI", CMODO);

			if ("true".equals(isEdit)) {
				thisAction.topPila(request, "CMODO", "MODIFICACION");
			} else {
				thisAction.topPila(request, "CMODO", CMODO);
			}
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "CAGENTE", CAGENTE);
			thisAction.topPila(request, "isEdit", "true");

			request.setAttribute("CAGENTE", CAGENTE);
			formdata.put("CAGENTE", CAGENTE);
			thisAction.topPila(request, "formdata_axissin006", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_consultarPoliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volverAgente(HttpServletRequest request, Axissin006Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("CAGENTE_SIN", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CAGENTE")));
			String CMODO = (String) thisAction.topPila(request, "CMODO_ORI");
			thisAction.topPila(request, "CMODO", CMODO);

			formdata.put("NSINIES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NSINIES")));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
			m_cargarDatos(request, thisAction);
			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_consultarPoliza(HttpServletRequest request, Axissin006Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");

			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NSINIES", NSINIES);

			thisAction.topPila(request, "formdata_axissin006", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_consultarPoliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver(HttpServletRequest request, Axissin006Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NSINIES", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "NSINIES")));
			formdata.put("SSEGURO", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SSEGURO")));
			m_cargarDatos(request, thisAction);
			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MTODOS DE ACTUALIZACIN CAMPOS DIRECCION
	 **************************/
	/*********************************************************************************************************************/

	/**
	 * Mtodo para grabar la direccin de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public void m_grabarDireccion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CTIPDIR = getCampoNumerico(request, "CTIPDIR");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION(SPERSON, CAGENTE, CDOMICI, CTIPDIR,
					CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null, null);
			if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT")))
				formdata.put("CDOMICI", map.get("PCDOMICIOUT").toString());

			request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Mtodo para grabar la citacion.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public void m_grabarCitacion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NCITACION = getCampoNumerico(request, "NCITACION");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			java.sql.Date FCITACION = this.stringToSqlDate(getCampoTextual(request, "PFCITACION"));
			String HCITACION = getCampoTextual(request, "PHCITACION");
			BigDecimal CPROVIN = getCampoNumerico(request, "PCPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "PCPOBLAC");
			BigDecimal CPAIS = getCampoNumerico(request, "PCPAIS");
			String TLUGAR = getCampoTextual(request, "PTLUGAR");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONCIT");

			String TAUDIEN = getCampoTextual(request, "TAUDIEN");
			BigDecimal CORAL = getCampoNumerico(request, "CORAL");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CRESOLU = getCampoNumerico(request, "CRESOLU");
			java.sql.Date FNUEVA = stringToSqlDate(getCampoTextual(request, "FNUEVA"));
			String TRESULT = getCampoTextual(request, "TRESULT");
			BigDecimal CMEDIO = getCampoNumerico(request, "CMEDIO");

			PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMICIT(NSINIES, NTRAMIT, NCITACION,
					SPERSON, FCITACION, HCITACION, CPAIS, CPROVIN, CPOBLAC, TLUGAR, TAUDIEN, CORAL, CESTADO, CRESOLU,
					FNUEVA, TRESULT, CMEDIO);

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006Service.m_grabarCitacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Mtodo para grabar la citacion.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public void m_delCitacion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NCITACION = getCampoNumerico(request, "NCITACION");
			String NSINIES = getCampoTextual(request, "PNSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "PNTRAMIT");

			PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_CITACION(NSINIES, NTRAMIT, NCITACION);

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006Service.m_grabarCitacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 * @throws Exception
	 */
	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");

			if (!isEmpty(CPOSTAL)) {
				CPOSTAL = CPOSTAL.toUpperCase();
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PROVINPOBLA(CPOSTAL);
				if (!isEmpty(map) && (new BigDecimal(0).equals(ajax.rellenarPlAContenedorAjax(map))
						|| new BigDecimal(2).equals(ajax.rellenarPlAContenedorAjax(map)))) {
					Map direccion = new HashMap();
					direccion.putAll(map);
					formdata.putAll(map);
					ajax.guardarContenidoFinalAContenedorAjax(direccion);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_ajax_evento(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			String CEVENTO = this.getCampoTextual(request, "CEVENTO");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(op) && op.equalsIgnoreCase("CEVENTO")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCEVENTO(CEVENTO);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map evento = new HashMap();
					evento.put("CEVENTO", CEVENTO);
					evento.put("TEVENTO", map.get("RETURN"));
					formdata.put("CEVENTO", CEVENTO);
					formdata.put("TEVENTO", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(evento);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map evento = new HashMap();
					evento.put("CEVENTO", CEVENTO);
					formdata.put("CEVENTO", CEVENTO);
					evento.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(evento);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS")) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					formdata.put("CPROVIN", CPROVIN);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					provincia.put("TPROVIN", map.get("RETURN"));
					formdata.put("CPROVIN", CPROVIN);
					formdata.put("TPROVIN", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					formdata.put("CPROVIN", CPROVIN);
					provincia.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLAC")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Mtodo que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_causa(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CODI");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC);
			List getMotivosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("T_IAX_MOTIVOS");

			if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMotivosIniReturn);
				request.getSession().setAttribute("T_IAX_MOTIVOS", getMotivosIniReturn);
			}
		} catch (Exception e) {
			logger.error("Axissin006Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Mtodo que llama a la funcin pl correspondiente para cargar los motivos (segn
	 * la causa seleccionada) de una pliza seleccionada.
	 * 
	 * @param usuario
	 * @param CCAUSA
	 * @param CRAMO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetMotivosIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCAUSA, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MOTIVOSSINI(CCAUSA, SPRODUC);
		return m;
	}

	/*********************************************************************************************************************/
	/****************************************
	 * GARGA DATOS MINIMOS PANTALLAS MODALES
	 ************************************/

	/*********************************************************************************************************************/
	public void m_del_destinatario(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_DESTINATARIO(NSINIES, NTRAMIT, CTIPDES,
					SPERSON);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - mtodo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_del_prestacion(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal NPRESTA = getCampoNumerico(request, "NPRESTA");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_PRESTAREN(NSINIES, NTRAMIT, SPERSON, CTIPDES,
					NPRESTA);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_del_prestaciones", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_danyo(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NDANO = getCampoNumerico(request, "NDANO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_DANYO(NSINIES, NTRAMIT, NDANO);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service m_del_danyo", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_localizacion(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NLOCALI = getCampoNumerico(request, "NLOCALI");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_LOCALIZACION(NSINIES, NTRAMIT, NLOCALI);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service m_del_localizacion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_del_documentacion(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUME");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMILOCALI(NSINIES, NTRAMIT,
					NDOCUME);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service m_del_localizacion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_grabarSinistre(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("GRABATA", "1");

			// joan Bug 0024964
			String pCTRAMITAD = null;

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("NSINIES_OUT", map.get("PNSINIES"));
				formdata.put("GRABAT", "0"); // guardamos, etc y no ha habido
												// error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN012Service - mtodo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_grabarPantalla(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("GRABATA", "1");

			// joan Bug 0024964
			String pCTRAMITAD = null;

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);
		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN012Service - mtodo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Mtodo que carga los datos de administracin del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_borrar_agenda(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal IDOBS = getCampoNumerico(request, "IDOBS");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_AGENDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENDA__F_DEL_OBSERVACION(IDOBS);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_borrar_personarel(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CPERSREL = getCampoNumerico(request, "CPERSREL");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_SINTRAMIPERSONAREL(NSINIES, NTRAMIT, CPERSREL);

			// Cargamos el mapa con el resultado en pantalla
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Mtodo que carga los datos de administracin del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_borrar_tramitacion(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPTRA = getCampoNumerico(request, "CTIPTRA");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMITACION(NSINIES, NTRAMIT, CTIPTRA);

			/*
			 * if (((BigDecimal)tratarRETURNyMENSAJES(request, map)).intValue() == 0){
			 * BigDecimal trami = getCampoNumerico(request,"indexTramitacio");
			 * logger.debug("----> indexTramitacio:"+trami);
			 * formdata.put("indexTramitacio",(trami.intValue()-1)); }
			 */

			// Cargamos el mapa con el resultado en pantalla
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 borrar_tramitacion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Mtodo que carga los datos de administracin del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_borrar_detallepago(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal SIDEPAG = getCampoNumerico(request, "CSIDEPAG");
			BigDecimal CTIPRES = getCampoNumerico(request, "CTIPRES");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NMOVRES = getCampoNumerico(request, "NMOVRES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJ_SINTRAM_PAGRECOB_GAR(NSINIES, NTRAMIT, CTIPPAG, SIDEPAG,
							CTIPRES, CGARANT, NMOVRES, NORDEN);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void cargarCodis(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
		Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map);

		// TRAMITACIONES[__formdata.indexTramitacio].OB_IAX_SIN_TRAMITACION.PAGOS[__formdata.indexPago].OB_IAX_SIN_TRAMI_PAGO.MOVPAGOS
		BigDecimal NTRAMIT = isEmpty(formdata.get("indexTramitacio")) ? new BigDecimal(0)
				: new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));

		if (!isEmpty(datosSiniestro.get("TRAMITACIONES"))) {
			List tram = (List) datosSiniestro.get("TRAMITACIONES");
			Map tramitacio = ((Map) ((Map) tram.get(NTRAMIT.intValue())).get("OB_IAX_SIN_TRAMITACION"));
			if (!isEmpty(tramitacio.get("PAGOS"))) {
				List pagos = (List) tramitacio.get("PAGOS");
				Map pago = (Map) pagos.get(0);
				formdata.put("SIDEPAG", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
			}

			if (!isEmpty(tramitacio.get("RECOBROS"))) {
				List pagos = (List) tramitacio.get("RECOBROS");
				Map pago = (Map) pagos.get(0);
				formdata.put("SIDEPAGRECOB", ((Map) pago.get("OB_IAX_SIN_TRAMI_PAGO")).get("SIDEPAG"));
			}

		}

		if (isEmpty(formdata.get("SIDEPAG")))
			formdata.put("SIDEPAG", new BigDecimal(0));
		if (isEmpty(formdata.get("SIDEPAGRECOB")))
			formdata.put("SIDEPAGRECOB", new BigDecimal(0));

		// s'ha d'agafar el primer SIDEPAG, el de la posici 0!

	}

	/**
	 * Mtodo que carga los datos de administracin del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_generarPago(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String pnsinies = getCampoTextual(request, "PNSINIES");
			BigDecimal pnriesgo = getCampoNumerico(request, "PNRIESGO");
			BigDecimal pntramit = getCampoNumerico(request, "PNTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "PCTIPRES");
			BigDecimal pctipgas = getCampoNumerico(request, "PCTIPGAS");
			BigDecimal pcgarant = getCampoNumerico(request, "PCGARANT");
			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");

			java.sql.Date pfsinies = null;
			java.sql.Date pfperini = null;
			java.sql.Date pfperfin = null;
			pfsinies = AxisBaseService.stringToSqlDate(getCampoTextual(request, "PFSINIES"));
			if (!isEmpty(getCampoTextual(request, "PFPERINI")) && getCampoTextual(request, "PFPERINI") != null) {
				pfperini = AxisBaseService.stringToSqlDate(getCampoTextual(request, "PFPERINI").substring(0, 10));
			}
			if (!isEmpty(getCampoTextual(request, "PFPERFIN")) && getCampoTextual(request, "PFPERFIN") != null) {
				pfperfin = AxisBaseService.stringToSqlDate(getCampoTextual(request, "PFPERFIN").substring(0, 10));
			}

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_INSERTA_PAGO(pnsinies, pnriesgo, pntramit, pctipres, pctipgas,
							pcgarant, pfsinies, pfperini, pfperfin, psproduc, pcactivi);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0)) && !isEmpty(map.get("PSIDEPAG"))) {
				BigDecimal psidepag = (BigDecimal) map.get("PSIDEPAG");
				formdata.put("SIDEPAG_OUT", psidepag);
			}

			// Cargamos el mapa con el resultado en pantalla

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 m_generarPago", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Mtodo que borra una reserva
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_delReserva(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String pnsinies = getCampoTextual(request, "PNSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "PNTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "PCTIPRES");
			BigDecimal pctipgas = getCampoNumerico(request, "PCTIPGAS");
			BigDecimal pcgarant = getCampoNumerico(request, "PCGARANT");
			BigDecimal pnmovres = getCampoNumerico(request, "PNMOVRES");
			BigDecimal psproduc = getCampoNumerico(request, "PSPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "PCACTIVI");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_ULTRESERVA(pnsinies, pntramit, pctipres, pctipgas, pnmovres,
							pcgarant, psproduc, pcactivi);

			// Cargamos el mapa con el resultado en pantalla
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 m_generarPago", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_delAmparo(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String pnsinies = getCampoTextual(request, "PNSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "PNTRAMIT");
			BigDecimal pctipres = getCampoNumerico(request, "PCTIPRES");
			BigDecimal pctipgas = getCampoNumerico(request, "PCTIPGAS");
			BigDecimal pcgarant = getCampoNumerico(request, "PCGARANT");
			BigDecimal pnmovres = getCampoNumerico(request, "PNMOVRES");
			BigDecimal psproduc = getCampoNumerico(request, "PSPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "PCACTIVI");

			// Llamamos a la parte de consulta de la funcion
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_AMPARO(pnsinies, pntramit, pcgarant, psproduc, pcactivi);

			// Cargamos el mapa con el resultado en pantalla
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 m_generarPago", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axissin006Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "DEC_SPERSON");
		try {
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			formdata.put("NSINIES_axissin006", NSINIES);
			thisAction.topPila(request, "formdata_axissin006", formdata);
			return SPERSON;

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			return SPERSON;

		}
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_per(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin006");

			if (!this.isEmpty(formdata_axissin006)) {
				formdata.putAll(formdata_axissin006);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin006"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_imprimirPago(HttpServletRequest request, HttpServletResponse response) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			String CMAPEAD = "405";

			PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_IMPRIMIR_PAGO(SIDEPAG, CMAPEAD);
			tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map.get("PNOMFICHERO"))) {
				String RUTA = map.get("PNOMFICHERO").toString();
				Map map_jasp = new PAC_IAX_LISTADO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTADO__F_GENERA_REPORT(null, usuario.getCempres(), RUTA, usuario.getCidioma(),
								CMAPEAD);
				tratarRETURNyMENSAJES(request, map_jasp);
				String nombreFichero = (String) map_jasp.get("PREPORT");
				this.tunnelFichero(request, response, nombreFichero);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - mtodo m_traspasar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	protected Map dbLeeAsegurados(HttpServletRequest request, BigDecimal NRIESGO, BigDecimal SPRODUC) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		return map;
	}

	public void m_ajax_elimnarref(HttpServletRequest request, Axissin006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal srefext = getCampoNumerico(request, "srefext");
			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_DELETE_SINREFERENCIAS(srefext);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axissin006Service ajax_elimnarref - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void initPreguntas(HttpServletRequest request, AbstractDispatchAction thisAction, Map datosSiniestro)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal pCACTIVI = this.getCampoNumerico(request, "CACTIVI");
		String[] sg = null;
		String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");
		if (SELECTEDGARANTIAS != null)
			sg = SELECTEDGARANTIAS.split("-");

		// Leer preguntas siniestro
		// Map map =
		// pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PREG_SINIESTRO(pSPRODUC,
		// pCACTIVI, SELECTEDGARANTIAS);
		List preguntas = (List) datosSiniestro.get("PREGUNTAS");

		// List preguntas = (List)tratarRETURNyMENSAJES(request, map);

		String pCPREGUN = new String();
		if (preguntas != null) {
			for (int i = 0; i < preguntas.size(); i++) {
				Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAX_SIN_PREGUNTAS");
				if (i == 0) {
					pCPREGUN += pregunta.get("CPREGUN");
				} else {
					pCPREGUN += ", " + pregunta.get("CPREGUN");
				}
			}
			// Leer respuestas siniestro
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(pCPREGUN);
			List respuestas = (List) tratarRETURNyMENSAJES(request, map);

			// Mezclar las respuestas con las preguntas iniciales
			inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");

			preguntas = separaBloques(preguntas);

			request.getSession().setAttribute("axissin_preguntasSiniestro", preguntas);

			request.getSession().setAttribute("axissin_respuestasSiniestro",
					((respuestas == null) ? new ArrayList() : respuestas));

			preguntas = null;
		}
	}

	/*** Anade una linea en blanco cuando las preguntas cambian de bloque *****/
	private List separaBloques(List preguntas) {
		BigDecimal nbloque_ant = new BigDecimal(0);
		ArrayList preguntas_separadas = new ArrayList();
		HashMap bloque = new HashMap();
		for (int i = 0; i < preguntas.size(); i++) {
			Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAX_SIN_PREGUNTAS");
			if (pregunta.get("CPREGUN") != null) {
				if (i == 0) {
					nbloque_ant = (BigDecimal) pregunta.get("NBLOQUE");
				}
				if (pregunta.get("NBLOQUE").equals(nbloque_ant)) {
					preguntas_separadas.add(pregunta);
				} else {
					bloque = new HashMap();
					bloque.put("NBLOQUE", (BigDecimal) pregunta.get("NBLOQUE"));
					bloque.put("CPREGUN", "<br/>");
					preguntas_separadas.add(bloque);
					preguntas_separadas.add(pregunta);
				}
				nbloque_ant = (BigDecimal) pregunta.get("NBLOQUE");
			}
		}

		return preguntas_separadas;
	}

	private void cargarListasLocalizacion(HttpServletRequest request) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		if (!isEmpty((Map) formdata.get("listvalores"))) {
			listValores = (Map) formdata.get("listvalores");
		}

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Lista pases
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista tipo vas
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
		listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

		// Lista Cdigo Va predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800042));
		listValores.put("lstCodViaPrevio", (List) tratarRETURNyMENSAJES(request, map));

		// Lista Literal predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
		listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

		// Bis predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
		listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientacin predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
		listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

		// Literal predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
		listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientacin predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
		listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

		// Cod. Orientacin predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
		listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

		// Detalle predio
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
		listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);
	}

	// AAC_INI:0033798: POSPT500-POSADM/POSSIN: Incidencia cruce de siniestros
	// VS cartera (bug hermano interno)
	public void m_ajax_valida_compensacion(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		List retorno = new ArrayList();
		Map r = new HashMap();
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal PIDRES = getCampoNumerico(request, "IDRES");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = usuario.getCempres();
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("COMPENSACION_DEUDA"), CEMPRES);
			if (!isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, m)))
					&& ((BigDecimal) tratarRETURNyMENSAJES(request, m)).equals(new BigDecimal(1))) {
				PAC_IAX_SIN_COMPENSACIONES pac_axis_sincompensaciones = new PAC_IAX_SIN_COMPENSACIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_sincompensaciones.ejecutaPAC_IAX_SIN_COMPENSACIONES__F_VALIDA_COMPENSACION_RESERVA(
						SSEGURO, NRIESGO, NSINIES, PIDRES);
				if (!isEmpty(map) && ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					r.put("PTLITERA", map.get("PTLITERA"));
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_ajax_valida_compensacion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			r.put("IDRES", getCampoNumerico(request, "IDRES"));
			retorno.add(r);
			ajax.guardarContenidoFinalAContenedorAjax(retorno);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_compensacion_pagos(HttpServletRequest request, Axissin006Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal PIDRES = getCampoNumerico(request, "IDRES");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			PAC_IAX_SIN_COMPENSACIONES pac_axis_sincompensaciones = new PAC_IAX_SIN_COMPENSACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_sincompensaciones.ejecutaPAC_IAX_SIN_COMPENSACIONES__F_COMPENSA_RESERVA_PAGOSAUT(SSEGURO,
					NRIESGO, NSINIES, NTRAMIT, PIDRES);
			if (!isEmpty(map) && ((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha
													// habido error
			}
			if (map.get("RETURN").equals(new BigDecimal(0)) && !isEmpty(map.get("PTLITERA"))) {
				String compensado_out = (String) map.get("PTLITERA");
				formdata.put("COMPENSADO_OUT", compensado_out);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_compensacion_pagos", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cargarJudicial(HttpServletRequest request, Axissin006Action thisAction) {
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT");

			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_JUDICIALES(NSINIES, NTRAMIT);
			if (mapObjTramite != null)
				formdata.put("T_IAX_JUDICIAL", (List) tratarRETURNyMENSAJES(request, mapObjTramite));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo cargarJudicial", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_borrarProceso(HttpServletRequest request, Axissin006Action thisAction) {
		try {
			BigDecimal CTIPO = this.getCampoNumerico(request, "TIPO_DEL");
			String NSINIES = getCampoTextual(request, "NSINIES_RES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT_RES");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN_RES");
			BigDecimal NVALOR = null;
			if (CTIPO.equals(new BigDecimal(2)) || CTIPO.equals(new BigDecimal(3)))
				NVALOR = this.getCampoNumerico(request, "NVALOR");
			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_JUDICIAL(CTIPO, NSINIES,
					NTRAMIT, NORDEN, NVALOR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo cargarJudicial", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Mtodo se encarga de eliminar un documento asociado a la tramitacin
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_borrar_sin_trami_doc(HttpServletRequest request, Axissin006Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String NSINIES = this.getCampoTextual(request, "NSINIESDEL");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMITDEL");
			BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUMEDEL");
			Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMI_DOC(NSINIES, NTRAMIT, NDOCUME);

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axissin006 borrar_sin_trami_doc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_cargarFiscal(HttpServletRequest request, Axissin006Action thisAction) {
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT");

			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_PROCESOS_FISCALES(NSINIES, NTRAMIT);
			if (mapObjTramite != null)
				formdata.put("T_IAX_FISCAL", (List) tratarRETURNyMENSAJES(request, mapObjTramite));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo cargarFiscal", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_borrarProcesoFiscal(HttpServletRequest request, Axissin006Action thisAction) {
		try {
			BigDecimal CTIPO = this.getCampoNumerico(request, "TIPO_DEL");
			String NSINIES = getCampoTextual(request, "NSINIES_RES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT_RES");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN_RES");
			BigDecimal NVALOR = null;
			if (CTIPO.equals(new BigDecimal(2)))
				NVALOR = this.getCampoNumerico(request, "NVALOR");
			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_FISCAL(CTIPO, NSINIES,
					NTRAMIT, NORDEN, NVALOR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - mtodo m_borrarProcesoFiscal", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
