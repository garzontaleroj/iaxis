
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr158Service.java
 * 
 * @since Java 5.0
 */
public class Axisctr158Service extends AxisBaseService {
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
		logger.debug("Axisctr158Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();
			// Lista Empresas
			Map mapEmp = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(mapEmp);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, mapEmp));
			formdata.put("LISTVALORES", LISTVALORES);

			// Per a la carrega en val, quan nom�s hi ha una empresa preseleccionada
			if (((ArrayList) LISTVALORES.get("LSTEMPRESAS")).size() == 1) {
				ArrayList llistaEmp = (ArrayList) LISTVALORES.get("LSTEMPRESAS");
				HashMap hashEmp = (HashMap) llistaEmp.get(0);
				BigDecimal CEMPRES = (BigDecimal) hashEmp.get("CEMPRES");
				formdata.put("CEMPRES2", CEMPRES);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr158Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			// Gesti�n de campos y dependencias
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/

	/*********************************************************************************************************************/
	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request) {
		logger.debug("Axisctr158Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Date PINICOBERTURA = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			Date PFINCOBERTURA = stringToSqlDate(getCampoTextual(request, "FFIN"));
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES)) {
				CEMPRES = new BigDecimal((String) formdata.get("CEMPRES2"));
			}

			Map map = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_OBTENER_TRASPASOS(PINICOBERTURA, PFINCOBERTURA, CEMPRES);
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// ecg 20100216 AXIS1633 Bug 13029 Recuperar y bajar fichero generado
			logger.debug("retorn exec, map :: " + codiRetorn + "," + map);
			formdata.putAll(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr158Service - m�todo m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}
}
