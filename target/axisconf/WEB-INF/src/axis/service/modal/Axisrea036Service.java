package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea036Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisrea036Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea036Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Desplegables
		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal NORDEN = getCampoNumerico(request, "ORDEN");

			BigDecimal TASA = getCampoNumerico(request, "TASA");
			BigDecimal CAPACIDAD = getCampoNumerico(request, "CAPACIDAD");
			String deletedRepos = getCampoTextual(request, "deletedRepos");

			formdata.put("TASA", TASA);
			formdata.put("CAPACIDAD", CAPACIDAD);
			// formdata.put("deletedRepos",deletedRepos);

			if (!isEmpty(CCODIGO)) {

				Map cod_rep = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_COD_REPOSICION(CCODIGO);

				tratarRETURNyMENSAJES(request, cod_rep);
				logger.debug("C�digo reposiciones ************* " + cod_rep);

				formdata.putAll(cod_rep);

				// si tenemos NORDEN estamos modificando, podemos abrir los detalles
				if (!isEmpty(NORDEN)) {
					Map det_rep = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_REPOSICIONES_DET(CCODIGO, NORDEN);
					tratarRETURNyMENSAJES(request, det_rep);

					logger.debug("Detalle reposiciones ************* " + det_rep);
					formdata.putAll(det_rep);
				}

			}

			cargarValoresDesplegables(request, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea036Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @param usuario    El UsuarioBean activo.
	 * @param formdata   HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */
	private

			void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
					throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea030Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo para grabar los datos TRAMOS a objetos de bbdd
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */
	/*
	 * public void m_ajax_grabar(HttpServletRequest request, AbstractDispatchAction
	 * thisAction) { logger.debug("Axisrea036Service m_ajax_guardar"); UsuarioBean
	 * usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * // AjaxContainerService ajax = new AjaxContainerService(); try {
	 * 
	 * 
	 * PAC_IAX_REA pac_axis_rea = new
	 * PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
	 * 
	 * // Datos cabecera
	 * 
	 * BigDecimal CIDIOMA = usuario.getCidioma(); String CMODO =
	 * getCampoTextual(request, "MODO"); String DESCRIPCION =
	 * getCampoTextual(request, "DESCRIPCION"); BigDecimal CCODIGO =
	 * getCampoNumerico(request, "CCODIGO"); BigDecimal ORDEN =
	 * getCampoNumerico(request, "ORDEN");
	 * 
	 * BigDecimal CAPACIDAD = getCampoNumerico(request, "CAPACIDAD"); BigDecimal
	 * TASA = getCampoNumerico(request, "TASA");
	 * 
	 * BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA"); BigDecimal NVERSIO
	 * = getCampoNumerico(request, "NVERSIO"); BigDecimal CTRAMO =
	 * getCampoNumerico(request, "CTRAMO");
	 * 
	 * Si ccodigo es null, estamos creando uno nuevo, por lo tanto vamos a buscar el
	 * ccodigo a base de datos if(isEmpty(CCODIGO)){ Map mapa_ccodigo =
	 * pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MAX_COD_REPOSICION(); List
	 * resultado_ccodigo = (List)tratarRETURNyMENSAJES(request,mapa_ccodigo); Map
	 * maparesultado = (HashMap) resultado_ccodigo.get(0); CCODIGO = (BigDecimal)
	 * maparesultado.get("MAX_CODIGO"); CCODIGO = CCODIGO.add(new BigDecimal(1)); }
	 * 
	 * BigDecimal MODO = null; if(CMODO.equals("MOD")){ MODO = new BigDecimal("2");
	 * }else{ MODO = new BigDecimal("1"); } Map map =
	 * pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_COD_REPOSICION(CCODIGO);
	 * 
	 * BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request,map);
	 * 
	 * logger.debug(resultado+
	 * "******************************************************"+map);
	 * 
	 * BigDecimal resultado2 = null;
	 * 
	 * if(resultado.intValue()==0){ Map mapa_cabecera =
	 * pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REPOSICIONES(CCODIGO,CIDIOMA,
	 * DESCRIPCION);
	 * 
	 * resultado2 = (BigDecimal)tratarRETURNyMENSAJES(request,mapa_cabecera);
	 * 
	 * }
	 * 
	 * 
	 * if(resultado2!=null && resultado2.intValue()==0){ Map mapa_detalle =
	 * pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REPOSICIONES_DET(MODO,CCODIGO,ORDEN,
	 * CAPACIDAD,TASA);
	 * 
	 * Map mapa_rtramo =
	 * pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REPO_TRAMO(CTRAMO,CCODIGO,SCONTRA,
	 * NVERSIO); tratarRETURNyMENSAJES(request,mapa_rtramo); }
	 * 
	 * 
	 * 
	 * //ajax.rellenarPlAContenedorAjax(map); //
	 * ajax.guardarContenidoFinalAContenedorAjax(map);
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el servicio Axisrea036Service - m�todo m_ajax_grabar",
	 * e);
	 * 
	 * thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString()
	 * },Constantes.MENSAJE_ERROR);
	 * 
	 * //ajax.rellenarExcepcionAContenedorAjax(e);
	 * 
	 * 
	 * } finally { //; // request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); this.f_Cargar_Propiedades_Pantalla(request,
	 * this.whoami(this)); } }
	 */

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar(HttpServletRequest request, Axisrea036Action thisAction) {
		logger.debug("Axisctr035Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Datos cabecera */

			BigDecimal CIDIOMA = usuario.getCidioma();
			String CMODO = getCampoTextual(request, "MODO");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");
			// formdata.put("DESCRIPCION", DESCRIPCION);
			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal ORDEN = getCampoNumerico(request, "ORDEN");

			BigDecimal CAPACIDAD = getCampoNumerico(request, "CAPACIDAD");
			BigDecimal TASA = getCampoNumerico(request, "TASA");

			// Si ccodigo es null, estamos creando uno nuevo, por lo tanto vamos a buscar el
			// ccodigo a base de datos
			// Esto lo podriamos hacer dentro de PAC_IAX_REA__F_SET_COD_REPOSICION
			if (isEmpty(CCODIGO)) {
				Map mapa_ccodigo = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MAX_COD_REPOSICION();
				List resultado_ccodigo = (List) tratarRETURNyMENSAJES(request, mapa_ccodigo);
				Map maparesultado = (HashMap) resultado_ccodigo.get(0);
				CCODIGO = (BigDecimal) maparesultado.get("MAX_CODIGO");
				CCODIGO = CCODIGO.add(new BigDecimal(1));
				formdata.put("CCODIGO", CCODIGO);
			}

			BigDecimal MODO = null;
			if (CMODO.equals("MOD")) {
				MODO = new BigDecimal("2");
			} else {
				MODO = new BigDecimal("1");
			}
			HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_COD_REPOSICION(CCODIGO);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			logger.debug(resultado + "******************************************************" + map);

			BigDecimal resultado2 = null;

			if (resultado.intValue() == 0) {

				mensajes.clear();
				Map mapa_cabecera = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REPOSICIONES(CCODIGO, CIDIOMA, DESCRIPCION);

				resultado2 = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_cabecera);

			}

			// Si la reposicion que estamos modificando esta eliminado, la quitaremos del
			// listado de deletedRepos y nos pondremo en modo 2 (modificar)
			String deletedRepos = (String) formdata.get("deletedRepos");
			if (!isEmpty(deletedRepos)) {
				String deletedRepos2 = "";
				String[] nordens = deletedRepos.split(",");
				int i = 0;
				for (i = 0; i < nordens.length; i++) {
					if (!nordens[i].equals(ORDEN.toString())) {
						if (deletedRepos2.length() == 0) {
							deletedRepos2 = nordens[i];
						} else {
							deletedRepos2 = deletedRepos2 + "," + nordens[i];
						}

					} else {
						MODO = new BigDecimal("2");
					}
				}
				formdata.put("deletedRepos", deletedRepos2);
			}

			BigDecimal resultado3 = null;
			if (resultado2 != null && resultado2.intValue() == 0) {
				mensajes.clear();
				Map mapa_detalle = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_REPOSICIONES_DET(MODO, CCODIGO, ORDEN,
						CAPACIDAD, TASA);
				resultado3 = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_detalle);
			}

			if (resultado3 != null && resultado3.intValue() == 0) {
				formdata.put("grabaOK", 1);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea035Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
