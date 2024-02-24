package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FACTURAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisfis004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisfis004Service.java
 * 
 * @author <a href="mailto:icanada@csi-ti.com">Ivan Canada</a>
 */
public class Axisfis004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisfis004Action thisAction) {
		logger.debug("Axisfis004Service m_init");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			formdata.put("NEWNFACT", "");
			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis004Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisfis004Action thisAction) {
		logger.debug("Axisfis004Service m_form");
		try {
			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void recargarListas(HttpServletRequest request, Axisfis004Action thisAction) {
		logger.debug("Axisfis004Service recargarListas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			LISTVALORES.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1140));
			logger.debug(map);
			LISTVALORES.put("LSTCTIPDOC", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal AuxCempres;

			if (isEmpty(CEMPRES))
				AuxCempres = usuario.getCempres();
			else
				AuxCempres = CEMPRES;

			formdata.put("CEMPRES", AuxCempres);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis004Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisfis004Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			Map m2 = (Map) this.actualizaNroLiquida(request, CAGENTE);
			m.put("NLIQMENS", m2);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	private Map actualizaNroLiquida(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapNliq = new HashMap();

		// Cargar Agente de la BD
		Map nliq = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			mapNliq = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_GET_LISTNLIQMEN(new BigDecimal(CAGENTE));
			logger.debug(mapNliq);
			List nliqs = (List) mapNliq.get("RETURN");
			request.getSession().setAttribute("axisctr_nliqs", nliqs);
			if (!isEmpty(mapNliq.get("RETURN")))
				nliq = (Map) nliqs.get(0);
		}

		return mapNliq;
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisfis004Action thisAction) {
		logger.debug("Axisfis004Service m_buscar");
		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Date FFACT = stringToSqlDate(getCampoTextual(request, "FFACT"));
			BigDecimal CTIPIVA = getCampoNumerico(request, "CTIPIVA");
			String NFACT = getCampoTextual(request, "NFACT");
			BigDecimal CTIPDOC = getCampoNumerico(request, "CTIPDOC");
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			BigDecimal NLIQMEN = getCampoNumerico(request, "NLIQMEN");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_SET_FACTURA(CEMPRES, CAGENTE, FFACT, new BigDecimal(0),
							new BigDecimal(0), CTIPIVA, NFACT, CTIPDOC, IDDOCGEDOX, NLIQMEN);
			logger.debug("SET FACTURA ---> " + map);

			BigDecimal num = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("NEWNFACT", map.get("ONFACT"));
			formdata.put("SFACT", map.get("OSFACT"));

			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
