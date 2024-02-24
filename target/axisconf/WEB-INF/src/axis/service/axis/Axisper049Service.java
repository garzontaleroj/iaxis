package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisper049Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisper049Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper049Service m_form");

	}

	public void ajax_documentos(HttpServletRequest request, Axisper049Action thisAction) {
		logger.debug("Axisper049Service ajax_documentos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal selectedPerson = AxisBaseService.getCampoNumerico(request, "selectedPerson");
			BigDecimal selectedAgente = AxisBaseService.getCampoNumerico(request, "selectedAgente");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(selectedPerson)) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(selectedPerson, selectedAgente);
				logger.debug("Personas : " + map);
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);

			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper049Service - mtodo ajax_documentos : ", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_actulizarDatos(HttpServletRequest request) {
		logger.debug("Axisper049Service m_actulizarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal sperson = null;
		BigDecimal nnumIde = null;
		BigDecimal codDeudor = null;
		BigDecimal codAcreedor = null;
		try {
			sperson = AxisBaseService.getCampoNumerico(request, "SPERSON_AGENCIA");
			codDeudor = AxisBaseService.getCampoNumerico(request, "CODIGO_DEUDOR");
			codAcreedor = AxisBaseService.getCampoNumerico(request, "CODIGO_ACREEDOR");
			nnumIde = AxisBaseService.getCampoNumerico(request, "NNUMIDE");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_DEUDOR_ACREEDOR(sperson, codDeudor, codAcreedor);

			logger.debug("Axisper049Service m_actulizarDatos: map: " + map);

			formdata.put("CODIGO_DEUDOR", "");
			formdata.put("CODIGO_ACREEDOR", "");
			formdata.put("NNUMIDE", "");
			formdata.put("NOMBRE", "");
			formdata.put("SPERSON_AGENCIA", "");

			List MENSAJES = (List) map.get("MENSAJES");
			logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

			HashMap mm = (HashMap) MENSAJES.get(0);
			HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");
			logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);

			AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(), new Object[] {},
					Constantes.MENSAJE_INFO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper049Service - mtodo m_actulizarDatos ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_limpiar(HttpServletRequest request, Axisper049Action thisAction) {
		logger.debug("Axisper049Service m_limpiar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			formdata.put("NOMBRE", null);
			formdata.put("NNUMIDE", null);
			formdata.put("CODIGO_DEUDOR", null);
			formdata.put("CODIGO_ACREEDOR", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper049Service - mtodo m_limpiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
