package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTOR_FICHEROS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist011Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axislist011Service extends AxisBaseService {
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
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos gestoreess:" + getCampoTextual(request, "tipo") + "------------");
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
	 * Realiza una b�squeda de gestores por Ajax.
	 * 
	 * @see buscaGESTORES
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_gestores(HttpServletRequest request) {
		logger.debug("Axislist011Service m_ajax_busqueda_gestores");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "EMPRESA"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetEmpGestores(request));
			}
			/*
			 * else ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request,
			 * usuario));
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist011Service - m�todo m_ajax_busqueda_gestores", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axislist011Action thisAction) {
		logger.debug("Axislist011Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio axislist011Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axislist011Action thisAction) {
		logger.debug("Axislist011Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
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
				request.setAttribute("INFORMES", gestores);
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

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug(map);

			List meses = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("MESES", meses);

			if (errores.size() == 1) {
				formdata.put("MES", ((HashMap) errores.get(0)).get("CATRIBU"));
			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIAS();
			logger.debug(map);

			List dias = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("DIAS", dias);

			if (errores.size() == 1) {
				formdata.put("DIA", ((HashMap) errores.get(0)).get("CATRIBU"));
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist011Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public void m_generar_ficheros(HttpServletRequest request) {
		logger.debug("Axislist011Service m_generar_fichero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map ajaxResponse = new HashMap();
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal EMPRESA = getCampoNumerico(request, "EMPRESA");
			BigDecimal TGESTOR = getCampoNumerico(request, "TGESTOR");
			formdata.put("TFORMATO", request.getParameter("TFORMATO"));
			String TFORMATO = getCampoTextual(request, "TFORMATO");
			BigDecimal NANIO = getCampoNumerico(request, "NANIO");
			String NMES = getCampoTextual(request, "NMES");
			BigDecimal NDIA = getCampoNumerico(request, "NDIA");
			String PERIODO = getCampoTextual(request, "TPERIOD");
			Map map = new PAC_IAX_GESTOR_FICHEROS(((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)))
					.ejecutaPAC_IAX_GESTOR_FICHEROS__F_GENERAR_FICHEROS(EMPRESA, TGESTOR, TFORMATO, NANIO, NMES, NDIA);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("EMPRESA", EMPRESA);
			formdata.put("MES", NMES);
			formdata.put("DIA", NDIA);
			// formdata.put("INFORME",TGESTOR/*+"/"+TPERIODO*/);
			formdata.put("TGESTOR", TGESTOR);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List empresas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("EMPRESAS", empresas);
			if (empresas.size() == 1) {
				formdata.put("EMPRESA", ((HashMap) empresas.get(0)).get("CEMPRES"));
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
			if (dias.size() == 1) {
				formdata.put("DIA", ((HashMap) dias.get(0)).get("CATRIBU"));
			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA);
			List gestores = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("INFORMES", gestores);
			if (gestores.size() == 1) {
				formdata.put("INFORME", ((HashMap) gestores.get(0)).get("TGESTOR"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio AxisList011 - m�todo m_genberar_ficherodomiciliar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
			// ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
