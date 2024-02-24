package axis.service.axis;

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

import axis.jdbc.PAC_IAX_ANULACIONES;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr016Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr016Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr016Service.class);
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	public void m_init(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.remove("FANULAC");
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_form(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO_BAJA = this.getCampoNumerico(request, "SSEGURO_BAJA");
			logger.debug("SSEGURO_BAJA-->" + SSEGURO_BAJA);
			// BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA))?
			// this.getCampoNumerico(request,"SSEGURO") : SSEGURO_BAJA;

			BigDecimal SSEGURO;
			BigDecimal NPOLIZA;
			BigDecimal NCERTIF;

			if (SSEGURO_BAJA == null) {
				SSEGURO = isEmpty(this.getCampoNumerico(request, "SSEGURO"))
						? isEmpty(formdata.get("SSEGURO")) ? null
								: new BigDecimal(String.valueOf(formdata.get("SSEGURO")))
						: this.getCampoNumerico(request, "SSEGURO");
			} else {
				SSEGURO = SSEGURO_BAJA;
			}

			String formorigen = (String) request.getAttribute("formorigen");
			logger.debug("antes formorigen-->" + formorigen);

			if (!isEmpty(this.getCampoTextual(request, "formorigen"))
					&& this.getCampoTextual(request, "formorigen").equals("axisctr020")) {
				logger.debug("formorigen-->" + formorigen);
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");
			}

			logger.debug("SSEGURO-->" + SSEGURO);
			/*
			 * if (formdata.get("SSEGURO")!=null &&
			 * formdata.get("SSEGURO").toString().length()>0) { SSEGURO=new
			 * BigDecimal(formdata.get("SSEGURO").toString()); }
			 */
			/*
			 * java.sql.Date FANULAC = null; if (formdata.get("FANULAC") != null &&
			 * formdata.get("FANULAC").toString().length()>0) { FANULAC =
			 * java.sql.Date.valueOf(formdata.get("FANULAC").toString());//(java.sql.Date)
			 * DATE.fromText(s,"yyyy-MM-dd",null); }
			 */

			java.sql.Date FANULAC = isEmpty(this.getCampoTextual(request, "FANULAC"))
					? isEmpty(formdata.get("FANULAC")) ? null
							: this.stringToSqlDate(String.valueOf(formdata.get("FANULAC")))
					: this.stringToSqlDate(this.getCampoTextual(request, "FANULAC"));
			logger.debug("FANULAC-->" + FANULAC);
			BigDecimal CTIPANUL = isEmpty(this.getCampoNumerico(request, "CTIPANUL"))
					? isEmpty(formdata.get("CTIPANUL")) ? null
							: new BigDecimal(String.valueOf(formdata.get("CTIPANUL")))
					: this.getCampoNumerico(request, "CTIPANUL");
			logger.debug("CTIPANUL-->" + CTIPANUL);
			if ("true".equals(getCampoTextual(request, "LIMPIAR_DATOS"))) {
				// Reinicializar formdata
				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					formdata.remove(keySet[i]);
				}
				formdata.put("SSEGURO", SSEGURO);
			}

			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_ANULACIONES pacIaxAnulaciones = new PAC_IAX_ANULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPANULPOL();
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("tipanupol", m.get("RETURN"));

			if (SSEGURO != null) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				// request.setAttribute("datpoliza", m.get("RETURN"));
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, m);
				// BUG 39659 28/01/2016(abans de guardarlo a la request aegim el nou camp)
				BigDecimal nrenovcolm = null;
				if (!isEmpty(datosPoliza.get("NANUALI"))) {
					nrenovcolm = ((BigDecimal) datosPoliza.get("NANUALI")).add(new BigDecimal(-1));
				}
				datosPoliza.put("NRENOVCOLM", nrenovcolm);
				// Fi 39659
				request.setAttribute("datospoliza", datosPoliza);
				int v_csituac = -1;
				if (!isEmpty(datosPoliza.get("CSITUAC"))) {
					v_csituac = new BigDecimal(String.valueOf(datosPoliza.get("CSITUAC"))).intValue();
					request.setAttribute("CSITUAC", datosPoliza.get("CSITUAC"));
				}
				m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_DATPOLIZA(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				// request.setAttribute("datpoliza", m.get("RETURN"));
				// BUG 39659 28/01/2016(abans de guardarlo a la request aegim el nou camp)
				m.put("NRENOVCOLM", nrenovcolm);
				// Fi 39659
				request.setAttribute("datpoliza", m);

				BigDecimal SPRODUC = isEmpty(m.get("OSPRODUC"))
						? !isEmpty(m.get("OSPRODUC")) ? (BigDecimal) m.get("SPRODUC")
								: getCampoNumerico(request, "SPRODUC")
						: (BigDecimal) m.get("OSPRODUC");
				AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
				formdata.put("SPRODUC", SPRODUC);
				m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_ES_DESANULABLE(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);

				if (v_csituac != 2) {
					if (!isEmpty(m.get("OESTADO"))
							&& new BigDecimal(String.valueOf(m.get("OESTADO"))).intValue() == 1) {
						request.setAttribute("ES_DESANULABLE", "1");
					} else {
						request.setAttribute("ES_DESANULABLE", "0");
					}
				} else {
					request.setAttribute("ES_DESANULABLE", "2");
				}

				m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPANULPOL(SPRODUC);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				request.setAttribute("tipanupol", m.get("RETURN"));

				m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_TOMADORES(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				request.setAttribute("tomadores", m.get("RETURN"));

				m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_RECIBOS(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				request.setAttribute("recibos", m.get("RETURN"));

				m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_SINIESTROS(SSEGURO);
				logger.debug("m:" + m);
				tratarRETURNyMENSAJES(request, m);
				request.setAttribute("siniestros", m.get("RETURN"));

				this.m_cargarCombos(request, thisAction);

				if (FANULAC != null) {
					m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_RECPENDIENTES(SSEGURO, FANULAC);
					logger.debug("m:" + m);
					tratarRETURNyMENSAJES(request, m);
					request.setAttribute("recibos_pend", m.get("RETURN"));

					m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_RECCOBRADOS(SSEGURO, FANULAC);
					logger.debug("m:" + m);
					tratarRETURNyMENSAJES(request, m);
					request.setAttribute("recibos_cob", m.get("RETURN"));

					logger.debug("CTIPANUL --> " + CTIPANUL);
					if (!isEmpty(CTIPANUL) && CTIPANUL.intValue() == 4) {
						m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_VAL_FANULAC(SSEGURO, FANULAC,
								new BigDecimal(0));
						logger.debug("m:" + m);
						tratarRETURNyMENSAJES(request, m);
					}
				}

				// actualizarFormatoFechas(request, new String[] {"FANULAC"});
				// ini BPM
				BigDecimal NCASO_BPM = this.getCampoNumerico(request, "NCASO_BPM");
				if (isEmpty(NCASO_BPM)) {
					PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					NPOLIZA = (BigDecimal) datosPoliza.get("NPOLIZA");
					NCERTIF = (BigDecimal) datosPoliza.get("NCERTIF");
					if (!isEmpty(NPOLIZA)) {
						m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_CASO_BPM(NPOLIZA, NCERTIF, "ANULACION");
						logger.debug(m);
						tratarRETURNyMENSAJES(request, m);
						HashMap CASOBPM = (HashMap) m.get("PCASOBPM");
						formdata.put("NNUMCASO", CASOBPM.get("NNUMCASO") == null ? "" : CASOBPM.get("NNUMCASO"));
						formdata.put("NCASO_BPM", CASOBPM.get("NCASO_BPM") == null ? "" : CASOBPM.get("NCASO_BPM"));
						formdata.put("NSOLICI_BPM",
								CASOBPM.get("NSOLICI_BPM") == null ? "" : CASOBPM.get("NSOLICI_BPM"));
						formdata.put("TNOMCOM", CASOBPM.get("TNOMCOM") == null ? "" : CASOBPM.get("TNOMCOM"));
					}
				}
				// fi BPM
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void m_cargarCombos(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
			BigDecimal CTIPANUL = isEmpty(this.getCampoNumerico(request, "CTIPANUL"))
					? isEmpty(formdata.get("CTIPANUL")) ? null
							: new BigDecimal(String.valueOf(formdata.get("CTIPANUL")))
					: this.getCampoNumerico(request, "CTIPANUL");
			logger.debug("CTIPANUL-->" + CTIPANUL);
			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(SPRODUC, CTIPANUL);
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("causaanulpol", m.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_motivos(HttpServletRequest request) {
		logger.debug("Axisctr016Service m_ajax_busqueda_motivos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CCAUANULA = getCampoNumerico(request, "CCAUANULA");
			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(CCAUANULA);
			logger.debug("m:" + m);

			ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr016Service - m�todo m_ajax_busqueda_motivos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetMotivos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// BigDecimal CCAUSAANUL = new
		// BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request,
		// "CCAUSAANUL")));
		BigDecimal CCAUANULA = getCampoNumerico(request, "CCAUANULA");
		logger.debug("----Buscamos motivos ------");
		// Map m = new
		// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(CCAUSAANUL);
		// logger.debug(m);
		// List motivos = (List)tratarRETURNyMENSAJES (request, m,false);

		// return motivos;

		PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MOTANULPOL(CCAUANULA);
		logger.debug("m:" + m);
		List motivos = (List) tratarRETURNyMENSAJES(request, m, false);
		// request.setAttribute("motivos", m.get("RETURN"));
		return motivos;

	}

	public void m_recarg(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// this.m_cargarCombos(request,thisAction);
			BigDecimal CTIPANUL = new BigDecimal(getCampoTextual(request, "CTIPANUL"));
			BigDecimal SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(SPRODUC, CTIPANUL);
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("causaanulpol", m.get("RETURN"));
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_aceptar(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			// INI VALIDA DATOS BPM
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			HashMap m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GESTIONBPM__F2_VALIDA_DATOSBPM(NCASO_BPM, NSOLICI_BPM, SPRODUC, NPOLIZA, NCERTIF,
							"ANULACION");
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			if (pRETURN != null && !BigDecimal.ZERO.equals(pRETURN)) {
				ajax.guardarErrorAContenedorAjax(
						(String) ((HashMap) ((HashMap) ((ArrayList) m.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
								.get("TERROR"));
				return;
			}
			// FIN VALIDA DATOS BPM
			PAC_IAX_ANULACIONES pacIaxAnulaciones = new PAC_IAX_ANULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO_BAJA = getCampoNumerico(request, "SSEGURO_BAJA");
			BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA)) ? this.getCampoNumerico(request, "SSEGURO") : SSEGURO_BAJA;
			BigDecimal CTIPANUL = getCampoNumerico(request, "CTIPANUL");
			BigDecimal CCAUANULA = getCampoNumerico(request, "CCAUANULA");
			Date FANULAC = getCampoTextual(request, "FANULAC") != null ? sdf.parse(getCampoTextual(request, "FANULAC"))
					: null;
			String MOTANULA = getCampoTextual(request, "MOTANULA");
			BigDecimal RECEXTRN = getCampoNumerico(request, "RECEXTRN");
			BigDecimal ANULAREC = getCampoNumerico(request, "ANULAREC");
			BigDecimal IMPEXTORSION = getCampoNumerico(request, "IMPEXTORSION");

			String RECIBOS = getCampoTextual(request, "RECIBOS");
			BigDecimal APLICA_PENALI = getCampoNumerico(request, "APLICA_PENALI");

			if (isEmpty(getCampoNumerico(request, "RECEXTRN")))
				RECEXTRN = new BigDecimal(1);

			if (isEmpty(getCampoNumerico(request, "ANULAREC")))
				ANULAREC = new BigDecimal(1);

			if (isEmpty(FANULAC)) {
				FANULAC = getCampoTextual(request, "FANULAC_COR") != null
						? sdf.parse(getCampoTextual(request, "FANULAC_COR"))
						: null;
			}
			logger.warn("Prueba tracear anulacion : FANULAC = " + FANULAC);
			logger.debug("Prueba tracear anulacion : FANULAC = " + FANULAC);
			java.sql.Date FANULAC_2 = FANULAC != null ? new java.sql.Date(FANULAC.getTime()) : null;
			formdata.put("FANULAC", FANULAC);

			logger.debug("SSEGURO = " + SSEGURO);
			logger.debug("CTIPANUL = " + CTIPANUL);
			logger.debug("CCAUANULA = " + CCAUANULA);
			logger.debug("FANULAC = " + FANULAC);
			logger.debug("MOTANULA = " + MOTANULA);
			logger.debug("RECEXTRN = " + RECEXTRN);
			logger.debug("ANULAREC = " + ANULAREC);
			logger.debug("RECIBOS = " + RECIBOS);
			logger.debug("IMPEXTORSION = " + IMPEXTORSION);
			logger.debug("APLICA_PENALI = " + APLICA_PENALI);

			logger.warn("Prueba tracear anulacion : FANULAC_2 = " + FANULAC_2);
			logger.debug("Prueba tracear anulacion : FANULAC_2 = " + FANULAC_2);

			m = this.f_Get_Avisos(request, this.whoami(this));
			pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				Map map = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_ANULACION(SSEGURO, CTIPANUL, FANULAC_2,
						CCAUANULA, MOTANULA, RECEXTRN, ANULAREC, RECIBOS, APLICA_PENALI, IMPEXTORSION);
				logger.debug(map);
				boolean ANULACION = new BigDecimal(0).equals((BigDecimal) this.tratarRETURNyMENSAJES(request, map));

				if (ANULACION) {
					// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
					// RETURN es 0 � 1
					ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

					/* Rellenar SSEGURO a contenedor AJAX */
					Map OSSEGURO = new HashMap();
					OSSEGURO.put("OSSEGURO", SSEGURO);
					List RESULTADO = new ArrayList();
					RESULTADO.add(OSSEGURO);

					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
					// todo bien
					// ajax.guardarContenidoFinalAContenedorAjax(resultadoAjax);
					logger.debug("Anulado!");
					// INI BPM --> INFORMAR DATOS EN CASOS_BPMSEG
					BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
					m = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_GESTIONBPM__F_TRATA_MOVPOLIZA(SSEGURO, null, NCASO_BPM, NSOLICI_BPM,
									NNUMCASO);
					logger.debug(m);
					pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

					if (pRETURN != null && pRETURN.intValue() != 0) {
						HashMap error_bpm = new HashMap();
						error_bpm.put("MSG_BPM", (String) ((HashMap) ((HashMap) ((ArrayList) m.get("MENSAJES")).get(0))
								.get("OB_IAX_MENSAJES")).get("TERROR"));
						RESULTADO.add(error_bpm);
					}
					// FIN BPM --> INFORMAR DATOS EN CASOS_BPMSEG
				} else {
					ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });
					Map ERROR = new HashMap();
					ERROR.put("OERROR", ANULACION);
					List RESULTADO = new ArrayList();
					RESULTADO.add(ERROR);

					ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
					// todo mal
					logger.debug("NO Anulado!");
				}
			} else {
				ArrayList vavisos = (ArrayList) m.get("PLSTAVISOS");
				String mensaje = new String();
				for (int i = 0; i < vavisos.size(); i++) {
					mensaje = (String) ((HashMap) ((HashMap) vavisos.get(i)).get("OB_IAX_AVISO")).get("TMENSAJE");
				}
				ajax.guardarErrorAContenedorAjax(mensaje);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_cancelar(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_cancelar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_ANULACIONES pacIaxAnulaciones = new PAC_IAX_ANULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO_BAJA = getCampoNumerico(request, "SSEGURO_BAJA");
			BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA)) ? this.getCampoNumerico(request, "SSEGURO") : SSEGURO_BAJA;
			// Date FANULAC = getCampoTextual(request, "FANULAC") != null ?
			// sdf.parse(getCampoTextual(request, "FANULAC")) : null;

			// java.sql.Date FANULAC_2 = FANULAC != null ? new java.sql.Date(
			// FANULAC.getTime() ) : null;
			java.sql.Date FANULAC_2 = new java.sql.Date(new java.util.Date().getTime());

			// formdata.put("FANULAC", FANULAC);

			logger.debug("SSEGURO = " + SSEGURO);
			// logger.debug("FANULAC = "+FANULAC.toString());
			logger.debug("FANULAC_2 = " + FANULAC_2.toString());

			Map map = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_DESANULA_POLIZA_VTO(SSEGURO, FANULAC_2, null);
			logger.debug(map);

			// tratarRETURNyMENSAJES(request, map);
			// BigDecimal resultadoAjax = (BigDecimal) ajax.rellenarPlAContenedorAjax (map);

			// boolean ANULACION = new
			// BigDecimal(0).equals(this.stringToBigDecimal(String.valueOf(map.get("RETURN"))));
			boolean ANULACION = new BigDecimal(0).equals((BigDecimal) this.tratarRETURNyMENSAJES(request, map));

			// boolean ANULACION = new BigDecimal(0).equals(resultadoAjax);

			if (ANULACION) {
				// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
				// RETURN es 0 � 1
				ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

				/* Rellenar SSEGURO a contenedor AJAX */
				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", SSEGURO);
				List RESULTADO = new ArrayList();
				RESULTADO.add(OSSEGURO);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				// todo bien
				// ajax.guardarContenidoFinalAContenedorAjax(resultadoAjax);
				logger.debug("Anulado!");

			} else {
				ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });
				Map ERROR = new HashMap();
				ERROR.put("OERROR", ANULACION);
				List RESULTADO = new ArrayList();
				RESULTADO.add(ERROR);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				// todo mal
				logger.debug("NO Anulado!");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_cancelar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_solic_baja(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_solic_baja");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO_BAJA = getCampoNumerico(request, "SSEGURO_BAJA");
			BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA)) ? this.getCampoNumerico(request, "SSEGURO") : SSEGURO_BAJA;
			BigDecimal CTIPANUL = getCampoNumerico(request, "CTIPANUL");
			BigDecimal CCAUANULA = getCampoNumerico(request, "CCAUANULA");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FANULAC = stringToSqlDate(getCampoTextual(request, "FANULAC_COR"));
			String MOTANULA = getCampoTextual(request, "MOTANULA");
			String TOBSERV = getCampoTextual(request, "TOBSERV");

			Map map = new PAC_IAX_ANULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ANULACIONES__F_SET_SOLANULAC(SSEGURO, CTIPANUL, NRIESGO, FANULAC, TOBSERV, MOTANULA,
							CCAUANULA);

			boolean ANULACION = new BigDecimal(0).equals((BigDecimal) this.tratarRETURNyMENSAJES(request, map));

			if (ANULACION) {
				// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
				// RETURN es 0 � 1
				ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });

				Map OSSEGURO = new HashMap();
				OSSEGURO.put("OSSEGURO", SSEGURO);
				List RESULTADO = new ArrayList();
				RESULTADO.add(OSSEGURO);

				logger.debug("RESULTADO" + RESULTADO);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				// todo bien
				// ajax.guardarContenidoFinalAContenedorAjax(resultadoAjax);
				logger.debug("Anulado!");

			} else {
				ajax.rellenarPlAContenedorAjax(map, new String[] { "OSSEGURO" });
				Map ERROR = new HashMap();
				ERROR.put("OERROR", ANULACION);
				List RESULTADO = new ArrayList();
				RESULTADO.add(ERROR);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
				// todo mal
				logger.debug("NO Anulado!");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_tipanul(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_tipanul");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_ANULACIONES pacIaxAnulaciones = new PAC_IAX_ANULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			BigDecimal SSEGURO_BAJA = getCampoNumerico(request, "SSEGURO_BAJA");
			BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA)) ? this.getCampoNumerico(request, "SSEGURO") : SSEGURO_BAJA;
			BigDecimal CTIPANUL = null;
			CTIPANUL = new BigDecimal(getCampoTextual(request, "CTIPANUL"));

			m = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_SET_TIPANULACION(SSEGURO, CTIPANUL);
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			formdata.put("FANULAC", m.get("RETURN"));

			BigDecimal SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
			PAC_IAX_LISTVALORES pacIaxListvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = pacIaxListvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CAUSAANULPOL(SPRODUC, CTIPANUL);
			logger.debug("m:" + m);
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("causaanulpol", m.get("RETURN"));

			// PARA CONSERVAR DATOS INTRODUCIDOS EN CAMPOS BPM
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			String TNOMCOM = getCampoTextual(request, "TNOMCOM");
			request.setAttribute("NNUMCASO", NNUMCASO);
			request.setAttribute("NCASO_BPM", NCASO_BPM);
			request.setAttribute("NSOLICI_BPM", NSOLICI_BPM);
			request.setAttribute("TNOMCOM", TNOMCOM);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_tipanul", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/

	/*********************************************************************************************************************/
	public

			void m_consultar(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			/*
			 * BigDecimal SSEGURO= this.getCampoNumerico(request, "SSEGURO");
			 * thisAction.topPila(request, "SSEGURO", SSEGURO);
			 */

			/*
			 * HashMap passformdata=new HashMap();
			 * passformdata.put("SSEGURO",""+SSEGURO.intValue());
			 * request.setAttribute("passformdata", passformdata);
			 */

			thisAction.topPila(request, "formdata_axisctr016", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr016Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_volver(HttpServletRequest request, Axisctr016Action thisAction) {
		logger.debug("Axisctr016Service m_volver");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// formdata.put("SSEGURO", (BigDecimal) thisAction.removeTopPila(request,
			// "SSEGURO"));
			// formdata.remove("FANULAC");
			Map formdata_axisctr016 = (Map) thisAction.removeTopPila(request, "formdata_axisctr016");
			if (!isEmpty(formdata_axisctr016))
				formdata.putAll(formdata_axisctr016);

			// La fecha debe ser Date, si no, peta el JSTL
			/*
			 * if (formdata.get("FANULAC") instanceof String) { String FANULAC = (String)
			 * formdata.get("FANULAC"); if (!isEmpty (FANULAC)) formdata.put("FANULAC",
			 * sdf.parse (FANULAC)); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr016Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_ajax_aplica_penali(HttpServletRequest request) {
		logger.debug("Axisctr016Service m_ajax_aplica_penali");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_ANULACIONES pacIaxAnulaciones = new PAC_IAX_ANULACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NUMPROD = getCampoNumerico(request, "NUMPROD");
			BigDecimal CCAUANULA = getCampoNumerico(request, "CCAUANULA");
			logger.debug("NUMPROD:" + NUMPROD);
			logger.debug("CCAUANULA:" + CCAUANULA);

			// RSC 16/10/2012
			BigDecimal SSEGURO_BAJA = getCampoNumerico(request, "SSEGURO_BAJA");
			BigDecimal SSEGURO = (isEmpty(SSEGURO_BAJA)) ? this.getCampoNumerico(request, "PSSEGURO") : SSEGURO_BAJA;
			logger.debug("+++++++++++ SSEGURO:" + SSEGURO);
			// Fin

			Map map = pacIaxAnulaciones.ejecutaPAC_IAX_ANULACIONES__F_APLICA_PENALI_VISIBLE(NUMPROD, CCAUANULA,
					SSEGURO);
			logger.debug("map:" + map);
			if (!isEmpty(map)) {
				ajax.rellenarPlAContenedorAjax(map);
				Map chkVisible = new HashMap();
				chkVisible.put("CHKVISIBLE", map.get("PCVISIBLE"));
				ajax.guardarContenidoFinalAContenedorAjax(chkVisible);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr016Service - m�todo m_ajax_aplica_penali", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_casobpm(HttpServletRequest request) {
		logger.debug("Axisctr016Service m_ajax_cargar_casobpm");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal NCASO_BPM = getCampoNumerico(request, "NCASO_BPM");
			BigDecimal NSOLICI_BPM = getCampoNumerico(request, "NSOLICI_BPM");
			BigDecimal NNUMCASO = getCampoNumerico(request, "NNUMCASO");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_TOMCASO(NNUMCASO, NCASO_BPM, NSOLICI_BPM);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr016Service - m�todo  m_ajax_cargar_casobpm", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
