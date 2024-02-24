package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr505Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr505Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr505Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
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
	public void m_form(HttpServletRequest request, Axisctr505Action thisAction) {
		log.debug("Axisctr505Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// Recuperamos el riesgo
			// BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			formdata.put("CMODO", CMODO);
			request.setAttribute("NRIESGO_BENEIDENT", AbstractDispatchAction.topPila(request, "NRIESGO"));
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
			// Map mm=
			// pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_COMPROBAR_BENIDGAR(SSEGURO,NRIESGO);
			// logger.debug(mm);
			// Recuperaci�n riesgo
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
			logger.debug(map);
			map = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("OB_IAX_RIESGOS", map);

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un NOMBRE y/o un NNUMIDE de un Agente, ejecuta la consulta de b�squeda
	 * de Agentes en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisctr505_listaConvenios.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda(HttpServletRequest request, Axisctr505Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar persona a buscar
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			// String CAGENTE = getCampoTextual(request, "CAGENTE");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");

			/* LSTEMPRESAS */

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr505Service m_siguiente");
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr505Service m_anterior");
		m_validar(request, thisAction, Constantes.ANTERIOR);
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr505Service m_validar");
		BigDecimal NTIPO = null;
		String TCLABEN = null;
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NMES1 = getCampoNumerico(request, "NMES1");
			if (AxisBaseService.isEmpty(NMES1))
				NMES1 = new BigDecimal(0);

			BigDecimal NMES2 = getCampoNumerico(request, "NMES2");
			if (AxisBaseService.isEmpty(NMES2))
				NMES2 = new BigDecimal(0);

			BigDecimal NMES3 = getCampoNumerico(request, "NMES3");
			if (AxisBaseService.isEmpty(NMES3))
				NMES3 = new BigDecimal(0);

			BigDecimal NMES4 = getCampoNumerico(request, "NMES4");
			if (AxisBaseService.isEmpty(NMES4))
				NMES4 = new BigDecimal(0);

			BigDecimal NMES5 = getCampoNumerico(request, "NMES5");
			if (AxisBaseService.isEmpty(NMES5))
				NMES5 = new BigDecimal(0);

			BigDecimal NMES6 = getCampoNumerico(request, "NMES6");
			if (AxisBaseService.isEmpty(NMES6))
				NMES6 = new BigDecimal(0);

			BigDecimal NMES7 = getCampoNumerico(request, "NMES7");
			if (AxisBaseService.isEmpty(NMES7))
				NMES7 = new BigDecimal(0);

			BigDecimal NMES8 = getCampoNumerico(request, "NMES8");
			if (AxisBaseService.isEmpty(NMES8))
				NMES8 = new BigDecimal(0);

			BigDecimal NMES9 = getCampoNumerico(request, "NMES9");
			if (AxisBaseService.isEmpty(NMES9))
				NMES9 = new BigDecimal(0);

			BigDecimal NMES10 = getCampoNumerico(request, "NMES10");
			if (AxisBaseService.isEmpty(NMES10))
				NMES10 = new BigDecimal(0);

			BigDecimal NMES11 = getCampoNumerico(request, "NMES11");
			if (AxisBaseService.isEmpty(NMES11))
				NMES11 = new BigDecimal(0);

			BigDecimal NMES12 = getCampoNumerico(request, "NMES12");
			if (AxisBaseService.isEmpty(NMES12))
				NMES12 = new BigDecimal(0);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Validar los datos de la pantalla mediante funci�n de PL
			PAC_IAX_PRODUCCION grabarmeses = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// llamada a funcion
			// BigDecimal NRIESGO = (BigDecimal) thisAction.topPila(request, "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			Map map_grabar = grabarmeses.ejecutaPAC_IAX_PRODUCCION__F_GRABARASEGURADOSMES(NRIESGO, NMES1, NMES2, NMES3,
					NMES4, NMES5, NMES6, NMES7, NMES8, NMES9, NMES10, NMES11, NMES12);
			// List axisctr006_validalausulasBeneficiario =(List) tratarRETURNyMENSAJES
			// (request, map_grabar);
			logger.debug(map_grabar);

			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map_grabar);

			if (codiRetorn.intValue() == 0) {
				// vaya al siguiente...
				if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
					// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la
					// AXCTR027
					request.setAttribute(Constantes.FORWARDACTION,
							AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr505Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}
}
