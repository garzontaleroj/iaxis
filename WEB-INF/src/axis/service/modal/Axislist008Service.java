
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axislist008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axislist008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de gestores.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetEmpGestores(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal pEMPRESA = this.getCampoNumerico(request, "EMPRESA");
		Map m;
		if ((pEMPRESA != null) && (pEMPRESA.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(pEMPRESA);
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(new BigDecimal(0));
		}

		logger.debug(m);
		List gestores = (List) tratarRETURNyMENSAJES(request, m, false);

		return gestores;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de formatos de in
	 * informe.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetGesFormatos(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal pGESTOR = this.getCampoNumerico(request, "GESTOR");
		Map m;
		if ((pGESTOR != null) && (pGESTOR.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(pGESTOR);
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(new BigDecimal(0));
		}

		logger.debug(m);
		List formatos = (List) tratarRETURNyMENSAJES(request, m, false);

		return formatos;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axislist008Action thisAction) {
		logger.debug("Axislist008Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio axislist008Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Comentarios
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axislist008Action thisAction) {
		logger.debug("Axislist008Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal EMPRESA = getCampoNumerico(request, "EMPRESA");
			String GESTOR = getCampoTextual(request, "GESTOR");
			// Lista empresas
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);

			List empresas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("EMPRESAS", empresas);

			if (empresas.size() == 1) {
				formdata.put("EMPRESA", ((HashMap) empresas.get(0)).get("CEMPRES"));
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA((BigDecimal) formdata.get("EMPRESA"));
				List gestores = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("GESTORES", gestores);
			}

			// Lista de meses
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();

			List meses = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("MESES", meses);

			if (meses.size() == 1) {
				formdata.put("MES", ((HashMap) meses.get(0)).get("CATRIBU"));
			}

			// Lista de dias
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIAS();

			List dias = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("DIAS", dias);

			if (meses.size() == 1) {
				formdata.put("DIA", ((HashMap) dias.get(0)).get("CATRIBU"));
			}

			// Lista fija para error

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPROCESOERR();
			logger.debug(map);

			List errores = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("ERRORES", errores);

			if (errores.size() == 1) {
				formdata.put("ERROR", ((HashMap) errores.get(0)).get("CATRIBU"));
			}

			if (EMPRESA != null) {
				map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA);
				List gestores = (List) tratarRETURNyMENSAJES(request, map);
				request.setAttribute("GESTORES", gestores);

				if (GESTOR != null) {
					map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(new BigDecimal(GESTOR));
					List formatos = (List) tratarRETURNyMENSAJES(request, map);
					request.setAttribute("FORMATOS", formatos);
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist008Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de gestores por Ajax.
	 * 
	 * @see buscaGESTORES
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_gestores(HttpServletRequest request) {
		logger.debug("Axislist008Service m_ajax_busqueda_gestores");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "EMPRESA"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetEmpGestores(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist008Service - m�todo m_ajax_busqueda_gestores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de formatos por Ajax.
	 * 
	 * @see buscaFORMATOS
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_formatos(HttpServletRequest request) {
		logger.debug("Axislist008Service m_ajax_busqueda_formatos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "GESTOR"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetGesFormatos(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist008Service - m�todo m_ajax_busqueda_formatos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}
}