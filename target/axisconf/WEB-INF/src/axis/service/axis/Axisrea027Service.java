package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea027Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea027Service.java : Asociaci�n de f�rmulas a garant�as
 * 
 * @since Java 5.0
 */
public class Axisrea027Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea027Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			if (CIDIOMA == null)
				CIDIOMA = usuario.getCidioma();
			formdata.put("CIDIOMA", "" + CIDIOMA);

			PAC_IAX_LISTVALORES pacIaxListavalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_idiomas = pacIaxListavalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			List listaIdiomas = (List) tratarRETURNyMENSAJES(request, map_idiomas, false);
			formdata.put("listaIdiomas", listaIdiomas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea027Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*
	 * public void m_obtener_combos(HttpServletRequest request) {
	 * logger.debug("Axisrea027Service m_obtener_combos"); Map
	 * formdata=(Map)request.getAttribute(Constantes.FORMDATA); UsuarioBean
	 * usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * 
	 * try {
	 * 
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axisrea027Service - m�todo m_obtener_combos", e);
	 * AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] {
	 * e.toString() }, Constantes.MENSAJE_ERROR); } finally {
	 * this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); } }
	 */

	public void m_buscar(HttpServletRequest request, Axisrea027Action thisAction) {
		logger.debug("Axisrea027Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			// if (CIDIOMA==null) ConversionUtil.locale2CIDIOMA()
			String TCONAGR = getCampoTextual(request, "TCONAGR");
			Map map_con_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_GET_CONTRATOSAGR(SCONAGR, CIDIOMA, TCONAGR);
			List listaConRea = (List) tratarRETURNyMENSAJES(request, map_con_rea, false);
			formdata.put("listaConRea", listaConRea);
			logger.debug(map_con_rea);
			listaConRea = null;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea027Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		/*
		 * ya lo hace el m_form finally { this.f_Cargar_Propiedades_Pantalla(request,
		 * this.whoami(this)); }
		 */
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza. public void
	 *         m_guardar_contratos(HttpServletRequest request, Axisrea027Action
	 *         thisAction) { logger.debug("Axisrea027Service m_guardar_contrato");
	 *         UsuarioBean
	 *         usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 *         Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
	 * 
	 *         try {
	 * 
	 * 
	 *         m_actualizar_displays(request, thisAction);
	 * 
	 * 
	 *         } catch (Exception e) { logger.error("Error en el servicio
	 *         Axisrea027Service - m�todo m_guardar_contrato", e);
	 *         thisAction.guardarMensaje(request, "1000050", new Object[] {
	 *         e.toString() }, Constantes.MENSAJE_ERROR);
	 * 
	 *         } finally { this.f_Cargar_Propiedades_Pantalla(request,
	 *         this.whoami(this)); } }
	 */

	/**
	 * M�todo para Recuperar un registro de tramos
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception public
	 * 
	 *                   void m_actualizar_displays(HttpServletRequest request,
	 *                   AbstractDispatchAction thisAction) {
	 *                   logger.debug("Axisrea027Service m_ActualizarDisplays");
	 *                   UsuarioBean
	 *                   usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 *                   Map
	 *                   formdata=(Map)request.getAttribute(Constantes.FORMDATA);
	 * 
	 *                   try {
	 * 
	 *                   BigDecimal SCONAGR=getCampoNumerico(request, "SCONAGR");
	 *                   BigDecimal CIDIOMA=getCampoNumerico(request, "CIDIOMA");
	 *                   String TCONAGR=getCampoTextual(request, "TCONAGR"); Map
	 *                   map_con_rea=new
	 *                   PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_REA__F_GET_CONTRATOSAGR(SCONAGR,
	 *                   CIDIOMA, TCONAGR); List
	 *                   listaConRea=(List)tratarRETURNyMENSAJES(request,
	 *                   map_con_rea, false); formdata.put("listaConRea",
	 *                   listaConRea); logger.debug(map_con_rea); listaConRea=null;
	 * 
	 * 
	 *                   } catch (Exception e) { logger.error("Error en el m�todo
	 *                   Axisrea027Service.m_Actualizar_display", e);
	 *                   thisAction.guardarMensaje(request, "1000050", new Object[]
	 *                   { e.toString() }, Constantes.MENSAJE_ERROR); } finally {
	 *                   this.f_Cargar_Propiedades_Pantalla(request,
	 *                   this.whoami(this)); } }
	 */

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_contrato(HttpServletRequest request, Axisrea027Action thisAction) {
		logger.debug("Axisrea027Service m_borrar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			BigDecimal SCONAGR = getCampoNumerico(request, "AUX_SCONAGR");
			BigDecimal CIDIOMA = getCampoNumerico(request, "AUX_CIDIOMA");

			Map map_borrar = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_DEL_CONTRATOSAGR(SCONAGR, CIDIOMA);
			BigDecimal borrar = (BigDecimal) tratarRETURNyMENSAJES(request, map_borrar, false);

			// no hace falta, volvemos llamara a buscar... m_actualizar_displays(request,
			// thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea027Service - m�todo m_borrar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		/*
		 * ya lo hace en el m_form finally { this.f_Cargar_Propiedades_Pantalla(request,
		 * this.whoami(this)); }
		 */
	}

	/*
	 * public void m_modificar_contrato(HttpServletRequest request,
	 * AbstractDispatchAction thisAction) {
	 * logger.debug("axisrea027Service m_modificar_contrato"); UsuarioBean
	 * usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
	 * 
	 * try {
	 * 
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el m�todo axisrea027Service.m_modificar_contrato", e);
	 * thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
	 * Constantes.MENSAJE_ERROR); } finally {
	 * this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); } }
	 */

	/*
	 * public void m_aceptar(HttpServletRequest request, AbstractDispatchAction
	 * thisAction) { logger.debug("axisrea027Service m_aceptar"); UsuarioBean
	 * usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
	 * 
	 * try {
	 * 
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el m�todo axisrea027Service.m_aceptar", e);
	 * thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
	 * Constantes.MENSAJE_ERROR); } finally {
	 * this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); } }
	 */

	/**
	 * 
	 * @param request @SuppressWarnings("all") public void
	 *                m_ajax_actualizar_combos(HttpServletRequest request) {
	 *                logger.debug("Axisarea027Service m_ajax_actualizar_combos");
	 *                AjaxContainerService ajax=new AjaxContainerService();
	 *                UsuarioBean
	 *                usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * 
	 *                try {
	 * 
	 *                BigDecimal
	 *                CEMPRES=(BigDecimal)AbstractDispatchAction.topPila(request,
	 *                "CEMPRES"); if (isEmpty(CEMPRES)) {
	 *                CEMPRES=usuario.getCempres(); }
	 * 
	 *                BigDecimal SCONTRAPROT=getCampoNumerico(request,
	 *                "SCONTRAPROT"); Map map=new
	 *                PAC_IAX_LISTVALORES_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES,
	 *                SCONTRAPROT); logger.debug("------- Nuevos valores
	 *                combos:"+map);
	 * 
	 *                ajax.guardarContenidoFinalAContenedorAjax(map);
	 * 
	 * 
	 *                } catch (Exception e) { logger.error("Error en el servicio
	 *                Axisarea027Service - m�todo Axisarea027Service
	 *                m_ajax_actualizar_combos", e);
	 *                ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 *                request.setAttribute(Constantes.AJAXCONTAINER,
	 *                ajax.procesarContenedorAjax()); } }
	 */

}
