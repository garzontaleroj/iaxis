package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_ACTIVIDADES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.axis.Axispro031Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axispro031Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction El Action que invoca a este Servicio.
	 */
	public void m_form(HttpServletRequest request, Axispro031Action thisAction) {
		logger.debug("Axispro031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			getActividadesProducto(request, usuario);
			getActividadesSeleccionables(request, usuario);
		} catch (Exception e) {
			logger.error("Error en el servicio axispro031Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que carga en topPila todo lo referente para duplicar actividades
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_duplicar_actividad(HttpServletRequest request, Axispro031Action thisAction) {
		logger.debug("Axispro031Service m_duplicar_actividad");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			thisAction.topPila(request, "formdata_axispro031", formdata);
			thisAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axispro034.do?operation=form"));
			thisAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axispro031.do?operation=volverDuplicar"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro031Service - m�todo m_duplicar_actividad", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo de retorno al duplicar una actividad. Devuelve el formdata que
	 * inicialmente se habia enviado a la pantalla axispro034, para mantener el
	 * mismo estado en la actual.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_volverDuplicar(HttpServletRequest request, Axispro031Action thisAction) {
		logger.debug("Axispro031Service m_volverDuplicar");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axispro031 = (Map) thisAction.removeTopPila(request, "formdata_axispro031");

			if (!AxisBaseService.isEmpty(formdata_axispro031))
				formdata.putAll(formdata_axispro031);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro031Service - m�todo m_volverDuplicar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que produce una acci�n en funci�n del evento de marcar/desmarcar un
	 * registro del display de actividades seleccionables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_actualizarISSELEC(HttpServletRequest request, Axispro031Action thisAction) {
		logger.debug("Axispro031Service m_actualizarISSELEC");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal ISSELEC = getCampoNumerico(request, "ISSELEC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI_SEL");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug("Check de la actividad: " + CACTIVI + ", marcado? "
					+ ((!isEmpty(ISSELEC) && BigDecimal.ONE.equals(ISSELEC)) ? "SI" : "NO"));

			// Llamamos a la funcion de set s�lo cuando el checkbox est� marcado.
			if (BigDecimal.ONE.equals(ISSELEC)) {
				BigDecimal RETURNSELEC = null;
				// Modificamos actividades de producto seg�n selecci�n
				Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_ACTIVIDADES(CRAMO, CMODALI, CTIPSEG, CCOLECT,
						SPRODUC, CACTIVI);
				RETURNSELEC = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				logger.debug("Registro con c�digo: " + CACTIVI + " a�adido en multiregistro superior? "
						+ ((!isEmpty(RETURNSELEC) && BigDecimal.ZERO.equals(RETURNSELEC)) ? "SI" : "NO"));
			} else if (BigDecimal.ZERO.equals(ISSELEC)) {
				BigDecimal RETURNNOTSELEC = null;
				Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_EXIST_ACTPOL(SPRODUC, CACTIVI);
				RETURNNOTSELEC = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				logger.debug(RETURNNOTSELEC);

				logger.debug("Registro con c�digo: " + CACTIVI + " desmarcado? "
						+ ((!isEmpty(RETURNNOTSELEC) && BigDecimal.ONE.equals(RETURNNOTSELEC)) ? "NO" : "SI"));

				// Si no existen p�lizas, dejamos desmarcar y, borramos la actividad del
				// multiregistro superior.
				if (BigDecimal.ZERO.equals(RETURNNOTSELEC)) {
					logger.debug(
							"No existen p�lizas, por tanto, intentamos borrar el registro del multiregistro superior");
					BigDecimal RETURNNOTSELECDELETE = null;
					Map map1 = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_BORRAR_ACTIVIDADES(SPRODUC, CACTIVI);
					RETURNNOTSELECDELETE = (BigDecimal) tratarRETURNyMENSAJES(request, map1);
					logger.debug(RETURNNOTSELECDELETE);
					logger.debug("Registro con c�digo: " + CACTIVI + " borrado? "
							+ ((!isEmpty(RETURNNOTSELECDELETE) && BigDecimal.ONE.equals(RETURNNOTSELECDELETE)) ? "NO"
									: "SI"));
				} else {
					logger.debug("Existen p�lizas, no podemos desmarcar el registro.");
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axispro031Service - m�todo m_actualizarISSELEC", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que rellena el multiregistro superior en la pantalla axispro031. En
	 * ella se muestran listados las actividades del producto.
	 * 
	 * @param request
	 * @param usuario
	 * @param formdata
	 * @throws Exception
	 */
	private void getActividadesProducto(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		List<Map> T_IAX_PRODACTIVIDADES = new ArrayList<Map>();

		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
		BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
		BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
		BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Carga de actividades de producto
		Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVIDADES(CRAMO, CMODALI, CTIPSEG, CCOLECT, SPRODUC,
				CACTIVI);
		T_IAX_PRODACTIVIDADES = (List<Map>) tratarRETURNyMENSAJES(request, map);
		logger.debug(T_IAX_PRODACTIVIDADES);

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.getSession().setAttribute("T_IAX_PRODACTIVIDADES",
				!isEmpty(T_IAX_PRODACTIVIDADES) ? T_IAX_PRODACTIVIDADES : new ArrayList());
	}

	/**
	 * M�todo que rellena el multiregistro inferior en la pantalla axispro031. En
	 * ella se muestran listados las actividades seleccionables del producto.
	 * Tambi�n rellenamos la lista de actividades seleccionables, para poder indicar
	 * en la pantalla que registros van marcados y que registros van desmarcados
	 * (checkbox)
	 * 
	 * @param request
	 * @param usuario
	 * @param formdata
	 * @throws Exception
	 */
	private void getActividadesSeleccionables(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		List actividades = new ArrayList();
		BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_ACTIVIDADES pac_iax_actividades = new PAC_IAX_ACTIVIDADES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Carga de actividades seleccionables
		Map map = pac_iax_actividades.ejecutaPAC_IAX_ACTIVIDADES__F_GET_ACTIVIRAMO(CRAMO);
		actividades = (List) tratarRETURNyMENSAJES(request, map);
		logger.debug(actividades);

		// Intentamos rellenar el valor de los check de cada actividad seleccionable
		if (!isEmpty(request.getSession().getAttribute("T_IAX_PRODACTIVIDADES")) && !isEmpty(actividades)) {

			List<Map> T_IAX_PRODACTIVIDADES = (List<Map>) request.getSession().getAttribute("T_IAX_PRODACTIVIDADES");

			for (Map OB_IAX_PRODACTIVIDAD : T_IAX_PRODACTIVIDADES) {
				Map OB_IAX_PRODACTIVIDADES = (Map) OB_IAX_PRODACTIVIDAD.get("OB_IAX_PRODACTIVIDADES");
				BigDecimal PCACTIVI = (BigDecimal) OB_IAX_PRODACTIVIDADES.get("CACTIVI");

				for (int i = 0; i < actividades.size(); i++) {
					// Si existe el mismo CACTIVI en ambos registros, marcamos el check
					// correspondiente
					if (((Map) actividades.get(i)).get("CACTIVI").equals(PCACTIVI)) {
						((Map) actividades.get(i)).put("ISSELEC", "1");
						break;
					}

					// Si ya hemos mirado en todos los registros y no existe coincidencia, dejamos
					// desmarcado el chack correspondiente
					// if (i == (actividades.size() - 1)) {
					// ((Map)actividades.get(i)).put("ISSELEC", "0");
					// }
				}
			}
		}

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.getSession().setAttribute("actividades", !isEmpty(actividades) ? actividades : new ArrayList());
		logger.debug(request.getSession().getAttribute("actividades"));
	}
}
