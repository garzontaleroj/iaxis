package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr026Action;
import axis.mvc.control.axis.Axisctr187Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr026Service extends Axisctr002Service {
	private Axisctr003Service axisctr003Service = new Axisctr003Service();
	private Axisctr187Service axisctr187Service = new Axisctr187Service(); // A�adimos el service

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		request.setAttribute("multiPantalla", Boolean.valueOf(true));

		super.m_form(request, thisAction);
		axisctr003Service.m_form(request, thisAction);
		axisctr187Service.m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/* Hereda los m�todos de Axisctr002Service */

	/* M�todos que llaman a Axisctr003Service */
	public void m_ajax_ver_asegurado(HttpServletRequest request) {
		axisctr003Service.m_ajax_ver_asegurado(request);
	}

	public void m_ajax_modificar_asegurado(HttpServletRequest request) {
		axisctr003Service.m_ajax_modificar_asegurado(request);
	}

	public void m_ajax_delete_asegurado(HttpServletRequest request) {
		axisctr003Service.m_ajax_delete_asegurado(request);
	}

	public void m_ajax_selected_asegurado(HttpServletRequest request) {
		axisctr003Service.m_ajax_selected_asegurado(request);
	}

	public void m_ajax_selected_vinculo_tomador(HttpServletRequest request) {
		axisctr003Service.m_ajax_selected_vinculo_tomador(request);
	}

	public void m_borrarAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		axisctr003Service.m_borrarAsegurado(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	public void m_cambiar_asegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		axisctr003Service.m_cambiar_asegurado(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	public void m_guardar_asegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		axisctr003Service.m_guardar_asegurado(request, thisAction);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	public void m_actAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		axisctr003Service.m_actAsegurado(request, thisAction);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	/* ********************* pantalla Axisctr187 ********************* */
	public void m_guardar_gestor(HttpServletRequest request) {
		axisctr187Service.m_guardar_gestor(request);
		axisctr187Service.m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	/* ********************* pantalla Axisctr187 ********************* */
	public void m_cambiar_gestor(HttpServletRequest request) {
		axisctr187Service.m_cambiar_gestor(request, new Axisctr187Action());
		axisctr187Service.m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	public void m_update_gestor(HttpServletRequest request) {
		axisctr187Service.m_actualizar_gestor(request, new Axisctr187Action());
		axisctr187Service.m_form(request);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	/* M�TODOS DE REFRESCO DE TABLAS CRUZADAS */
	public void m_ajax_repintar_lista_asegurados(HttpServletRequest request) {
		logger.debug("Axisctr026Service m_ajax_repintar_lista_asegurados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		List asegurados = null;
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		try {
			// Recargar asegurados
			Map dbLeeAsegurados = axisctr003Service.dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC);
			asegurados = (List) ajax.rellenarPlAContenedorAjax(dbLeeAsegurados);
			ajax.guardarContenidoFinalAContenedorAjax(asegurados);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_form", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			request.getSession().setAttribute("axisctr_asegurados",
					((asegurados == null) ? new ArrayList() : asegurados));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_ajax_repintar_lista_tomadores(HttpServletRequest request) {
		logger.debug("Axisctr026Service m_ajax_repintar_lista_tomadores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		List tomadores = null;

		try {
			// Recargar tomadores
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
			logger.debug(map);

			tomadores = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(tomadores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_form", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			request.getSession().setAttribute("axisctr_tomadores", ((tomadores == null) ? new ArrayList() : tomadores));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/**************************************************
	 * M�TODOS DE NAVEGACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr026Service m_siguiente");

		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr026Service m_anterior");
		m_validar(request, thisAction, Constantes.ANTERIOR);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this)); // ANY. MET
	}

	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr026Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDATOMADORES();
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			BigDecimal codiRetorn2 = new BigDecimal(0);
			if (!isEmpty(formdata.get("axisctr_multi_registro_asegurados"))
					&& !(new Integer((String) formdata.get("axisctr_multi_registro_asegurados"))
							.equals(new Integer(1)))) {
				// if (!((Integer)
				// request.getSession().getAttribute("axisctr_multi_registro_asegurados")).equals(new
				// Integer(1))) {
				// Si PAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG == 1, no validar asegurados
				map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS();
				logger.debug(map);
				codiRetorn2 = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				// }
			}
			if (new BigDecimal(0).equals(codiRetorn) && new BigDecimal(0).equals(codiRetorn2)) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr026Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar_gestor(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_borrar_gestor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");

			Map borrarAsegurado = this.dbBorrarGestor(request, usuario, SPERSON);
			this.tratarRETURNyMENSAJES(request, borrarAsegurado);
			logger.debug(borrarAsegurado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_guardar_tomador", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Inserta un asegurado en la BD.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbBorrarGestor(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAGESCOBRO(SPERSON);
		logger.debug(map);
		return map;
	}

	// Ini IAXIS -3635 - ACL - 22/04/2019
	public void m_consultarPer(HttpServletRequest request, Axisctr026Action thisAction) {
		logger.debug("Axisctr026Service m_consultarPer");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Push de los datos necesarios a la pila
			// BigDecimal SSEGURO = getCampoNumerico (request, "SSEGURO");
			BigDecimal SPERSON_AUX = new BigDecimal(String.valueOf(request.getParameter("SPERSON_AUX"))); // A consultar
			BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON"))); // Actual
			logger.debug("m_consultar ---------------------> " + SPERSON_AUX);
			// formdata.put("SPERSON",SPERSON_AUX);

			thisAction.topPila(request, "formdata_axisctr026", formdata);
			thisAction.topPila(request, "SPERSON_AUX", SPERSON);
			thisAction.topPila(request, "SPERSON", SPERSON_AUX);

			thisAction.topPila(request, "CMODO_AUX", (String) AbstractDispatchAction.topPila(request, "CMODO"));
			AbstractDispatchAction.topPila(request, "CMODO", "CONSULTA_PERSONA");
			request.setAttribute(Constantes.PASSTOPPILA, thisAction.topPila(request));

			// String CMODO=(String) AbstractDispatchAction.topPila(request, "CMODO");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr026Service - mtodo m_consultarPer", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_volverPer(HttpServletRequest request, Axisctr026Action thisAction) {
		logger.debug("Axisctr026Service m_volverPer");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map formdata_axisper009 = (Map) thisAction.removeTopPila(request, "formdata_axisper009");
			if (!isEmpty(formdata_axisper009)) {
				formdata.putAll(formdata_axisper009);
			}
			formdata.put("SPERSON", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPERSON_AUX"))); // El
																														// anterior

			thisAction.topPila(request, "CMODO", (String) AbstractDispatchAction.topPila(request, "CMODO_AUX"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr026Service - metodo m_volverPer", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// Fin IAXIS -3635 - ACL - 22/04/2019
}
