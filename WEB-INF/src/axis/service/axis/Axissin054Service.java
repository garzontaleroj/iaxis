package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_TRAMITADORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin054Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axissin054Service.java
 * 
 * @since Java 5.0
 */
public class Axissin054Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axissin054Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CTRAMIT = getCampoTextual(request, "CTRAMITBUS");
			if (isEmpty(CTRAMIT)) {
				CTRAMIT = (String) formdata.get("CTRAMITBUS");
			}
			logger.debug("----> CTRAMIT" + CTRAMIT);

			if (!isEmpty(CTRAMIT)) {
				Map m = new PAC_IAX_TRAMITADORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR(CTRAMIT);

				logger.debug("--> tramitador:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.put("TRAMITAORI", m.get("PTTRAMITAD"));

			}

			cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin054Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axissin054Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String PSINIESTROS = getCampoTextual(request, "LISTSIN");
			String PCUNITRA = getCampoTextual(request, "CUNITRANEW");
			String PCTRAMITAD = getCampoTextual(request, "CTRAMITNEW");

			Map m = new PAC_IAX_TRAMITADORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRAMITADORES__F_CAMBIO_TRAMITADOR(PSINIESTROS, PCUNITRA, PCTRAMITAD);

			logger.debug("--> cambio tramitador:" + m);
			tratarRETURNyMENSAJES(request, m);
			if (m.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
				formdata.put("lista_sin", null);
				formdata.put("TRAMITAORI", null);
				formdata.put("CUNITRANEW", null);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin054Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		String CUNITRA = getCampoTextual(request, "CUNITRA");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_axis_Siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CEMPRES = usuario.getCempres();
		formdata.put("CEMPRES", CEMPRES);

		List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
		listValores.put("lstcunitra", (List) getCunitraIni);

		CUNITRA = null;
		request.setAttribute("TRAMDEF", new BigDecimal(0));
		formdata.put("CUNITRA", CUNITRA);

		if (!isEmpty(CUNITRA)) {
			Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
			listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, GectramitadIni, false));
		} else {
			formdata.put("CTRAMITNEW", null);
			listValores.put("lsttramit", null);
		}

		formdata.put("listvalores", listValores);

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
	 * M�todo que se llama al seleccionar una unidad de tramitacion de la lista. Con
	 * ello se pretende carga una lista de tramitadores.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_cunitra(HttpServletRequest request) {
		logger.debug("Axissin054Service AJAX m_ajax_selected_cunitra");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRANEW");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			logger.debug("CUNITRA-->" + CUNITRA);
			logger.debug("CEMPRES-->" + CEMPRES);

			if (!isEmpty(CUNITRA)) {
				Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(GectramitadIni);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}
		} catch (Exception e) {
			logger.error("Axissin054Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axissin054Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {

			BigDecimal PNPOLIZA = getCampoNumerico(request, "NPOLIZABUS");
			BigDecimal PNCERTIF = getCampoNumerico(request, "NCERTIFBUS");
			String PNSINIES = getCampoTextual(request, "NSINIESBUSBUS");
			BigDecimal PCESTSIN = getCampoNumerico(request, "CESTSINBUS");
			BigDecimal PFILTRO = getCampoNumerico(request, "FILTROBUS");
			BigDecimal PCRAMO = getCampoNumerico(request, "CRAMOBUS");
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUCBUS");
			java.sql.Date PFSINIES = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSINIESBUS"));
			String PCTRAMI = getCampoTextual(request, "CTRAMITBUS");
			BigDecimal PCACTIVI = getCampoNumerico(request, "CACTIVIBUS");

			if (isEmpty(PNSINIES)) {
				PNSINIES = (String) formdata.get("NSINIESBUS");
			}

			if (isEmpty(PCTRAMI)) {
				PCTRAMI = (String) formdata.get("CTRAMITBUS");
			}

			Map m = new PAC_IAX_TRAMITADORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_TRAMITADORES__F_CONSULTA_LSTSINI(PNPOLIZA, PNCERTIF, PNSINIES, PCESTSIN, PFILTRO,
							PCRAMO, PSPRODUC, PFSINIES, PCTRAMI, PCACTIVI);

			logger.debug("----> siniestros:" + m);
			formdata.put("lista_sin", tratarRETURNyMENSAJES(request, m));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin054Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*
	 * *****************************************************************************
	 * ************
	 */
	/*
	 * ********************************** NAVEGAR SINIESTRO
	 * ************************************
	 */
	/*
	 * *****************************************************************************
	 * ************
	 */

	public void m_navegar(HttpServletRequest request, Axissin054Action thisAction) {
		logger.debug("Axissin054Service m_navegar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Push de los datos necesarios a la pila

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIESCON = getCampoTextual(request, "NSINIESCON");
			String NSINIESselected = getCampoTextual(request, "NSINIESCON");

			thisAction.topPila(request, "NSINIESCON", NSINIESCON);
			thisAction.topPila(request, "NSINIESselected", NSINIESselected);

			thisAction.topPila(request, "formdata_axissin054", new HashMap(formdata));

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin054Service - m�todo m_navegar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volver(HttpServletRequest request, Axissin054Action thisAction) {
		logger.debug("Axissin054Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			Map formdata_axissin054 = (Map) thisAction.removeTopPila(request, "formdata_axissin054");
			logger.debug("------> recuperamos formada:" + formdata_axissin054);
			if (!isEmpty(formdata_axissin054)) {
				formdata.putAll(formdata_axissin054);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin054Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
