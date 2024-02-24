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
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.modal.Axissin042Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin042Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin042Action thisAction) {
		logger.debug("Axissin042Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperem els valors del combo PAC_IAX_SIN_TRAMITE.f_get_codtramite
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal pPNTRAMTE = getCampoNumerico(request, "NTRAMTE");
			// Datos display
			Map map = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_CODTRAMITE(pPSPRODUC, pPCACTIVI);
			logger.debug(map);
			List tramits = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("tramits_axissin042", tramits);
			Map mapObj = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(pPNTRAMTE);
			logger.debug("ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE devuelve: " + mapObj);
			logger.debug(mapObj);
			Object obj = tratarRETURNyMENSAJES(request, mapObj);
			formdata.put("obj_tramite_axissin042", obj);
			if (obj.getClass().equals(HashMap.class)) {
				if (((HashMap) obj).get("CTRAMTE") != null) {
					formdata.put("CTRAMTE", ((HashMap) obj).get("CTRAMTE"));
				}
			}
			formdata.put("NTRAMTE", pPNTRAMTE);
			formdata.put("OB_SIN_TRAMITE", obj);
			cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin042Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void maaa(String... a) {
	}

	public void m_recargar(HttpServletRequest request, Axissin042Action thisAction) {
		logger.debug("Axissin042Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recuperem els valors del combo PAC_IAX_SIN_TRAMITE.f_get_codtramite
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPCACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal pPNTRAMTE = getCampoNumerico(request, "NTRAMTE");

			// Datos display
			Map map = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_CODTRAMITE(pPSPRODUC, pPCACTIVI);
			logger.debug(map);
			List tramits = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("tramits_axissin042", tramits);
			Map mapObj = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE(pPNTRAMTE);
			logger.debug("ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_TRAMITE devuelve: " + mapObj);
			logger.debug(mapObj);
			Object obj = tratarRETURNyMENSAJES(request, mapObj);
			formdata.put("obj_tramite_axissin042", obj);

			if (pPNTRAMTE == null) {
				((HashMap) obj).put("CTRAMTE", getCampoNumerico(request, "CTRAMTE"));
			}

			if (obj.getClass().equals(HashMap.class)) {
				if (((HashMap) obj).get("CTRAMTE") != null) {
					formdata.put("CTRAMTE", ((HashMap) obj).get("CTRAMTE"));
					if ((((HashMap) obj).get("CTRAMTE")).equals(new BigDecimal(3))) {
						HashMap recobro = (HashMap) ((HashMap) obj).get("RECOBRO");
						recobro.put("FPRESCRIP", this.stringToSqlDate(getCampoTextual(request, "FPRESCRIP")));
						recobro.put("IRECLAMT", getCampoNumerico(request, "IRECLAMT"));
						recobro.put("IRECOBT", getCampoNumerico(request, "IRECOBT"));
						recobro.put("ICONCURR", getCampoNumerico(request, "ICONCURR"));
						recobro.put("IRCIVIL", getCampoNumerico(request, "IRCIVIL"));
						recobro.put("IASSEGUR", getCampoNumerico(request, "IASSEGUR"));
						recobro.put("CRESRECOB", getCampoNumerico(request, "CRESRECOB"));
						formdata.put("CRESRECOB", getCampoNumerico(request, "CRESRECOB"));
						recobro.put("CDESTIM", getCampoNumerico(request, "CDESTIM"));
						recobro.put("NREFGES", getCampoNumerico(request, "NREFGES"));
						recobro.put("CTIPREC", getCampoNumerico(request, "CTIPREC"));
						((HashMap) obj).put("RECOBRO", recobro);
					} else if ((((HashMap) obj).get("CTRAMTE")).equals(new BigDecimal(2))) {
						HashMap lesiones = (HashMap) ((HashMap) obj).get("LESIONES");
						lesiones.put("NLESIONES", getCampoNumerico(request, "NLESIONES"));
						lesiones.put("NMUERTOS", getCampoNumerico(request, "NMUERTOS"));
						lesiones.put("AGRAVANTES", getCampoTextual(request, "ICONCURR"));
						lesiones.put("CGRADORESP", getCampoNumerico(request, "CGRADORESP"));
						lesiones.put("CTIPLESIONES", getCampoNumerico(request, "CTIPLESIONES"));
						lesiones.put("CTIPHOS", getCampoNumerico(request, "CTIPHOS"));
						((HashMap) obj).put("LESIONES", lesiones);
					} else if ((((HashMap) obj).get("CTRAMTE")).equals(new BigDecimal(5))) {
						// Bug 0022099
						HashMap asistencia = (HashMap) ((HashMap) obj).get("ASISTENCIA");
						asistencia.put("TREFEXT", getCampoTextual(request, "TREFEXT"));
						asistencia.put("CCIAASIS", getCampoNumerico(request, "CCIAASIS"));
						((HashMap) obj).put("ASISTENCIA", asistencia);
					}

				}
			}
			formdata.put("NTRAMTE", pPNTRAMTE);

			formdata.put("OB_SIN_TRAMITE", obj);
			logger.debug("OB_SIN_TRAMITE: " + obj);
			cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin042Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin042Action thisAction) {
		logger.debug("Axissin042Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String pPNSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal pPNTRAMTE = getCampoNumerico(request, "NTRAMTE");
			BigDecimal pPCTRAMTE = getCampoNumerico(request, "CTRAMTE");

			Date pPFPRESCRIP = this.stringToSqlDate(getCampoTextual(request, "FPRESCRIP"));
			BigDecimal pPIRECLAMT = getCampoNumerico(request, "IRECLAMT");
			BigDecimal pPIRECOBT = getCampoNumerico(request, "IRECOBT");
			BigDecimal pPICONCURR = getCampoNumerico(request, "ICONCURR");
			BigDecimal pPIRCIVIL = getCampoNumerico(request, "IRCIVIL");
			BigDecimal pPIASSEGUR = getCampoNumerico(request, "IASSEGUR");
			BigDecimal pPCRESRECOB = getCampoNumerico(request, "CRESRECOB");
			BigDecimal pPCDESTIM = getCampoNumerico(request, "CDESTIM");
			BigDecimal pPNREFGES = getCampoNumerico(request, "NREFGES");
			BigDecimal pPCTIPREC = getCampoNumerico(request, "CTIPREC");

			BigDecimal pPNLESIONES = getCampoNumerico(request, "NLESIONES");
			BigDecimal pPNMUERTOS = getCampoNumerico(request, "NMUERTOS");
			String pPAGRAVANTES = getCampoTextual(request, "AGRAVANTES");
			BigDecimal pPCGRADORESP = getCampoNumerico(request, "CGRADORESP");
			BigDecimal pPCTIPLESIONES = getCampoNumerico(request, "CTIPLESIONES");
			BigDecimal pPCTIPHOS = getCampoNumerico(request, "CTIPHOS");

			// Bug 0022099
			String pTREFEXT = getCampoTextual(request, "TREFEXT");
			BigDecimal pCCIAASIS = getCampoNumerico(request, "CCIAASIS");

			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE(pPNSINIES, pPNTRAMTE,
					pPCTRAMTE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("NTRAMTE", map.get("NTRAMTE"));
			if (map.get("NTRAMTE") != null) {
				pPNTRAMTE = (BigDecimal) map.get("NTRAMTE");
			}
			formdata.put("guardat", "1");
			formdata.put("NTRAMTE", pPNTRAMTE); // Bug 0022099
			// Si es del tipus recobro guardem a la taula recobros
			if (pPCTRAMTE.intValue() == 3) {
				Map map3 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_RECOBRO(pPNSINIES,
						pPNTRAMTE, pPFPRESCRIP, pPIRECLAMT, pPIRECOBT, pPICONCURR, pPIRCIVIL, pPIASSEGUR, pPCRESRECOB,
						pPCDESTIM, pPNREFGES, pPCTIPREC);
				tratarRETURNyMENSAJES(request, map3);
				logger.debug("ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_RECOBRO: " + map3);
			} else if (pPCTRAMTE.intValue() == 2) {
				Map map3 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_LESIONES(pPNSINIES,
						pPNTRAMTE, pPNLESIONES, pPNMUERTOS, pPAGRAVANTES, pPCGRADORESP, pPCTIPLESIONES, pPCTIPHOS);
				tratarRETURNyMENSAJES(request, map3);
				logger.debug("ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_LESIONES: " + map3);
			} else if (pPCTRAMTE.intValue() == 5) {
				// Bug 0022099
				Map map3 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_SINTRAMITE_ASIST(pPNSINIES,
						pPNTRAMTE, pTREFEXT, pCCIAASIS);
				tratarRETURNyMENSAJES(request, map3);
				logger.debug("ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_IAX_SIN_ASIST: " + map3);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin042Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap listValores = new HashMap();
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1039));
		listValores.put("lsCRESRECOB", (List) tratarRETURNyMENSAJES(request, map));
		Map map2 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1040));
		listValores.put("lsCDESTIM", (List) tratarRETURNyMENSAJES(request, map2));
		Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1041));
		listValores.put("lsCTIPREC", (List) tratarRETURNyMENSAJES(request, map3));

		Map map4 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1042));
		listValores.put("lsCGRADORESP", (List) tratarRETURNyMENSAJES(request, map4));
		Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1043));
		listValores.put("lsCTIPLESIONES", (List) tratarRETURNyMENSAJES(request, map5));
		Map map6 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1044));
		listValores.put("lsCTIPHOS", (List) tratarRETURNyMENSAJES(request, map6));
		// Bug 0022099
		Map map7 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1081));
		listValores.put("lsCCIAASIS", (List) tratarRETURNyMENSAJES(request, map7));

		request.setAttribute("listValores", listValores);
	}
}
