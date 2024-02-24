package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro002Action thisAction) {
		logger.debug("Axispro002Service m_form");
		try {
			cargarDatosCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Lista empresas
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		logger.debug(map);

		List empresas = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("EMPRESAS", empresas);

		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug(cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias);
		request.setAttribute("CIAS", listacias);

		if (empresas.size() == 1) {
			formdata.put("EMPRESA", ((HashMap) empresas.get(0)).get("CEMPRES"));
		}

		if (!isEmpty(formdata.get("EMPRESA")) && !"null".equals(formdata.get("EMPRESA"))) {
			String tipo = this.getCampoTextual(request, "tipo");
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo,
							new BigDecimal(String.valueOf(formdata.get("EMPRESA"))));
			logger.debug(map);
			request.setAttribute("RAMOS", (List) tratarRETURNyMENSAJES(request, map));
		}

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
		logger.debug(map);
		request.setAttribute("AGRUPACIONES", (List) tratarRETURNyMENSAJES(request, map));

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axispro002Action thisAction) {
		logger.debug("Axispro002Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CEMPRESA = getCampoNumerico(request, "EMPRESA");
			BigDecimal CRAMO = getCampoNumerico(request, "RAMO");
			BigDecimal CAGRPRO = getCampoNumerico(request, "AGRUPACION");
			BigDecimal CACTIVO = getCampoNumerico(request, "ACTIVO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String origen = (String) AbstractDispatchAction.topPila(request, "CFORM");
			Map map = null;
			if (origen != null && origen.equals("AXISCAJ002"))
				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA_FILTRADO(CEMPRESA, CRAMO, CAGRPRO, CACTIVO, CCOMPANI);
			else {
				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(CEMPRESA, CRAMO, CAGRPRO, CACTIVO, CCOMPANI);
			}
			logger.debug(map);

			request.getSession().setAttribute("LISTAPRODUCTOS", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro002Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Funcion que recupera la lista de los ramos de una empresa
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_ramos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CVALOR = getCampoNumerico(request, "CVALOR");
			logger.debug("---------- VALOR empresa  :" + CVALOR);
			if (!isEmpty(CVALOR)) {
				String tipo = this.getCampoTextual(request, "tipo");
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, CVALOR);
				logger.debug(map);

				if (!isEmpty(map)) {
					List ramos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(ramos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_modelo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
