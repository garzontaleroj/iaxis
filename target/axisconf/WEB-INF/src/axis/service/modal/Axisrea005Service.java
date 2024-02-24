//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Desplegables
		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug("**************************************************************** " + formdata);

			cargarValoresDesplegables(request, usuario, formdata);
			/*
			 * BigDecimal SPERSON = getCampoNumerico(request, "SPERSON"); BigDecimal CAGENTE
			 * = getCampoNumerico(request, "CAGENTE"); BigDecimal NANOmarcat =
			 * getCampoNumerico(request, "NANOmarcat");
			 */

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea005Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_axis_listValores_rea = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
			List listaCompReaseg = (List) tratarRETURNyMENSAJES(request, mapa2, false);
			formdata.put("listaCompReaseg", listaCompReaseg);
			listaCompReaseg = null;

			Map mapa5 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMIS_REA();
			List listaComisRea = (List) tratarRETURNyMENSAJES(request, mapa5, false);
			formdata.put("LST_COMISREA", listaComisRea);
			// request.setAttribute("LST_COMISREA",listaComisRea);

			Map mapa6 = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCOMISION();
			List ListaTipComisi = (List) tratarRETURNyMENSAJES(request, mapa6, false);
			formdata.put("ListaTipComisi", ListaTipComisi);

			Map mapa7 = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("4"));
			List ListaTramComisi = (List) tratarRETURNyMENSAJES(request, mapa7, false);
			formdata.put("ListaTramComisi", ListaTramComisi);

			Map mapa8 = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BROKER();
			List ListaBroker = (List) tratarRETURNyMENSAJES(request, mapa8, false);
			formdata.put("ListaBroker", ListaBroker);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea005Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos TRAMOS a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea005Service m_grabar_tramos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMO");
			BigDecimal CCOMREA = getCampoNumerico(request, "CCOMREA");
			BigDecimal PCESION = getCampoNumerico(request, "PCESION");
			BigDecimal ISCONTA = getCampoNumerico(request, "ISCONTA");
			BigDecimal PRESERV = getCampoNumerico(request, "PRESERV");
			BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");
			BigDecimal CRESREF = getCampoNumerico(request, "CRESREF");
			BigDecimal IRESERV = getCampoNumerico(request, "IRESERV");
			BigDecimal ICOMFIJ = getCampoNumerico(request, "ICOMFIJ");

			BigDecimal NVERSION = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");

			/* Nuevos campos */

			BigDecimal CTIPCOMIS = getCampoNumerico(request, "CTIPCOMIS");
			BigDecimal PCTCOMIS = getCampoNumerico(request, "PCTCOMIS");
			BigDecimal CTRAMOCOMISION = getCampoNumerico(request, "CTRAMOCOMISION");
			BigDecimal PINTRES = getCampoNumerico(request, "PINTRES");
			BigDecimal PCTGASTOSREA = getCampoNumerico(request, "PCTGASTOSREA"); // CONF-587
			BigDecimal INTRES = getCampoNumerico(request, "INTRES");
			BigDecimal CFORPAGRES = getCampoNumerico(request, "CFORPAGRES");
			// BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");

			/* Nuevos campos */

			if (isEmpty(formdata.get("CCOMPANI"))) {
				logger.debug("entro if CCOMPANI");
				CCOMPANI = getCampoNumerico(request, "CCOMPANI_MOD");
			}

			// quitamos los guiones en todos los casos
			// --START-PAC_IAX_REA.F_SET_OBJETOCUADROREA(PCCOMPANI, PNVERSIO, PSCONTRA,
			// PCTRAMO, PCCOMREA, PPCESION, PNPLENOS, PICESFIJ, PICOMFIJ, PISCONTA,
			// PPRESERV, PPINTRES, PILIACDE, PPPAGOSL, PCCORRED, PCINTREF, PCRESREF,
			// PCINTRES, PIRESERV, PPTASAJ, PFULTLIQ, PIAGREGA, PIMAXAGR)
			/*
			 * Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOCUADROREA
			 * (CCOMPANI,NVERSION ,SCONTRA,CTRAMO, CCOMREA, PCESION, null, null, ICOMFIJ,
			 * ISCONTA, PRESERV, null, null,null,CCORRED,null,CRESREF, null, IRESERV, null,
			 * null, null, null);
			 */

			/*
			 * Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOCUADROREA (
			 * pPCCOMPANI, pPNVERSIO, pPSCONTRA, pPCTRAMO, pPCCOMREA, pPPCESION, pPNPLENOS,
			 * pPICESFIJ, pPICOMFIJ, pPISCONTA, pPPRESERV, pPPINTRES, pPILIACDE, pPPPAGOSL,
			 * pPCCORRED, pPCINTREF,pPCRESREF, pPCINTRES, pPIRESERV, pPPTASAJ, pPFULTLIQ,
			 * pPIAGREGA, pPIMAXAGR, pPCTIPCOMIS, pPPCTCOMIS, pPCTRAMOCOMISION)
			 */

			// Map map =
			// pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_OBJETOCUADROREA(CCOMPANI,NVERSION,SCONTRA,CTRAMO,CCOMREA,PCESION,null,null,ICOMFIJ,ISCONTA,PRESERV,PINTRES,null,null,CCORRED,null,CRESREF,INTRES,IRESERV,null,null,null,null,CTIPCOMIS,PCTCOMIS,CTRAMOCOMISION);
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_CUADROCES(CCOMPANI, NVERSION, SCONTRA, CTRAMO, CCOMREA,
					PCESION, null, null, ICOMFIJ, ISCONTA, PRESERV, PINTRES, null, null, CCORRED, null, CRESREF, INTRES,
					IRESERV, null, null, null, null, CTIPCOMIS, PCTCOMIS, CTRAMOCOMISION, PCTGASTOSREA);

			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				logger.debug(map);
				request.setAttribute("grabarOK", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea005Service.m_grabar_tramos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
