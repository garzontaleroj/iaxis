//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin017Action thisAction) throws Exception {
		logger.debug("Axissin006Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CNIVEL = getCampoNumerico(request, "CNIVEL");

			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC();
			logger.debug(map);
			listValores.put("lstmediodec", (List) tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA();
			listValores.put("lstreclama", (List) tratarRETURNyMENSAJES(request, map, false));
			logger.debug(map);
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC();
			listValores.put("lsttipodec", (List) tratarRETURNyMENSAJES(request, map, false));
			logger.debug(map);
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB();
			listValores.put("lstresponsab", (List) tratarRETURNyMENSAJES(request, map, false));
			logger.debug(map);

			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			logger.debug(map);
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			logger.debug(map);
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			logger.debug(map);
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map, false));
			// Lista companyias
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
			logger.debug(map);
			listValores.put("CIAS", (List) tratarRETURNyMENSAJES(request, map, false));

			Map m = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CAUSASINI(SPRODUC, CACTIVI, SSEGURO);
			logger.debug("CAUSAS INI axissin001---------------------------------------->" + m);
			listValores.put("lstcausas", (List) tratarRETURNyMENSAJES(request, m));

			logger.debug(map);

			// Tipo de documento
			BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
			logger.debug(map);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map, false));

			request.setAttribute("listValores", listValores);

			// Cargar niveles prestacion

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTNIVELSINI();
			logger.debug(map);
			listValores.put("nivSinies", (List) tratarRETURNyMENSAJES(request, map, false));

			// Cargar personas

			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPERSONASCAUS(SSEGURO, CCAUSIN,
					CMOTSIN, CNIVEL);
			logger.debug(map);
			listValores.put("lstPersonasCaus", (List) tratarRETURNyMENSAJES(request, map, false));

			// Bug 18748: LCOL701-Campo fraude en alta/modificaci?n/consulta de siniestros
			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1034"));
			List gestion = (List) tratarRETURNyMENSAJES(request, map3);
			logger.debug(gestion);
			request.setAttribute("lsfraudes", !isEmpty(gestion) ? gestion : new ArrayList());
		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	private void dbInicializaPol(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		// Inicializar flujo
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		logger.debug(map);
		tratarRETURNyMENSAJES(request, map, false);
	}

	private Map dbGetRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);

		logger.debug(map);

		return (Map) tratarRETURNyMENSAJES(request, map, false);
	}

	/**
	 * 
	 * M�todo que llama a la funci�n pl correspondiente para cargar los TOMADORES de
	 * una p�liza seleccionada.
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
		logger.debug("TOMADORES DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin011Service m_form");

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPRODUC1 = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CAUSA = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDEC");
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
			logger.debug("**********SPRODUC: " + SPRODUC);
			logger.debug("**********SPRODUC1: " + SPRODUC1);
			logger.debug("**********SSEGURO: " + SSEGURO);
			logger.debug("**********NRIESGO: " + NRIESGO);
			logger.debug("**********NMOVIMI: " + NMOVIMI);
			logger.debug("**********CAUSA: " + CAUSA);
			cargarListas(request, thisAction);
			this.cargarDatosPoliza(request, thisAction);
			/* INI IAXIS-14364 EAD 2020-09-24 */
			if (getCampoNumerico(request, "NSINIESTRO") != null) {
			} else {
				this.cargarDatosSiniestro(request, thisAction);
			}
			/* FIN IAXIS-14364 EAD 2020-09-24 */

			if (CAUSA != null) {
				m_selected_causa(request, thisAction);
			} else if (formdata.get("CCAUSIN") != null) {
				m_selected_causa(request, thisAction);
			}

			logger.debug("**********formdata: " + formdata);
			ArrayList lista_riesgos = (ArrayList) formdata.get("T_IAX_RIESGOS");
			logger.debug(lista_riesgos);
			request.getSession().setAttribute("lista_riesgos", lista_riesgos);
			List polTomadoresReturn = this.dbGetPolTomadores(request, usuario, SSEGURO);
			formdata.put("T_IAX_TOMADORES", polTomadoresReturn);
			logger.debug("ctipdec-->" + CTIPDEC);
			CTIPDEC = isEmpty(CTIPDEC)
					? !isEmpty(formdata.get("CTIPDEC")) ? (BigDecimal) formdata.get("CTIPDEC") : CTIPDEC
					: CTIPDEC;
			logger.debug("ctipdec 2-->" + CTIPDEC);
			if (!isEmpty(CTIPDEC)) {
				formdata.put("CTIPDEC", CTIPDEC);
				String SP = this.getCampoTextual(request, "SP_DEC");
				if (!isEmpty(SP) && SP.equals("vaciar")) {
					formdata.put("DEC_SPERSON", "");
				}

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

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosPoliza(HttpServletRequest request, Axissin017Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			// Datos p�liza
			Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("SPRODUC", datosPoliza.get("SPRODUC"));
			formdata.put("SSEGURO", datosPoliza.get("SSEGURO"));
			formdata.put("CAGENTE", datosPoliza.get("CAGENTE"));
			logger.debug("CEMPRES-->" + datosPoliza.get("CEMPRES"));
			request.getSession().setAttribute("CEMPRES", datosPoliza.get("CEMPRES"));
			// A�adimos datosPoliza en el Map formdata para poder mostrarlos en la vista
			List polRiesgosReturn = this.dbGetPolRiesgos(request, usuario, SSEGURO);
			formdata.put("T_IAX_RIESGOS", polRiesgosReturn);
			formdata.put("SIZE_RIESGOS",
					((isEmpty(polRiesgosReturn)) ? new Integer(0) : new Integer(polRiesgosReturn.size())));
			// formdata.put("NRIESGO", ((!isEmpty(polRiesgosReturn) &&
			// polRiesgosReturn.size()==1))?
			// ((Map)((Map)polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("NRIESGO") :
			// null);

			if (!isEmpty(datosPoliza)) {
				Map OB_IAX_DATPOLIZA = new HashMap();
				OB_IAX_DATPOLIZA.putAll(datosPoliza);
				OB_IAX_DATPOLIZA.put("NRIESGO",
						((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
								? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("NRIESGO")
								: null);
				logger.debug(OB_IAX_DATPOLIZA.get("NRIESGO"));
				formdata.put("OB_IAX_DATPOLIZA", OB_IAX_DATPOLIZA);
			}

			request.getSession().setAttribute("SSEGURO", SSEGURO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_cargarDatosPoliza", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private void cargarDatosSiniestro(HttpServletRequest request, Axissin017Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal EDICION = getCampoNumerico(request, "EDICION");

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
			logger.debug(map);
			Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map, false);
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			logger.debug(AbstractDispatchAction.topPila(request));

			if (!isEmpty(datosSiniestro)) {
				BigDecimal CMEDDEC = getCampoNumerico(request, "CMEDDEC");
				// A�adimos datosSiniestro en el Map formdata para poder mostrarlos en la vista
				Map OB_IAX_SINIESTRO = new HashMap();
				OB_IAX_SINIESTRO.putAll(datosSiniestro);

				if (!isEmpty(CMEDDEC))
					OB_IAX_SINIESTRO.put("CMEDDEC", CMEDDEC);
				if (isEmpty(NSINIES)) {
					if (isEmpty(OB_IAX_SINIESTRO.get("FNOTIFI")))
						OB_IAX_SINIESTRO.put("FNOTIFI", new Date());
				}
				formdata.put("OB_IAX_SINIESTRO", OB_IAX_SINIESTRO);
				HashMap listValores = (HashMap) request.getAttribute("listValores");
				if (!isEmpty(OB_IAX_SINIESTRO.get("CCAUSIN"))) {
					BigDecimal CCAUSA = new BigDecimal(String.valueOf(OB_IAX_SINIESTRO.get("CCAUSIN")));
					logger.debug(CCAUSA);
					BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
					// -- Bug 0012822 - 09/02/2010 - JMF: Afegir par�metre seguro.
					BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
							? new BigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")))
							: getCampoNumerico(request, "SSEGURO");
					BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
					java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
					BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
					if (!isEmpty(CCAUSA)) {
						Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO, FSINIES,
								CACTIVI);
						List getMotivosIniReturn = (List) tratarRETURNyMENSAJES(request, plReturn);
						logger.debug(map);
						if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
							listValores.put("lstmotivos", getMotivosIniReturn);
							request.setAttribute("listValores", listValores);
						}
					}

				}

				if (EDICION != null && EDICION.intValue() == 1) {

					formdata.putAll(OB_IAX_SINIESTRO);
					if (!isEmpty(CMEDDEC))
						formdata.put("CMEDDEC", CMEDDEC);

					HashMap LOCALIZA = (HashMap) datosSiniestro.get("LOCALIZA");
					/* Actualizamos valor del TLOCALI */
					if (!isEmpty(LOCALIZA)) {
						formdata.putAll(LOCALIZA);
					}

				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_cargarDatosSiniestros", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_guardar(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				request.setAttribute("OK1", "!OK1");
				request.setAttribute("OK", "!OK");
				String NSINIES = getCampoTextual(request, "NSINIES");
				// -- Bug 0012822 - 09/02/2010 - JMF: Afegir par�metre seguro.
				BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
						? new BigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")))
						: getCampoNumerico(request, "SSEGURO");
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE_SEL"))
						? getCampoNumerico(request, "CAGENTE")
						: getCampoNumerico(request, "CAGENTE_SEL");
				BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
				java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
				String HSINIES = getCampoTextual(request, "HSINIES");
				java.sql.Date FNOTIFI = this.stringToSqlDate(getCampoTextual(request, "FNOTIFI"));
				java.sql.Date FDETECCION = this.stringToSqlDate(getCampoTextual(request, "FDETECCION"));
				BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSINS");
				BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSINS");
				String CEVENTO = getCampoTextual(request, "CEVENTO");
				BigDecimal CCULPAB = getCampoNumerico(request, "CCULPAB");
				BigDecimal CRECLAMA = getCampoNumerico(request, "CRECLAMA");
				BigDecimal NASEGUR = getCampoNumerico(request, "NASEGUR");
				BigDecimal CMEDDEC = getCampoNumerico(request, "CMEDDEC");
				BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDECS");
				String TNOMDEC = getCampoTextual(request, "TNOMDEC");
				String TNOM1DEC = getCampoTextual(request, "TNOM1DEC");
				String TNOM2DEC = getCampoTextual(request, "TNOM2DEC");
				String TAPE1DEC = getCampoTextual(request, "TAPE1DEC");
				String TAPE2DEC = getCampoTextual(request, "TAPE2DEC");
				String TTELDEC = getCampoTextual(request, "TTELDEC");
				String TMOVILDEC = getCampoTextual(request, "TMOVILDEC");
				String TEMAILDEC = getCampoTextual(request, "TEMAILDEC");
				String TSINIES = getCampoTextual(request, "TSINIES");
				String TDETPRETEN = getCampoTextual(request, "TDETPRETEN");
				// NMOVIMI = new BigDecimal(1);
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				String NSINCIA = getCampoTextual(request, "NSINCIA");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				BigDecimal DEC_SPERSON = getCampoNumerico(request, "DEC_SPERSON");
				logger.debug("DEC_SPERSON : " + DEC_SPERSON);
				BigDecimal CTIPIDE = isEmpty(getCampoNumerico(request, "CTIPIDE"))
						? getCampoNumerico(request, "CTIPIDE_AUX")
						: getCampoNumerico(request, "CTIPIDE");
				String NPRESIN = getCampoTextual(request, "NPRESIN");
				BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

				BigDecimal CNIVEL = getCampoNumerico(request, "CNIVEL");
				BigDecimal SPERSON2 = getCampoNumerico(request, "SPERSON2");
				java.sql.Date FECHAPP = this.stringToSqlDate(getCampoTextual(request, "FECHAPP"));

				String CPOLCIA = getCampoTextual(request, "CPOLCIA");
				BigDecimal IPERIT = getCampoNumerico(request, "IPERIT");

				BigDecimal CFRAUDE = getCampoNumerico(request, "CFRAUDE");
				BigDecimal CCARPETA = getCampoNumerico(request, "CCARPETA");

				if (CCARPETA == null) {
					CCARPETA = new BigDecimal("0");
				}

				// ini bug 0024675
				BigDecimal CSALVAM = getCampoNumerico(request, "CSALVAM");

				if (CSALVAM == null) {
					CSALVAM = new BigDecimal("0");
				}
				// fin bug 0024675

				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CABECERA_SINIESTRO(NSINIES, SSEGURO,
						NRIESGO, NMOVIMI, FSINIES, HSINIES, FNOTIFI, CCAUSIN, CMOTSIN, CEVENTO, CCULPAB, CRECLAMA,
						NASEGUR, CMEDDEC, CTIPDEC, TNOMDEC, TNOM1DEC, TNOM2DEC, TAPE1DEC, TAPE2DEC, TTELDEC, TMOVILDEC,
						TEMAILDEC, TSINIES, CTIPIDE, NNUMIDE, DEC_SPERSON, NSINCIA, CCOMPANI, NPRESIN, CNIVEL, SPERSON2,
						FECHAPP, CPOLCIA, IPERIT, CFRAUDE, CCARPETA, null, CAGENTE, null, CSALVAM, null, FDETECCION,
						null, TDETPRETEN);
				logger.debug(map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {

					request.setAttribute("OK1", "OK1");
					BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
					BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
					String TNOMVIA = getCampoTextual(request, "TNOMVIA");
					BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
					String TCOMPLE = getCampoTextual(request, "TCOMPLE");
					String TLOCALI = getCampoTextual(request, "TLOCALI");/*
																			 * if(TLOCALI == null){ TLOCALI = " "; }
																			 */ // Bug 37541 fecha 23/06/2016 esta
																				// condici�n realiza de manera forzada
																				// que se inserte un registro en la
																				// tabla de localizaciones del siniestro
																				// ( SIN_TRAMITA_LOCALIZA) con los datos
																				// vac�os, lo que provoca errores en
																				// posteriores modificaciones. por esto
																				// se comentarea.

					BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
					BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
					BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
					String CPOSTAL = getCampoTextual(request, "CPOSTAL");
					if (!isEmpty(CPOSTAL))
						CPOSTAL = CPOSTAL.toUpperCase();
					BigDecimal NLOCALI = getCampoNumerico(request, "NLOCALI");
					BigDecimal NTRAMIT = (isEmpty(getCampoNumerico(request, "NTRAMIT"))) ? new BigDecimal(0)
							: getCampoNumerico(request, "NTRAMIT");

					logger.debug("**********SPERSON" + SPERSON);
					logger.debug("**********CSIGLAS" + CSIGLAS);
					logger.debug("**********TNOMVIA" + TNOMVIA);
					logger.debug("**********NNUMVIA" + NNUMVIA);
					logger.debug("**********TCOMPLE" + TCOMPLE);
					logger.debug("**********TLOCALI" + TLOCALI);
					logger.debug("**********CPAIS" + CPAIS);
					logger.debug("**********CPROVIN" + CPROVIN);
					logger.debug("**********CPOBLAC" + CPOBLAC);
					logger.debug("**********CPOSTAL" + CPOSTAL);
					logger.debug("**********NLOCALI" + NLOCALI);
					logger.debug("**********NTRAMIT" + NTRAMIT);

					// Revisamos si los campos est�n informados antes de dar de alta la localizaci�n
					if (TLOCALI != null || (CPAIS != null && CPROVIN != null && CPOBLAC != null && CPOSTAL != null)) {
						map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMILOCALI(NSINIES,
								NTRAMIT, NLOCALI, SPERSON, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, TLOCALI, CPAIS, CPROVIN,
								CPOBLAC, CPOSTAL, null, null, null, null, null, null, null, null, null, null, null,
								null, null, null, null, null, null/* IAXIS-4961 EAD:13/08/2020 CCONTABLE */
						);
						logger.debug(map);

						if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error

						} else {
							formdata.put("hayErrorAvisos", "1");
							cargarListas(request, thisAction);
							this.cargarDatosPoliza(request, thisAction);
							HashMap listValores = (HashMap) request.getAttribute("listValores");
							if (!isEmpty(CCAUSIN)) {
								BigDecimal CCAUSA = CCAUSIN;
								logger.debug(CCAUSA);

								BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
								if (!isEmpty(CCAUSA)) {
									Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO,
											FSINIES, CACTIVI);
									List getMotivosIniReturn = (List) tratarRETURNyMENSAJES(request, plReturn);
									logger.debug(map);
									if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
										listValores.put("lstmotivos", getMotivosIniReturn);
										request.setAttribute("listValores", listValores);
									}
								}

							}

						}

					} else {
						request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
					}

				} else {
					formdata.put("hayErrorAvisos", "1");
					cargarListas(request, thisAction);
					this.cargarDatosPoliza(request, thisAction);
					HashMap listValores = (HashMap) request.getAttribute("listValores");
					if (!isEmpty(CCAUSIN)) {
						BigDecimal CCAUSA = CCAUSIN;
						logger.debug(CCAUSA);

						BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
						if (!isEmpty(CCAUSA)) {
							Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO, FSINIES,
									CACTIVI);
							List getMotivosIniReturn = (List) tratarRETURNyMENSAJES(request, plReturn);
							logger.debug(map);
							if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
								listValores.put("lstmotivos", getMotivosIniReturn);
								request.setAttribute("listValores", listValores);
							}
						}

					}

				}
				logger.debug("NSINIES-->" + NSINIES);
				if (isEmpty(NSINIES)) {
					Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_CREAR_PRESINIESTRO();
					logger.debug(m);
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_selected_causa(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin001Service AJAX m_ajax_selected_causa");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			// -- Bug 0012822 - 09/02/2010 - JMF: Afegir par�metre seguro.
			BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
					? new BigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")))
					: getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO, FSINIES, CACTIVI);

			// listValores.put("lstmotivos", );

			formdata.put("lstmotivos", (List) tratarRETURNyMENSAJES(request, plReturn));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*
	 * ******************************************
	 * **************************************
	 */
	/*
	 * ************************************* AJAX
	 * **************************************
	 */
	/*
	 * *****************************************************************************
	 * ****
	 */

	/**
	 * M�todo que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_causa(HttpServletRequest request) {
		logger.debug("Axissin001Service AJAX m_ajax_selected_causa");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CODI");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			// -- Bug 0012822 - 09/02/2010 - JMF: Afegir par�metre seguro.
			BigDecimal SSEGURO = isEmpty(getCampoNumerico(request, "SSEGURO"))
					? new BigDecimal(String.valueOf(request.getSession().getAttribute("SSEGURO")))
					: getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO, FSINIES, CACTIVI);
			List getMotivosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("T_IAX_MOTIVOS");

			if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMotivosIniReturn);
				request.getSession().setAttribute("T_IAX_MOTIVOS", getMotivosIniReturn);
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Axissin001Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los motivos
	 * (seg�n la causa seleccionada) de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param CCAUSA
	 * @param CRAMO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetMotivosIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCAUSA, BigDecimal SPRODUC,
			BigDecimal SSEGURO, BigDecimal NRIESGO, java.sql.Date FSINIES, BigDecimal CACTIVI) throws Exception {
		// -- Bug 0012822 - 09/02/2010 - JMF: Afegir par�metre seguro.
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(SPRODUC, CCAUSA, CACTIVI, SSEGURO);
		logger.debug("MOTIVOS INI axissin001---------------------------------------->" + m);
		return m;
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N CAMPOS DIRECCION
	 **************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar la direcci�n de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public

			void m_grabarDireccion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axissin006Service m_grabarDireccionPersona");
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
			logger.debug(map);
			if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT")))
				formdata.put("CDOMICI", map.get("PCDOMICIOUT").toString());

			request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map, false));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	public

			void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axissin006Service m_ajax_getProvinPobla");
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
				logger.debug(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_recuperarDireccionON(HttpServletRequest request) {
		logger.debug("Axissin017Service m_ajax_recuperarDireccionON");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO_SEL");
			logger.debug("**********NRIESGO: " + NRIESGO);
			ArrayList lista_riesgos = (ArrayList) request.getSession().getAttribute("lista_riesgos");
			logger.debug(lista_riesgos);
			if (lista_riesgos != null) {
				for (int i = 0; i < lista_riesgos.size(); i++) {
					Map riesgos = (Map) lista_riesgos.get(i);
					Map objeto_riesgos = (Map) riesgos.get("OB_IAX_RIESGOS");
					logger.debug(objeto_riesgos);
					BigDecimal NRIESGO_IN = (BigDecimal) objeto_riesgos.get("NRIESGO");
					logger.debug("NRIESGO_IN" + NRIESGO_IN);
					if (NRIESGO_IN.intValue() == NRIESGO.intValue()) {
						// Cargamos el que contiene los datos de riesgo relacionados con el riesgo
						// seleccionado
						Map direcciones = (Map) objeto_riesgos.get("RIESDIRECCION");
						logger.debug(direcciones);
						ajax.guardarContenidoFinalAContenedorAjax(direcciones);
					} else {

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service m_ajax_recuperarDireccionON", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_evento(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin017Service m_ajax_evento");
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
				logger.debug(map);
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
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin006Service m_ajax_direccion");
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
				logger.debug(map);
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
				logger.debug(map);
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
				logger.debug(map);
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
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajaxgetInfoHost(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin006Service m_ajaxgetInfoHost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");

			/*
			 * SPERSON = new BigDecimal(17327); CDOMICI = new BigDecimal(1);
			 */
			logger.debug(SPERSON);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(SPERSON, CDOMICI);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajaxgetInfoHost", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_existe_persona");
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
			logger.debug(plReturn);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_get_persona");
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

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin017Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "DEC_SPERSON");
		try {
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			logger.debug(SPERSON);
			formdata.put("NSINIES_axissin017", NSINIES);
			thisAction.topPila(request, "formdata_axissin017", formdata);
			return SPERSON;
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return SPERSON;
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volver_per(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin017Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin017 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin017");

			if (!this.isEmpty(formdata_axissin017)) {
				formdata.putAll(formdata_axissin017);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin017"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}
			logger.debug(AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			logger.debug(request.getSession().getAttribute("SPERSON_ALTA"));

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los RIESGOS de
	 * una p�liza seleccionada.
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
		logger.debug("RIESGOS DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * TODO -Para efectuar la demo del dia 08-01-08, este m�todo pasa temporalmente
	 * a ser de http request/response. Deberemos en js vaciar todo el displayTag
	 * para evitar que las garantias antiguas continuen en pantalla (cuando queramos
	 * cambiar fecha).
	 * 
	 * M�todo que se llama al cambiar la fecha de siniestro si y s�lo si hay un
	 * riesgo seleccionado. Con �sto, cargamos las garantias asociadas a la p�liza
	 * seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_actualizar_persona(HttpServletRequest request, Axissin017Action thisAction) {
		logger.debug("Axissin017Service m_ajax_actualizar_persona");
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

			ajax.rellenarPlAContenedorAjax(plGetListaPersonas);
			ajax.guardarContenidoFinalAContenedorAjax(plGetListaPersonas);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Axissin0017Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
