package axis.service.modal;

import java.math.BigDecimal;
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
 * Axisage005Service.java 24/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisage005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage005Service m_form");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = getHiddenCampoNumerico(request, "CEMPRES");

			if (!isEmpty(CAGENTE)) {
				if (CAGENTE.equals(request.getSession().getAttribute("RED_DummyCodeAgent")))
					CAGENTE = BigDecimal.ONE;

				PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				/* Cargar histrico red comercial */
				Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_REDCOMERCIAL(CAGENTE, CEMPRES);
				logger.debug(map);

				formdata.put("HISTORICO", tratarRETURNyMENSAJES(request, map));
			}

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTTIPOAGENTE */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOAGENTE", (List<Map>) tratarRETURNyMENSAJES(request, map));

			/* LSTTIPOVISION */
			// map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVISION();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(600));
			logger.debug(map);
			LISTVALORES.put("LSTTIPOVISION", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage005Service - mtodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MTODOS DE ACTUALIZACIN
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una bsqueda del literal de Agente, en funcin de su cdigo, por Ajax.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisage005Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CAGENTE = getHiddenCampoTextual(request, "CAGENTE");
			Map agente = null;

			if (!isEmpty(CAGENTE)) {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE, new BigDecimal(99));
				logger.debug(map);
				List<Map> listAgentes = (List<Map>) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(listAgentes))
					agente = listAgentes.get(0);

				ajax.rellenarPlAContenedorAjax(map);
			}

			ajax.guardarContenidoFinalAContenedorAjax(agente);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage005Service - mtodo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisage005Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CAGENTE = getHiddenCampoNumerico(request, "CAGENTE");
			BigDecimal CEMPRES = getHiddenCampoNumerico(request, "CEMPRES");
			java.sql.Date FECHA = stringToSqlDate(getHiddenCampoTextual(request, "FMOVINI"));
			BigDecimal CTIPAGE = getHiddenCampoNumerico(request, "CTIPAGE");
			BigDecimal CPADRE = getHiddenCampoNumerico(request, "CPADRE");
			BigDecimal CCOMINDT = null; // TODO
			BigDecimal CPREVISIO = getHiddenCampoNumerico(request, "CPERVISIO");
			BigDecimal CPRENIVEL = getHiddenCampoNumerico(request, "CPERNIVEL");
			BigDecimal CAGEIND = getHiddenCampoNumerico(request, "CAGEIND");
			BigDecimal CPOLNIVEL = getHiddenCampoNumerico(request, "CPOLNIVEL");
			BigDecimal CPOLVISIO = getHiddenCampoNumerico(request, "CPOLVISIO");

			BigDecimal CENLACE = getHiddenCampoNumerico(request, "CENLACE");
			BigDecimal CDOMICIAGE = getHiddenCampoNumerico(request, "CDOMICIAGE"); // TCS-7 21/02/2019 AP //IAXIS-2415
																					// 27/02/2019

			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_REDCOMERCIAL(CEMPRES, CAGENTE, FECHA,
					CPADRE, CCOMINDT, CPREVISIO, CPRENIVEL, CAGEIND, CPOLVISIO, CPOLNIVEL, CENLACE, CDOMICIAGE); // IAXIS-2415
																													// 27/02/2019

			logger.debug(map);
			request.setAttribute("grabarOK", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage005Service - mtodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
