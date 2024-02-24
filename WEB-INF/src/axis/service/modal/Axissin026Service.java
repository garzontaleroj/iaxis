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
import axis.mvc.control.modal.Axissin026Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin026Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin026Action thisAction) {
		logger.debug("Axissin026Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin026Service m_form");

		try {
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");

			BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUME");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");

			String isNew = getCampoTextual(request, "isNew");
			logger.debug(isNew);

			// AB CONSULTA DE INFO DE DOCUMENTOS BUG-5279
			BigDecimal CMODO = getCampoNumerico(request, "MODO");
			formdata.put("CMODO", CMODO);

			cargarListas(request);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDOCUMENTO(NSINIES,
						NTRAMIT, NDOCUME);

				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
					formdata.putAll((Map) map.get("RETURN"));
				}

			} else {
				formdata.put("FRECLAMA", fcGetFechaActual());
			}

			/* Obtenemos la descripci�n a trav�s del CDOCUME */

			BigDecimal CDOCUME = getCampoNumerico(request, "CDOCUME");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");
			BigDecimal CIDIOMA = usuario.getCidioma();
			if (!isEmpty(CDOCUME) && isEmpty(DESCRIPCION)) {
				pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTOS(CDOCUME, CIDIOMA);
				logger.debug(map);

				if (!isEmpty(map)) {
					DESCRIPCION = (String) map.get("PTDOCUME");
					formdata.put("DESCRIPCION", DESCRIPCION);
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin026Action thisAction) {

		logger.debug("Axissin026Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);
			BigDecimal NDANO = getCampoNumerico(request, "NDANO");
			logger.debug("NDANO-->" + NDANO);
			String TDANO = this.getCampoTextual(request, "TDANO");
			logger.debug("TDANO-->" + TDANO);
			BigDecimal CTPINF = this.getCampoNumerico(request, "CTPINF");
			logger.debug("CTPINF-->" + CTPINF);

			BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUME");
			logger.debug("NDOCUME-->" + NDOCUME);
			BigDecimal CDOCUME = getCampoNumerico(request, "CDOCUME");
			logger.debug("CDOCUME-->" + CDOCUME);
			BigDecimal IDDOC = getCampoNumerico(request, "IDDOC");
			logger.debug("CTPINF-->" + CTPINF);

			Date FRECLAMA = stringToSqlDate(getCampoTextual(request, "FRECLAMA"));
			Date FRECIBE = stringToSqlDate(getCampoTextual(request, "FRECIBE"));
			Date FCADUCA = stringToSqlDate(getCampoTextual(request, "FCADUCA"));
			BigDecimal COBLIGA = this.getCampoNumerico(request, "COBLIGAV");
			logger.debug("COBLIGA-->" + COBLIGA);
			// BigDecimal COBLIGA = new BigDecimal("0");
			String TDESCRIPCION = this.getCampoTextual(request, "DESCRIPCION");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDOCUMENTO(NSINIES, NTRAMIT,
					NDOCUME, CDOCUME, IDDOC, FRECLAMA, FRECIBE, FCADUCA, COBLIGA, TDESCRIPCION);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("NDOCUME", map.get("PNDOCUME_OUT"));
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin026Service - m�todo m_guardar", e);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}

	}

	public void m_editar_documento(HttpServletRequest request, Axissin026Action thisAction) {

		logger.debug("Axissin026Service m_editar_documento");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug("NSINIES-->" + NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug("NTRAMIT-->" + NTRAMIT);

			BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUME");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDOCUMENTO(NSINIES, NTRAMIT,
					NDOCUME);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			logger.error("Error en el servicio Axissin026Service - m�todo m_editar_documento", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}

	}

	/**
	 * Carga las garantias a partir del SSEGURO
	 * 
	 * @param request
	 */
	public void m_ajax_titulo_descripcion(HttpServletRequest request) {
		logger.debug("Axissin026Service m_ajax_carga_datos_titulo_descripcion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CDOCUME = getCampoNumerico(request, "CDOCUME");
			BigDecimal CIDIOMA = usuario.getCidioma();

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTOS(CDOCUME, CIDIOMA);
			logger.debug(map);

			if (!isEmpty(map)) {

				HashMap valores = new HashMap();
				String PTTITDOC = (String) map.get("PTTITDOC");
				String PTDOCUME = (String) map.get("PTDOCUME");
				valores.put("PTTITDOC", PTTITDOC);
				valores.put("PTDOCUME", PTDOCUME);

				ajax.guardarContenidoFinalAContenedorAjax(valores);
				logger.debug(valores);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr010Service - m�todo m_ajax_garantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(802));
		listValores.put("tipo_inf", (List) tratarRETURNyMENSAJES(request, map));

		Map mapa = pac_axis_listValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCDOCUME();
		listValores.put("lst_docume", (List) tratarRETURNyMENSAJES(request, mapa));

		request.setAttribute("listValores", listValores);

	}

}
