package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_EMPLEADOS_REPRESENT;
import axis.mvc.control.axis.Axisper034Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisper034Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/*****************************************
	 * W****** M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public void m_init(HttpServletRequest request, Axisper034Action thisAction) {
		logger.debug("Axisper034Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper034Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisper034Action thisAction) {
		logger.debug("Axisper034Service m_form");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper034Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisper034Action thisAction) {
		logger.debug("Axisper034Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_EMPLEADOS_REPRESENT pac_iax_empleados_represent = new PAC_IAX_EMPLEADOS_REPRESENT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			if (formdata.get("paginar") == null) {

				BigDecimal psperson = getCampoNumerico(request, "SPERSON");
				BigDecimal pctipo = getCampoNumerico(request, "CTIPO");
				BigDecimal pcsubtipo = getCampoNumerico(request, "CSUBTIPO");
				BigDecimal pccargo = getCampoNumerico(request, "CCARGO");
				BigDecimal pccanal = getCampoNumerico(request, "CCANAL");

				Map map = pac_iax_empleados_represent.ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADOS(psperson,
						pctipo, pcsubtipo, pccargo, pccanal);
				logger.debug("-->empleados:" + map);
				tratarRETURNyMENSAJES(request, map);
				// formdata.put("listasEmp",tratarRETURNyMENSAJES(request,map));
				request.getSession().setAttribute("listasEmp", tratarRETURNyMENSAJES(request, map));

			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("Axiscomi004 paginando");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper034Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_borrar(HttpServletRequest request, Axisper034Action thisAction) {
		logger.debug("Axisper034Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_EMPLEADOS_REPRESENT pac_iax_empleados_represent = new PAC_IAX_EMPLEADOS_REPRESENT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal psperson = getCampoNumerico(request, "SPERSON");

			Map map = pac_iax_empleados_represent.ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_DEL_EMPLEADO(psperson);
			logger.debug("-->borrado:" + map);
			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			} else
				formdata.put("OK", 1);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper034Service - m�todo m_borrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
