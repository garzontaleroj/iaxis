package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea039Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrea039Service.java 06/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisrea039Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String pmodo;

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axisrea039Action thisAction) {
		logger.debug("Axisrea039Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			String cmodo = this.getCampoTextual(request, "CMODO");

			if (cmodo.equals("1")) {
				AbstractDispatchAction.topPila(request, "CMODO", "ALTA");
			} else if (cmodo.equals("0")) {
				AbstractDispatchAction.topPila(request, "CMODO", "MODIFICACION");
			} else if (cmodo.equals("2"))
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisrea039Action thisAction) {
		logger.debug("Axisrea039Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			String cmodo = this.getCampoTextual(request, "PMODO");
			Date d = new Date(new java.util.Date().getTime()); // Recoger la fecha actual
			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_recargar(HttpServletRequest request, Axisrea039Action thisAction) {
		logger.debug("Axisrea039Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarlistas(HttpServletRequest request, Axisrea039Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_REA pac_axis_listValoresRea = new PAC_IAX_LISTVALORES_REA(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CDEBHAB = this.getCampoNumerico(request, "CDEBHAB");
		Map m = pac_axis_listValoresRea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPO_MOVCTA();
		// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA();
		logger.debug(m);
		listValores.put("lstconcep", (List) tratarRETURNyMENSAJES(request, m));

		// if (!isEmpty(CDEBHAB)) {
		m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(19));
		// pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CDEBHAB);
		logger.debug(m);
		listValores.put("lsttipocta", (List) tratarRETURNyMENSAJES(request, m));
		// }

		m = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017));
		logger.debug(m);
		listValores.put("lstcfiscal", (List) tratarRETURNyMENSAJES(request, m));

		m = pac_axis_listValoresRea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA();
		logger.debug(m);
		listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, m));

		String NSINIES = getCampoTextual(request, "NSINIES");
		if (!isEmpty(NSINIES)) {
			m = pac_axis_listValoresRea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_IDENTIF_PAGO_SIN(new BigDecimal(NSINIES));
			logger.debug(m);
			listValores.put("lstsidepag", (List) tratarRETURNyMENSAJES(request, m));
		}

		formdata.put("listvalores", listValores);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_guardar(HttpServletRequest request, Axisrea039Action thisAction) {
		logger.debug("Axisrea039Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.formattingNumericValues(request);
			BigDecimal resultado = new BigDecimal("1");
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal NNUMLIN = this.getCampoNumerico(request, "NNUMLIN");
			BigDecimal NVERSIO = this.getCampoNumerico(request, "NVERSIO");
			BigDecimal CDEBHAB = this.getCampoNumerico(request, "CDEBHAB");
			BigDecimal IMPORTE = this.getCampoNumerico(request, "IIMPORT");
			formdata.put("IIMPORT", IMPORTE);
			String NDOCUME = this.getCampoTextual(request, "NDOCUME");
			String TDESCRIP = this.getCampoTextual(request, "TDESCRIP");
			BigDecimal CMODO = this.getCampoNumerico(request, "CMODO");

			BigDecimal IMPORT_MONCON = this.getCampoNumerico(request, "IMPORT_MONCON"); // Deber�a ser null
			BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
			BigDecimal CTRAMO = this.getCampoNumerico(request, "CTRAMO");
			BigDecimal SCONTRA = this.getCampoNumerico(request, "SCONTRA");
			BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO");
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			BigDecimal SCESREA = this.getCampoNumerico(request, "SCESREA");
			Date FMOVIMI = this.stringToSqlDate(this.getCampoTextual(request, "FMOVIMI"));
			Date FEFECTO = this.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));
			Date FCAMBIO = null;// new Date(new java.util.Date().getTime()); //Recoger la fecha actual -> Al
								// insertar registros nuevos como pon�a una nueva, no se visualizaban, se opta
								// por enviarla a null

			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");
			BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");

			BigDecimal SIDEPAG = this.getCampoNumerico(request, "SIDEPAG");
			// INI - AXIS 4624 - 11/07/2019 - AABG - SE REALIZA VALIDACION DE NULL COMPANIA
			// PARA GUARDAR Y EDITAR
			BigDecimal CIAPROP = getCampoNumerico(request, "COMPANIA") == null ? new BigDecimal(0)
					: getCampoNumerico(request, "COMPANIA");
			// FIN - AXIS 4624 - 11/07/2019 - AABG - SE REALIZA VALIDACION DE NULL COMPANIA
			// PARA GUARDAR Y EDITAR

			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_MOVCTATECNICA(CCOMPANI, NVERSIO, SCONTRA, CTRAMO, NNUMLIN,
					FMOVIMI, FEFECTO, CCONCEPTO, CDEBHAB, IMPORTE, CESTADO, SPROCES, SCESREA, IMPORT_MONCON, FCAMBIO,
					CEMPRES, TDESCRIP, NDOCUME, NPOLIZA, NCERTIF, NSINIES, SPRODUC, CMODO, SIDEPAG, CIAPROP);

			this.tratarRETURNyMENSAJES(request, map);

			logger.debug(map);

			resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				formdata.put("OK", "OK");
			} else {
				formdata.put("OK", "KO");
			}

			cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_salir(HttpServletRequest request, Axisrea039Action thisAction) {
		logger.debug("Axisrea039Service m_salir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			logger.debug("modo al entrar-->" + pmodo);
			AbstractDispatchAction.topPila(request, "CMODO", pmodo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_salir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_sidepag(HttpServletRequest request) {
		logger.debug("Axisrea039Service m_ajax_sidepag");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NSINIES = getCampoTextual(request, "NSINIES");
			PAC_IAX_LISTVALORES_REA pac_axis_listValoresRea = new PAC_IAX_LISTVALORES_REA(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(NSINIES)) {
				Map map = pac_axis_listValoresRea
						.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_IDENTIF_PAGO_SIN(new BigDecimal(NSINIES));
				logger.debug(map);

				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea039Service - m�todo m_ajax_sidepag", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
