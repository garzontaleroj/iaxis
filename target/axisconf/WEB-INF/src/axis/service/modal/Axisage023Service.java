package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIN_AGENTES;
import axis.jdbc.PAC_IAX_TRAMITADORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisage023Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisage023Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
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
	public void m_init(HttpServletRequest request, Axisage023Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private void cargarTipoActor(HttpServletRequest request) throws Exception {
		Map listValores;
		Map map;
		Map formdata;
		List aux;
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("740"));
		listValores = new HashMap();
		aux = (List) tratarRETURNyMENSAJES(request, map);
		listValores.put("LSTTIPACTOR", aux);
		formdata.put("LISTVALORES", listValores);
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		// Bug 0024964
		PAC_IAX_TRAMITADORES pac_axis_tramitadores = new PAC_IAX_TRAMITADORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		BigDecimal CTIPPROF = getCampoNumerico(request, "CTIPPROF");

		// Tipo actor ok
		Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("740"));
		listValores.put("LSTTIPACTOR", (List) tratarRETURNyMENSAJES(request, map));

		// Cramo ok
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE, null, null); // CTIPO -
																										// CEMPRES
		listValores.put("LSTRAMO", (List) tratarRETURNyMENSAJES(request, map));

		// tramite
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CTRAMTIP(); // TODO: CAMBIAR -->
																					// PAC_IAX_SIN_TRAMITE
		listValores.put("LSTCTRAMTE", (List) tratarRETURNyMENSAJES(request, map));

		// tramitador
		/*
		 * map =
		 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGENTE(CAGENTE,
		 * null,null); //TODO: CAMBIAR --> NUEVA FUNCION ????
		 * listValores.put("LSTCTRAMIT", (List)tratarRETURNyMENSAJES(request, map));
		 */

		// Tipo profesional ok
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("724"));
		listValores.put("LSTCTIPPROF", (List) tratarRETURNyMENSAJES(request, map));

		if (!isEmpty(CTIPPROF)) {
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LISTA_PROFESIONALES(CTIPPROF); // TODO: CAMBIAR
																										// --> CREAR
																										// NUEVA
																										// FUNCION????
			listValores.put("LSTSPROFES", (List) tratarRETURNyMENSAJES(request, map));
		}

		// Bug 0024964
		/*
		 * BigDecimal CTRAMTE = getCampoNumerico(request, "CTRAMTE"); BigDecimal CRAMO =
		 * getCampoNumerico(request, "CRAMO"); if (!isEmpty(CRAMO) && !isEmpty(CTRAMTE)
		 * ){ map =
		 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TRAMITADORES(CRAMO,
		 * CTRAMTE); listValores.put("LSTCTRAMIT", (List)tratarRETURNyMENSAJES(request,
		 * map)); }
		 */
		map = pac_axis_tramitadores.ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR_ALTA(null);
		logger.debug(map);
		listValores.put("LSTCTRAMIT", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("LISTVALORES", listValores);
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisage023Action thisAction) {
		logger.debug("Axiscrt023Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt023Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	public void m_aceptar(HttpServletRequest request, Axisage023Action thisAction) {

		logger.debug("Axisage023Service m_aceptar ");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		try {
			PAC_IAX_SIN_AGENTES pac_iax_age_siniestros = new PAC_IAX_SIN_AGENTES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SCLAVE = null;// clau primaria, el set ja s'ho gestiona
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CTRAMTE = getCampoNumerico(request, "CTRAMTE");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CTIPCOD = getCampoNumerico(request, "CTIPCOD");
			String CTRAMIT = getCampoTextual(request, "CTRAMIT");
			BigDecimal SPROFES;
			SPROFES = getCampoNumerico(request, "SPROFES");
			System.out.println(
					"****************************************************************************************** el codi professional: "
							+ SPROFES);

			// bug 0024976
			BigDecimal CVALORA = getCampoNumerico(request, "RDVALORA");
			if (isEmpty(CVALORA)) {
				CVALORA = new BigDecimal("1");
			}

			System.out.println(
					"****************************************************************************************** el codi CVALORA: "
							+ CVALORA);
			Calendar cal = Calendar.getInstance();
			java.sql.Date FINICIO = null;// stringToSqlDate(cal.getTime().toString());
			java.sql.Date FFIN = null; // stringToSqlDate(cal.getTime().toString());
			String CUSUARI = null;
			java.sql.Date FALTA = null;

			Map map = pac_iax_age_siniestros.ejecutaPAC_IAX_AGE_SINIESTROS__F_SET_ACTOR(SCLAVE, CAGENTE, CTRAMTE, CRAMO,
					CTIPCOD, CTRAMIT, SPROFES, CVALORA, FINICIO, FFIN, CUSUARI, FALTA);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			request.setAttribute("grabarOK", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));
			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage023Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda_profesionales(HttpServletRequest request, Axisage023Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPPROF = getCampoNumerico(request, "CTIPPROF");
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LISTA_PROFESIONALES(CTIPPROF);
			logger.debug(map);
			miDataObject.put("resultado", map);
			ajax.rellenarPlAContenedorAjax(map);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda_tramitadores(HttpServletRequest request, Axisage023Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap miDataObject = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTRAMTE = getCampoNumerico(request, "CTRAMTE");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TRAMITADORES(CRAMO, CTRAMTE);
			logger.debug(map);
			miDataObject.put("resultado", map);
			ajax.rellenarPlAContenedorAjax(map);
			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
