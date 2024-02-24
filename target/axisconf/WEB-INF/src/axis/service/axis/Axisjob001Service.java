package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_JOBS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisjob001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisjob001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisjob001Action thisAction) {
		logger.debug("Axisjob001Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob001Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisjob001Action thisAction) {
		logger.debug("Axisjob001Service m_form");
		try {

			cargarDatosCombos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Lista retenidos
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
		logger.debug(map);
		request.setAttribute("RETENIDO", (List) tratarRETURNyMENSAJES(request, map));

		// Gesti�n de campos y dependencias
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

	}

	public void m_buscarprocesos(HttpServletRequest request, Axisjob001Action thisAction) {
		logger.debug("Axisjob001Service m_buscarprocesos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal pPNUMJOB = getCampoNumerico(request, "NUMJOB");

			java.sql.Date pPFECHADESDE = null;
			java.sql.Date pPFECHAHASTA = null;
			pPFECHADESDE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FDESDE"));
			pPFECHAHASTA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FHASTA"));

			String pNOMBRE = getCampoTextual(request, "FUNCION");

			String pPBLOQUEADO = null;
			BigDecimal retenido = getCampoNumerico(request, "CRETENIDO");
			if (!isEmpty(retenido) && retenido.intValue() == 0)
				pPBLOQUEADO = "N";
			else if (!isEmpty(retenido) && retenido.intValue() == 1)
				pPBLOQUEADO = "Y";
			else
				pPBLOQUEADO = null;
			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_GET_PROCESOS(pPNUMJOB, pPFECHADESDE, pPFECHAHASTA, pPBLOQUEADO, pNOMBRE);

			logger.debug(map);
			request.getSession().setAttribute("listaProcesos", (ArrayList) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob001Service - m�todo m_buscarprocesos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_eliminarjob(HttpServletRequest request, Axisjob001Action thisAction) {
		logger.debug("Axisjob001Service m_eliminarjob");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal pPNUMJOB = getCampoNumerico(request, "PNUMJOB");

			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_ELIMINAR(pPNUMJOB);

			formdata.put("ERROR", map.get("RETURN"));

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob001Service - m�todo m_eliminarjob", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_ejecutajob(HttpServletRequest request, Axisjob001Action thisAction) {
		logger.debug("Axisjob001Service m_ejecutajob");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal pPNUMJOB = getCampoNumerico(request, "PNUMJOB");

			Map map = new PAC_IAX_JOBS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_JOBS__F_EJECUTAR(pPNUMJOB);

			logger.debug(map);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisjob001Service - m�todo m_ejecutajob", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

}
