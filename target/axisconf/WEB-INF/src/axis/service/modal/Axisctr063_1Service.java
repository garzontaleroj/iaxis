//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENSEGU;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr063_1Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr063_1Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr063_1Service.class);
	private String modo;

	public void m_init(HttpServletRequest request, Axisctr063_1Action thisAction) {
		logger.debug("axisctr063_1Service m_init");
		try {
			modo = (String) AbstractDispatchAction.topPila(request, "CMODO");
			logger.debug("modo : " + modo);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisctr063_1Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_form(HttpServletRequest request, Axisctr063_1Action thisAction) {
		logger.debug("axisctr063_1Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal sSeguro = getCampoNumerico(request, "SSEGURO");
		BigDecimal nLinea = getCampoNumerico(request, "NLINEA");
		BigDecimal pModo = getCampoNumerico(request, "PMODO");
		BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");

		BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
		BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");
		String TOBSERV = getCampoTextual(request, "TOBSERV");

		formdata.put("NPOLIZA", NPOLIZA);

		formdata.put("NMOVIMI", NMOVIMI);
		formdata.put("CMOTMOV", CMOTMOV);
		formdata.put("TOBSERV", TOBSERV);

		try {

			if (pModo.intValue() == 0)
				AbstractDispatchAction.topPila(request, "CMODO", "ALTAAPAGENDPOL");
			else
				AbstractDispatchAction.topPila(request, "CMODO", "MODIFAPAGENDPOL");

			PAC_IAX_AGENSEGU pacIaxAgenSegu = new PAC_IAX_AGENSEGU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			cargarDatosCombos(request, thisAction);

			m = pacIaxAgenSegu.ejecutaPAC_IAX_AGENSEGU__F_GET_DATOSAPUNTE(sSeguro, nLinea);
			this.tratarRETURNyMENSAJES(request, m);

			if (pModo.intValue() == 0) {
				// Alta Agenda

				logger.debug("m:" + m);
				formdata.putAll((HashMap) tratarRETURNyMENSAJES(request, m));

				formdata.put("SSEGURO", sSeguro);
				formdata.put("FALTA", new java.util.Date());

			} else {
				// Modificaci� Agenda
				logger.debug("m:" + m);
				formdata.putAll((HashMap) tratarRETURNyMENSAJES(request, m));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisctr063_1Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

	private void cargarDatosCombos(HttpServletRequest request, Axisctr063_1Action thisAction) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		AjaxContainerService ajax = new AjaxContainerService();
		Map listValores = new HashMap();

		try {

			// Lista concepto apuntes
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA();
			// logger.debug(map);
			request.setAttribute("lstconceptosapunteagenda", (List) tratarRETURNyMENSAJES(request, map));
			// Lista estado apuntes
			// map =
			// pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			// logger.debug(map);
			// request.setAttribute("lstestadosapunteagenda", (List)
			// tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo cargarDatosCombos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.configForm(request, whoami(Axisctr063_1Service.class));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisctr063_1Action thisAction) {
		logger.debug("axisctr063_1Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			logger.debug("modo aceptar : " + modo);
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLI");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			String TTITULO = getCampoTextual(request, "TTITULO");
			String TTEXTOS = getCampoTextual(request, "TTEXTOS");
			BigDecimal CTIPREG = new BigDecimal(5);
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			Date FAPUNTE = stringToSqlDate(getCampoTextual(request, "FALTA"));
			Date FFINALI = stringToSqlDate(getCampoTextual(request, "FFINALI"));
			BigDecimal CMODO = getCampoNumerico(request, "PMODO");

			Map map = new PAC_IAX_AGENSEGU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENSEGU__F_SET_DATOSAPUNTE(NPOLIZA, SSEGURO, NLINEA, TTITULO, TTEXTOS, CTIPREG,
							CESTADO, FAPUNTE, FFINALI, CMODO, "POL");
			if (BigDecimal.ZERO.equals(this.tratarRETURNyMENSAJES(request, map))) {
				formdata.put("OK", "0");
				AbstractDispatchAction.topPila(request, "CMODO", modo);
			}
			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1

			this.cargarDatosCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo m_aceptar", e);

		}
		this.configForm(request, whoami(Axisctr063_1Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_volver(HttpServletRequest request, Axisctr063_1Action thisAction) {
		logger.debug("axisctr063_1Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr063_1 = (Map) thisAction.removeTopPila(request, "formdata_axisctr063_1");
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(Axisctr063_1Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_estado(HttpServletRequest request, Axisctr063_1Action thisAction) {
		logger.debug("axisctr063_1Service m_estado");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal cValor = getCampoNumerico(request, "CVALOR");

			if (!isEmpty(cValor) && cValor.intValue() == 1) {
				java.util.Date Actual = new java.util.Date();
				formdata.put("FFINALI", Actual);
			} else
				formdata.remove("FFINALI");

			this.cargarDatosCombos(request, thisAction);

			logger.debug("QQQQQQQ " + (List) request.getAttribute("DEPENDENCIAS"));

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr063_1Service - m�todo m_estado", e);

		}

		this.configForm(request, whoami(Axisctr063_1Service.class));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/*
	 * Cridem a un metode cancelar per tal de que el CMODO sigui l'original de la
	 * pantalla que el crida.
	 */
	public void m_ajax_cancelar(HttpServletRequest request) {
		logger.debug("Axisctr100Service m_ajax_guardarActivitat");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			AbstractDispatchAction.topPila(request, "CMODO", modo);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr100Service - m�todo m_ajax_guardarActivitat", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
