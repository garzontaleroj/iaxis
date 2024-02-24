package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENSEGU;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr056Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr056Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr056Action thisAction) {
		logger.debug("Axisctr056Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr056Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr056Action thisAction) {
		logger.debug("Axisctr056Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_COMMON pac_iax_common = new PAC_IAX_COMMON(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			cargarDatosCombos(request, thisAction);

			String CUSUARI = this.getCampoTextual(request, "CUSUARI");

			if (isEmpty(CUSUARI)) {
				Map m = pac_iax_common.ejecutaPAC_IAX_COMMON__F_GET_CXTUSUARIO();
				formdata.put("CUSUARI", (String) tratarRETURNyMENSAJES(request, m));
			}

			this.configForm(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr056Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request, Axisctr056Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map listValores = new HashMap();
		try {

			// Lista concepto de apuntes

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("LSTCONCEPTOSAPUNTEAGENDA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("LSTESTADOSAPUNTEAGENDA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			logger.debug(map);
			listValores.put("LSTUSUARIOSAGENDA", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr056 cargarDatosCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr056Action thisAction) {
		logger.debug("Axisctr056Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal CTIPREG = getCampoNumerico(request, "CTIPREG");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			Date FAPUNTE = stringToSqlDate(getCampoTextual(request, "FALTA"));
			String USUARI = getCampoTextual(request, "CUSUARI");
			BigDecimal SSEGURO;
			SSEGURO = null;

			Map map = new PAC_IAX_AGENSEGU((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_AGENSEGU__F_GET_CONSULTAAPUNTES(CTIPREG, NPOLIZA, NCERTIF, NLINEA, CESTADO, FAPUNTE,
							USUARI, SSEGURO);

			logger.debug(map);
			request.getSession().setAttribute("LISTAAPUNTESAGENDA", (List) tratarRETURNyMENSAJES(request, map));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr056Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisctr056Action thisAction) {
		logger.debug("Axisctr056Service m_cerrar");
		try {
			request.getSession().removeAttribute("LISTAAPUNTESAGENDA");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr056Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			this.configForm(request, whoami(this));
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
