package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_COA;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.mvc.control.modal.Axiscoa003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * ALTA Y MANTENIMIENTO CUENTAS COASEGURO - AXISCOA082 segun analisis!
 */
public class Axiscoa003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axiscoa003Action thisAction) {
		logger.debug("Axiscoa003Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recuperar(HttpServletRequest request, Axiscoa003Action thisAction) {
		logger.debug("Axiscoa003Service m_recuperar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String IDREGISTRO = this.getCampoTextual(request, "IDREGISTRO");
			String identificador = this.getCampoTextual(request, "identificador");
			BigDecimal CEMPRES = null;
			BigDecimal CCOMPANI = null;
			BigDecimal SSEGURO = null;
			Date FCIERRE = null;
			BigDecimal NNUMLIN = null;
			BigDecimal CCOMPAPR = null;
			BigDecimal ES_LIQUIDABLE = null;

			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPAPR|CCOMPANI|SSEGURO|FCIERRE
				if (identificadorSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[1].trim());
				if (identificadorSplitted[2].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[2].trim());
				if (identificadorSplitted[3].trim().length() > 0)
					SSEGURO = new BigDecimal(identificadorSplitted[3].trim());
				if (identificadorSplitted[4].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[4].trim());
				if (identificadorSplitted[5].trim().length() > 0)
					ES_LIQUIDABLE = new BigDecimal(identificadorSplitted[5].trim());
			}

			if (IDREGISTRO != null) {
				String[] IDREGISTROSplitted = StringUtils.splitPreserveAllTokens(IDREGISTRO, "|"); // NNUMLIN
				if (IDREGISTROSplitted[0].trim().length() > 0)
					NNUMLIN = new BigDecimal(IDREGISTROSplitted[0].trim());

			}

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));
			ArrayList GET_CAB_CTACOA = (ArrayList) this.tratarRETURNyMENSAJES(request,
					pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_CAB_CTACOA(CEMPRES, CCOMPAPR, CCOMPANI, SSEGURO, FCIERRE));
			logger.debug("******* mapa cabecera coa:" + GET_CAB_CTACOA);
			formdata.put("CAB_COASEGURO", GET_CAB_CTACOA);
			Map map = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_MOV_CTACOA(CEMPRES, CCOMPAPR, CCOMPANI, SSEGURO, FCIERRE,
					null, null, ES_LIQUIDABLE);
			logger.debug("map:" + map);
			formdata.put("GET_MOV_CTACOA", tratarRETURNyMENSAJES(request, map));
			if (NNUMLIN.intValue() < 0) { // si NNUMLIN==-1 es una alta
				request.setAttribute("ALTA", true);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_recuperar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axiscoa003Action thisAction) {
		logger.debug("Axiscoa003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargar_listas(HttpServletRequest request, Axiscoa003Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Nuevo
		String identificador = this.getCampoTextual(request, "identificador");
		BigDecimal CEMPRES = null;
		if (identificador != null) {
			String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPANI|SSEGURO|FCIERRE
			if (identificadorSplitted[0].trim().length() > 0)
				CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
		}
		// Fin Nuevo

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_COA pac_iax_listvalores_coa = new PAC_IAX_LISTVALORES_COA(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
		logger.debug(
				tratarRETURNyMENSAJES(request, pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA()));
		// ver abajo TIPO_IMPORTE request.setAttribute("LSTCONCEP_CTA",
		// tratarRETURNyMENSAJES(request,
		// pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_MOVCTA()));

		if (!isEmpty(CCONCEPTO)) {
			request.setAttribute("LSTTIPO_CTA", tratarRETURNyMENSAJES(request,
					pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CCONCEPTO)));
		}

		request.setAttribute("DETVALORES", tratarRETURNyMENSAJES(request,
				pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017))));

		request.setAttribute("ESTADO_CTA", tratarRETURNyMENSAJES(request,
				pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA()));

		request.setAttribute("TIPO_IMPORTE", tratarRETURNyMENSAJES(request,
				pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE(CEMPRES)));
		// request.setAttribute("TIPO_IMPORTE", tratarRETURNyMENSAJES(request,
		// pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPO_IMPORTE()));

	}

	public void m_aceptar(HttpServletRequest request, Axiscoa003Action thisAction) {
		logger.debug("Axiscoa003Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			String IDREGISTRO = this.getCampoTextual(request, "IDREGISTRO");
			String identificador = this.getCampoTextual(request, "identificador");
			BigDecimal CEMPRES = null;
			BigDecimal CCOMPANI = null;
			BigDecimal SSEGURO = null;
			Date FCIERRE = null;
			BigDecimal NNUMLIN = null;
			BigDecimal CCOMPAPR = null;
			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPAPR|CCOMPANI|SSEGURO|FCIERRE
				if (identificadorSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[1].trim());
				if (identificadorSplitted[2].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[2].trim());
				if (identificadorSplitted[3].trim().length() > 0)
					SSEGURO = new BigDecimal(identificadorSplitted[3].trim());
				if (identificadorSplitted[4].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[4].trim());
			}

			if (IDREGISTRO != null) {
				String[] IDREGISTROSplitted = StringUtils.splitPreserveAllTokens(IDREGISTRO, "|"); // NNUMLIN
				if (IDREGISTROSplitted[0].trim().length() > 0)
					NNUMLIN = new BigDecimal(IDREGISTROSplitted[0].trim());
			}

			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO") != null
					? this.getCampoNumerico(request, "NRECIBO")
					: this.getCampoNumerico(request, "NRECIBO_MODIFVISIBLE");
			BigDecimal SIDEPAG = this.getCampoNumerico(request, "SIDEPAG") != null
					? this.getCampoNumerico(request, "SIDEPAG")
					: this.getCampoNumerico(request, "SIDEPAG_MODIFVISIBLE");
			// BigDecimal CCONCEP=this.getCampoNumerico(request, "CCONCEP");

			// depr. ahora debe ser NNUMLIN BigDecimal
			// SMOVCOA=this.getCampoNumerico(request, "SMOVCOA");
			BigDecimal CTIPCOA = this.getCampoNumerico(request, "CTIPCOA");
			Date FCAMBIO = this.stringToSqlDate(this.getCampoTextual(request, "FCAMBIO"));
			BigDecimal PMODO = this.getCampoNumerico(request, "PMODO");

			// IF pmodo = 0 THEN --Modificaci�n de registros
			// IF pmodo = 1 THEN --Inserci�n de registros Manuales
			logger.debug("PMODO:" + PMODO
					+ " donde 0:modificacion, 1:insercion, cualquier otra cosa o nulo: desconocido y causa probablemente un error");

			BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO") != null
					? this.getCampoNumerico(request, "CESTADO")
					: this.getCampoNumerico(request, "CESTADO_MODIFVISIBLE");
			String TDESCRI = this.getCampoTextual(request, "TDESCRI") != null ? this.getCampoTextual(request, "TDESCRI")
					: this.getCampoTextual(request, "TDESCRI_MODIFVISIBLE");
			String TDOCUME = this.getCampoTextual(request, "TDOCUME") != null ? this.getCampoTextual(request, "TDOCUME")
					: this.getCampoTextual(request, "TDOCUME_MODIFVISIBLE");
			BigDecimal CMOVIMI = this.getCampoNumerico(request, "CMOVIMI") != null
					? this.getCampoNumerico(request, "CMOVIMI")
					: this.getCampoNumerico(request, "CMOVIMI_MODIFVISIBLE");
			BigDecimal CDEBHAB = this.getCampoNumerico(request, "CDEBHAB") != null
					? this.getCampoNumerico(request, "CDEBHAB")
					: this.getCampoNumerico(request, "CDEBHAB_MODIFVISIBLE");
			BigDecimal IIMPORT = this.getCampoNumerico(request, "IIMPORT") != null
					? this.getCampoNumerico(request, "IIMPORT")
					: this.getCampoNumerico(request, "IIMPORT_MODIFVISIBLE");
			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI") != null
					? this.getCampoNumerico(request, "IMOVIMI")
					: this.getCampoNumerico(request, "IMOVIMI_MODIFVISIBLE");
			BigDecimal CIMPORT = this.getCampoNumerico(request, "CIMPORT") != null
					? this.getCampoNumerico(request, "CIMPORT")
					: this.getCampoNumerico(request, "CIMPORT_MODIFVISIBLE");
			Date FCIERRE2 = this.stringToSqlDate(
					this.getCampoTextual(request, "FCIERRE") != null ? this.getCampoTextual(request, "FCIERRE")
							: this.getCampoTextual(request, "FCIERRE_MODIFVISIBLE"));

			if (FCIERRE2 != null) {
				FCIERRE = FCIERRE2;
			}

			if (IMOVIMI == null) {
				IMOVIMI = IIMPORT;
			}

			if (NNUMLIN != null && NNUMLIN.intValue() == -1)
				NNUMLIN = null; // ALTA

			Map map = pac_iax_coa.ejecutaPAC_IAX_COA__F_SET_MOV_CTACOA(CEMPRES, CCOMPANI, NNUMLIN, CTIPCOA, CDEBHAB,
					SSEGURO, NRECIBO, SIDEPAG, FCIERRE, CMOVIMI, CIMPORT, IMOVIMI, FCAMBIO, CESTADO, TDESCRI, TDOCUME,
					PMODO);
			logger.debug("map:" + map);
			Object RETURN = this.tratarRETURNyMENSAJES(request, map);
			if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
				thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);

				// si ha ido bien, enviamos una marca para q se cierra la modal automaticamente.
				// La pantalla debaja deberia recargarse. eso logramos con el
				// RECARGAR_PADRE_A_CANCELAR
				// RCL - 17/07/2013 - Mantis 0027545
				request.setAttribute("CERRAR_Y_RECARGAR_PADRE", "1");
			}
			request.setAttribute("RECARGAR_PADRE_A_CANCELAR", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*
	 * public void m_ajax_cargar_dh(HttpServletRequest request) {
	 * logger.debug("Axiscoa003Service m_ajax_cargar_dh"); UsuarioBean
	 * usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * AjaxContainerService ajax=new AjaxContainerService(); try {
	 * 
	 * BigDecimal CCONCEPTO=getCampoNumerico(request, "CCONCEPTO");
	 * 
	 * logger.debug("cconcepto ---------------> "+CCONCEPTO);
	 * 
	 * PAC_IAX_LISTVALORES pac_iax_listvalores=new
	 * PAC_IAX_LISTVALORES((Connection)request.getAttribute(Constantes.DB01CONN));
	 * 
	 * Map map=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(
	 * CCONCEPTO);
	 * logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_LSTTIPO_CTA()"+map); if
	 * (!isEmpty(map)) { List debe_haber=(List)ajax.rellenarPlAContenedorAjax(map);
	 * ajax.guardarContenidoFinalAContenedorAjax(debe_haber); }
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axiscoa003Service - m�todo m_ajax_cargar_dh", e);
	 * ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 */

}
