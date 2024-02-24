package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCARGAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm065Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm065Service.java 01/09/2008
 * 
 * @author <a href="jcolldeforns@csi-ti.com">Joan Colldeforns</a>
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm065Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm065Action thisAction) {
		logger.debug("Axisadm065Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm065Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	private void cargarValoresDesplegables(HttpServletRequest request, Axisadm065Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map lstValores = new HashMap();
		try {

			PAC_IAX_DESCARGAS pacIaxDescargas = new PAC_IAX_DESCARGAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Cargar ListValores */
			Map map = pacIaxDescargas.ejecutaPAC_IAX_DESCARGAS__F_GET_CIAS();
			logger.debug(map);
			List<Map> lstCompani = (List<Map>) tratarRETURNyMENSAJES(request, map);
			lstValores.put("lstCompani", lstCompani);

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1048"));
			logger.debug(map);
			List<Map> lstTipPet = (List<Map>) tratarRETURNyMENSAJES(request, map);
			lstValores.put("lstTipPet", lstTipPet);

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1049"));
			logger.debug(map);
			List<Map> lstTipFic = (List<Map>) tratarRETURNyMENSAJES(request, map);
			lstValores.put("lstTipFic", lstTipFic);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm065Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("lstValores", lstValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Busca los registros de cierres coincidentes con los par�metros del filtro.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm065Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPPET = getCampoNumerico(request, "CTIPPET");
			BigDecimal SSEQDWL = getCampoNumerico(request, "busquedaSSEQDWL");
			BigDecimal CTIPFICH = getCampoNumerico(request, "CTIPFICH");

			PAC_IAX_DESCARGAS pacIaxDescargas = new PAC_IAX_DESCARGAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxDescargas.ejecutaPAC_IAX_DESCARGAS__F_GET_DESCARGAS(CCOMPANI, CTIPPET, SSEQDWL, CTIPFICH);
			logger.debug("F_GET_DESCARGAS ---------> " + map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("lstDescargas", map.get("RETURN"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm065Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Busca los registros de cierres coincidentes con los par�metros del filtro.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar_detalle(HttpServletRequest request) {
		logger.debug("Axisadm065Service m_buscar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SSEQDWL = getCampoNumerico(request, "SSEQDWL");

			PAC_IAX_DESCARGAS pacIaxDescargas = new PAC_IAX_DESCARGAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxDescargas.ejecutaPAC_IAX_DESCARGAS__F_GET_FICHEROS(SSEQDWL);
			logger.debug("F_GET_FICHEROS ---------> " + map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("listDetalle", map.get("RETURN"));

			m_buscar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm065Service - m�todo m_buscar_detalle", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Busca los registros de cierres coincidentes con los par�metros del filtro.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_descargar(HttpServletRequest request) {
		logger.debug("Axisadm065Service m_descargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SSEQDWL = getCampoNumerico(request, "SSEQDWL");
			BigDecimal NNUMFIL = getCampoNumerico(request, "NNUMFIL");

			PAC_IAX_DESCARGAS pacIaxDescargas = new PAC_IAX_DESCARGAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxDescargas.ejecutaPAC_IAX_DESCARGAS__F_SET_PETICION(SSEQDWL, NNUMFIL);
			logger.debug("F_SET_PETICION ---------> " + map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("busquedaSSEQDWL", map.get("PSSEQOUT"));
			formdata.put("SSEQDWL", map.get("PSSEQOUT"));

			m_buscar_detalle(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm065Service - m�todo m_buscar_detalle", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Crea una nueva petici�n de listado de ficheros
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_nueva(HttpServletRequest request) {
		logger.debug("Axisadm065Service m_nueva");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CTIPFICH = getCampoNumerico(request, "CTIPFICH");

			PAC_IAX_DESCARGAS pacIaxDescargas = new PAC_IAX_DESCARGAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxDescargas.ejecutaPAC_IAX_DESCARGAS__F_SET_PETICION_LST_FILES(CCOMPANI, CTIPFICH);
			logger.debug("PETICION_LST_FILES ---------> " + map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("busquedaSSEQDWL", map.get("PSSEQOUT"));
			formdata.put("SSEQDWL", map.get("PSSEQOUT"));

			m_buscar_detalle(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm065Service - m�todo m_nueva", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
