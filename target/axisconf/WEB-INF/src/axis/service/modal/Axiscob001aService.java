package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axiscob001aAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscob001aService extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscob001aAction thisAction) {
		try {
			request.getSession().removeAttribute("axiscob001a_cobranzas");

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
	public void m_form(HttpServletRequest request, Axiscob001aAction thisAction) {
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

			// Get suma caja
			formdata.remove("SUM");

			// sum
			Map map2 = PAC_IAX_CAJA.ejecutaPAC_IAX_CAJA__F_GET_SUMA_CAJA(pPSSEGURO, pSPERSON, pPCESTADO);

			BigDecimal sum;
			sum = (BigDecimal) this.tratarRETURNyMENSAJES(request, map2, false);

			log.debug(sum);
			formdata.put("SUM", sum);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
	 * b�squeda de Personas en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisper021_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axiscob001aAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NSIP = getCampoTextual(request, "NSIP");
			String NOMBRECOMP = getCampoTextual(request, "NOMBRECOMP");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			String MODO_SWPUBLI = getCampoTextual(request, "MODO_SWPUBLI");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CONDICION = getCampoTextual(request, "CONDICION");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisper021_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				// Map map =
				// pacIaxListavlores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERSONAS(NNUMNIF, NOMBRE,
				// NSIP, SSEGURO);

				Map map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_GENERICA_COND(NNUMNIF, NOMBRECOMP,
						NSIP, NOMBRE, TAPELLI1, TAPELLI2, CTIPIDE, CAGENTE, MODO_SWPUBLI, CONDICION);
				log.debug(map);

				request.getSession().setAttribute("axisper021_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}/*  */

	/**
	 * Dado un seqCaja Borrar de la tabla cajamov y cajadatmedio la asociacion de
	 * reembolsos MSV
	 * 
	 */
	public void m_delete_cajamov(HttpServletRequest request, Axiscob001aAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSEQCAJA = getCampoNumerico(request, "SEQCAJA");
			BigDecimal pPNNUMLIN = getCampoNumerico(request, "NNUMLIN");
			BigDecimal pPCESTADO = new BigDecimal(1);

			request.getSession().removeAttribute("delCajaReturn");
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_DELMOVCAJA_SPL(pPSSEGURO, pPSEQCAJA, pPNNUMLIN, pPCESTADO);

			BigDecimal delCajaReturn = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

			log.debug(delCajaReturn);
			formdata.put("delCajaReturn", delCajaReturn);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_aplicar(HttpServletRequest request, Axiscob001aAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");

			request.getSession().removeAttribute("aplicarReturn");
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INSMOVCAJA_APPLY(pPSSEGURO, pPSPERSON);

			BigDecimal aplicarReturn;
			aplicarReturn = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

			log.debug(aplicarReturn);
			formdata.put("aplicarReturn", aplicarReturn);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.m_form(request, thisAction);
		}
	}

	public void m_insertar_break(HttpServletRequest request, Axiscob001aAction thisAction) {
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
			BigDecimal pPCEMPRES = new BigDecimal(19);
			BigDecimal pSEQCAJA_D = new BigDecimal(0);
			BigDecimal pCESTCHQ = new BigDecimal(0);
			BigDecimal pPNREFDEPOSITO = new BigDecimal(0);
			BigDecimal pPCAUTORIZA = new BigDecimal(0);
			BigDecimal pPNULTDIGTAR = new BigDecimal(0);
			BigDecimal pNCUOTAS = new BigDecimal(0);
			BigDecimal pPCCOMERCIO = new BigDecimal(0);

			BigDecimal pPCMONEOP = new BigDecimal(1);

			String pPNCHEQUE = "";
			BigDecimal pPCBANCO = new BigDecimal(3);
			String pPCCC = "";
			BigDecimal pPCTIPTAR = new BigDecimal(0);
			BigDecimal pPNTARGET = new BigDecimal(0);
			String pPFCADTAR = "";
			BigDecimal pPCESTADO = new BigDecimal(1);

			request.getSession().removeAttribute("seqCaja");

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INSMOVCAJA_SPL(pPCEMPRES, pSSEGURO, PAMOUNT, pPNCHEQUE,
					pCESTCHQ, pPCBANCO, pPCCC, pPCTIPTAR, pPNTARGET, pPFCADTAR, pPCMEDMOV, pPCMONEOP, pPNREFDEPOSITO,
					pPCAUTORIZA, pPNULTDIGTAR, pNCUOTAS, pPCCOMERCIO, pPCESTADO, pSSEGURO_D, pCRAZON, pSEQCAJA_D,
					pSPERSON);

			BigDecimal seqCaja;
			seqCaja = (BigDecimal) this.tratarRETURNyMENSAJES(request, map, false);

			log.debug(seqCaja);
			formdata.put("seqCaja", seqCaja);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.m_form(request, thisAction);
		}
	}

}
