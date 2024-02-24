package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm094Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm094Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm094Action thisAction) {
		try {
			request.getSession().removeAttribute("axiscob001a_cobranzas");

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm094Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String donde = getCampoTextual(request, "DONDE");
			if (!isEmpty(donde)) {
				if (donde.equals(new String("AXISCOMI013")))
					AbstractDispatchAction.topPila(request, "CMODO", "ALTA_POLIZA");
			}

			formdata.put("CONDICION", getCampoTextual(request, "CONDICION"));
			request.getSession().removeAttribute("axisper021_listaPersonas");
			// this.cargarcombos(request,thisAction);
			String ORIGEN = getCampoTextual(request, "ORIGEN");
			formdata.put("ORIGEN", ORIGEN);

			// trans_spl
			formdata.remove("TRANS_SPL");

			BigDecimal pSSEGURO = getCampoNumerico(request, "SSEGURO");

			PAC_IAX_CTACLIENTE pac_iax_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_iax_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_TRANSFERIBLE_SPL(pSSEGURO);

			BigDecimal trans_spl = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

			log.debug(trans_spl);
			formdata.put("TRANS_SPL", trans_spl);

			// tabla caja
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pPCESTADO = new BigDecimal(1);
			BigDecimal pPSEQCAJA = null;

			request.getSession().removeAttribute("listaPolizas");
			PAC_IAX_CAJA PAC_IAX_CAJA = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_LEE_CAJAMOV(pPSSEGURO, pPSEQCAJA, pPCESTADO);
			log.debug(map);
			ArrayList lista_polizas = (ArrayList) tratarRETURNyMENSAJES(request, map1, false);
			request.getSession().setAttribute("listaPolizas", lista_polizas);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		this.cargarcombos(request, thisAction);
	}

	private void cargarcombos(HttpServletRequest request, Axisadm094Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSTATUS();
			listValores.put("status", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * Funcion para busqueda de reembolsos por autorizar con base en el SSEGURO;
	 * SPERSON;STATUS (CESTADO) del mismo * @param request El HttpServletRequest que
	 * contiene la petici�n del cliente web.
	 * 
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_buscar_reembolsos(HttpServletRequest request, Axisadm094Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pPCESTADO = getCampoNumerico(request, "STATUS");
			String NPOLIZA = this.getCampoTextual(request, "NPOLIZA");
			String NOMBRE = this.getCampoTextual(request, "NOMBRE");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("listaPolizas");
				PAC_IAX_CAJA PAC_IAX_CAJA = new PAC_IAX_CAJA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(pPSSEGURO, pSPERSON, pPCESTADO);

				formdata.put("NPOLIZA", NPOLIZA);
				formdata.put("STATUS", pPCESTADO);
				formdata.put("NOMBRE", NOMBRE);
				formdata.put("SSEGURO", pPSSEGURO);
				formdata.put("SPERSON", pSPERSON);

				request.getSession().setAttribute("listaPolizas", (ArrayList) tratarRETURNyMENSAJES(request, map));
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargarcombos(request, thisAction);
		}

	}

	/**
	 * Recarga el n�mero de meses seleccionado
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_persona(HttpServletRequest request, Axisadm094Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("Axiscob001Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_aprueba_caja(HttpServletRequest request, Axisadm094Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO_A");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON_A");
			BigDecimal pPSEQCAJA = getCampoNumerico(request, "SEQCAJA");
			BigDecimal pPAUTORIZA = getCampoNumerico(request, "AUTHORIZE");

			BigDecimal pPSSEGUROBUS = getCampoNumerico(request, "SSEGURO");
			BigDecimal pSPERSONBUS = getCampoNumerico(request, "SPERSON");
			BigDecimal pPCESTADOBUS = getCampoNumerico(request, "STATUS");
			String NPOLIZABUS = getCampoTextual(request, "NPOLIZA");
			String NOMBREBUS = getCampoTextual(request, "NOMBRE");

			request.getSession().removeAttribute("apruebaCaja");
			PAC_IAX_CAJA PAC_IAX_CAJA = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_APRUEBA_CAJA_SPL(pPSSEGURO, pSPERSON, pPSEQCAJA, pPAUTORIZA);
			log.debug(map1);
			BigDecimal apruebaCaja = (BigDecimal) tratarRETURNyMENSAJES(request, map1, false);
			formdata.put("apruebaCaja", apruebaCaja);
			// ramiro inicio
			request.getSession().removeAttribute("listaPolizas");

			Map map = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(pPSSEGUROBUS, pSPERSONBUS,
					pPCESTADOBUS);
			request.getSession().setAttribute("listaPolizas", (ArrayList) tratarRETURNyMENSAJES(request, map));

			formdata.put("NPOLIZA", NPOLIZABUS);
			formdata.put("STATUS", pPCESTADOBUS);
			formdata.put("NOMBRE", NOMBREBUS);
			formdata.put("SSEGURO", pPSSEGUROBUS);
			formdata.put("SPERSON", pSPERSONBUS);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.cargarcombos(request, thisAction);
	}

	/***********************************************
	 * SEARCH AND INSERT POLICIES AMOUNTS - JBENITEZ
	 *******************************************/
	public void m_ajax_search_amount(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// getting data from jsp

			String pPSSEGUROs = getCampoTextual(request, "SSEGURO");

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pPCESTADO = getCampoNumerico(request, "STATUS");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("listaPolizas");
				PAC_IAX_CAJA PAC_IAX_CAJA = new PAC_IAX_CAJA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Map map =
				// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
				// NSIP, SSEGURO);

				Map map = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_LEE_DATMEDIO_REEMBOLSO(pPSSEGURO, pSPERSON, pPCESTADO);
				log.debug(map);

				request.getSession().setAttribute("listaPolizas", (ArrayList) tratarRETURNyMENSAJES(request, map));
				ajax.guardarContenidoFinalAContenedorAjax((ArrayList) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error in the service Axisadm093Service - m_ajax_search_amount", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
