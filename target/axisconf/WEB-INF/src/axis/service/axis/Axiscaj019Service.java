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
import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.axis.Axiscaj019Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj019Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj019Action thisAction) {
		logger.debug("Axiscaj019Service m_form");
		this.formattingNumericValues(request);
		try {
			this.cargarDatos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj019Action thisAction) throws Exception {
		try {
			logger.debug("Axiscaj019Service cargarDatos");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = null;
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND2(new BigDecimal(481), "FILTRO481_1");
			logger.debug(map);
			List FORMAPAGO = (List) tratarRETURNyMENSAJES(request, map, false);
			/* Mostrar s�lo los valores Efectivo (0) y Cheque (1). */
			int size = FORMAPAGO.size();

			for (int i = 2; i < size; i++) {
				FORMAPAGO.remove(2);
				logger.debug("i:" + i + "- FORMAPAGO: " + FORMAPAGO);
			}
			formdata.put("FORMAPAGO", FORMAPAGO);

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			logger.debug(map);
			List MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("MONEDAS", MONEDAS);

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPNREFDEPOSITO = this.getCampoNumerico(request, "NREFDEPOSITO");
			logger.debug("+++++++NREFDEPOSITO: " + pPNREFDEPOSITO);

			String pPCMONEOP = this.getCampoTextual(request, "CMONEOP");
			logger.debug("+++++++CMONEOP: " + pPCMONEOP);

			BigDecimal pPCMEDMOV = this.getCampoNumerico(request, "CMEDMOV");
			logger.debug("+++++++CMEDMOV: " + pPCMEDMOV);

			BigDecimal pPIMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			logger.debug("+++++++IMOVIMI: " + pPIMOVIMI);

			if (pPCMONEOP != null) {
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_GET_CHEQUES(pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP);
				logger.debug("++++map  " + map);
				List LSTCHEQUES = (List) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("LSTCHEQUES", LSTCHEQUES);

				map = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_CMONEDA(pPCMONEOP);
				logger.debug("++++map  " + map);
				BigDecimal CMONEDA = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				formdata.put("CMONEDA", CMONEDA);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj001Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List valida_vingresado(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal pPNREFDEPOSITO = this.getCampoNumerico(request, "NREFDEPOSITO");
		formdata.put("NREFDEPOSITO", pPNREFDEPOSITO);
		logger.debug("+++++++NREFDEPOSITO: " + pPNREFDEPOSITO);

		String pPCMONEOP = this.getCampoTextual(request, "CMONEOP");
		formdata.put("CMONEOP", pPCMONEOP);
		logger.debug("+++++++CMONEOP: " + pPCMONEOP);

		BigDecimal pPCMEDMOV = this.getCampoNumerico(request, "CMEDMOV");
		formdata.put("CMEDMOV", pPCMEDMOV);
		logger.debug("+++++++CMEDMOV: " + pPCMEDMOV);

		BigDecimal pPIMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
		formdata.put("IMOVIMI", pPIMOVIMI);
		logger.debug("+++++++IMOVIMI: " + pPIMOVIMI);

		Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_VALIDA_VALOR_INGRESADO(pPNREFDEPOSITO, pPIMOVIMI, pPCMONEOP);

		logger.debug("++++map  " + map);
		BigDecimal rt = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		if (rt.intValue() == 0) {
			List listaMensaje = new ArrayList();
			Map mMensaje = new HashMap();
			mMensaje.put("PCONFIRM", (String) map.get("PCONFIRM"));
			listaMensaje.add(mMensaje);
			formdata.put("PCONFIRM", (String) map.get("PCONFIRM"));
			logger.debug("++++listaMensaje " + listaMensaje);
			return listaMensaje;
		} else {
			return (List) map.get("MENSAJES");
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscaj019Action thisAction) {
		logger.debug("Axiscaj019Service m_aceptar");

		try {
			PAC_IAX_CAJA pac_axis_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal CMONEOP = getCampoNumerico(request, "CMONEDA");
			logger.debug(CMONEOP);
			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			logger.debug(IMOVIMI);
			BigDecimal NREFDEPOSITO = getCampoNumerico(request, "NREFDEPOSITO");
			logger.debug(NREFDEPOSITO);
			BigDecimal CMEDMOV = getCampoNumerico(request, "CMEDMOV");
			logger.debug(CMEDMOV);
			String CHEQUES = this.getCampoTextual(request, "CHEQUES");
			logger.debug(CHEQUES);

			Map map = pac_axis_caja.ejecutaPAC_IAX_CAJA__F_CONFIRMADEPOSITO(CMONEOP, IMOVIMI, NREFDEPOSITO, CMEDMOV,
					CHEQUES);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj019Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_valida_vingresado(HttpServletRequest request) {
		logger.debug("axiscaj019Service m_ajax_ins_pago_inicial");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.valida_vingresado(request));
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj019Service - m�todo m_ajax_valida_vingresado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
