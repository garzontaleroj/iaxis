package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;

//import axis.jdbc.PAC_IAX_MAP;

import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm004Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm004Service extends AxisBaseService {
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm004Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("tipo_listado", new BigDecimal("1"));
			formdata.put("NMESES", new BigDecimal("1"));
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisadm004Action thisAction) {

		logger.debug("Axisadm004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			this.cargaListaEmpresas(request);
			this.cargaListaMeses(request);

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_generar(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recogemos los valores de pantalla
			BigDecimal ANY = getCampoNumerico(request, "PANY");
			BigDecimal MES = getCampoNumerico(request, "PMES");
			BigDecimal NMESES = getCampoNumerico(request, "NMESES");
			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");

			// Carga de ramos de la BD
			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GENERA_CONTABILIDAD(EMPRESA, ANY, MES, NMESES);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// El resultado se muestra en la parte de mensajes
			if (resultado != null && resultado.intValue() == 0) {
				request.getSession().setAttribute("GENERAR", 0);
				m_visualizar_sim(request, thisAction);
			} else {
				request.getSession().setAttribute("GENERAR", 1);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm004Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cierre(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recogemos los valores de pantalla
			BigDecimal ANY = getCampoNumerico(request, "PANY");
			String MES = getCampoTextual(request, "PMES");
			BigDecimal NMESES = getCampoNumerico(request, "NMESES");
			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			String FECHA_CONTABLE = null;

			if (MES == null) {
				MES = getCampoTextual(request, "NUM_MES");
				formdata.put("PMES", MES);
			}

			if (ANY != null && MES != null) {
				// FECHA_CONTABLE = "01/"+MES+"/"+ANY;
				Calendar cal = new GregorianCalendar(ANY.intValue(), Integer.parseInt(MES) - 1, 1);

				// Get the number of days in that month
				int days = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
				FECHA_CONTABLE = days + "/" + MES + "/" + ANY;

			}

			Date FCONTABLE = FECHA_CONTABLE != null ? sdf.parse(FECHA_CONTABLE) : null;
			java.sql.Date FCONTABLE_2 = FCONTABLE != null ? new java.sql.Date(FCONTABLE.getTime()) : null;

			// Carga de ramos de la BD
			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_CIERRA_CONTABILIDAD(EMPRESA, FCONTABLE_2, NMESES);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// El resultado se muestra en la parte de mensajes
			if (resultado != null && resultado.intValue() == 0) {
				request.getSession().setAttribute("CIERRA", 0);
			} else {
				request.getSession().setAttribute("CIERRA", 1);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm004Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_visualizar_sim(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Recogemos los valores de pantalla
			BigDecimal ANY = getCampoNumerico(request, "PANY");
			BigDecimal MES = getCampoNumerico(request, "PMES");
			BigDecimal NMESES = getCampoNumerico(request, "NMESES");
			BigDecimal EMPRESA = getCampoNumerico(request, "CEMPRES");
			BigDecimal PAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal TIPOLISTADO = getCampoNumerico(request, "tipo_listado");
			// Carga de ramos de la BD
			Map map = null;
			if (TIPOLISTADO != null && TIPOLISTADO.intValue() == 0) {
				// Consulta hist�rico
				map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTAHISTORICO(EMPRESA, ANY, MES, PAIS);
				formdata.put("tipo_listado", "0");
			} else {
				// Consulta cuadre
				map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONSULTASIMULACION(EMPRESA, ANY, MES, PAIS, NMESES);
				formdata.put("tipo_listado", "1");
			}

			List resultado = (List) tratarRETURNyMENSAJES(request, map, false);
			// El resultado se muestra en la parte de mensajes
			request.getSession().setAttribute("listaAsientos", resultado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm004Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_limpiar_listado(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			request.getSession().setAttribute("listaAsientos", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm004Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {

	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaEmpresas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		List listaEmpresas = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("axisadm_listaEmpresas",
				listaEmpresas != null ? listaEmpresas : new ArrayList());
		listaEmpresas = null;
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaMeses(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
		List listaMeses = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaMeses", listaMeses != null ? listaMeses : new ArrayList());
		listaMeses = null;
	}

	/**
	 * Carga la lista de informe
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_informe(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisadm004Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		/* FORMATO CEMPRES|MES|ANYO|PAIS|SIMULACION-HISTORICO */
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CEMPRES = getCampoTextual(request, "CEMPRES") != null ? getCampoTextual(request, "CEMPRES") : "";
			String MES = getCampoTextual(request, "PMES") != null ? getCampoTextual(request, "PMES") : "";
			String ANYO = getCampoTextual(request, "PANY") != null ? getCampoTextual(request, "PANY") : "";

			String CPAIS = getCampoTextual(request, "CPAIS") != null ? getCampoTextual(request, "CPAIS") : "";
			BigDecimal TIPOLISTADO = getCampoNumerico(request, "tipo_listado");
			// Carga de ramos de la BD
			Map map = null;
			if (TIPOLISTADO != null && TIPOLISTADO.intValue() == 0) {
				// tipo de listado = HISTORICO
				TIPOLISTADO = new BigDecimal("2");
			} else {
				// tipo de listado = SIMULACION
				TIPOLISTADO = new BigDecimal("1");
			}

			String PARAM = CEMPRES + "|" + MES + "|" + ANYO + "|" + CPAIS + "|" + TIPOLISTADO;
			// CEMPRES|MES|A�O|PAIS|SIMULACION/HISTORICO/*1|6|2008|42|1/2*/

			PAC_IAX_MAP pac_axis_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Map mapa = pac_axis_map.ejecutaPAC_IAX_MAP__F_EJECUTA("311",PARAM,CIDIOMA);
			Map mapa = pac_axis_map.ejecutaPAC_IAX_MAP__F_EJECUTA("311", PARAM);
			String fichero = (String) tratarRETURNyMENSAJES(request, mapa);

			ajax.rellenarPlAContenedorAjax(mapa);
			if (!isEmpty(mapa) && !isEmpty(mapa.get("RETURN")) && !"**".equals((String) mapa.get("RETURN"))) {
				Map file = new HashMap();
				file.put("FILE", fichero);
				ajax.guardarContenidoFinalAContenedorAjax(file);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	/**
	 * Recarga el n�mero de meses seleccionado
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */

	public void m_ajax_direccion(HttpServletRequest request, Axisadm004Action thisAction) {
		logger.debug("Axisadm004Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");
			BigDecimal CPAIS_RESIDENCIA = this.getCampoNumerico(request, "CPAIS_RESIDENCIA");
			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_RESIDENCIA")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_RESIDENCIA);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS_RESIDENCIA", CPAIS_RESIDENCIA);
					pais.put("TPAISRESIDENCIA", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("TPAISRESIDENCIA", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
