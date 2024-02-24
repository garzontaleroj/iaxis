package axis.service.axis;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMPANIAS;
import axis.mvc.control.axis.Axismnt015Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axismnt015Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Javier del Rio</a> Fecha:
 *         10/07/2012 PROP�SITO: Mantenimiento de compa�ias
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 10/07/2012
 *         JRB 1. Creaci�n de la pantalla. Bug.22122
 */
public class Axismnt015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axismnt015Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismnt015Action thisAction) {
		logger.debug("Axismnt015Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		try {

			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS();
			logger.debug(map);

			List listaCompanias = (List) tratarRETURNyMENSAJES(request, map, false);

			request.setAttribute("listaCompanias", listaCompanias);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt015Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
