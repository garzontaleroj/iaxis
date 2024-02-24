//Revision:# HqukrcrgWTBlPlWsJ5OJWA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ESTCESIONESREA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisrea045Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisrea045Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea045Action thisAction) {
		logger.debug("Axisrea041ervice m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String SMODOPANTALLA = this.getCampoTextual(request, "PMODOPANTALLA");

		// formdata.put("PMODOPANTALLA", SMODOPANTALLA);
		BigDecimal SSEGURO;
		BigDecimal SCUMULO;
		BigDecimal PNSINIES;
		BigDecimal CGENERA = stringToBigDecimal((String) formdata.get("CGENERA"));
		// INI - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
		BigDecimal NMOVIMI = stringToBigDecimal((String) formdata.get("NMOVIGEN"));
		// FIN - AXIS 4105 - 05/06/2019 - AABG - SE AGREGA NUEVO PARAMETRO MOVIMIENTO
		// String SMODOPANTALLA = "Axisctr009";

		try {
			if (SMODOPANTALLA != null) {
				PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				SSEGURO = this.getCampoNumerico(request, "SSEGURO");
				if (SMODOPANTALLA.equalsIgnoreCase("axisctr024")) {
					Map maptraspaso = pacIaxEstcesionesrea
							.ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(SSEGURO, null, null);
					BigDecimal salida = stringToBigDecimal(maptraspaso.get("RETURN") + "");
					if (salida.equals(BigDecimal.ZERO)) {
						// INI - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
						Map map = pacIaxEstcesionesrea
								.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(SSEGURO, CGENERA, NMOVIMI);
						// FIN - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
						List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
						formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);
						logger.debug(map);
					}
				}
				if (SMODOPANTALLA.equalsIgnoreCase("axisctr009")) {
					Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREA(SSEGURO,
							CGENERA);
					List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
					formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);

					logger.debug(map);
				}
				if (SMODOPANTALLA.equalsIgnoreCase("axissin006")) {

					PNSINIES = (BigDecimal) this.getCampoNumerico(request, "NSINIES");
					// BigDecimal PNSINIES= new BigDecimal(1);
					Map maptraspaso = pacIaxEstcesionesrea
							.ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(null, PNSINIES, null);
					BigDecimal salida = stringToBigDecimal(maptraspaso.get("RETURN") + "");
					if (salida.equals(BigDecimal.ZERO)) {
						Map map = pacIaxEstcesionesrea
								.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREASINIE(PNSINIES);
						List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
						formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);
						logger.debug(maptraspaso);
						logger.debug(map);
					}
				}
				if (SMODOPANTALLA.equalsIgnoreCase("axisrea046")) {

					// SSEGURO = new BigDecimal(99);
					PNSINIES = (BigDecimal) this.getCampoNumerico(request, "NSINIES");
					request.getSession().removeAttribute("listaBloqueo");
					Map listBloqueados = new HashMap();// map que se usa para registra cuales son los campos de la tabla
														// que deben aparecer bloqueados
					request.getSession().setAttribute("listaBloqueo", listBloqueados);
					Map maptraspaso = pacIaxEstcesionesrea
							.ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_CESIONESREATOEST(SSEGURO, PNSINIES, CGENERA);
					BigDecimal salida = stringToBigDecimal(maptraspaso.get("RETURN") + "");

					if (salida.equals(BigDecimal.ZERO)) {
						// INI - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
						Map map = pacIaxEstcesionesrea
								.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(SSEGURO, CGENERA, NMOVIMI);
						// FIN - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
						List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
						formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);
						logger.debug(maptraspaso);
						logger.debug(map);

						if (map.get("RETURN") != null) {
							Map valor = (HashMap) t_iax_estcesionesrea.get(0);
							Map prueba = (HashMap) valor.get("OB_IAX_ESTCESIONESREA");
							SCUMULO = stringToBigDecimal(prueba.get("SCUMULO") + "");

							if (SCUMULO != null) {
								Map mapCumulo = pacIaxEstcesionesrea
										.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREACUM(SCUMULO, CGENERA);
								t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, mapCumulo);
							}
						}
					}
					Map mapEstado = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_ESTADO_DE_POLIZA(SSEGURO,
							null);
					if (mapEstado.get("RETURN").equals(BigDecimal.ZERO) && mapEstado.get("PESTADO").equals("A")) {
						formdata.put("VESTADO_POLIZA", "A");
					}
					tratarRETURNyMENSAJES(request, mapEstado);
					logger.debug(mapEstado);
				}
				if (SMODOPANTALLA.equalsIgnoreCase("recargar")) {
					// INI - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
					Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREAPOLIZAS(SSEGURO,
							CGENERA, NMOVIMI);
					// FIN - AXIS 4105 - 05/06/2019 - AABG - SE ENVIA NUEVO PARAMETRO NMOVIMI
					List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
					formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);
					logger.debug(map);
				}
				Map mapTramo = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_DETVALORES_TRAMOS(SSEGURO);
				List listTramo = (List) tratarRETURNyMENSAJES(request, mapTramo);
				request.getSession().setAttribute("listTramo", listTramo);
				logger.debug(listTramo);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio axissin006Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Elimina contrato seleccionado
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_actualizarPorcentajeCesion(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPPCESION = stringToBigDecimal((String) formdata.get("pporcesion"));
			BigDecimal pPSSEGPOL = stringToBigDecimal((String) formdata.get("pseguro"));
			BigDecimal pPSCESREA = stringToBigDecimal((String) formdata.get("pscesrea"));
			BigDecimal pPICESION = stringToBigDecimal((String) formdata.get("picesion"));
			BigDecimal pPICAPCES = stringToBigDecimal((String) formdata.get("picapces"));

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA(pPSCESREA, pPSSEGPOL,
					pPICESION, pPICAPCES, pPPCESION);
			tratarRETURNyMENSAJES(request, map);

			// map que se usa para registra cuales son los campos de la tabla que deben
			// aparecer bloqueados
			Map listBloqueados = (HashMap) request.getSession().getAttribute("listaBloqueo");
			listBloqueados.put(pPSCESREA, "importe," + pPPCESION);
			request.getSession().setAttribute("listaBloqueo", listBloqueados);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_actualizarPorcentajeCesion", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Valida Fechas
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_validaFechas(HttpServletRequest request, Axisrea045Action thisAction) {
		logger.debug("Axisrea045Service m_validaFechas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_ESTCESIONESREA pac_iax_estcesionesrea = new PAC_IAX_ESTCESIONESREA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal pPPCESION = stringToBigDecimal((String) formdata.get("pporcesion"));
			BigDecimal pPSSEGURO = this.getCampoNumerico(request, "sseguro");
			BigDecimal pPSCESREA = this.getCampoNumerico(request, "estcesrea");
			BigDecimal pCGARANT = this.getCampoNumerico(request, "cgarant");
			Date FEFECTO = this.getCampoTextual(request, "fefecto") != null
					? sdf.parse(getCampoTextual(request, "fefecto"))
					: null;
			java.sql.Date pPFEFECTO = FEFECTO != null ? new java.sql.Date(FEFECTO.getTime()) : null;
			Date FVENCIM = this.getCampoTextual(request, "fvencimiento") != null
					? sdf.parse(getCampoTextual(request, "fvencimiento"))
					: null;
			java.sql.Date pPFVENCIMIENTO = FVENCIM != null ? new java.sql.Date(FVENCIM.getTime()) : null;

			tratarRETURNyMENSAJES(request,
					pac_iax_estcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_FECHAS(pPSCESREA,
							pPSSEGURO, pCGARANT, pPFEFECTO, pPFVENCIMIENTO));
			// ejecutaPAC_IAX_ESTCESIONESREA__VALIDAFECHAS(pPSCESREA, pPSSEGURO,pCGARANT,
			// pPFEFECTO, pPFVENCIMIENTO)
			Map listBloqueados = (HashMap) request.getSession().getAttribute("listaBloqueo");
			listBloqueados.put(pPSCESREA, "fecha," + pPPCESION);
			request.getSession().setAttribute("listaBloqueo", listBloqueados);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_validaFechas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Carga cesiones manuales
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_busca_cesiones_manuales(HttpServletRequest request, Axisrea045Action thisAction) {
		logger.debug("Axisrea045Service m_busca_cesiones_manuales");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal pPSSEGURO = this.getCampoNumerico(request, "sseguro");
		BigDecimal CGENERA = stringToBigDecimal((String) formdata.get("CGENERA"));

		try {
			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// BigDecimal SSEGURO=(BigDecimal)AbstractDispatchAction.topPila(request,
			// "SSEGURO");

			// request.setAttribute("SSEGURO", SSEGURO);
			// 10026631
			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_ESTCESIONESREA(pPSSEGURO, CGENERA);
			List t_iax_estcesionesrea = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("T_IAX_ESTCESIONESREA", t_iax_estcesionesrea);
			logger.debug(map);
			/*
			 * Trae los totales para las variables globales de importes esto es solo para la
			 * opcion de el form
			 */
			Map mapTotales = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_TOTALESESTCESIONREA(pPSSEGURO);
			formdata.put("VTOTPORCESION", mapTotales.get("PTOTPORCESION"));
			formdata.put("VTOTCAPITAL", mapTotales.get("PTOTCAPITAL"));
			formdata.put("VTOTCESION", mapTotales.get("PTOTCESION"));
			formdata.put("SSEGURO", pPSSEGURO);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin006Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_nuevaCesion(HttpServletRequest request, Axisrea045Action thisAction) {
		logger.debug("Axisrea045Service m_nuevaCesion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPNCESION = stringToBigDecimal((String) formdata.get("VNCESION"));
			BigDecimal pPSSEGPOL = stringToBigDecimal((String) formdata.get("VSSEGPOL"));
			BigDecimal pPGARANT = stringToBigDecimal((String) formdata.get("VCGARANT"));
			BigDecimal pPCGENERA = new BigDecimal(4);
			BigDecimal pPCTRAMO = stringToBigDecimal((String) formdata.get("VCTRAMO"));
			BigDecimal pPNMOVIMI = null;
			BigDecimal pSCONTRA = stringToBigDecimal((String) formdata.get("VSCONTRA"));
			BigDecimal pNVERSION = stringToBigDecimal((String) formdata.get("VNVERSION"));
			BigDecimal pSSEGURO = stringToBigDecimal((String) formdata.get("VSSEGURO"));
			Date FEFECTO = this.getCampoTextual(request, "fefecto") != null
					? sdf.parse(getCampoTextual(request, "fefecto"))
					: null;
			java.sql.Date pFEFECTO = FEFECTO != null ? new java.sql.Date(FEFECTO.getTime()) : null;
			Date FVENCIM = this.getCampoTextual(request, "fvencimiento") != null
					? sdf.parse(getCampoTextual(request, "fvencimiento"))
					: null;
			java.sql.Date pFVENCIM = FVENCIM != null ? new java.sql.Date(FVENCIM.getTime()) : null;

			BigDecimal pPNRIESGO = stringToBigDecimal((String) formdata.get("VNRIESGO"));
			BigDecimal pPSPROCES = stringToBigDecimal((String) formdata.get("VSPROCES"));
			BigDecimal pPIPRITARREA = stringToBigDecimal((String) formdata.get("VIPRITARREA"));
			BigDecimal pPPSOBREPRIMA = stringToBigDecimal((String) formdata.get("VPSOBREPRIMA"));
			BigDecimal pPCDETCES = stringToBigDecimal((String) formdata.get("VCDETCES"));
			BigDecimal pPIPLENO = stringToBigDecimal((String) formdata.get("VIPLENO"));
			BigDecimal pPICAPACI = stringToBigDecimal((String) formdata.get("VICAPACI"));
			BigDecimal pNMOVIGEN = stringToBigDecimal((String) formdata.get("VNMOVIGEN"));
			BigDecimal pPIEXTRAP = stringToBigDecimal((String) formdata.get("VIEXTRAP"));
			BigDecimal pIEXTREA = stringToBigDecimal((String) formdata.get("VIEXTREA"));
			BigDecimal pPITARIFREA = stringToBigDecimal((String) formdata.get("VITARIFREA"));

			BigDecimal pICAPES = new BigDecimal(0);
			BigDecimal pCESION = new BigDecimal(0);
			BigDecimal pICESION = new BigDecimal(0);

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_SET_ESTCESIONESREA(null, pPNCESION,
					pICESION, pICAPES, pSSEGURO, pPSSEGPOL, null, null, pNVERSION, pSCONTRA, pPCTRAMO, null, pPNRIESGO,
					null, null, pPGARANT, null, null, pFEFECTO, pFVENCIM, null, pCESION, pPSPROCES, pPCGENERA, null,
					null, null, pPNMOVIMI, null, pPIPRITARREA, pPPSOBREPRIMA, pPCDETCES, pPIPLENO, pPICAPACI, pNMOVIGEN,
					pPIEXTRAP, pIEXTREA, null, null, null, pPITARIFREA, null);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ejecutarSimulacion(HttpServletRequest request, Axisrea045Action thisAction) {
		logger.debug("Axisrea045Service m_busca_cesiones_manuales");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal pPSSEGURO = this.getCampoNumerico(request, "sseguro");
			formdata.put("SSEGURO", pPSSEGURO);

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapxlFlag = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_REASEGURO_XL(pPSSEGURO);
			BigDecimal salida = stringToBigDecimal(mapxlFlag.get("RETURN") + "");

			if (salida.equals(BigDecimal.ZERO)) {
				Map mapxl = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_XL(pPSSEGURO);
				tratarRETURNyMENSAJES(request, mapxl);
			} else {
				Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__SIMULACION_CIERRE_PROPORCIONAL(pPSSEGURO);
				tratarRETURNyMENSAJES(request, map);
			}

			Map mapList = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_SIM_ESTCESIONESREA(pPSSEGURO);
			List t_iax_sim_estcesionesrea = (List) tratarRETURNyMENSAJES(request, mapList);
			formdata.put("T_IAX_SIM_ESTCESIONESREA", t_iax_sim_estcesionesrea);
			logger.debug(mapList);

			tratarRETURNyMENSAJES(request, mapList);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin006Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_compruebaPorcentajes(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map;

		try {
			BigDecimal pPSSEGURO = this.getCampoNumerico(request, "sseguro");
			formdata.put("SSEGURO", pPSSEGURO);

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapGarant = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_GET_GARANT_EST(pPSSEGURO);
			tratarRETURNyMENSAJES(request, mapGarant);
			List listaGarantias = (List) tratarRETURNyMENSAJES(request, mapGarant);

			for (int i = 0; i < listaGarantias.size(); i++) {
				Map garant = (HashMap) listaGarantias.get(i);
				BigDecimal cgarant = stringToBigDecimal(garant.get("CGARANT") + "");
				logger.debug(cgarant);
				map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENTAJES(pPSSEGURO, cgarant);
				BigDecimal error = stringToBigDecimal(map.get("RETURN") + "");
				if (error.equals(BigDecimal.ZERO)) {// Si el porcentaje es igual a menor a 100
					Map mapRestramo = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_VALIDA_TRAMOS(pPSSEGURO);
					BigDecimal resTramo = stringToBigDecimal(mapRestramo.get("RETURN") + "");
					if (resTramo.equals(BigDecimal.ZERO)) {// valida que solo haya congigurado un tramo por cesion, no
															// pueden haber dos tramos iguales
						Map mapFacultativo = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_CABFACUL(pPSSEGURO);
						BigDecimal resFacultativo = stringToBigDecimal(mapFacultativo.get("RETURN") + "");
						if (resFacultativo.equals(BigDecimal.ZERO)) {// Generan los cuadros del tramo facultativo
							Map mapTras = pacIaxEstcesionesrea
									.ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_ESTTOCESIONESREA(pPSSEGURO);
							// Inicio (22872 - 39214) - AMC - 10/02/2016
							logger.debug(mapTras);

							// BigDecimal ResulAceptar=stringToBigDecimal(mapTras.get("RETURN")+"");
							// if(ResulAceptar.equals(BigDecimal.ZERO)){//valida si fue exitoso el traspaso
							// formdata.put("FLAGSALIR" , "OK");
							// }else{
							tratarRETURNyMENSAJES(request, mapTras);
							// }
							// Fin (22872 - 39214) - AMC - 10/02/2016
						} else {
							tratarRETURNyMENSAJES(request, mapFacultativo);
						}
					} else {
						tratarRETURNyMENSAJES(request, mapRestramo);
					}
				} else {
					tratarRETURNyMENSAJES(request, map);
				}

			}

			// Ejecuta TRASPASO_INF_ESTTOCESIONESREA
			formdata.put("SSEGURO", pPSSEGURO);
		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_ejecutarAceptar(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSSEGURO = this.getCampoNumerico(request, "sseguro");

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__TRASPASO_INF_ESTTOCESIONESREA(pPSSEGURO);
			formdata.put("SSEGURO", pPSSEGURO);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_reaseguro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_compruebaFacultativo(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSCESREA = stringToBigDecimal((String) formdata.get("PSCESREA"));
			BigDecimal PPCESION = stringToBigDecimal((String) formdata.get("PCESION"));

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__COMPRUEBAPORCENFACULTATIVO(pPSCESREA,
					PPCESION);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_compruebaFacultativo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cancelar(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGPOL = this.getCampoNumerico(request, "SSEGURO");

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_DEL_ESTCESIONESREA(new BigDecimal(-1),
					SSEGPOL, new BigDecimal(-1));

			BigDecimal ResulAceptar = stringToBigDecimal(map.get("RETURN") + "");
			if (ResulAceptar.equals(BigDecimal.ZERO)) {
				formdata.put("FLAGSALIR", "OK");
			} else {
				tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_compruebaFacultativo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_actualizaTramo(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pPSCESREA = stringToBigDecimal((String) formdata.get("scesrea"));
			BigDecimal pPCTRAMO = stringToBigDecimal((String) formdata.get("tramo"));

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_UPDATE_ESTCESIONESREA_TRAMO(pPSCESREA,
					pPCTRAMO);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_compruebaFacultativo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ejecutarBorrado(HttpServletRequest request, Axisrea045Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGPOL = this.getCampoNumerico(request, "SSEGURO");

			PAC_IAX_ESTCESIONESREA pacIaxEstcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxEstcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_DEL_ESTCESIONESREA(new BigDecimal(-1),
					SSEGPOL, new BigDecimal(-1));
			BigDecimal ResulAceptar = stringToBigDecimal(map.get("RETURN") + "");

			if (ResulAceptar.equals(BigDecimal.ZERO)) {
				formdata.put("FLAGSALIR", "OPEN");
			} else {
				tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea045Service - método m_compruebaFacultativo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
