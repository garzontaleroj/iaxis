package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONVENIOS_EMP;
import axis.mvc.control.axis.Axisctr504Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisctr504Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr504Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Limpia la antigua lista de agentes de sesi�n, en caso que hubiera, para poder
	 * realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr504Action thisAction) {
		log.debug("Axisctr504Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().removeAttribute("axisctr504_listaConvenios");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			formdata.put("CPROVIN", CPROVIN);

			HashMap mapambitos = null;
			mapambitos = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTAMBITOS(new BigDecimal(2300), null);
			log.debug(mapambitos);
			// formdata.put("LSTAMBITOS", tratarRETURNyMENSAJES(request, mapambitos,
			// false));
			request.getSession().setAttribute("LSTAMBITOS", tratarRETURNyMENSAJES(request, mapambitos, false));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	 * Dado un NOMBRE y/o un NNUMIDE de un Agente, ejecuta la consulta de b�squeda
	 * de Agentes en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisctr504_listaConvenios.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda(HttpServletRequest request, Axisctr504Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar persona a buscar
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			// String CAGENTE = getCampoTextual(request, "CAGENTE");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			String TCODCONV = getCampoTextual(request, "TCODCONV");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");

			if (formdata.get("paginar") == null) {

				request.getSession().removeAttribute("axisctr504_listaConvenios");

				HashMap map = null;

				map = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMP(null, CPROVIN, TDESCRI, TCODCONV);

				log.debug("LSTCONVEMPVERS:" + map);

				List T_IAX_CONVEMPVERS = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("axisctr504_listaConvenios", T_IAX_CONVEMPVERS);

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Procesa la �ltima versi�n activa del convenio (suplemento masivo de cambio de
	 * versi�n para el convenio). Llamamos a PAC_ CONVENIOS_EMP.
	 * F_PROCESO_CAMB_VERSCON(convenio pantalla) en modo diferido.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_procesar(HttpServletRequest request, Axisctr504Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal fileProces = null;

		try {

			String TCODCONV = request.getParameter("TCODCONV");
			formdata.put("TCODCONV", TCODCONV);
			String TDESCRI = getCampoTextual(request, "TDESCRI");

			if (formdata.get("paginar") == null) {

				HashMap proceso = null;
				proceso = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONVENIOS_EMP__F_PROCESO_CAMB_VERSCON(TCODCONV, usuario.getCidioma());
				log.debug(proceso);
				formdata.put("RSLTVERSION", tratarRETURNyMENSAJES(request, proceso, false));
				request.getSession().setAttribute("RSLTVERSION", proceso);

				if (proceso.get("RETURN").equals(new BigDecimal(0))) {
					request.getSession().removeAttribute("axisctr504_listaConvenios");
					String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "111313");
					thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + proceso.get("PSPROCES"), null,
							Constantes.MENSAJE_INFO);
				}

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Cancela la �ltima versi�n activa del convenio (su suplemento masivo de cambio
	 * de versi�n para el convenio). Llamamos a PAC_ CONVENIOS_EMP.
	 * F_PROCESO_ANUL_VERSCON(c�digo convenio pantalla) en modo diferido.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_anular(HttpServletRequest request, Axisctr504Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String TCODCONV = getCampoTextual(request, "TCODCONV");
			String TDESCRI = getCampoTextual(request, "TDESCRI");

			if (formdata.get("paginar") == null) {

				HashMap anular = null;
				anular = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONVENIOS_EMP__F_PROCESO_ANUL_VERSCON(TCODCONV, usuario.getCidioma());
				log.debug(anular);
				formdata.put("RSLTVERSION", tratarRETURNyMENSAJES(request, anular, false));
				request.getSession().setAttribute("RSLTVERSION", anular);

				if (anular.get("RETURN").equals(new BigDecimal(0))) {
					request.getSession().removeAttribute("axisctr504_listaConvenios");
					String literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "111313");
					thisAction.guardarMensaje(request, "verbatim:" + literal + ": " + anular.get("PSPROCES"), null,
							Constantes.MENSAJE_INFO);
				}

			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
