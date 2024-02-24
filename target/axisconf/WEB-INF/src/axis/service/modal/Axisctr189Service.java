package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr189Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr189Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr189Action thisAction) {
		log.info("Axisctr189Service m_init");
		try {
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr189Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Limpia la antigua lista de agentes de sesi�n, en caso que hubiera, para poder
	 * realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr189Action thisAction) {
		log.debug("Axisctr189Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("axisctr189_listaGarantias");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			if (isEmpty(NRIESGO)) {
				AbstractDispatchAction.topPila(request, "NRIESGO", this.getCampoNumerico(request, "NRIESGO"));
				NRIESGO = getCampoNumerico(request, "NRIESGO");
			}

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map comisiones = new HashMap();

			comisiones = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEGARANSEGCOM(NRIESGO);
			log.debug("comisiones : " + comisiones);
			ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, comisiones, false);

			formdata.put("lstComisiones", lista); // __formdata.lstComisiones
			// falta saber com passar a listaGarantias291153
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr189Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardarCambios_json(HttpServletRequest request, Axisctr189Action this1) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			HashMap miDataObject = new HashMap();
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");
			BigDecimal CMODCOM = this.getHiddenCampoNumerico(request, "CMODCOM");
			BigDecimal PCOMISI = this.getHiddenCampoNumerico(request, "PCOMISI");
			BigDecimal NINIALT = this.getHiddenCampoNumerico(request, "NINIALT");
			BigDecimal NFINALT = this.getHiddenCampoNumerico(request, "NFINALT");
			java.sql.Date FINIEFE = this.stringToSqlDate(this.getCampoTextual(request, "FINIEFE"));
			Map m = (Map) pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABAGESTIONCOMISIONGAR(NRIESGO, CGARANT,
					FINIEFE, CMODCOM, PCOMISI, NINIALT, NFINALT);
			log.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

			miDataObject.put("resultado", m);
			ajax.rellenarPlAContenedorAjax(m);

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr189Service - m�todo m_form", e);
			this1.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		log.debug("Axisctr189Service m_siguiente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.dbGrabarObjetoDb(request, usuario);
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, whoami(this), null));
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr189Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr189Service.class));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		log.debug("Axisctr189Service m_anterior");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			this.dbGrabarObjetoDb(request, usuario);
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
		} catch (Exception e) {
			log.error("Error en el servicio Axisctr189Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr189Service.class));
	}

	/**
	 * M�todo que se llama la primera vez que entramos en la p�gina
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		log.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

}
