package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismap002Service.java 08/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axismap002Service extends AxisBaseService {
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
		logger.debug("Axismap002Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(500));
			formdata.put("lsttipomap", this.tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(501));
			formdata.put("lsttipotrat", this.tratarRETURNyMENSAJES(request, map, false));

			String pPTIPTRAT = this.getCampoTextual(request, "TIPTRAT");
			BigDecimal pPTIPMAP = this.getCampoNumerico(request, "TIPMAP");

			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_LISTADOMAPS(pPTIPTRAT, pPTIPMAP);
			logger.debug(m);
			formdata.put("lstmaps", this.tratarRETURNyMENSAJES(request, m, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
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
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axismap002Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMAPEAD = this.getCampoTextual(request, "CMAPEAD");

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_ARBOL(CMAPEAD);

			logger.debug(map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(RETURN)) {
				logger.debug(RETURN);
				request.setAttribute("buscarOK", true);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap002Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/**
	 * @deprecated Ya no se utiliza, no es necesario ya que PL devuelve un nodo
	 *             padre siempre. A partir de una lista RETURN de resultados de
	 *             agentes, recupera todo el �rbol jer�rquico, es decir, todos sus
	 *             padres hasta llegar al padre que tiene CPADRE = null.
	 * 
	 *             Devuelve la lista actualizada en el mismo List RETURN.
	 * 
	 * @param request
	 * @param pac_iax_redcomercial
	 * @param CEMPRESA
	 * @param FINICIO
	 * @param listaAgentes
	 * @param i
	 * @return
	 */

	/*
	 * private void recuperarArbolPadres(HttpServletRequest request,
	 * PAC_IAX_REDCOMERCIAL pac_iax_redcomercial, BigDecimal CEMPRESA, Date FINICIO,
	 * List<Map> listaAgentes, int i) {
	 * 
	 * try {
	 * 
	 * while (i < listaAgentes.size()) { BigDecimal CPADRE = (BigDecimal)
	 * listaAgentes.get(i).get("CPADRE");
	 * 
	 * if (CPADRE != null) { // Buscamos el objeto que tiene como CODIGO el CPADRE
	 * del objeto Map objetoPadre = super.getObjetoDeLista(listaAgentes,
	 * CPADRE.toString(), "CODIGO");
	 * 
	 * // Si no existe el objeto padre, buscarlo if (objetoPadre == null) { Map map
	 * = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL
	 * (CEMPRESA, FINICIO, CPADRE, null, null, null); logger.debug(map); //
	 * Recuperar la lista de objetos, entre los cu�les est� el padre List<Map>
	 * padreList = (List<Map>) tratarRETURNyMENSAJES(request, map);
	 * 
	 * if (!isEmpty(padreList)) { // Recuperar el objeto padre objetoPadre =
	 * super.getObjetoDeLista(padreList, CPADRE.toString(), "CODIGO");
	 * 
	 * if (!isEmpty(objetoPadre)) { // A�adir el objeto padre
	 * listaAgentes.add(objetoPadre); // Recuperar los padres del objeto padre
	 * recursivamente recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA,
	 * FINICIO, listaAgentes, ++i); } } } else { ++i; } } else { // CPADRE == null:
	 * acaba el algoritmo break; } }
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el servicio Axismap002Service - m�todo m_form", e);
	 * AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] {
	 * e.toString() }, Constantes.MENSAJE_ERROR); } }
	 * 
	 */
}
