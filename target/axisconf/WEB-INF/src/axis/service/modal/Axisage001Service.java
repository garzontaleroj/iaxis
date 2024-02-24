package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage001Service.java 08/10/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage001Service extends AxisBaseService {
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
		logger.debug("Axisage001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisage001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Eliminar b�squedas anteriores
			request.getSession().removeAttribute("RED_ARBOL");

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			boolean buscarConFiltro = "true".equals(request.getAttribute("BUSCAR_CON_FILTRO"));
			Map RED_FILTROBUSQUEDA = (Map) request.getSession().getAttribute("RED_FILTROBUSQUEDA");
			if (isEmpty(RED_FILTROBUSQUEDA))
				RED_FILTROBUSQUEDA = new HashMap();

			BigDecimal CEMPRESA = buscarConFiltro ? (BigDecimal) RED_FILTROBUSQUEDA.get("CEMPRESA")
					: getCampoNumerico(request, "CEMPRESA");
			Date FINICIO = buscarConFiltro ? (Date) RED_FILTROBUSQUEDA.get("FINICIO")
					: stringToSqlDate(getCampoTextual(request, "FINICIO"));
			BigDecimal CAGENTE = buscarConFiltro ? (BigDecimal) RED_FILTROBUSQUEDA.get("CAGENTE")
					: getCampoNumerico(request, "CAGENTE");
			String NOMAGENTE = buscarConFiltro ? (String) RED_FILTROBUSQUEDA.get("NOMAGENTE")
					: getCampoTextual(request, "TAGENTE");
			BigDecimal TIPAGENTE = buscarConFiltro ? (BigDecimal) RED_FILTROBUSQUEDA.get("TIPAGENTE")
					: getCampoNumerico(request, "TIPAGENTE");
			BigDecimal CACTIVO = buscarConFiltro ? (BigDecimal) RED_FILTROBUSQUEDA.get("CACTIVO")
					: getCampoNumerico(request, "CACTIVO");
			BigDecimal CBUSQUEDA = buscarConFiltro ? (BigDecimal) RED_FILTROBUSQUEDA.get("CBUSQUEDA")
					: getCampoNumerico(request, "CBUSQUEDA");

			RED_FILTROBUSQUEDA.put("CEMPRESA", CEMPRESA);
			RED_FILTROBUSQUEDA.put("FINICIO", FINICIO);
			RED_FILTROBUSQUEDA.put("CAGENTE", CAGENTE);
			RED_FILTROBUSQUEDA.put("NOMAGENTE", NOMAGENTE);
			RED_FILTROBUSQUEDA.put("TIPAGENTE", TIPAGENTE);
			RED_FILTROBUSQUEDA.put("CACTIVO", CACTIVO);
			RED_FILTROBUSQUEDA.put("CBUSQUEDA", CBUSQUEDA);

			request.getSession().setAttribute("RED_FILTROBUSQUEDA", RED_FILTROBUSQUEDA);

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL(CEMPRESA, FINICIO,
					CAGENTE, NOMAGENTE, TIPAGENTE, CACTIVO, CBUSQUEDA);

			logger.debug(map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(RETURN)) {
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				request.getSession().setAttribute("RED_ARBOL", RETURN);
				request.setAttribute("buscarOK", true);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	 * logger.error("Error en el servicio Axisage001Service - m�todo m_form", e);
	 * AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] {
	 * e.toString() }, Constantes.MENSAJE_ERROR); } }
	 * 
	 */
}
