package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CIERRES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm012Service.java 01/09/2008
 * 
 * @author <a href="jcolldeforns@csi-ti.com">Joan Colldeforns</a>
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm012Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm012Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map lstValores = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Buscar empresa activa
			/*
			 * BigDecimal currentCEMPRES = usuario.getCempres(); Map map = new
			 * SINPAQUETE((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).
			 * ejecutaF_DESEMPRESA(currentCEMPRES, null, ""); logger.debug(map);
			 * 
			 * if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
			 * 
			 * formdata.put("TEMPRES", map.get("PTEMPRES")); }
			 */

			/* Cargar ListValores */
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			List<Map> lstEmpresas = (List<Map>) tratarRETURNyMENSAJES(request, map);
			lstValores.put("lstEmpresas", lstEmpresas);

			BigDecimal CEMPRES = null;

			if (!isEmpty(lstEmpresas) && lstEmpresas.size() == 1)
				CEMPRES = (BigDecimal) lstEmpresas.get(0).get("CEMPRES");
			else
				CEMPRES = getCampoNumerico(request, "buscarCEMPRES");

			if (!isEmpty(CEMPRES)) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCIERRE(CEMPRES);
				logger.debug(map);
				lstValores.put("lstTipoCierres", tratarRETURNyMENSAJES(request, map));
			}

			BigDecimal PPREVIO = BigDecimal.ZERO;
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOCIERRE(PPREVIO);
			logger.debug(map);
			lstValores.put("lstEstadoCierres", tratarRETURNyMENSAJES(request, map));

			formdata.put("lstValores", lstValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
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
		logger.debug("Axisadm012Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "buscarCEMPRES");
			BigDecimal CTIPO = getCampoNumerico(request, "buscarCTIPO");
			BigDecimal CESTADO = getCampoNumerico(request, "buscarCESTADO");
			Date FCIERRE = stringToSqlDate(getCampoTextual(request, "buscarFCIERRE"));

			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_GET_CIERRES(CEMPRES, CTIPO, CESTADO, FCIERRE);
			List<Map> lstCierres = (List<Map>) tratarRETURNyMENSAJES(request, map);

			// logger.debug(ConversionUtil.printAsXML(lstCierres, "<T_IAX_RECIBOS>"));
			logger.debug(map);
			formdata.put("lstCierres", lstCierres);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Comprueba que el registro seleccionado sea modificable
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_get_modificable(HttpServletRequest request) {
		logger.debug("Axisadm012Service m_get_modificable");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_GET_MODIFICABLE(CESTADO);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_get_modificable", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	@SuppressWarnings("all")
	public void m_borrar(HttpServletRequest request) {
		logger.debug("Axisadm012Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			Date FPERINI = stringToSqlDate(getCampoTextual(request, "FPERINI"));
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_BORRAR_CIERRE(CEMPRES, CTIPO, FPERINI, CESTADO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisadm012Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_CIERRES pacIaxCierres = new PAC_IAX_CIERRES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxCierres.ejecutaPAC_IAX_CIERRES__F_EJECUTAR();
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
