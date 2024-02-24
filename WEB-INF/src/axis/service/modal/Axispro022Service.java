package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro022Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro022Service extends AxisBaseService {
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
		logger.debug("Axispro022Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap<String, BigDecimal> persistentData = new HashMap<String, BigDecimal>();

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = isEmpty(getCampoNumerico(request, "CTIPO")) ? getCampoNumerico(request, "NCTIPO")
					: getCampoNumerico(request, "CTIPO");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			String MODO = getCampoTextual(request, "MODO");

			BigDecimal CTRAMTIP = isEmpty(getCampoNumerico(request, "CTRAMTIP"))
					? getCampoNumerico(request, "NCTRAMTIP")
					: getCampoNumerico(request, "CTRAMTIP");

			formdata.put("NCODINT", NCODINT);
			formdata.put("CTIPO", CTIPO);
			formdata.put("FINICIO", FINICIO);
			formdata.put("MODO", MODO);

			if (MODO.equals(new String("NUEVO_TRAMO"))) {
				logger.debug("---> NUEVO_TRAMO");
				formdata.put("CTRAMTIP", CTRAMTIP);
			}

			if (!isEmpty(CTIPO))
				persistentData.put("CTIPO", CTIPO);

			logger.debug("NCODINT = " + NCODINT);
			logger.debug("CTIPO   = " + CTIPO);
			logger.debug("FINICIO = " + FINICIO);

			if (!isEmpty(NCODINT)) {
				String TNCODINT = (String) tratarRETURNyMENSAJES(request,
						pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_DESCRIPNCODINT(NCODINT));
				logger.debug("NCODINT = " + NCODINT);
				formdata.put("TNCODINT", TNCODINT);
			}

			/* Carga valores pantalla */
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GETREG_INTERTECMOV(NCODINT, CTIPO, FINICIO);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map)) {
				formdata.put("FFIN", map.get("PFFIN"));
				BigDecimal CTRAMTIPO = (BigDecimal) map.get("PCTRAMTIP");

				if (!isEmpty(CTRAMTIPO)) {
					formdata.put("CTRAMTIP", CTRAMTIPO);
					persistentData.put("CTRAMTIP", CTRAMTIPO);
				}

			}

			request.getSession().setAttribute("DATTECN_PersistentData", persistentData);

			/* Carga LISTVALORES */
			Map LISTVALORES = new HashMap();
			formdata.put("LISTVALORES", LISTVALORES);
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPINTERES();
			logger.debug(map);
			LISTVALORES.put("LSTTIPINTERES", (List<Map>) tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CTRAMTIP();
			logger.debug(map);
			LISTVALORES.put("LSTCTRAMTIP", (List<Map>) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_form", e);
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
	 */
	@SuppressWarnings("all")
	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axispro022Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map<String, BigDecimal> persistentData = (Map<String, BigDecimal>) request.getSession()
					.getAttribute("DATTECN_PersistentData");

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = isEmpty(getCampoNumerico(request, "CTIPO")) ? getCampoNumerico(request, "NCTIPO")
					: getCampoNumerico(request, "CTIPO");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			java.sql.Date FFIN = stringToSqlDate(getCampoTextual(request, "FFIN"));
			BigDecimal CTRAMTIP = isEmpty(getCampoNumerico(request, "CTRAMTIP"))
					? getCampoNumerico(request, "NCTRAMTIP")
					: getCampoNumerico(request, "CTRAMTIP");

			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_INTERTECMOV(NCODINT, CTIPO, FINICIO, FFIN,
					CTRAMTIP);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map);

			BigDecimal NDESDE = null;
			BigDecimal NHASTA = null;
			BigDecimal NINTTEC = null;

			for (int i = 0; i < 1000; i++) {

				NDESDE = getCampoNumerico(request, "NDESDE_" + i);
				logger.debug("---> NDESDE:" + NDESDE + " i:" + i);
				if (isEmpty(NDESDE))
					break;

				NHASTA = getCampoNumerico(request, "NHASTA_" + i);
				NINTTEC = getCampoNumerico(request, "NINTTEC_" + i);

				map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_INTERTECMOVDET(NCODINT, CTIPO, FINICIO, NDESDE,
						NHASTA, NINTTEC);
				logger.debug(map);

			}

			if (map.get("RETURN").equals(new BigDecimal(0)))
				formdata.put("OK", 0);
			else
				formdata.put("OK", 1);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro022Service - m�todo m_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");

			/*
			 * try { NDESDE = new BigDecimal(getCampoTextual(request, "NDESDE")); // No
			 * utilizo getCampoNumerico porque no quiero quitar los puntos } catch
			 * (NumberFormatException nfe) { NDESDE = null; }
			 */

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
