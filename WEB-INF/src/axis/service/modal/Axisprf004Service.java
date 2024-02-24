package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.modal.Axisprf004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisprf004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisprf004Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisprf004Action thisAction) {
		logger.debug("Axisprf004Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		// Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de persona
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
			logger.debug(map);
			formdata.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

			// Tipo de documento
			BigDecimal CTIPPER = getCampoNumerico(request, "TIDENTIcerca");
			if (isEmpty(CTIPPER))
				CTIPPER = getCampoNumerico(request, "CTIPPER");
			if (isEmpty(CTIPPER))
				CTIPPER = new BigDecimal(1);
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
			logger.debug(map);
			formdata.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

			String MODO = this.getCampoTextual(request, "MODO");

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
					BigDecimal pCTIPIDE = this.getCampoNumerico(request, "CTIPIDE");
					BigDecimal pNORDCTO = this.getCampoNumerico(request, "NORDCTO");
					String pCNUMIDE = this.getCampoTextual(request, "CNUMIDE");
					String pTNOMBRE = this.getCampoTextual(request, "TNOMBRE");
					String pTMOVIL = this.getCampoTextual(request, "TMOVIL");
					String pTEMAIL = this.getCampoTextual(request, "TEMAIL");
					String pTCARGO = this.getCampoTextual(request, "TCARGO");
					String pTDIREC = this.getCampoTextual(request, "TDIREC");

					logger.debug("++++pCodiProf" + psprofes);
					logger.debug("++++CTIPIDE" + pCTIPIDE);
					logger.debug("++++CNUMIDE" + pCNUMIDE);
					logger.debug("++++NORDCTO" + pNORDCTO);
					logger.debug("++++TNOMBRE" + pTNOMBRE);
					logger.debug("++++TMOVIL" + pTMOVIL);
					logger.debug("++++TEMAIL" + pTEMAIL);
					logger.debug("++++TCARGO" + pTCARGO);
					logger.debug("++++TDIREC" + pTDIREC);
					logger.debug("++++CTIPPER" + CTIPPER);

					formdata.put("pCodiProf", psprofes);
					formdata.put("CTIPIDE", pCTIPIDE);
					formdata.put("CNUMIDE", pCNUMIDE);
					formdata.put("NORDCTO", pNORDCTO);
					formdata.put("TNOMBRE", pTNOMBRE);
					formdata.put("TMOVIL", pTMOVIL);
					formdata.put("TEMAIL", pTEMAIL);
					formdata.put("TCARGO", pTCARGO);
					formdata.put("TDIREC", pTDIREC);
					formdata.put("CTIPPER", CTIPPER);

					formdata.put("MODO", MODO);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axisprf004Action thisAction) {
		logger.debug("Axisprf004Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal psprofes = this.getCampoNumerico(request, "pCodiProf");
			BigDecimal pCTIPIDE = this.getCampoNumerico(request, "CTIPIDE");
			BigDecimal pNORDCTO = this.getCampoNumerico(request, "NORDCTO");
			String pCNUMIDE = this.getCampoTextual(request, "CNUMIDE");
			String pTNOMBRE = this.getCampoTextual(request, "TNOMBRE");
			String pTMOVIL = this.getCampoTextual(request, "TMOVIL");
			String pTEMAIL = this.getCampoTextual(request, "TEMAIL");
			String pTCARGO = this.getCampoTextual(request, "TCARGO");
			String pTDIREC = this.getCampoTextual(request, "TDIREC");
			String MODO = this.getCampoTextual(request, "MODO");

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap map = new HashMap();

			if (MODO != null && MODO.equals("modificar")) {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_MOD_CONTACTO_PER(psprofes, pNORDCTO, pCTIPIDE, pCNUMIDE,
						pTNOMBRE, pTMOVIL, pTEMAIL, pTCARGO, pTDIREC);
			} else {
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_CONTACTO_PER(psprofes, pCTIPIDE, pCNUMIDE, pTNOMBRE,
						pTMOVIL, pTEMAIL, pTCARGO, pTDIREC);
			}
			logger.debug("++++" + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");

				PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Tipo de documento
				BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(CTIPPER);
				logger.debug(map);
				formdata.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
				logger.debug(map);
				formdata.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));
			}

			logger.debug("$$$$$$$$$$$$ fin pac_iax_prof: " + map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
