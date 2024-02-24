package axis.service.modal;

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

import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin045Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin045Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin045Action thisAction) {
		logger.debug("Axissin045Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarDatos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axissin045Action thisAction) {
		logger.debug("Axissin045Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal pntramit = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pcgarant = isEmpty(getCampoNumerico(request, "CGARANT")) ? getCampoNumerico(request, "VGARANTIA")
					: getCampoNumerico(request, "CGARANT");
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPCTIPREG = getCampoNumerico(request, "CGARANT");
			BigDecimal pPCTIPGES = getCampoNumerico(request, "CTIPGES");
			BigDecimal pPCTIPPRO = getCampoNumerico(request, "CTIPPRO");
			BigDecimal pPCSUBPRO = getCampoNumerico(request, "CSUBPRO");
			BigDecimal pPSPROFES = getCampoNumerico(request, "SPROFES");
			BigDecimal pPSPERSED = getCampoNumerico(request, "SPERSED");
			BigDecimal pPSCONVEN = getCampoNumerico(request, "SCONVEN");
			BigDecimal pPCCANCOM = getCampoNumerico(request, "CCANCOM");
			BigDecimal pPCCOMDEF = getCampoNumerico(request, "CCOMDEF");
			BigDecimal pPCESTGES = getCampoNumerico(request, "CESTGES");
			BigDecimal pPCSUBGES = getCampoNumerico(request, "CSUBGES");
			BigDecimal pPNLOCALI = getCampoNumerico(request, "NLOCALI");
			Date pPFGESTIO = this.stringToSqlDate(this.getCampoTextual(request, "FGESTIO"));
			String SERVICIOS = getCampoTextual(request, "SERVICIOS");
			String MODO = getCampoTextual(request, "MODO");
			if (MODO != null) {
				MODO = MODO.toUpperCase();
				if (MODO.equalsIgnoreCase("modificar")) {
					pPCTIPREG = getCampoNumerico(request, "CGARANT_MOD");
					pPCTIPGES = getCampoNumerico(request, "CTIPGES_MOD");
					pPCTIPPRO = getCampoNumerico(request, "CTIPPRO_MOD");
					pPCSUBPRO = getCampoNumerico(request, "CSUBPRO_MOD");
					pPSPROFES = getCampoNumerico(request, "SPROFES_MOD");
					pPSPERSED = getCampoNumerico(request, "SPERSED_MOD");
					pPSCONVEN = getCampoNumerico(request, "SCONVEN_MOD");
					pPCCANCOM = getCampoNumerico(request, "CCANCOM_MOD");
					pPCCOMDEF = getCampoNumerico(request, "CCOMDEF_MOD");
					pPCESTGES = getCampoNumerico(request, "CESTGES_MOD");
					pPCSUBGES = getCampoNumerico(request, "CSUBGES_MOD");
					pPNLOCALI = getCampoNumerico(request, "NLOCALI_MOD");
					pPFGESTIO = this.stringToSqlDate(this.getCampoTextual(request, "FGESTIO_MOD"));
				}
			}
			BigDecimal pPSGESTIO = getCampoNumerico(request, "SGESTIO");

			// TODO treure-ho
			pPCCANCOM = new BigDecimal(1);
			pPCCOMDEF = pPCCANCOM;
			String pPTREFEXT = getCampoTextual(request, "TCOMENT");
			Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_SET_GESTION(MODO, pPSGESTIO, SSEGURO, pnsinies,
					pntramit, pcgarant, pPCTIPREG, pPCTIPGES, pPSPROFES, pPCTIPPRO, pPCSUBPRO, pPSPERSED, pPSCONVEN,
					pPCCANCOM, pPCCOMDEF, pPTREFEXT, pPCESTGES, pPCSUBGES, pPNLOCALI, pPFGESTIO, SERVICIOS);
			tratarRETURNyMENSAJES(request, m1);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_SET_GESTION devuelve: " + m1);
			if (m1.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
				formdata.put("MENSAJE", m1.get("PTLITERA"));
				formdata.put("SGESTIO", m1.get("PSGESTIO_OUT"));
				logger.debug("++++SGESTIO" + m1.get("PSGESTIO_OUT"));
			} else {
				tratarRETURNyMENSAJES(request, m1);
				cargarDatos(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarDatos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pnsinies = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			if (pPNTRAMIT == null) {
				pPNTRAMIT = getCampoNumerico(request, "indexTramitacio");
			}

			BigDecimal pPCTIPPRO = getCampoNumerico(request, "CTIPPRO");
			BigDecimal pPCSUBPRO = getCampoNumerico(request, "CSUBPRO");

			BigDecimal pPSPROFES = getCampoNumerico(request, "SPROFES");
			BigDecimal pSPROFES = getCampoNumerico(request, "pSPROFES");
			formdata.put("pSPROFES", pSPROFES);
			BigDecimal pPSPERSED = getCampoNumerico(request, "SPERSED");
			BigDecimal pPCTIPMOV = new BigDecimal("1"); // Estamos en ALTA siempre
			BigDecimal pPCESTGES = getCampoNumerico(request, "CESTGES");

			BigDecimal pSSERVIC = null;
			if (!isEmpty(request.getParameter("SSERVIC"))) {
				pSSERVIC = new BigDecimal(request.getParameter("SSERVIC"));
			}
			logger.debug("++++SSERVIC: " + pSSERVIC);
			formdata.put("SSERVIC", pSSERVIC);
			formdata.put("SERVICIOS", "");

			String pTDESCRI = request.getParameter("TDESCRI");
			logger.debug("++++TDESCRI: " + pTDESCRI);
			formdata.put("TDESCRI", pTDESCRI);

			java.sql.Date pPFECHA = stringToSqlDate(getCampoTextual(request, "FECHA"));

			String pMODO = getCampoTextual(request, "MODO");

			BigDecimal pCompFecha = getCampoNumerico(request, "comprovarFecha");

			if (pCompFecha != null && pCompFecha.equals(new BigDecimal(1))) {
				this.comprovarFechaGestion(request);
			}

			BigDecimal SGESTIO = this.getCampoNumerico(request, "SGESTIO");

			if (pMODO != null && pMODO.equalsIgnoreCase("modificar")) {
				formdata.put("MODO", pMODO);

				BigDecimal indexTramitacio = this.getCampoNumerico(request, "indexTramitacio");

				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();

				logger.debug("++++OB_IAX_SINIESTRO: " + map);

				Map OB_IAX_SINIESTRO = (Map) map.get("RETURN");

				ArrayList tramitaciones = (ArrayList) OB_IAX_SINIESTRO.get("TRAMITACIONES");
				Map tramitacion = (Map) tramitaciones.get(indexTramitacio.intValue());
				ArrayList gestiones = (ArrayList) ((Map) tramitacion.get("OB_IAX_SIN_TRAMITACION")).get("GESTIONES");

				for (int j = 0; j < gestiones.size(); j++) {
					Map gestion = (Map) ((Map) gestiones.get(j)).get("OB_IAX_SIN_TRAMITA_GESTION");
					logger.debug("++++SGESTIO: " + SGESTIO);
					logger.debug("++++SGESTIO map: " + gestion.get("SGESTIO"));
					if (gestion.get("SGESTIO").equals(SGESTIO)) {
						formdata.put("SSEGURO", gestion.get("SSEGURO"));
						formdata.put("SGESTIO", gestion.get("SGESTIO"));
						formdata.put("NLOCALI", gestion.get("NLOCALI"));
						formdata.put("CTIPGES", gestion.get("CTIPGES"));
						formdata.put("CTIPPRO", gestion.get("CTIPPRO"));
						formdata.put("CTIPREG", gestion.get("CTIPREG"));
						formdata.put("CSUBPRO", gestion.get("CSUBPRO"));
						formdata.put("TREFEXT", gestion.get("TREFEXT"));
						formdata.put("SPROFES", gestion.get("SPROFES"));
						formdata.put("SPERSED", gestion.get("SPERSED"));
						formdata.put("SCONVEN", gestion.get("SCONVEN"));
						formdata.put("CGARANT", gestion.get("CGARANT"));
						formdata.put("CESTGES", gestion.get("CESTGES"));
						formdata.put("CSUBGES", gestion.get("CSUBGES"));
						formdata.put("TCOMENT", gestion.get("TCOMENT"));

						formdata.put("SERVICIOS", gestion.get("SERVICIOS"));
						logger.debug("++++SERVICIOS: " + gestion.get("SERVICIOS"));
						pnsinies = (String) ((Map) tramitacion.get("OB_IAX_SIN_TRAMITACION")).get("NSINIES");
						pPNTRAMIT = (BigDecimal) ((Map) tramitacion.get("OB_IAX_SIN_TRAMITACION")).get("NTRAMIT");

						logger.debug("++++pnsinies: " + pnsinies);
						logger.debug("++++pntramit: " + pPNTRAMIT);
						formdata.put("NSINIES", pnsinies);
						formdata.put("NTRAMIT", pPNTRAMIT);

						if (gestion.get("CTIPGES") != null) {
							map = pac_axis_gestiones
									.ejecutaPAC_IAX_GESTIONES__F_GET_CFECHA((BigDecimal) gestion.get("CTIPGES"));
							logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_CFECHA devuelve: " + map);
							BigDecimal r = (BigDecimal) tratarRETURNyMENSAJES(request, map);
							if (r.equals(new BigDecimal(0))) {
								BigDecimal CFECHA = (BigDecimal) map.get("PCFECHA");
								formdata.put("CFECHA", CFECHA);
								formdata.put("FGESTIO", gestion.get("FGESTIO"));
							}
						}
					}
				}
			}

			if (!isEmpty(request.getParameter("SERVICIOS_TABLA"))) {
				formdata.put("SERVICIOS", f_montar_servicios(request));
			}

			logger.debug("++++formdata SERVICIOS" + formdata.get("SERVICIOS"));

			Map m1 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION(pnsinies, pPNTRAMIT);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTLOCALIZACION devuelve:" + m1);
			List lstlocalizacion = (List<Map>) tratarRETURNyMENSAJES(request, m1);
			selectFirstItem(lstlocalizacion, "NLOCALI", "NLOCALI", formdata);
			formdata.put("lstlocalizacion", lstlocalizacion);
			BigDecimal pPNLOCALI = getCampoNumerico(request, "NLOCALI");

			Map m2 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPGESTION(pnsinies, pPNTRAMIT);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPGESTION devuelve:" + m2);
			List lsttipgestion = (List<Map>) tratarRETURNyMENSAJES(request, m2);
			formdata.put("lsttipgestion", lsttipgestion);
			selectFirstItem(lsttipgestion, "CATRIBU", "CTIPGES", formdata);
			BigDecimal pPCTIPGES = getCampoNumerico(request, "CTIPGES");
			if (pPCTIPGES != null) {
				Map m3 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPPROF(pPCTIPGES);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTTIPPROF devuelve:" + m3);
				List lstprof = (List<Map>) tratarRETURNyMENSAJES(request, m3);
				formdata.put("lstprof", lstprof);
				selectFirstItem(lstprof, "CATRIBU", "CTIPPRO", formdata);
				pPCTIPPRO = getCampoNumerico(request, "CTIPPRO");
				if (pPCTIPPRO != null) {
					Map m4 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBPROF(pPCTIPGES, pPCTIPPRO);
					logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBPROF devuelve:" + m4);
					List lstsubprof = (List<Map>) tratarRETURNyMENSAJES(request, m4);
					formdata.put("lstsubprof", lstsubprof);
					selectFirstItem(lstsubprof, "CATRIBU", "CSUBPRO", formdata);
					pPCSUBPRO = getCampoNumerico(request, "CSUBPRO");
				}

				Map m8 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTGARANTIAS(pnsinies, pPCTIPGES);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTGARANTIAS devuelve:" + m8);
				List lstgarantias = (List<Map>) tratarRETURNyMENSAJES(request, m8);
				formdata.put("lstgarantias", lstgarantias);
				selectFirstItem(lstgarantias, "CGARANT", "CGARANT", formdata);
				Map m9 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTESTADOS(pPCTIPGES, pPCTIPMOV);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTESTADOS devuelve:" + m9);
				List lstestados = (List<Map>) tratarRETURNyMENSAJES(request, m9);
				formdata.put("lstestados", lstestados);
				selectFirstItem(lstestados, "CATRIBU", "CESTGES", formdata);
				Map m10 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBESTADOS(pPCTIPGES, pPCESTGES,
						pPCTIPMOV);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTSUBESTADOS devuelve:" + m10);
				List lstsubestados = (List<Map>) tratarRETURNyMENSAJES(request, m10);
				formdata.put("lstsubestados", lstsubestados);
				selectFirstItem(lstsubestados, "CATRIBU", "CSUBGES", formdata);
			}
			if ((pPNLOCALI != null) && (pPCTIPPRO != null) && (pPCSUBPRO != null)) {
				Map m5 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTPROFESIONAL(pnsinies, pPNTRAMIT,
						pPNLOCALI, pPCTIPPRO, pPCSUBPRO, SGESTIO);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTPROFESIONAL devuelve:" + m5);
				List lstprofesinal = (List<Map>) tratarRETURNyMENSAJES(request, m5);
				formdata.put("lstprofesinal", lstprofesinal);
				selectFirstItem(lstprofesinal, "SPROFES", "SPROFES", formdata);

				pPSPROFES = getCampoNumerico(request, "SPROFES");
				logger.debug("+++++pPSPROFES: " + pPSPROFES);

				if (pPSPROFES == null && pSPROFES != null) {
					pPSPROFES = pSPROFES;
				}

				Map m8 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_ACCESO_TRAMITADOR(new BigDecimal(pnsinies),
						pPNTRAMIT);
				logger.debug("+++++ejecutaPAC_IAX_GESTIONES__F_GET_ACCESO_TRAMITADOR devuelve:" + m8);
				BigDecimal r = (BigDecimal) tratarRETURNyMENSAJES(request, m8);
				BigDecimal pCCONVEN = null;
				if (r.equals(new BigDecimal(0))) {
					pCCONVEN = (BigDecimal) m8.get("PCCONVEN");
					formdata.put("CCONVEN", pCCONVEN);
				}

				if (pPSPROFES != null) {
					Map m6 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES(pPSPROFES);
					logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES devuelve:" + m6);
					List lstsedes = (List<Map>) tratarRETURNyMENSAJES(request, m6);
					formdata.put("lstsedes", lstsedes);
					selectFirstItem(lstsedes, "SPERSON", "SPERSED", formdata);
					pPSPERSED = getCampoNumerico(request, "SPERSED");
					logger.debug("++++spersed: " + pPSPERSED);
					logger.debug("++++formdata: " + formdata);
					Map m7 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTTARIFAS(pPSPROFES, pPSPERSED,
							pPFECHA, pCCONVEN);
					logger.debug("+++++ejecutaPAC_IAX_GESTIONES__F_GET_LSTTARIFAS devuelve:" + m7);
					List lsttarifas = (List<Map>) tratarRETURNyMENSAJES(request, m7);
					formdata.put("lsttarifas", lsttarifas);
					selectFirstItem(lsttarifas, "SCONVEN", "SCONVEN", formdata);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo cargarDatos", e);
		}
	}

	private void selectFirstItem(List llista, String atribute, String inputName, Map formdata) {
		Map map = null;
		if ((llista != null) && (llista.size() == 1)) {
			if (llista.get(0) != null) {
				map = (Map) llista.get(0);
				formdata.put(inputName, map.get(atribute));
			}
		}
	}

	public void m_ajax_calc_importe(HttpServletRequest request) {
		logger.debug("Axissin045Service m_ajax_calc_importe");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSCONVEN = getCampoNumerico(request, "SCONVEN");
			String iprecio = request.getParameter("IPRECIO");
			logger.debug("++++iprecio: " + iprecio);
			BigDecimal pPNVALSER = new BigDecimal(iprecio);
			// BigDecimal pPNVALSER = getCampoNumerico(request,"IPRECIO");
			String pPCCODMON = getCampoTextual(request, "CCODMON");
			BigDecimal pPCTIPCAL = getCampoNumerico(request, "CTIPCAL");

			Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_SEL_SERVICIO(pPSCONVEN, pPNVALSER, pPCCODMON,
					pPCTIPCAL);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_SEL_SERVICIO devuelve: " + map);

			List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
			logger.debug("lista ajax: " + plLista);

			ajax.guardarContenidoFinalAContenedorAjax(plLista);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo m_ajax_calc_importe", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// INI 0026592: LCOL_S010-SIN - Gestiones de talleres (autos) y repuestos
	public void m_gestionPermitida_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			PAC_IAX_GESTIONES pacIaxGestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pPNSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = this.getCampoNumerico(request, "NTRAMIT");
			BigDecimal pPCTIPGES = this.getCampoNumerico(request, "CTIPGES");

			Map map = pacIaxGestiones.ejecutaPAC_IAX_GESTIONES__F_GESTION_PERMITIDA(pPNSINIES, pPNTRAMIT, pPCTIPGES);
			logger.debug("+++++gestion_permitida: " + map);

			miDataObject.put("resultado", map);
			ajax.rellenarPlAContenedorAjax(map);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
	// FI 0026592: LCOL_S010-SIN - Gestiones de talleres (autos) y repuestos

	public void m_cargar_servicios(HttpServletRequest request, Axissin045Action thisAction) {

		logger.debug("Axissin045Service m_busqueda_servicios");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSSERVIC = getCampoNumerico(request, "SSERVIC");
			BigDecimal pPSCONVEN = getCampoNumerico(request, "SCONVEN");
			String pPTDESCRI = getCampoTextual(request, "TDESCRI");
			Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSERVICIOS(pPSSERVIC, pPTDESCRI, pPSCONVEN,
					null);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTSERVICIOS devuelve: " + map);
			List lstservicios = (List<Map>) tratarRETURNyMENSAJES(request, map);
			formdata.put("LSTSERVICIOS", lstservicios);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo m_busqueda_servicios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private List f_montar_servicios(HttpServletRequest request) {
		String[] servicios = ((String) request.getParameter("SERVICIOS_TABLA")).split(",");
		List lstservicios = new ArrayList();
		for (int i = 0; i < servicios.length; i++) {
			String[] campos_servicio = servicios[i].split("#");
			Map servicio = new HashMap();
			servicio.put("SSERVIC", campos_servicio[0]);
			servicio.put("TSERVIC", campos_servicio[1]);
			servicio.put("FCAMBIO", stringToSqlDate(campos_servicio[2]));
			servicio.put("NCANTID", campos_servicio[3]);
			servicio.put("ITOTAL", campos_servicio[4]);
			servicio.put("NVALSER", campos_servicio[5]);
			servicio.put("CNOCARG", campos_servicio[6]);
			Map ob_iax_sin_tramita_detgestion = new HashMap();
			ob_iax_sin_tramita_detgestion.put("OB_IAX_SIN_TRAMITA_DETGESTION", servicio);
			lstservicios.add(ob_iax_sin_tramita_detgestion);
		}

		logger.debug("++++lstservicios: " + lstservicios);
		return lstservicios;
	}

	private void comprovarFechaGestion(HttpServletRequest request) {
		logger.debug("Axissin045Service m_busqueda_servicios");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPCTIPGES = getCampoNumerico(request, "CTIPGES");
			if (pPCTIPGES != null) {
				Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_CFECHA(pPCTIPGES);
				logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_CFECHA devuelve: " + map);
				BigDecimal r = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (r.equals(new BigDecimal(0))) {
					BigDecimal CFECHA = (BigDecimal) map.get("PCFECHA");
					formdata.put("CFECHA", CFECHA);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo comprovarFechaGestion", e);
		}
	}

	public void m_ajax_get_servicios(HttpServletRequest request) {
		logger.debug("Axissin045Service m_ajax_get_servicios");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSCONVEN = getCampoNumerico(request, "SCONVEN");
			BigDecimal pPSTARIFA = getCampoNumerico(request, "STARIFA");
			BigDecimal pPNLINEA = getCampoNumerico(request, "NLINEA");

			Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_SERVICIOS(pPSCONVEN, pPSTARIFA, pPNLINEA);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_SERVICIOS devuelve: " + map);

			List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
			logger.debug("lista ajax: " + plLista);

			ajax.guardarContenidoFinalAContenedorAjax(plLista);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo m_ajax_get_servicios", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cancela_pantalla(HttpServletRequest request) {
		logger.debug("Axissin045Service m_ajax_cancela_pantalla");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSCONVEN = getCampoNumerico(request, "SCONVEN");
			BigDecimal pPSPROFES = getCampoNumerico(request, "SPROFES");
			BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");

			Map map = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_CANCELA_PANTALLA(pPSCONVEN, pPSPROFES, pPNSINIES,
					pPNTRAMIT);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_CANCELA_PANTALLA devuelve: " + map);

			BigDecimal plLista = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);
			logger.debug("lista ajax: " + plLista);

			ajax.guardarContenidoFinalAContenedorAjax(plLista);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin045Service - m�todo m_ajax_cancela_pantalla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
