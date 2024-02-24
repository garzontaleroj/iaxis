package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRESTAMOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr182Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr182Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			m_cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			logger.debug("Datos vuelta aceptar********************************" + formdata);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PRESTAMOS pacIaxpRESTAMOS = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CON pacIaxcON = new PAC_IAX_CON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRIESGO = null;
			BigDecimal pPNMOVIMI = null;
			/* Formulari */
			String pPCTAPRES = getCampoTextual(request, "CTAPRES");
			BigDecimal pPICAPITAL = getCampoNumerico(request, "ICAPINI");
			BigDecimal pISALDO = getCampoNumerico(request, "ISALDO");
			java.sql.Date pPFALTA = stringToSqlDate(getCampoTextual(request, "FORDEN"));
			java.sql.Date pPFFECPAG = stringToSqlDate(getCampoTextual(request, "FORDEN"));
			String pPCBANCAR = getCampoTextual(request, "CBANCAR");

			/* bug 25706 - JLTS - Se adiciona condici�n Ini */
			if (pPCBANCAR == null) {
				pPCBANCAR = getCampoTextual(request, "CBANCAR_OUT");
			}
			BigDecimal pCFORPAG = getCampoNumerico(request, "CFORPAG");
			if (pCFORPAG == null) {
				pCFORPAG = getCampoNumerico(request, "CFORPAG_OUT");
			}

			/* bug 25706 - JLTS - Se adiciona condici�n Fin */
			java.sql.Date pPF1CUOTA = stringToSqlDate(getCampoTextual(request, "FCUOTA1"));

			BigDecimal pIVALDIS = getCampoNumerico(request, "IVALDIS");
			BigDecimal pIPENDENT = getCampoNumerico(request, "IPENDENT");

			/* De la base de dades */
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			cargarDatosPoliza(request, pac_axis_siniestros, pac_axis_producccion, pPSSEGURO, pPCTAPRES);

			java.sql.Date pPFINIPREST = null;
			if (formdata.get("FINIPREST") != null) {
				pPFINIPREST = new java.sql.Date(((java.sql.Timestamp) formdata.get("FINIPREST")).getTime());
			}
			java.sql.Date pPFFINPREST = null;
			if (formdata.get("FFINPREST") != null) {
				pPFFINPREST = new java.sql.Date(((java.sql.Timestamp) formdata.get("FFINPREST")).getTime());
			}
			String pPCMONEDA = null;
			if (formdata.get("CMONEDA") != null) {
				pPCMONEDA = getCampoTextual(request, "CMONEDA");
			}
			BigDecimal pPPORCEN = null;
			if (formdata.get("ITASA") != null) {
				pPPORCEN = getCampoNumerico(request, "ITASA");
			}
			BigDecimal pPCTIPO = null;
			if (formdata.get("CTIPO") != null) {
				pPCTIPO = getCampoNumerico(request, "CTIPO");
			}
			BigDecimal pPCTIPBAN = null;
			if (formdata.get("CTIPBAN") != null) {
				pPCTIPBAN = getCampoNumerico(request, "CTIPBAN");
			}

			/* bug 0019238 */
			request.setAttribute("HUGO", true);

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// ecg http://mantis.srvcsi.com/view.php?id=23749#c124317 por defecto
				// "F_INSERTAR_PRESTAMO", pero si era de origen axisctr182_CONSULTA, entonces
				// F_AUTORIAZAR
				Map map = null;
				if (formdata.get("ORIGEN_Y_OPERACION") != null
						&& formdata.get("ORIGEN_Y_OPERACION").equals("axisctr181_CONSULTA")) {
					java.sql.Date pPFAUTORIZA = new java.sql.Date(new java.util.Date().getTime()); // ahora
					map = pacIaxpRESTAMOS.ejecutaPAC_IAX_PRESTAMOS__F_AUTORIZAR(pPCTAPRES, pPFALTA, pPFAUTORIZA,
							pPNMOVIMI, pPFFECPAG, pPICAPITAL);
					logger.debug(map);
					BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
					if (retorn.equals(BigDecimal.ZERO)) {
						formdata.put("ok", "0");
					}
				} else {
					map = pacIaxpRESTAMOS.ejecutaPAC_IAX_PRESTAMOS__F_INSERTAR_PRESTAMO(pPSSEGURO, pPNRIESGO, pPNMOVIMI,
							pPCTAPRES, pPFINIPREST, pPFFINPREST, pPFFECPAG, pPICAPITAL, pPCMONEDA, pPPORCEN, pPCTIPO,
							pPCTIPBAN, pPCBANCAR, pPF1CUOTA, pCFORPAG);
					logger.debug(map);
					BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
					if (retorn.equals(BigDecimal.ZERO)) {
						formdata.put("ok", "0");
					}
				}
			}

			/* Recuperar los datos de la pantalla que se han perdido al act. formdata */

			m_cargarDatos(request, thisAction);

			formdata.remove("ICAPINI");
			formdata.put("ICAPINI", pPICAPITAL);
			formdata.remove("ITASA");
			formdata.put("ITASA", pPPORCEN);
			formdata.remove("ISALDO");
			formdata.put("ISALDO", pISALDO);
			formdata.remove("CFORPAG");
			formdata.put("CFORPAG", pCFORPAG);
			formdata.remove("CBANCAR");
			formdata.put("CBANCAR", pPCBANCAR);
			formdata.remove("IVALDIS");
			formdata.put("IVALDIS", pIVALDIS);
			formdata.remove("IPENDENT");
			formdata.put("IPENDENT", pIPENDENT);

			/*
			 * BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			 * "NRIESGO"); BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			 * if(SSEGURO!=null){ PAC_IAX_PRODUCCION pacIaxProduccion=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)); Map
			 * map=pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			 * logger.debug(map); Map datosPoliza=(Map)tratarRETURNyMENSAJES(request, map,
			 * false);
			 * 
			 * if(! isEmpty(datosPoliza)){ List asegurados =
			 * (List)tratarRETURNyMENSAJES(request, dbLeeAsegurados(request, NRIESGO,
			 * (BigDecimal)datosPoliza.get("SPRODUC")));
			 * logger.debug("******************************************** asegurados: "
			 * +asegurados); request.setAttribute("axisctr_asegurados", ((asegurados ==
			 * null) ? new ArrayList() : asegurados)); } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// BUG 0023252: LCOL_T001-qtracker 4804 / 4801 - dates de prestecs HPM
		// m_form(request, thisAction);
	}

	public void m_rechazar(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_rechazar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_PRESTAMOS pacIaxpRESTAMOS = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CTAPRES = getCampoTextual(request, "CTAPRES");
			Map map = pacIaxpRESTAMOS.ejecutaPAC_IAX_PRESTAMOS__F_ANULA_PRESTAMO(CTAPRES);
			logger.debug(map);
			BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (retorn.equals(BigDecimal.ZERO)) {
				formdata.put("ok", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_reversar(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_rechazar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_PRESTAMOS pacIaxpRESTAMOS = new PAC_IAX_PRESTAMOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CTAPRES = getCampoTextual(request, "CTAPRES");
			java.sql.Date FALTA = stringToSqlDate(getCampoTextual(request, "FORDEN"));
			java.sql.Date FRECHAZA = new java.sql.Date(new java.util.Date().getTime()); // ahora
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");

			Map map = pacIaxpRESTAMOS.ejecutaPAC_IAX_PRESTAMOS__F_REVERSAR_PRESTAMO(CTAPRES, FALTA, FRECHAZA, NMOVIMI);

			logger.debug("**************************************reversar: " + map);
			BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (retorn.equals(BigDecimal.ZERO)) {
				formdata.put("ok", "0");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cargarDatos(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_cargarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String CTAPRES = getCampoTextual(request, "CTAPRES");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_axispar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CON pacIaxcON = new PAC_IAX_CON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (SSEGURO != null) {
				cargarDatosPoliza(request, pac_axis_siniestros, pac_axis_producccion, SSEGURO, CTAPRES);
			}

			formdata.remove("VALOR_REVERSO");
			BigDecimal VALOR_REVERSO = dbValorReverso(request, CTAPRES);
			formdata.put("VALOR_REVERSO", VALOR_REVERSO);

			/*
			 * ************************************ RECUPERAR ASEGURADOS
			 * *******************************
			 */
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("******************************************** NRIESGO: " + NRIESGO);
			List asegurados = (List) tratarRETURNyMENSAJES(request,
					dbLeeAsegurados(request, NRIESGO, (BigDecimal) datosPoliza.get("SPRODUC")));
			logger.debug("******************************************** asegurados: " + asegurados);
			request.setAttribute("axisctr_asegurados", ((asegurados == null) ? new ArrayList() : asegurados));

			map = pacIaxcON.ejecutaPAC_IAX_CON__F_IMPORTE_FINANCIACION_PDTE(SSEGURO);
			logger.debug(map);
			BigDecimal retorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map.get("PIMPORTE"))) {
				BigDecimal PIMPORTE = (BigDecimal) map.get("PIMPORTE");
				formdata.put("IPENDENT", PIMPORTE);
			}

			PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_SEGURO2(SSEGURO);
			logger.debug(mapa);
			request.setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_consultar(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axisctr0182Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal NRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			BigDecimal pISALDO = getHiddenCampoNumerico(request, "ISALDO");
			String CTAPRES = getHiddenCampoTextual(request, "CTAPRES");
			thisAction.topPila(request, "SSEGURO", SSEGURO);
			thisAction.topPila(request, "NRECIBO", NRECIBO);
			String NSINIES = getHiddenCampoTextual(request, "NSINIES");
			String NSINIESselected = getHiddenCampoTextual(request, "NSINIES");

			logger.debug(NSINIES);
			logger.debug(NSINIESselected);
			thisAction.topPila(request, "NSINIES", NSINIES);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			HashMap datos_adicionales = new HashMap();

			formdata.remove("VALOR_REVERSO");
			BigDecimal VALOR_REVERSO = dbValorReverso(request, CTAPRES);
			formdata.put("VALOR_REVERSO", VALOR_REVERSO);

			BigDecimal pPICAPITAL = getCampoNumerico(request, "ICAPINI");
			String pPCBANCAR = getCampoTextual(request, "CBANCAR");
			if (pPCBANCAR == null) {
				pPCBANCAR = getCampoTextual(request, "CBANCAR_OUT");
			}
			BigDecimal pCFORPAG = this.getCampoNumerico(request, "CFORPAG");
			if (pCFORPAG == null) {
				pCFORPAG = getCampoNumerico(request, "CFORPAG_OUT");
			}
			BigDecimal pIVALDIS = getCampoNumerico(request, "IVALDIS");
			BigDecimal pIPENDENT = getCampoNumerico(request, "IPENDENT");

			BigDecimal pPPORCEN = null;
			if (formdata.get("ITASA") != null) {
				pPPORCEN = getCampoNumerico(request, "ITASA");
			}

			datos_adicionales.put("ICAPINI", pPICAPITAL);
			datos_adicionales.put("ITASA", pPPORCEN);
			datos_adicionales.put("ISALDO", pISALDO);
			datos_adicionales.put("CFORPAG", pCFORPAG);
			datos_adicionales.put("CBANCAR", pPCBANCAR);
			datos_adicionales.put("IVALDIS", pIVALDIS);
			datos_adicionales.put("IPENDENT", pIPENDENT);
			thisAction.topPila(request, "formdata_Axisctr182", datos_adicionales);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr182Service - m�todo m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatosPoliza(HttpServletRequest request, PAC_IAX_SINIESTROS pac_axis_siniestros,
			PAC_IAX_PRODUCCION pac_axis_producccion, BigDecimal SSEGURO, String CTAPRES) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Datos p�liza
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		dbInicializaPol(request, usuario, SSEGURO);
		Map map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug(map);

		Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("SPRODUC", datosPoliza.get("SPRODUC"));
		logger.debug("CEMPRES-->" + datosPoliza.get("CEMPRES"));
		// A�adimos datosPoliza en el Map formdata para poder mostrarlos en la vista
		if (!isEmpty(datosPoliza)) {
			Map OB_IAX_DATPOLIZA = new HashMap();
			OB_IAX_DATPOLIZA.putAll(datosPoliza);
			formdata.put("OB_IAX_DATPOLIZA", OB_IAX_DATPOLIZA);
			formdata.putAll(OB_IAX_DATPOLIZA);
		}
		// bug 18749 -29/06/2011-AMC
		map = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
		logger.debug(map);
		Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TACTIVI", datosGestion.get("TACTIVI"));
		// Fi bug 18749 -29/06/2011-AMC

		Map pres = dbInicializaPrestamo(request, usuario, SSEGURO, CTAPRES);
		if (pres != null) {
			formdata.putAll(pres);
			// formdata.put("objetopres", pres);
		}

		// Tomadores p�liza
		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(SSEGURO);
		logger.debug(map);
		List tomadores = (List) tratarRETURNyMENSAJES(request, map);
		if (!isEmpty(tomadores))
			formdata.put("T_IAX_TOMADORES", tomadores);

		BigDecimal sperson = (BigDecimal) datosPoliza.get("SPERTOM");
		logger.debug("-->tomador:" + sperson);

		map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PERSONA__F_GET_CUENTASBANCARIAS(sperson, usuario.getCagente());
		formdata.put("TOMADORCCC", map.get("PCCC"));
		formdata.put("SPERTOM", sperson);
		logger.debug("--->PCCC:" + map.get("PCCC"));

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("712"));
		List lstctipres = (List) tratarRETURNyMENSAJES(request, map3);
		logger.debug(lstctipres);
		formdata.put("lstctipres", lstctipres);

		map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("813"));
		List lstcforpag = (List) tratarRETURNyMENSAJES(request, map3);
		logger.debug(lstcforpag);
		formdata.put("lstcforpag", lstcforpag);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private void dbInicializaPol(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		// Inicializar flujo
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
		logger.debug(map);
		tratarRETURNyMENSAJES(request, map, false);
	}

	private List dbGetPolRiesgos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(SSEGURO);
		logger.debug("RIESGOS DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	private Map dbInicializaPrestamo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			String CTAPRES) throws Exception {
		// Inicializar flujo
		PAC_IAX_PRESTAMOS pacIaxpRESTAMOS = new PAC_IAX_PRESTAMOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxpRESTAMOS.ejecutaPAC_IAX_PRESTAMOS__F_INICIALIZA_PRESTAMO(SSEGURO, null, CTAPRES);
		logger.debug(map);
		return (Map) tratarRETURNyMENSAJES(request, map, false);
	}

	protected Map dbLeeAsegurados(HttpServletRequest request, BigDecimal NRIESGO, BigDecimal SPRODUC) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug("DATOS ASEGURADOS  axisctr038---------------------------------------->" + map);
		return map;
	}

	protected BigDecimal dbValorReverso(HttpServletRequest request, String CTAPRES) throws Exception {
		Map map = new PAC_IAX_PRESTAMOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRESTAMOS__F_PERMITE_REVERSAR(CTAPRES);
		logger.debug("DATOS REVERSION  axisctr182--------------------------------------->" + map);
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		BigDecimal valor_reverso = new BigDecimal("0");
		if (map != null) {
			valor_reverso = (BigDecimal) map.get("PSEPERMITE");
		}
		return valor_reverso;
	}

	public void m_volver(HttpServletRequest request, Axisctr182Action thisAction) {
		logger.debug("Axissin06Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			m_cargarDatos(request, thisAction);

			formdata.remove("ICAPINI");
			formdata.remove("ITASA");
			formdata.remove("CFORPAG");
			formdata.remove("CBANCAR");
			formdata.remove("IVALDIS");
			formdata.remove("IPENDENT");

			Map formdata_Axisctr182 = (Map) thisAction.topPila(request, "formdata_Axisctr182");
			// (Map)thisAction.removeTopPila(request, "formdata_Axisctr182");
			if (!isEmpty(formdata_Axisctr182)) {
				formdata.putAll(formdata_Axisctr182);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
