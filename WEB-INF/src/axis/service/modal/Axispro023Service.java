package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro023Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axispro023Service extends AxisBaseService {
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
		logger.debug("Axispro023Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map persistentData = new HashMap();

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			persistentData.put("CTIPO", CTIPO);
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			persistentData.put("FINICIO", FINICIO);

			BigDecimal NDESDE = null;
			try {
				NDESDE = new BigDecimal(getCampoTextual(request, "NDESDE")); // No utilizo getCampoNumerico porque no
																				// quiero quitar los puntos
			} catch (Exception e) {
			}

			formdata.put("NCODINT", NCODINT);
			formdata.put("CTIPO", CTIPO);
			formdata.put("FINICIO", FINICIO);
			formdata.put("NDESDE", NDESDE);

			logger.debug("NCODINT = " + NCODINT);
			logger.debug("CTIPO   = " + CTIPO);
			logger.debug("FINICIO = " + FINICIO);
			logger.debug("NDESDE = " + NDESDE);

			if (!isEmpty(NCODINT)) {
				String TNCODINT = (String) tratarRETURNyMENSAJES(request,
						pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_DESCRIPNCODINT(NCODINT));
				logger.debug("NCODINT = " + NCODINT);
				formdata.put("TNCODINT", TNCODINT);
			}

			/* Carga valores pantalla */
			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_GETREG_INTERTECMOVDET(NCODINT, CTIPO, FINICIO, NDESDE);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map)) {
				formdata.put("NHASTA", map.get("PNHASTA"));
				formdata.put("NINTTEC", map.get("PNINTTEC"));
			}

			request.getSession().setAttribute("DATTECN_PersistentData", persistentData);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro023Service - m�todo m_form", e);
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
		logger.debug("Axispro023Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_MNTPROD pac_iax_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map persistentData = (Map) request.getSession().getAttribute("DATTECN_PersistentData");

			BigDecimal NCODINT = getCampoNumerico(request, "NCODINT");
			BigDecimal CTIPO = (BigDecimal) persistentData.get("CTIPO");
			java.sql.Date FINICIO = (java.sql.Date) persistentData.get("FINICIO");

			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
			BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
			BigDecimal NINTTEC = getCampoNumerico(request, "NINTTEC");

			Map map = pac_iax_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_INTERTECMOVDET(NCODINT, CTIPO, FINICIO, NDESDE,
					NHASTA, NINTTEC);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro023Service - m�todo m_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
