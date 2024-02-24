package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro018Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro018Service extends AxisBaseService {
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
		logger.debug("Axispro018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");

			if (!isEmpty(NCODINT)) {
				// Viene un NCODINT informado desde la pantalla 7
				PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_NCODINT(NCODINT, null, null);
				logger.debug(map);

				request.getSession().setAttribute("DATTECN_LSTNCODINT",
						(List<Map>) tratarRETURNyMENSAJES(request, map));
			}

			// Si no viene informado un NCODINT, el atributo
			// DATTECN_LSTNCODINT proviene del modal axispro018_buscador

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro018Service - m�todo m_form", e);
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
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("all")
	public boolean m_deleteCuadroInteres(HttpServletRequest request) {
		/**
		 * Comparador propio para ordenar una tabla en orden natural.
		 */
		class ComparadorOrdenNatural implements Comparator {
			String campo;
			String outerMap;

			ComparadorOrdenNatural(String campo, String outerMap) {
				this.campo = campo;
				this.outerMap = outerMap;
			}

			public int compare(Object o1, Object o2) {
				try {
					if (isEmpty(campo)) {
						return o1.toString().compareTo(o2.toString());
					} else {
						Map map1 = (Map) o1;
						Map map2 = (Map) o2;

						if (!isEmpty(outerMap)) {
							map1 = (Map) map1.get(outerMap);
							map2 = (Map) map2.get(outerMap);
						}

						if (map1.get(campo) == null)
							return -1;
						else if (map2.get(campo) == null)
							return 1;
						else if (map1.get(campo) instanceof Comparable && map2.get(campo) instanceof Comparable)
							return ((Comparable) map1.get(campo)).compareTo(map2.get(campo));
						else
							return map1.get(campo).toString().compareTo(map2.get(campo).toString());
					}
				} catch (Exception e) {
					logger.error(
							"Error en el servicio Axispro022Service - m�todo m_deleteCuadroInteres$ComparadorOrdenNatural#compare",
							e);
					return 0;
				}
			}
		}

		/*********************************/
		/**** INICIO CUERPO DEL M�TODO ***/
		/*********************************/

		logger.debug("Axispro018Service m_deleteCuadroInteres");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal RETURN = BigDecimal.ONE;

		try {
			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTEC(NCODINT);
			logger.debug(map);

			RETURN = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

			if (BigDecimal.ZERO.equals(RETURN)) {
				List<Map> LSTNCODINT = (List<Map>) request.getSession().getAttribute("DATTECN_LSTNCODINT");
				quitarObjetoDeLista(LSTNCODINT, NCODINT.toString(), "NCODINT");
				Collections.sort(LSTNCODINT, new ComparadorOrdenNatural("NCODINT", null));
				ajax.guardarContenidoFinalAContenedorAjax(LSTNCODINT);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_deleteCuadroInteres", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			return BigDecimal.ZERO.equals(RETURN);
		}
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos) y un objeto (Map) que se
	 * quiere quitar de dicho List, el m�todo comprueba si existe el objeto en la
	 * lista y lo elimina. Elimina todos los objetos que cumplan la condici�n.
	 * 
	 * @param listaObjetos Un List conteniendo Objetos (Maps).
	 * @param idObjeto     El id del objeto a eliminar de este List.
	 * @param nombreClave  El literal que identifica la clave (ejemplo, "idObjeto").
	 * @return Map El objeto eliminado (null si no se ha encontrado).
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	@SuppressWarnings("all")
	protected void quitarObjetoDeLista(List<Map> listaObjetos, String idObjeto, String nombreClave) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		List<Map> objetosABorrar = new ArrayList<Map>();

		for (Map map : listaObjetos) {
			Object idAComparar = getTipoAtributo(map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (((Integer) idAComparar).equals(Integer.valueOf(idObjeto))) {
					objetosABorrar.add(map);
				}
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (((BigDecimal) idAComparar).equals(new BigDecimal(idObjeto))) {
					objetosABorrar.add(map);
				}
			} else {
				// Por si la clave es un String
				if (((String) idAComparar).equals(idObjeto)) {
					objetosABorrar.add(map);
				}
			}
		}

		for (Map map : objetosABorrar)
			listaObjetos.remove(map);

	}

	/**
	 * @param request
	 * @return
	 */
	@SuppressWarnings("all")
	public boolean m_deleteVigencia(HttpServletRequest request) {
		logger.debug("Axispro018Service m_deleteVigencia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal RETURN = BigDecimal.ONE;

		try {
			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTECMOV(NCODINT, CTIPO, FINICIO);
			logger.debug(map);

			RETURN = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_deleteVigencia", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			return BigDecimal.ZERO.equals(RETURN);
		}
	}

	/**
	 * @param request
	 * @return
	 */
	@SuppressWarnings("all")
	public boolean m_deleteTramo(HttpServletRequest request) {
		logger.debug("Axispro018Service m_deleteTramo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		BigDecimal RETURN = BigDecimal.ONE;

		try {
			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			BigDecimal NDESDE;

			try {
				NDESDE = new BigDecimal(getCampoTextual(request, "NDESDE")); // No utilizo getCampoNumerico porque no
																				// quiero quitar los puntos
			} catch (NumberFormatException nfe) {
				NDESDE = null;
			}

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_INTERTECMOVDET(NCODINT, CTIPO, FINICIO, NDESDE);
			logger.debug(map);

			RETURN = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_deleteTramo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			return BigDecimal.ZERO.equals(RETURN);
		}
	}
}
