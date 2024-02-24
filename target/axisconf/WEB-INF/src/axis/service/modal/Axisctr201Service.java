package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi004Action;
import axis.mvc.control.modal.Axisctr201Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr201Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr201Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr201Action thisAction) {
		logger.debug("Axisctr201Service m_init");
		try {
			this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr201Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr201Action thisAction) {
		logger.debug("Axisctr201Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.cargaListas(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr201Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = new HashMap();
		Map listValores = new HashMap();

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
		logger.debug(map);
		listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo de documento
		BigDecimal TIDENTI = getCampoNumerico(request, "TPERSONA");
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
		logger.debug(map);
		listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800040));
		logger.debug(map);
		listValores.put("claseList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800048));
		logger.debug(map);
		listValores.put("tipoList", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listValores", listValores);
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

	@SuppressWarnings("all")
	public void m_ajax_actualiza_tipo(HttpServletRequest request) {
		logger.debug("Axisctr201Service m_ajax_actualiza_tipo");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			BigDecimal CEMPRES = usuario.getCempres();
			BigDecimal CLASELISTA = getCampoNumerico(request, "CLASELISTA");

			Map map = this.dbGetTipo(request, usuario, CEMPRES, CLASELISTA);

			logger.debug("------- Nuevos valores combos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr201Service - m�todo m_ajax_actualiza_tipo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private Map dbGetTipo(HttpServletRequest request, UsuarioBean usuario, BigDecimal CEMPRES, BigDecimal CATRIBU)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(CEMPRES, new BigDecimal(800040), CATRIBU,
						new BigDecimal(800048));
		logger.debug("Map de contratos ------------------------------------------------------->" + m);
		return m;
	}

}
