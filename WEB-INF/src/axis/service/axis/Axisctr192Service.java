package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_RETORNO;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr192Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/*****************************************************
	 * M�TODOS DE BBDD
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * Lee los asegurados de la p�liza.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeRetorno(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEERETORNO();
		logger.debug(map);
		return map;
	}

	/**
	 * Elimina el asegurado seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbEliminaRetorno(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINARETORNO(SPERSON);
		logger.debug(map);
		return map;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr192Service m_init");
		try {
			m_form(request, thisAction);

			PAC_IAX_PRODUCCION pacIaxProd = new PAC_IAX_PRODUCCION(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pacIaxProd.ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO();
			logger.debug(mapa);
			tratarRETURNyMENSAJES(request, mapa);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Obtiene la lista de asegurados de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr192Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			ArrayList lista_retornos = new ArrayList();

			BigDecimal RETORNO_INICIALIZADO = (BigDecimal) AbstractDispatchAction.topPila(request,
					"RETORNO_INICIALIZADO");

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			if (RETORNO_INICIALIZADO == null) {

				/*
				 * *****************************************************************************
				 * ************
				 */
				/*
				 * ******************************** INICIALIZA OBJETO
				 * **************************************
				 */
				/*
				 * *****************************************************************************
				 * ************
				 */
				/* ********************** SOLO LA PRIMERA VEZ ************************** */
				/*
				 * *****************************************************************************
				 * ************
				 */

				PAC_IAX_PRODUCCION pacIaxProd = new PAC_IAX_PRODUCCION(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pacIaxProd.ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO();
				logger.debug(mapa);
				tratarRETURNyMENSAJES(request, mapa);
				/*
				 * *****************************************************************************
				 * *************
				 */
				lista_retornos = (ArrayList) tratarRETURNyMENSAJES(request, mapa, false);

				AbstractDispatchAction.topPila(request, "RETORNO_INICIALIZADO", new BigDecimal("1")); // Inicializamos
																										// la primera
																										// vez

			} else {

				/*
				 * *****************************************************************************
				 * ************
				 */
				/*
				 * *********************************** LEE OBJETO
				 * ******************************************
				 */
				/*
				 * *****************************************************************************
				 * ************
				 */
				PAC_IAX_PRODUCCION pacIaxRetornoProd = new PAC_IAX_PRODUCCION(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa_prod_retorno = pacIaxRetornoProd.ejecutaPAC_IAX_PRODUCCION__F_LEERETORNO();
				logger.debug("************************************" + mapa_prod_retorno);

				lista_retornos = (ArrayList) tratarRETURNyMENSAJES(request, mapa_prod_retorno, false);

			}

			/*
			 * ******************************* ESCOGE REGISTRO SELECCIONADO
			 * ******************************
			 */
			BigDecimal SPERSON_SELECTED = getCampoNumerico(request, "SPERSON_SELECTED");
			int registro_seleccionado = 0;

			if (SPERSON_SELECTED != null) {

				if (!isEmpty(lista_retornos)) {
					for (int i = 0; i < lista_retornos.size(); i++) {
						Map mapa_pers_retorno = (Map) ((Map) lista_retornos.get(i)).get("OB_IAX_RETORNO");
						BigDecimal SPERSON_REG = (BigDecimal) mapa_pers_retorno.get("SPERSON");
						if (SPERSON_REG.equals(SPERSON_SELECTED)) {
							registro_seleccionado = i; // Nos da el registro a seleccionar
						}
					}
				}
			} else {
				if (!isEmpty(lista_retornos)) {
					Map mapa_pers_retorno = (Map) ((Map) lista_retornos.get(0)).get("OB_IAX_RETORNO");
					BigDecimal SPERSON_REG = (BigDecimal) mapa_pers_retorno.get("SPERSON");
					SPERSON_SELECTED = SPERSON_REG;
				}
			}

			Map valores_pers_seleccionada = (Map) recuperaDatosBeneficiario(request, registro_seleccionado,
					lista_retornos);

			logger.debug(valores_pers_seleccionada);
			request.setAttribute("datos_persona", valores_pers_seleccionada);

			/*
			 * *****************************************************************************
			 * *************
			 */
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			logger.debug("SSEGURO :: " + SSEGURO + " SPRODUC :: " + SPRODUC);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SPRODUC", SPRODUC);

			// Carga de retornos
			List retornos;

			retornos = (List) tratarRETURNyMENSAJES(request, dbLeeRetorno(request, usuario));

			Map beneficiario = new HashMap();

			request.setAttribute("axisctr_retorno", ((retornos == null) ? new ArrayList() : retornos));
			/* Actualizar valor */
			formdata.remove("SPERSON_SELECTED");
			formdata.put("SPERSON_SELECTED", SPERSON_SELECTED);

			PAC_IAX_RETORNO pac_iax_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map retorno = pac_iax_retorno.ejecutaPAC_IAX_RETORNO__F_BUSCA_CONVENIORETORNO_POL();
			logger.debug("-----> retorno:" + retorno);
			tratarRETURNyMENSAJES(request, retorno);

			BigDecimal PIDCONVENIO = (BigDecimal) retorno.get("PIDCONVENIO");
			BigDecimal PDONDE = (BigDecimal) retorno.get("PDONDE");

			if (!isEmpty(PDONDE)) {

				if (PDONDE.equals(new BigDecimal(0))) {
					if (!isEmpty(PIDCONVENIO))
						formdata.put("TIENECONRET", new BigDecimal(1));
					else
						formdata.put("TIENECONRET", new BigDecimal(0));
				} else {
					if (!isEmpty(PIDCONVENIO))
						formdata.put("TIENECONRET", new BigDecimal(0));
					else
						formdata.put("TIENECONRET", new BigDecimal(1));
				}

			} else {
				if (!isEmpty(PIDCONVENIO))
					formdata.put("TIENECONRET", new BigDecimal(1));
				else
					formdata.put("TIENECONRET", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr192Service m_siguiente");

		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr192Service m_anterior");
		m_validar(request, thisAction, Constantes.ANTERIOR);
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr192Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal codiRetorn = new BigDecimal(0);
			if (!(isEmpty((List) request.getSession().getAttribute("axisctr_retorno"))
					&& direccion == Constantes.ANTERIOR)) {
				Map map = new PAC_IAX_VALIDACIONES((Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_RETORNO();
				logger.debug(map);
				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			}

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Borra un asegurado pasado por SPERSON de la lista de personas de sesi�n.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_delete_retorno(HttpServletRequest request) {
		logger.debug("Axisctr192Service m_delete_intermediario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_DEL");

			Map eliminaBeneficiario = this.dbEliminaRetorno(request, usuario, SPERSON);
			tratarRETURNyMENSAJES(request, eliminaBeneficiario);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_ajax_delete_intermediario", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Borra un asegurado pasado por SPERSON de la lista de personas de sesi�n.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_delete_retorno(HttpServletRequest request) {
		logger.debug("Axisctr192Service m_ajax_delete_intermediario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			if (!isEmpty(request.getSession().getAttribute("axisctr_retorno"))) {
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				List intermediarios = (List) request.getSession().getAttribute("axisctr_retorno");

				// Borrar de BD
				Map eliminaBeneficiario = this.dbEliminaRetorno(request, usuario, NORDEN);
				BigDecimal dbEliminaBeneficiarioReturn = (BigDecimal) ajax
						.rellenarPlAContenedorAjax(eliminaBeneficiario);

				logger.debug("NORDEN" + NORDEN);
				logger.debug("CAGENTE" + CAGENTE);
				logger.debug("dbEliminaBeneficiarioReturn" + dbEliminaBeneficiarioReturn);

				if (dbEliminaBeneficiarioReturn.equals(new BigDecimal(0))) {
					// Borrar de la lista de sesi�n
					ajax.guardarContenidoFinalAContenedorAjax(quitaObjetoDeLista(intermediarios,
							bigDecimalToString(CAGENTE), "CAGENTE", "OB_IAX_RETORNO"));
					request.setAttribute("axisctr_retorno",
							((intermediarios == null) ? new ArrayList() : intermediarios));
					intermediarios = null;

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_ajax_delete_intermediario", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Al seleccionar un intermediario, cargamos sus v�nculos en axisctr_retorno.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_beneficiario(HttpServletRequest request) {
		logger.debug("Axisctr192Service AJAX m_ajax_selected_intermediario");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			/*
			 * *****************************************************************************
			 * ************
			 */
			/*
			 * ******************************** INICIALIZA OBJETO
			 * **************************************
			 */
			/*
			 * ******************************** RECUPERA OBJETO
			 * **************************************
			 */
			/*
			 * *****************************************************************************
			 * ************
			 */
			PAC_IAX_PRODUCCION pacIaxProd = new PAC_IAX_PRODUCCION(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pacIaxProd.ejecutaPAC_IAX_PRODUCCION__F_INICIALIZA_RETORNO();
			logger.debug(mapa);
			HashMap resultado = (HashMap) tratarRETURNyMENSAJES(request, mapa);
			ArrayList retorno = new ArrayList();
			Map beneficiario = new HashMap();

			if (!isEmpty(resultado)) {
				retorno = (ArrayList) resultado.get("RETORNO");
				request.setAttribute("axisctr_retorno", retorno);

				for (int i = 0; i < retorno.size(); i++) {
					HashMap mapa_valores = (HashMap) retorno.get(i);
					HashMap mapa_objeto = (HashMap) mapa_valores.get("OB_IAX_RETORNO");

					if (!isEmpty(mapa_objeto)) {
						beneficiario.put("NNUMIDE", mapa_objeto.get("NNUMIDE"));
						beneficiario.put("CTIPIDE", mapa_objeto.get("CTIPIDE"));
						beneficiario.put("TNOMBRE", mapa_objeto.get("TNOMBRE"));
						beneficiario.put("TAPELLI1", mapa_objeto.get("TAPELLI1"));
						beneficiario.put("TAPELLI2", mapa_objeto.get("TAPELLI2"));
						beneficiario.put("DIRECCIONES", mapa_objeto.get("DIRECCIONES"));
					}

				}

			}

			/*
			 * *****************************************************************************
			 * ***********
			 */

			ajax.rellenarPlAContenedorAjax(beneficiario);
			ajax.guardarContenidoFinalAContenedorAjax(beneficiario);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr192Service - m�todo m_ajax_selected_intermediario", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Cargar datos de la persona.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map recuperaDatosBeneficiario(HttpServletRequest request, int num_registro,
			ArrayList lista_retornos_completa) throws Exception {
		Map mapDatosBeneficiario = new HashMap();

		if (!isEmpty(lista_retornos_completa)) {

			Map mapa_pers_retorno = (Map) ((Map) lista_retornos_completa.get(num_registro)).get("OB_IAX_RETORNO");
			BigDecimal SPERSON_REG = (BigDecimal) mapa_pers_retorno.get("SPERSON");
			BigDecimal CTIPPER = (BigDecimal) mapa_pers_retorno.get("CTIPPER");

			String TSEXPER = (String) mapa_pers_retorno.get("TSEXPER");
			String TAPELLI1 = (String) mapa_pers_retorno.get("TAPELLI1");
			String TNOMBRE = (String) mapa_pers_retorno.get("TNOMBRE");
			String TAPELLI2 = (String) mapa_pers_retorno.get("TAPELLI2");
			String SNIP = (String) mapa_pers_retorno.get("SNIP");
			String NNUMIDE = (String) mapa_pers_retorno.get("NNUMIDE");
			// String FNACIMI = (String);

			ArrayList lista_direcciones = (ArrayList) mapa_pers_retorno.get("DIRECCIONES");

			mapDatosBeneficiario.put("SPERSON", SPERSON_REG);
			mapDatosBeneficiario.put("TSEXPER", TSEXPER);
			mapDatosBeneficiario.put("TAPELLI1", TAPELLI1);
			mapDatosBeneficiario.put("TAPELLI2", TAPELLI2);
			mapDatosBeneficiario.put("TNOMBRE", TNOMBRE);
			mapDatosBeneficiario.put("SNIP", SNIP);
			mapDatosBeneficiario.put("NNUMIDE", NNUMIDE);
			mapDatosBeneficiario.put("FNACIMI", mapa_pers_retorno.get("FNACIMI"));
			mapDatosBeneficiario.put("DIRECCIONES", lista_direcciones);
			mapDatosBeneficiario.put("CTIPPER", CTIPPER);

		}

		return mapDatosBeneficiario;
	}

}
