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
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro007Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga inicial de la pantalla. Carga de BD: - Los datos t�cnicos. - Los
	 * diferentes valores de los combos. - Llama a #m_cargarCuadroInteres
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro007Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			formdata.put("SPRODUC", SPRODUC);
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos Producto */
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_DATTECN(SPRODUC);
			logger.debug(map);
			Map OB_IAX_PRODDATOSTECNICOS = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("OB_IAX_PRODDATOSTECNICOS", OB_IAX_PRODDATOSTECNICOS);

			/* Listas de valores de combos */
			Map LISTVALORES = new HashMap();

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTNIVEL();
			logger.debug(map);
			List<Map> LSTNIVEL = (List<Map>) tratarRETURNyMENSAJES(request, map);
			LISTVALORES.put("LSTNIVEL", LSTNIVEL);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTNCODINT();
			logger.debug(map);
			List<Map> LSTNCODINT = (List<Map>) tratarRETURNyMENSAJES(request, map);
			LISTVALORES.put("LSTNCODINT", LSTNCODINT);

			formdata.put("LISTVALORES", LISTVALORES);

			if (BigDecimal.ZERO.equals(OB_IAX_PRODDATOSTECNICOS.get("NNIIGAR")))
				m_recargarCuadroInteres(request, (BigDecimal) OB_IAX_PRODDATOSTECNICOS.get("NCODINT"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga el primer multiregistro de "cuadro de inter�s" en funci�n de un
	 * NCODINT.
	 * 
	 * @param request
	 * @param NCODINT
	 */
	@SuppressWarnings("all")
	public void m_recargarCuadroInteres(HttpServletRequest request, BigDecimal NCODINT) {
		logger.debug("Axispro007Service m_recargarCuadroInteres");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			if (isEmpty(NCODINT))
				NCODINT = getCampoNumerico(request, "NCODINT");

			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_CUADROINTERESPROD(NCODINT);
			logger.debug(map);
			List<Map> INTERESPROD = (List<Map>) ajax.rellenarPlAContenedorAjax(map);

			// Guardar la lista en Ajax
			ajax.guardarContenidoFinalAContenedorAjax(INTERESPROD);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro007Service - m�todo m_recargarCuadroInteres", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().removeAttribute("DATTECN_INTERTECMOV");
			request.getSession().removeAttribute("DATTECN_INTERTECMOVDET");
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Graba los datos de la pantalla y devuelve true o false indicando si ha ido
	 * bien.
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("all")
	public boolean m_grabarDatos(HttpServletRequest request) {
		logger.debug("Axispro007Service m_grabarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NNIGGAR = getCampoNumerico(request, "NNIGGAR");
			BigDecimal NNIIGAR = getCampoNumerico(request, "NNIIGAR");
			BigDecimal CMODINT = getCampoNumerico(request, "CMODINT");
			BigDecimal CINTREV = getCampoNumerico(request, "CINTREV");
			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");

			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_DATTECN(SPRODUC, NNIGGAR, NNIIGAR, CMODINT, CINTREV,
					NCODINT);
			logger.debug(map);

			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro007Service - m�todo m_grabarDatos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return false;
		}
	}

}
