//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.cache;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_CFG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class AxisCodeWizard {
	static Log logger = LogFactory.getLog(AxisCodeWizard.class);
	public static String doPrefix = "axis_";
	public static String doPostfix = ".do";

	public static ActionForward inicioFlujo(HttpServletRequest request) throws Exception {
		ActionForward retVal = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

		String CFORM = (String) AbstractDispatchAction.topPila(request, "CFORM");
		String CCAMPO = (String) AbstractDispatchAction.topPila(request, "CCAMPO");

		PAC_IAX_CFG pAC_IAX_CFG = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		logger.debug("axiscode formdata:" + formdata);
		if (CMODO.trim() != null) {
			if (CMODO.equals("ALTA_POLIZA")) {
				CFORM = null;
				CCAMPO = null;
			} else {
				if (CMODO.equals("ALTA_COLECTIVO")) {
					CFORM = null;
					CCAMPO = null;
				} else {

					CFORM = "AXISCTR018";
					CCAMPO = "BT_EDITAR";
				}
			}
		}

		HashMap m1 = pAC_IAX_CFG.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, CFORM, CCAMPO,
				Constantes.SIGUIENTE);
		String RETURN = (String) m1.get("RETURN");
		if (RETURN != null) {
			String formRumbo = doPrefix + ((String) m1.get("RETURN")).toLowerCase() + doPostfix + "?operation=init";
			formRumbo = "/" + formRumbo;

			retVal = new ActionForward(formRumbo);
			return retVal;
		} else {
			// Mostrar mensajes de error PL/SQL
			AbstractDispatchAction.parsearMensajes(request, (List) m1.get("MENSAJES"));
			return null;
		}
	}

	public static ActionForward findForward(HttpServletRequest request, BigDecimal CTIPNVG, String CFORM, String CCAMPO)
			throws Exception {
		ActionForward retVal = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

		PAC_IAX_CFG pAC_IAX_CFG = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// migrar - elmar
		String miCFORM = CFORM.toUpperCase();

		HashMap m1 = pAC_IAX_CFG.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD(CMODO, SPRODUC, miCFORM, CCAMPO, CTIPNVG);
		String RETURN = (String) m1.get("RETURN");

		if (RETURN != null) {

			String formRumbo = "";

			File fichero = new File(
					Constantes.REALPATH + "/WEB-INF/jsp/axis/" + ((String) m1.get("RETURN")).toLowerCase() + ".jsp");// ecg20110914
																														// AXIS-WLS1SERVER
																														// .
																														// new
																														// File's
																														// con
																														// lowercases

			if (!fichero.exists()) {
				fichero = new File(Constantes.REALPATH + "/WEB-INF/jsp/modal/"
						+ ((String) m1.get("RETURN")).toLowerCase() + ".jsp");// ecg20110914 AXIS-WLS1SERVER . new
																				// File's con lowercases
				if (fichero.exists())
					formRumbo = "modal_" + ((String) m1.get("RETURN")).toLowerCase() + doPostfix + "?operation=form";

			} else
				formRumbo = "axis_" + ((String) m1.get("RETURN")).toLowerCase() + doPostfix + "?operation=form";

			formRumbo = "/" + formRumbo;
			retVal = new ActionForward(formRumbo);
			return retVal;

			// String formRumbo=doPrefix+
			// ((String)m1.get("RETURN")).toLowerCase()+doPostfix+"?operation=form";

		} else {
			// Mostrar mensajes de error PL/SQL
			AbstractDispatchAction.parsearMensajes(request, (List) m1.get("MENSAJES"));
			return null;
		}
	}

	/**
	 * Monta un ActionForward para irse desde el menu a la primera pantalla de lo
	 * que sea
	 * 
	 * @param CFORM
	 * @return
	 * @throws Exception
	 */
	public static ActionForward primeraPantallaDesdeMenu(String CFORM) throws Exception {
		if (CFORM != null) {
			ActionForward retVal = null;
			String formRumbo = doPrefix + CFORM.toLowerCase() + doPostfix + "?operation=init";
			formRumbo = "/" + formRumbo;

			retVal = new ActionForward(formRumbo);
			return retVal;
		} else
			return null;
	}

}
