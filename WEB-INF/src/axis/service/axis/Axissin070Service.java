//Revision:# NOmuKGG2NeR9Sn3uMKA+rA== #

package axis.service.axis;

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
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin070Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin070Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, Axissin070Action thisAction) {

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Map listValores = new HashMap();

			String isNew = getCampoTextual(request, "isNew");

			if (isNew.equals("No")) {
				recuperarApoyo(request, formdata, listValores);
				formdata.put("NUEVO", "NOT");
			} else {

				HashMap<String, String> DETSIN_TRAMITA_APOYOS = new HashMap<String, String>();
				DETSIN_TRAMITA_APOYOS.put("CUNITRA", "AI00");
				formdata.put("DETSIN_TRAMITA_APOYOS", DETSIN_TRAMITA_APOYOS);
				formdata.put("NUEVO", "OK");
			}

			this.cargarListas(request, formdata, listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin070Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void recuperarApoyo(HttpServletRequest request, Map formdata, Map listValores) {

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			PAC_IAX_SINIESTROS pac_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSINTAPOY = getCampoNumerico(request, "SINTAPOY");
			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");

			Map mapReturnSIN_TRAMITA_APOYOS = pac_IAX_SINIESTROS
					.ejecutaPAC_IAX_SINIESTROS__F_GET_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES, pPNTRAMIT);
			List<Map> listSIN_TRAMITA_APOYOS = (List) tratarRETURNyMENSAJES(request, mapReturnSIN_TRAMITA_APOYOS);

			Map DETSIN_TRAMITA_APOYOS = null;
			if (listSIN_TRAMITA_APOYOS != null)
				for (Map obj : listSIN_TRAMITA_APOYOS) {
					DETSIN_TRAMITA_APOYOS = obj;
				}

			formdata.put("DETSIN_TRAMITA_APOYOS", DETSIN_TRAMITA_APOYOS);

			String CUNITRA = getCampoTextual(request, "CUNITRA");
			if (isEmpty(CUNITRA) && pPSINTAPOY != null) {
				CUNITRA = String.valueOf(DETSIN_TRAMITA_APOYOS.get("CUNITRA"));
			}
			Map map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(usuario.getCempres(), CUNITRA);
			listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper070Service.recuperarApoyo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	private void cargarListas(HttpServletRequest request, Map formdata, Map listValores) throws Exception {

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista tipo direcciones
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPODIRECCION();
			listValores.put("lstTipoDireccion", (List) tratarRETURNyMENSAJES(request, map));

			// Lista tipo v�as
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
			listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map));

			// Lista C�digo V�a predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800042));
			listValores.put("lstCodViaPrevio", (List) tratarRETURNyMENSAJES(request, map));

			// Lista Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			listValores.put("lstCLITVP", (List) tratarRETURNyMENSAJES(request, map));

			// Bis predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800044));
			listValores.put("lstCBISVP", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			listValores.put("lstCORVP", (List) tratarRETURNyMENSAJES(request, map));

			// Literal predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800043));
			listValores.put("lstCLITCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			listValores.put("lstCORCO", (List) tratarRETURNyMENSAJES(request, map));

			// Cod. Orientaci�n predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800046));
			listValores.put("lstCOR2CO", (List) tratarRETURNyMENSAJES(request, map));

			// Detalle predio
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800047));
			listValores.put("lstCDET", (List) tratarRETURNyMENSAJES(request, map));

			// Lista pa�ses
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

			// bug 493,494 unidades de tramitacion
			BigDecimal CEMPRES = usuario.getCempres();
			map = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CEMPRES);
			listValores.put("lstcunitra", (List) tratarRETURNyMENSAJES(request, map, false));
			// fin bug 493,494

			map = pac_axis_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SIN_PROVINCIAS", usuario.getCempres());
			BigDecimal sin_provincias = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			formdata.put("sin_provincias", sin_provincias);

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper005Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		try {
			PAC_IAX_SINIESTROS pac_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSINTAPOY = getCampoNumerico(request, "SINTAPOY");
			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pPNAPOYO = getCampoNumerico(request, "NAPOYO");
			String pPCUNITRA = getCampoTextual(request, "CUNITRA");
			String pPCTRAMITAD = getCampoTextual(request, "CTRAMITAD");
			Date pPFINGRESO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINGRESO"), "dd/MM/yyyy");
			Date pPFTERMINO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTERMINO"), "dd/MM/yyyy");
			Date pPFSALIDA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSALIDA"), "dd/MM/yyyy");
			String pPTOBSERVA = getCampoTextual(request, "TOBSERVA");
			String pPTLOCALI = getCampoTextual(request, "TLOCALI");
			BigDecimal pPCSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String pPTNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal pPNNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String pPTCOMPLE = getCampoTextual(request, "TCOMPLE");
			BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal pPCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal pPCPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String pPCPOSTAL = getCampoTextual(request, "CPOSTAL");
			BigDecimal pPCVIAVP = getCampoNumerico(request, "CVIAVP");
			BigDecimal pPCLITVP = getCampoNumerico(request, "CLITVP");
			BigDecimal pPCBISVP = getCampoNumerico(request, "CBISVP");
			BigDecimal pPCORVP = getCampoNumerico(request, "CORVP");
			BigDecimal pPNVIAADCO = getCampoNumerico(request, "NVIAADCO");
			BigDecimal pPCLITCO = getCampoNumerico(request, "CLITCO");
			BigDecimal pPCORCO = getCampoNumerico(request, "CORCO");
			BigDecimal pPNPLACACO = getCampoNumerico(request, "NPLACACO");
			BigDecimal pPCOR2CO = getCampoNumerico(request, "COR2CO");
			BigDecimal pPCDET1IA = getCampoNumerico(request, "CDET1IA");
			String pPTNUM1IA = getCampoTextual(request, "TNUM1IA");
			BigDecimal pPCDET2IA = getCampoNumerico(request, "CDET2IA");
			String pPTNUM2IA = getCampoTextual(request, "TNUM2IA");
			BigDecimal pPCDET3IA = getCampoNumerico(request, "CDET3IA");
			String pPTNUM3IA = getCampoTextual(request, "TNUM3IA");
			String pPLOCALIDAD = getCampoTextual(request, "LOCALIDAD");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			Date pPFMODIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FMODIFI"), "dd/MM/yyyy");
			String pPCUSUMOD = getCampoTextual(request, "CUSUMOD");
			String pPTOBSERVA2 = getCampoTextual(request, "TOBSERVA2");
			BigDecimal pPCAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");

			Map resultado = pac_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_SET_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES,
					pPNTRAMIT, pPNAPOYO, pPCUNITRA, pPCTRAMITAD, pPFINGRESO, pPFTERMINO, pPFSALIDA, pPTOBSERVA,
					pPTLOCALI, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL,
					pPCVIAVP, pPCLITVP, pPCBISVP, pPCORVP, pPNVIAADCO, pPCLITCO, pPCORCO, pPNPLACACO, pPCOR2CO,
					pPCDET1IA, pPTNUM1IA, pPCDET2IA, pPTNUM2IA, pPCDET3IA, pPTNUM3IA, pPLOCALIDAD, pPFALTA, pPCUSUALT,
					pPFMODIFI, pPCUSUMOD, pPTOBSERVA2, pPCAGENTE, pPSPERSON);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);

			if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
				request.setAttribute("grabarOK", true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin070Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void borrar_apoyo(HttpServletRequest request) {
		try {
			PAC_IAX_SINIESTROS pac_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSINTAPOY = getCampoNumerico(request, "SINTAPOY");
			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");

			Map m = pac_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_DEL_SIN_TRAMITA_APOYO(pPSINTAPOY, pPNSINIES,
					pPNTRAMIT);

			this.tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin070Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_selected_cunitra(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = usuario.getCempres();

			if (!isEmpty(CUNITRA)) {
				Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(CEMPRES, CUNITRA);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}
		} catch (Exception e) {
			logger.error("axissin007Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
