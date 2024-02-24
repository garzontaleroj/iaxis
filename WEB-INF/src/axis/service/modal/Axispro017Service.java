package axis.service.modal;

import java.math.BigDecimal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro017Action thisAction) {
		logger.debug("Axispro017Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_IMPUESTOSGARAN(SPRODUC, PCACTIVI, PCGARANT);
			logger.debug(map);
			Map OB_IAX_PRODGARIMPUESTOS = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(OB_IAX_PRODGARIMPUESTOS))
				formdata.putAll(OB_IAX_PRODGARIMPUESTOS);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro017Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar(HttpServletRequest request, Axispro017Action thisAction) {

		logger.debug("Axispro017Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.setAttribute("OK", "!OK");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			BigDecimal pcimpcon = new BigDecimal(1);
			BigDecimal pcimpdgs = new BigDecimal(1);
			BigDecimal pcimpips = new BigDecimal(1);
			BigDecimal pcimparb = new BigDecimal(1);
			BigDecimal pcimpfng = new BigDecimal(1);

			if (this.isEmpty(request.getParameter("CIMPCON")))
				pcimpcon = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CIMPDGS")))
				pcimpdgs = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CIMPIPS")))
				pcimpips = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CIMPARB")))
				pcimparb = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CIMPFNG")))
				pcimpfng = new BigDecimal(0);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_IMPUESTOSGARAN(SPRODUC, PCACTIVI, PCGARANT, pcimpcon, pcimpdgs,
							pcimpips, pcimparb, pcimpfng);
			logger.debug(map);

			/*
			 * HashMap mntgaran=(HashMap)this.tratarRETURNyMENSAJES(request, new
			 * PAC_IAX_MNTPROD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
			 * )).ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(SPRODUC, PCACTIVI, PCGARANT));
			 * logger.debug(mntgaran); request.setAttribute("mntgaran", mntgaran);
			 */

			boolean hayunerror = thisAction.maxistipoMENSAJEesERROR(request);
			if (!hayunerror && isEmpty(map.get("MENSAJES")))
				request.setAttribute("OK", "OK");
			else {
				thisAction.guardarMensaje(request, "1000052", new Object[] { map.get("MENSAJES") },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro017Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
