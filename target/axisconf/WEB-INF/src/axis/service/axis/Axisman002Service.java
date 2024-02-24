package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MANDATOS;
import axis.mvc.control.axis.Axisman002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisman002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisman002Action thisAction) {
		logger.debug("Axisman002Service m_form");
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axisman002Action thisAction) {
		logger.debug("Axisman002Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);

		try {
			this.cargarDatos(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman002Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axisman002Action thisAction, Map formdata) throws Exception {
		try {

			Map map = null;
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_CONSCOBRADORESBANC();
			logger.debug(map);
			List listacombo = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("FORMAPAGO", listacombo);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(488));
			logger.debug(map);
			listacombo = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MRECHAZOS", listacombo);

			String CMANDATO = this.getCampoTextual(request, "CMANDATO");
			formdata.put("CMANDATO", CMANDATO);

			BigDecimal NUMEROFOLIO = this.getCampoNumerico(request, "NUMEROFOLIO");
			formdata.put("NUMFOLIO", NUMEROFOLIO);

			BigDecimal COBRADORBANC = this.getCampoNumerico(request, "CMETMOV");
			formdata.put("CMETMOV", COBRADORBANC);

			String CTIPCC = this.getCampoTextual(request, "CTIPCC");
			formdata.put("CTIPCC", CTIPCC);

			String CNUMTAR = this.getCampoTextual(request, "CNUMTAR");
			formdata.put("CNUMTAR", CNUMTAR);

			String CINSEMI = this.getCampoTextual(request, "CINSEMI");
			formdata.put("CINSEMI", CINSEMI);

			String FVENCIM = getCampoTextual(request, "FVENCIM");
			formdata.put("FVENCIM", FVENCIM);

			String CBANCO = this.getCampoTextual(request, "CBANCO");
			formdata.put("CBANCO", CBANCO);

			String CNCTACTE = this.getCampoTextual(request, "CNCTACTE");
			formdata.put("CNCTACTE", CNCTACTE);

			String CSUCURSAL = this.getCampoTextual(request, "CSUCURSAL");
			formdata.put("CSUCURSAL", CSUCURSAL);

			request.getSession().setAttribute("CONSULTA", "0");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisman002Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_cargar_acciones(HttpServletRequest request) {
		logger.debug("Axisman002Service m_ajax_cargar_acciones");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.cargar_acciones(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman002Service - m�todo m_ajax_ins_mov_caja", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List cargar_acciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map m = null;
		List plReturn = null;

		try {

			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CODMANDATO = this.getCampoTextual(request, "CODMANDATO");
			if (CODMANDATO == null)
				CODMANDATO = this.getCampoTextual(request, "CMANDATO");
			formdata.put("CODMANDATO", CODMANDATO);

			BigDecimal NUMEROFOLIO = this.getCampoNumerico(request, "NUMEROFOLIO");
			formdata.put("NUMEROFOLIO", NUMEROFOLIO);

			if (CODMANDATO != null) {
				m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_GET_LSTACCIONES_MANDATO(NUMEROFOLIO);
				logger.debug(m);
				plReturn = (List) tratarRETURNyMENSAJES(request, m);
				formdata.put("ACCIONES", plReturn);
			}
			logger.debug("$$$$$$$$$$$$ fin pac_iax_caja: " + m);
			return plReturn;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman002Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

		return null;

	}

	public void aceptar(HttpServletRequest request, Axisman002Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		boolean flagCorrecto = true;
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map m;

		try {

			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMANDATO = this.getCampoTextual(request, "CMANDATO");
			logger.debug("+++++++CMANDATO: " + CMANDATO);

			BigDecimal NUMFOLIO = this.getCampoNumerico(request, "NUMFOLIO");
			logger.debug("+++++++NUMFOLIO: " + NUMFOLIO);

			BigDecimal CACCION = this.getCampoNumerico(request, "CACCION");
			logger.debug("+++++++CACCION: " + CACCION);

			Date CPREVISION = stringToSqlDate(getCampoTextual(request, "CPREVISION"));
			logger.debug("+++++++CPREVISION: " + CPREVISION);

			BigDecimal CMANULACION = this.getCampoNumerico(request, "CMANULACION");
			logger.debug("+++++++CMANULACION: " + CMANULACION);

			String CCOMENTARIO = this.getCampoTextual(request, "CCOMENTARIO");
			logger.debug("+++++++CCOMENTARIO: " + CCOMENTARIO);

			if (CMANDATO != null) {

				m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION(NUMFOLIO, CACCION, CPREVISION,
						CMANULACION, CCOMENTARIO);
				logger.debug(m);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, m)).intValue() != 0) {
					flagCorrecto = false;
				}

				if (flagCorrecto) {
					formdata.put("guardat", "0");
				} else {
					formdata.put("guardat", "1");
				}

				this.m_load_data(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman002Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
