//Revision:# Ps/NRD1MARB8bbG+BSinKg== #
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
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PROVISIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro055Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro055Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispro055Action thisAction) {
		logger.debug("Axispro055Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// INI - IAXIS - 3951 - ML - 07/05/2019 - CMODO se perdia en el paso de request
		if (!isEmpty(getCampoTextual(request, "CMODO"))) {
			AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
			formdata.put("CMODOS", getCampoTextual(request, "CMODO"));
		}
		// INI - IAXIS - 3951 - ML - 07/05/2019 - CMODO se perdia en el paso de request

		try {

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			m_buscar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axispro055Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que almacena la exlusion de provision de cartera
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axispro055Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro055Service m_aceptar");

		try {

			PAC_IAX_PROVISIONES pac_iax_provisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
				String COBSERVEXC = getCampoTextual(request, "COBSERVEXC");
				BigDecimal CPROVISI = getCampoNumerico(request, "CPROVISI");
				String COBSERVP = getCampoTextual(request, "COBSERVP");
				BigDecimal CNPROVISI = getCampoNumerico(request, "CNPROVISI");
				String COBSERVNP = getCampoTextual(request, "COBSERVNP");
				Date FALTA = stringToSqlDate(getCampoTextual(request, "FALTA"));
				Date FBAJA = stringToSqlDate(getCampoTextual(request, "FBAJA"));

				if (NPOLIZA != null && NRECIBO != null) {
					PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapB = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(NPOLIZA, NRECIBO);
					List<Map> lstExclusiones = (List<Map>) tratarRETURNyMENSAJES(request, mapB);
					logger.debug(mapB);
					if (!isEmpty(mapB) && lstExclusiones != null && lstExclusiones.size() > 0) {
						Map map = pac_iax_provisiones.ejecutaPAC_IAX_PROVISIONES__F_GRABAR_EXCLUSIONES(NPOLIZA, NRECIBO,
								COBSERVEXC, CPROVISI, COBSERVP, CNPROVISI, COBSERVNP, FALTA, FBAJA);
						logger.debug(map);
						request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
						thisAction.guardarMensaje(request, "9908875", new Object[] { mapB.get("MENSAJES") },
								Constantes.MENSAJE_INFO);
					} else {

						Map mapV = pac_iax_provisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_EXISTEPOLIZARECIBO(NPOLIZA,
								NRECIBO);
						List<Map> existe = (List<Map>) tratarRETURNyMENSAJES(request, mapV);
						logger.debug(mapV);
						BigDecimal auxExiste = new BigDecimal("0");
						if (existe != null && !existe.isEmpty()) {
							for (Map iExiste : existe) {
								auxExiste = (BigDecimal) iExiste.get("EXISTE");
							}
						}

						if (!auxExiste.equals(new BigDecimal("0"))) {
							Map map = pac_iax_provisiones.ejecutaPAC_IAX_PROVISIONES__F_GRABAR_EXCLUSIONES(NPOLIZA,
									NRECIBO, COBSERVEXC, CPROVISI, COBSERVP, CNPROVISI, COBSERVNP, FALTA, FBAJA);
							logger.debug(map);
							request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
							thisAction.guardarMensaje(request, "9908875", new Object[] { mapV.get("MENSAJES") },
									Constantes.MENSAJE_INFO);
							map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(NPOLIZA, NRECIBO);
							lstExclusiones = (List<Map>) tratarRETURNyMENSAJES(request, map);
							logger.debug(map);
							if (!isEmpty(map) && lstExclusiones != null) {
								for (Map iLstExclusiones : lstExclusiones) {
									if (NPOLIZA.equals(iLstExclusiones.get("NPOLIZA"))) {
										formdata.putAll(iLstExclusiones);
									}
								}
							}
						} else {
							thisAction.guardarMensaje(request, "9910948", new Object[] { mapV.get("MENSAJES") },
									Constantes.MENSAJE_ERROR);
							formdata.put("NPOLIZA", "");
							formdata.put("NRECIBO", "");
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro055Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista de valores
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001174));
			logger.debug(map);
			listValores.put("lstSeProvisiona", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001175));
			logger.debug(map);
			listValores.put("lstNoSeProvisiona", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axispro055Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axispro055Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro055Service m_buscar");

		try {

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CAGENTE = usuario.getCagente();
			formdata.put("CAGENTE", CAGENTE);

			if (NPOLIZA != null && NRECIBO != null) {
				PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_EXCLUSIONESBYPK(NPOLIZA, NRECIBO);
				List<Map> lstExclusiones = (List<Map>) tratarRETURNyMENSAJES(request, map);
				logger.debug(map);
				if (!isEmpty(map) && lstExclusiones != null) {
					for (Map iLstExclusiones : lstExclusiones) {
						if (NPOLIZA.equals(iLstExclusiones.get("NPOLIZA"))) {
							formdata.putAll(iLstExclusiones);
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que almacena la exlusion de provision de cartera
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_existePolizaRecibo(HttpServletRequest request, Axispro055Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro055Service m_aceptar");

		try {

			PAC_IAX_PROVISIONES pac_iax_provisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal NPOLIZA = new BigDecimal(String.valueOf(request.getParameter("NPOLIZA")));
				BigDecimal NRECIBO = new BigDecimal(String.valueOf(request.getParameter("NRECIBO")));

				Map map = pac_iax_provisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_EXISTEPOLIZARECIBO(NPOLIZA, NRECIBO);

				logger.debug(map);

				request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro055Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
