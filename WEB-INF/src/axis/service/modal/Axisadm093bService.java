/*********************************************************************************************************************/
/***********************************************JBENITEZ - APRIL 2015 - BUG 33886/199826******************************/
/*********************************************************************************************************************/
package axis.service.modal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/***********************************************IMPORTING PACKAGES*******************************************/
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisadm093bAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/***********************************************
 * CLASS DEFINITION
 *******************************************/
public class Axisadm093bService extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/***************************************************************************************************************/
	/***********************************************
	 * STARTING FUNCTIONS
	 *******************************************/
	/***************************************************************************************************************/

	/***********************************************
	 * INIT METHOD - JBENITEZ
	 *******************************************/
	public void m_init(HttpServletRequest request, Axisadm093bAction thisAction) {
		try {
			request.getSession().removeAttribute("axisadm093b_searchPeople");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/***********************************************
	 * FORM METHOD - JBENITEZ
	 *******************************************/
	public void m_form(HttpServletRequest request, Axisadm093bAction thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.remove("SPERSON");
			request.getSession().removeAttribute("axisadm093b_searchPeople");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/***********************************************
	 * BUSQUEDA PERSONA METHOD - JBENITEZ
	 *******************************************/
	public void m_busqueda_persona(HttpServletRequest request, Axisadm093bAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String PIDE = getCampoTextual(request, "PIDE");
			String PNAME = getCampoTextual(request, "PNAME");
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisadm093b_searchPeople");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = new HashMap();
				map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DET_PERSONA(PIDE, PNAME, null, null, null, null,
						null, null, null, null, null, null);
				log.debug(map);
				request.getSession().setAttribute("axisadm093b_searchPeople",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
