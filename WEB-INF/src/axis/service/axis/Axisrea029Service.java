package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea029Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea029Service.java : Reaseguro cl�usulas /Tramos escalonados 11/08/2011
 * 
 * @since Java 5.0
 */
public class Axisrea029Service extends AxisBaseService {
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
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea0029Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			try {
				this.m_obtener_combos(request);
			} catch (Exception e) {
				logger.error("Error en el servicio Axisrea023Service - m�todo m_form", e);
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea023Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea023Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map_tipos = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TIPOCLAUTRAMESCAL();
			List tipos = (List) tratarRETURNyMENSAJES(request, map_tipos, false);
			formdata.put("listaTipos", tipos);
			logger.debug(map_tipos);
			tipos = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea023Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */

	public void m_buscar(HttpServletRequest request, Axisrea029Action thisAction) {
		logger.debug("Axisrea029Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			Map map_clau_tram = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_COD_CLAUSULAS_REAS(CCODIGO, CTIPO);
			List lista_clau_tram = (List) tratarRETURNyMENSAJES(request, map_clau_tram, false);
			formdata.put("listaClauTram", lista_clau_tram);
			logger.debug(map_clau_tram);
			lista_clau_tram = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea029Service - m�todo m_buscar", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */

	public void m_recargar(HttpServletRequest request, Axisrea029Action thisAction) {
		logger.debug("Axisrea029Service m_recargar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			Map map_clau_tram = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_COD_CLAUSULAS_REAS(CCODIGO, CTIPO);
			List lista_clau_tram = (List) tratarRETURNyMENSAJES(request, map_clau_tram, false);
			formdata.put("listaClauTram", lista_clau_tram);
			logger.debug(map_clau_tram);
			lista_clau_tram = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea029Service - m�todo m_recragar", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar(HttpServletRequest request, Axisrea029Action thisAction) {
		logger.debug("Axisctr003Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_MOD");
			BigDecimal SPLENO = getCampoNumerico(request, "SPLENO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_OBJETO_TRAMOS();

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
				logger.debug("<----- ENTRO IF ---->" + map);
				request.setAttribute("grabarr", new BigDecimal(0));
				formdata.clear();
			} else
				m_obtener_combos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea023Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_clau(HttpServletRequest request, Axisrea029Action thisAction) {
		logger.debug("Axisrea029Service m_borrar_tramo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");

			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_CLAUSULAS_REAS(CCODIGO, CIDIOMA); // TODO:Revisar funcion

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea023Service - m�todo m_borrar_tramo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			Map map = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
