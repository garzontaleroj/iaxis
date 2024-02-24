package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axismap001Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axismap001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = this.getCampoTextual(request, "CMAPEAD");
			if (!isEmpty(CMAPEAD)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_CABECERAMAP(CMAPEAD);
				logger.debug(m);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.put("COMENTARIO", m.get("PTCOMENTARIO"));
					formdata.put("TIPOTRAT", m.get("PTIPOTRAT"));
					m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCABTRATAR(CMAPEAD);
					logger.debug(m);
					formdata.put("cabtratar", this.tratarRETURNyMENSAJES(request, m));
					m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPCOMODIN(CMAPEAD);
					logger.debug(m);
					formdata.put("comodin", this.tratarRETURNyMENSAJES(request, m));
				}

				this.cargarCombos(request);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	private void cargarCombos(HttpServletRequest request) {
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");
			Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_LSTTABLAHIJOS(CMAPEAD);
			logger.debug(m);

			formdata.put("lsttablahijos", this.tratarRETURNyMENSAJES(request, m));

			m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(CMAPEAD, null);
			logger.debug(m);
			formdata.put("lstdetalle", this.tratarRETURNyMENSAJES(request, m));

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(503));
			formdata.put("lstTipo", this.tratarRETURNyMENSAJES(request, map));
			logger.debug(map);
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(501));
			formdata.put("lstCarga", this.tratarRETURNyMENSAJES(request, map));
			logger.debug(map);
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(504));
			logger.debug(map);
			formdata.put("lstSetWhere", this.tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_ajax_actualizar(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			String TCONDICION = this.getCampoTextual(request, "TCONDICION");
			String TMASCARA = this.getCampoTextual(request, "TTEXTO");
			String TCAMPO = this.getCampoTextual(request, "TCAMPO");
			BigDecimal CTABLA = this.getCampoNumerico(request, "CTABLA");
			BigDecimal NVECES = this.getCampoNumerico(request, "NVECES");

			String CTIPOCAMPO = this.getCampoTextual(request, "CTIPOCAMPO");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");

			/*
			 * Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_SET_MAPDETTRATAR(CMAPEAD, TCAMPO,
			 * TMASCARA, TCONDICION, CTABLA, NVECES, CTIPOCAMPO); logger.debug(m);
			 * 
			 * ajax.guardarContenidoFinalAContenedorAjax(m);
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_cargarDetalleAgente(HttpServletRequest request) {
		logger.debug("Axismap001Service m_cargarDetalleAgente");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMAPEAD = isEmpty(this.getCampoTextual(request, "CMAPEAD"))
					? (String) request.getSession().getAttribute("CMAPEAD")
					: this.getCampoTextual(request, "CMAPEAD");
			if (!isEmpty(CMAPEAD)) {
				Map m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_CABECERAMAP(CMAPEAD);
				logger.debug(m);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.put("COMENTARIO", m.get("PTCOMENTARIO"));
					formdata.put("TIPOTRAT", m.get("PTIPOTRAT"));
				}

				String node_value = this.getCampoTextual(request, "NODE_VALUE");
				String node_label = this.getCampoTextual(request, "NODE_LABEL");

				if (!isEmpty(node_value) && !isEmpty(node_label)) {
					m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_OBJETO(node_value, node_label);
					logger.debug(m);
					formdata.put("obj", this.tratarRETURNyMENSAJES(request, m));

					ArrayList lstobj = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

					BigDecimal NORDFILL = (BigDecimal) ((Map) lstobj.get(0)).get("NORDEN");

					if (!isEmpty(NORDFILL)) {
						m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETALLE(CMAPEAD, NORDFILL);
						logger.debug(m);
						formdata.put("detalle", this.tratarRETURNyMENSAJES(request, m));

						m = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_MAPDETTRATAR(CMAPEAD, NORDFILL);
						logger.debug(m);
						formdata.put("dettratar", this.tratarRETURNyMENSAJES(request, m));

						if (isEmpty(formdata.get("indexdettratar"))) {
							ArrayList list = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

							formdata.put("indexdettratar", new BigDecimal(0));
						}

					}
				}
				this.cargarCombos(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_cargarDetalleAgente", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axismap001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// Eliminar b�squedas anteriores
			request.getSession().removeAttribute("RED_ARBOL");

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMAPEAD = this.getCampoTextual(request, "CMAP");

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_GET_ARBOL(CMAPEAD);

			logger.debug(map);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(RETURN)) {
				formdata.put("CMAPEAD", CMAPEAD);
				// recuperarArbolPadres(request, pac_iax_redcomercial, CEMPRESA, FINICIO,
				// RETURN, 0);
				request.setAttribute("RED_ARBOL", RETURN);
				logger.debug(RETURN);
				request.setAttribute("buscarOK", true);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	@SuppressWarnings("all")
	public void m_borrar(HttpServletRequest request) {
		logger.debug("Axismap001Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMAPEAD = this.getCampoTextual(request, "CMAPEAD");
			String TPARE = this.getCampoTextual(request, "TPARE");
			String TTAG = this.getCampoTextual(request, "TTAG");
			BigDecimal NORDFILL = this.getCampoNumerico(request, "NORDFILL");

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_DEL_MAPXML(CMAPEAD, TPARE, NORDFILL, TTAG);

			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_borrar_detalle(HttpServletRequest request) {
		logger.debug("Axismap001Service m_borrar_detalle");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMAPEAD = this.getCampoTextual(request, "CMAPEAD");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_DEL_MAPDETALLE(CMAPEAD, NORDEN);

			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_borrar_detalle", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_borrar_dettratar(HttpServletRequest request) {
		logger.debug("Axismap001Service m_borrar_dettratar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_MAP pac_iax_map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMAPEAD = this.getCampoTextual(request, "CMAPEAD");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");

			BigDecimal NVECES = this.getHiddenCampoNumerico(request, "NVECES");
			String TCAMPO = this.getHiddenCampoTextual(request, "TCAMPO");
			BigDecimal CTABLA = this.getHiddenCampoNumerico(request, "CTABLA");
			String CTIPCAMPO = this.getHiddenCampoTextual(request, "CTIPCAMPO");
			String TMASCARA = this.getHiddenCampoTextual(request, "TMASCARA");
			String TCONDICION = this.getHiddenCampoTextual(request, "TCONDICION");
			String TSETWHERE = this.getHiddenCampoTextual(request, "TSETWHERE");

			Map map = pac_iax_map.ejecutaPAC_IAX_MAP__F_DEL_MAPDETTRATAR(CMAPEAD, TCONDICION, CTABLA, NVECES, TCAMPO,
					NORDEN, TSETWHERE);

			logger.debug(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismap001Service - m�todo m_borrar_dettratar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
		}
	}

}
