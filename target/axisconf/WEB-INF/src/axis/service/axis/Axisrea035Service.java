package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea035Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea035Service.java : Asociaci�n de f�rmulas a garant�as 11/08/2011
 * 
 * @since Java 5.0
 */
public class Axisrea035Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea035Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			formdata.put("CCODIGO", CCODIGO);
			// formdata.clear(); //Limpiamos los valores existentes en el formdata
			BigDecimal mantenimiento = getCampoNumerico(request, "mantenimiento");
			if (isEmpty(mantenimiento)) {
				formdata.put("mantenimiento", "1");
			}

			if (!isEmpty(CCODIGO)) {
				String deletedRepos = (String) formdata.get("deletedRepos");
				Map map_obj_rep = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REA__F_GET_OBJETO_REPOSICION(CCODIGO, deletedRepos);

				tratarRETURNyMENSAJES(request, map_obj_rep);
				Map maparepos = (HashMap) map_obj_rep.get("POBJ_REPOSICION");
				maparepos.put("CCODIGO", CCODIGO);

				formdata.putAll(map_obj_rep);
				logger.debug(map_obj_rep);
			} else {
				// Si no hay codigo, es nueva repo
				formdata.put("modifRepos", "0");
			}

			// BigDecimal CEMPRES=getCampoNumerico(request, "CEMPRESA");
			// Recupera combo contratos
			Map map_contrato = (HashMap) this.dbGetContrato(request, usuario, null);
			List listaContrato = (List) tratarRETURNyMENSAJES(request, map_contrato, false);
			formdata.put("listaContrato", listaContrato);
			logger.debug(map_contrato);

			// Recupera combo versiones
			List listaVersion = new ArrayList();
			HashMap map_version = new HashMap();
			if (!isEmpty(map_contrato) && listaContrato.size() >= 1) {
				// Extraemos el valor del SCONTRA DE LA PRIMERA FILA, la primera vez que
				// entramos en la pantalla

				BigDecimal SCONTRA = null;
				if (!isEmpty(getCampoNumerico(request, "SCONTRA"))) {
					SCONTRA = getCampoNumerico(request, "SCONTRA"); // Cogemos el valor de pantalla
				}

				if (!isEmpty(SCONTRA)) {
					map_version = (HashMap) this.dbGetVersion(request, usuario, SCONTRA, null);
					listaVersion = (List) tratarRETURNyMENSAJES(request, map_version, false);
				}
			}

			BigDecimal NVERSIO_new = getCampoNumerico(request, "NVERSIO");
			BigDecimal NVERSIO_old = BigDecimal.ZERO;
			if (!isEmpty(map_version) && listaVersion.size() >= 1) {
				for (Object o : listaVersion) {
					HashMap hmp = (HashMap) o;
					NVERSIO_old = (BigDecimal) hmp.get("NVERSIO");
				}
			}
			if (NVERSIO_new.compareTo(NVERSIO_old) == 1) {
				formdata.put("newNVERSIO", NVERSIO_new);
			}

			formdata.put("listaVersion", listaVersion);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea035Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea035Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map_tiprease = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA();
			List listaTipReaseg = (List) tratarRETURNyMENSAJES(request, map_tiprease, false);
			formdata.put("listaTipReaseg", listaTipReaseg);
			logger.debug(map_tiprease);
			listaTipReaseg = null;

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea035Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 */
	public

			void m_recargar(HttpServletRequest request) {
		logger.debug("Axisrea035Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			// formdata.clear(); //Limpiamos los valores existentes en el formdata
			formdata.put("CCODIGO", CCODIGO);

			if (!isEmpty(CCODIGO)) {
				Map map_obj_rep = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REA__F_GET_OBJETO_REPOSICION(CCODIGO, null);
				tratarRETURNyMENSAJES(request, map_obj_rep);

				formdata.putAll(map_obj_rep);
				logger.debug(map_obj_rep);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea035Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar(HttpServletRequest request, Axisrea035Action thisAction) {
		logger.debug("Axisctr035Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			BigDecimal CIDIOMA = usuario.getCidioma();
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");

			// Si ccodigo es null, estamos creando uno nuevo, por lo tanto vamos a buscar el
			// ccodigo a base de datos
			if (isEmpty(CCODIGO)) {
				PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa_ccodigo = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_MAX_COD_REPOSICION();
				List resultado_ccodigo = (List) tratarRETURNyMENSAJES(request, mapa_ccodigo);
				Map maparesultado = (HashMap) resultado_ccodigo.get(0);
				CCODIGO = (BigDecimal) maparesultado.get("MAX_CODIGO");
				CCODIGO = CCODIGO.add(new BigDecimal(1));
				formdata.put("CCODIGO", CCODIGO);
			}
			HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
			// Antes de guardar las reposiciones nuevas, vamos a eliminar los detalles de
			// reposiciones que esten deleted en deletedRepos
			String deletedRepos = (String) formdata.get("deletedRepos");
			if (!isEmpty(deletedRepos)) {
				// Eliminamos cuadros por contrato, version, tramo y compa�ia
				String[] repos = deletedRepos.split(",");
				for (String norden : repos) {
					BigDecimal NORDEN = new BigDecimal(norden);

					Map map2 = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_REPOSICIONES_DET(CCODIGO, NORDEN);
				}
				formdata.put("deletedRepos", null);
			}

			Map map_cod = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_COD_REPOSICION(CCODIGO);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map_cod);

			if (resultado.intValue() == 0) {
				mensajes.clear();
				Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_REPOSICIONES(CCODIGO, CIDIOMA, DESCRIPCION);

				logger.debug(map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
					logger.debug("<----- ENTRO IF ---->" + map);
					request.setAttribute("grabarr", new BigDecimal(0));
					formdata.put("grabaOK", 1);
					// formdata.clear();
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea035Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_detalle_reposicion(HttpServletRequest request, Axisrea035Action thisAction) {
		logger.debug("Axisctr035Service m_borrar_tramo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO_DEL");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN_DEL");

			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_REPOSICIONES_DET(CCODIGO, NORDEN);
			logger.debug(map);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map, false))) {
				logger.debug(map);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisrea0035Service - m�todo m_borrar_tramo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private Map dbGetContrato(HttpServletRequest request, UsuarioBean usuario, BigDecimal CEMPRES) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOS(CEMPRES);
		logger.debug("Map de contratos ------------------------------------------------------->" + m);
		return m;
	}

	private Map dbGetVersion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SCONTRA, BigDecimal CEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRA);
		logger.debug("Map de version  ------------------------------------------------------>" + m);
		return m;
	}

	@SuppressWarnings("all")
	public void m_delete_reposiciones(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_delete_contrato");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal pPCCODIGO = getCampoNumerico(request, "CCODIGO");

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REPOSICIONES_DET(pPCCODIGO, null);
			List resultado = (ArrayList) tratarRETURNyMENSAJES(request, map);

			if (resultado != null) {
				int i = 0;
				for (i = 0; i < resultado.size(); i++) {
					Map reposicion_det = (HashMap) resultado.get(i);
					BigDecimal NORDEN = (BigDecimal) reposicion_det.get("NORDEN");
					Map map2 = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_REPOSICIONES_DET(pPCCODIGO, NORDEN);
				}
			}
			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_COD_REPOSICION(pPCCODIGO, CIDIOMA);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
