package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin053Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin053Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		AESUtil encryptedVal = new AESUtil();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("800084"));
		listValores.put("lista_roles", (List) tratarRETURNyMENSAJES(request, map, false));

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin053Action thisAction) {
		logger.debug("Axissin053Action m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin053Action m_form");

		try {

			this.cargarListas(request);
			this.formattingNumericValues(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin053Action - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin053Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axissin053Action m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NDEFRAU = getCampoNumerico(request, "NDEFRAU");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal NTIPDEF = getCampoNumerico(request, "NTIPDEF");
			Date FINIEFE = getCampoTextual(request, "FINIEFE") != null ? sdf.parse(getCampoTextual(request, "FINIEFE"))
					: null;
			Date FFINEFE = getCampoTextual(request, "FFINEFE") != null ? sdf.parse(getCampoTextual(request, "FFINEFE"))
					: null;
			java.sql.Date FINIEFE_2 = FINIEFE != null ? new java.sql.Date(FINIEFE.getTime()) : null;
			java.sql.Date FFINEFE_2 = FFINEFE != null ? new java.sql.Date(FFINEFE.getTime()) : null;

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_DEFRAUDADOR(NSINIES, NDEFRAU, SPERSON,
					NTIPDEF, FINIEFE_2, FFINEFE_2);
			logger.debug(map);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado != null && resultado.intValue() == 0) {
				request.setAttribute("resultado", "OK");
			} else {
				request.setAttribute("resultado", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin053Action - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axissin053Action thisAction) {

		logger.debug("Axissin053Action m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarListas(request);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin053Action - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axissin053Action m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");

			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_LISTVALORES_SIN pacIaxListValoresSin = new PAC_IAX_LISTVALORES_SIN(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map cconpag = pacIaxListValoresSin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(CTIPPAG, psproduc);
			ArrayList contenido = (ArrayList) tratarRETURNyMENSAJES(request, cconpag);
			logger.debug(contenido);
			ajax.rellenarPlAContenedorAjax(cconpag);
			ajax.guardarContenidoFinalAContenedorAjax(contenido);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin053Action - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_ajax_personas_defraudadores(HttpServletRequest request) {
		logger.debug("Axissin053Service m_ajax_personas_defraudadores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTIPODEFRAUDADOR = getCampoNumerico(request, "NTIPDEF");

			PAC_IAX_SINIESTROS pac_axis_sin = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_sin.ejecutaPAC_IAX_SINIESTROS__F_GET_PERSONAS_DEFRAUDADORES(SSEGURO, NSINIES,
					NTIPODEFRAUDADOR);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin053Service - m�todo m_ajax_personas_defraudadores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
