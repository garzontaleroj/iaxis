package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin049Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin049Service.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axissin049Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axissin049Action thisAction) {
		logger.debug("Axissin049Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			if (formdata.get("NLINJUZ") != null) {
				PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal pPNLINJUZ = getCampoNumerico(request, "NLINJUZ");
				String pPNSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIJUZGADO(pPNSINIES,
						pPNTRAMIT, pPNLINJUZ);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);
				map = (Map) map.get("RETURN");
				formdata.putAll(map);
			}
			cargarListas(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin049Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarListas(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// NCLASEDE 800066
			PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800066));
			List lst_NCLASEDE = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_NCLASEDE);
			formdata.put("lst_NCLASEDE", !isEmpty(lst_NCLASEDE) ? lst_NCLASEDE : new ArrayList());
			// NTIPOPRO 800065
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800065));
			List lst_NTIPOPRO = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_NTIPOPRO);
			formdata.put("lst_NTIPOPRO", !isEmpty(lst_NTIPOPRO) ? lst_NTIPOPRO : new ArrayList());
			// CPLEITO 800064
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800064));
			List lst_CPLEITO = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CPLEITO);
			formdata.put("lst_CPLEITO", !isEmpty(lst_CPLEITO) ? lst_CPLEITO : new ArrayList());
			// CARGUDEF
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800063));
			List lst_CARGUDEF = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CARGUDEF);
			formdata.put("lst_CARGUDEF", !isEmpty(lst_CARGUDEF) ? lst_CARGUDEF : new ArrayList());
			// CRESPLEI
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800062));
			List lst_CRESPLEI = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CRESPLEI);
			formdata.put("lst_CRESPLEI", !isEmpty(lst_CRESPLEI) ? lst_CRESPLEI : new ArrayList());
			// CAPELANT
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800061));
			List lst_CAPELANT = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CAPELANT);
			formdata.put("lst_CAPELANT", !isEmpty(lst_CAPELANT) ? lst_CAPELANT : new ArrayList());
			// CESTPROC
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800060));
			List lst_CESTPROC = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CESTPROC);
			formdata.put("lst_CESTPROC", !isEmpty(lst_CESTPROC) ? lst_CESTPROC : new ArrayList());
			// CETAPROC
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800059));
			List lst_CETAPROC = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CETAPROC);
			formdata.put("lst_CETAPROC", !isEmpty(lst_CETAPROC) ? lst_CETAPROC : new ArrayList());
			// NTIPODEM
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800067));
			List lst_NTIPODEM = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_NTIPODEM);
			formdata.put("lst_NTIPODEM", !isEmpty(lst_NTIPODEM) ? lst_NTIPODEM : new ArrayList());
			// CORGJUD
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800059));
			List lst_CORGJUD = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_CORGJUD);
			formdata.put("lst_CORGJUD", !isEmpty(lst_CORGJUD) ? lst_CORGJUD : new ArrayList());
			// COPERCOB
			map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			List lst_COPERCOB = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(lst_COPERCOB);
			formdata.put("lst_COPERCOB", !isEmpty(lst_COPERCOB) ? lst_COPERCOB : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin049Service - m�todo cargarListas", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axissin049Action thisAction) {
		logger.debug("Axissin049Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.formattingNumericValues(request);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pPCORGJUD = getCampoNumerico(request, "CORGJUD");
			String pPNORGJUD = getCampoTextual(request, "NORGJUD");
			BigDecimal pPNLINJUZ = getCampoNumerico(request, "NLINJUZ");
			String pPTREFJUD = getCampoTextual(request, "TREFJUD");
			BigDecimal pPCSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String pPTNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal pPNNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String pPTCOMPLE = getCampoTextual(request, "TCOMPLE");
			String pPTDIREC = getCampoTextual(request, "TDIREC");
			BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal pPCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal pPCPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String pPCPOSTAL = getCampoTextual(request, "CPOSTAL");

			String pPTASUNTO = getCampoTextual(request, "TASUNTO");
			BigDecimal pPNCLASEDE = getCampoNumerico(request, "NCLASEDE");
			BigDecimal pPNTIPOPRO = getCampoNumerico(request, "NTIPOPRO");
			String pPNPROCEDI = getCampoTextual(request, "NPROCEDI");
			Date pPFNOTIASE = stringToSqlDate(getCampoTextual(request, "FNOTIASE"));
			Date pPFRECPDEM = stringToSqlDate(getCampoTextual(request, "FRECPDEM"));
			Date pPFNOTICIA = stringToSqlDate(getCampoTextual(request, "FNOTICIA"));
			Date pPFCONTASE = stringToSqlDate(getCampoTextual(request, "FCONTASE"));
			Date pPFCONTCIA = stringToSqlDate(getCampoTextual(request, "FCONTCIA"));
			Date pPFAUDPREV = stringToSqlDate(getCampoTextual(request, "FAUDPREV"));
			Date pPFJUICIO = stringToSqlDate(getCampoTextual(request, "FJUICIO"));
			String pPCMONJUZ = getCampoTextual(request, "CMONJUZ");
			BigDecimal pPCPLEITO = getCampoNumerico(request, "CPLEITO");
			BigDecimal pPIPLEITO = getCampoNumerico(request, "IPLEITO");
			BigDecimal pPIALLANA = getCampoNumerico(request, "IALLANA");
			BigDecimal pPISENTENC = getCampoNumerico(request, "ISENTENC");
			BigDecimal pPISENTCAP = getCampoNumerico(request, "ISENTCAP");
			BigDecimal pPISENTIND = getCampoNumerico(request, "ISENTIND");
			BigDecimal pPISENTCOS = getCampoNumerico(request, "ISENTCOS");
			BigDecimal pPISENTINT = getCampoNumerico(request, "ISENTINT");
			BigDecimal pPISENTOTR = getCampoNumerico(request, "ISENTOTR");
			BigDecimal pPCARGUDEF = getCampoNumerico(request, "CARGUDEF");
			BigDecimal pPCRESPLEI = getCampoNumerico(request, "CRESPLEI");
			BigDecimal pPCAPELANT = getCampoNumerico(request, "CAPELANT");
			String pPTHIPOASE = getCampoTextual(request, "THIPOASE");
			String pPTHIPOTER = getCampoTextual(request, "THIPOTER");
			String pPTTIPRESP = getCampoTextual(request, "TTIPRESP");
			BigDecimal pPCOPERCOB = getCampoNumerico(request, "COPERCOB");
			String pPTREASMED = getCampoTextual(request, "TREASMED");
			BigDecimal pPCESTPROC = getCampoNumerico(request, "CESTPROC");
			BigDecimal pPCETAPROC = getCampoNumerico(request, "CETAPROC");
			String pPTCONCJUR = getCampoTextual(request, "TCONCJUR");
			String pPTESTRDEF = getCampoTextual(request, "TESTRDEF");
			String pPTRECOMEN = getCampoTextual(request, "TRECOMEN");
			String pPTOBSERV = getCampoTextual(request, "TOBSERV");
			Date pPFCANCEL = stringToSqlDate(getCampoTextual(request, "FCANCEL"));
			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIJUZGADO(pPNSINIES, pPNTRAMIT,
					pPNLINJUZ, pPCORGJUD, pPNORGJUD, pPTREFJUD, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPTDIREC,
					pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPTASUNTO, pPNCLASEDE, pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE,
					pPFRECPDEM, pPFNOTICIA, pPFCONTASE, pPFCONTCIA, pPFAUDPREV, pPFJUICIO, pPCMONJUZ, pPCPLEITO,
					pPIPLEITO, pPIALLANA, pPISENTENC, pPISENTCAP, pPISENTIND, pPISENTCOS, pPISENTINT, pPISENTOTR,
					pPCARGUDEF, pPCRESPLEI, pPCAPELANT, pPTHIPOASE, pPTHIPOTER, pPTTIPRESP, pPCOPERCOB, pPTREASMED,
					pPCESTPROC, pPCETAPROC, pPTCONCJUR, pPTESTRDEF, pPTRECOMEN, pPTOBSERV, pPFCANCEL);
			logger.debug(map);
			BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (ok.intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				cargarListas(request);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin049Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	// INI 0025204 - 133101
	public void m_preguntaMensajes_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			logger.debug("++++DENTRO PREGUNTA SINIESTROS 0049");
			this.formattingNumericValues(request);
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal pPCORGJUD = getCampoNumerico(request, "CORGJUD");
			String pPNORGJUD = getCampoTextual(request, "NORGJUD");
			BigDecimal pPNLINJUZ = getCampoNumerico(request, "NLINJUZ");
			String pPTREFJUD = getCampoTextual(request, "TREFJUD");
			BigDecimal pPCSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String pPTNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal pPNNUMVIA = getCampoNumerico(request, "NNUMVIA");
			String pPTCOMPLE = getCampoTextual(request, "TCOMPLE");
			String pPTDIREC = getCampoTextual(request, "TDIREC");
			BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal pPCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal pPCPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String pPCPOSTAL = getCampoTextual(request, "CPOSTAL");

			String pPTASUNTO = getCampoTextual(request, "TASUNTO");
			BigDecimal pPNCLASEDE = getCampoNumerico(request, "NCLASEDE");
			BigDecimal pPNTIPOPRO = getCampoNumerico(request, "NTIPOPRO");
			String pPNPROCEDI = getCampoTextual(request, "NPROCEDI");
			Date pPFNOTIASE = stringToSqlDate(getCampoTextual(request, "FNOTIASE"));
			Date pPFRECPDEM = stringToSqlDate(getCampoTextual(request, "FRECPDEM"));
			Date pPFNOTICIA = stringToSqlDate(getCampoTextual(request, "FNOTICIA"));
			Date pPFCONTASE = stringToSqlDate(getCampoTextual(request, "FCONTASE"));
			Date pPFCONTCIA = stringToSqlDate(getCampoTextual(request, "FCONTCIA"));
			Date pPFAUDPREV = stringToSqlDate(getCampoTextual(request, "FAUDPREV"));
			Date pPFJUICIO = stringToSqlDate(getCampoTextual(request, "FJUICIO"));
			String pPCMONJUZ = getCampoTextual(request, "CMONJUZ");
			BigDecimal pPCPLEITO = getCampoNumerico(request, "CPLEITO");
			BigDecimal pPIPLEITO = getCampoNumerico(request, "IPLEITO");
			BigDecimal pPIALLANA = getCampoNumerico(request, "IALLANA");
			BigDecimal pPISENTENC = getCampoNumerico(request, "ISENTENC");
			BigDecimal pPISENTCAP = getCampoNumerico(request, "ISENTCAP");
			BigDecimal pPISENTIND = getCampoNumerico(request, "ISENTIND");
			BigDecimal pPISENTCOS = getCampoNumerico(request, "ISENTCOS");
			BigDecimal pPISENTINT = getCampoNumerico(request, "ISENTINT");
			BigDecimal pPISENTOTR = getCampoNumerico(request, "ISENTOTR");
			BigDecimal pPCARGUDEF = getCampoNumerico(request, "CARGUDEF");
			BigDecimal pPCRESPLEI = getCampoNumerico(request, "CRESPLEI");
			BigDecimal pPCAPELANT = getCampoNumerico(request, "CAPELANT");
			String pPTHIPOASE = getCampoTextual(request, "THIPOASE");
			String pPTHIPOTER = getCampoTextual(request, "THIPOTER");
			String pPTTIPRESP = getCampoTextual(request, "TTIPRESP");
			BigDecimal pPCOPERCOB = getCampoNumerico(request, "COPERCOB");
			String pPTREASMED = getCampoTextual(request, "TREASMED");
			BigDecimal pPCESTPROC = getCampoNumerico(request, "CESTPROC");
			BigDecimal pPCETAPROC = getCampoNumerico(request, "CETAPROC");
			String pPTCONCJUR = getCampoTextual(request, "TCONCJUR");
			String pPTESTRDEF = getCampoTextual(request, "TESTRDEF");
			String pPTRECOMEN = getCampoTextual(request, "TRECOMEN");
			String pPTOBSERV = getCampoTextual(request, "TOBSERV");
			Date pPFCANCEL = stringToSqlDate(getCampoTextual(request, "FCANCEL"));

			Map m = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_MENSAJES_AXISSIN049(pPNSINIES, pPNTRAMIT,
					pPNLINJUZ, pPCORGJUD, pPNORGJUD, pPTREFJUD, pPCSIGLAS, pPTNOMVIA, pPNNUMVIA, pPTCOMPLE, pPTDIREC,
					pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCPOSTAL, pPTASUNTO, pPNCLASEDE, pPNTIPOPRO, pPNPROCEDI, pPFNOTIASE,
					pPFRECPDEM, pPFNOTICIA, pPFCONTASE, pPFCONTCIA, pPFAUDPREV, pPFJUICIO, pPCMONJUZ, pPCPLEITO,
					pPIPLEITO, pPIALLANA, pPISENTENC, pPISENTCAP, pPISENTIND, pPISENTCOS, pPISENTINT, pPISENTOTR,
					pPCARGUDEF, pPCRESPLEI, pPCAPELANT, pPTHIPOASE, pPTHIPOTER, pPTTIPRESP, pPCOPERCOB, pPTREASMED,
					pPCESTPROC, pPCETAPROC, pPTCONCJUR, pPTESTRDEF, pPTRECOMEN, pPTOBSERV, pPFCANCEL);
			logger.debug("++++vuelta de llamada a funci�n:" + m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// FI INI 0025204 - 133101

}
