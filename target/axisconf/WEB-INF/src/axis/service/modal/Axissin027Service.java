package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin027Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.Axissin006Service;
import axis.util.Constantes;

public class Axissin027Service extends Axissin006Service {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin017Service axissin017Service = new Axissin017Service();

	/**
	 * Método que carga los datos de administración del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, BigDecimal CNUEVO_ESTADO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		// Estado
		Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(6));
		listValores.put("tipo_estado", (List) tratarRETURNyMENSAJES(request, map));

		// Causas
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADO(CNUEVO_ESTADO);
		listValores.put("causas_estado", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);

	}

	/**
	 * Método que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin027Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin011Service m_form");

		try {
			BigDecimal CNUEVO_ESTADO = getCampoNumerico(request, "NUEVO_ESTADO");
			String NUEVO = getCampoTextual(request, "isNew");
			this.cargarListas(request, CNUEVO_ESTADO);

			String TESTSIN = getCampoTextual(request, "TESTSIN");
			String TESTSIN_AUX = getCampoTextual(request, "TESTSIN_AUX");

			if (!isEmpty(TESTSIN) && isEmpty(TESTSIN_AUX))
				formdata.put("TESTSIN_AUX", TESTSIN);

			String OBSERV = getCampoTextual(request, "OBSERV");
			formdata.put("OBSERV", OBSERV);

			String CESTSIN = getCampoTextual(request, "CESTSIN");
			String CESTSIN_AUX = getCampoTextual(request, "CESTSIN_AUX");

			if (!isEmpty(CESTSIN) && isEmpty(CESTSIN_AUX))
				formdata.put("CESTSIN_AUX", CESTSIN);

			/* Antes de abrir ventana grbar datos */
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			super.m_cargarDatos(request, thisAction);

			if (!NUEVO.equals("no")) {

				// joan Bug 0024964
				String pCTRAMITAD = null;

				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GRABAR_SINIESTRO(pCTRAMITAD);
				tratarRETURNyMENSAJES(request, map);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axissin027Action thisAction) {

		logger.debug("Axissin027Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CESTADO = (BigDecimal) getCampoNumerico(request, "NUEVO_ESTADO");

			this.cargarListas(request, CESTADO);

			super.m_recargarRadios(request, thisAction);

			this.m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - método m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cambiar_estado(HttpServletRequest request, Axissin027Action thisAction) {

		System.out.println("\n\n ************* m_cambiar_estado ******************");
		logger.debug("Axissin027Service m_recargar");
		logger.debug("Axissin027Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CESTADO = (BigDecimal) getCampoNumerico(request, "NUEVO_ESTADO"); // Nuevo estado

			this.cargarListas(request, CESTADO);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String NSINIES = (String) getCampoTextual(request, "NSINIES_AUX");
			logger.debug("NSINIES:" + NSINIES);
			String NSINIES2 = (String) getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES2:" + NSINIES2);

			if (isEmpty(NSINIES) && !isEmpty(NSINIES2))
				NSINIES = NSINIES2;

			String TESTSIN_AUX = (String) getCampoTextual(request, "TESTSIN");
			BigDecimal CAUSA = (BigDecimal) getCampoNumerico(request, "CAUSAS"); // CAUSA CAMBIO ESTADO
			BigDecimal SPRODUC = (BigDecimal) getCampoNumerico(request, "SPRODUC"); // PRODUCTO
			String SINIESRECH = new String("SINIES_RECHA");
			String CCAMPO = new String("TOBSERVACION");
			String OBSERV = (String) getCampoTextual(request, "OBSERV");
			String CUNITRA = (String) getCampoTextual(request, "CUNITRA_AUX");
			String CTRAMITA = (String) getCampoTextual(request, "CTRAMITAD_AUX");

			String FESTSIN_AUX = getCampoTextual(request, "FESTSIN_AUX");
			Date FESTSIN = stringToSqlDate(FESTSIN_AUX); /* Si */

			String FFIN_AUX = getCampoTextual(request, "FFIN");
			Date FFIN = stringToSqlDate(FFIN_AUX);

			formdata.put("TESTSIN_AUX", TESTSIN_AUX);
			formdata.put("NUEVO_ESTADO", CESTADO);
			formdata.put("FFIN", FFIN);
			formdata.put("CAUSAS", CAUSA);
			formdata.put("CUNITRA_AUX", CUNITRA);
			formdata.put("CTRAMITAD_AUX", CTRAMITA);
			formdata.put("NSINIES_AUX", NSINIES);

			formdata.put("TESTSIN_AUX1", TESTSIN_AUX);
			formdata.put("NUEVO_ESTADO", CESTADO);
			formdata.put("FFIN", FFIN);
			formdata.put("CAUSAS", CAUSA);
			formdata.put("CUNITRA_AUX1", CUNITRA);
			formdata.put("CTRAMITAD_AUX1", CTRAMITA);
			formdata.put("NSINIES_AUX1", NSINIES);
			formdata.put("OBSERV", OBSERV);
			System.out.println("\n\n **************** AXISSIN027 OBSERV ******************");
			System.out.println("\n\n OBSERV:" + OBSERV);

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			// IAXIS 3663 AABC 12/04/2019 Adicion campo observacion
			if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
				logger.debug("\n\n CTRAMITA" + CCAMPO);
				logger.debug("\n\n CTRAMITA" + OBSERV);
				Map mapa = (Map) pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_ESTADO_SINIESTRO(NSINIES, CESTADO,
						CAUSA, CUNITRA, CTRAMITA, null, FFIN, OBSERV);
				logger.debug("\n\n map:" + mapa);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

				BigDecimal pRETURN1 = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapa);
				request.setAttribute("RETURN", m.get("RETURN"));

				logger.debug("pRETURN1" + pRETURN1.intValue());

				// System.out.println("RESULTADO" + resultado);

				if (resultado.intValue() == 0 || pRETURN1.intValue() == 0) {
					logger.debug("\n\n ***************** resultado oK *******************");
					request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
					BigDecimal pRETURN2 = null;
					if (OBSERV != null) {
						mapa = (Map) pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CAMPO_PLANTILLA(NSINIES,
								SINIESRECH, SPRODUC, null, CCAMPO, OBSERV);
						logger.debug("\n\n map f_set_campo_plantilla:" + mapa);
						pRETURN2 = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapa);
					}
					// Si graba en la F_SET_CAMPO_PLANTILLA y el pRETURN2 es distinto de null y no
					// da código 1 de error.
					if (pRETURN2 == null || (pRETURN2 != null && pRETURN2.intValue() == 0)) {
						Map map = (Map) pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_COMPROBAR_IMPRESION(SPRODUC,
								SINIESRECH);
						logger.debug("\n\n map comprobar impression:" + map);
						BigDecimal pRETURN3 = (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
						request.setAttribute("RETURN", m.get("RETURN"));
						if (pRETURN3.intValue() > 0) {
							logger.debug("\n\n SETEO CESTADORECHA");
							request.setAttribute("CESTADORECHA", "OK");
						}
					}

				} else {

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - método m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Funcion que recupera la versión
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_causas_cambio_estado(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CNUEVO_ESTADO = getCampoNumerico(request, "CNUEVO_ESTADO");

			logger.debug("---------- VALOR version  :" + CNUEVO_ESTADO);
			if (!isEmpty(CNUEVO_ESTADO)) {
				PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTESTADO(CNUEVO_ESTADO);

				if (!isEmpty(map)) {
					List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(version);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - método m_ajax_recuperar_causas_estado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
