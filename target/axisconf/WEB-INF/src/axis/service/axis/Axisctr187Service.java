package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr187Service extends AxisBaseService {
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
	protected Map dbLeeGestores(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO, BigDecimal SPRODUC)
			throws Exception {
		// TODO: SE HA SUBSTITUIDO EL LEEASEGURADOS POR EL LEEGESCOBRO
		// Map map = new
		// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO,
		// SPRODUC);
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGESCOBRO();
		logger.debug(map);
		return map;
	}

	/**
	 * Recupera un asegurado especificado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		// Map map = new
		// PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(SPERSON);
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTORCOBRO(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Inserta un asegurado en la BD.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbInsertGestor(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON, BigDecimal CDOMICI)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARGESCOBRO(SPERSON, CDOMICI);
		logger.debug(map);
		return map;
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

	/**
	 * Cambia un asegurado seleccionado por otro.
	 * 
	 * @param usuario
	 * @param SPERSON2MODIFY
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbCambiaPersonaTomAse(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON2MODIFY,
			BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(SPERSON2MODIFY, SPERSON, "A");
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve 1 � 0 seg�n se permitan o no multiregistros.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbPermitirMultiRegistro(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG();
		logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	private Map dbGetLstDomiPerson(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
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
	private Map dbEliminaAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAASEGURADO(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve la lista de v�nculos asegurado/tomador posibles.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbGetTipoVinculos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOVINCULOS();
		logger.debug(map);
		return map;
	}

	/**
	 * Graba un asegurado en funci�n de su SPERSON y su CODI de V�nculo.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @param CODI
	 * @return
	 * @throws Exception
	 */
	private Map dbGrabaAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON, BigDecimal CODI)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAASEGURADOS(SPERSON, CODI, null, null, null);
		logger.debug(map);
		return map;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_init");
		try {
			m_form(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			logger.debug("SSEGURO :: " + SSEGURO + " SPRODUC :: " + SPRODUC);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SPRODUC", SPRODUC);
			// Para gestionar multiregistro del displayTag (1-Multiregistro, 0->un s�lo
			// registro)
			BigDecimal multiRegistro = this.dbPermitirMultiRegistro(request, usuario);
			if (multiRegistro != null)
				formdata.put("axisctr_multi_registro_asegurados", new Integer(multiRegistro.intValue()));

			// Carga de asegurados
			ArrayList asegurados;

			asegurados = (ArrayList) tratarRETURNyMENSAJES(request, dbLeeGestores(request, usuario, NRIESGO, SPRODUC));

			formdata.put("axisctr_gestores", ((asegurados == null) ? new ArrayList() : asegurados));

			BigDecimal SPERSON_GEST = this.getCampoNumerico(request, "SPERSON_GEST");

			// if (!isEmpty(asegurados) && asegurados.size() > 0 ){ // TODO:SIEMPRE porque
			// no hay array && isEmpty(SPERSON_GEST)

			if (!isEmpty(asegurados) && asegurados.size() > 0 && isEmpty(SPERSON_GEST)) {
				HashMap mm = (HashMap) asegurados.get(0);
				HashMap asegurado = (HashMap) mm.get("OB_IAX_GESCOBROS");
				logger.debug("asegurado : " + asegurado);
				formdata.put("SPERSON_GEST", asegurado.get("SPERSON"));
				formdata.put("CDOMICI_GEST", asegurado.get("CDOMICI"));
				formdata.put("obgestor", asegurado);

				/* *************** RECUPERAMOS DIRECCIONES ********************** */

				HashMap m_direcciones = (HashMap) asegurados.get(0);
				HashMap gestor = (HashMap) m_direcciones.get("OB_IAX_GESCOBROS");
				logger.debug("gestor : " + gestor);
				formdata.put("SPERSON_GEST", gestor.get("SPERSON"));
				logger.debug("sperson : " + gestor.get("SPERSON"));
				formdata.put("obgestor", gestor);

				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(gestor.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				formdata.put("lstdomicilios_gestor", direcciones);

				if (!isEmpty(direcciones) && direcciones.size() == 1) {
					HashMap m = (HashMap) direcciones.get(0);
					// TODO:Esto se ha quitado funci�n: GET_ASEGURADO!!-
					// this.actualizarTomador(request,new
					// BigDecimal(String.valueOf(gestor.get("SPERSON"))),new
					// BigDecimal(String.valueOf(m.get("CDOMICI"))),new
					// BigDecimal(String.valueOf(tomador.get("ISASEG"))));
					// asegurados = (ArrayList)this.dbLeeGestores(request,usuario,NRIESGO,SPRODUC);
					asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
							this.dbLeeGestores(request, usuario, NRIESGO, SPRODUC));
					m_direcciones = (HashMap) asegurados.get(0);
					gestor = (HashMap) m_direcciones.get("OB_IAX_GESCOBROS");
				}

				ArrayList lista = (ArrayList) gestor.get("DIRECCIONES");

				BigDecimal CDOMICI_GEST = getCampoNumerico(request, "CDOMICI_GEST");

				if (isEmpty(CDOMICI_GEST)) {
					formdata.put("CDOMICI_GEST", this.getCdomici(request, lista));
				}

				/* ************************************************************** */

			} else { // TODO: ELIMINAR ELSE ENTERO Y CAMBIAR IF : ALERTALCF

				/*
				 * *****************************************************************************
				 * *******************
				 */
				/*
				 * *****************************************************************************
				 * *******************
				 */
				/*
				 * *****************************************************************************
				 * *******************
				 */

				if (!isEmpty(SPERSON_GEST) && !isEmpty(asegurados) && asegurados.size() > 0) {

					// Map map = this.dbGetTomador(request,usuario,SPERSON_TOMAD);
					Map gestor = (Map) tratarRETURNyMENSAJES(request,
							this.dbGetAsegurado(request, usuario, SPERSON_GEST));
					logger.debug("LISTA DE GESTORES BBDD ->" + gestor);
					formdata.put("obgestor", gestor);

					Map mm = this.dbGetLstDomiPerson(request, usuario, SPERSON_GEST);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mm);
					formdata.put("lstdomicilios_gestor", direcciones);
					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap lstdir = (HashMap) direcciones.get(0);
						this.actualizarGestor(request, SPERSON_GEST,
								new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))), NRIESGO, SPRODUC);
						asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
								this.dbLeeGestores(request, usuario, NRIESGO, SPRODUC));
						gestor = this.getGestor(request, asegurados, SPERSON_GEST);
					}
					ArrayList direcc = (ArrayList) gestor.get("DIRECCIONES");

					BigDecimal CDOMICI_GEST = getCampoNumerico(request, "CDOMICI_GEST");

					if (isEmpty(CDOMICI_GEST)) {
						formdata.put("CDOMICI_GEST", this.getCdomici(request, direcc));
					}

					BigDecimal SPERSON = (BigDecimal) gestor.get("SPERSON");
					// BigDecimal activartomador = this.dbActivarTomador(request,
					// usuario,SPRODUC,SPERSON); TODO: Es necesario

				}

				/*
				 * *****************************************************************************
				 * *******************
				 */
				/*
				 * *****************************************************************************
				 * *******************
				 */
				/*
				 * *****************************************************************************
				 * *******************
				 */

			}

			Map varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PAG_OBLIG", SPRODUC);
			BigDecimal valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);

			formdata.put("PAGADOR_OBLIGATORIO", valorParamtero);

			gestionarOrdenacionTablas(request);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_form", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private HashMap getAsegurado(HttpServletRequest request, ArrayList<HashMap> asegurados, BigDecimal SPERSON_GEST) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap ASEGURADO = null;
			if (!isEmpty(asegurados) && asegurados.size() > 0) {
				logger.debug("asegurados-->" + asegurados);
				for (HashMap aseg : asegurados) {
					logger.debug("aseg-->" + aseg);
					logger.debug("OB_IAX_ASEGURADOS:" + aseg.get("OB_IAX_GESCOBROS"));
					HashMap m = (HashMap) aseg.get("OB_IAX_GESCOBROS");
					BigDecimal SPERSON = new BigDecimal(String.valueOf(m.get("SPERSON")));
					if (SPERSON_GEST.intValue() == SPERSON.intValue())
						return m;
				}

			}
			return ASEGURADO;
		} catch (Exception e) {
			return null;
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante SPERSON y la
	 * a�ade en los objetos de sessi�n axisctr_gestores (Lista de personas en
	 * sesi�n) y axisctr_gestor (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_ajax_ver_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			// A�adir persona a lista asegurados
			Map insertAsegurado = this.dbInsertGestor(request, usuario, SPERSON, new BigDecimal("0"));
			BigDecimal insertAseguradoReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(insertAsegurado);
			if (insertAseguradoReturn.equals(new BigDecimal(0))) {
				// A�adir a la lista de sessi�n y recargar displayTag de registros
				Map leeAsegurados = this.dbLeeGestores(request, usuario, NRIESGO, SPRODUC);
				List asegurados = (List) ajax.rellenarPlAContenedorAjax(leeAsegurados);
				Map asegurado = new HashMap();

				// RECUPERAR DATOS ULTIMO ASEGURADO A�ADIDO
				if (!isEmpty(asegurados)) {
					asegurado = (Map) asegurados.get(asegurados.size() - 1);
					ajax.rellenarPlAContenedorAjax(asegurado);

					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					if (!isEmpty(asegurado))
						asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}

				request.getSession().setAttribute("axisctr_gestores",
						((asegurados == null) ? new ArrayList() : asegurados));
				request.getSession().setAttribute("axisctr_gestor", asegurado);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_ajax_ver_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante
	 * SPERSON2MODIFY y la modifica por la persona contenida en SPERSON en los
	 * objetos de sessi�n axisctr_gestores (Lista de personas en sesi�n) y
	 * axisctr_gestor (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_modificar_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_ajax_modificar_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");
			BigDecimal SPERSON2MODIFY = getCampoNumerico(request, "SPERSON_GEST2MODIFY");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(SPERSON2MODIFY)) {
				// Actualizar persona a lista tomadores
				Map cambiaPersonaTomase = this.dbCambiaPersonaTomAse(request, usuario, SPERSON2MODIFY, SPERSON);
				BigDecimal cambiaPersonaTomaseReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(cambiaPersonaTomase);
				if (cambiaPersonaTomaseReturn.equals(new BigDecimal(0))) {
					// A�adir a la lista de sessi�n y recargar displayTag de registros
					Map leeAsegurados = this.dbLeeGestores(request, usuario, NRIESGO, SPRODUC);
					List asegurados = (List) ajax.rellenarPlAContenedorAjax(leeAsegurados);

					// DATOS ULTIMO ASEGURADO A�ADIDO
					Map getAsegurado = this.dbGetAsegurado(request, usuario, SPERSON);
					Map asegurado = (Map) ajax.rellenarPlAContenedorAjax(getAsegurado);

					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);

					request.getSession().setAttribute("axisctr_gestores",
							((asegurados == null) ? new ArrayList() : asegurados));
					request.getSession().setAttribute("axisctr_gestor", asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_ajax_modificar_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardar_gestor(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_guardar_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");

			Map insertAsegurado = this.dbInsertGestor(request, usuario, SPERSON, new BigDecimal("0"));
			this.tratarRETURNyMENSAJES(request, insertAsegurado);
			logger.debug(insertAsegurado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_guardar_tomador", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrar_gestor(HttpServletRequest request, AbstractDispatchAction thisAction) {
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
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_actAsegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal SPERSON_GEST = this.getCampoNumerico(request, "SPERSON_GEST");
			/*
			 * ArrayList listaAsegurados = (ArrayList)this.dbLeeAsegurados(request,
			 * usuario,NRIESGO,SPRODUC); HashMap m =
			 * this.getAsegurado(request,listaAsegurados,SPERSON_GEST);
			 */
			if (!isEmpty(SPERSON_GEST))
				this.dbGetAsegurado(request, usuario, SPERSON_GEST);

			// Map aseguradoBD = (Map)
			// ajax.rellenarPlAContenedorAjax(dbGetAsegurado(request,usuario, SPERSON));

			/*
			 * BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
			 * ArrayList listaTomadores = (ArrayList)this.dbLeeTomadores(request, usuario);
			 * HashMap m = this.getTomador(request,listaTomadores,SPERSON_TOM); BigDecimal
			 * CDOMICI = null; if (!isEmpty(m.get("DIRECCIONES"))){ ArrayList l =
			 * (ArrayList)m.get("DIRECCIONES"); CDOMICI = this.getCdomici(request,l); } if
			 * (!isEmpty(SPERSON_TOM)) this.dbGetTomador(request,usuario,SPERSON_TOM);
			 * 
			 * if (!isEmpty(CDOMICI)){
			 * this.actualizarTomador(request,SPERSON_TOM,CDOMICI,new
			 * BigDecimal(String.valueOf(m.get("ISASEG")))); }
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_actTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cambiar_gestor(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_cambiar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_GEST = this.getCampoNumerico(request, "SPERSON_GEST");
			BigDecimal SPERSON_ANTIGUO = this.getCampoNumerico(request, "SPERSON_ANTIGUO");

			if (!isEmpty(SPERSON_ANTIGUO)) {
				Map cambiaPersonaTomase = this.dbCambiaPersonaTomAse(request, usuario, SPERSON_ANTIGUO, SPERSON_GEST);
				this.tratarRETURNyMENSAJES(request, cambiaPersonaTomase);
				logger.debug("cambiaPersonaTomase : " + cambiaPersonaTomase);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_cambiar_asegurado", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actualizar_gestor(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_cambiar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SPERSON_GEST = this.getCampoNumerico(request, "SPERSON_GEST");

			BigDecimal CDOMICI_GEST = this.getCampoNumerico(request, "CDOMICI_GEST");

			ArrayList asegurados;
			asegurados = (ArrayList) tratarRETURNyMENSAJES(request, dbLeeGestores(request, usuario, NRIESGO, SPRODUC));

			/*
			 * if (!isEmpty(SPERSON_GEST) && !isEmpty(asegurados) && asegurados.size() > 0
			 * ){
			 * 
			 * // Map map = this.dbGetTomador(request,usuario,SPERSON_TOMAD); Map gestor =
			 * (Map) tratarRETURNyMENSAJES(request,
			 * this.dbGetAsegurado(request,usuario,SPERSON_GEST));
			 * logger.debug("LISTA DE GESTORES BBDD ->" + gestor);
			 * formdata.put("obgestor",gestor);
			 * 
			 * Map mm = this.dbGetLstDomiPerson(request,usuario,SPERSON_GEST); ArrayList
			 * direcciones = (ArrayList)tratarRETURNyMENSAJES (request, mm);
			 * formdata.put("lstdomicilios_gestor",direcciones); if (!isEmpty(direcciones)
			 * && direcciones.size()==1){ HashMap lstdir = (HashMap)direcciones.get(0);
			 * this.actualizarGestor(request,SPERSON_GEST,new
			 * BigDecimal(String.valueOf(lstdir.get("CDOMICI"))),NRIESGO,SPRODUC);
			 * asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
			 * this.dbLeeGestores(request,usuario, NRIESGO, SPRODUC)); gestor =
			 * this.getGestor(request,asegurados,SPERSON_GEST); } ArrayList direcc =
			 * (ArrayList)gestor.get("DIRECCIONES");
			 * formdata.put("CDOMICI_GEST",this.getCdomici(request,direcc));
			 * 
			 * BigDecimal SPERSON = (BigDecimal) gestor.get("SPERSON"); //BigDecimal
			 * activartomador = this.dbActivarTomador(request, usuario,SPRODUC,SPERSON);
			 * TODO: Es necesario
			 * 
			 * 
			 * 
			 * }
			 */
			formdata.remove("CDOMICI_GEST");
			if (!isEmpty(CDOMICI_GEST)) {
				this.actualizarGestor(request, SPERSON_GEST, CDOMICI_GEST, NRIESGO, SPRODUC);

				formdata.put("CDOMICI_GEST", CDOMICI_GEST);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_cambiar_asegurado", e);
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
	public void m_ajax_delete_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr187Service m_ajax_delete_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			if (!isEmpty(request.getSession().getAttribute("axisctr_gestores"))) {
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");
				List asegurados = (List) request.getSession().getAttribute("axisctr_gestores");

				// Borrar de BD
				Map eliminaAsegurado = this.dbEliminaAsegurado(request, usuario, SPERSON);
				BigDecimal eliminaAseguradoReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaAsegurado);

				if (eliminaAseguradoReturn.equals(new BigDecimal(0))) {
					// Borrar de la lista de sesi�n
					ajax.guardarContenidoFinalAContenedorAjax(
							quitaObjetoDeLista(asegurados, bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_GESCOBROS"));
					request.getSession().setAttribute("axisctr_gestores",
							((asegurados == null) ? new ArrayList() : asegurados));
					asegurados = null;
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_ajax_delete_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_borrarAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_borrarAsegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_GEST = this.getCampoNumerico(request, "SPERSON_GEST");

			Map eliminaAsegurado = this.dbEliminaAsegurado(request, usuario, SPERSON_GEST);
			this.tratarRETURNyMENSAJES(request, eliminaAsegurado);
			request.removeAttribute("SPERSON_GEST");
			formdata.remove("SPERSON_GEST");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_borrarAsegurado", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Al seleccionar un asegurado, cargamos sus v�nculos en axisctr_gestor.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr187Service AJAX m_selected_asegurado");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			if (request.getSession().getAttribute("axisctr_gestores") != null) {
				// Recuperar lista asegurados y objeto asegurado
				List listaAsegurados = (List) request.getSession().getAttribute("axisctr_gestores");
				Map asegurado = getObjetoDeLista(listaAsegurados, bigDecimalToString(SPERSON), "SPERSON",
						"OB_IAX_GESCOBROS");
				Map aseguradoBD = (Map) ajax.rellenarPlAContenedorAjax(dbGetAsegurado(request, usuario, SPERSON));

				if (!isEmpty(asegurado)) {
					if (!isEmpty(aseguradoBD)) {
						// Actualizar las claves del asegurado de sesi�n con las que vienen de BD
						Object[] keys = aseguradoBD.keySet().toArray();
						for (int i = 0; i < keys.length; i++) {
							if (asegurado.containsKey(keys[i])) {
								asegurado.put(keys[i], aseguradoBD.get(keys[i]));
							}
						}
					}
					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());

					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_gestor", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que sirve para establecer el v�nculo seleccionado (CTVINCULO) al
	 * objeto asegurado.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_vinculo_tomador(HttpServletRequest request) {
		logger.debug("Axisctr187Service AJAX m_ajax_selected_vinculo_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_GEST");
			BigDecimal CODI = getCampoNumerico(request, "CODI");

			if (!isEmpty(SPERSON) && !isEmpty(request.getSession().getAttribute("axisctr_gestor"))) {
				Map grabaAsegurados = this.dbGrabaAsegurados(request, usuario, SPERSON, CODI);
				BigDecimal grabaAseguradosReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(grabaAsegurados);

				if (grabaAseguradosReturn.equals(new BigDecimal(0))) {
					Map asegurado = (Map) request.getSession().getAttribute("axisctr_gestor");
					asegurado.put("CTVINCULO", CODI);
					setObjetoALista((List) request.getSession().getAttribute("axisctr_gestores"), asegurado,
							"OB_IAX_GESCOBROS");
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_gestor", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_siguiente");
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr187Service m_anterior");
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
		logger.debug("Axisctr187Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal codiRetorn = new BigDecimal(0);
			if (!(isEmpty((List) request.getSession().getAttribute("axisctr_gestores"))
					&& direccion == Constantes.ANTERIOR)) {
				// Si la Lista axisctr_gestores est� vac�a y vamos atr�s, no validar asegurados
				// Map map = new
				// PAC_IAX_VALIDACIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS();
				Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS();
				logger.debug(map);
				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			}

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr187Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private BigDecimal getCdomici(HttpServletRequest request, ArrayList<HashMap> domicilios) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			BigDecimal CDOMICI = null;
			if (!isEmpty(domicilios) && domicilios.size() > 0) {
				logger.debug("domicilios-->" + domicilios);
				for (HashMap dom : domicilios) {
					logger.debug("dom-->" + dom);
					logger.debug("CDOMICI:" + dom.get("CDOMICI"));
					HashMap m = (HashMap) dom.get("OB_IAX_DIRECCIONES");
					CDOMICI = new BigDecimal(String.valueOf(m.get("CDOMICI")));
				}

			}
			return CDOMICI;
		} catch (Exception e) {
			return null;
		}

	}

	private void actualizarGestor(HttpServletRequest request, BigDecimal SPERSON, BigDecimal CDOMICI,
			BigDecimal NRIESGO, BigDecimal SPRODUC) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			// ArrayList<HashMap>listaGestores = (ArrayList)this.dbLeeGestores(request,
			// usuario);
			ArrayList gestores = (ArrayList) tratarRETURNyMENSAJES(request,
					this.dbLeeGestores(request, usuario, NRIESGO, SPRODUC));
			Map gestor = this.getAsegurado(request, gestores, SPERSON);
			logger.debug("LISTA DE TOMADOR BBDD ->" + gestor);

			if (!isEmpty(gestor)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					ArrayList direcciones = (ArrayList) gestor.get("DIRECCIONES");
					CDOMICI = this.getCdomici(request, direcciones);
				}

			}

			// Grabar a BD
			Map grabargestores = this.dbInsertGestor(request, usuario, SPERSON, CDOMICI); // TODO: Diferente en
																							// Axisctr002Service -
																							// COMPARAR SU FUNCION SE
																							// PASA EL ISASEG
			logger.debug(grabargestores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_ajax_selected_tomador", e);

		}
	}

	private HashMap getGestor(HttpServletRequest request, ArrayList<HashMap> gestores, BigDecimal SPERSON_GEST) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap gestor = null;
			if (!isEmpty(gestores) && gestores.size() > 0) {
				logger.debug("gestores-->" + gestores);
				for (HashMap gest : gestores) {
					logger.debug("dom-->" + gest);
					logger.debug("OB_IAX_TOMADORES:" + gest.get("OB_IAX_GESCOBROS"));
					HashMap m = (HashMap) gest.get("OB_IAX_GESCOBROS");
					BigDecimal SPERSON = new BigDecimal(String.valueOf(m.get("SPERSON")));
					if (SPERSON_GEST.intValue() == SPERSON.intValue())
						return m;
				}

			}
			return gestor;
		} catch (Exception e) {
			return null;
		}

	}

}
