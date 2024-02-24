//Revision:# AhA3OCpRMrZHS8fGEkaw8w== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscob001bAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscob001bService extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscob001bAction thisAction) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	public void m_form(HttpServletRequest request, Axiscob001bAction thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarcombos(request, thisAction);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarcombos(HttpServletRequest request, Axiscob001bAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMONTO();
			listValores.put("montoMSV", (List) tratarRETURNyMENSAJES(request, map));
			formdata.put("listValores", listValores);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_insertar_break(HttpServletRequest request, Axiscob001bAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal pSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pSSEGURO_D = getCampoNumerico(request, "SSEGURO_D");

			BigDecimal pSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal TRANS_SPL = getCampoNumerico(request, "TRANS_SPL");
			BigDecimal PAMOUNT = getCampoNumerico(request, "PAMOUNT");
			BigDecimal pPCMEDMOV = getCampoNumerico(request, "ACCOUNT");
			BigDecimal pCRAZON = getCampoNumerico(request, "RFREIMBURSING");
			BigDecimal pPCEMPRES = usuario.getCempres();
			BigDecimal pSEQCAJA_D = new BigDecimal(0);
			BigDecimal pCESTCHQ = new BigDecimal(0);
			BigDecimal pPNREFDEPOSITO = new BigDecimal(0);
			BigDecimal pPCAUTORIZA = new BigDecimal(0);
			BigDecimal pPNULTDIGTAR = new BigDecimal(0);
			BigDecimal pNCUOTAS = new BigDecimal(0);
			BigDecimal pPCCOMERCIO = new BigDecimal(0);

			BigDecimal pPCMONEOP = new BigDecimal(1);

			String pPNCHEQUE = "";
			String pPCBANCO = ""; // new BigDecimal(3); //rdd
			String pPCCC = "";
			BigDecimal pPCTIPTAR = new BigDecimal(0);
			BigDecimal pPNTARGET = new BigDecimal(0);
			String pPFCADTAR = "";
			BigDecimal pPCESTADO = new BigDecimal(1);

			request.getSession().removeAttribute("seqCaja");

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INSMOVCAJA_SPL(pPCEMPRES, pSSEGURO, PAMOUNT, pPNCHEQUE,
					pCESTCHQ, null, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPCMEDMOV, pPCMONEOP, pPNREFDEPOSITO,
					pPCAUTORIZA, pPNULTDIGTAR, pNCUOTAS, pPCCOMERCIO, pPCESTADO, pSSEGURO_D, pCRAZON, pSEQCAJA_D,
					pSPERSON);
			BigDecimal seqCaja;
			seqCaja = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);
			if (seqCaja.equals(BigDecimal.ZERO))
				formdata.put("f_aceptar_true", "OK");
			this.cargarcombos(request, thisAction);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_cargaLista(HttpServletRequest request, Axiscob001bAction thisAction) {

		log.info("Axiscob001 - m_cargaLista");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			Map listValores = new HashMap();
			String VLISTA = getCampoTextual(request, "VLISTA");

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (VLISTA.equals("1") || VLISTA.equals("2")) {
				Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(1903),
						"catribu in (8,9,10,11,12,13,14,15,16,17,18)");
				listValores.put("reembolsoMSV", tratarRETURNyMENSAJES(request, map2));
			} else if (VLISTA.equals("7")) {
				Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(1903),
						"catribu in (21)");
				listValores.put("reembolsoMSV", tratarRETURNyMENSAJES(request, map2));
			}
			ajax.guardarContenidoFinalAContenedorAjax(listValores);

		} catch (Exception e) {
			log.error("Error Service Axiscob001Service - m_cargaLista", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
