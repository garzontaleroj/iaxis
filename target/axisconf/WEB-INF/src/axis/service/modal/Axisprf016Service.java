package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIN_IMP_SAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import java.util.Date;

/**
 * h* @since Java 5.0
 */
public class Axisprf016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisprf016Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal psprofes = AxisBaseService.getCampoNumerico(request, "SPROFES");
			formdata.put("SPROFES", psprofes);
			PAC_IAX_SIN_IMP_SAP pac_axis_sin_impuestos = new PAC_IAX_SIN_IMP_SAP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_LSTIMPUESTOS();
			logger.debug("++++ impuestos:" + map);
			formdata.put("LSTIMPUESTOS", tratarRETURNyMENSAJES(request, map));

			/* INI--WAJ */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTVINCULOS();
			logger.debug("++++ tipos vinculos:" + map);
			formdata.put("LSTTIPOVINCULO", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug("++++ tipos agentes:" + map);
			formdata.put("LSTTIPOAGENTE", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP();
			logger.debug("++++ tipos compañias:" + map);
			formdata.put("LSTTIPOCOMPANIA", tratarRETURNyMENSAJES(request, map, false));

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", SPERSON);
			/* FIN--WAJ */

			BigDecimal CCODIMP = AxisBaseService.getCampoNumerico(request, "CCODIMP");
			/* Cambio para bug-14446 : start */
			BigDecimal CCODVIN = AxisBaseService.getCampoNumerico(request, "CCODVIN");
			logger.debug("++++ swapnil Axisprf016Service : CCODVIN:" + CCODVIN);
			BigDecimal CAREA = null;
			if (CCODVIN != null) {
				if (CCODVIN.compareTo(new BigDecimal(2)) == 0 || CCODVIN.compareTo(new BigDecimal(7)) == 0) {
					CAREA = new BigDecimal(3);
				} else if (CCODVIN.compareTo(new BigDecimal(3)) == 0) {
					CAREA = new BigDecimal(2);
				} else if (CCODVIN.compareTo(new BigDecimal(4)) == 0) {
					CAREA = new BigDecimal(1);
				} // INI-CES: 29/05/2019: Ajuste valores por defecto para evitar errores con los
					// vinculos que no tiene obligatoriedad de regimen
				else {
					CAREA = new BigDecimal(3);
				}
			} else {
				CAREA = new BigDecimal(3);
			}

			formdata.put("CCODIMP", CCODIMP);
			if (CCODIMP != null) {
				map = pac_axis_sin_impuestos.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, CAREA);
				logger.debug("++++ tipos indicador:" + map);
				formdata.put("LSTTIPIND", tratarRETURNyMENSAJES(request, map));
			}
			/* Cambio para bug-14446 : end */
			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar")) {
					BigDecimal CTIPIND = this.getCampoNumerico(request, "CTIPIND");
					formdata.put("CTIPIND", CTIPIND);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf016Service - método m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar(HttpServletRequest request) {
		logger.debug("Axisprf016Service m_guardar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCODIMP = getCampoNumerico(request, "CCODIMP");
			BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
			BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");

			PAC_IAX_SIN_IMP_SAP PAC_IAX_SIN_IMP_SAP = new PAC_IAX_SIN_IMP_SAP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			map = PAC_IAX_SIN_IMP_SAP.ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PROF(SPROFES, CCODIMP, CTIPIND);
			logger.debug("++++map ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PROF" + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else {
				formdata.put("guardat", "1");
				formdata.put("CCODIMP", CCODIMP);
				formdata.put("CTIPIND", CTIPIND);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf016Service - método m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/* INI--WAJ */
	public void m_ajax_busqueda_tip_indica(HttpServletRequest request) {
		logger.debug("Axisprf016Service m_ajax_busqueda_tip_indica");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaTiposIndicador(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf016Service - método m_ajax_busqueda_tip_indica", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaTiposIndicador(HttpServletRequest request) throws Exception {
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal CCODIMP = getCampoNumerico(request, "CCODIMP");

		// inicio modificacion bartolo herrera 21-02-2019

		BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
		BigDecimal CAREA = null;

		if (CCODVIN.compareTo(new BigDecimal(2)) == 0 || CCODVIN.compareTo(new BigDecimal(7)) == 0) {
			CAREA = new BigDecimal(3);
		} else if (CCODVIN.compareTo(new BigDecimal(3)) == 0) {
			CAREA = new BigDecimal(2);
		} else if (CCODVIN.compareTo(new BigDecimal(4)) == 0) {
			CAREA = new BigDecimal(1);
		} // INI-CES: 29/05/2019: Ajuste valores por defecto para evitar errores con los
			// vinculos que no tiene obligatoriedad de regimen
		else {
			CAREA = new BigDecimal(3);
		}
		// END-CES: 29/05/2019: Ajuste valores por defecto para evitar errores con los
		// vinculos que no tiene obligatoriedad de regimen

		Map map = new PAC_IAX_SIN_IMP_SAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP, CAREA);

		// fin modificacion bartolo herrera 21-02-2019

		// Map map=new
		// PAC_IAX_SIN_IMP_SAP((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SIN_IMP_SAP__F_GET_TIPOS_INDICADOR(CCODIMP);
		logger.debug("++++map TIPOS INDICADOR-->" + map);

		List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
		return plLista;
	}

	public void m_ajax_busqueda_tip_agente(HttpServletRequest request) {
		logger.debug("Axisprf016Service m_ajax_busqueda_tip_agente");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaTiposAgente(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf016Service - método m_ajax_busqueda_tip_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaTiposAgente(HttpServletRequest request) throws Exception {
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
		logger.debug(CCODVIN);

		if (((BigDecimal) getCampoNumerico(request, "CCODVIN")).intValue() == 3) {
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAGENTE();
			logger.debug("++++map TIPOS AGENTES1-->" + map);
			List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
			logger.debug("++++map GONORREA-->" + plLista.toString() + "" + plLista.size());
			return plLista;
		} else {
			if (((BigDecimal) getCampoNumerico(request, "CCODVIN")).intValue() == 4) {
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCOMP();
				logger.debug("++++map TIPOS AGENTES1-->" + map);
				List plLista = (List) ajax.rellenarPlAContenedorAjax(map);
				logger.debug("++++map TIPO EMPRESA-->" + plLista.toString() + "" + plLista.size());
				return plLista;
			}
		}
		return null;
	}

	public void m_guardarindica(HttpServletRequest request) {
		logger.debug("Axisprf016Service m_guardarindica");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCODVIN = getCampoNumerico(request, "CCODVIN");
			BigDecimal CTIPIND = getCampoNumerico(request, "CTIPIND");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			BigDecimal CCODAGEN = null;
			try {
				CCODAGEN = getCampoNumerico(request, "CCODAGEN");
			} catch (Exception e) {
				CCODAGEN = null;
			}

			PAC_IAX_SIN_IMP_SAP PAC_IAX_SIN_IMP_SAP = new PAC_IAX_SIN_IMP_SAP(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			map = PAC_IAX_SIN_IMP_SAP.ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER(CCODVIN, CCODAGEN, CTIPIND,
					SPERSON);
			logger.debug("++++map ejecutaPAC_IAX_SIN_IMP_SAP__F_SET_IMPUESTO_PER" + map);
			/* Cambio para bug-14446 : start */
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("guardat", "0");
			} else if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 2) {
				formdata.put("guardat", "1");
				AbstractDispatchAction.guardarMensaje(request, "9904284", new Object[] {}, Constantes.MENSAJE_ERROR);
			} else {
				formdata.put("guardat", "1");
			}
			/* Cambio para bug-14446 : end */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf016Service - método m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
	/* FIN--WAJ */
}
