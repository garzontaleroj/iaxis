//Revision:# rzPctaAeDsUZ/nqcIfCUvg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_MENU;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_FORMULA;
import axis.jdbc.PAC_IAX_TRAMITADORES;
import axis.jdbc.PAC_IAX_VALIDACIONES_SIN;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin032Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;
import oracle.sql.DATE;

/* Ventana buscador de siniestros:
 * Al entrar en consulta de siniestros nos salta la pantalla modal axissin002 de
 * búsqueda de siniestro. Se podrá buscar por los siguientes parámetros:
 *   DATOS POLIZA
 *   ?	Num. Póliza - NPOLIZA
 *   ?	Certificado - NCERTIF
 *   ?  Fecha efecto - FEFECTO
 *   ?  Fecha vencimiento - FVENCIM
 *   ?  Fecha anulacion - FANULAC
 *   ?  Situación - CSITUAC
 *   DATOS RECIBO
 *   ?  Num recibo - NRECIBO
 *   ?  Fecha efecto - FEFECTO_REC   real:FEFECTO
 *   ?  Fecha vencimiento - FVENCIM_REC
 *   ?  Importe - ICONCEP
 *   ?  Situación - CESTREC
 *   DATOS SINIESTRO
 *   ?	Siniestro - NSINIES
 *   ?  Tramitador - CTRAINT / CTRAEXT
 *   ?	Situación - CESTSIN
 *   ?  Fecha Ocurrecia - FSINIES
 *   ?  Hora de ocurrencia - HSINIES???
 *   ?  Fecha recepcion - FNOTIFI
 *   ?  Causas - CCAUSIN
 *   ?  Motivo - CMOTSIN
 *   ?  Responsabilidad - CCULPAB???
 *   ?  Zona de ocurrencia - ???
 *
 * ninguno de estos parámetros de búsqueda es obligatorio.
 * Si no se introduce ninguno de estos parámetros, el buscador mostrará toda
 * la lista de pólizas-siniestros
 *                                                               (**) Nombres aún por establecer

*/

