package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_JOBS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisjob002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisjob002Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisjob002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisjob002Action thisAction) {
		logger.debug("Axisjob002Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisjob002Action thisAction) {
		logger.debug("Axisjob002Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// Lista retenidos
			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_GET_INTERVALOS();
			logger.debug(map);
			request.setAttribute("LIST_INTERVALOS", (List) tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(map);
			request.setAttribute("BLOQUEADO", (List) tratarRETURNyMENSAJES(request, map));

			// BigDecimal pnumjob = getCampoNumerico(request,"pnumjob");
			BigDecimal pnumjob = isEmpty(getCampoNumerico(request, "pnumjob")) ? getCampoNumerico(request, "CNUMJOB")
					: getCampoNumerico(request, "pnumjob");

			String CMODO = isEmpty(getCampoTextual(request, "modo")) ? getCampoTextual(request, "CMODO")
					: getCampoTextual(request, "modo");

			formdata.put("CMODO", CMODO);

			if (CMODO.equals("EDITAR")) {
				map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_JOBS__F_GET_PROCESO(pnumjob);
				logger.debug(map);
				formdata.put("NUMJOB", pnumjob);
				formdata.put("FUNCION", map.get("PWHAT"));

				formdata.put("CINTERVALO", map.get("PINTERVAL"));
				// formdata.put("CINTERVALO",request.getSession().getAttribute("CINTERVALO"));
				formdata.put("CBLOQUEADO", map.get("PBROKEN"));

				logger.debug("--- ponemos la fecha:" + map.get("PBROKEN").toString());
				if (!isEmpty(map.get("PBROKEN")) && map.get("PBROKEN").toString().equals("0")) {
					logger.debug("ponemos la fecha");
					formdata.put("PFECHA", map.get("PNEXTDATE"));
					formdata.put("PHORA", map.get("PHORA"));

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_altajob(HttpServletRequest request, Axisjob002Action thisAction) {
		logger.debug("Axisjob002Service m_altajob");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			String FUNCION = getCampoTextual(request, "FUNCION");
			java.sql.Date PFECHA = null;
			String FECHATOT = getCampoTextual(request, "PFECHA") + " " + getCampoTextual(request, "PHORA");
			// PFECHA = AxisBaseService.stringToSqlDate(FECHATOT);
			PFECHA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "PFECHA"));
			String CINTERVALO = getCampoTextual(request, "CINTERVALO");
			BigDecimal CBLOQUEADO = getCampoNumerico(request, "CBLOQUEADO");

			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_SET_ALTAPROCESO(FUNCION, FECHATOT, CINTERVALO, CBLOQUEADO);
			logger.debug(map);

			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob002Service - m�todo m_altajob", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_modificarjob(HttpServletRequest request, Axisjob002Action thisAction) {
		logger.debug("Axisjob002Service m_modificarjob");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal pnumjob = isEmpty(getCampoNumerico(request, "NUMJOB"))
					? getCampoNumerico(request, "NUMJOBhidden")
					: getCampoNumerico(request, "NUMJOB");
			String FUNCION = isEmpty(getCampoTextual(request, "FUNCION")) ? getCampoTextual(request, "FUNCIONhidden")
					: getCampoTextual(request, "FUNCION");
			java.sql.Date PFECHA = null;
			String FECHATOT = getCampoTextual(request, "PFECHA") + " " + getCampoTextual(request, "PHORA");
			// PFECHA = AxisBaseService.stringToSqlDate(FECHATOT);
			String CINTERVALO = getCampoTextual(request, "CINTERVALO");
			BigDecimal CBLOQUEADO = getCampoNumerico(request, "CBLOQUEADO");

			request.getSession().setAttribute("CINTERVALO", CINTERVALO);

			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_SET_MODPROCESO(pnumjob, FUNCION, FECHATOT, CINTERVALO, CBLOQUEADO);
			logger.debug(map);

			request.setAttribute("ERROR", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob002Service - m�todo m_altajob", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
