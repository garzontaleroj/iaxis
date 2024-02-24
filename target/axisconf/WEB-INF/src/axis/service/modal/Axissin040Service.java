package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_ANULACIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin040Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr031Service;
import axis.util.Constantes;

public class Axissin040Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin017Service axissin017Service = new Axissin017Service();

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_ANULACIONES pac_axis_anulaciones = new PAC_IAX_ANULACIONES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		Map map = pac_axis_anulaciones.ejecutaPAC_IAX_ANULACIONES__F_GET_TOMADORES(SSEGURO);
		listValores.put("lsttomadores", (List) tratarRETURNyMENSAJES(request, map, false));

		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_ASEGURADOS(SSEGURO);
		listValores.put("lstasegurados", (List) tratarRETURNyMENSAJES(request, map, false));

		BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
		BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");
		BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
		BigDecimal pccausin = getCampoNumerico(request, "CCAUSIN");
		BigDecimal pcmotsin = getCampoNumerico(request, "CMOTSIN");

		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LISTTIPDES(psproduc, pcactivi, pctramit,
				pccausin, pcmotsin, SSEGURO);
		logger.debug("--> destinatarios:" + map);
		listValores.put("lsttipdest", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("SPRODUC", psproduc);
		formdata.put("CACTIVI", pcactivi);
		formdata.put("CTRAMIT", pctramit);
		formdata.put("CCAUSIN", pccausin);
		formdata.put("CMOTSIN", pcmotsin);

		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTPROF();
		listValores.put("lstcactpro", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista pa�ses
		map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		logger.debug(map);
		listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista duracion prestaciones
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTDURPREST();
		logger.debug(map);
		listValores.put("lstDurPre", (List) tratarRETURNyMENSAJES(request, map, false));

		// Forma de pago
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__GET_FORPAGREN(psproduc);
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		listValores.put("formaPago", (List) tratarRETURNyMENSAJES(request, m, false));

		// Estados
		m = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOPREST();
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		listValores.put("lstEstados", (List) tratarRETURNyMENSAJES(request, m, false));

		// Est Pagos
		m = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTPAGOSPREST();
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		listValores.put("lstEstPag", (List) tratarRETURNyMENSAJES(request, m, false));

		// Tipo prestaciones
		// TODO: cambiar la funci�n

		m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(psproduc);
		logger.debug("Map de Combo Tipo revalorizacion de garantias---------------------------------------->" + m);
		listValores.put("tipoRev", (List) tratarRETURNyMENSAJES(request, m, false));

		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		BigDecimal CAGENTE = isEmpty(this.getCampoNumerico(request, "CAGENTE_VISIO"))
				? this.getCampoNumerico(request, "CAGENTE")
				: this.getCampoNumerico(request, "CAGENTE_VISIO");
		logger.debug("agente vision :" + this.getCampoNumerico(request, "CAGENTE_VISIO"));

		String SNIP = this.getCampoTextual(request, "SNIP");

		if (!isEmpty(SPERSON)) {

			String PMODE = new String("POL");
			map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);
			formdata.put("CAGENTE", CAGENTE);

			String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

			formdata.put("NOMBRE", nomComplet);

			if (isEmpty(SNIP))
				SNIP = (String) OB_PERSONA.get("SNIP");

			tratarRETURNyMENSAJES(request, map);

			Map map2 = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS(SPERSON, CAGENTE, SNIP, "INT", SSEGURO);
			logger.debug("ccc--->" + map2);
			// if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
			// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
			// Map OB_PERSONA = (Map)map.get("OBPERSONA");
			listValores.put("cuentasbancarias", tratarRETURNyMENSAJES(request, map2));
			// }

		}

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin040Action thisAction) {
		logger.debug("Axissin040Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		formattingNumericValues(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin040Service m_form");

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			if (isEmpty(NTRAMIT))
				NTRAMIT = getCampoNumerico(request, "indexTramitacio");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			BigDecimal NPRESTA = getCampoNumerico(request, "NPRESTA");

			String NSINIES = getCampoTextual(request, "NSINIES");
			String isNew = getCampoTextual(request, "isNew");
			logger.debug(isNew);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Recoger el objeto de la prestacion para actualizarlo
			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINPRESTAREN(NSINIES, NTRAMIT,
						SPERSON, CTIPDES, SSEGURO, NPRESTA);

				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
					formdata.putAll((Map) map.get("RETURN"));
					HashMap mm = (HashMap) map.get("RETURN");
					formdata.putAll((Map) mm.get("NMESEXTRA"));

				}
			}

			logger.debug("--" + getCampoNumerico(request, "NTRAMIT"));
			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_recargar(HttpServletRequest request, Axissin040Action thisAction) {

		logger.debug("Axissin011Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

		}
	}

	public void m_guardar(HttpServletRequest request, Axissin040Action thisAction) {

		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			logger.debug(CAGENTE);

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug(SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			logger.debug(CTIPDES);

			BigDecimal CACTPRO = getCampoNumerico(request, "CACTPRO");
			logger.debug(CACTPRO);
			BigDecimal PASIGNA = getCampoNumerico(request, "PASIGNA");
			logger.debug(PASIGNA);
			BigDecimal CPAISRE = getCampoNumerico(request, "CPAISRE");
			logger.debug(CPAISRE);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug(SPERSON);
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			logger.debug(CTIPBAN);

			String CBANCAR = getCampoTextual(request, "CBANCAR");
			logger.debug(CBANCAR);

			if (CTIPDES != null && CTIPDES.intValue() < 0)
				CTIPDES = null;

			java.sql.Date F1PAREN = this.stringToSqlDate(getCampoTextual(request, "F1PAREN"));

			java.sql.Date FUPAREN = this.stringToSqlDate(getCampoTextual(request, "FUPAREN"));

			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			logger.debug(CFORPAG);

			BigDecimal PIBRUREN = getCampoNumerico(request, "IBRUREN");
			logger.debug(PIBRUREN);

			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			logger.debug(CREVALI);

			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			logger.debug(PREVALI);

			BigDecimal PIREVALI = getCampoNumerico(request, "IREVALI");
			logger.debug(PIREVALI);

			BigDecimal CTIPDUR = getCampoNumerico(request, "CTIPDUR");
			logger.debug(CTIPDUR);

			BigDecimal NPARTOT = getCampoNumerico(request, "NPARTOT");
			logger.debug(NPARTOT);

			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			logger.debug(CESTADO);

			BigDecimal CMOTIVO = getCampoNumerico(request, "CMOTIVO");
			logger.debug(CMOTIVO);

			BigDecimal CBLOPAG = getCampoNumerico(request, "CBLOPAG");
			logger.debug(CBLOPAG);

			BigDecimal NPRESTA = getCampoNumerico(request, "NPRESTA");
			logger.debug(NPRESTA);

			BigDecimal NMES1 = getCampoNumerico(request, "NMES1");
			BigDecimal NMES2 = getCampoNumerico(request, "NMES2");
			BigDecimal NMES3 = getCampoNumerico(request, "NMES3");
			BigDecimal NMES4 = getCampoNumerico(request, "NMES4");
			BigDecimal NMES5 = getCampoNumerico(request, "NMES5");
			BigDecimal NMES6 = getCampoNumerico(request, "NMES6");
			BigDecimal NMES7 = getCampoNumerico(request, "NMES7");
			BigDecimal NMES8 = getCampoNumerico(request, "NMES8");
			BigDecimal NMES9 = getCampoNumerico(request, "NMES9");
			BigDecimal NMES10 = getCampoNumerico(request, "NMES10");
			BigDecimal NMES11 = getCampoNumerico(request, "NMES11");
			BigDecimal NMES12 = getCampoNumerico(request, "NMES12");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINPRESTAREN(NSINIES, NTRAMIT, SPERSON,
					CTIPDES, SSEGURO, F1PAREN, FUPAREN, CFORPAG, PIBRUREN, CREVALI, PREVALI, PIREVALI, CTIPDUR, NPARTOT,
					CTIPBAN, CBANCAR, CESTADO, CMOTIVO, CBLOPAG, NMES1, NMES2, NMES3, NMES4, NMES5, NMES6, NMES7, NMES8,
					NMES9, NMES10, NMES11, NMES12, NPRESTA);
			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
				if (!isEmpty(CBANCAR)) {
					Map map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_CCC(SPERSON, CAGENTE, CBANCAR,
							CTIPBAN);
					logger.debug(map2);

					if (isEmpty(tratarRETURNyMENSAJES(request, map2))) {
						// si no nos devuelve el cnorban, quiere decir que no existe por lo tanto
						// a�adimos la cuenta

						Map map22 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CCC(SPERSON, CAGENTE, null, CTIPBAN,
								CBANCAR, new BigDecimal(0));
						if (new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map22))).intValue() == 0) {
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						}
					} else {
						request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

		}
	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		logger.debug("Axissin007Service m_ajax_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - m�todo m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request) {

		axissin017Service.m_ajax_direccion(request, null);
	}

	/**
	 * M�todo que se encarga de realizar el cambio de tipo de pago.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cambiar_forma_pago(HttpServletRequest request) {
		logger.debug("Axissin040Service m_ajax_cambiar_forma_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			Map plSetGarForPag = this.dbSetGarForPag(request, usuario, CFORPAG);
			ajax.rellenarPlAContenedorAjax(plSetGarForPag);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin040Service - m�todo m_actualizaRevalorizacionGarantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	/**
	 * M�todo que modifica el tipo de forma de pago modificado por el usuario
	 * 
	 * @param usuario
	 * @param CFORPAG
	 * @return
	 * @throws Exception
	 */
	private Map dbSetGarForPag(HttpServletRequest request, UsuarioBean usuario, BigDecimal CFORPAG) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_GARFORPAG(CFORPAG);
		logger.debug(map);
		return map;
	}

}
