//Revision:# kNHeeVsgGz1yO7qTWDRw9Q== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.jdbc.PAC_IAX_PARAM;
//Inicio Bartolo Herrera 05-03-2019 ---- IAXIS-2826
import axis.jdbc.PAC_IAX_PERSONA;
//Inicio Bartolo Herrera 05-03-2019 ---- IAXIS-2826
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr300Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr300Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisctr300Service m_init");
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			Map mapGenPoliza = this.dbLeePoliza(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

	private List dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("LISTA DE TOMADORES BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	private HashMap getTomador(HttpServletRequest request, ArrayList<HashMap> tomadores) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap tomador = null;
			if (!isEmpty(tomadores) && tomadores.size() > 0) {
				logger.debug("tomadores-->" + tomadores);
				for (HashMap tom : tomadores) {
					logger.debug("dom-->" + tom);
					logger.debug("OB_IAX_TOMADORES:" + tom.get("OB_IAX_TOMADORES"));
					HashMap m = (HashMap) tom.get("OB_IAX_TOMADORES");

					return m;
				}

			}
			return tomador;
		} catch (Exception e) {
			return null;
		}

	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr300Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			f_Cargar_Propiedades_Pantalla(request, whoami(this));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();

			Map mapGenPoliza = this.dbLeePoliza(request);
			// INICIO PRUEBA - BORRAR
//			mapGenPoliza=new HashMap();
			// FIN PRUEBA - BORRAR
			if (mapGenPoliza != null) {
				request.getSession().setAttribute("multiPantalla", true);
				request.getSession().setAttribute("SSEGURO", mapGenPoliza.get("SSEGURO"));
				ArrayList listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
				Map mapTomador = this.getTomador(request, listaTomadores);

				// Inicio Bartolo Herrera 01-03-2019 ---- IAXIS-2826

				BigDecimal SPERSON = new BigDecimal(mapTomador.get("SPEREAL").toString());
				String codigoParametro = "PER_EXCENTO_CONTGAR";
				BigDecimal valorParametro = BigDecimal.ZERO;
				PAC_IAX_PERSONA pac_iax_personas = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapParam = pac_iax_personas.ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA_CONT(SPERSON, codigoParametro);
				List<Map> lstMapParam = (List<Map>) tratarRETURNyMENSAJES(request, mapParam);
				if (!isEmpty(lstMapParam)) {
					for (Map parpersona : lstMapParam) {
						valorParametro = (BigDecimal) parpersona.get("NVALPAR");
					}
				}

				request.getSession().setAttribute("EXENTO_CONTRAGARANTIA", valorParametro);

				BigDecimal valorCupoPersona = BigDecimal.ZERO;
				
				//INI - CJAD - TASK 177 - GLPI 48934 - 14/02/2023
				//mapParam  = pac_iax_personas.ejecutaPAC_IAX_PERSONA__F_GET_CUPO_PERSONA(SPERSON);
				//List <Map> lstMapCupo = (List<Map>) tratarRETURNyMENSAJES(request, mapParam);
				//if (!isEmpty(lstMapCupo)) {
				//	for (Map cupoPersona : lstMapCupo) {
				//		valorCupoPersona = (BigDecimal)cupoPersona.get("CUPO");
	            //	}
				//}
				//FIN - CJAD - TASK 177 - GLPI 48934 - 14/02/2023

				request.getSession().setAttribute("CUPO_PERSONA", valorCupoPersona);

				// Fin Bartolo Herrera 01-03-2019 ---- IAXIS-2826

				// Inicio Bartolo Herrera 27-02-2019 IAXIS-2107
				java.sql.Date FCORTE = new java.sql.Date(new java.util.Date().getTime());
				String NNUMIDE = mapTomador.get("NNUMIDE").toString();
				String TIPOCUMULO = "2";

				PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				// Map mapCumulo =
				// pac_iax_cumulos_conf.ejecutaPAC_IAX_CUMULOS_CONF__F_GET_CUM_TOMADOR(FCORTE,
				// TIPOCUMULO, NNUMIDE);
				// List <Map> lstAcumulacionesRG = (List<Map>) tratarRETURNyMENSAJES(request,
				// mapCumulo);
				// BigDecimal totalCumulo = BigDecimal.ZERO;

				/*
				 * if (!isEmpty(lstAcumulacionesRG)) { if(lstAcumulacionesRG.size()>0) { for
				 * (Map cumulos : lstAcumulacionesRG) { totalCumulo =
				 * (BigDecimal)cumulos.get("CUM_TOT"); } } }
				 * 
				 * request.getSession().setAttribute("CUMULO", totalCumulo);
				 */

				PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map param = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("CUMULO_MINIMO", usuario.getCempres());
				BigDecimal paramCumuloMinimo = BigDecimal.ZERO;

				if (!isEmpty(param.get("RETURN"))) {
					paramCumuloMinimo = new BigDecimal(param.get("RETURN").toString());
				}

				request.getSession().setAttribute("CUMULO_MINIMO", paramCumuloMinimo);

				// Fin Bartolo Herrera 27-02-2019 IAXIS-2107

				// INICIO PRUEBA - BORRAR
				/*
				 * mapTomador=new HashMap(); mapTomador.put("SPERSON", "2188");
				 * mapTomador.put("NNUMIDE", "2188"); mapTomador.put("TNOMBRE1", "2188");
				 * mapTomador.put("TAPELLI1", "2188");
				 */
				// FIN PRUEBA - BORRAR
				request.getSession().setAttribute("TOMADOR_SPERSON", mapTomador.get("SPEREAL"));
				request.getSession().setAttribute("TOMADOR_NNUMIDE", mapTomador.get("NNUMIDE"));
				request.getSession().setAttribute("TOMADOR_TNOMBRE1", mapTomador.get("TNOMBRE1"));
				request.getSession().setAttribute("TOMADOR_TAPELLI1", mapTomador.get("TAPELLI1"));
				PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Inicio Bartolo Herrera 04-03-2019 ---- IAXIS-2826

				Map mapContragarantias = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(
						new BigDecimal(mapTomador.get("SPEREAL").toString()), null, null);

				// Fin Bartolo Herrera 04-03-2019 ---- IAXIS-2826

				List CONTRAGARANTIAS = (List) tratarRETURNyMENSAJES(request, mapContragarantias);
				if (CONTRAGARANTIAS == null) {
					CONTRAGARANTIAS = new ArrayList();
				}
				request.getSession().setAttribute("CONTRAGARANTIAS", CONTRAGARANTIAS);
				// Ini CONF-1379_QT_2036
				int miContcontra = CONTRAGARANTIAS.size();
				request.getSession().setAttribute("MI_CONTADOR", miContcontra);
				// Fin CONF-1379_QT_2036
				new AbstractDispatchAction().topPila(request, "CMODO", "ALTA_POLIZA");

			} else {
				request.getSession().setAttribute("multiPantalla", false);
				// new AbstractDispatchAction().topPila(request,"CMODO","GENERAL");//IAXIS-5256
			}
//			m_buscar(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisctr300Service m_buscar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			Map mapGenPoliza = this.dbLeePoliza(request);

			/*
			 * PAC_IAX_PRODUCCION pac_IAX_PRODUCCION=new
			 * PAC_IAX_PRODUCCION((java.sql.Connection)
			 * request.getAttribute(Constantes.DB01CONN)); Map
			 * mapContragarantias=pac_IAX_PRODUCCION.
			 * ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN(); List
			 * CONTRAGARANTIAS=(List)tratarRETURNyMENSAJES(request, mapContragarantias);
			 * logger.debug(CONTRAGARANTIAS);
			 */

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
			String pPNRADICA = getCampoTextual(request, "NRADICAPARAM");

			// Inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053

			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String NOMBRE = getCampoTextual(request, "NOMBRE");

			// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

			String datosPersona = "";// BARTOLO 21-03-2019 IAXIS-3243

			BigDecimal SSEGUROPRODUCCION = getCampoNumerico(request, "SSEGUROPRODUCCION");
			Object pMENSAJES = new Object();
			List CONTRAGARANTIAS = new ArrayList();
			if (SSEGUROPRODUCCION == null) {
				Map mapContragarantias = pac_IAX_CONTRAGARAN
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB(pPSPERSON, pPNRADICA, SSEGUROPRODUCCION);

				CONTRAGARANTIAS = (List) tratarRETURNyMENSAJES(request, mapContragarantias);

				// INICIO BARTOLO 21-03-2019 IAXIS-3243
				if (!isEmpty(CONTRAGARANTIAS)) {
					Map temp = (Map) CONTRAGARANTIAS.get(0);

					if (!isEmpty(temp.get("SPERSON"))) {
						PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						Map persona = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(
								(BigDecimal) temp.get("SPERSON"), usuario.getCagente());
						Map pp = (Map) persona.get("OBPERSONA");

						if (!isEmpty(pp.get("NNUMIDE")))
							datosPersona += pp.get("NNUMIDE").toString() + " - ";

						if (!isEmpty(pp.get("TNOMBRE")))
							datosPersona += pp.get("TNOMBRE").toString() + " ";

						if (!isEmpty(pp.get("TAPELLI1")))
							datosPersona += pp.get("TAPELLI1").toString() + " ";

						if (!isEmpty(pp.get("TAPELLI2")))
							datosPersona += pp.get("TAPELLI2").toString();
					}
				}
				// FIN BARTOLO 21-03-2019 IAXIS-3243

				if (CONTRAGARANTIAS == null) {
					CONTRAGARANTIAS = new ArrayList();
				}
			} else {
				BigDecimal TOMADOR_SPERSONX = getCampoNumerico(request, "TOMADOR_SPERSONX");
				Map mapContragarantias = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(
						TOMADOR_SPERSONX, null, SSEGUROPRODUCCION);
				CONTRAGARANTIAS = (List) tratarRETURNyMENSAJES(request, mapContragarantias);
				if (CONTRAGARANTIAS == null) {
					CONTRAGARANTIAS = new ArrayList();
				}
			}
			formdata.put("NRADICA", pPNRADICA);
			formdata.put("SPERSON", pPSPERSON);

			// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053

			formdata.put("NNUMIDE", NNUMIDE);
			formdata.put("NOMBRE", NOMBRE);

			// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

//			formdata.put("CONTRAGARANTIAS", CONTRAGARANTIAS);	

			request.getSession().setAttribute("CONTRAGARANTIAS", CONTRAGARANTIAS);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_refrescar(HttpServletRequest request) {
		logger.debug("Axisctr300Service m_refrescar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			Map mapGenPoliza = this.dbLeePoliza(request);

			PAC_IAX_PRODUCCION pac_IAX_PRODUCCION = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapContragarantias = pac_IAX_PRODUCCION.ejecutaPAC_IAX_PRODUCCION__F_REFRESH_CONTRAGARAN();
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapContragarantias);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - m�todo m_refrescar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_check(HttpServletRequest request) {
		logger.debug("Axisctr300Service m_check");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
			Map<BigDecimal, BigDecimal> recibos = new HashMap<BigDecimal, BigDecimal>();
			PAC_IAX_PRODUCCION pac_IAX_PRODUCCION = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			Map mapGenPoliza = this.dbLeePoliza(request);

			for (int i = 0; i < CUENTA.intValue(); i++) {
				BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);

				if (!isEmpty(SELEC) && SELEC.intValue() != 0) {
					recibos.put(NRECIBO, new BigDecimal("1"));
				} else {
					recibos.put(NRECIBO, new BigDecimal("0"));
				}
			}

			BigDecimal resultado = null;
			for (Map.Entry entry : recibos.entrySet()) {
				logger.debug(entry.getKey() + " " + entry.getValue());
				Map mapa = pac_IAX_PRODUCCION.ejecutaPAC_IAX_PRODUCCION__F_SET_CONTRAGARAN((BigDecimal) entry.getKey(),
						(BigDecimal) entry.getValue());
				logger.debug(mapa);
				resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - m�todo m_check", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver(HttpServletRequest request, Axisctr300Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axictr300 = (Map) thisAction.removeTopPila(request, "formdata_axictr300"); // 01
			if (!isEmpty(formdata_axictr300))
				formdata.putAll(formdata_axictr300); // 01

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr300Service - metodo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr300Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// BUG: 24685 2012-02-06 AEG preimpresos
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la
				// AXCTR027
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr300Service m_anterior");

		// Bug 9733 - AMC
		// m_validar(request, thisAction, Constantes.ANTERIOR);
		try {
			if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
				// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la
				// AXCTR027
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			// logger.error("Error en el servicio Axisctr004Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	@SuppressWarnings("all")
	public void m_ins_pol(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_ins_pol");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "X__SCONTGAR");
			BigDecimal PSSEGURO = getHiddenCampoNumerico(request, "X__SSEGURO");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "X__NMOVIMI");
			BigDecimal pSPERSON = getCampoNumerico(request, "X__SPERSON");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(pPSCONTGAR, PSSEGURO,
					pPNMOVIMI, "EST");
			this.tratarRETURNyMENSAJES(request, map);
			// Map INS_CONTRAGARAN_CODEU =(Map)tratarRETURNyMENSAJES(request,
			// map);
			// List CODEUDORES =(List)tratarRETURNyMENSAJES(request, map);
			logger.debug("INS_CONTRAGARAN_CODEU -----------------> " + map);
			// request.setAttribute("CODEUDORES",
			// !isEmpty(CODEUDORES)?CODEUDORES:new ArrayList());

			// Inicio Bartolo Herrera 06-03-2019 ---- IAXIS-2826
			Map mapContragarantias = pac_IAX_CONTRAGARAN
					.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(pSPERSON, null, PSSEGURO);
			// fin Bartolo Herrera 06-03-2019 ---- IAXIS-2826

			List CONTRAGARANTIAS = (List) tratarRETURNyMENSAJES(request, mapContragarantias);
			if (CONTRAGARANTIAS == null) {
				CONTRAGARANTIAS = new ArrayList();
			}
			request.getSession().setAttribute("CONTRAGARANTIAS", CONTRAGARANTIAS);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - m�todo m_ins_pol", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_del_pol(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_ins_pol");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "X__SCONTGAR");
			BigDecimal PSSEGURO = getHiddenCampoNumerico(request, "X__SSEGURO");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "X__NMOVIMI");
			BigDecimal pSPERSON = getCampoNumerico(request, "X__SPERSON");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_POL(pPSCONTGAR, PSSEGURO,
					pPNMOVIMI);
			this.tratarRETURNyMENSAJES(request, map);
			// Map INS_CONTRAGARAN_CODEU =(Map)tratarRETURNyMENSAJES(request,
			// map);
			// List CODEUDORES =(List)tratarRETURNyMENSAJES(request, map);
			logger.debug("INS_CONTRAGARAN_CODEU -----------------> " + map);
			// request.setAttribute("CODEUDORES",
			// !isEmpty(CODEUDORES)?CODEUDORES:new ArrayList());

			// Inicio Bartolo Herrera 06-03-2019 ---- IAXIS-2826
			Map mapContragarantias = pac_IAX_CONTRAGARAN
					.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CAB2(pSPERSON, null, PSSEGURO);
			// fin Bartolo Herrera 06-03-2019 ---- IAXIS-2826

			List CONTRAGARANTIAS = (List) tratarRETURNyMENSAJES(request, mapContragarantias);
			if (CONTRAGARANTIAS == null) {
				CONTRAGARANTIAS = new ArrayList();
			}
			request.getSession().setAttribute("CONTRAGARANTIAS", CONTRAGARANTIAS);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - m�todo m_ins_pol", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
