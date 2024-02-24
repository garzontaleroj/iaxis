//Revision:# WMLwF8kBKedCefUMRWP/Sg== #
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
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.modal.Axisctr014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr014Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr014Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisctr014Action thisAction) {
		log.debug("Axisctr014Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			request.getSession().removeAttribute("axisctr014_listaAgentes");
			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */

			/* LSTTIPOAGENTE */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			log.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			log.debug("PARTNER:" + PARTNER);
			formdata.put("PARTNER", PARTNER);

			BigDecimal ctipage_rotulo = getCampoNumerico(request, "CTIPAGE");

			if (!isEmpty(ctipage_rotulo)) {
				PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map2 = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
				log.debug(map2);
				ArrayList tipos = (ArrayList) tratarRETURNyMENSAJES(request, map2);
				Map tipo;
				String titulo = null;
				for (int i = 0; i <= tipos.size(); i++) {

					tipo = (Map) tipos.get(i);
					if (ctipage_rotulo.equals(tipo.get("CTIPAGE"))) {
						titulo = (String) tipo.get("DESCRIP");
						break;
					}
				}

				request.setAttribute("lit_producto", titulo);
			}

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
	 * axisctr014_listaAgentes.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_agente(HttpServletRequest request, Axisctr014Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String lit_producto = getCampoTextual(request, "lit_producto");
			request.setAttribute("lit_producto", lit_producto);

			// Recuperar persona a buscar
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			// String CAGENTE = getCampoTextual(request, "CAGENTE");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CONDICION = getCampoTextual(request, "CONDICION");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr014_listaAgentes");
				// HashMap map = new
				// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(NNUMIDE,
				// NOMBRE,CAGENTE,new BigDecimal(1) );
				HashMap map = null;
				//post-190 bjhb inicio 13-12-2022
                if (PARTNER != null)
					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE,
									new BigDecimal(1), CONDICION, TIPAGENTE, PARTNER);
				else {
					
					if (!isEmpty(CONDICION) && CONDICION.compareTo("CORRETAJE_TODOS_TIPAGE_4") == 0) {
						map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE,
										new BigDecimal(2), CONDICION, TIPAGENTE);
					}else {
						map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE,
										new BigDecimal(1), CONDICION, TIPAGENTE);
					}
				}//post-190 bjhb fin 13-12-2022

				log.debug(map);
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
				request.getSession().setAttribute("axisctr014_listaAgentes", listaAgentes);
			}
			// recargar combo
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */

			/* LSTTIPOAGENTE */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			log.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
