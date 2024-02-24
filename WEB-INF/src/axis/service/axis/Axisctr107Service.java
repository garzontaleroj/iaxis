package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ASEGURADORAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr107Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisage006Service.java 29/12/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr107Service extends AxisBaseService {
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
		logger.debug("Axisctr107Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String CCODDGS = getCampoTextual(request, "CCODDGS");

			logger.debug("CODDGS_SERVICE:" + CCODDGS + "formdata:" + formdata.get("CCODDGS"));

			request.setAttribute("datos_aseg", null);
			if (isEmpty(formdata.get("NCONTADOR"))) {
				formdata.put("NCONTADOR", 0);
			}
			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			if (!isEmpty(CCODDGS)) {

				PAC_IAX_ASEGURADORAS pacIaxAseguradoras = new PAC_IAX_ASEGURADORAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				/* Cargar datos aseg */
				HashMap map = pacIaxAseguradoras.ejecutaPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(null, null, null, null,
						CCODDGS, null, null);
				logger.debug(map);

				if (map.get("ASEGURADORAS") != null && ((ArrayList) map.get("ASEGURADORAS")).size() > 0) {
					HashMap m2 = (HashMap) ((HashMap) ((ArrayList) map.get("ASEGURADORAS")).get(0))
							.get("OB_IAX_ASEGURADORAS");
					logger.debug(m2);

					if (new BigDecimal(0).equals(map.get("RETURN"))) {
						// formdata.put("datos_aseg", m2);
						request.setAttribute("datos_aseg", m2);
						logger.debug(m2);
					}

					ArrayList listaDepo = new ArrayList();
					listaDepo = (ArrayList) m2.get("L_DEPOSITARIAS");

					logger.debug(listaDepo);
					request.setAttribute("listaDepo", listaDepo);

				}

				tratarRETURNyMENSAJES(request, map);

			}

			// Lista tipo de cuentas
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPCCC();
			logger.debug("cccc:" + map);
			LISTVALORES.put("TIPCCC", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr107Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_grabar(HttpServletRequest request, Axisctr107Action thisAction) {
		logger.debug("Axisctr107Service m_grabar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String vccodaseg = this.getCampoTextual(request, "CCODASEG");
			String vcbancar = this.getCampoTextual(request, "CBANCAR");
			String vccoddgs = this.getCampoTextual(request, "CCODDGS");
			BigDecimal vsperson = this.getCampoNumerico(request, "SPERSON");
			BigDecimal vccodban = this.getCampoNumerico(request, "CCODBAN");
			BigDecimal vcempres = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal vccoddep = this.getCampoNumerico(request, "CCODDEP");
			BigDecimal vctipban = this.getCampoNumerico(request, "CTIPBAN");
			BigDecimal vclistblanc = this.getCampoNumerico(request, "CLISTBLANC");

			if (!isEmpty(vcbancar) && !isEmpty(vctipban)) {
				vcbancar = vcbancar.replaceAll("-", "");

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(vctipban, vcbancar);
				logger.debug(map);

				if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map))) {

					HashMap m = new PAC_IAX_ASEGURADORAS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_ASEGURADORAS__F_SET_ASEGURADORAS(vccodaseg, vsperson, vccodban, vcbancar,
									vcempres, vccoddep, vccoddgs, vctipban, vclistblanc);

					logger.debug(m);
					if (new BigDecimal(0).equals(m.get("RETURN"))) {
						tratarRETURNyMENSAJES(request, m);
					}
					// if (((BigDecimal)tratarRETURNyMENSAJES(request, m, false)).intValue()==0 ){
					// formdata.put("missatge_OK",this.obtenerMensajes(m));
					// formdata.put("recargar","0");
					// }
				} else {
					request.setAttribute("datos_aseg.CODDGS", vccoddgs);
				}

			} else {
				HashMap m = new PAC_IAX_ASEGURADORAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_ASEGURADORAS__F_SET_ASEGURADORAS(vccodaseg, vsperson, vccodban, vcbancar,
								vcempres, vccoddep, vccoddgs, vctipban, vclistblanc);

				logger.debug(m);
				if (new BigDecimal(0).equals(m.get("RETURN"))) {
					tratarRETURNyMENSAJES(request, m);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr107Service - m�todo m_grabar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// this.configForm(request, whoami(this));
			// this.cargaDependencias(request,
			// (List)request.getAttribute("DEPENDENCIAS"));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE AJAX
	 ****************************************************/
	/*********************************************************************************************************************/

	public void m_ajax_banc(HttpServletRequest request) {

		logger.debug("Axisctr107Service m_ajax_banc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal TIPBAN = getCampoNumerico(request, "CTIPBAN");
			String BANCAR = getCampoTextual(request, "CBANCAR");

			BANCAR = BANCAR.replaceAll("-", "");

			HashMap m = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_VALIDACCC(TIPBAN, BANCAR);
			logger.debug(m);

			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr107Service - m�todo m_ajax_banc", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_pers(HttpServletRequest request) {

		logger.debug("Axisctr107Service m_ajax_depo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal PERSO = getCampoNumerico(request, "SPERSON");

			HashMap m = new PAC_IAX_ASEGURADORAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ASEGURADORAS__F_GET_NOMASEG(PERSO);
			logger.debug(m);

			// Map resultado = new HashMap();

			// Object[] resultadoAjax =
			// (Object[])ajax.rellenarPlAContenedorAjax(m);

			if (m.get("RETURN") != null) {
				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			} else {
				logger.debug("error");
				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_ccompani_traspas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_depo(HttpServletRequest request) {

		logger.debug("Axisctr107Service m_ajax_depo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CODDEP = getCampoNumerico(request, "CCODDEP");

			HashMap m = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_GET_OB_PDEPOSITARIAS(CODDEP);
			logger.debug(m);

			// Map resultado = new HashMap();

			// Object[] resultadoAjax =
			// (Object[])ajax.rellenarPlAContenedorAjax(m);

			if (m.get("RETURN").equals(new BigDecimal(0))) {
				HashMap m2 = (HashMap) m.get("PDEPOSITARIAS");

				ajax.rellenarPlAContenedorAjax(m2);
				ajax.guardarContenidoFinalAContenedorAjax(m2);
			} else {
				logger.debug("error");
				ajax.rellenarPlAContenedorAjax(m);
				ajax.guardarContenidoFinalAContenedorAjax(m);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_ccompani_traspas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	public void m_ajax_aseg(HttpServletRequest request) {

		logger.debug("Axisctr107Service m_ajax_aseg");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODDGS = getCampoTextual(request, "CCODDGS");

			// HashMap m =
			// new
			// PAC_IAX_ASEGURADORAS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_ASEGURADORAS__F_GET_OB_ASEGURADORAS(null,CODDGS);
			// logger.debug(m);
//-----------------------------------
			/* Cargar datos aseg */
			HashMap map = new PAC_IAX_ASEGURADORAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ASEGURADORAS__F_GET_ASEGURADORAS(null, null, null, null, CODDGS, null, null);
			logger.debug(map);
			/*
			 * if
			 * (map.get("ASEGURADORAS")!=null&&((ArrayList)map.get("ASEGURADORAS")).size()>
			 * 0) { HashMap
			 * m2=(HashMap)((HashMap)((ArrayList)map.get("ASEGURADORAS")).get(0)).get(
			 * "OB_IAX_ASEGURADORAS"); logger.debug(m2);
			 * 
			 * if (new BigDecimal(0).equals(map.get("RETURN"))) {
			 * //formdata.put("datos_aseg", m2); request.setAttribute("datos_aseg", m2);
			 * logger.debug(m2); }
			 * 
			 * ArrayList listaDepo = new ArrayList(); listaDepo =
			 * (ArrayList)m2.get("L_DEPOSITARIAS");
			 * 
			 * logger.debug(listaDepo); request.setAttribute("listaDepo",listaDepo);
			 * 
			 * }
			 * 
			 * 
			 * tratarRETURNyMENSAJES(request, map);
			 * 
			 * 
			 * }
			 */

//-----------------------------------

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				// HashMap m2=(HashMap)m.get("OB_ASEG");

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			} else {
				logger.debug("error");
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr093Service - m�todo m_ajax_ccompani_traspas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	private String obtenerMensajes(HashMap m) {
		ArrayList arraym = (ArrayList) m.get("MENSAJES");
		String TERROR = "";
		if (!isEmpty(arraym) && arraym.size() > 0) {
			HashMap mm = (HashMap) arraym.get(0);
			TERROR = String.valueOf(((HashMap) mm.get("OB_IAX_MENSAJES")).get("TERROR"));
		}
		return TERROR;
	}

	public void m_bborrar_depo(HttpServletRequest request, Axisctr107Action thisAction) {
		logger.debug("Axisctr107Service m_borrar_depo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCODDEP = getCampoNumerico(request, "CODEP");
			BigDecimal CCODASEG = getCampoNumerico(request, "CCODASEG");

			logger.debug("aseg,dep:" + CCODASEG + "," + CCODDEP);
			HashMap m0 = new PAC_IAX_PENSIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PENSIONES__F_DEL_PDEPOSITARIAS(CCODASEG, null, CCODDEP);

			logger.debug(m0);
			tratarRETURNyMENSAJES(request, m0);

			formdata.put("RECARGAR", "SI");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar_aseg(HttpServletRequest request, Axisctr107Action thisAction) {
		logger.debug("Axisctr107Service m_borrar_depo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCODASEG = getCampoNumerico(request, "CCODASEG");

			logger.debug("aseg,dep:" + CCODASEG);
			HashMap m0 = new PAC_IAX_ASEGURADORAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ASEGURADORAS__F_DEL_ASEGURADORAS(CCODASEG, null);

			logger.debug(m0);
			tratarRETURNyMENSAJES(request, m0);

			formdata.put("RECARGAR", "SI");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm012Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

}
