package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrmb002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrmb002Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisrmb002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		HashMap factura = new HashMap();
		HashMap acto = new HashMap();
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
		formdata.put("CMODO", CMODO);

		try {

			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Recuperar datos del reembolso */
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			formdata.put("NCERTIF", NCERTIF);

			if (!isEmpty(NREEMB)) {
				Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMB(NREEMB);
				logger.debug(map);
				Map OB_IAX_REEMBOLSO = (Map) tratarRETURNyMENSAJES(request, map);

				formdata.putAll(OB_IAX_REEMBOLSO);

				AbstractDispatchAction.topPila(request, "SPRODUC", OB_IAX_REEMBOLSO.get("SPRODUC"));

				/* Recuperamos la lista de facturas */
				ArrayList listaFacturas = (ArrayList) OB_IAX_REEMBOLSO.get("FACTURAS");
				formdata.put("listaFacturas", listaFacturas);
				ArrayList listaActosTotal = new ArrayList();
				ArrayList listaActosParcial = new ArrayList();
				ArrayList listaActos = new ArrayList();

				BigDecimal NFACT_INICIAL = new BigDecimal("0");
				BigDecimal NFACT_seleccionado = new BigDecimal("0");

				for (int i = 0; i < listaFacturas.size(); i++) {

					// HashMap mapa = (HashMap)listaFacturas.get(i);
					HashMap mapaActos = (HashMap) ((HashMap) listaFacturas.get(i)).get("OB_IAX_REEMBFACT");
					if (i == 0) {
						NFACT_INICIAL = (BigDecimal) mapaActos.get("NFACT");
					}

					NFACT_seleccionado = getCampoNumerico(request, "NFACTURA");
					logger.debug("NFACT_seleccionado 1 =" + NFACT_seleccionado);
					if (NFACT_seleccionado == null) {
						NFACT_seleccionado = NFACT_INICIAL;
					}
					logger.debug("NFACT_seleccionado 2 =" + NFACT_seleccionado);
					formdata.put("NFACTselected", NFACT_seleccionado);
					// Rellenamos un array con todos los actos de todas las facturas.
					listaActos = (ArrayList) mapaActos.get("ACTOS");

					for (int a = 0; a < listaActos.size(); a++) {
						// Cargamos toda la lista en el nuevo array.
						listaActosTotal.add(listaActos.get(a));
					}
				}

				/* Recuperamos los registros correspondientes a la factura seleccionada */
				for (int j = 0; j < listaActosTotal.size(); j++) {
					HashMap mapa_actos_1 = (HashMap) ((HashMap) listaActosTotal.get(j)).get("OB_IAX_REEMBACTFACT");
					// Recogemos el valor de la factura de cada registro y comparamos para ver si
					// pertenece al acto.
					if (mapa_actos_1 != null) {
						BigDecimal NFACT = (BigDecimal) mapa_actos_1.get("NFACT");
						if (NFACT.intValue() == NFACT_seleccionado.intValue()) {
							listaActosParcial.add(listaActosTotal.get(j));
						}
					}
				}
				formdata.put("listaActosParcial", listaActosParcial);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	private void initDatosReembolso(HttpServletRequest request, Axisrmb002Action thisAction) throws Exception {
		logger.debug("Axisrmb002Service initDatosReembolso");
		Map datosGestion = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		Map listValores = new HashMap();

		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de persona
			// Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_
			// logger.debug(map);
			// listValores.put("lstEstados", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrmb002Service.initDatosReembolso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 **/

	public void m_seleccionar_documentacion(HttpServletRequest request) {
		logger.debug("Axisctr009Service m_seleccionar_documentacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CDOCUMENT = getCampoNumerico(request, "CDOCUMENT");
			BigDecimal CSELEC = getCampoNumerico(request, "CSELEC");
			BigDecimal NVERSION = getCampoNumerico(request, "NVERSION");
			BigDecimal CMOTMOV = getCampoNumerico(request, "CMOTMOV");

			// Guardar a BD el documento seleccionado/des-seleccionado
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABADOCUMMOV(CDOCUMENT, NVERSION, CMOTMOV, CSELEC);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_aceptar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrar_errores(HttpServletRequest request) {
		logger.debug("Axisrmb002Service m_borrar errores");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_NETEJA_ERRORS();
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_borrar_errores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_consultar_pol(HttpServletRequest request, Axisrmb002Action thisAction) {
		logger.debug("axisrmb002Service m_consultar_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisrmb002", formdata);
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			formdata.put("SSEGURO_CONS", SSEGURO);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrmb002Service - m�todo m_consultar_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_pol(HttpServletRequest request, Axisrmb002Action thisAction) {
		logger.debug("Axisrmb002Service m_volver_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisrmb002 = (Map) thisAction.removeTopPila(request, "formdata_axisrmb002");
			if (!isEmpty(formdata_axisrmb002))
				formdata.putAll(formdata_axisrmb002);

		} catch (Exception e) {
			logger.error("Error en el servicio axisrmb002Service - m�todo m_volver_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_control_acto(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NREEMB = getCampoNumerico(request, "PPNREEMB");
			BigDecimal NFACT = getCampoNumerico(request, "PNFACTURA");

			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_TIPO_FACTURA(NREEMB, NFACT);
			Map map2 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATA_BAIXA(NREEMB, NFACT);
			logger.debug(map);
			logger.debug(map2);

			Date PFBAJA = (Date) map2.get("PFBAJA");

			if (PFBAJA == null) { // puedo hacer alta si todo OK
				if (new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map))).intValue() == 0) {
					formdata.put("OK_axisrmb005", "0");
				}
			} else {
				// no puedo hacer el alta
				formdata.put("OK_axisrmb005", "-1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb002Service - m�todo m_control_acto", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_edit_factura(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal NFACTURA = getCampoNumerico(request, "NFACTURA");

			if (isEmpty(NFACTURA) && !isEmpty(request.getParameter("NFACTURA")))
				NFACTURA = new BigDecimal(String.valueOf(request.getParameter("NFACTURA")));

			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_MODIF_FACTURA(NREEMB, NFACTURA);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			HashMap factu = new HashMap();
			factu.put("NFACTURA", NFACTURA);
			ajax.setAjaxContainer(factu);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb002Service - m�todo m_ajax_edit_factura", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_act_factura(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal NFACTURA = getCampoNumerico(request, "NFACTURA");

			if (isEmpty(NFACTURA) && !isEmpty(request.getParameter("NFACTURA")))
				NFACTURA = new BigDecimal(String.valueOf(request.getParameter("NFACTURA")));

			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_ACT_FACTURA(NREEMB, NFACTURA);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			HashMap factu = new HashMap();
			factu.put("NFACTURA", NFACTURA);
			ajax.setAjaxContainer(factu);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb002Service - m�todo m_ajax_act_factura", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
