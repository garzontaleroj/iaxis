package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CARGA_SPL;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisadm091Action;
import axis.mvc.control.modal.Axisctr014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm091Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm091Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
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
	public void m_form(HttpServletRequest request, Axisadm091Action thisAction) {
		logger.debug("Axisadm091Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_CARGA_SPL pac_axis_carga_spl = new PAC_IAX_CARGA_SPL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMODO = this.getCampoTextual(request, "MODO");
			this.cargarcombos(request);

			if (CMODO.equals("MOD")) {

				String PRONAME = this.getCampoTextual(request, "PRONAME");
				BigDecimal NORDEN = this.getCampoNumerico(request, "PNORDEN");
				String CCAMPO = this.getCampoTextual(request, "PCCAMPO");
				String CTIPCAM = this.getCampoTextual(request, "PCTIPCAM");
				Map map = pac_axis_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_GET_INT_CAMPO_SPL(PRONAME, NORDEN, CCAMPO,
						CTIPCAM);
				tratarRETURNyMENSAJES(request, map);
				formdata.putAll((Map) map.get("OBCCAMPO"));
			}

			System.out.println("FORMADA " + formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm091Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request
	 * @param thisAction
	 */
	public void m_guardar(HttpServletRequest request, Axisadm091Action thisAction) {
		logger.debug("Axisadm091Service guardar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();

		try {

			PAC_IAX_CARGA_SPL pac_iax_carga_spl = new PAC_IAX_CARGA_SPL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pPCDARCHI = this.getCampoTextual(request, "PRONAME");
			BigDecimal NORDEN = this.getCampoNumerico(request, "PNORDEN");
			String CCAMPO = this.getCampoTextual(request, "PCCAMPO");
			String CTIPCAM = this.getCampoTextual(request, "PCTIPCAM");
			BigDecimal pPNORDEN = this.getCampoNumerico(request, "ORDER");
			BigDecimal pPNPOSICI = this.getCampoNumerico(request, "INICIAL");
			BigDecimal pPNLONGITUD = this.getCampoNumerico(request, "LONGITUD");
			String pPCCAMPO = this.getCampoTextual(request, "CAMPO");
			String pPCTIPCAM = this.getCampoTextual(request, "FIELD");
			BigDecimal pPNTIPO = this.getCampoNumerico(request, "TYPE");
			BigDecimal pDECIMAL = this.getCampoNumerico(request, "DECIMAL");
			String pMASK = this.getCampoTextual(request, "MASK");
			String MODO = this.getCampoTextual(request, "MODO");

			String CEDITVAL = isEmpty(this.getCampoTextual(request, "CEDIT")) ? "0"
					: this.getCampoTextual(request, "CEDIT");
			BigDecimal CEDIT = new BigDecimal(CEDITVAL);

			map = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_SET_CAMPO_SPL(pPCDARCHI, NORDEN, CCAMPO, CTIPCAM,
					pPNORDEN, pPCCAMPO, pPCTIPCAM, pPNPOSICI, pPNLONGITUD, pPNTIPO, pDECIMAL, pMASK, MODO, CEDIT);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");

				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));

			} else {
				formdata.put("guardat", "1");
				this.cargarcombos(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm091Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	private void cargarcombos(HttpServletRequest request) {
		logger.debug("Axisadm091Service cargarcombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map listValores = new HashMap();

			PAC_IAX_LISTVALORES pac_iax_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(733));
			Map map1 = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001012));
			Map map2 = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001016));
			Map map3 = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(9));

			logger.debug(map);
			listValores.put("CURRENCY", tratarRETURNyMENSAJES(request, map));
			listValores.put("FIELD_TYPE", tratarRETURNyMENSAJES(request, map1));
			listValores.put("TYPE", tratarRETURNyMENSAJES(request, map2));
			listValores.put("DECIMAL", tratarRETURNyMENSAJES(request, map3));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093Service - m�todo cargarcombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * Dado un NOMBRE y/o un NNUMIDE de un Agente, ejecuta la consulta de b�squeda
	 * de Agentes en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisctr014_listaAgentes.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_agente(HttpServletRequest request, Axisctr014Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar persona a buscar
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			// String CAGENTE = getCampoTextual(request, "CAGENTE");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CONDICION = getCampoTextual(request, "CONDICION");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr014_listaAgentes");
				// HashMap map = new
				// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NNUMIDE,
				// NOMBRE,CAGENTE,new BigDecimal(1) );
				HashMap map = null;
				if (PARTNER != null)
					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE,
									new BigDecimal(1), CONDICION, TIPAGENTE, PARTNER);
				else
					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE,
									new BigDecimal(1), CONDICION, TIPAGENTE);

				logger.debug(map);
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("axisctr014_listaAgentes", listaAgentes);
			}
			// recargar combo
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */

			/* LSTTIPOAGENTE */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);
		} catch (Exception e) {
			logger.debug("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
