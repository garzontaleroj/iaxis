package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen006Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axispen006Action thisAction) {
		logger.debug("Axispen006Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axispen006Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen006Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axispen006Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				logger.debug(ramos);
				ajax.rellenarPlAContenedorAjax(ramos);
				ajaxResponse.put("CRAMO", ramos);
				request.getSession().setAttribute("REA_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ONE; // TODO: Hard-coded CTERMFIN
					String P_TIPO = "1"; // TODO: Hard-coded CTERMFIN
					/* De moneto desactivado */
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(P_TIPO, CRAMO,
							CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.getSession().setAttribute("REA_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));

				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen006Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

	private void cargarValoresDesplegables(HttpServletRequest request, Axispen006Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Tipo de documento
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			logger.debug(map);
			listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axispen006Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(formdata.get("listValores"))) {
				formdata.put("listValores", listValores);
			}
		}
	}

	public void m_busqueda_depo(HttpServletRequest request, Axispen006Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String TNOM = getCampoTextual(request, "TNOMDEP");
			BigDecimal CCOD = getCampoNumerico(request, "CCODDEP");

			PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PDEPOSITARIAS(null, null, CCOD, null, null, TNOM);

			logger.debug(map);
			// Si la crida retorna error llencem excepcio.
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}
			// Preparem llista de gestores
			ArrayList listaDepos = (ArrayList<Map>) map.get("PDEPOSITARIAS");
			logger.debug(listaDepos);
			request.getSession().setAttribute("AXIS_DEPOSITARIAS", listaDepos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen008Service - m�todo m_busqueda_depo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
