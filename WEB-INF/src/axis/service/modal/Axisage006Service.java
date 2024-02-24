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
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisage006Service.java 29/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage006Service extends AxisBaseService {
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
		logger.debug("Axisage006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			/* LSTMEDIADOR */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1062));
			logger.debug(map);
			LISTVALORES.put("LSTMEDIADOR", tratarRETURNyMENSAJES(request, map, false));

			/* LSTAGRUPADOR */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1064));
			logger.debug(map);
			LISTVALORES.put("LSTAGRUPADOR", tratarRETURNyMENSAJES(request, map, false));

			/* LSTESTADOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOAGENTE(null, null, null, null);
			logger.debug(map);
			LISTVALORES.put("LSTESTADOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			/* LSTTIPOAGENTE */
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
			logger.debug(map);

			request.getSession().setAttribute("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

			// formdata.put("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

			if ("true".equals(request.getParameter("buscarAlCargar"))) {
				formdata.put("FINICIO", new java.util.Date());
				m_buscar(request);
			}

			formdata.put("CEMPRESA", usuario.getCempres());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage006Service - m�todo m_form", e);
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
		logger.debug("Axisage006Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRESA = getCampoNumerico(request, "CEMPRESA");
			Date FINICIO = stringToSqlDate(getHiddenCampoTextual(request, "FINICIO"));
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NOMAGENTE = getCampoTextual(request, "TAGENTE");
			BigDecimal TIPAGENTE = getCampoNumerico(request, "TIPAGENTE");
			BigDecimal CACTIVO = getCampoNumerico(request, "CACTIVO");
			//
			BigDecimal pctipmed = getCampoNumerico(request, "CTIPMED");
			BigDecimal pagrupador = getCampoNumerico(request, "AGRUPADOR");
			String pnnumide = getCampoTextual(request, "NNUMIDE");
			String pcpostal = getCampoTextual(request, "CPOSTAL");
			BigDecimal ptelefono = getCampoNumerico(request, "TELEFONO");
			String ptnomcom = getCampoTextual(request, "TNOMCOM");
			BigDecimal pfax = getCampoNumerico(request, "FAX");
			String pmail = getCampoTextual(request, "MAIL");
			BigDecimal pcage00 = getHiddenCampoNumerico(request, "CAGENTE_0");
			BigDecimal pcage01 = getHiddenCampoNumerico(request, "CAGENTE_1");
			BigDecimal pcage02 = getHiddenCampoNumerico(request, "CAGENTE_2");
			BigDecimal pcage03 = getHiddenCampoNumerico(request, "CAGENTE_3");
			BigDecimal pcage04 = getHiddenCampoNumerico(request, "CAGENTE_4");
			BigDecimal pcage05 = getHiddenCampoNumerico(request, "CAGENTE_5");
			BigDecimal pcage06 = getHiddenCampoNumerico(request, "CAGENTE_6");
			BigDecimal pcage07 = getHiddenCampoNumerico(request, "CAGENTE_7");
			BigDecimal pcage08 = getHiddenCampoNumerico(request, "CAGENTE_8");
			BigDecimal pcage09 = getHiddenCampoNumerico(request, "CAGENTE_9");
			BigDecimal pcage10 = getHiddenCampoNumerico(request, "CAGENTE_10");
			BigDecimal pcage11 = getHiddenCampoNumerico(request, "CAGENTE_11");
			BigDecimal pcage12 = getHiddenCampoNumerico(request, "CAGENTE_12");
			//
			if (isEmpty(NOMAGENTE)) {
				NOMAGENTE = getHiddenCampoTextual(request, "RSOCIAL");
			}

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(CEMPRESA, FINICIO, CAGENTE,
					NOMAGENTE, TIPAGENTE, CACTIVO, pctipmed, pagrupador, pnnumide, pcpostal, ptelefono, ptnomcom, pfax,
					pmail, pcage00, pcage01, pcage02, pcage03, pcage04, pcage05, pcage06, pcage07, pcage08, pcage09,
					pcage10, pcage11, pcage12);

			logger.debug(map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map, false);

			if (!isEmpty(RETURN)) {
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				formdata.put("LSTAGENTES", RETURN);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage006Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
