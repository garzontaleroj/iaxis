package axis.service.axis;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_CTACLIENTE;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axiscob001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscob001Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axiscob001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axiscob001Action thisAction) {

		logger.debug("Axiscob001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			this.cargaListaMedioPago(request);
			this.cargaListaTiposMovimientos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

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
	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			int res = SSEGURO.compareTo(new BigDecimal("0"));
			if (res < 0)
				SSEGURO = new BigDecimal("0");
			String sFECHAINI = getCampoTextual(request, "FECHAINI");
			String sFECHAFIN = getCampoTextual(request, "FECHAFIN");
			java.sql.Date FECHAINI = sFECHAINI != null ? new java.sql.Date(sdf.parse(sFECHAINI).getTime()) : null;
			java.sql.Date FECHAFIN = sFECHAFIN != null ? new java.sql.Date(sdf.parse(sFECHAFIN).getTime()) : null;
			BigDecimal TCONCEP = getCampoNumerico(request, "TCONCEP");
			BigDecimal CMEDMOV = getCampoNumerico(request, "CMEDMOV");
			BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
			BigDecimal BUSPER = getCampoNumerico(request, "BUSPER");
			BigDecimal BUSPOL = getCampoNumerico(request, "BUSPOL");
			String pNOMBRETOM = getCampoTextual(request, "NOMBRETOM");
			request.getSession().setAttribute("NOMBRETOM", pNOMBRETOM);
			formdata.put("BUSPER", BUSPER);
			formdata.put("BUSPOL", BUSPOL);

			PAC_IAX_CTACLIENTE pac_iax_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERMOVIMIENTOS(SPERSON, SSEGURO, SPRODUC,
					FECHAINI, FECHAFIN, TCONCEP, CMEDMOV, IMPORTE);
			logger.debug("Map: " + map);
			List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("OBTENERMOVIMIENTOS", resultados);
			request.setAttribute("GENERAR", (resultados != null && resultados.size() > 0));
			logger.debug("formdata: " + formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
			logger.error("Error en el servicio Axiscob001Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
			logger.error("Error en el servicio Axiscob001Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
			logger.error("Error en el servicio Axiscob001Service - m�todo m_generar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaMedioPago(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CLAVE = new BigDecimal(1056);
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CLAVE);
		List listaMedioPago = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaMedioPago", listaMedioPago);
		listaMedioPago = null;

	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaTiposMovimientos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CLAVE = new BigDecimal(480);
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(CLAVE);
		List listaTiposMovimientos = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaTiposMovimientos", listaTiposMovimientos);
		listaTiposMovimientos = null;

	}

	/**
	 * Recarga el n�mero de meses seleccionado
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_persona(HttpServletRequest request, Axiscob001Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("Axiscob001Service Fin m_ajax_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_buscar_polizas(HttpServletRequest request, Axiscob001Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_buscar_polizas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			PAC_IAX_CTACLIENTE pac_axis_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERPOLIZAS(SPERSON);
			logger.debug(map);
			List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
			request.getSession().setAttribute("listaPolizas", resultados);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("Axiscob001Service Fin m_ajax_buscar_polizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_ajax_buscar_polizas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_polizas(HttpServletRequest request, Axiscob001Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_polizas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(SSEGURO);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);

			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);
			formdata.put("SPRODUC", datosPoliza.get("SPRODUC"));

			request.getSession().setAttribute("NOMBRETOM", datosPoliza.get("TNOMTOM"));

			if (!isEmpty(datosPoliza)) {
				Map OB_IAX_DATPOLIZA = new HashMap();
				OB_IAX_DATPOLIZA.putAll(datosPoliza);
				ajax.guardarContenidoFinalAContenedorAjax(OB_IAX_DATPOLIZA);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_ajax_polizas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_buscar_persona(HttpServletRequest request, Axiscob001Action thisAction) {
		logger.debug("Axiscob001Service m_ajax_buscar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			PAC_IAX_CTACLIENTE pac_axis_ctacliente = new PAC_IAX_CTACLIENTE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_ctacliente.ejecutaPAC_IAX_CTACLIENTE__F_OBTENERPERSONAS(SSEGURO);
			logger.debug(map);
			List resultados = (List) tratarRETURNyMENSAJES(request, map, false);
			request.getSession().setAttribute("listaPersonas", resultados);
			ajax.guardarContenidoFinalAContenedorAjax(map);
			logger.debug("Axiscob001Service Fin m_ajax_buscar_persona");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscob001Service - m�todo m_ajax_buscar_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
