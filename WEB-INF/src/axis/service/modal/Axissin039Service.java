//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin039Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin039Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_SIN_TRAMITE pac_axis_sin_tramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			formdata.put("CAGENTE", usuario.getCagente());
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SPRODUC1 = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal CAUSA = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CTIPDEC = getCampoNumerico(request, "CTIPDEC");
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);
			String MODO = getCampoTextual(request, "MODO");

			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");
			BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
			BigDecimal pccausin = getCampoNumerico(request, "CCAUSIN");
			BigDecimal pcmotsin = getCampoNumerico(request, "CMOTSIN");

			BigDecimal LSTPERSONASRE = getCampoNumerico(request, "LSTPERSONASRE");
			logger.debug("---->LSTPERSONASRE:" + LSTPERSONASRE);
			formdata.put("LSTPERSONASRE", LSTPERSONASRE);

			BigDecimal NTRAMIT9999 = getCampoNumerico(request, "NTRAMIT9999");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("---->NTRAMIT9999:" + NTRAMIT9999);
			formdata.put("NTRAMIT9999", NTRAMIT9999);

			String NSINIES = this.getCampoTextual(request, "NSINIES");

			if (!isEmpty(LSTPERSONASRE) && LSTPERSONASRE.equals(new BigDecimal(1))) {
				Map m = pac_axis_sin_tramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(NSINIES, NTRAMIT9999);
				logger.debug("---> personas rel del 9999:" + m);
				ArrayList perrel = (ArrayList) m.get("PLISTAPERSREL");
				logger.debug("---> lista personas rel del 9999:" + perrel);
				formdata.put("LISTPERRELACIONADAS", perrel);
			}

			formdata.put("SPRODUC", psproduc);
			formdata.put("CACTIVI", pcactivi);
			formdata.put("CTRAMIT", pctramit);
			formdata.put("CCAUSIN", pccausin);
			formdata.put("CMOTSIN", pcmotsin);
			formdata.put("SPRODUC1", SPRODUC1);
			formdata.put("MODO", MODO);
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");

			if (!isEmpty(LSTPERSONASRE) && LSTPERSONASRE.equals(new BigDecimal(1))) {
				// formdata.put("indexTramitacio",NTRAMIT9999);
				// formdata.put("NTRAMITACION",indexTramitacio);
				formdata.put("NTRAMITACION", NTRAMIT);
			} /*
				 * else formdata.put("indexTramitacio",indexTramitacio);
				 */
			logger.debug("**********indexTramitacio: " + indexTramitacio);

			cargarListas(request, thisAction);

			if (CAUSA != null) {
				m_selected_causa(request, thisAction);
			} else if (formdata.get("CCAUSIN") != null) {
				m_selected_causa(request, thisAction);
			}
			ArrayList lista_riesgos = (ArrayList) formdata.get("T_IAX_RIESGOS");
			logger.debug(lista_riesgos);

			List polTomadoresReturn = this.dbGetPolTomadores(request, usuario, SSEGURO);
			formdata.put("T_IAX_TOMADORES", polTomadoresReturn);
			logger.debug("ctipdec-->" + CTIPDEC);
			CTIPDEC = isEmpty(CTIPDEC)
					? !isEmpty(formdata.get("CTIPDEC")) ? (BigDecimal) formdata.get("CTIPDEC") : CTIPDEC
					: CTIPDEC;
			logger.debug("ctipdec 2-->" + CTIPDEC);
			if (!isEmpty(CTIPDEC)) {
				formdata.put("CTIPDEC", CTIPDEC);
				String SP = this.getCampoTextual(request, "SP_DEC");
				if (!isEmpty(SP) && SP.equals("vaciar")) {
					formdata.put("DEC_SPERSON", "");
				}

				if (CTIPDEC.intValue() == 1 || CTIPDEC.intValue() == 2) {

					Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);

					List polAsegReturn = (List) OB_IAX_RIESGOS.get("RIESGOASE");
					formdata.put("T_IAX_ASEGURADOS", polAsegReturn);
				} else {
					if (CTIPDEC.intValue() == 3) {

						Map OB_IAX_RIESGOS = this.dbGetRiesgo(request, usuario, NRIESGO);
						List polConductoresReturn = (List) OB_IAX_RIESGOS.get("RIESAUTOS");
						formdata.put("T_IAX_CONDUCTORES", polConductoresReturn);
					}
				}
			}

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_producccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (SPRODUC == null) {
				Map map_producccion = pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug("------> datos poliza:" + map_producccion);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map_producccion);

				SPRODUC = (BigDecimal) datosPoliza.get("SPRODUC");
				formdata.put("SPRODUC", SPRODUC);
				formdata.put("SSEGURO", SSEGURO);
			}

			if (NRIESGO == null) {
				Map map_siniestro = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_SINIESTRO();
				logger.debug("------> datos sini:" + map_siniestro);
				Map datosSiniestro = (Map) tratarRETURNyMENSAJES(request, map_siniestro);

				NRIESGO = (BigDecimal) datosSiniestro.get("NRIESGO");
				formdata.put("NRIESGO", NRIESGO);

				pac_axis_producccion.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);
				logger.debug("------> datos riesgo:" + map_siniestro);
				Map datosRiesgo = (Map) tratarRETURNyMENSAJES(request, map_siniestro);

				formdata.put("TRIESGO", datosSiniestro.get("TRIESGO"));

			}

			/* validacion de innomidados */
			// BigDecimal NRIESGO = (BigDecimal)formdata.get("NRIESGO");
			if (SPRODUC != null && NRIESGO != null && SSEGURO != null) {
				Map map4 = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__FF_HAY_LISTA_INNOMINADOS(SPRODUC, SSEGURO,
						NRIESGO);
				// BigDecimal valInomidados = (BigDecimal)map4.get("RETURN");
				this.tratarRETURNyMENSAJES(request, map4, false);
				BigDecimal valInomidados = (BigDecimal) map4.get("PNASEGUR");
				if (valInomidados != null) {
					logger.debug("valInomidados: " + valInomidados);
					formdata.put("VALINNOMIDADOS", valInomidados);
				} else {
					logger.debug("valInomidados: " + 0);
					formdata.put("VALINNOMIDADOS", 0);
				}
			}

			// Cargamos los datos de la persona relacionada si est� en modo MODIFICACION
			if ("MOD".equals(MODO)) {
				cargarDatos(request);

			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin039Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			String SSEGURO = this.getCampoTextual(request, "SSEGURO");
			logger.debug(SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			BigDecimal NPERSREL = getCampoNumerico(request, "NPERSREL");
			logger.debug(NPERSREL);
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			logger.debug(CTIPIDE);
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			logger.debug(NNUMIDE);
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			logger.debug(TNOMBRE);

			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			logger.debug(TAPELLI1);
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			logger.debug(TAPELLI2);
			String TTELEFON = getCampoTextual(request, "TTELEFON");
			logger.debug(TTELEFON);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug(SPERSON);
			String TDESC = getCampoTextual(request, "TDESC");
			logger.debug(TDESC);

			// Bug 22325/115249 - 05/06/2012 - AMC
			BigDecimal DEC_SPERSON = getCampoNumerico(request, "DEC_SPERSON");
			logger.debug(DEC_SPERSON);
			String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
			logger.debug(TNOMBRE1);
			String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
			logger.debug(TNOMBRE2);
			String TMOVIL = getCampoTextual(request, "TMOVIL");
			logger.debug(TMOVIL);
			String TEMAIL = getCampoTextual(request, "TEMAIL");
			logger.debug(TEMAIL);

			String VTNOMBRE = null;
			if (isEmpty(TNOMBRE))
				VTNOMBRE = TNOMBRE1;
			else
				VTNOMBRE = TNOMBRE;

			BigDecimal SPERSON_SE = getCampoNumerico(request, "SPERSON_SE");
			BigDecimal CTIPIDE_SE = getCampoNumerico(request, "CTIPIDE_SE");
			String NNUMIDE_SE = getCampoTextual(request, "NNUMIDE_SE");
			String TNOMBRE_SE = getCampoTextual(request, "TNOMBRE_SE");
			String TAPELLI1_SE = getCampoTextual(request, "TAPELLI1_SE");
			String TAPELLI2_SE = getCampoTextual(request, "TAPELLI2_SE");
			String TTELEFON_SE = getCampoTextual(request, "TTELEFON_SE");
			String TDESC_SE = getCampoTextual(request, "TDESC_SE");
			String TNOMBRE2_SE = getCampoTextual(request, "TNOMBRE2_SE");
			String TMOVIL_SE = getCampoTextual(request, "TMOVIL_SE");
			String TEMAIL_SE = getCampoTextual(request, "TEMAIL_SE");
			BigDecimal LSTPERSONASRE = getCampoNumerico(request, "LSTPERSONASRE");
			BigDecimal NTRAMITACION = getCampoNumerico(request, "NTRAMITACION");
			BigDecimal NTRAMIT9999 = getCampoNumerico(request, "NTRAMIT9999");
			// bug 0024690
			BigDecimal pCTIPREL = getCampoNumerico(request, "CTIPREL");
			BigDecimal CTIPREL_SE = getCampoNumerico(request, "CTIPREL_SE");
			logger.debug("pCTIPREL=" + pCTIPREL + " CTIPREL_SE=" + CTIPREL_SE);

			Map map = null;
			if (!isEmpty(LSTPERSONASRE) && LSTPERSONASRE.equals(new BigDecimal(1)))
				map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(NSINIES, NTRAMITACION,
						NPERSREL, CTIPIDE_SE, NNUMIDE_SE, TNOMBRE_SE, TAPELLI1_SE, TAPELLI2_SE, TTELEFON_SE, SPERSON_SE,
						TDESC_SE, TNOMBRE2_SE, TMOVIL_SE, TEMAIL_SE, CTIPREL_SE);
			else {
				if (isEmpty(NTRAMIT9999))
					map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(NSINIES, NTRAMIT,
							NPERSREL, CTIPIDE, NNUMIDE, VTNOMBRE, TAPELLI1, TAPELLI2, TTELEFON, DEC_SPERSON, TDESC,
							TNOMBRE2, TMOVIL, TEMAIL, pCTIPREL);
				else
					map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_SINTRAMIPERSONAREL(NSINIES, NTRAMIT9999,
							NPERSREL, CTIPIDE, NNUMIDE, VTNOMBRE, TAPELLI1, TAPELLI2, TTELEFON, DEC_SPERSON, TDESC,
							TNOMBRE2, TMOVIL, TEMAIL, pCTIPREL);
			}
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			} else {
				request.setAttribute("OK", "KO"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin039Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_selected_causa(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin001Service AJAX m_ajax_selected_causa");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, SSEGURO, NRIESGO, FSINIES, CACTIVI);

			// listValores.put("lstmotivos", );

			formdata.put("lstmotivos", (List) tratarRETURNyMENSAJES(request, plReturn));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los motivos
	 * (seg�n la causa seleccionada) de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param CCAUSA
	 * @param CRAMO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetMotivosIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCAUSA, BigDecimal SPRODUC,
			BigDecimal SSEGURO, BigDecimal NRIESGO, java.sql.Date FSINIES, BigDecimal CACTIVI) throws Exception {
		Map mapa = new HashMap();
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_MOTIVOSSINI(SPRODUC, CCAUSA, CACTIVI, SSEGURO);
		logger.debug("MOTIVOS INI axissin001---------------------------------------->" + m);
		return mapa;
		// GET_MOTIVOSSINI(SPRODUC, CCAUSA, CACTIVI);
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N CAMPOS DIRECCION
	 **************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar la direcci�n de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	public void m_grabarDireccion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axissin006Service m_grabarDireccionPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CEMPRES = null; // null siempre
			// BigDecimal CAGENTE = usuario.getCagente();
			BigDecimal CAGENTE = null; // null siempre
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CTIPDIR = getCampoNumerico(request, "CTIPDIR");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_ESTDIRECCION(SPERSON, CAGENTE, CDOMICI, CTIPDIR,
					CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, CPOSTAL, CPOBLAC, CPROVIN, CPAIS, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null, null, null);
			logger.debug(map);
			if (!isEmpty(map) && !isEmpty(map.get("PCDOMICIOUT")))
				formdata.put("CDOMICI", map.get("PCDOMICIOUT").toString());

			request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006Service.m_grabarDireccionPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	public void m_ajax_getProvinPobla(HttpServletRequest request) {
		logger.debug("Axissin006Service m_ajax_getProvinPobla");
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
				logger.debug(map);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_getProvinPobla", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_recuperarDireccionON(HttpServletRequest request) {
		logger.debug("Axissin017Service m_ajax_recuperarDireccionON");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NRIESGO = this.getCampoNumerico(request, "NRIESGO_SEL");
			logger.debug("**********NRIESGO: " + NRIESGO);
			ArrayList lista_riesgos = (ArrayList) request.getSession().getAttribute("lista_riesgos");
			logger.debug(lista_riesgos);
			if (lista_riesgos != null) {
				for (int i = 0; i < lista_riesgos.size(); i++) {
					Map riesgos = (Map) lista_riesgos.get(i);
					Map objeto_riesgos = (Map) riesgos.get("OB_IAX_RIESGOS");
					logger.debug(objeto_riesgos);
					BigDecimal NRIESGO_IN = (BigDecimal) objeto_riesgos.get("NRIESGO");
					logger.debug("NRIESGO_IN" + NRIESGO_IN);
					if (NRIESGO_IN.intValue() == NRIESGO.intValue()) {
						// Cargamos el que contiene los datos de riesgo relacionados con el riesgo
						// seleccionado
						Map direcciones = (Map) objeto_riesgos.get("RIESDIRECCION");
						logger.debug(direcciones);
						ajax.guardarContenidoFinalAContenedorAjax(direcciones);
					} else {

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service m_ajax_recuperarDireccionON", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_evento(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin017Service m_ajax_evento");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			String CEVENTO = this.getCampoTextual(request, "CEVENTO");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(op) && op.equalsIgnoreCase("CEVENTO")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCEVENTO(CEVENTO);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map evento = new HashMap();
					evento.put("CEVENTO", CEVENTO);
					evento.put("TEVENTO", map.get("RETURN"));
					formdata.put("CEVENTO", CEVENTO);
					formdata.put("TEVENTO", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(evento);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map evento = new HashMap();
					evento.put("CEVENTO", CEVENTO);
					formdata.put("CEVENTO", CEVENTO);
					evento.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(evento);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin006Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			BigDecimal CPOBLAC = this.getCampoNumerico(request, "CPOBLAC");
			BigDecimal CPROVIN = this.getCampoNumerico(request, "CPROVIN");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS")) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					pais.put("TPAIS", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS);
					formdata.put("TPAIS", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS);
					formdata.put("CPROVIN", CPROVIN);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPROVIN")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(CPROVIN, CPAIS);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					provincia.put("TPROVIN", map.get("RETURN"));
					formdata.put("CPROVIN", CPROVIN);
					formdata.put("TPROVIN", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map provincia = new HashMap();
					provincia.put("CPROVIN", CPROVIN);
					formdata.put("CPROVIN", CPROVIN);
					provincia.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(provincia);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLAC")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(CPROVIN, CPOBLAC);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					poblacion.put("TPOBLAC", map.get("RETURN"));
					formdata.put("CPOBLAC", CPOBLAC);
					formdata.put("TPOBLAC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLAC", CPOBLAC);
					formdata.put("CPOBLAC", CPOBLAC);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajaxgetInfoHost(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin006Service m_ajaxgetInfoHost");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");

			/*
			 * SPERSON = new BigDecimal(17327); CDOMICI = new BigDecimal(1);
			 */
			logger.debug(SPERSON);
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_TRECIBIDO(SPERSON, CDOMICI);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo m_ajaxgetInfoHost", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_existe_persona");
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
			// TODO: Mirar la funci�n Si existe o no persona
			Map plReturn = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA(NNUMIDE, CSEXPER, FNACIMI, SNIP,
					SPERREAL, CAGENTE);
			logger.debug(plReturn);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);

		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			request.getSession().removeAttribute("SPERSON_ALTA");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = null;
			if (isEmpty(getCampoNumerico(request, "CAGENTE"))) {
				if (isEmpty(request.getParameter("CAGENTE"))) {
					CAGENTE = usuario.getCagente();
				} else {
					CAGENTE = new BigDecimal(request.getParameter("CAGENTE"));
				}
			} else {
				CAGENTE = getCampoNumerico(request, "CAGENTE");
			}
			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			logger.debug("---> get OB_PERSONA:" + OB_PERSONA);

			// Bug 22325/115249 - 05/06/2012 - AMC
			/* Tel�fono m�vil */
			Map mapi = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOTLFMOVIL(SPERSON, null);
			logger.debug(mapi);
			tratarRETURNyMENSAJES(request, mapi);
			if (!isEmpty(mapi)) {

				OB_PERSONA.put("TMOVIL", (String) mapi.get("TVALCON"));
				logger.debug("AQUIIIIIIIIIIIIIII TMOVILDEC :" + (String) mapi.get("TVALCON") + " PSPERSON :" + SPERSON
						+ " CAGENTE :" + CAGENTE);

			}

			/* E-Mail */
			mapi = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(SPERSON, null);
			logger.debug(mapi);
			tratarRETURNyMENSAJES(request, mapi);

			if (!isEmpty(mapi)) {

				OB_PERSONA.put("TEMAIL", (String) mapi.get("TVALCON"));
				logger.debug("AQUIIIIIIIIIIIIIII TEMAILDEC :" + (String) mapi.get("TVALCON") + " PSPERSON :" + SPERSON
						+ " CAGENTE :" + CAGENTE);
			}
			// Fi Bug 22325/115249 - 05/06/2012 - AMC

			formdata.putAll(OB_PERSONA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin017Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "DEC_SPERSON");
		try {
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			logger.debug(SPERSON);
			formdata.put("NSINIES_axissin039", NSINIES);
			thisAction.topPila(request, "formdata_axissin039", formdata);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return SPERSON;

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin0139Service - m�todo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			return SPERSON;
		}

	}

	public void m_volver_per(HttpServletRequest request, Axissin039Action thisAction) {
		logger.debug("Axissin039Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axissin039 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axissin039");

			logger.debug("************************* formdata39: " + formdata_axissin039);

			if (!this.isEmpty(formdata_axissin039)) {
				formdata.putAll(formdata_axissin039);
				formdata.put("NSINIES", formdata.get("NSINIES_axissin039"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}
			logger.debug(AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			logger.debug(request.getSession().getAttribute("SPERSON_ALTA"));

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

			AbstractDispatchAction.topPila(request, "CMODO", "MODIF_SINIESTROS");
			formdata.put("CMODO", "MODIF_SINIESTROS");
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin017Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los RIESGOS de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolRiesgos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(SSEGURO);
		logger.debug("RIESGOS DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que carga los datos de la persona relacionada
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarDatos(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		BigDecimal NPERSREL = getCampoNumerico(request, "NPERSREL");

		// Llamamos a la parte de consulta de la funcion
		Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_PERSONAREL(NSINIES, NTRAMIT, NPERSREL);
		Map mapa_final = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("DEC_SPERSON", mapa_final.get("SPERSON"));
		// Cargamos el mapa con el resultado en pantalla
		formdata.putAll(mapa_final);
		logger.debug(formdata);

	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin039Action thisAction) throws Exception {
		logger.debug("Axissin039Service cargarListas");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {
			// Inicializaci�n Package
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Recuperamos los parametros
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			// Llamadas
			Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCMEDDEC();
			listValores.put("lstmediodec", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCRECLAMA();
			listValores.put("lstreclama", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPDEC();
			listValores.put("lsttipodec", (List) tratarRETURNyMENSAJES(request, map));
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCULPAB();
			listValores.put("lstresponsab", (List) tratarRETURNyMENSAJES(request, map));
			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));
			// Lista tipo direcciones
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));
			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));
			logger.debug(map.toString());
			// Tipo de documento

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));
			request.setAttribute("listValores", listValores);

			// bug 0024690
			// Tipo de persona relacionada
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("800111"));
			listValores.put("tipPerRela", (List) tratarRETURNyMENSAJES(request, map));
			request.setAttribute("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	private Map dbGetRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGOCONSULTA(NRIESGO);
		logger.debug(map);
		return (Map) tratarRETURNyMENSAJES(request, map, false);
	}

	/**
	 * 
	 * M�todo que llama a la funci�n pl correspondiente para cargar los TOMADORES de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolTomadores(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES(SSEGURO);
		logger.debug("ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES: " + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

}
