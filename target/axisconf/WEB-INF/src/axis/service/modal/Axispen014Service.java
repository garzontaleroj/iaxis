package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispen014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispen014Service.java 15/12/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axispen014Service extends AxisBaseService {
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

	public void m_form(HttpServletRequest request, Axispen014Action thisAction) {
		logger.debug("Axispen014Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
			if (CCODPLA != null) {
				// Busquem el pla de pensions.
				PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES(null, null, null, null, null,
						CCODPLA);
				logger.debug("ejecutaPAC_IAX_PENSIONES__F_GET_PLANPENSIONES return: " + map);
				// Si la crida retorna error llencem excepcio.
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map, true))).compareTo(new BigDecimal(0)) != 0) {
					throw new Exception();
				}
				// Preparem llista de gestores

				ArrayList listaPlan = (ArrayList<Map>) map.get("PLANPENSIONES");
				logger.debug(listaPlan);
				if (listaPlan.get(0) != null) {
					formdata.put("AXIS_PLAN", listaPlan.get(0));
				}
			}
			this.cargarValoresDesplegables(request, usuario, formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispen014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

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

	public void m_grabar(HttpServletRequest request, Axispen014Action thisAction) {
		logger.debug("Axispen014Service m_grabar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Recuperem els camps
		BigDecimal CCODPLA = getCampoNumerico(request, "CCODPLA");
		String CODDGS = getCampoTextual(request, "CODDGS");
		String TNOMPLA = getCampoTextual(request, "TNOMPLA");
		Date pPFALTARE = stringToSqlDate(getCampoTextual(request, "FALTARE"));
		Date pPFADMISI = stringToSqlDate(getCampoTextual(request, "FADMISI"));
		BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
		BigDecimal CSISTEM = getCampoNumerico(request, "CSISTEM");
		BigDecimal CCODFON = getCampoNumerico(request, "CCODFON");
		try {

			Map map = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_SET_PLANPENSIONES(CCODPLA, TNOMPLA, pPFALTARE, pPFADMISI, CMODALI,
							CSISTEM, CCODFON, null, null, null, null, null, null, null, null, null, CODDGS, null, null);
			logger.debug("ejecutaPAC_IAX_PENSIONES__F_SET_PLANPENSIONES return: " + map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("GRABAR_OK", "0");
				formdata.put("CCODPLA", map.get("PCCODPLA_OUT"));
			} else {
				formdata.put("GRABAR_OK", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axipen014 Service - m�todo  m_nueva_gestora", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();

		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Modalidades
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(669));
			logger.debug("ejecutaPAC_IAX_LISTVALORES__F_DETVALORES return:" + map);
			listValores.put("modalidades", (List) tratarRETURNyMENSAJES(request, map, false));
			// Sistemas
			Map map2 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(670));
			logger.debug("ejecutaPAC_IAX_LISTVALORES__F_DETVALORES return:" + map2);
			listValores.put("sistemas", (List) tratarRETURNyMENSAJES(request, map2, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper014Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
