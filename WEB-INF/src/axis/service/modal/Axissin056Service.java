package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin056Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin056Service extends AxisBaseService {
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
		logger.debug("UNIDAD TRAMITADOR INI axissin056---------------------------------------->" + m);
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
		logger.debug("TRAMITADOR INI axissin056---------------------------------------->" + m);
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

		logger.debug("Axissin056Service cargarListas " + formdata);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String CUNITRA = getCampoTextual(request, "CUNITRA");
		logger.debug("CUNITRA ---------------------------> " + CUNITRA);
		String CTRAMIT = getCampoTextual(request, "CTRAMIT");
		logger.debug("CTRAMIT ---------------------------> " + CTRAMIT);

		BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
		if (isEmpty(CEMPRES)) {
			CEMPRES = usuario.getCempres();
		}
		formdata.put("CEMPRES", CEMPRES);
		List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
		listValores.put("lstcunitra", (List) getCunitraIni);

		if (!isEmpty(CUNITRA)) {
			Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
			listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, GectramitadIni, false));
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
	public void m_form(HttpServletRequest request, Axissin056Action thisAction) {
		logger.debug("Axissin056Service m_form");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin056Service m_form " + formdata);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));

		BigDecimal NSINIES = getCampoNumerico(request, "NSINIES_AUX");
		formdata.put("NSINIES_AUX", NSINIES);
		formdata.put("NSINIES", NSINIES);
		logger.debug("NSINIES_AUX --->>> " + NSINIES);

		String CESTSIN = getCampoTextual(request, "CESTSIN_AUX");
		formdata.put("CESTSIN_AUX", CESTSIN);
		formdata.put("CESTSIN", CESTSIN);
		logger.debug("CESTSIN_AUX --->>> " + CESTSIN);

		String FESTSIN = getCampoTextual(request, "FESTSIN_AUX");
		formdata.put("FESTSIN_AUX", FESTSIN);
		formdata.put("FESTSIN", FESTSIN);
		logger.debug("FESTSIN_AUX --->>> " + FESTSIN);

		String CUNITRA = getCampoTextual(request, "CUNITRA_AUX");
		formdata.put("CUNITRA_AUX", CUNITRA);
		logger.debug("CUNITRA --->>> " + CUNITRA);

		String CTRAMIT = getCampoTextual(request, "CTRAMITAD_AUX");
		formdata.put("CTRAMITAD_AUX", CTRAMIT);
		logger.debug("CTRAMITAD --->>> " + CTRAMIT);

		try {
			cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin056Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin056Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		logger.debug("AXISSIN056Service m_guardar " + formdata);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
			logger.debug("CESTSIN-->" + CESTSIN);
			java.sql.Date FESTSIN = new java.sql.Date(new java.util.Date().getTime());
			logger.debug("FESTSIN-->" + FESTSIN);
			BigDecimal CCAUEST = new BigDecimal(101);
			logger.debug("CCAUEST-->" + CCAUEST);
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			logger.debug("CUNITRA-->" + CUNITRA);
			String CTRAMIT = getCampoTextual(request, "CTRAMIT");
			logger.debug("CTRAMIT-->" + CTRAMIT);

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_MOVSINIESTRO(NSINIES, CESTSIN, FESTSIN,
					CCAUEST, CUNITRA, CTRAMIT);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(thisAction));
		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN056Service - m�todo m_guardar", e);
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
		logger.debug("Axissin056Service m_ajax_selected_cunitra");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

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
	public void m_ajax_recuperar_causas_cambio_estado(HttpServletRequest request) {

		logger.debug("Axissin056Service m_ajax_recuperar_causas_cambio_estado");

		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CNUEVO_ESTADO = getCampoNumerico(request, "CNUEVO_ESTADO");

			logger.debug("---------- VALOR version  :" + CNUEVO_ESTADO);
			if (!isEmpty(CNUEVO_ESTADO)) {
				PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_listvalores_sin
						.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADOTRAMITE(CNUEVO_ESTADO);

				if (!isEmpty(map)) {
					List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(version);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin056Service - m�todo m_ajax_recuperar_causas_estado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
