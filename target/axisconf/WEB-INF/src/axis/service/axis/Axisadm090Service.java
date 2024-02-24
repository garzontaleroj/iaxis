package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

// fin bug 0021662
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CARGA_SPL;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm090Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm090Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm090Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			Map lstValores = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String PRONAME = getCampoTextual(request, "PRONAME");

			this.cargarcombos(request);

			// if (!isEmpty(CAGENTE)) {

			BigDecimal CEMPRES = (BigDecimal) usuario.getCempres();

			// Si la persona CAGENTE1 est� informada recuperamos la lista de p�lizas.

			PAC_IAX_CARGA_SPL pac_iax_carga_spl = new PAC_IAX_CARGA_SPL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_arch = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_GET_CAMPO_SPL(PRONAME);
			ArrayList Lista_Arch = (ArrayList) tratarRETURNyMENSAJES(request, map_arch, false);
			request.setAttribute("map_arch", Lista_Arch);

			Map map_valida = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_GET_VALIDA_SPL(PRONAME);
			ArrayList Lista_valida = (ArrayList) tratarRETURNyMENSAJES(request, map_valida, false);
			request.setAttribute("map_valida", Lista_valida);

			Map map_cab = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_GET_CABECERA_SPL(PRONAME);
			formdata.put("listCab", tratarRETURNyMENSAJES(request, map_cab, false));

			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm090Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarcombos(HttpServletRequest request) {
		logger.debug("Axisadm090Service cargarcombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map listValores = new HashMap();

			// BigDecimal CAGENTE=getCampoNumerico(request, "CAGENTE");
			String PRONAME = getCampoTextual(request, "PRONAME");
			formdata.put("PRONAME", PRONAME);

			PAC_IAX_LISTVALORES pac_iax_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000950));
			Map map1 = pac_iax_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000951));

			logger.debug(map);
			listValores.put("arch", tratarRETURNyMENSAJES(request, map));
			listValores.put("proceso", tratarRETURNyMENSAJES(request, map1));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm093Service - m�todo cargarcombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	public void m_init(HttpServletRequest request, Axisadm090Action thisAction) {
		logger.debug("Axissin06Service m_init");

		try {
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO"); // ALTA-CONSULTA
			request.getSession().setAttribute("CMODO", CMODO);
			if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO"))
					&& isEmpty(AbstractDispatchAction.topPila(request, "CMODO_SIN"))) {
				AbstractDispatchAction.topPila(request, "CMODO_SIN", AbstractDispatchAction.topPila(request, "CMODO"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm090Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public BigDecimal m_avisos(HttpServletRequest request, Axisadm090Action thisAction) {
		logger.debug("Axisadm090Service m_avisos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			formdata.put("PLSTAVISOS", m.get("PLSTAVISOS"));
			return pRETURN;

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin06Service - m�todo m_avisos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_eliminarDefinicion(HttpServletRequest request, Axisadm090Action thisAction) {
		logger.debug("Axisadm090Service m_eliminarDireccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NORDEN = this.getCampoNumerico(request, "PNORDEN");
			String CCAMPO = this.getCampoTextual(request, "PCCAMPO");
			String CTIPCAM = this.getCampoTextual(request, "PCTIPCAM");

			String CDARCHI = getCampoTextual(request, "PRONAME");

			PAC_IAX_CARGA_SPL pac_iax_carga_spl = new PAC_IAX_CARGA_SPL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map del = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_DEL_CAMPO_SPL(CDARCHI, NORDEN, CCAMPO, CTIPCAM);

			// ArrayList Lista_valida = (ArrayList)tratarRETURNyMENSAJES(request,
			// map_valida, false);
			// request.setAttribute("map_valida",Lista_valida);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper009Service.m_eliminarDireccion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_eliminarValidacion(HttpServletRequest request, Axisadm090Action thisAction) {
		logger.debug("Axisadm090Service m_eliminarDireccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String CDARCHI = getCampoTextual(request, "PRONAME");

			PAC_IAX_CARGA_SPL pac_iax_carga_spl = new PAC_IAX_CARGA_SPL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map delva = pac_iax_carga_spl.ejecutaPAC_IAX_CARGA_SPL__F_DEL_VALIDA_SPL(CDARCHI);

			// ArrayList Lista_valida = (ArrayList)tratarRETURNyMENSAJES(request,
			// map_valida, false);
			// request.setAttribute("map_valida",Lista_valida);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisper009Service.m_eliminarDireccion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private String getInfoString(HttpServletRequest request, String NSINIES) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!isEmpty(fieldValue) && !fieldValue.equals("undefined") && !fieldName.equals("NSINIES")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}
			cadena.append("#").append("NSINIES").append(";").append(NSINIES);
			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
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

			if (!isEmpty(request.getSession().getAttribute("axisctr014_listaAgentes"))) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
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

	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_actualizar_agente");
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

			// Axisage008Service

			String CONDICION = "TRASPASO_CARTERA";

			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);

			/*
			 * mapAgentes = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE,
			 * new BigDecimal(1));
			 */
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		return mapAgentes;
	}

}
