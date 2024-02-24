package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin061Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.Axissin006Service;
import axis.util.Constantes;

public class Axissin061Service extends Axissin006Service {
	Log logger = LogFactory.getLog(this.getClass());

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
		PAC_IAX_SINIESTROS pac_axis_siniestro = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map listValores = new HashMap();
		String NSINIES = (String) getCampoTextual(request, "NSINIES_AUX");
		BigDecimal NTRAMIT = (BigDecimal) getCampoNumerico(request, "NTRAMIT");

		Map map = pac_axis_siniestro.ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_PENDIENTE(NSINIES, NTRAMIT);
		String ptlisdoc = (String) map.get("PTLISDOC");
		listValores.put("LISTA_DOCUMENTOS", ptlisdoc);

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin061Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin011Service m_form");

		try {
			this.cargarListas(request);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			super.m_cargarDatos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axissin061Action thisAction) {

		logger.debug("Axissin027Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarListas(request);
			this.m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin061Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void genera_docupendiente(HttpServletRequest request, Axissin061Action thisAction) {
		logger.debug("Axissin061Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CESTADO = (BigDecimal) getCampoNumerico(request, "NUEVO_ESTADO"); // Nuevo estado
			BigDecimal CEMPRES = !isEmpty(formdata.get("CEMPRES")) ? new BigDecimal((String) formdata.get("CEMPRES"))
					: usuario.getCempres();

			// this.cargarListas(request,CESTADO);

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
			String SINIESDOCPEN = new String("SINIES_DOCPEN");
			String CCAMPO = new String("TDOCUMENTACION");
			String CCODPLAN = new String("COLSIN04");
			String DOCUPEN = (String) getCampoTextual(request, "LISTA_DOCUMENTOS");
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
			formdata.put("DOCUPEN", DOCUPEN);

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
				logger.debug("\n\n CTRAMITA" + CCAMPO);
				logger.debug("\n\n CTRAMITA" + DOCUPEN);
				Map mapa = (Map) pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_ESTADO_SINIESTRO(NSINIES, CESTADO,
						CAUSA, CUNITRA, CTRAMITA, null, FFIN, null);
				logger.debug("\n\n map:" + mapa);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

				BigDecimal pRETURN1 = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapa);
				request.setAttribute("RETURN", m.get("RETURN"));

				logger.debug("pRETURN1" + pRETURN1.intValue());

				if (resultado.intValue() == 0 || pRETURN1.intValue() == 0) {
					mapa = (Map) pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_CAMPO_PLANTILLA(NSINIES, CCODPLAN,
							null, CCAMPO, DOCUPEN, null);
					logger.debug("\n\n map f_set_campo_plantilla:" + mapa);
					BigDecimal pRETURN2 = (BigDecimal) this.tratarRETURNyMENSAJES(request, mapa);
					if (pRETURN2 != null && pRETURN2.intValue() == 0) {
						request.setAttribute("OK", "OK");
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin027Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
