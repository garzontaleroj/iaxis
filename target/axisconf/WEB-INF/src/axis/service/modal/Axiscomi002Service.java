package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi002Action;
import axis.mvc.control.modal.Axiscomi004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axiscomi002Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axiscomi002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscomi002Action thisAction) {
		logger.debug("Axiscomi002Service m_init");
		try {
			this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axiscomi002Action thisAction) {
		logger.debug("Axiscomi002Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.cargaListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");

		Map map = new HashMap();

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1016));
		logger.debug(map);
		request.setAttribute("listaEstados", tratarRETURNyMENSAJES(request, map));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1015));
		logger.debug(map);
		request.setAttribute("listaTipos", tratarRETURNyMENSAJES(request, map));

	}

	public void m_buscar(HttpServletRequest request, Axiscomi004Action thisAction) {
		logger.debug("Axiscomi004Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaComisiones");

				BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
				BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
				String MODO = getCampoTextual(request, "MODO");

				HashMap map = new HashMap();

				// map = new
				// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_SET_OBJ_CUADROCOMISION(CCOMISI,CTIPO,CESTADO,FINIVIG,FFINVIG,MODO);
				// map = new
				// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_GET_OBJ_CUADROCOMISION();

				// ArrayList lista = (ArrayList)tratarRETURNyMENSAJES(request,map,false);

				// request.getSession().setAttribute("listaCuadros",
				// lista);

			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("Axiscomi004 paginando");
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

}
