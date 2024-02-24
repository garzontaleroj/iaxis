package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr058Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr058Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr058Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr058Action thisAction) {
		logger.debug("Axisctr058Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr058Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr058Action thisAction) {
		logger.debug("Axisctr058Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			String cmarca = getCampoTextual(request, "XCMARCA");
			String cmodelo = getCampoTextual(request, "XCMODELO");
			String npuertas = getCampoTextual(request, "NPUERTAS");
			String ccombustible = getCampoTextual(request, "CCOMBUSTIBLE");
			String ctipveh = getCampoTextual(request, "xCTIPVEH");
			String cclaveh = getCampoTextual(request, "xCCLAVEH");
			String cversion = getCampoTextual(request, "xCVERSION");
			BigDecimal ctramit = null;
			if (request.getParameter("CTRAMIT") != null) {
				ctramit = new BigDecimal(request.getParameter("CTRAMIT"));
			}

			logger.debug("cmarca:" + cmarca + " cmodelo:" + cmodelo + " npuertas:" + npuertas + " ccombustible:"
					+ ccombustible);

			// Lista versiones
			Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTVERSIONES(cmarca, cmodelo, npuertas, ccombustible,
							ctipveh, cclaveh, cversion, ctramit);
			logger.debug(map);
			request.getSession().setAttribute("axisctr058_listaVersiones",
					(ArrayList) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr058Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la version en la BBDD
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 **/
	public void m_guardarVersion(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr065Service m_guardarVersion");
		try {
			// Guardamos en session los par�metros seleccionados / introducidos en la
			// pantalla
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Datos version
			String PCMARCA = getCampoTextual(request, "XCMARCA");
			logger.debug("CMARCA :: " + PCMARCA);
			String PCMODELO = getCampoTextual(request, "XCMODELO");
			logger.debug("CMODELO :: " + PCMODELO);
			String PCVERSION = getCampoTextual(request, "CVERSION");
			logger.debug("CVERSION :: " + PCVERSION);
			String PTVERSION = getCampoTextual(request, "TVERSION");
			logger.debug("TVERSION :: " + PTVERSION);
			String PCTIPVEH = getCampoTextual(request, "TTIPVEH");
			logger.debug("CTIPVEH :: " + PCTIPVEH);
			String PCCLAVEH = getCampoTextual(request, "TTCLAVEH");
			logger.debug("CCLAVEH :: " + PCCLAVEH);
			BigDecimal PNPUERTA = getCampoNumerico(request, "NPUERTA");
			logger.debug("NPUERTAS :: " + PNPUERTA);
			java.sql.Date PFLANZAM = null;
			PFLANZAM = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FLANZAM"));
			BigDecimal PNTARA = getCampoNumerico(request, "NTARA");
			logger.debug("TARA :: " + PNTARA);
			BigDecimal PNPMA = getCampoNumerico(request, "NPMA");
			logger.debug("PMA :: " + PNPMA);
			String PCMOTOR = getCampoTextual(request, "CMOTOR");
			logger.debug("CMOTOR :: " + PCMOTOR);
			BigDecimal PNCILIND = getCampoNumerico(request, "NCILIND");
			logger.debug("NCILIND :: " + PNCILIND);
			BigDecimal PNPOTECV = getCampoNumerico(request, "NPOTECV");
			logger.debug("NPOTECV :: " + PNPOTECV);
			BigDecimal PNPOTEKW = getCampoNumerico(request, "NPOTEKW");
			logger.debug("NPOTEKW :: " + PNPOTEKW);
			BigDecimal PNPLAZAS = getCampoNumerico(request, "NPLAZAS");
			logger.debug("NPLAZAS :: " + PNPLAZAS);

			BigDecimal PCVEHB7 = new BigDecimal(0);

			/* Grabar Datos AUTOS */
			Map grabarDatosVersion = new PAC_IAX_PRODUCCION_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_SET_VERSION(PCMARCA, PCMODELO, PCTIPVEH, PCCLAVEH, PCVERSION,
							PTVERSION, PNPUERTA, PFLANZAM, PNTARA, PNPMA, PCMOTOR, PNCILIND, PNPOTECV, PNPOTEKW,
							PNPLAZAS, PCVEHB7);

			logger.debug(grabarDatosVersion);
			String vcversion = (String) grabarDatosVersion.get("PCVERSION_OUT");
			logger.debug("-------- version nueva:" + vcversion);

			tratarRETURNyMENSAJES(request, grabarDatosVersion);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_guardarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
