package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm037Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm037Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm037Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisadm037Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm037Action thisAction) {
		logger.debug("Axisadm037Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarCombos(HttpServletRequest request, Axisadm037Action thisAction) throws Exception {
		logger.debug("Axisadm037Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista Empresas
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			listValores.put("lstempresas", tratarRETURNyMENSAJES(request, map));

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES) && request.getParameter("CEMPRES") == null) {
				CEMPRES = usuario.getCempres();
				formdata.put("CEMPRES", CEMPRES);
			}
			// Lista devoluciones
			map = new PAC_IAX_DEVOLUCIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DEVOLUCIONES(CEMPRES);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				listValores.put("lstdevoluciones", map.get("PDEVOLUCIONES"));

			Map mcobbancario = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
			// Fi BFP 28/12/2011 bug 20544/101990
			ArrayList cobbancario = (ArrayList) tratarRETURNyMENSAJES(request, mcobbancario);
			logger.debug(cobbancario);
			if (cobbancario != null) {
				listValores.put("lstcobban", cobbancario);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiadm037 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}

	}

	public void m_buscar(HttpServletRequest request, Axisadm037Action thisAction) {
		logger.debug("Axisadm037Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOBBAN");
			BigDecimal CTIPO = getCampoNumerico(request, "TIPO_PERS");

			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			java.sql.Date FSOPORT = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSOPORTE"));
			java.sql.Date FCARGA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCARGA"));

			java.sql.Date FCARGAINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCARGAINI"));

			java.sql.Date FCARGAFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCARGAFIN"));

			Map map = new PAC_IAX_DEVOLUCIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CONSULTA_DEVOL(CEMPRES, SDEVOLU, FSOPORT, FCARGA, CCOBBAN,
							SPERSON, CTIPO, FCARGAINI, FCARGAFIN);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				if (!isEmpty(map))
					formdata.put("devoluciones", map.get("PDEVOLUCIONES"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisadm037Service m_cargarDatosPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");

			if (NNUMIDE == null)
				NNUMIDE = "";
			if (TNOMBRE == null)
				TNOMBRE = "";

			String CODIGO = "DATOSPERSONA";
			String CONDICION = NNUMIDE + "|" + TNOMBRE;

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			request.getSession().removeAttribute("REC_LSTRECIBOS");
			formdata.put("TIPORECIBO", getCampoTextual(request, "TIPORECIBO"));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargaComboCompania(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void cargaComboCompania(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
		formdata.put("CIAS", listacias);
	}

}
