package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ALM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm054Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm054Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm054Action thisAction) {
		this.formattingNumericValues(request);
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm054Action thisAction) {
		logger.debug("Axisadm054Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			// Actualizamos el Indice
			BigDecimal INDICE = this.getCampoNumerico(request, "INDICE");
			if (isEmpty(INDICE))
				formdata.put("INDICE", new BigDecimal(0));

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal AuxCempres;

			logger.debug("CRAMO --->" + CRAMO);

			if (isEmpty(CEMPRES))
				AuxCempres = usuario.getCempres();
			else
				AuxCempres = CEMPRES;

			formdata.put("CEMPRES", AuxCempres);
			Map ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(AuxCempres);
			logger.debug(ramos);
			request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));
			logger.debug(CEMPRES + "m_form CEMPRES");
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), AuxCempres, null);
			logger.debug(m);
			request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));

			// Cargamos los datos.
			this.m_buscar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		this.gestionarOrdenacionTablas(request);
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisadm054Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("comboOrigen  ---------> " + comboOrigen);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug("CARGO RAMOS ---------> " + ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
										this.getCampoNumerico(request, "CEMPRES"), null);
						logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
						ajax.rellenarPlAContenedorAjax(m);
						ajaxResponse.put("SPRODUC", m);
						request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
					}
				}
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm036Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_buscar(HttpServletRequest request, Axisadm054Action thisAction) {
		logger.debug("Axisadm054Service m_buscar");
		this.formattingNumericValues(request);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_GET_ALMCRITERIO(CEMPRES);
			logger.debug("Lista de Criterios ---> " + map);
			BigDecimal num = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			// if (num.intValue() !=0)
			request.setAttribute("axisctr_listaCriterios", map.get("P_RCRITERIO"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_calcular(HttpServletRequest request, Axisadm054Action thisAction) {
		logger.debug("Axisadm054Service m_calcular");
		this.formattingNumericValues(request);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PINTFUT = getCampoNumerico(request, "PINTFUT");
			BigDecimal PCREDIBI = getCampoNumerico(request, "PCREDIBI");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			Date FVALORA = stringToSqlDate(getCampoTextual(request, "FVALORA"));

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_GENERA_ALM(CEMPRES, FVALORA, SPRODUC, PINTFUT, PCREDIBI, CRAMO);
			logger.debug("Calcular ---> " + map);
			// BigDecimal num = (BigDecimal)tratarRETURNyMENSAJES(request, map, false);

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("CALCULADO", new BigDecimal(1));
			} else {
				formdata.put("CALCULADO", new BigDecimal(0));
			}

			// if (num.intValue() !=0)

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_borrar(HttpServletRequest request, Axisadm054Action thisAction) {
		logger.debug("Axisadm054Service m_borrar");
		this.formattingNumericValues(request);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			logger.debug("NORDEN ------> " + NORDEN);

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_DEL_ALMCRITERIO(CEMPRES, NORDEN);
			logger.debug("Delete ---> " + map);
			BigDecimal num = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			this.m_buscar(request, thisAction);
			// if (num.intValue() !=0)

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	@SuppressWarnings("all")
	public void m_montar_fichero(HttpServletRequest request, Axisadm054Action thisAction) {
		logger.debug("Axisadm054Service m_montar_fichero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_INFORME("CARTERA", SPRODUC, new BigDecimal(0), new BigDecimal(0), CEMPRES,
							CRAMO);
			tratarRETURNyMENSAJES(request, map);

			/*
			 * if(map.get("RETURN").equals(new BigDecimal(0))){ formdata.put("CALCULADO",new
			 * BigDecimal(1)); } else{ formdata.put("CALCULADO",new BigDecimal(0)); }
			 */

			Map map2 = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_INFORME("CARTERA", SPRODUC, new BigDecimal(0), new BigDecimal(1), CEMPRES,
							CRAMO);
			tratarRETURNyMENSAJES(request, map2);

			/*
			 * List lista = new ArrayList(); Map m = new HashMap();
			 * m.put("FICHERO",map.get("P_NOMFICHERO")); lista.add(m);
			 */

			logger.debug("--> MAP --> " + map);

			formdata.put("LINK_INFORME", map.get("P_NOMFICHERO"));
			formdata.put("LINK_INFORME2", map2.get("P_NOMFICHERO"));
			// this.m_form(request,thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm054Service - m�todo m_montar_fichero", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

}
