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
import axis.mvc.control.modal.Axisper028Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper028Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper028Action thisAction) {
		logger.debug("Axisper028Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

			// if (!isEmpty(getCampoTextual(request, "CMODCON")) &&
			// isEmpty(getCampoTextual(request, "TTIPCON")))
			// cargarPersona(request, thisAction, usuario, formdata);

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			String MODO = getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);
			formdata.put("SPERSON", SPERSON);
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("CDOMICI", CDOMICI);
			formdata.put("NORDEN", NORDEN);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION_AUT(SPERSON, CAGENTE, CDOMICI, NORDEN);
			logger.debug("---> direccion:" + m);
			tratarRETURNyMENSAJES(request, m);
			HashMap mm = (HashMap) m.get("OBDIRECCION_AUT");
			ArrayList d = new ArrayList();
			d.add(mm);

			formdata.put("CESTADO", mm.get("CESTADO"));
			formdata.put("FAUTORIZ", mm.get("FAUTORIZ"));
			formdata.put("CUSUAUT", mm.get("CUSUAUT"));
			formdata.put("TOBSERVA", mm.get("TOBSERVA"));
			formdata.put("DIRECCION", d);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper028Service.m_form", e);
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

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper028Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// lista tipos contactos

			Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800072));
			logger.debug(map);
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper028Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @return BigDecimal Indicando si todo ha ido bien o no.
	 * @throws Exception
	 */
	public void m_guardar(HttpServletRequest request, Axisper028Action thisAction) {
		logger.debug("Axisper028Service m_grabarContactoPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			String TOBSERVA = getCampoTextual(request, "TOBSERVA");

			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_DIRECCION_AUT(SPERSON, CAGENTE, CDOMICI, NORDEN,
					CESTADO, TOBSERVA);
			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);

			BigDecimal ok = (BigDecimal) m.get("RETURN");
			logger.debug("---> ok:" + ok);
			if (ok.equals(new BigDecimal(0)))
				formdata.put("OK", "ok");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper028Service.m_grabarContactoPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}

	}

}
