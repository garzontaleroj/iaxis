package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FIC_FORMATOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist009Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axislist009Service extends AxisBaseService {

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
	 * M�todo que llama a la funci�n pl correspondiente a la carga de formatos de in
	 * informe.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetGesFormatos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos formatos:" + getCampoTextual(request, "tipo") + "------------");
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

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axislist009Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axislist009Action thisAction) {
		logger.debug("Axislist009Service m_form");
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
		logger.debug("Axislist009Service m_ajax_busqueda_gestores");
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
			logger.error("Error en el servicio Axislist009Service - m�todo m_ajax_busqueda_gestores", e);
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
		logger.debug("Axislist009Service m_ajax_busqueda_formatos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "GESTOR"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetGesFormatos(request));
			}
			/*
			 * else ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request,
			 * usuario));
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist009Service - m�todo m_ajax_busqueda_formatos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	@SuppressWarnings("all")
	public void m_ejecutar(HttpServletRequest request, Axislist009Action thisAction) {
		logger.debug("Axislist009Service m_ejecutar");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			String EMP = this.getHiddenCampoTextual(request, "EMPRESA");

			BigDecimal EMPRESA = new BigDecimal(EMP);
			String GESTOR = this.getHiddenCampoTextual(request, "TGESTOR");
			String FORMATO = this.getHiddenCampoTextual(request, "FFORMATO");
			String ANIO = this.getHiddenCampoTextual(request, "FANIO");
			BigDecimal NANIO = new BigDecimal(ANIO);

			String MES = this.getHiddenCampoTextual(request, "FMES");
			String DIA = this.getHiddenCampoTextual(request, "DIA");

			if (DIA == null) {
				DIA = "0";
			}

			if (MES == null) {
				MES = "0";
			}

			String GDATO = this.getHiddenCampoTextual(request, "FGDATO");
			String GFORMAT = this.getHiddenCampoTextual(request, "FGFORMAT");

			PAC_IAX_FIC_FORMATOS pacIaxFormatos = new PAC_IAX_FIC_FORMATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			map = pacIaxFormatos.ejecutaPAC_IAX_FIC_FORMATOS__F_GENERA_FORMATOS(EMPRESA, GESTOR, FORMATO, NANIO, MES,
					DIA, GDATO, GFORMAT);

			logger.debug(map);

			tratarRETURNyMENSAJES(request, map);
			formdata.put("EMPRESA", EMPRESA);
			formdata.put("MES", MES);
			formdata.put("DIA", DIA);
			formdata.put("TGESTOR", GESTOR);
			formdata.put("FORMATO", FORMATO);
			formdata.put("GDATO", GDATO);
			formdata.put("GFORMAT", GFORMAT);
			// formdata.put("DIA","1");

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);

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

			if (meses.size() == 1) {
				formdata.put("DIA", ((HashMap) dias.get(0)).get("CATRIBU"));
			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_GESTORESCOMPANIA(EMPRESA);
			List gestores = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("GESTORES", gestores);

			if (gestores.size() == 1) {
				formdata.put("GESTOR", ((HashMap) gestores.get(0)).get("TGESTOR"));

			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_FORMATOSGESTOR(new BigDecimal(GESTOR));
			List formatos = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("FORMATOS", formatos);

			if (formatos.size() == 1) {
				formdata.put("FORMATO", ((HashMap) formatos.get(0)).get("TFORMAT"));
			}

			// this.m_ajax_busqueda_gestores(request);
			// this.m_ajax_busqueda_formatos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
