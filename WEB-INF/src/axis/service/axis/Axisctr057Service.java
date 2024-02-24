package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENSEGU;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr057Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr057Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr057Service.class);
	private String modo;

	public void m_init(HttpServletRequest request, Axisctr057Action thisAction) {
		logger.debug("Axisctr057Service m_init");
		try {
			modo = (String) AbstractDispatchAction.topPila(request, "CMODO");
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr057Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr057Action thisAction) {
		logger.debug("Axisctr057Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal sSeguro = getCampoNumerico(request, "SSEGURO");
		BigDecimal nLinea = getCampoNumerico(request, "NLINEA");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

		try {
			// INI IAXIS-4789
			// SI VIENE DE LA PANTALLA DE CONSULTA PÓLIZA EN MODO CONSULTA, DEBE CONTINUAR
			// EN EL MISMO MODO PARA NO PERMITIR AJUSTES EN LA AGENDA
			/* Cambio para IAXIS-16304 : Start */
			if (CMODO != null && !CMODO.equals("CONSULTA")) {
				/* Cambio para IAXIS-16304 : End */
				AbstractDispatchAction.topPila(request, "CMODO", "CONSULAPAGENDPOL");
			}
			// FIN IAXIS-4789
			PAC_IAX_AGENSEGU pacIaxAgenSegu = new PAC_IAX_AGENSEGU(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;

			if (sSeguro != null && nLinea != null) {
				m = pacIaxAgenSegu.ejecutaPAC_IAX_AGENSEGU__F_GET_DATOSAPUNTE(sSeguro, nLinea);
				logger.debug("m:" + m);
				formdata.putAll((HashMap) tratarRETURNyMENSAJES(request, m));
				/* Cambio para IAXIS-16304 : Start */
				Map ob = (Map) tratarRETURNyMENSAJES(request, m);
				if (ob.get("TTEXTOS1") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null && ob.get("TTEXTOS3") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2") + "" + ob.get("TTEXTOS3"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null && ob.get("TTEXTOS3") != null
						&& ob.get("TTEXTOS4") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2") + "" + ob.get("TTEXTOS3") + ""
							+ ob.get("TTEXTOS4"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null && ob.get("TTEXTOS3") != null
						&& ob.get("TTEXTOS4") != null && ob.get("TTEXTOS5") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2") + "" + ob.get("TTEXTOS3") + ""
							+ ob.get("TTEXTOS4") + "" + ob.get("TTEXTOS5"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null && ob.get("TTEXTOS3") != null
						&& ob.get("TTEXTOS4") != null && ob.get("TTEXTOS5") != null && ob.get("TTEXTOS6") != null) {
					formdata.put("TTEXTOS", ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2") + "" + ob.get("TTEXTOS3") + ""
							+ ob.get("TTEXTOS4") + "" + ob.get("TTEXTOS5") + "" + ob.get("TTEXTOS6"));
				}
				if (ob.get("TTEXTOS1") != null && ob.get("TTEXTOS2") != null && ob.get("TTEXTOS3") != null
						&& ob.get("TTEXTOS4") != null && ob.get("TTEXTOS5") != null && ob.get("TTEXTOS6") != null
						&& ob.get("TTEXTOS7") != null) {
					formdata.put("TTEXTOS",
							ob.get("TTEXTOS1") + "" + ob.get("TTEXTOS2") + "" + ob.get("TTEXTOS3") + ""
									+ ob.get("TTEXTOS4") + "" + ob.get("TTEXTOS5") + "" + ob.get("TTEXTOS6") + ""
									+ ob.get("TTEXTOS7"));
				}
				/* Cambio para IAXIS-16304 : End */
				// request.setAttribute(Constantes.FORMDATA, m.get("RETURN"));
			} // else request.removeAttribute(Constantes.FORMDATA);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_volver(HttpServletRequest request, Axisctr057Action thisAction) {
		logger.debug("Axisctr057Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisctr057 = (Map) thisAction.removeTopPila(request, "formdata_axisctr057");
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr057Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/*
	 * Cridem a un metode cancelar per tal de que el CMODO sigui l'original
	 */
	public void m_ajax_cancelar(HttpServletRequest request) {
		logger.debug("Axisctr057Service m_ajax_cancelar");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			AbstractDispatchAction.topPila(request, "CMODO", modo);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr057Service - m�todo m_ajax_cancelar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
