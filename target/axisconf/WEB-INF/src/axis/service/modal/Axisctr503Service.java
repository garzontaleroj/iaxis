package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONVENIOS_EMP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr503Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr503Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr503Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisctr503Action thisAction) {
		log.debug("Axisctr503Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("axisctr503_listaConvenios");

			/* LSTEMPRESAS */
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			if (isEmpty(SPRODUC)) {
				if (isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC"))) {
					AbstractDispatchAction.topPila(request, "SPRODUC", this.getCampoNumerico(request, "SPROD"));
				}
				SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				request.getSession().setAttribute("SPRODUC", SPRODUC);
			}

			String TDESCRI = getCampoTextual(request, "TDESCRI");

			HashMap mapambitos = null;
			mapambitos = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTAMBITOS(SPRODUC, null);

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
	 * axisctr503_listaConvenios.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda(HttpServletRequest request, Axisctr503Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Recuperar persona a buscar
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			// String CAGENTE = getCampoTextual(request, "CAGENTE");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr503_listaConvenios");
				// HashMap map = new
				// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NNUMIDE,
				// NOMBRE,CAGENTE,new BigDecimal(1) );
				// PAC_IAX_CONVENIOS_EMP.F_GET_LSTCONVEMPVERS
				HashMap map = null;

				map = new PAC_IAX_CONVENIOS_EMP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONVENIOS_EMP__F_GET_LSTCONVEMPVERS(SPRODUC, CPROVIN, TDESCRI, "");

				log.debug("LSTCONVEMPVERS:" + map);

				List T_IAX_CONVEMPVERS = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("axisctr503_listaConvenios", T_IAX_CONVEMPVERS);
			}

			/* LSTEMPRESAS */

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
