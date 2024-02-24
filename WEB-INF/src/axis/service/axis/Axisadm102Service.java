//Revision:# uIx7z2/8XKtAGb4MV+OMVw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm102Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm102Service m_init");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm096Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_salir");
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("REC_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm102Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES_DEFAULT = ((!isEmpty(usuario) && !isEmpty(usuario.getCempres())) ? usuario.getCempres()
					: null);
			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Nuevos campos
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			//
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PSUCUR = getCampoNumerico(request, "AGENTETIPO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal CEMPRES = getCampoNumerico(request, "list_CEMPRES");
			BigDecimal HABRECIBO = getCampoNumerico(request, "HABRECIBO");
			BigDecimal HSOFERTA = getCampoNumerico(request, "HSOFERTA");
			BigDecimal HPCMODIF = getCampoNumerico(request, "HPCMODIF");
			BigDecimal HPPDLEGAL = getCampoNumerico(request, "HPPDLEGAL");
			BigDecimal HPPJUDI = getCampoNumerico(request, "HPPJUDI");
			BigDecimal HPPGUNICA = getCampoNumerico(request, "HPPGUNICA");
			BigDecimal HPPESTATAL = getCampoNumerico(request, "HPPESTATAL");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Carga de empresa
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List T_IAX_EMPRESAS = (List) tratarRETURNyMENSAJES(request, map);

			if (CEMPRES != null && CEMPRES.intValue() == 0)
				CEMPRES = CEMPRES_DEFAULT;

			Map ramos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
			if (CEMPRES != null && CEMPRES.longValue() != 0 && CRAMO != null && CRAMO.longValue() != 0) {
				Map productos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES, CRAMO);
				logger.debug(productos);
				formdata.put("DOM_LSPRODUCTOS", tratarRETURNyMENSAJES(request, productos, false));
			}
			BigDecimal CIDIOMA = usuario.getCidioma();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), CIDIOMA, null);

			// map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null,
			// null, null, new BigDecimal(1));

			// Nuevos campos
			formdata.put("NRECIBO", NRECIBO);
			//

			formdata.put("CEMPRES", CEMPRES);
			formdata.put("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));
			formdata.put("T_IAX_EMPRESAS", T_IAX_EMPRESAS);
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("selected_CEMPRES", CEMPRES);

			formdata.put("NCERTIF", NCERTIF);
			formdata.put("AGENTETIPO", PSUCUR);
			formdata.put("CRAMO", CRAMO);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CAGENTE", CAGENTE);

			formdata.put("HABRECIBO", HABRECIBO);
			formdata.put("HSOFERTA", HSOFERTA);
			formdata.put("HPCMODIF", HPCMODIF);
			formdata.put("HPPDLEGAL", HPPDLEGAL);
			formdata.put("HPPJUDI", HPPJUDI);
			formdata.put("HPPGUNICA", HPPGUNICA);
			formdata.put("HPPESTATAL", HPPESTATAL);

			formdata.put("LSAGENTESTIPO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
			// Start Datospersona
			String cargaPersonas = getCampoTextual(request, "cargaPersonas");
			if (cargaPersonas != null) {
				// INI CARGA DE PERSONAS

				String TNOMBRE = getCampoTextual(request, "TNOMBRE");

				if (NNUMIDE == null)
					NNUMIDE = "";
				if (TNOMBRE == null)
					TNOMBRE = "";

				String CODIGO = "DATOSPERSONA";
				String CONDICION = NNUMIDE + "|" + TNOMBRE;

//	                 map = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_PUBLICINFO(CODIGO, CONDICION);
//	                 PAC_IAX_PERSONA PAC_IAX_PERSONA=new PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
//	                 map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_PUBLICAS(NNUMIDE, TNOMBRE, null, null, null, null, null); 
				logger.debug(map);
				List DATOSPERSONA = (List) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute(CODIGO, DATOSPERSONA);
				request.getSession().removeAttribute("REC_LSTRECIBOS");
				formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));

			}
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002020));
			logger.debug(map);
			formdata.put("LSTIMPREC", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
			// End datospersona

			if (!isEmpty(NNUMIDE)) {

				Map mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(NNUMIDE, NNUMORD);
				logger.debug("LST_PAGOUT: " + mapa);
				formdata.put("LST_PAGOUT", (List<Map>) tratarRETURNyMENSAJES(request, mapa, false));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm096Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	@SuppressWarnings("all")
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

	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm102 m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CAGENTE_TEXT = getCampoNumerico(request, "CAGENTE_TEXT");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal CESTGES = getCampoNumerico(request, "ESTGEST");
			Date FDESE = stringToSqlDate(getCampoTextual(request, "FDESE"));
			Date FHASTA = stringToSqlDate(getCampoTextual(request, "FHASTA"));
			BigDecimal TIPOPER = getCampoNumerico(request, "TIPO_PERS");

			PAC_IAX_GESTION_REC pac_IAX_GESTION_REC = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_GESTION_REC.ejecutaPAC_IAX_GESTION_REC__F_GET_LIQUIDACION(NRECIBO, CAGENTE_TEXT, NNUMIDE,
					CESTGES, FDESE, FHASTA, TIPOPER);
			logger.debug("LST : " + map);

			formdata.put("LST", (List<Map>) tratarRETURNyMENSAJES(request, map, false));
//			request.getSession().setAttribute("LST", (List <Map>) tratarRETURNyMENSAJES(request, map, false));
			logger.debug("LST : " + map);
			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm102Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	@SuppressWarnings("all")
	public void m_calcular(HttpServletRequest request) {
		logger.debug("Axisadm102Service m_calcular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			Map<BigDecimal, BigDecimal> recibos = new HashMap<BigDecimal, BigDecimal>();
			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			for (int i = 0; i < CUENTA.intValue(); i++) {
				BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);

				if (!isEmpty(SELEC) && SELEC.intValue() != 0) {
					recibos.put(NRECIBO, new BigDecimal("1"));
				} else {
					recibos.put(NRECIBO, new BigDecimal("0"));
				}
			}
			Map mapa = null;
			for (Map.Entry entry : recibos.entrySet()) {
				logger.debug(entry.getKey() + " " + entry.getValue());

				if (!isEmpty(entry.getKey()) && (new BigDecimal(1).equals(entry.getValue()))) {
					logger.debug("ejecutaPAC_IAX_ADM__F_CALCULA_COMISIONES" + " : " + entry.getKey() + " "
							+ entry.getValue());

					mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_CALCULA_COMISIONES((BigDecimal) entry.getKey());
					tratarRETURNyMENSAJES(request, mapa);
				}

			}

			if (!isEmpty(mapa)) {

				tratarRETURNyMENSAJES(request, mapa);
			}

			mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_INFO_PAGOS_OUT(NNUMIDE, null);

			logger.debug("LST_PAGOUT: " + mapa);

			formdata.put("LST_PAGOUT", (List<Map>) tratarRETURNyMENSAJES(request, mapa, false));
//			request.getSession().setAttribute("REC_LSTRECIBOS", (List <Map>) tratarRETURNyMENSAJES(request, map, false));
//			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm002Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
