//Revision:# cFAY51ef2EyhX05d70LfqA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin068Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import oracle.sql.CLOB;

public class Axissin068Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * Método que carga los datos de administración del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin068Action thisAction) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001098"));
			List listaClasesDemanda = (List) tratarRETURNyMENSAJES(request, map1);
			formdata.put("listaClasesDemanda", !isEmpty(listaClasesDemanda) ? listaClasesDemanda : new ArrayList());
			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001089"));
			List listaCausas = (List) tratarRETURNyMENSAJES(request, map3);
			formdata.put("listaCausas", !isEmpty(listaCausas) ? listaCausas : new ArrayList());
			Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001090"));
			List listaClases = (List) tratarRETURNyMENSAJES(request, map4);
			formdata.put("listaClases", !isEmpty(listaClases) ? listaClases : new ArrayList());
			Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001091"));
			List listaTipos = (List) tratarRETURNyMENSAJES(request, map5);
			formdata.put("listaTipos", !isEmpty(listaTipos) ? listaTipos : new ArrayList());
			Map map6 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001092"));

			List listaContingencia = (List) tratarRETURNyMENSAJES(request, map6);
			formdata.put("listaContingencia", !isEmpty(listaContingencia) ? listaContingencia : new ArrayList());
			Map map7 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001093"));
			List listaDespachos = (List) tratarRETURNyMENSAJES(request, map7);
			formdata.put("listaDespachos", !isEmpty(listaDespachos) ? listaDespachos : new ArrayList());
			Map map9 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001095"));
			List listaEstados = (List) tratarRETURNyMENSAJES(request, map9);
			formdata.put("listaEstados", !isEmpty(listaEstados) ? listaEstados : new ArrayList());
			Map map11 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001097"));
			List listaPosiciones = (List) tratarRETURNyMENSAJES(request, map11);
			formdata.put("listaPosiciones", !isEmpty(listaPosiciones) ? listaPosiciones : new ArrayList());
			Map map12 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001100"));
			List listaSentencia = (List) tratarRETURNyMENSAJES(request, map12);
			formdata.put("listaSentencia", !isEmpty(listaSentencia) ? listaSentencia : new ArrayList());
			Map map13 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001101"));
			List listaTerminacion = (List) tratarRETURNyMENSAJES(request, map13);
			formdata.put("listaTerminacion", !isEmpty(listaTerminacion) ? listaTerminacion : new ArrayList());

			Map map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
			BigDecimal pais = (BigDecimal) map.get("RETURN");
			formdata.put("CPAIS", pais);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
			List PROVINCIAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("PROVINCIAS", PROVINCIAS);

			BigDecimal pCPROVINO = this.getCampoNumerico(request, "CPROVINO");
			if (pCPROVINO != null) {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", pCPROVINO + "|||");
				List POBLACIONESO = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("POBLACIONESO", POBLACIONESO);
			}

			BigDecimal pCPROVINF = this.getCampoNumerico(request, "CPROVINF");
			if (pCPROVINF != null) {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", pCPROVINF + "|||");
				List POBLACIONESF = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("POBLACIONESF", POBLACIONESF);
			}
			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__f_get_lstoralproceso();

			formdata.put("oral_proceso", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el método Axissin068 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * Método que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin068Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			// BigDecimal NRADICA=getCampoNumerico(request, "NRADICA");
			BigDecimal isNew = getCampoNumerico(request, "isNew");
			String NRADICA = getCampoTextual(request, "NRADICA");
			String TTRAMITAD = getCampoTextual(request, "TTRAMITAD");

			// AB CONSULTA DE TRAMITACION BUG-
			BigDecimal CMODO = getCampoNumerico(request, "MODO") == null ? new BigDecimal(1)
					: getCampoNumerico(request, "MODO");
			formdata.put("CMODO", CMODO);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (NSINIES != null) {
				Map m = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_MAX_TRAMITA_ESTSINI(NSINIES);
				ArrayList valores = (ArrayList) m.get("RETURN");
				if (valores.size() > 0) {
					Map result = (Map) valores.get(0);
					formdata.put("NCONTIN", result.get("NCONTIN"));
				}
			}

			formdata.put("NRECLAMA", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("NCERTIF", NCERTIF);
			formdata.put("NORDEN", NORDEN);
			formdata.put("NRADICA", NRADICA);
			formdata.put("isNew", isNew);
			formdata.put("TTRAMITAD", TTRAMITAD);

			if (new BigDecimal(0).equals(isNew)) {

				this.m_cargar(request, thisAction);
			}
			this.cargarListas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin068Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map resultado = null;
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				String NSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");
				BigDecimal TPROCESO = getCampoNumerico(request, "TPROCESO");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				String TIEXTERNO = getCampoTextual(request, "TIEXTERNO");
				BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
				Date FRECEP = stringToSqlDate(getCampoTextual(request, "FRECEP"));
				Date FNOTIFI = stringToSqlDate(getCampoTextual(request, "FNOTIFI"));
				Date FVENCIMI = stringToSqlDate(getCampoTextual(request, "FVENCIMI"));
				Date FRESPUES = stringToSqlDate(getCampoTextual(request, "FRESPUES"));
				Date FCONCIL = stringToSqlDate(getCampoTextual(request, "FCONCIL"));
				Date FDESVIN = stringToSqlDate(getCampoTextual(request, "FDESVIN"));
				String TPRETEN = getCampoTextual(request, "TPRETEN");
				String TEXCEP1 = getCampoTextual(request, "TEXCEP1");
				String TEXCEP2 = getCampoTextual(request, "TEXCEP2");

				// BigDecimal CCONTI = (getCampoNumerico(request,
				// "CCONTI_MODIFVISIBLE"))==null?(getCampoNumerico(request,
				// "CCONTI")):(getCampoNumerico(request, "CCONTI_MODIFVISIBLE"));
				BigDecimal CCONTI = getCampoNumerico(request, "CCONTI");
				BigDecimal CDESPA = getCampoNumerico(request, "CDESPA");
				String CDESCF = getCampoTextual(request, "CDESCF");
				BigDecimal CPROVINF = getCampoNumerico(request, "CPROVINF");
				BigDecimal CPOBLACF = getCampoNumerico(request, "CPOBLACF");

				BigDecimal CDESPAO = getCampoNumerico(request, "CDESPAO");
				String CDESCO = getCampoTextual(request, "CDESCO");
				BigDecimal CPROVINO = getCampoNumerico(request, "CPROVINO");
				BigDecimal CPOBLACO = getCampoNumerico(request, "CPOBLACO");

				BigDecimal CPOSICI = getCampoNumerico(request, "CPOSICI");
				BigDecimal CDEMAND = getCampoNumerico(request, "CDEMAND");
				BigDecimal SAPODERA = getCampoNumerico(request, "SAPODERA");
				BigDecimal IDEMAND = getCampoNumerico(request, "IDEMAND");
				Date FTDEMAN = stringToSqlDate(getCampoTextual(request, "FTDEMAN"));
				BigDecimal ICONDEN = getCampoNumerico(request, "ICONDEN");
				BigDecimal CSENTEN = getCampoNumerico(request, "CSENTEN");
				Date FSENTE1 = stringToSqlDate(getCampoTextual(request, "FSENTE1"));
				BigDecimal CSENTEN2 = getCampoNumerico(request, "CSENTEN2");
				Date FSENTE2 = stringToSqlDate(getCampoTextual(request, "FSENTE2"));
				BigDecimal CASACION;
				if (getCampoNumerico(request, "CASACION") == null) {
					CASACION = BigDecimal.ZERO;
				} else {
					CASACION = getCampoNumerico(request, "CASACION");
				}
				Date FCASACI = stringToSqlDate(getCampoTextual(request, "FCASACI"));
				BigDecimal CTSENTE = getCampoNumerico(request, "CTSENTE");
				Date FTSENTE = stringToSqlDate(getCampoTextual(request, "FTSENTE"));
				String VTSENTE = getCampoTextual(request, "VTSENTE");
				String TFALLO = getCampoTextual(request, "TFALLO");

				BigDecimal CORALPROC = getCampoNumerico(request, "CORALPROC");
				BigDecimal UNICAINST;
				if (getCampoNumerico(request, "UNICAINST") == null) {
					UNICAINST = BigDecimal.ZERO;
				} else {
					UNICAINST = getCampoNumerico(request, "UNICAINST");
				}

				Date FUNICAINST = stringToSqlDate(getCampoTextual(request, "FUNICAINST"));

				resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL(NSINIES, NTRAMIT, NORDEN,
						CPROCESO, TPROCESO, CPOSTAL, CPOBLAC, CPROVIN, TIEXTERNO, SPROFES, FRECEP, FNOTIFI, FVENCIMI,
						FRESPUES, FCONCIL, FDESVIN, TPRETEN, TEXCEP1, TEXCEP2, CCONTI, CDESPA, CDESCF, CPROVINF,
						CPOBLACF, CDESPAO, CDESCO, CPROVINO, CPOBLACO, CPOSICI, CDEMAND, SAPODERA, IDEMAND, FTDEMAN,
						ICONDEN, CSENTEN, FSENTE1, CSENTEN2, FSENTE2, CASACION, FCASACI, CTSENTE, FTSENTE, VTSENTE,
						TFALLO, CORALPROC, UNICAINST, FUNICAINST);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
				if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
					request.setAttribute("grabarOK", true);
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - método m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	/**
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @throws Exception
	 */
	public

			void m_ajax_getProvinPobla(HttpServletRequest request) {
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
			logger.error("Error en el servicio Axissin006Service - método m_ajax_getProvinPobla", e);
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
			logger.error("Axissin068Service m_ajax_existe_persona - Excepcion", e);
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
			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axissin068Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_volver_per(HttpServletRequest request, Axissin068Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin068 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin068");

			if (!this.isEmpty(formdata_axissin068)) {
				formdata.putAll(formdata_axissin068);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin068"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - método m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_init(HttpServletRequest request, Axissin068Action thisAction) {
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_ver_persona(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_R");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

					Map OB_PERSONA = (Map) map.get("OBPERSONA");
					String nombre_completo = "";
					if ((String) OB_PERSONA.get("TNOMBRE") != null) {
						nombre_completo = (String) OB_PERSONA.get("TNOMBRE") + " " + (String) OB_PERSONA.get("TAPELLI1")
								+ " " + (String) OB_PERSONA.get("TAPELLI2");
					} else {
						nombre_completo = (String) OB_PERSONA.get("TAPELLI1");
					}

					request.getSession().setAttribute("NNUMIDEAUDEN", OB_PERSONA.get("NNUMIDE"));
					request.getSession().setAttribute("NOMBREAUDEN", nombre_completo);
					ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
				}
			}
		} catch (Exception e) {
			logger.error("Axisctr038Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				Map m = (Map) this.ActualizaPersona(request, NNUMIDE);

				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage031Service - método m_ajax_actualizar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el persona inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	private Map ActualizaPersona(HttpServletRequest request, String NNUMIDE) throws Exception {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map mapPersonas = new HashMap();
		// Cargar Agente de la BD
		Map persona = new HashMap();

		if (!isEmpty(NNUMIDE)) {
			String MODO_SWPUBLI = "PERSONAS_PUBPRIV";

			mapPersonas = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(NNUMIDE, null, null, null, null, null, null,
							null, MODO_SWPUBLI, null);

			List personas = (List) mapPersonas.get("RETURN");

			if (!isEmpty(mapPersonas.get("RETURN"))) {
				persona = (Map) personas.get(0);

			}
		}
		request.getSession().setAttribute("NOMBREAUDEN", persona.get("NOMBRE"));
		request.getSession().setAttribute("NNUMIDEAUDEN", persona.get("NNUMIDE"));

		return mapPersonas;
	}

	public void m_cargarListaCiudades(HttpServletRequest request, Axissin068Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		// Cargar Agente de la BD
		Map persona = new HashMap();
		String CPAIS = getCampoNumerico(request, "CPAIS") + "";

		try {
			Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION_NOPROV", CPAIS);
			List listaCiudades = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("listaCiudades", !isEmpty(listaCiudades) ? listaCiudades : new ArrayList());

		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cargar(HttpServletRequest request, Axissin068Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

		try {
			Map resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(NSINIES, NTRAMIT,
					NORDEN);
			Map objudicial = (Map) resultado.get("OBJUDICIAL");
			formdata.put("NTRAMIT", objudicial.get("NTRAMIT"));
			formdata.put("NORDEN", objudicial.get("NORDEN"));
			formdata.put("CPROCESO", objudicial.get("CPROCESO"));
			formdata.put("TPROCESO", objudicial.get("TPROCESO"));
			formdata.put("CPOSTAL", objudicial.get("CPOSTAL"));
			formdata.put("CPOBLAC", objudicial.get("CPOBLAC"));
			formdata.put("CPROVIN", objudicial.get("CPROVIN"));
			formdata.put("TIEXTERNO", objudicial.get("TIEXTERNO"));
			formdata.put("SPROFES", objudicial.get("SPROFES"));
			formdata.put("FRECEP", objudicial.get("FRECEP"));
			formdata.put("FNOTIFI", objudicial.get("FNOTIFI"));
			formdata.put("FVENCIMI", objudicial.get("FVENCIMI"));
			formdata.put("FRESPUES", objudicial.get("FRESPUES"));
			formdata.put("FCONCIL", objudicial.get("FCONCIL"));
			formdata.put("FDESVIN", objudicial.get("FDESVIN"));

			CLOB clob = (CLOB) objudicial.get("TPRETEN");
			if (clob != null) {
				String clobStr;

				try {
					clobStr = clob.getSubString(1, (int) clob.length());
					formdata.put("TPRETEN", clobStr);
				} catch (SQLException e) {
				}
			}
			CLOB clob1 = (CLOB) objudicial.get("TEXCEP2");
			if (clob1 != null) {
				String clobStr;

				try {
					clobStr = clob1.getSubString(1, (int) clob1.length());
					formdata.put("TEXCEP2", clobStr);
				} catch (SQLException e) {
				}
			}
			CLOB clob2 = (CLOB) objudicial.get("TEXCEP1");
			if (clob2 != null) {
				String clobStr;

				try {
					clobStr = clob2.getSubString(1, (int) clob2.length());
					formdata.put("TEXCEP1", clobStr);
				} catch (SQLException e) {
				}
			}

			formdata.put("CDESPA", objudicial.get("CDESPA"));
			formdata.put("CDESCF", objudicial.get("CDESCF"));
			formdata.put("CPROVINF", objudicial.get("CPROVINF"));
			formdata.put("CPOBLACF", objudicial.get("CPOBLACF"));
			formdata.put("CDESPAO", objudicial.get("CDESPAO"));
			formdata.put("CDESCO", objudicial.get("CDESCO"));
			formdata.put("CPROVINO", objudicial.get("CPROVINO"));
			formdata.put("CPOBLACO", objudicial.get("CPOBLACO"));

			formdata.put("CCONTI", objudicial.get("CCONTI"));
			formdata.put("CPOSICI", objudicial.get("CPOSICI"));
			formdata.put("CDEMAND", objudicial.get("CDEMAND"));
			formdata.put("SAPODERA", objudicial.get("SAPODERA"));
			formdata.put("IDEMAND", objudicial.get("IDEMAND"));
			formdata.put("FTDEMAN", objudicial.get("FTDEMAN"));
			formdata.put("ICONDEN", objudicial.get("ICONDEN"));
			formdata.put("CSENTEN", objudicial.get("CSENTEN"));
			formdata.put("FSENTE1", objudicial.get("FSENTE1"));
			formdata.put("CSENTEN2", objudicial.get("CSENTEN2"));
			formdata.put("FSENTE2", objudicial.get("FSENTE2"));
			formdata.put("CASACION", objudicial.get("CASACION"));
			formdata.put("FCASACI", objudicial.get("FCASACI"));
			formdata.put("CTSENTE", objudicial.get("CTSENTE"));
			formdata.put("FTSENTE", objudicial.get("FTSENTE"));
			formdata.put("VTSENTE", objudicial.get("VTSENTE"));
			CLOB clob3 = (CLOB) objudicial.get("TFALLO");
			if (clob3 != null) {
				String clobStr;

				try {
					clobStr = clob3.getSubString(1, (int) clob3.length());
					formdata.put("TFALLO", clobStr);
				} catch (SQLException e) {
				}
			}
			formdata.put("NNUMIDEPROFES", objudicial.get("NNUMIDEPROFES"));
			formdata.put("NOMBREPROFES", objudicial.get("NOMBREPROFES"));
			formdata.put("NNUMIDEAUDEN", objudicial.get("NNUMIDEAUDEN"));
			formdata.put("NOMBREAUDEN", objudicial.get("NOMBREAUDEN"));
			formdata.put("NNUMIDEAPO", objudicial.get("NNUMIDEAPO"));
			formdata.put("NOMBREAPO", objudicial.get("NOMBREAPO"));
			if (((List) objudicial.get("PERSONAS")).size() > 0) {

				List<Map> personas = (List<Map>) objudicial.get("PERSONAS");
				List personasBenef = new ArrayList<Map>();
				List personasDeman = new ArrayList<Map>();
				for (Map obpersona : personas) {
					if (((Map) obpersona.get("OB_IAX_SIN_T_JUDICIAL_DETPER")).get("NROL").equals(new BigDecimal(2))) {
						personasBenef.add(obpersona);
					} else {
						personasDeman.add(obpersona);
					}
				}
				if (personasBenef.size() > 0)
					formdata.put("personasBenef", personasBenef);
				if (personasDeman.size() > 0)
					formdata.put("personasDeman", personasDeman);
			}
			if (((List) objudicial.get("GARANTIAS")).size() > 0)
				formdata.put("GARANTIAS", (List) objudicial.get("GARANTIAS"));
			formdata.put("CMONEDAFAUL", "COP");

			if (((List) objudicial.get("AUDIENCIAS")).size() > 0)
				formdata.put("AUDIENCIAS", (List) objudicial.get("AUDIENCIAS"));

			formdata.put("ITOTASEG", objudicial.get("ITOTASEG"));
			formdata.put("ITOTPRET", objudicial.get("ITOTPRET"));
			formdata.put("CORALPROC", objudicial.get("CORALPROC"));
			formdata.put("UNICAINST", objudicial.get("UNICAINST"));
			formdata.put("FUNICAINST", objudicial.get("FUNICAINST"));

			// BigDecimal NRADICA=getCampoNumerico(request, "NRADICA");
			String NRADICA = getCampoTextual(request, "NRADICA");
			formdata.put("NRADICA", NRADICA);

		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar(HttpServletRequest request, Axissin068Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CTIPO = this.getCampoNumerico(request, "TIPO_DEL");
			String NSINIES = getCampoTextual(request, "NSINIES_RES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT_RES");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN_RES");
			BigDecimal NVALOR = null;
			if (CTIPO.equals(new BigDecimal(2)) || CTIPO.equals(new BigDecimal(3)) || CTIPO.equals(new BigDecimal(4)))
				NVALOR = this.getCampoNumerico(request, "NVALOR");
			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_JUDICIAL(CTIPO, NSINIES,
					NTRAMIT, NORDEN, NVALOR);
			// INI AXIS-3597 EA 2019-05-15 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
			// MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL
			// LA PANTALLA
			Map resultado2 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(NSINIES, NTRAMIT,
					NORDEN);
			Map objudicial = (Map) resultado2.get("OBJUDICIAL");

			HashMap mapa_pretension = new HashMap();
			BigDecimal importeFranquicia = (BigDecimal) tratarRETURNyMENSAJES(request, resultado2, false);
			mapa_pretension.put("ITOTASEG", (BigDecimal) objudicial.get("ITOTASEG"));
			mapa_pretension.put("ITOTPRET", (BigDecimal) objudicial.get("ITOTPRET"));
			ajax.rellenarPlAContenedorAjax(resultado2);
			ajax.guardarContenidoFinalAContenedorAjax(mapa_pretension);
			// FIN AXIS-3597 EA 2019-05-15 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
			// MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL
			// LA PANTALLA
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - método cargarJudicial", e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_cargarPoblaciones(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String PROVINCIA = this.getCampoTextual(request, "PROVINCIA");

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", PROVINCIA + "|||");
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - método m_ajax_cargarPoblaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