public class Axissin032Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Método que llama a la función pl correspondiente para cargar los datos de una
	 * póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		return (Map) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * 
	 * Método que llama a la función pl correspondiente para cargar los TOMADORES de
	 * una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolTomadores(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(SSEGURO);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar los RIESGOS de
	 * una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolRiesgos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS(SSEGURO, null);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar los datos del
	 * último recibo cargado una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolLastRecibo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO(SSEGURO);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	public BigDecimal obtenerAsistencia(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, BigDecimal CCAUSIN, BigDecimal CMOTSIN, java.sql.Date FSINIES) throws Exception {
		BigDecimal ASISTENCIA = null;
		this.formattingNumericValues(request);
		if (SSEGURO != null && NRIESGO != null && CCAUSIN != null && CMOTSIN != null && FSINIES != null) {
			Map mapa_res_asist = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_HAY_ASISTENCIA(SSEGURO, NRIESGO, CCAUSIN, CMOTSIN, FSINIES);

			BigDecimal result_asist = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_res_asist);
			if (result_asist.intValue() == 0) {
				BigDecimal HAY_ASISTENCIA = (BigDecimal) mapa_res_asist.get("PHAY_ASISTENCIA");
				ASISTENCIA = HAY_ASISTENCIA;
			} else {
				ASISTENCIA = new BigDecimal("0");
			}
		} else {
			ASISTENCIA = new BigDecimal("0"); // No se muestra por que no se cumple - hay params a null
		}

		return ASISTENCIA;
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las causas de
	 * una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCausasIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC, BigDecimal CACTIVI,
			BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(SPRODUC, CACTIVI, SSEGURO);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar los motivos
	 * (según la causa seleccionada) de una póliza seleccionada.
	 * 
	 * @param usuario
	 * @param CCAUSA
	 * @param CRAMO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetMotivosIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCAUSA, BigDecimal CACTIVI,
			BigDecimal SPRODUC, BigDecimal SSEGURO) throws Exception {

		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(SPRODUC, CCAUSA, CACTIVI, SSEGURO);
		return m;
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las
	 * responsabilidades de una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetResponsabilidadIni(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI();
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las
	 * garantias(según el riesgo seleccionado y la fecha de ocurrencia añadida) de
	 * una póliza seleccionada.
	 * 
	 * @param usuario
	 * @param SSEGURO
	 * @param NRIESGO
	 * @param FSINIES
	 * @return
	 * @throws Exception
	 */
	private Map dbGetPolGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, BigDecimal CCAUSIN, BigDecimal CMOTSIN, DATE FSINIES, BigDecimal CTRAMIT)
			throws Exception {

		// Bug 0020472 - JMF - 09/12/2011: afegir porigen
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS(SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
						new java.sql.Date(FSINIES.dateValue().getTime()), new BigDecimal(0), CTRAMIT, null, null, null);

		return m;
	}

	private List dbGetPolAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal SPRODUC) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	/**
	 * 
	 * Método que llama a la función pl correspondiente para cargar los CONDUCTORES
	 * de una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolConductores(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_CONDUCTORES(NRIESGO);
		return (List) tratarRETURNyMENSAJES(request, m, false);
	}

	private void dbInicializaPol(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		// Inicializar flujo
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		tratarRETURNyMENSAJES(request, map, false);
	}

	private Map dbGetRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);
		return (Map) tratarRETURNyMENSAJES(request, map, false);
	}
	/*
	 * Método que se llama al inicio de este flujo.
	 *
	 * @param request
	 * 
	 * @param thisAction
	 */

	public void m_init(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			request.getSession().removeAttribute("SIN_ALTA_AVISO");
			request.getSession().removeAttribute("SIN_ALTA_GESTION");
			request.getSession().removeAttribute("mensajeAltaSinVentanaModal");

			if (SSEGURO != null) {
				Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);
				String NSINIES = null;
				if ((!isEmpty(datPolizaReturn)) && (datPolizaReturn.get("CACTIVI") != null)
						&& (datPolizaReturn.get("SPRODUC") != null)) {
					BigDecimal SPRODUC = (BigDecimal) datPolizaReturn.get("SPRODUC");
					BigDecimal CACTIVI = (BigDecimal) datPolizaReturn.get("CACTIVI");
					Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZASINIESTRO(SPRODUC, CACTIVI, NSINIES);
					tratarRETURNyMENSAJES(request, m, false);
					Map m4 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
					Map m5 = (Map) this.tratarRETURNyMENSAJES(request, m4, false);
					NSINIES = (String) m5.get("NSINIES");
				}
				formdata.put("NSINIES", NSINIES);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Método que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la póliza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin032Action thisAction) {
		this.formattingNumericValues(request);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		request.getSession().setAttribute("SSEGURO", SSEGURO);

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		request.getSession().setAttribute("SPRODUC", SPRODUC);
		Map objetoPantalla = new HashMap();

		try {
			if (SSEGURO != null) {

				// AB bug 4713 muestra nombre agente y sucursal
				BigDecimal agente = this.getAgentePoliza(request, SSEGURO + "");
				objetoPantalla.put("CAGENTE_SIN", agente);
				Map m = (Map) this.ActualizaAgente(request, agente);
				List agentesDatos = (List) m.get("RETURN");
				Map mapAgentes = (Map) agentesDatos.get(0);
				objetoPantalla.putAll(mapAgentes);

				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));

				if ("true".equals(getCampoTextual(request, "LIMPIAR_DATOS"))) {
					// Reinicializar formdata
					Object[] keySet = formdata.keySet().toArray();
					for (int i = 0; i < keySet.length; i++) {
						formdata.remove(keySet[i]);
					}
					formdata.put("SSEGURO", SSEGURO);
					formdata.put("SPRODUC", SPRODUC);
					request.getSession().removeAttribute("T_IAX_MOTIVOS");
					request.getSession().removeAttribute("T_IAX_GARANTIAS");
				}

				Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);

				if (!isEmpty(datPolizaReturn))
					objetoPantalla.putAll(datPolizaReturn);

				if (isEmpty(formdata.get("FNOTIFI")))
					objetoPantalla.put("FNOTIFI", new Date());

				if (isEmpty(formdata.get("HSINIES")))
					objetoPantalla.put("HSINIES", new String());

				formdata.putAll(objetoPantalla);
				this.cargarInfo(request, thisAction);
				this.m_tipoGarantia(request, thisAction);

				if ((isEmpty(SPRODUC) && !isEmpty(formdata.get("SPRODUC")))
						|| !SPRODUC.equals(formdata.get("SPRODUC"))) {
					SPRODUC = (BigDecimal) formdata.get("SPRODUC");
				}
				if (!isEmpty(SPRODUC))
					AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);

				// Recuperamos las empresas
				Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
				List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
				formdata.put("CIAS", listacias);
				// Bug 18748: LCOL701-Campo fraude en alta/modificaci?n/consulta de siniestros
				Map map3 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1034"));
				List gestion = (List) tratarRETURNyMENSAJES(request, map3);
				request.setAttribute("lsfraudes", !isEmpty(gestion) ? gestion : new ArrayList());

				/* validacion de innomidados */
				BigDecimal NRIESGO = (BigDecimal) formdata.get("NRIESGO");
				if (SPRODUC != null && NRIESGO != null && SSEGURO != null) {
					Map map4 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(SPRODUC, SSEGURO, NRIESGO);
					// BigDecimal valInomidados = (BigDecimal)map4.get("RETURN");
					this.tratarRETURNyMENSAJES(request, map4, false);
					BigDecimal valInomidados = (BigDecimal) map4.get("PNASEGUR");
					if (valInomidados != null) {
						formdata.put("VALINNOMIDADOS", valInomidados);
					}
				}

				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
				Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(datosSiniestro)) {
					ArrayList lista_ref = (ArrayList) datosSiniestro.get("REFERENCIAS");
					formdata.put("REFERENCIAS", lista_ref);
				}
				// Añadimos datosSiniestro en el Map formdata para poder mostrarlos en la vista
				Map OB_IAX_SINIESTRO = new HashMap();
				OB_IAX_SINIESTRO.putAll(datosSiniestro);
				// ini bug 0022153
				/* Cargamos los documentos */
				String NSINIES = (String) datosSiniestro.get("NSINIES");
				if (NSINIES != null) {
					Map map_sintradoc = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINTRADOC(NSINIES, null);
					tratarRETURNyMENSAJES(request, map_sintradoc);
					formdata.put("DOCUMENTOS", map_sintradoc.get("T_DOCUME"));
				}
				// fin bug 0022153

				BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
				PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				if (!isEmpty(CPAIS)) {
					map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
					if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
						formdata.put("TPAIS", map.get("RETURN"));
					}
				}
				if (!isEmpty(CPROVIN)) {
					map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
					if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
						formdata.put("TPROVIN", map.get("RETURN"));
					}

				}
				if (!isEmpty(CPOBLAC)) {
					map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);

					if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
						formdata.put("TPOBLAC", map.get("RETURN"));
					}

				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarInfo(HttpServletRequest request, Axissin032Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Bug 0024964
			PAC_IAX_TRAMITADORES pac_axis_tramitadores = new PAC_IAX_TRAMITADORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDEC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CMOTSIN = getCampoNumerico(request, "motivos");
			BigDecimal CCAUSIN = getCampoNumerico(request, "causas");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal CAGENTE_SESSION = usuario.getCagente();
			formdata.put("CAGENTE_SESSION", CAGENTE_SESSION);

			// Bug 0024964
			String CTRAMITAD = getCampoTextual(request, "CTRAMITAD");
			if (isEmpty(SSEGURO))
				SSEGURO = new BigDecimal((String) request.getSession().getAttribute("SSEGURO"));
			List polTomadoresReturn = this.dbGetPolTomadores(request, usuario, SSEGURO);
			formdata.put("T_IAX_TOMADORES", polTomadoresReturn);

			if (!isEmpty(CTIPDEC)) {

				if (CTIPDEC.intValue() == 1 || CTIPDEC.intValue() == 2) {
					dbInicializaPol(request, usuario, SSEGURO);
					Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);

					List polAsegReturn = (List) OB_IAX_RIESGOS.get("RIESGOASE");
					formdata.put("T_IAX_ASEGURADOS", polAsegReturn);
				} else {
					if (CTIPDEC.intValue() == 3) {
						dbInicializaPol(request, usuario, SSEGURO);

						Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);
						List polConductoresReturn = (List) OB_IAX_RIESGOS.get("RIESAUTOS");
						formdata.put("T_IAX_CONDUCTORES", polConductoresReturn);
					}
				}
			}

			/*
			 * *****************************************************************************
			 * **
			 */
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));

			BigDecimal HAY_ASISTENCIA = obtenerAsistencia(request, usuario, SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
					FSINIES);

			request.setAttribute("HAY_ASISTENCIA", HAY_ASISTENCIA);

			/*
			 * *****************************************************************************
			 * **
			 */

			List polRiesgosReturn = this.dbGetPolRiesgos(request, usuario, SSEGURO);

			formdata.put("T_IAX_RIESGOS", polRiesgosReturn);
			formdata.put("SIZE_RIESGOS",
					((isEmpty(polRiesgosReturn)) ? new Integer(0) : new Integer(polRiesgosReturn.size())));

			formdata.put("NRIESGO",
					((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
							? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("NRIESGO")
							: null);
			formdata.put("TRIESGO",
					((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
							? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("TRIESGO")
							: null);
			formdata.put("RIESGOASE",
					((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
							? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("RIESGOASE")
							: null);

			formdata.put("NRIESGO_OUT", formdata.get("NRIESGO"));

			List polLastRecibo = this.dbGetPolLastRecibo(request, usuario, SSEGURO);
			formdata.put("T_IAX_LASTRECIBO", polLastRecibo);

			List getCausasIniReturn = this.dbGetCausasIni(request, usuario, (BigDecimal) formdata.get("SPRODUC"),
					(BigDecimal) formdata.get("CACTIVI"), SSEGURO);
			formdata.put("T_IAX_CAUSAS", getCausasIniReturn);

			// Inicialmente no hay motivos (depende de una causa seleccionada)
			if (formdata.get("motivos") == null || formdata.get("motivos") == "null")
				formdata.put("T_IAX_MOTIVOS", null);

			List getResponsabilidadIniReturn = this.dbGetResponsabilidadIni(request, usuario);
			formdata.put("T_IAX_RESPONSABILIDAD", getResponsabilidadIniReturn);

			if (!isEmpty(request.getSession().getAttribute("T_IAX_GARANTIAS"))
					&& !isEmpty(getCampoTextual(request, "selectedGarantias"))) {
				// Establecer seleccionados
				List T_IAX_GARANTIAS = (List) request.getSession().getAttribute("T_IAX_GARANTIAS");
				String[] CGARANT = getCampoTextual(request, "selectedGarantias").split("-");
				for (int i = 0; i < T_IAX_GARANTIAS.size(); i++) {
					inner: for (int j = 0; j < CGARANT.length; j++) {
						if (((BigDecimal) ((Map) T_IAX_GARANTIAS.get(i)).get("CGARANT")).intValue() == Integer
								.valueOf(CGARANT[j]).intValue()) {
							((Map) T_IAX_GARANTIAS.get(i)).put("SELECTEDGARANTIA", new Boolean(true));
							break inner;
						} else {
							((Map) T_IAX_GARANTIAS.get(i)).put("SELECTEDGARANTIA", new Boolean(false));
						}

					}
				}

			} else {
				if (!isEmpty(request.getSession().getAttribute("T_IAX_GARANTIAS"))) {

					List T_IAX_GARANTIAS = (List) request.getSession().getAttribute("T_IAX_GARANTIAS");
					for (int i = 0; i < T_IAX_GARANTIAS.size(); i++) {
						((Map) T_IAX_GARANTIAS.get(i)).put("SELECTEDGARANTIA", new Boolean(false));
					}
				}
			}

			Map m = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_DESUNITRADEFECTE(usuario.getCusuari(), SSEGURO,
					CCAUSIN, CMOTSIN, NSINIES, null);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() == 0) {
				formdata.put("CUNITRA", m.get("PCUNITRA"));
				formdata.put("CTRAMIT", m.get("PCTRAMIT"));
				formdata.put("TTRAMIT", m.get("PTTRAMIT"));
				formdata.put("TUNITRA", m.get("PTUNITRA"));
			}

			Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC();
			listValores.put("lstmediodec", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA();
			listValores.put("lstreclama", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC();
			listValores.put("lsttipodec", (List) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTNIVELSINI();
			listValores.put("nivSinies", (List) tratarRETURNyMENSAJES(request, map, false));

			// Bug 0024964
			map = pac_axis_tramitadores.ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR_ALTA(null);
			listValores.put("listaTramitadores", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo vías
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Código Vía predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800042));
			listValores.put("lstCodViaPrevio", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

			// Bis predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
			listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientación predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

			// Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientación predio
			// Cod. Orientación predio
			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PER_BISLETRA", usuario.getCempres());
			BigDecimal valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (valor == null)
				valor = new BigDecimal(800046);

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(valor);
			listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientación predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

			// Detalle predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
			listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

			// Lista países
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("listvalores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método cargarInfor", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_hayInnominados(HttpServletRequest request, Axissin032Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SSEGURO = (BigDecimal) request.getSession().getAttribute("SSEGURO");
		BigDecimal SPRODUC = (BigDecimal) request.getSession().getAttribute("SPRODUC");
		if (SPRODUC == null) {
			SPRODUC = getCampoNumerico(request, "SPRODUC");
		}
		BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

		try {
			if (SPRODUC != null && NRIESGO != null && SSEGURO != null) {

				Map map4 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(SPRODUC, SSEGURO, NRIESGO);

				this.tratarRETURNyMENSAJES(request, map4, false);
				BigDecimal valInnomidados = (BigDecimal) map4.get("PNASEGUR");
				if (valInnomidados != null) {

					Map valInno = new HashMap();
					valInno.put("VALINNOMIDADOS", valInnomidados);

					ajax.rellenarPlAContenedorAjax(valInno);
					ajax.guardarContenidoFinalAContenedorAjax(valInno);

				} else {

					Map valInno = new HashMap();
					valInno.put("VALINNOMIDADOS", 0);

					ajax.rellenarPlAContenedorAjax(valInno);
					ajax.guardarContenidoFinalAContenedorAjax(valInno);

				}
			}
		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_hayInnominados - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	/**
	 * TODO -Para efectuar la demo del dia 08-01-08, este método pasa temporalmente
	 * a ser de http request/response. Deberemos en js vaciar todo el displayTag
	 * para evitar que las garantias antiguas continuen en pantalla (cuando queramos
	 * cambiar fecha).
	 * 
	 * Método que se llama al cambiar la fecha de siniestro si y sólo si hay un
	 * riesgo seleccionado. Con ésto, cargamos las garantias asociadas a la póliza
	 * seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cambiar_fecha_siniestro(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "SRIESGO");
			DATE FSINIES = new DATE(ConversionUtil.getTimeStamp(getCampoTextual(request, "FSINIES")));
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			Map plGetPolGarantiasReturn = this.dbGetPolGarantias(request, usuario, SSEGURO, NRIESGO, CCAUSIN, CMOTSIN,
					FSINIES, CTRAMIT);
			List getPolGarantiasReturn = (List) ajax.rellenarPlAContenedorAjax(plGetPolGarantiasReturn);

			request.getSession().removeAttribute("T_IAX_GARANTIAS");
			if (!isEmpty(getPolGarantiasReturn)) {
				ajax.guardarContenidoFinalAContenedorAjax(getPolGarantiasReturn);
				request.getSession().setAttribute("T_IAX_GARANTIAS", getPolGarantiasReturn);
			}

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_cambiar_fecha_siniestro - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Método que se llama para actualizar todos los cambio porducidos en la
	 * pantalla y, posteriormente, dar de alta el nuevo siniestro.
	 * 
	 * @param request
	 */
	public void m_aceptar_siniestro(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String[] sg = null;
		String[] sd = null;
		this.formattingNumericValues(request);
		try {
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "SRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			java.sql.Date FNOTIFI = this.stringToSqlDate(getCampoTextual(request, "FNOTIFI"));
			java.sql.Date FDETECCION = this.stringToSqlDate(getCampoTextual(request, "FDETECCION"));

			// Evento
			String CEVENTO = getCampoTextual(request, "CEVENTO");
			// Reclamación
			BigDecimal CRECLAMA = getCampoNumerico(request, "CRECLAMA");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			// Bug 0024964
			String pCTRAMITAD = getCampoTextual(request, "CTRAMITAD");

			String HSINIES = getCampoTextual(request, "HSINIES");
			BigDecimal CMOTSIN = getCampoNumerico(request, "motivos");
			BigDecimal CCAUSIN = getCampoNumerico(request, "causas");
			BigDecimal CCULPAB = getCampoNumerico(request, "responsabilidad");
			String TZONAOCU = getCampoTextual(request, "TZONAOCU");
			String TSINIES = getCampoTextual(request, "TSINIES");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal CMEDDEC = getCampoNumerico(request, "CMEDDEC");
			BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDEC");
			BigDecimal CAGENTE_SEL = getCampoNumerico(request, "CAGENTE");
			String TNOMDEC = getCampoTextual(request, "TNOMDEC");
			String TNOM1DEC = getCampoTextual(request, "TNOM1DEC");
			String TNOM2DEC = getCampoTextual(request, "TNOM2DEC");
			String TAPE1DEC = getCampoTextual(request, "TAPE1DEC");
			String TAPE2DEC = getCampoTextual(request, "TAPE2DEC");
			String TTELDEC = getCampoTextual(request, "TTELDEC");
			String TMOVILDEC = getCampoTextual(request, "TMOVILDEC");
			String TEMAILDEC = getCampoTextual(request, "TEMAILDEC");
			String NNUMIDE = getCampoTextual(request, "NNUMIDEDEC");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CNIVEL = getCampoNumerico(request, "CNIVEL");
			BigDecimal SPERSON2 = getCampoNumerico(request, "SPERSON2");
			java.sql.Date FECHAPP = this.stringToSqlDate(getCampoTextual(request, "FECHAPP"));
			BigDecimal SPERSONDEC = getCampoNumerico(request, "SPERSONDEC");

			String NSINCIA = getCampoTextual(request, "NSINCIA");
			String NPRESIN = getCampoTextual(request, "NPRESIN");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String CPOLCIA = getCampoTextual(request, "CPOLCIA");
			BigDecimal IPERIT = getCampoNumerico(request, "IPERIT");
			BigDecimal CFRAUDE = getCampoNumerico(request, "CFRAUDE");

			BigDecimal CTIPIDE = isEmpty(getCampoNumerico(request, "CTIPIDEDEC"))
					? getCampoNumerico(request, "CTIPIDE_AUX")
					: getCampoNumerico(request, "CTIPIDEDEC");

			String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");

			BigDecimal pNDIAS = getCampoNumerico(request, "NDIASBAJA") == null ? getCampoNumerico(request, "DIAS")
					: getCampoNumerico(request, "NDIASBAJA");

			BigDecimal SINSOLIDARIDAD = getCampoNumerico(request, "SOLIDARIDAD");

			boolean ok = true;

			if (SELECTEDGARANTIAS != null)
				sg = SELECTEDGARANTIAS.split("-");
			BigDecimal icapi = BigDecimal.ZERO;

			Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_INICIALIZA_GARANTIAS();
			this.tratarRETURNyMENSAJES(request, m, false);

			if (sg != null) {

				for (int i = 0; i < sg.length; i++) {
					List<Map> garan = (List<Map>) request.getSession().getAttribute("T_IAX_GARANTIAS");
					if (!isEmpty(stringToBigDecimal(sg[i]))) {

						for (Map map : garan) {
							if (((BigDecimal) map.get("CGARANT"))
									.intValue() == (stringToBigDecimal(sg[i]).intValue())) {

								m = new PAC_IAX_VALIDACIONES_SIN(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_DECLARANTE(SSEGURO, CTIPDEC,
												((BigDecimal) map.get("CGARANT")));

								if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
									ok = false;
									break;
								}

								usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
								BigDecimal CEMPRES = usuario.getCempres();

								java.sql.Date FINIBAJA;
								java.sql.Date FFINBAJA;

								FINIBAJA = this.stringToSqlDate(getCampoTextual(request, "FINIBAJA"));
								// FFINBAJA=this.stringToSqlDate(getHiddenCampoTextual(request,
								// "HFFINBAJA"));//el param HFFINBAJA no se está enviando.
								FFINBAJA = this.stringToSqlDate(getCampoTextual(request, "FFINBAJA"));

								request.getSession().setAttribute("FFINBAJA", FFINBAJA);

								m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("VAL_ALTA_SIN"),
										CEMPRES);

								if (this.tratarRETURNyMENSAJES(request, m, false) != null
										&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false))
												.intValue() == 1) {
									m = new PAC_IAX_VALIDACIONES_SIN(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_GARANTIA(SSEGURO, NRIESGO,
													((BigDecimal) map.get("CGARANT")), pNDIAS, FSINIES, FINIBAJA,
													FFINBAJA, "axissin032_previo");

									if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
										ok = false;
										break;
									}
								}

								BigDecimal ICAPITAL = new BigDecimal(0);
								BigDecimal CGARANT = new BigDecimal(0);
								String TGARANT = new String();

								ICAPITAL = (BigDecimal) map.get("ICAPITAL");
								CGARANT = (BigDecimal) map.get("CGARANT");
								TGARANT = (String) map.get("TGARANT");

								BigDecimal numdiasbaja = new BigDecimal(1);
								m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PARGARANPRO_N(SPRODUC, CACTIVI, CGARANT,
										"BAJA");
								int paramBaja = (BigDecimal) this.tratarRETURNyMENSAJES(request, m, false) == null ? 0
										: ((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue();
								if (paramBaja == 1) {
									numdiasbaja = pNDIAS;
								}

								icapi = (ICAPITAL.multiply(numdiasbaja)).add(icapi);

								m = new PAC_IAX_SINIESTROS(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_GARANTIAS(null, CGARANT, ICAPITAL,
												TGARANT);

								if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
									ok = false;
									break;
								}
							}
						}
					}
				}
			}
			if (ok) {

				BigDecimal ICAPI = icapi;

				String SELECTEDDOCUMENTACION = getCampoTextual(request, "SELECTEDDOCUMENTACION");
				if (SELECTEDDOCUMENTACION != null)
					sd = SELECTEDDOCUMENTACION.split("-");

				String NSINIESBis = NSINIES;

				BigDecimal CCARPETA = getCampoNumerico(request, "CCARPETA");

				if (CCARPETA == null) {
					CCARPETA = new BigDecimal("0");
				}

				BigDecimal ASISTENCIA = getCampoNumerico(request, "ASISTENCIA");

				if (ASISTENCIA == null) {
					ASISTENCIA = new BigDecimal("0");
				}

				// ini bug 0024675
				BigDecimal CSALVAM = getCampoNumerico(request, "CSALVAM");

				if (CSALVAM == null) {
					CSALVAM = new BigDecimal("0");
				}
				// fin bug 0024675

				Map m2 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(null, SSEGURO, NRIESGO, null, FSINIES,
								HSINIES, FNOTIFI, CCAUSIN, CMOTSIN, CEVENTO, CCULPAB, CRECLAMA, null, CMEDDEC, CTIPDEC,
								TNOMDEC, TNOM1DEC, TNOM2DEC, TAPE1DEC, TAPE2DEC, TTELDEC, TMOVILDEC, TEMAILDEC, TSINIES,
								null, NNUMIDE, SPERSONDEC, NSINCIA, CCOMPANI, NPRESIN, CNIVEL, SPERSON2, FECHAPP,
								CPOLCIA, IPERIT, CFRAUDE, CCARPETA, ASISTENCIA, CAGENTE_SEL, CMODO, CSALVAM, ICAPI,
								FDETECCION, SINSOLIDARIDAD, null);

				if (CMODO != null && CMODO.equals("PRE_SINIESTROS")) {
					Map m6 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_UPDATE_PRESINIESTROS(CMODO);

				}

				Map m4 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
				Map m5 = (Map) this.tratarRETURNyMENSAJES(request, m4, false);
				NSINIESBis = (String) m5.get("NSINIES");
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m2, false)).intValue() == 0) {

					String TLOCALI = isEmpty(this.getCampoTextual(request, "TLOCALI")) ? null
							: this.getCampoTextual(request, "TLOCALI");
					BigDecimal CSIGLAS = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CSIGLAS");
					BigDecimal NNUMVIA = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "NNUMVIA");
					String TNOMVIA = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "TNOMVIA");
					String TCOMPLE = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "TCOMPLE");

					BigDecimal CPAIS = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPAIS");
					BigDecimal CPROVIN = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPROVIN");
					BigDecimal CPOBLAC = !isEmpty(TLOCALI) ? null : getCampoNumerico(request, "CPOBLAC");
					String CPOSTAL = !isEmpty(TLOCALI) ? null : this.getCampoTextual(request, "CPOSTAL");
					if (!isEmpty(CPOSTAL))
						CPOSTAL = CPOSTAL.toUpperCase();

					// Bug 18940/92686 - 29/09/2011 - AMC
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
					String TNUM3IA = getCampoTextual(request, "TNUM3IA");
					String LOCALIDAD = getCampoTextual(request, "LOCALIDAD");

					if (TZONAOCU != null) {
						Map m3 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(NSINIESBis, BigDecimal.ZERO,
										null, null, null, null, null, null, TZONAOCU, null, null, null, null, null,
										null, null, null, null, null, null, null, null, null, null, null, null, null,
										null, null, null/* IAXIS-4961 EAD:13/08/2020 CCONTABLE */);
						this.tratarRETURNyMENSAJES(request, m3, false);
					}
					// IAXIS-2171 AABC Validacion de poblacion.
					if (!isEmpty(CSIGLAS) || !isEmpty(CVIAVP) || !isEmpty(TLOCALI) || !isEmpty(CPOBLAC)) {

						Map m3 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(NSINIESBis, BigDecimal.ZERO,
										null, null, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, TLOCALI, CPAIS, CPROVIN,
										CPOBLAC, CPOSTAL, CVIAVP, CLITVP, CBISVP, CORVP, NVIAADCO, CLITCO, CORCO,
										NPLACACO, COR2CO, CDET1IA, TNUM1IA, CDET2IA, TNUM2IA, CDET3IA, TNUM3IA,
										LOCALIDAD, null/* IAXIS-4961 EAD:13/08/2020 CCONTABLE */);

						this.tratarRETURNyMENSAJES(request, m3, false);

					}

					if (!isEmpty(getCampoTextual(request, "NNUMIDEASEG_IN"))) {
						String NNUMIDEASEG_IN = getCampoTextual(request, "NNUMIDEASEG_IN");
						BigDecimal CTIPIDEASEG_IN = getCampoNumerico(request, "CTIPIDEASEG_IN");
						BigDecimal SPERSONASEG_IN = getCampoNumerico(request, "SPERSONASEG_IN");
						String TNOM1ASEG_IN = getCampoTextual(request, "TNOM1ASEG_IN");
						String TNOM2ASEG_IN = getCampoTextual(request, "TNOM2ASEG_IN");
						String TAPE1ASEG_IN = getCampoTextual(request, "TAPE1ASEG_IN");
						String TAPE2ASEG_IN = getCampoTextual(request, "TAPE2ASEG_IN");

						Map map1 = new PAC_IAX_SINIESTROS(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(NSINIESBis, new BigDecimal(0),
										null, CTIPIDEASEG_IN, NNUMIDEASEG_IN, TNOM1ASEG_IN, TAPE1ASEG_IN, TAPE2ASEG_IN,
										null, SPERSONASEG_IN, null, TNOM2ASEG_IN, null, null, new BigDecimal(4));
					}

					if (sg != null) {

						for (int i = 0; i < sg.length; i++) {
							List<Map> garan = (List<Map>) request.getSession().getAttribute("T_IAX_GARANTIAS");
							BigDecimal ICAPITAL = new BigDecimal(0);
							BigDecimal CGARANT = new BigDecimal(0);
							if (!isEmpty(stringToBigDecimal(sg[i]))) {
								for (Map map : garan) {
									if (((BigDecimal) map.get("CGARANT"))
											.intValue() == (stringToBigDecimal(sg[i]).intValue())) {
										ICAPITAL = (BigDecimal) map.get("ICAPITAL");
										CGARANT = (BigDecimal) map.get("CGARANT");
									}
								}
							}

							m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_SINIESTROS__F_GEN_RESDESTINATARI(CCAUSIN, CMOTSIN, CGARANT, SPRODUC,
											CACTIVI);

							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
								ok = false;
								break;
							}

							if (m.get("PGENERAR").equals(new BigDecimal(1))) {
								// java.sql.Date FFINBAJA=this.stringToSqlDate(getCampoTextual(request,
								// "HFFINBAJA"));//el param HFFINBAJA no se está enviando
								java.sql.Date FFINBAJA = this.stringToSqlDate(getCampoTextual(request, "FFINBAJA"));
								java.sql.Date FINIBAJA;
								java.sql.Date FECVAL = FNOTIFI;

								Map map2 = new PAC_IAXPAR_PRODUCTOS(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(new String("BAJA"), SPRODUC,
												CGARANT, CACTIVI);
								if (map2.get("RETURN").equals(new BigDecimal(1))) {
									FINIBAJA = this.stringToSqlDate(getCampoTextual(request, "FINIBAJA"));
								} else {
									/*
									 * FINIBAJA = null; FFINBAJA = null;
									 */

									map2 = new PAC_IAX_SIN_FORMULA(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_SIN_FORMULA__F_CAL_FECHAS_SINI(FSINIES, SSEGURO, NRIESGO,
													NSINIESBis, new BigDecimal(0), new BigDecimal(0), SPRODUC, CACTIVI,
													CGARANT, CCAUSIN, CMOTSIN, FNOTIFI, FECVAL);

									FINIBAJA = (java.sql.Date) map2.get("PFPERINI");
									FFINBAJA = (java.sql.Date) map2.get("PFPERFIN");
								}

								String pPREGUNTAS = this.getCampoTextual(request, "preg_resp");
								Map map = new HashMap();
								if (pPREGUNTAS != null) {
									map = new PAC_IAX_SINIESTROS(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_PREGUNTAS(new BigDecimal(NSINIESBis),
													SPRODUC, CACTIVI, pPREGUNTAS);
								}

								m = new PAC_IAX_SIN_FORMULA(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_SIN_FORMULA__F_CAL_VALORA(FSINIES, SSEGURO, NRIESGO, NSINIESBis,
												new BigDecimal(0), new BigDecimal(0), SPRODUC, CACTIVI, CGARANT,
												CCAUSIN, CMOTSIN, FNOTIFI, FECVAL, FINIBAJA, FFINBAJA, pNDIAS, IPERIT);

								if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
									ok = false;
									break;
								}

								BigDecimal PIPENALI = (BigDecimal) m.get("PIPENALI");
								BigDecimal PIVALORA = (BigDecimal) m.get("PIVALORA");
								BigDecimal PICAPRIS = (BigDecimal) m.get("PICAPRIS");
								BigDecimal PIFRANQ = (BigDecimal) m.get("PIFRANQ");

								// bug 0022674
								if (PIPENALI == null) {
									PIPENALI = new BigDecimal("0");
								}
								if (PIVALORA == null) {
									PIVALORA = new BigDecimal("0");
								}
								if (PICAPRIS == null) {
									PICAPRIS = new BigDecimal("0");
								}
								if (PIFRANQ == null) {
									PIFRANQ = new BigDecimal("0");
								}
								String ORIGEN = getCampoTextual(request, "ORIGEN");
								if (isEmpty(ORIGEN)) {
									ORIGEN = "axissin032";
								}

								if (!PIPENALI.equals(new BigDecimal(0)) || !PIVALORA.equals(new BigDecimal(0))
										|| !PICAPRIS.equals(new BigDecimal(0))) {

									m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PARGARANPRO_N(SPRODUC, CACTIVI, CGARANT,
											"BAJA");
									int paramBaja = (BigDecimal) this.tratarRETURNyMENSAJES(request, m, false) == null
											? 0
											: ((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue();

									m = new PAC_IAX_SINIESTROS(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIAMPARO(NSINIESBis,
													new BigDecimal(0), stringToBigDecimal(sg[i]), /*
																									 * stringToBigDecimal
																									 * (mappreguntas.get
																									 * (sg[i]))
																									 */null, // pPRETENC_CTIPIND
													ICAPITAL, null); // pPITOTRET
									/*
									 * ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIRESERVA(NSINIESBis, new
									 * BigDecimal(0), //pPNTRAMIT new BigDecimal(1), //pPCTIPRES null, //pPTTIPRES
									 * null, //pPNMOVRES stringToBigDecimal(sg[i]), //pPCGARANT new BigDecimal(1),
									 * //pPCCALRES null, //pPFMOVRES null, //pPCMONRES PIVALORA, null, //pPIPAGO
									 * null, //pPIINGRESO null, //pPIRECOBRO PICAPRIS, PIPENALI, FINIBAJA, FFINBAJA,
									 * null, //pPFULTPAG null, //pPSIDEPAG null, //pPSPROCES null, //pPFCONTAB null,
									 * //pPIPREREC null, //pPCTIPGAS new String("RESER"), //pPMODO ORIGEN,
									 * //pPTORIGEN PIFRANQ, paramBaja==1?pNDIAS:null, new BigDecimal(0), //pPCMOVRES
									 * null, //pPITOTIMP null, //pPPIVA null,//pPPRETENC null, //pPPRETEIVA null,
									 * //pPPRETEICA null, //pPIVA_CTIPIND null, //pPRETENC_CTIPIND null,
									 * //pPRETEIVA_CTIPIND null, //pPRETEICA_CTIPIND null,//pPITOTRET
									 * SINSOLIDARIDAD);
									 */ // SOLIDARIDAD

									if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
										ok = false;
										break;
									}
								}

								m = new PAC_IAX_SINIESTROS(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_SINIESTROS__F_DESTINA_AUT(SSEGURO, FSINIES, CCAUSIN, CMOTSIN,
												CGARANT);

								if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
									ok = false;
									break;
								}

								BigDecimal PCPAISRE = (BigDecimal) m.get("PCPAISRE");
								String PCBANCAR = (String) m.get("PCBANCAR");
								BigDecimal PSPERSON = (BigDecimal) m.get("PSPERSON");
								BigDecimal PCTIPDES = (BigDecimal) m.get("PCTIPDES");
								BigDecimal PCTIPBAN = (BigDecimal) m.get("PCTIPBAN");

								BigDecimal PCTIPCAP = (BigDecimal) m.get("PCTIPCAP");

								BigDecimal PCRELASE = getCampoNumerico(request, "PCRELASE");

								if (PCPAISRE != null && PSPERSON != null && PCTIPDES != null) {

									m = new PAC_IAX_SINIESTROS(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(SSEGURO,
													NSINIESBis, new BigDecimal(0), PCTIPDES, new BigDecimal(1), null,
													new BigDecimal(100), PCPAISRE, PSPERSON, PCTIPBAN, PCBANCAR,
													PCTIPCAP, PCRELASE, null, BigDecimal.ZERO);
									// bug 0023601 - 6-9-2012
									if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
										ok = false;
										break;
									}
									// fin bug 0023601 - 6-9-2012
								}
							}

						}
					}

					if (ok) {
						// Bug 0024964 CTRAMITAD
						m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);

						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
							formdata.put("OK", "0");
							formdata.put("NSINIES", m.get("PNSINIES"));
						} else {
							// ini bug 0022674
							String SIN_CALC = (String) m.get("PNSINIES");
							Map m3 = new PAC_IAX_SINIESTROS(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_SINIESTROS__F_POST_SINIESTRO(SIN_CALC);
							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m3, false)).intValue() != 0) {
								formdata.put("OK", "0");
								// bug 0022674 formdata.put("NSINIES", m.get("PNSINIES"));
								formdata.put("NSINIES", SIN_CALC);
							} else {
								request.setAttribute("MODO_IMPRES_V2", "NOK");
								formdata.put("OK", "1");
								formdata.put("NSINIES", SIN_CALC);
								BigDecimal CEMPRES = usuario.getCempres();
								m3 = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("SIN_IMPRIMIR_V2"), CEMPRES);
								BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m3);
								if (pRETURN != null && pRETURN.intValue() == 1) {
									Map map = new PAC_IAX_SINIESTROS(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_SINIESTROS__F_COMPROBAR_IMPRESION(SPRODUC, "SINIES");
									BigDecimal pRETURN1 = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
									if (pRETURN1 != null && pRETURN1.intValue() > 0) {
										request.setAttribute("MODO_IMPRES_V2", "OK");
									} else {
										request.setAttribute("MODO_IMPRES_V2", "NOK");
									}
								} else {
									request.setAttribute("MODO_IMPRES_V2", "NULL"); // si es null no imprimo
								}
							}
							// fin bug 0022674
						}

					} else {
						formdata.put("OK", "0");
					}

				}
			} else {
				formdata.put("OK", "0");
			}
			request.getSession().setAttribute("SIN_ALTA_GESTION", BigDecimal.ZERO);
			BigDecimal SIN_ALTA_GESTION = getParEmpresa(request, "SIN_ALTA_GESTION");
			if (BigDecimal.ONE.equals(SIN_ALTA_GESTION)) {
				PAC_IAX_MENU pacIaxMenu = new PAC_IAX_MENU(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxMenu.ejecutaPAC_IAX_MENU__F_GET_MENU(usuario.getCidioma());
				List<Map> menu = map.get("RETURN") != null ? (List) map.get("RETURN") : new ArrayList();
				for (Map form : menu) {
					String nameForm = (String) form.get("FORM");
					String nameModo = (String) form.get("CMODO");
					if ("AXISSIN006".equals(nameForm != null ? nameForm.toUpperCase() : "")
							&& "MODIF_SINIESTROS".equals(nameModo != null ? nameModo.toUpperCase() : "")) {
						request.getSession().setAttribute("SIN_ALTA_GESTION", SIN_ALTA_GESTION);
						break;
					}
				}
			}

			Map mapMensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			if (!isEmpty(mapMensajes)) {
				List<String> lmensajes = (List<String>) mapMensajes.get("m__clave");
				if (!isEmpty(lmensajes)) {
					StringBuffer mensajeAltaSin = new StringBuffer();
					for (String msg : lmensajes) {
						mensajeAltaSin.append(msg.replaceAll("verbatim:", "")).append("</br></br>");
					}
					request.getSession().setAttribute("mensajeAltaSin", mensajeAltaSin);
					BigDecimal SIN_ALTA_AVISO = getParEmpresa(request, "SIN_ALTA_AVISO");
					request.getSession().setAttribute("SIN_ALTA_AVISO", SIN_ALTA_AVISO);
				}
			}
			request.setAttribute("avisolrelanzado", Boolean.TRUE);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método aceptar_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Método que guarda cambios pantalla
	 *
	 */

	/**
	 * Método que se llama para actualizar todos los cambio porducidos en la
	 * pantalla y, posteriormente, dar de alta el nuevo siniestro.
	 * 
	 * @param request
	 */
	public void m_aceptar_pantalla(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String[] sg = null;
		String[] sd = null;
		this.formattingNumericValues(request);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "SRIESGO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (CMODO != null && CMODO.equals("PRE_SINIESTROS")) {
				Map m6 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_UPDATE_PRESINIESTROS(CMODO);

			} else {
				// Bug 0024964
				String pCTRAMITAD = null;

				Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m, false)).intValue() != 0) {
					formdata.put("OK", "0");
					formdata.put("NSINIES", m.get("PNSINIES"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método aceptar_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Método que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_causa(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CODI");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			// -- Bug 0012822 - 09/02/2010 - JMF: Afegir paràmetre seguro.
			BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
					? new BigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")))
					: getCampoNumerico(request, "SSEGURO");
			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, CACTIVI, SPRODUC, SSEGURO);

			List getMotivosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("T_IAX_MOTIVOS");

			if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMotivosIniReturn);
				request.getSession().setAttribute("T_IAX_MOTIVOS", getMotivosIniReturn);
			}
		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Método que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_ajax_asistencia(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			Map campos = new HashMap();

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal causas = getCampoNumerico(request, "causas");
			BigDecimal motivos = getCampoNumerico(request, "motivos");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));

			BigDecimal VALOR_ASISTENCIA = obtenerAsistencia(request, usuario, SSEGURO, NRIESGO, causas, motivos,
					FSINIES);

			campos.put("VALOR_ASISTENCIA", VALOR_ASISTENCIA);

			ajax.rellenarPlAContenedorAjax(campos);
			ajax.guardarContenidoFinalAContenedorAjax(campos);

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_asistencia - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String SNIP = getCampoTextual(request, "SNIP");
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal SPERREAL = getCampoNumerico(request, "SPERREAL");
			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			java.sql.Date FNACIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));

			Map plReturn = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA(NNUMIDE, CSEXPER, FNACIMI, SNIP,
					SPERREAL, CAGENTE);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_get_persona(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			request.getSession().removeAttribute("SPERSON_ALTA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			Map OB_PERSONA = (Map) map.get("OBPERSONA");

			/* Teléfono móvil */
			Map mapi = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOTLFMOVIL(SPERSON, null);
			tratarRETURNyMENSAJES(request, mapi);
			if (!isEmpty(mapi)) {

				OB_PERSONA.put("TMOVILDEC", (String) mapi.get("TVALCON"));

			}

			/* E-Mail */
			mapi = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(SPERSON, null);
			tratarRETURNyMENSAJES(request, mapi);

			if (!isEmpty(mapi)) {

				OB_PERSONA.put("TEMAILDEC", (String) mapi.get("TVALCON"));
			}
			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/

	/*********************************************************************************************************************/
	public void m_consultar(HttpServletRequest request, Axissin032Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			this.formattingNumericValues(request);

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			thisAction.topPila(request, "CMODO", CMODO);
			formdata.put("CMODO", CMODO);

			thisAction.topPila(request, "formdata_axissin032", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axissin032Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSONDEC");
		try {
			this.formattingNumericValues(request);
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			formdata.put("NSINIES_axissin032", NSINIES);
			thisAction.topPila(request, "formdata_axissin032", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		return SPERSON;

	}

	public void m_consultarSiniestros(HttpServletRequest request, Axissin032Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.formattingNumericValues(request);
			thisAction.topPila(request, "formdata_axissin006", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volver(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axissin032 = (Map) thisAction.removeTopPila(request, "formdata_axissin032"); // 01
			if (!isEmpty(formdata_axissin032))
				formdata.putAll(formdata_axissin032); // 01

			// actualizarFormatoFechas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_volver_per(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin006 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin032");

			if (!this.isEmpty(formdata_axissin006)) {
				formdata.putAll(formdata_axissin006);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin032"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("SPERSONDEC_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("SPERSONDEC_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_tipoGarantia(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String[] sg = null;
		try {
			this.formattingNumericValues(request);
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SRIESGO = getCampoNumerico(request, "SRIESGO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			// java.sql.Date FFINBAJA =this.stringToSqlDate(getHiddenCampoTextual(request,
			// "HFFINBAJA")); // el param HFFINBAJA no se está usando.
			java.sql.Date FFINBAJA = this.stringToSqlDate(getCampoTextual(request, "FFINBAJA"));
			if (FFINBAJA != null) {
				request.getSession().setAttribute("FFINBAJA", FFINBAJA);
			}

			int con = 0;
			BigDecimal con2 = new BigDecimal(0);
			formdata.remove("BAJA");
			formdata.remove("CALC_DIAS_BAJA");

			// 28506
			String garan_dep = this.comprovar_garantias_dependientes(request);

			String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");

			// 28506.Se añaden garantías dependientes (si hay)
			if (garan_dep.split(",").length > 1)
				SELECTEDGARANTIAS += "-" + garan_dep.split(",")[1];

			if (SELECTEDGARANTIAS != null)
				sg = SELECTEDGARANTIAS.split("-");

			if (sg != null) {

				for (int i = 0; i < sg.length; i++) {
					List<Map> garan = (List<Map>) request.getSession().getAttribute("T_IAX_GARANTIAS");

					BigDecimal CGARANT = new BigDecimal(0);
					BigDecimal ICAPITAL = new BigDecimal(0);

					if (!isEmpty(stringToBigDecimal(sg[i]))) {
						for (Map map : garan) {
							if (((BigDecimal) map.get("CGARANT"))
									.intValue() == (stringToBigDecimal(sg[i]).intValue())) {
								CGARANT = (BigDecimal) map.get("CGARANT");
								ICAPITAL = (BigDecimal) map.get("ICAPITAL");
							}
						}
					}

					Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARGARANTIA(new String("BAJA"), PSPRODUC, CGARANT,
									CACTIVI);

					if (map.get("RETURN") != null && map.get("RETURN").equals(new BigDecimal(1))) {
						con++;
					}

					Map map2 = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("CALC_DIAS_BAJA"), usuario.getCempres());
					if (map2.get("RETURN") != null && map2.get("RETURN") != "") {
						con2 = (BigDecimal) map2.get("RETURN");
					}

				}

				if (con > 0) {
					formdata.put("BAJA", 1);
				}

				if (con2.intValue() > 0) {
					formdata.put("CALC_DIAS_BAJA", con2.intValue());
				}

			}

			formdata.remove("SRIESGO");
			formdata.remove("NRIESGO");
			formdata.put("SRIESGO", isEmpty(SRIESGO) ? NRIESGO : SRIESGO);
			formdata.put("NRIESGO", isEmpty(SRIESGO) ? NRIESGO : SRIESGO);
			formdata.put("garantias_dependientes", garan_dep);

			this.initPreguntas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * TODO -Para efectuar la demo del dia 08-01-08, este método pasa temporalmente
	 * a ser de http request/response. Deberemos en js vaciar todo el displayTag
	 * para evitar que las garantias antiguas continuen en pantalla (cuando queramos
	 * cambiar fecha).
	 * 
	 * Método que se llama al cambiar la fecha de siniestro si y sólo si hay un
	 * riesgo seleccionado. Con ésto, cargamos las garantias asociadas a la póliza
	 * seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_actualizar_persona(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CNIVEL = getCampoNumerico(request, "CNIVEL");

			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map plGetListaPersonas = pac_axis_listValores_SIN
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPERSONASCAUS(SSEGURO, CCAUSIN, CMOTSIN, CNIVEL);

			ArrayList lista_per = (ArrayList) tratarRETURNyMENSAJES(request, plGetListaPersonas, false);
			request.getSession().setAttribute("lstPersRen", lista_per);

			ajax.rellenarPlAContenedorAjax(plGetListaPersonas);
			ajax.guardarContenidoFinalAContenedorAjax(plGetListaPersonas);

		} catch (Exception e) {
			logger.error("Axissin0032Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cambia_tramitador(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			Map m = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_DESUNITRADEFECTE(usuario.getCusuari(), SSEGURO,
					CCAUSIN, CMOTSIN, NSINIES, null);

			Map resultado = new HashMap();

			resultado.put("CUNITRA", m.get("PCUNITRA"));
			resultado.put("CTRAMIT", m.get("PCTRAMIT"));
			resultado.put("TTRAMIT", m.get("PTTRAMIT"));
			resultado.put("TUNITRA", m.get("PTUNITRA"));

			ajax.guardarContenidoFinalAContenedorAjax(resultado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_ajax_cambia_tramitador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public BigDecimal m_avisos(HttpServletRequest request, Axissin032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.formattingNumericValues(request);
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			formdata.put("PLSTAVISOS", m.get("PLSTAVISOS"));
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			request.getSession().setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			return pRETURN;

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_avisos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_elimnarref(HttpServletRequest request, Axissin032Action thisAction) {
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
			logger.error("Axissin032Service ajax_elimnarref - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cal_coste(HttpServletRequest request) {
		/* bug 0022674 */
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_SIN_FORMULA pac_axis_sin_formula = new PAC_IAX_SIN_FORMULA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_sin_formula.ejecutaPAC_IAX_SIN_FORMULA__F_CAL_COSTE(FSINIES, CCAUSIN, CMOTSIN, SPRODUC);

			tratarRETURNyMENSAJES(request, m);

			BigDecimal IPERIT = (BigDecimal) m.get("PICOSTE");

			formdata.put("IPERIT", IPERIT);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_cal_coste - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una búsqueda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String SSEGURO = getCampoTextual(request, "SSEGURO");
			BigDecimal agente = this.getAgentePoliza(request, SSEGURO);
			Map m = (Map) this.ActualizaAgente(request, agente);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axissin_agente", agente);

		return mapAgentes;
	}

	private BigDecimal getAgentePoliza(HttpServletRequest request, String SSEGURO) throws Exception {
		Map mapAgentes = new HashMap();
		// Cargar Agente de la BD
		BigDecimal agente = new BigDecimal(0);
		if (!isEmpty(SSEGURO)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			mapAgentes = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_AGENTE_NPOL(new BigDecimal(SSEGURO));

			if (!isEmpty(mapAgentes.get("PCAGENTE")))
				agente = (BigDecimal) mapAgentes.get("PCAGENTE");
		}

		request.getSession().setAttribute("axissin_agente", agente);

		return agente;
	}

	private void initPreguntas(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal pSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal pCACTIVI = this.getCampoNumerico(request, "CACTIVI");
		String[] sg = null;
		String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");

		// 28506.Se añaden garantías dependientes (si hay)
		String garan_dep = this.comprovar_garantias_dependientes(request);
		if (garan_dep.split(",").length > 1)
			SELECTEDGARANTIAS += "-" + garan_dep.split(",")[1];

		if (SELECTEDGARANTIAS != null) {
			if (SELECTEDGARANTIAS.contains("-")) {
				SELECTEDGARANTIAS = SELECTEDGARANTIAS.replace("-", ",");
			}
		}
		BigDecimal CMOTSIN = getCampoNumerico(request, "motivos");
		BigDecimal CCAUSIN = getCampoNumerico(request, "causas");

		// Leer preguntas siniestro
		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PREG_SINIESTRO(pSPRODUC, pCACTIVI,
				SELECTEDGARANTIAS, CCAUSIN, CMOTSIN);

		List preguntas = (List) tratarRETURNyMENSAJES(request, map);

		String pCPREGUN = new String();
		if (preguntas != null) {
			for (int i = 0; i < preguntas.size(); i++) {
				Map pregunta = (Map) preguntas.get(i);
				if (i == 0) {
					pCPREGUN += pregunta.get("CPREGUN");
				} else {
					pCPREGUN += ", " + pregunta.get("CPREGUN");
				}
			}
			// Leer respuestas siniestro
			map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_RESP_SINIESTRO(pCPREGUN);
			List respuestas = (List) tratarRETURNyMENSAJES(request, map);

			// Mezclar las respuestas con las preguntas iniciales
			inicializarPreguntas(preguntas, respuestas, request, "axisPreguntas");

			preguntas = separaBloques(preguntas);

			request.getSession().setAttribute("axissin_preguntasSiniestro",
					((preguntas == null) ? new ArrayList() : preguntas));

			request.getSession().setAttribute("axissin_respuestasSiniestro",
					((respuestas == null) ? new ArrayList() : respuestas));

			preguntas = null;
		} else {
			request.getSession().setAttribute("axissin_preguntasSiniestro",
					((preguntas == null) ? new ArrayList() : preguntas));
		}
	}

	/*** Anade una linea en blanco cuando las preguntas cambian de bloque *****/
	private List separaBloques(List preguntas) {
		BigDecimal nbloque_ant = new BigDecimal(0);
		ArrayList preguntas_separadas = new ArrayList();
		HashMap bloque = new HashMap();
		for (int i = 0; i < preguntas.size(); i++) {
			Map pregunta = (Map) preguntas.get(i);
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

		return preguntas_separadas;
	}

	// 28506
	private String comprovar_garantias_dependientes(HttpServletRequest request) throws Exception {
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		String lstCGARDEP = new String();
		String GARANTIAS = new String();
		String garantias_Dependientes = new String();
		String[] sg = null;

		String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");
		if (SELECTEDGARANTIAS != null) {
			sg = SELECTEDGARANTIAS.split("-");

			for (int i = 0; i < sg.length; i++) {
				if (isEmpty(GARANTIAS)) {
					GARANTIAS = sg[i];
				} else {
					GARANTIAS += "," + sg[i];
				}
			}

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_GARANTIAS_DEPENDIENTES(GARANTIAS);

			List list_gara = (List) tratarRETURNyMENSAJES(request, map, false);

			/*
			 * Se monta estructura string para parsear en javascript:
			 * CGARANT,CARGEPn-CARGEPn1-...
			 */
			BigDecimal CGARANT = null;
			if (list_gara != null) {
				for (int i = 0; i < list_gara.size(); i++) {
					CGARANT = (BigDecimal) ((Map) list_gara.get(i)).get("CGARANT");
					BigDecimal CGARDEP = (BigDecimal) ((Map) list_gara.get(i)).get("CGARDEP");

					/*
					 * Mirar que no se hay añadido ya a la lista de garantias seleccionadas con las
					 * recargas de página
					 */
					Boolean addGar = true;
					for (int j = 0; j < sg.length; j++) {
						if (sg[j].equals(CGARDEP.toString())) {
							addGar = false;
						}
					}

					if (addGar) {
						if (isEmpty(lstCGARDEP)) {
							lstCGARDEP = CGARDEP.toString();
						} else {
							lstCGARDEP += "-" + CGARDEP.toString();
						}
					}
				}
				garantias_Dependientes = CGARANT + "," + lstCGARDEP;
			}
		}

		return garantias_Dependientes;
	}

	public void m_ajax_valida_aseg_in(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			Map m = (Map) this.ValidaAsegIn(request);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin032Service - método m_ajax_valida_aseg_in", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private Map ValidaAsegIn(HttpServletRequest request) throws Exception {
		Map m = new HashMap();

		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		m = new PAC_IAX_VALIDACIONES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_VALIDACIONES_SIN__F_VAL_ASEG_INNOMINADO(SPERSON);

		return m;
	}

	public BigDecimal getParEmpresa(HttpServletRequest request, String param) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(param, usuario.getCempres());
		BigDecimal valor = new BigDecimal(0);
		if (tratarRETURNyMENSAJES(request, map) != null) {
			valor = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		}

		return valor;
	}
}
