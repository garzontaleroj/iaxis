package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_CORRETAJE;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr175Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/*****************************************************
	 * M�TODOS DE BBDD
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * Lee los asegurados de la p�liza.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeCorretaje(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// INI -IAXIS-10627 -21/01/2020. Se adiciona el paar�metro pPNOMIVI
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEECORRETAJE(null);
		// FIN -IAXIS-10627 -21/01/2020.
		logger.debug(map);
		return map;
	}

	/**
	 * Elimina el asegurado seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbEliminaIntermediario(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINACORRETAJE(SPERSON);
		logger.debug(map);
		return map;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr175Service m_init");
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr175Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Obtiene la lista de asegurados de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr175Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			logger.debug("SSEGURO :: " + SSEGURO + " SPRODUC :: " + SPRODUC);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SPRODUC", SPRODUC);

			// INI CJMR IAXIS-5428 01/11/2019
			BigDecimal CMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			if ((new BigDecimal(212)).equals(CMOTMOV)) { // Cambio de intermediario
				BigDecimal CAGENTE_TEXT = getCampoNumerico(request, "CAGENTE_TEXT");

				Map map = new PAC_IAX_CORRETAJE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CORRETAJE__F_TRAPASO_INTERMEDIARIO(CAGENTE_TEXT);
				logger.debug(map);

			}
			// FIN CJMR IAXIS-5428 01/11/2019

			// Carga de corretajes
			List intermediarios;

			intermediarios = (List) tratarRETURNyMENSAJES(request, dbLeeCorretaje(request, usuario));

			Map intermediario = new HashMap();

			// RECUPERAR DATOS ULTIMO ASEGURADO A�ADIDO
			if (!isEmpty(intermediarios)) {
				intermediario = (Map) intermediarios.get(intermediarios.size() - 1);
				ajax.rellenarPlAContenedorAjax(intermediario);

				ajax.guardarContenidoFinalAContenedorAjax(intermediario);
			}

			request.getSession().setAttribute("axisctr_corretaje",
					((intermediarios == null) ? new ArrayList() : intermediarios));

			// gestionarOrdenacionTablas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr175Service - m�todo m_form", e);
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
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr175Service m_siguiente");
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);
		else
			request.setAttribute("ok", "1");

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr175Service m_anterior");
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
		logger.debug("Axisctr175Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal codiRetorn = new BigDecimal(0);
			if (!(isEmpty((List) request.getSession().getAttribute("axisctr_corretaje"))
					&& direccion == Constantes.ANTERIOR)) {
				Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_CORRETAJE();
				logger.debug(map);
				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			}

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr175Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Borra un asegurado pasado por SPERSON de la lista de personas de sesi�n.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_delete_intermediario(HttpServletRequest request) {
		logger.debug("Axisctr175Service m_ajax_delete_intermediario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			if (!isEmpty(request.getSession().getAttribute("axisctr_corretaje"))) {
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				List intermediarios = (List) request.getSession().getAttribute("axisctr_corretaje");

				// Borrar de BD
				Map eliminaIntermediario = this.dbEliminaIntermediario(request, usuario, NORDEN);
				BigDecimal eliminaIntermediarioReturn = (BigDecimal) ajax
						.rellenarPlAContenedorAjax(eliminaIntermediario);

				logger.debug("NORDEN" + NORDEN);
				logger.debug("CAGENTE" + CAGENTE);
				logger.debug("eliminaIntermediarioReturn" + eliminaIntermediarioReturn);

				if (eliminaIntermediarioReturn.equals(new BigDecimal(0))) {
					// Borrar de la lista de sesi�n
					ajax.guardarContenidoFinalAContenedorAjax(quitaObjetoDeLista(intermediarios,
							bigDecimalToString(CAGENTE), "CAGENTE", "OB_IAX_CORRETAJE"));
					request.getSession().setAttribute("axisctr_corretaje",
							((intermediarios == null) ? new ArrayList() : intermediarios));
					intermediarios = null;

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr175Service - m�todo m_ajax_delete_intermediario", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Al seleccionar un intermediario, cargamos sus v�nculos en axisctr_corretaje.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_intermediario(HttpServletRequest request) {
		logger.debug("Axisctr175Service AJAX m_ajax_selected_intermediario");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal PCOMISI = getCampoNumerico(request, "PCOMISI");
			BigDecimal PPARTICI = getCampoNumerico(request, "PPARTICI");
			BigDecimal ISLIDER = getCampoNumerico(request, "ISLIDER");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			if (!isEmpty(CAGENTE) && CAGENTE != null) {
				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_CORRETAJE(CAGENTE);
				logger.debug(map);
				Map ob_corretaje = (Map) tratarRETURNyMENSAJES(request, map);

				Map intermediario = new HashMap();
				intermediario.put("CORRETAJE", ob_corretaje);

				ajax.rellenarPlAContenedorAjax(intermediario);
				ajax.guardarContenidoFinalAContenedorAjax(intermediario);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr175Service - m�todo m_ajax_selected_intermediario", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			// request.getSession().setAttribute ("axisctr_intermediario",
			// ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
