package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper018Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisper018Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = isEmpty(getCampoNumerico(request, "SPERSONselected"))
					? getCampoNumerico(request, "SPERSON")
					: getCampoNumerico(request, "SPERSONselected");
			BigDecimal NANO = getCampoNumerico(request, "NANOselected");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTEselected");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug(NANO);

			// if (!isEmpty(NANO)){
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INICIALIZA_OBIRPF(SPERSON, CAGENTE, NANO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			logger.debug("SPERSON-->" + SPERSON);
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_OBJETOIRPF();
			logger.debug(map);
			BigDecimal retorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (retorn.intValue() == 0) {

				HashMap PIRPF = (HashMap) map.get("PIRPF");

				if (isEmpty(PIRPF.get("SPERSON")))
					PIRPF.put("SPERSON", SPERSON);

				formdata.putAll((Map) map.get("PIRPF"));
			}

			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper018Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
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

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Lista tipo de cuentas

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTGRADOMINUSVALIA();
			logger.debug(map);
			listValores.put("lstgraumin", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTSITFAM();
			logger.debug(map);
			listValores.put("lstsitfam", (List) tratarRETURNyMENSAJES(request, map));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONselected");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTEselected");

			BigDecimal NANO = (isEmpty(getCampoNumerico(request, "NANOselected"))) ? getCampoNumerico(request, "NANO")
					: getCampoNumerico(request, "NANOselected");

			logger.debug(NANO);

			ArrayList listanyos = new ArrayList();
			HashMap PNANOS = new HashMap();
			PNANOS.put("NANO", NANO);
			listanyos.add(PNANOS);

			listValores.put("lstanys", listanyos);

			if (!isEmpty(SPERSON) && isEmpty(NANO)) {
				map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_ANYSIRPF(SPERSON, CAGENTE);
				logger.debug(map);
				listValores.put("lstanys", map.get("PNANOS"));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar la cuenta corriente de la persona.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_grabar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper018Service m_grabar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONselected");
			BigDecimal CAGENTE = (isEmpty(getCampoNumerico(request, "CAGENTE")))
					? getCampoNumerico(request, "CAGENTEselected")
					: getCampoNumerico(request, "CAGENTE");
			BigDecimal NANO = (isEmpty(getCampoNumerico(request, "NANO"))) ? getCampoNumerico(request, "NANOselected")
					: getCampoNumerico(request, "NANO");
			BigDecimal CSITFAM = getCampoNumerico(request, "CSITFAM");
			String CNIFCON = getCampoTextual(request, "CNIFCON");
			BigDecimal CGRADO = getCampoNumerico(request, "CGRADO");
			BigDecimal CAYUDA = null;
			BigDecimal IPENSION = getCampoNumerico(request, "IPENSION");
			BigDecimal IANUHIJOS = getCampoNumerico(request, "IANUHIJOS");
			BigDecimal PROLON = getCampoNumerico(request, "PROLON");
			BigDecimal RMOVGEO = getCampoNumerico(request, "RMOVGEO");

			BigDecimal CPAGO = getCampoNumerico(request, "CPAGO");
			java.sql.Date FMOVGEO = stringToSqlDate(getCampoTextual(request, "FMOVGEO"));

			if (RMOVGEO == null)
				RMOVGEO = new BigDecimal(0);
			if (PROLON == null)
				PROLON = new BigDecimal(0);
			if (CPAGO == null)
				CPAGO = new BigDecimal(0);

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_IRPF(SPERSON, CAGENTE, NANO, CSITFAM, CNIFCON,
					CGRADO, CAYUDA, IPENSION, IANUHIJOS, PROLON, RMOVGEO, FMOVGEO, CPAGO);
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map)))
				request.setAttribute("grabarOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.m_grabar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo para Eliminar un registro de decendientes
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_eliminarDescen(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper018Service m_eliminarDescen");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONselected");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTEselected");
			BigDecimal NANO = (isEmpty(getCampoNumerico(request, "NANO"))) ? getCampoNumerico(request, "NANOselected")
					: getCampoNumerico(request, "NANO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			formdata.put("NANO", NANO);

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_OBJETOIRPFDESCEN(SPERSON, CAGENTE, NANO, NORDEN);
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				logger.debug(map);

				request.setAttribute("borratOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.m_eliminarDescen", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo para Eliminar un registro de mayores
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_eliminarMayor(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper018Service m_eliminarMayor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSONselected");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTEselected");
			BigDecimal NANO = (isEmpty(getCampoNumerico(request, "NANO"))) ? getCampoNumerico(request, "NANOselected")
					: getCampoNumerico(request, "NANO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			formdata.put("NANO", NANO);

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_DEL_OBJETOIRPFMAYOR(SPERSON, CAGENTE, NANO, NORDEN);
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				logger.debug(map);

				request.setAttribute("borratOK", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.m_eliminarMayor", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo para Eliminar un registro de mayores
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_ActualitzarDisplays(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper018Service m_eliminarMayor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_OBJETOS_ASC_DESC();
			logger.debug(map);
			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {
				formdata.put("MAYORES", map.get("PIRPFMAYORES"));
				formdata.put("DESCENDIENTES", map.get("PIRPFDESCEN"));
				logger.debug("1-->" + formdata.get("NANOselected"));
				logger.debug("2-->" + formdata.get("NANO"));

				try {

					if (isEmpty(formdata.get("NANO")))
						formdata.put("NANO", new BigDecimal(String.valueOf(formdata.get("NANOselected"))));

				} catch (Exception e) {
					logger.debug("cap any seleccionat");
				}

			}

			this.cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper018Service.m_eliminarMayor", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
