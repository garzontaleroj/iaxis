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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin082Action;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin082Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin082Action thisAction) {
		logger.debug("Axissin082Service m_form");

		try {

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal NAUDIEN = getCampoNumerico(request, "NAUDIEN");

			this.cargarListas(request, thisAction);

			if (!isEmpty(NSINIES) && !isEmpty(NTRAMIT) && !isEmpty(NORDEN) && !isEmpty(NAUDIEN)) {
				this.m_cargarAudiencia(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin082Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin082Action thisAction) throws Exception {
		logger.debug("Axissin082Service m_cargarListas");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

			Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001121"));
			List listaClases = (List) tratarRETURNyMENSAJES(request, map4);
			logger.debug(listaClases);
			formdata.put("listaClases", !isEmpty(listaClases) ? listaClases : new ArrayList());
			Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION_NOPROV",
					"170|");
			List listaCiudades = (List) tratarRETURNyMENSAJES(request, map5);
			logger.debug(listaCiudades);
			formdata.put("listaCiudades", !isEmpty(listaCiudades) ? listaCiudades : new ArrayList());
			Map map7 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001093"));
			List listaDespachos = (List) tratarRETURNyMENSAJES(request, map7);
			logger.debug(listaDespachos);
			formdata.put("listaDespachos", !isEmpty(listaDespachos) ? listaDespachos : new ArrayList());
			Map map8 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001094"));
			List listaOral = (List) tratarRETURNyMENSAJES(request, map8);
			logger.debug(listaOral);
			formdata.put("listaOral", !isEmpty(listaOral) ? listaOral : new ArrayList());
			Map map9 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001095"));
			List listaEstados = (List) tratarRETURNyMENSAJES(request, map9);
			logger.debug(listaEstados);
			formdata.put("listaEstados", !isEmpty(listaEstados) ? listaEstados : new ArrayList());
			Map map10 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001096"));
			List listaResolucion = (List) tratarRETURNyMENSAJES(request, map10);
			logger.debug(listaResolucion);
			formdata.put("listaResolucion", !isEmpty(listaResolucion) ? listaResolucion : new ArrayList());
		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin082 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * Metodo que carga los datos de una audiencia seleccionada
	 *
	 * @param request
	 * @param thisAction
	 */
	public void m_cargarAudiencia(HttpServletRequest request, Axissin082Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
		BigDecimal NAUDIEN = getCampoNumerico(request, "NAUDIEN");
		PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			Map resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_TRAMITE_JUDICIAL_AUDIEN(NSINIES,
					NTRAMIT, NORDEN, NAUDIEN);
			Map audiencia = (Map) resultado.get("AUDIENCIA");
			formdata.put("FAUDIEN", audiencia.get("FAUDIEN"));
			formdata.put("HAUDIEN", audiencia.get("HAUDIEN"));
			formdata.put("TAUDIEN", audiencia.get("TAUDIEN"));
			formdata.put("CDESPA", audiencia.get("CDESPA"));
			formdata.put("TLAUDIE", audiencia.get("TLAUDIE"));
			formdata.put("CAUDIEN", audiencia.get("CAUDIEN"));
			formdata.put("CDESPAO", audiencia.get("CDESPAO"));
			formdata.put("TLAUDIEO", audiencia.get("TLAUDIEO"));
			formdata.put("CAUDIENO", audiencia.get("CAUDIENO"));
			formdata.put("SABOGAU", audiencia.get("SABOGAU"));
			formdata.put("NNUMIDEAUDEN", audiencia.get("NNUMIDEAUDEN"));
			formdata.put("NOMBREAUDEN", audiencia.get("NOMBREAUDEN"));
			formdata.put("CORAL", audiencia.get("CORAL"));
			formdata.put("CESTADO", audiencia.get("CESTADO"));
			formdata.put("CRESOLU", audiencia.get("CRESOLU"));
			formdata.put("FINSTA1", audiencia.get("FINSTA1"));
			formdata.put("FINSTA2", audiencia.get("FINSTA2"));
			formdata.put("FNUEVA", audiencia.get("FNUEVA"));
			formdata.put("TRESULT", audiencia.get("TRESULT"));

		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar_audiencia(HttpServletRequest request, Axissin082Action thisAction) {
		logger.debug("Axissin082Service m_guardar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map resultado = null;
			if (pRETURN != null && pRETURN.intValue() != 1) {

				String NSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal NAUDIEN = getCampoNumerico(request, "NAUDIEN");
				Date FAUDIEN = stringToSqlDate(getCampoTextual(request, "FAUDIEN"));
				String HAUDIEN = getCampoTextual(request, "HAUDIEN");
				String TAUDIEN = getCampoTextual(request, "TAUDIEN");
				BigDecimal CDESPA = getCampoNumerico(request, "CDESPA");
				String TLAUDIE = getCampoTextual(request, "TLAUDIE");
				String CAUDIEN = getCampoTextual(request, "CAUDIEN");
				BigDecimal CDESPAO = getCampoNumerico(request, "CDESPAO");
				String TLAUDIEO = getCampoTextual(request, "TLAUDIEO");
				String CAUDIENO = getCampoTextual(request, "CAUDIENO");
				BigDecimal SABOGAU = getCampoNumerico(request, "SABOGAU");
				BigDecimal CORAL = getCampoNumerico(request, "CORAL");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
				BigDecimal CRESOLU = getCampoNumerico(request, "CRESOLU");
				Date FINSTA1 = stringToSqlDate(getCampoTextual(request, "FINSTA1"));
				Date FINSTA2 = stringToSqlDate(getCampoTextual(request, "FINSTA2"));
				Date FNUEVA = stringToSqlDate(getCampoTextual(request, "FNUEVA"));
				String TRESULT = getCampoTextual(request, "TRESULT");
				String CTRAMITAD = (String) formdata.get("CTRAMITAD");

				resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_AUDIEN(NSINIES, NTRAMIT,
						NORDEN, NAUDIEN, FAUDIEN, HAUDIEN, TAUDIEN, CDESPA, TLAUDIE, CAUDIEN, CDESPAO, TLAUDIEO,
						CAUDIENO, SABOGAU, CORAL, CESTADO, CRESOLU, FINSTA1, FINSTA2, FNUEVA, TRESULT, CTRAMITAD);
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
			logger.error("Error en el servicio Axissin082Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	public void m_ajax_ver_persona(HttpServletRequest request) {

		logger.debug("Axisage082Service m_ajax_ver_persona");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (formdata.get("paginar") == null) {

				BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_R");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON);
				logger.debug("get PERSONA()" + map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

					Map OB_PERSONA = (Map) map.get("OBPERSONA");
					logger.debug(OB_PERSONA);
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
			logger.error("Axissijn082Service m_ajax_ver_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisage082Service m_ajax_actualizar_persona");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			if (formdata.get("paginar") == null) {
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				Map m = (Map) this.ActualizaPersona(request, NNUMIDE);

				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin082Service - m�todo m_ajax_actualizar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el persona inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaPersona(HttpServletRequest request, String NNUMIDE) throws Exception {

		Map mapPersonas = new HashMap();
		// Cargar Agente de la BD
		Map persona = new HashMap();

		if (!isEmpty(NNUMIDE)) {
			String MODO_SWPUBLI = "PERSONAS_PUBPRIV";

			mapPersonas = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(NNUMIDE, null, null, null, null, null, null,
							null, MODO_SWPUBLI, null);

			logger.debug("actualizar_personas:" + mapPersonas);
			List personas = (List) mapPersonas.get("RETURN");

			if (!isEmpty(mapPersonas.get("RETURN"))) {
				persona = (Map) personas.get(0);
			}
		}
		request.getSession().setAttribute("NOMBREAUDEN", persona.get("NOMBRE"));
		request.getSession().setAttribute("NNUMIDEAUDEN", persona.get("NNUMIDE"));

		return mapPersonas;
	}

	public void m_init(HttpServletRequest request, Axissin082Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin082Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}