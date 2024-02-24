package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm051Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm051Service.java
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm051Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisadm051Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm051Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm051Action thisAction) {
		logger.debug("Axisadm051Service m_form");

		try {
			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm051Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarCombos(HttpServletRequest request, Axisadm051Action thisAction) throws Exception {
		logger.debug("Axisadm051Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();
			// Lista Empresas
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiadm051 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_buscar(HttpServletRequest request, Axisadm051Action thisAction) {
		logger.debug("Axisadm051Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CHECKTRASPAS = getCampoNumerico(request, "traspaso_check");

			java.sql.Date FCONTABINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABINI"));
			java.sql.Date FCONTABFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABFIN"));
			java.sql.Date FTRASPASINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASINI"));
			java.sql.Date FTRASPASFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASFIN"));

			java.sql.Date FADMININI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMININI"));
			java.sql.Date FADMINFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMINFIN"));

			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONTABILIDAD_DIARIA(CEMPRES, FCONTABINI, FCONTABFIN,
							FTRASPASINI, FTRASPASFIN, FADMININI, FADMINFIN, CHECKTRASPAS);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				if (!isEmpty(map))
					formdata.put("LISTA_CONT", map.get("PCARTAS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm051Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
