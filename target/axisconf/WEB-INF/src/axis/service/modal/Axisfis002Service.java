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
import axis.mvc.control.modal.Axisfis002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

/**
 * Axisfis002Service.java
 * 
 * @author <a href="mailto:icanada@csi-ti.com">Ivan Canada</a>
 */
public class Axisfis002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisfis002Action thisAction) {
		logger.debug("Axisfis002Service m_init");
		try {
			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisfis002Action thisAction) {
		logger.debug("Axisfis002Service m_form");
		try {
			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void recargarListas(HttpServletRequest request, Axisfis002Action thisAction) {
		logger.debug("Axisfis002Service recargarListas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1082));
			logger.debug(map);
			LISTVALORES.put("LSTTIPFACTURA", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1083));
			logger.debug(map);
			LISTVALORES.put("LSTESTADO", tratarRETURNyMENSAJES(request, map));

			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(52));
			logger.debug(map);
			LISTVALORES.put("LSTCAUTORIZADA", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal AuxCempres;

			if (isEmpty(CEMPRES))
				AuxCempres = usuario.getCempres();
			else
				AuxCempres = CEMPRES;

			formdata.put("CEMPRES", AuxCempres);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis002Service - m�todo m_init", e);
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
		logger.debug("Axisfis002Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
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

	public void m_buscar(HttpServletRequest request, Axisfis002Action thisAction) {
		logger.debug("Axisfis002Service m_buscar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String NIF = getCampoTextual(request, "NIF");
			String NFACTURA = getCampoTextual(request, "NFACTURA");

			Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			Date FFIN = stringToSqlDate(getCampoTextual(request, "FFIN"));

			BigDecimal TIPFACTURA = getCampoNumerico(request, "list_TIPFACTURA");
			BigDecimal ESTADO = getCampoNumerico(request, "list_ESTADO");
			BigDecimal CAUTORIZADA = getCampoNumerico(request, "CAUTORIZADA");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_GET_FACTURAS(CEMPRES, CAGENTE, NIF, NFACTURA, FINICIO, FFIN, ESTADO,
							TIPFACTURA, CAUTORIZADA);
			logger.debug("Lista de Cobradores ---> " + map);

			BigDecimal num = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute("listaFacturas", map.get("PTFACTURAS"));
			BigDecimal INDICE = getCampoNumerico(request, "INDICE");
			logger.debug("INDICE------------>" + INDICE);
			if (isEmpty(INDICE))
				formdata.put("INDICE", 0);

			this.recargarListas(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
