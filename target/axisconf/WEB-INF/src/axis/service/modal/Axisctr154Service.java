package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_TR234_OUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr154Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Lista de tipos de traspasos ecg 20100212 AXIS1585 bug 11363, la primera
 * entrega fue a salto de mata y tiene muchos //TODO:s
 */
public class Axisctr154Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisctr154Service() {
	}

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisctr154Service m_init");
		this.configForm(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr154Action thisAction) {
		logger.debug("Axisctr154Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pcinout = getCampoNumerico(request, "CINOUT");
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// CARGO LISTAS //
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(679));
			logger.debug(map);
			request.setAttribute("entradasalida", (List) tratarRETURNyMENSAJES(request, map));
			if (isEmpty(pcinout)) {
				List plReturn = (List) null;
				request.getSession().setAttribute("axisctr_listaPolizas", plReturn);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr154Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr154Action thisAction) {
		logger.debug("Axisctr154Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// if (formdata.get("paginar")==null) {
			request.getSession().removeAttribute("axisctr_listaPolizas");

			BigDecimal pcinout = getCampoNumerico(request, "CINOUT");
			java.sql.Date pfhasta = this.stringToSqlDate(this.getCampoTextual(request, "FHASTA"));

			if (!isEmpty(pcinout)) {
				PAC_IAX_TR234_OUT pacIaxTr234 = new PAC_IAX_TR234_OUT(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				HashMap m = pacIaxTr234.ejecutaPAC_IAX_TR234_OUT__F_BUSCAR_TRASPASOS(pcinout, pfhasta);
				logger.debug(m);
				List plReturn = (List) tratarRETURNyMENSAJES(request, m);

				request.getSession().setAttribute("axisctr_listaPolizas", plReturn);
			}
			// RECARGO LISTAS //
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(679));
			logger.debug(map);
			request.setAttribute("entradasalida", (List) tratarRETURNyMENSAJES(request, map));
			////////////////////
			// }
		} catch (Exception e) {

			logger.error("Error en el servicio Axisctr154Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
		}
	}

	public void m_ajaxseleccionarTras(HttpServletRequest request) {
		logger.debug("Axisctr154Service m_seleccionarProd");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal STRAS = getCampoNumerico(request, "STRAS");
			BigDecimal SELECCIO = getCampoNumerico(request, "SELECCIO");

			/*
			 * Map map = new
			 * PAC_IAX_DINCARTERA((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(CEMPRES,SPROCAR,
			 * SPRODUC,SELECCIO); logger.debug(map);
			 */

			// ajax.rellenarPlAContenedorAjax(map);
			// ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_seleccionarProd", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
