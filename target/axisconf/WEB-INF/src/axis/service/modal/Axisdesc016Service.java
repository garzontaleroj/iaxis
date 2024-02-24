package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTDTOSESPECIALES;
import axis.mvc.control.modal.Axisdesc016Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.service.axis.Axisctr001Service;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

public class Axisdesc016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisdesc016Action thisAction) {
		logger.debug("Axisdesc016Service m_init");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			/*
			 * PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas=new
			 * PAC_IAX_MNTCAMPANYAS((Connection)request.getAttribute(Constantes.DB01CONN));
			 * Map map=null; BigDecimal CCAMPANYA =getCampoNumerico(request, "CCAMPANYA");
			 * logger.debug("---> CCAMPANYA:"+CCAMPANYA); HashMap listaDetCapanyas = new
			 * HashMap(); listaDetCapanyas =
			 * pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(CCAMPANYA,
			 * new BigDecimal(1)); logger.debug("--->listaDetCapanyas:"+listaDetCapanyas);
			 * if
			 * (((BigDecimal)tratarRETURNyMENSAJES(request,listaDetCapanyas)).intValue()==0)
			 * { if (!isEmpty (listaDetCapanyas.get("PCAMPANYA"))) { // if
			 * (!isEmpty(((HashMap)map.get("PCUADROCOMISION")).get("DESCRIPCIONES"))) //
			 * request.getSession().setAttribute("descripciones",(ArrayList<HashMap>)
			 * ((HashMap)map.get("PCUADROCOMISION")));
			 * 
			 * 
			 * formdata.put("CAMPANYA",listaDetCapanyas.get("PCAMPANYA"));
			 * 
			 * logger.debug(listaDetCapanyas.get("PCAMPANYA"));
			 * 
			 * }
			 * 
			 * }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc016Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisdesc016Action thisAction) {
		logger.debug("Axisdesc016Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			formdata.put("CIDIOMA_USU", usuario.getCidioma());
			String MODO = getCampoTextual(request, "CMODO");
			formdata.put("MODO", MODO);

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			formdata.put("CCAMPANYA", CCAMPANYA);
			String TCAMPANYA = getCampoTextual(request, "TCAMPANYA");
			formdata.put("TCAMPANYA", TCAMPANYA);

			Map map = new PAC_IAX_MNTDTOSESPECIALES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_CAGRTIPO();
			formdata.put("listaArupaciones", tratarRETURNyMENSAJES(request, map));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSAGENTE(null, null, null, CAGENTE);
			logger.debug(m);
			formdata.put("listaProductos", tratarRETURNyMENSAJES(request, m));

			if (MODO.equals(new String("MODIF"))) {

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
				String TPAIS = getCampoTextual(request, "TPAIS");
				BigDecimal CDPTO = getCampoNumerico(request, "CDPTO");
				String TDPTO = getCampoTextual(request, "TDPTO");
				BigDecimal CCIUDAD = getCampoNumerico(request, "CCIUDAD");
				String TCIUDAD = getCampoTextual(request, "TCIUDAD");
				String CAGRUPACION = getCampoTextual(request, "CAGRUPACION");
				BigDecimal CSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
				String TSUCURSAL = getCampoTextual(request, "TSUCURSAL");
				BigDecimal CINTERMEDIARIO = getCampoNumerico(request, "CINTERMEDIARIO");
				String TINTERMEDIARIO = getCampoTextual(request, "TINTERMEDIARIO");
				BigDecimal PDTO = getCampoNumerico(request, "PDTO");

				formdata.put("SPRODUC", SPRODUC);
				formdata.put("CPAIS", CPAIS);
				formdata.put("TPAIS", TPAIS);
				formdata.put("CPROVIN", CDPTO);
				formdata.put("TPROVIN", TDPTO);
				formdata.put("CPOBLAC", CCIUDAD);
				formdata.put("TPOBLAC", TCIUDAD);
				formdata.put("CAGRTIPO", CAGRUPACION);
				formdata.put("CAGENTE_2", CSUCURSAL);
				formdata.put("NOMBRE_2", TSUCURSAL);
				formdata.put("CAGENTE_4", CINTERMEDIARIO);
				formdata.put("NOMBRE_4", TINTERMEDIARIO);
				formdata.put("PDTO", PDTO);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisdesc016Action thisAction) {
		logger.debug("Axisdesc016Service m_aceptar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PCCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			BigDecimal PCAGENTE = getCampoNumerico(request, "CAGENTE_4");
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal PCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal PCPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String PCAGRTIPO = getCampoTextual(request, "CAGRTIPO");
			BigDecimal PPDTO = getCampoNumerico(request, "PDTO");

			BigDecimal PCSUCURSAL = getCampoNumerico(request, "CAGENTE_2");

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				Map map = new PAC_IAX_MNTDTOSESPECIALES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_SET_DTOSESPECIALES_LIN(PCCAMPANYA, PSPRODUC, PCPAIS,
								PCPROVIN, PCPOBLAC, PCAGRTIPO, PCSUCURSAL, PCAGENTE, PPDTO);
				tratarRETURNyMENSAJES(request, map);
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
				if (map.get("RETURN").equals(new BigDecimal(0))) {
					formdata.put("OK", new BigDecimal(0));
				} else {
					formdata.put("OK", new BigDecimal(1));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc016Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	private void cargaAgente(HttpServletRequest request) throws Exception {
		if (isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
			// Cargar Agente de la BD
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, String.valueOf(mapCX.get("RETURN")),
							new BigDecimal(1));
			Map agente = new HashMap();
			logger.debug("agentes --> " + map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, map, false);
				agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
			}
			request.getSession().setAttribute("axisctr_agente", agente);

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
			String CONDICION = getCampoTextual(request, "CONDICION");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal CAGENTE_BD = new BigDecimal(CAGENTE);
			if (PARTNER != null)
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(null, null, CAGENTE_BD,
								new BigDecimal(1), CONDICION, null, PARTNER);
			else
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(null, null, CAGENTE_BD,
								new BigDecimal(1), CONDICION, null);

			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisadm047Service m_ajax_busqueda_productos");
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
}
