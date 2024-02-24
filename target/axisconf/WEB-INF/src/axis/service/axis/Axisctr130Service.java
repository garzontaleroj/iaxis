package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DOC_FACTURA;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LIQUIDACION_TASA_X_MIL;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr130Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr130Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_form(request, thisAction);
	}

	public void m_form(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_load_data(request, thisAction);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			Map mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001180));
			List LS_TENEDOR = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TENEDOR -----------------> " + mapLs);
			request.setAttribute("LS_TENEDOR", !isEmpty(LS_TENEDOR) ? LS_TENEDOR : new ArrayList());

			formdata.put("LISTVALORES", LISTVALORES);
			this.cargaListasucursales(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private void cargaListasucursales(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String NOMBRE = getCampoTextual(request, "NOMBRE");
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		String CONDICION = getCampoTextual(request, "CONDICION");
		BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
		BigDecimal TIPAGENTE = new BigDecimal(2);
		HashMap map = null;

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE, new BigDecimal(1),
						CONDICION, TIPAGENTE);

		List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaSucursales", listaAgentes);
	}

	public void m_load_data(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String sprofes = request.getParameter("pCodiProf");
			String sperson = request.getParameter("SPERSON");
			logger.debug("+++++++codi m_form string: " + sprofes);
			logger.debug("+++++++sperson m_form string: " + sperson);
			BigDecimal codi = null;
			formdata.put("SPROFES_INI", sprofes);

			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}
			logger.debug("+++++++codi: " + codi);
			logger.debug("+++++++sperson: " + sperson);

			this.cargarDatosProfesional(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatosProfesional(HttpServletRequest request, Axisctr130Action thisAction, Map formdata)
			throws Exception {
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String sprofes = request.getParameter("pCodiProf");
			BigDecimal psperson = null;
			BigDecimal codi = null;
			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(codi);

			if (map.get("RETURN") != null) {
				Map ppsperson = (Map) map.get("OBPROFESIONAL");
				psperson = (BigDecimal) ppsperson.get("SPERSON");
			}
			formdata.put("SPERSON", psperson);

			logger.debug("++++MAP PROFESIONAL: " + map);
			formdata.put("OBPROFESIONAL", map.get("OBPROFESIONAL"));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (psperson != null) {
				Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(psperson);
				logger.debug(mapAg);
				request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
				if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg))) {
					List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
					if (retornAgentesVision.size() > 0) {
						HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
						BigDecimal CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
						formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						logger.debug("++++CAGENTE: " + CAGENTE);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr130Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ejecutar(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_ejecutar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cargar_factura(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_cargar_factura");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_cargar_factura", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_anular(HttpServletRequest request) {
		logger.debug("Axisctr130Service m_anular");

		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_anular", e);
		}
	}

	public void m_descargar(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_descargar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = new BigDecimal(24);
		String CEXPORT = "XLSX";
		String CMAP;
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CEMAIL = null;
		String CAGENTE = getCampoTextual(request, "CAGENTE");
		String SUCURSAL = getCampoTextual(request, "SUCURSAL");
		if (SUCURSAL == null) {
			SUCURSAL = " ";
		}

		BigDecimal REAL = new BigDecimal("0");
		REAL = getCampoNumerico(request, "REAL");
		String FDESDE = getCampoTextual(request, "FDESDE");
		String FHASTA = getCampoTextual(request, "FHASTA");
		String REPORTE = getCampoTextual(request, "REPORTE");

		String NITAGEINI = getCampoTextual(request, "NITAGEINI");

		String NITAGEFIN = getCampoTextual(request, "NITAGEFIN");

		String CODIGOSUCINI = getCampoTextual(request, "CODIGOSUCINI");

		String CODIGOSUCFIN = getCampoTextual(request, "CODIGOSUCFIN");

		try {
			if (REPORTE.equals("1")) {
				if (REAL.equals(new BigDecimal("0"))) {
					CMAP = "tasa_x_mil_resumen";
				} else {
					CMAP = "tasa_x_mil_resumen_pre";
				}

				PARAMETROS__.put("FDESDE", FDESDE);
				TPARAMETROS__.put("TFDESDE", "1");
				PARAMETROS__.put("FHASTA", FHASTA);
				TPARAMETROS__.put("TFHASTA", "1");

				if (NITAGEINI != null) {
					PARAMETROS__.put("CAGENTEH", NITAGEINI);
					TPARAMETROS__.put("TCAGENTEH", "1");
				} else {
					PARAMETROS__.put("CAGENTEH", "");
					TPARAMETROS__.put("TCAGENTEH", "1");
				}

				if (NITAGEFIN != null) {
					PARAMETROS__.put("CAGENTED", NITAGEFIN);
					TPARAMETROS__.put("TCAGENTED", "1");
				} else {
					PARAMETROS__.put("CAGENTED", "");
					TPARAMETROS__.put("TCAGENTED", "1");
				}

				if (CODIGOSUCINI != null) {
					PARAMETROS__.put("PSUCURSALD", CODIGOSUCINI);
					TPARAMETROS__.put("TPSUCURSALD", "1");
				} else {
					PARAMETROS__.put("PSUCURSALD", "");
					TPARAMETROS__.put("TPSUCURSALD", "1");
				}

				if (CODIGOSUCFIN != null) {
					PARAMETROS__.put("PSUCURSALH", CODIGOSUCFIN);
					TPARAMETROS__.put("TPSUCURSALH", "1");
				} else {
					PARAMETROS__.put("PSUCURSALH", "");
					TPARAMETROS__.put("TPSUCURSALH", "1");
				}
			} else {

				if (REAL.equals(new BigDecimal("0"))) {
					CMAP = "tasa_x_mil_detallado";
				} else {
					CMAP = "tasa_x_mil_detallado_pre";
				}

				PARAMETROS__.put("CAGENTE", CAGENTE);
				TPARAMETROS__.put("TCAGENTE", "1");
				PARAMETROS__.put("SUCURSAL", SUCURSAL);
				TPARAMETROS__.put("TSUCURSAL", "1");
				PARAMETROS__.put("FDESDE", FDESDE);
				TPARAMETROS__.put("TFDESDE", "1");
				PARAMETROS__.put("FHASTA", FHASTA);
				TPARAMETROS__.put("TFHASTA", "1");
			}
			;
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			System.out.println(ajax.getAjaxContainer());
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_ejecutar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr130Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr130Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = "NUEVA_PRODUCCION";

			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTE, new BigDecimal(1),
							CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	public void m_calcular(HttpServletRequest request, Axisctr130Action thisAction) {
		logger.debug("Axisctr130Service m_calcular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LIQUIDACION_TASA_X_MIL pac_axis_liquidacion = new PAC_IAX_LIQUIDACION_TASA_X_MIL(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

			Map resultado = null;

			BigDecimal pPCMODO = getCampoNumerico(request, "REAL");
			BigDecimal pPCEMPRESA = getCampoNumerico(request, "CEMPRESA");
			BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE_TEXT");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "SUCURSAL");
			Date pPFDESDE = stringToSqlDate(getCampoTextual(request, "FDESDE"));
			Date pPFHASTA = stringToSqlDate(getCampoTextual(request, "FHASTA"));

			resultado = pac_axis_liquidacion.ejecutaPAC_IAX_LIQUIDACION_TASA_X_MIL__LIQUIDACION_TASA_X_MIL(pPCMODO,
					pPCEMPRESA, pPCAGENTE, pPCSUCURSAL, pPFDESDE, pPFHASTA);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
			if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
				request.setAttribute("grabarOK", true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr130Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}
}