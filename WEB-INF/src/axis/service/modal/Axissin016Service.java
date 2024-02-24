package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_VALIDACIONES_SIN;
import axis.mvc.control.modal.Axissin016Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las unidades de
	 * tramitacion.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCunitraIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CCEMPRES);
		logger.debug("UNIDAD TRAMITADOR INI axissin016---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los motivos
	 * (seg�n la causa seleccionada) de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param pcempres
	 * @param pctramitpad
	 * @return
	 * @throws Exception
	 */
	private

			Map dbGectramitadIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES,
					String CTRAMITPAD) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(CCEMPRES, CTRAMITPAD);
		logger.debug("TRAMITADOR INI axissin016---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String CUNITRA = getCampoTextual(request, "CUNITRA");
		// bug 0021196
		String CTRAMIT = getCampoTextual(request, "CTRAMIT");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_axis_Siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal NESTADO = getCampoNumerico(request, "NESTADO");

		// ini bug 0021196
		BigDecimal CESTTRA_aux = getCampoNumerico(request, "CESTTRA");
		logger.debug("CESTTRA_aux ------------------> " + CESTTRA_aux);
		logger.debug("NESTADO ------------------> " + NESTADO);
		// fin bug 0021196

		// Estado
		Map map =
				// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
				// BigDecimal(6));
				// pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTTRA(NESTADO);
				pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTTRA(CESTTRA_aux);

		listValores.put("tipo_estado", (List) tratarRETURNyMENSAJES(request, map));

		// Subestado
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(665));
		listValores.put("tipo_subestado", (List) tratarRETURNyMENSAJES(request, map));

		// ini bug 0021196
		// Causa Movimiento
		// map =
		// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
		// BigDecimal(739));
		// listValores.put("causa_movimiento",
		// (List)tratarRETURNyMENSAJES(request, map));
		// logger.debug("CCAUEST ------------------> " + map);

		BigDecimal CCAUEST = this.getCampoNumerico(request, "CCAUEST"); // bug 21196

		Map mapcau = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRA(NESTADO);
		listValores.put("causa_movimiento", (List) tratarRETURNyMENSAJES(request, mapcau));
		logger.debug("CCAUEST map ------------------> " + mapcau);

		logger.debug("CCAUEST valor ------------------> " + CCAUEST);

		// anulado
		// formdata.put("CCAUEST",CCAUEST); // bug 21196

		// fin bug 0021196

		BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
		if (isEmpty(getCampoNumerico(request, "CEMPRES"))) {
			BigDecimal index = new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));
			ArrayList tramitacio = ((ArrayList) request.getSession().getAttribute("tramitaciones_min"));
			CEMPRES = (BigDecimal) ((HashMap) tramitacio.get(index.intValue())).get("CEMPRES");
		}

		formdata.put("CEMPRES", CEMPRES);

		List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
		listValores.put("lstcunitra", (List) getCunitraIni);

		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
		BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");

		BigDecimal CMOTSIN = this.getCampoNumerico(request, "CMOTSIN");
		BigDecimal CCAUSIN = this.getCampoNumerico(request, "CCAUSIN");
		logger.debug("CCAUSIN ------------------> " + CCAUSIN);
		logger.debug("CMOTSIN ------------------> " + CMOTSIN);

		// ini bug 0021196: Muestra por defecto la unidad / tramitador del �ltimo
		// movimiento.
		// bug 0021196 Map tram =
		// pac_axis_Siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_DEFECTO(usuario.getCusuari(),SSEGURO,null,null,NSINIES,NTRAMIT);
		// bug 0021196 logger.debug("Tramitador defecto: " + tram);
		// bug 0021196 BigDecimal EsTramDef =
		// ((BigDecimal)tratarRETURNyMENSAJES(request, tram));

		// bug 0021196 if (EsTramDef.equals(new BigDecimal (0))) {
		// bug 0021196 logger.debug("ENTRO POR AQUI1");
		// bug 0021196 CUNITRA = (String)tram.get("P_CUNITRA");
		// bug 0021196 request.setAttribute("TRAMDEF", new BigDecimal (1));
		// bug 0021196 } else if (EsTramDef.equals(new BigDecimal (1))) {
		// bug 0021196 logger.debug("ENTRO POR AQUI2");
		// bug 0021196 CUNITRA = (String)tram.get("P_CUNITRA");
		// bug 0021196 request.setAttribute("TRAMDEF", new BigDecimal (0));
		// bug 0021196 } else {
		// bug 0021196 logger.debug("ENTRO POR AQUI3");
		// bug 0021196 CUNITRA = null;
		// bug 0021196 request.setAttribute("TRAMDEF",
		// bug 0021196 new BigDecimal (0));
		// bug 0021196 }
		// bug 0021196 formdata.put("CUNITRA",CUNITRA);
		// fin bug 0021196: Muestra por defecto la unidad / tramitador del �ltimo
		// movimiento.

		logger.debug("CUNITRA ---------------------------> " + CUNITRA);

		if (!isEmpty(CUNITRA)) {
			Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
			listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, GectramitadIni, false));
			// bug 0021196 formdata.put("CTRAMIT",tram.get("P_CTRAMITAD"));
			// bug 0021196 logger.debug("tram.get(P_CTRAMITAD) --------------------------->
			// "+tram.get("P_CTRAMITAD"));
			formdata.put("CTRAMIT", CTRAMIT);
			logger.debug("CTRAMIT ---------------------------> " + CTRAMIT);
		} else {
			formdata.put("CTRAMIT", null);
			listValores.put("lsttramit", null);
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
	public void m_form(HttpServletRequest request, Axissin016Action thisAction) {
		logger.debug("Axispro016Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro016Service m_form");
		this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));

		// ini bug 21196
		BigDecimal CESTTRA = getCampoNumerico(request, "CESTTRA");
		formdata.put("CESTTRA", CESTTRA);

		BigDecimal CSUBTRA = getCampoNumerico(request, "CSUBTRA");
		formdata.put("CSUBTRA", CSUBTRA);

		String CUNITRA = getCampoTextual(request, "CUNITRA");
		formdata.put("CUNITRA", CUNITRA);
		logger.debug("CUNITRA --->>> " + CUNITRA);

		String CTRAMIT = getCampoTextual(request, "CTRAMIT");
		formdata.put("CTRAMIT", CTRAMIT);
		logger.debug("CTRAMITAD --->>> " + CTRAMIT);

		// No hace falta mostrar valor anterior.
		// String CCAUEST = getCampoTextual(request, "CCAUEST");
		// formdata.put("CCAUEST",CCAUEST);
		// logger.debug("CCAUEST --->>> " + CCAUEST);
		// fin bug 21196

		try {
			cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin016Action thisAction) {

		logger.debug("AXISSIN016Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal CSUBTRA = getCampoNumerico(request, "CSUBTRA");
			logger.debug(CSUBTRA);
			BigDecimal CESTTRA = getCampoNumerico(request, "CESTTRA");
			logger.debug(CESTTRA);
			BigDecimal NMOVTRA = getCampoNumerico(request, "NMOVTRA");
			logger.debug(NMOVTRA);
			String CUNITRA = getHiddenCampoTextual(request, "CUNITRA");
			logger.debug("CUNITRA-->" + CUNITRA);
			String CTRAMIT = getHiddenCampoTextual(request, "CTRAMIT");
			logger.debug("CTRAMIT-->" + CTRAMIT);
			java.sql.Date FESTRA = this.stringToSqlDate(getCampoTextual(request, "FESTRA"));
			logger.debug("FESTRA-->" + FESTRA);

			// ini bug 0021196
			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST");
			logger.debug("CCAUEST-->" + CCAUEST);
			// fin bug 0021196

			if (isEmpty(FESTRA))
				FESTRA = new java.sql.Date(new java.util.Date().getTime());

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMIT(NSINIES, NTRAMIT,
					NMOVTRA, CUNITRA, CTRAMIT, CESTTRA, CSUBTRA, FESTRA, CCAUEST,
					new BigDecimal(1) /*
										 * 29989/165377: Solo se llamar� a las acciones de �ltima tramitacion cuando se
										 * llame desde esta pantalla
										 */
			);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));
		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN016Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al seleccionar una unidad de tramitacion de la lista. Con
	 * ello se pretende carga una lista de tramitadores.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_cunitra(HttpServletRequest request) {
		logger.debug("Axissin016Service AJAX m_ajax_selected_cunitra");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			logger.debug("CUNITRA-->" + CUNITRA);
			logger.debug("CEMPRES-->" + CEMPRES);

			if (!isEmpty(CUNITRA)) {
				Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(GectramitadIni);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}
		} catch (Exception e) {
			logger.error("Axissin001Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Funcion que recupera la versi�n
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	// bug 0021196
	public void m_ajax_recuperar_causas_cambio_estado(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CNUEVO_ESTADO = getCampoNumerico(request, "CNUEVO_ESTADO");

			logger.debug("---------- VALOR version  :" + CNUEVO_ESTADO);
			if (!isEmpty(CNUEVO_ESTADO)) {
				PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRA(CNUEVO_ESTADO);

				if (!isEmpty(map)) {
					List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(version);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin016Service - m�todo m_ajax_recuperar_causas_estado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_valida_ult_tra(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");

			PAC_IAX_VALIDACIONES_SIN pac_axis_validaciones_sin = new PAC_IAX_VALIDACIONES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_validaciones_sin.ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_ULT_TRA(NSINIES, NTRAMIT);
			logger.debug("++++map ejecutaPAC_IAX_VALIDACIONES_SIN__F_VALIDA_ULT_TRA: " + map);

			if (!isEmpty(map)) {
				List retorno = new ArrayList();
				Map r = new HashMap();
				r.put("PTLITERA", map.get("PTLITERA"));
				retorno.add(r);
				logger.debug("++++retorno: " + retorno);
				ajax.guardarContenidoFinalAContenedorAjax(retorno);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin016Service - m�todo m_ajax_valida_ult_tra", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
