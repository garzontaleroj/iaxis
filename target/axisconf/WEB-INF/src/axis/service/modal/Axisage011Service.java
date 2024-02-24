//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAMPANAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisage011Action;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisage011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private final static String ASIGNAR = "ASIGNAR";
	private final static String DESASIGNAR = "DESASIGNAR";
	private final static String GANADORES = "GANADORES";

	private final static String ISASIGNAR = "isAsignar";
	private final static String ISDESASIGNAR = "isDesasignar";
	private final static String ISGANADORES = "isGanadores";

	private final static String SI = "S";
	private final static String NO = "N";

	public Axisage011Service() {
		super();
	}

	/**
	 * Carga formulario
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm011Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Vaciar tabla de la session
			/*
			 * CCODIGO se informa al abrir el modal, CCODIGO_CAMPA se informa con la primera
			 * busqueda por lo que si CCODIGO!=CCODIGO_CAMPA se tienen que vaciar las listas
			 * de la pantalla que esten en sesion por que pertenecen a consultas anteriores
			 * a otras compa�ias
			 */
			BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
			BigDecimal cCodigoCampa = getCampoNumerico(request, "CCODIGO_CAMPA");
			if (!cCodigo.equals(cCodigoCampa)) {
				request.getSession().setAttribute("axisage011_lista", null);
			}

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTTIPOAGENTE */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			// Carga modo
			// ISASIGNAR=true para asignar agentes a la campa�ia
			// ISDESASIGNAR=true para desasignar agentes de la campa�ia
			// ISGANADORES=true para marcar agentes ganadores
			String modo = (String) formdata.get("MODO");

			if (ISASIGNAR.equals(modo)) {
				formdata.put(ISASIGNAR, true);
				formdata.put(ISDESASIGNAR, false);
				formdata.put(ISGANADORES, false);
				java.sql.Date fInicam = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FINICAM"));
				formdata.put("FINICAM_AGE", fInicam);
			} else if (ISDESASIGNAR.equals(modo)) {
				formdata.put(ISASIGNAR, false);
				formdata.put(ISDESASIGNAR, true);
				formdata.put(ISGANADORES, false);
			} else if (ISGANADORES.equals(modo)) {
				formdata.put(ISASIGNAR, false);
				formdata.put(ISDESASIGNAR, false);
				formdata.put(ISGANADORES, true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm011Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Busca seg�n el modo ISASIGNAR, ISDESASIGNAR
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm011Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Boolean isAsignar = Boolean.TRUE.toString().equals(formdata.get(ISASIGNAR));
		Boolean isDesasignar = Boolean.TRUE.toString().equals(formdata.get(ISDESASIGNAR));
		Boolean isGanadores = Boolean.TRUE.toString().equals(formdata.get(ISGANADORES));

		BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
		formdata.put("CCODIGO_CAMPA", cCodigo);

		if (isAsignar) {
			m_buscar(request, ASIGNAR);
		} else if (isDesasignar) {
			m_buscar(request, DESASIGNAR);
		} else if (isGanadores) {
			m_buscar(request, GANADORES);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Busca seg�n el modo ISASIGNAR, ISDESASIGNAR
	 * 
	 * @param request
	 * @param modo
	 */
	private void m_buscar(HttpServletRequest request, String modo) {
		logger.debug("Axisadm011Service m_buscar");
		String modoFinal;
		if (GANADORES.equals(modo)) {
			modoFinal = DESASIGNAR;
		} else {
			modoFinal = modo;
		}
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal pPCCODIGO = getCampoNumerico(request, "CCODIGO");
		Date pPFINICAM = null;
		if (ASIGNAR.equals(modo)) {
			pPFINICAM = stringToSqlDate(getHiddenCampoTextual(request, "FINICAM"));
		}
		BigDecimal pPCTIPAGE = getCampoNumerico(request, "CTIPAGE");
		BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");
		BigDecimal pPIMETA = getCampoNumerico(request, "IMETA");

		Map LISTVALORES = new HashMap();
		LISTVALORES = (Map) formdata.get("LISTVALORES");

		try {
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_AGENTES_CAMPA(modoFinal, pPCCODIGO, pPFINICAM,
					pPCTIPAGE, pPCAGENTE);
			List<Map> RETURN = (List<Map>) map.get("PLISTAGE");

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
				List<Map> ListaAgentes = new ArrayList<Map>();
				Iterator returnIt = RETURN.iterator();
				if (ASIGNAR.equals(modo)) {
					while (returnIt.hasNext()) {
						Map age = (Map) returnIt.next();
						age.put("MARCAR", BigDecimal.ZERO);
						ListaAgentes.add(age);
					}
				} else if (DESASIGNAR.equals(modo)) {
					while (returnIt.hasNext()) {
						Map age = (Map) returnIt.next();
						Map ageMap = (Map) age.get("OB_IAX_CAMPAAGE");
						if (ageMap.get("FFINCAM") == null) {
							age.put("MARCAR", BigDecimal.ZERO);
							ListaAgentes.add(age);
						}
					}
				} else if (GANADORES.equals(modo)) {
					while (returnIt.hasNext()) {
						Map age = (Map) returnIt.next();
						Map ageMap = (Map) age.get("OB_IAX_CAMPAAGE");
						if (SI.equals(ageMap.get("BGANADOR"))) {
							age.put("MARCAR", BigDecimal.ONE);
						} else if (NO.equals(ageMap.get("BGANADOR"))) {
							age.put("MARCAR", BigDecimal.ZERO);
						}
						ListaAgentes.add(age);
					}
				}

				request.getSession().setAttribute("axisage011_lista", ListaAgentes);

			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm011Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Guarda valores de la lista de sesi�n axisage011_lista seg�n el modo
	 * ISASIGNAR: a�ade los agentes de la lista de session axisage011_lista con
	 * MARCAR=1 a la campa�a. ISDESASIGNAR: pone fecha fin a los agentes de la lista
	 * de sesi�n axisage011_lista con MARCAR=1. ISGANADORES: pone BGANADOR='S' a los
	 * agentes de la lista de sesi�n con MARCAR=1.
	 * 
	 * @param request
	 * @param axisage011Action
	 */
	public void m_aceptar(HttpServletRequest request, Axisage011Action axisage011Action) {
		logger.debug("Axisage011Service m_aceptar");
		request.getSession().getAttribute("axisage011_lista");

		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			logger.debug("Axisadm011Service m_buscar");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Boolean isAsignar = Boolean.TRUE.toString().equals(formdata.get(ISASIGNAR));
			Boolean isDesasignar = Boolean.TRUE.toString().equals(formdata.get(ISDESASIGNAR));
			Boolean isGanadores = Boolean.TRUE.toString().equals(formdata.get(ISGANADORES));
			List agentesList = (List) request.getSession().getAttribute("axisage011_lista");
			if (agentesList != null && agentesList.size() > 0) {
				Iterator agentesIt = agentesList.iterator();
				if (isAsignar) {
					while (agentesIt.hasNext()) {
						Map agenteMap = (Map) agentesIt.next();
						if (BigDecimal.ONE.equals(agenteMap.get("MARCAR"))) {
							Map map = (Map) agenteMap.get("OB_IAX_CAMPAAGE");
							BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
							BigDecimal cAgente = (BigDecimal) map.get("CAGENTE");
							BigDecimal cTipage = (BigDecimal) map.get("CTIPAGE");
							Date fInicam = stringToSqlDate(getHiddenCampoTextual(request, "FINICAM_AGE"));
							BigDecimal iMeta = getCampoNumerico(request, "IMETA");
							map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_SET_AGENTES_CAMPA(ASIGNAR, cCodigo,
									cAgente, cTipage, fInicam, null, iMeta);
							BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
						}
					}
					m_buscar(request);
				} else if (isDesasignar) {
					while (agentesIt.hasNext()) {
						Map agenteMap = (Map) agentesIt.next();
						if (BigDecimal.ONE.equals(agenteMap.get("MARCAR"))) {
							Map map = (Map) agenteMap.get("OB_IAX_CAMPAAGE");
							BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
							BigDecimal cAgente = (BigDecimal) map.get("CAGENTE");
							BigDecimal cTipage = (BigDecimal) map.get("CTIPAGE");
							Timestamp ini = (Timestamp) map.get("FINICAM");
							BigDecimal iMeta = getCampoNumerico(request, "IMETA");
							Date fInicam = null;
							if (ini != null) {
								fInicam = new java.sql.Date(ini.getTime());
							}
							Date fFincam = stringToSqlDate(getHiddenCampoTextual(request, "FFINCAM_AGE"));
							map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_SET_AGENTES_CAMPA(DESASIGNAR, cCodigo,
									cAgente, cTipage, fInicam, fFincam, iMeta);
							BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
						}
					}
					m_buscar(request);
				} else if (isGanadores) {
					while (agentesIt.hasNext()) {
						Map agenteMap = (Map) agentesIt.next();
						Map map = (Map) agenteMap.get("OB_IAX_CAMPAAGE");
						BigDecimal cCodigo = getCampoNumerico(request, "CCODIGO");
						BigDecimal cAgente = (BigDecimal) map.get("CAGENTE");
						if (BigDecimal.ONE.equals(agenteMap.get("MARCAR"))) {
							map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_SET_AGEGANADOR(cCodigo, cAgente, SI);
							BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
						} else {
							map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_SET_AGEGANADOR(cCodigo, cAgente, NO);
							BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
						}
					}
					m_buscar(request);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Busca un agente en la lista de sesi�n axisage011_lista si lo encuentra le
	 * cambia el valor MARCAR, si no lo encuentra lo a�ade.
	 * 
	 * @param request
	 */
	public void m_marcar_json(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();

		BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
		BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");

		List agentesList = (List) request.getSession().getAttribute("axisage011_lista");
		if (agentesList != null && agentesList.size() > 0) {
			List agentesResult = new ArrayList();
			Iterator agentesIt = agentesList.iterator();
			while (agentesIt.hasNext()) {
				Map agentesMap = (Map) agentesIt.next();
				Map map = (Map) agentesMap.get("OB_IAX_CAMPAAGE");
				if (CAGENTE != null) {
					if (map.get("CAGENTE").equals(CAGENTE)) {
						agentesMap.put("MARCAR", MARCAR);
					}
				} else {
					agentesMap.put("MARCAR", MARCAR);
				}
				agentesResult.add(agentesMap);
			}
			request.getSession().setAttribute("axisage011_lista", agentesResult);
			miDataObject.put("CAGENTE", CAGENTE);
		}
		request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
