package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_RELACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm075Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm075Service.java
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axisadm075Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	class e_recibo_repetido extends Exception {
	}

	/**
	 * 
	 * @param request
	 */

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		List LSTRECIBOS = null;
		try {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm075Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap POB_LIQUIDA = null;
		List LSTLIQUIDACIONES = new ArrayList<HashMap>();
		BigDecimal CCOMPANI = null;
		try {
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm075Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisadm075Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal PCEMPRES = usuario.getCempres();
			BigDecimal PSPROLIQ = getCampoNumerico(request, "NLIQUIDA");
			String PLISTARECIBOS = null;
			Date PFRETRO = stringToSqlDate(getCampoTextual(request, "FRETROCESION"));

			PAC_IAX_RELACIONES pac_iax_relaciones = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			ArrayList lstrecibos = (ArrayList) request.getSession().getAttribute("LSTRECIBOS");
			logger.debug("--> lstrecibos: " + lstrecibos);
			if (!isEmpty(lstrecibos)) {
				HashMap r = new HashMap();
				for (int i = 0; i < lstrecibos.size(); i++) {
					r = (HashMap) lstrecibos.get(i);
					BigDecimal marcado = (BigDecimal) r.get("MARCADO");
					logger.debug("--> marcado: " + marcado);
					if (marcado.equals(new BigDecimal(1))) {
						BigDecimal motivo = (BigDecimal) r.get("CMOTIVO");
						logger.debug("--> motivo: " + motivo);
						if (isEmpty(motivo)) {
							throw new e_recibo_repetido();
						}

						if (isEmpty(PLISTARECIBOS)) {
							PLISTARECIBOS = r.get("NRECIBO").toString() + "," + r.get("CMOTIVO").toString() + ";";
						} else {
							PLISTARECIBOS = PLISTARECIBOS + r.get("NRECIBO").toString() + ","
									+ r.get("CMOTIVO").toString() + ";";
						}
					}
				}
			}
			logger.debug("--> PLISTARECIBOS: " + PLISTARECIBOS);

			Map map = pac_iax_relaciones.ejecutaPAC_IAX_RELACIONES__F_SET_RETRO_COBRO_MASIVO(PCEMPRES, PSPROLIQ,
					PLISTARECIBOS, PFRETRO);
			logger.debug("--> retro: " + map);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {

				request.getSession().setAttribute("LSTRECIBOS", null);
				formdata.remove("NLIQUIDA");
				BigDecimal psmovagr = (BigDecimal) map.get("PSMOVAGR");
				logger.debug("--> psmovagr: " + psmovagr);

				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM075"),
								new String("GENERAL"), null);

				List<Map> maps = (List<Map>) map.get("PCURCONFIGSINF");
				String MAPS = new String("|");
				for (Map registro : maps) {
					String CMAP = (String) registro.get("CMAP");
					if (!isEmpty(CMAP)) {
						MAPS = MAPS.toString() + CMAP.toString() + new String("|");
					}
				}

				map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM075"),
								new String("GENERAL"), null, MAPS, new String("|CIDIOMA:" + usuario.getCidioma()
										+ "|CSMOVAGR:" + psmovagr + "|CSPROLIQ:" + PSPROLIQ + "|"));

				logger.debug("--> listados: " + map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					formdata.put("LIST_FICHEROS", map.get("VTIMP"));
				}

			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.cargarCombos(request);
		} catch (e_recibo_repetido ex) {
			thisAction.guardarMensaje(request, "9904187", new Object[] { null }, Constantes.MENSAJE_ERROR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm075Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarCombos(HttpServletRequest request) throws Exception {

		BigDecimal NEW = getCampoNumerico(request, "NEW");
		BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800103));
		formdata.put("LSTMOTIVOS", (List) tratarRETURNyMENSAJES(request, map));
	}

	public void m_buscar_rec(HttpServletRequest request, Axisadm075Action thisAction) {
		logger.debug("Axisadm075Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Exception e_recibo_repetido;
			BigDecimal pP_NRECIBO = getCampoNumerico(request, "NRECIBO");

			ArrayList lstrecibos = (ArrayList) request.getSession().getAttribute("LSTRECIBOS");
			if (isEmpty(lstrecibos)) {
				lstrecibos = new ArrayList();
			} else {
				HashMap r = new HashMap();
				for (int i = 0; i < lstrecibos.size(); i++) {
					r = (HashMap) lstrecibos.get(i);
					BigDecimal nrecibo = (BigDecimal) r.get("NRECIBO");
					if (nrecibo.equals(pP_NRECIBO)) {
						throw new e_recibo_repetido();

					}

				}
			}

			PAC_IAX_RELACIONES pac_iax_relaciones = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_relaciones.ejecutaPAC_IAX_RELACIONES__F_GET_REG_RETRO_COBRO_MASIVO(pP_NRECIBO);
			logger.debug("F_GET_REG_RETRO_COBRO_MASIVO devuelve: " + map);

			tratarRETURNyMENSAJES(request, map);

			ArrayList m = (ArrayList) map.get("PRECIBO");
			if (!isEmpty(m)) {
				Map recibo = (Map) m.get(0);
				recibo.put("MARCADO", new BigDecimal(0));
				recibo.put("CMOTIVO", null);
				logger.debug("recibo: " + recibo);
				lstrecibos.add(recibo);
				logger.debug("lstrecibos: " + lstrecibos);
			}

			request.getSession().setAttribute("LSTRECIBOS", lstrecibos);
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (e_recibo_repetido ex) {

			thisAction.guardarMensaje(request, "9902499", new Object[] { null }, Constantes.MENSAJE_ERROR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm075Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_marcar_motivo(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_ajax_marcar_motivo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal pP_NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CMOTIVO = getCampoNumerico(request, "CMOTIVO");
			String CAMPO = getCampoTextual(request, "CAMPO");
			BigDecimal VALOR = getCampoNumerico(request, "VALOR");

			ArrayList lstrecibos = (ArrayList) request.getSession().getAttribute("LSTRECIBOS");

			HashMap r = new HashMap();
			for (int i = 0; i < lstrecibos.size(); i++) {
				r = (HashMap) lstrecibos.get(i);
				BigDecimal nrecibo = (BigDecimal) r.get("NRECIBO");
				if (nrecibo.equals(pP_NRECIBO)) {
					r.put(CAMPO, VALOR);
					break;
				}
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_marcar_todo(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_ajax_marcar_todo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			ArrayList lstrecibos = (ArrayList) request.getSession().getAttribute("LSTRECIBOS");
			logger.debug("lstrecibos: " + lstrecibos);
			HashMap r = new HashMap();
			for (int i = 0; i < lstrecibos.size(); i++) {
				r = (HashMap) lstrecibos.get(i);
				r.put("MARCADO", new BigDecimal(1));

			}
			logger.debug("lstrecibos: " + lstrecibos);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo  m_ajax_marcar_todo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_desmarcar_todo(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_ajax_desmarcar_todo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			ArrayList lstrecibos = (ArrayList) request.getSession().getAttribute("LSTRECIBOS");

			HashMap r = new HashMap();
			for (int i = 0; i < lstrecibos.size(); i++) {
				r = (HashMap) lstrecibos.get(i);
				r.put("MARCADO", new BigDecimal(0));

			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo  m_ajax_desmarcar_todo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_buscar_liq(HttpServletRequest request, Axisadm075Action thisAction) {
		logger.debug("Axisadm075Service m_recliqui");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Exception e_recibo_repetido;
			BigDecimal PNLIQMEN = getCampoNumerico(request, "NLIQUIDA");

			ArrayList lstrecibos = new ArrayList();

			PAC_IAX_RELACIONES pac_iax_relaciones = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_relaciones.ejecutaPAC_IAX_RELACIONES__F_GET_RETRO_COBRO_MASIVO(usuario.getCempres(),
					PNLIQMEN, null);
			logger.debug("F_GET_RETRO_COBRO_MASIVO devuelve: " + map);

			tratarRETURNyMENSAJES(request, map);

			ArrayList m = (ArrayList) map.get("RETURN");
			if (!isEmpty(m)) {
				for (int i = 0; i < m.size(); i++) {
					Map recibo = (Map) m.get(i);
					recibo.put("MARCADO", new BigDecimal(0));
					recibo.put("CMOTIVO", null);
					logger.debug("recibo: " + recibo);
					lstrecibos.add(recibo);
					logger.debug("lstrecibos: " + lstrecibos);
				}
			}

			request.getSession().setAttribute("LSTRECIBOS", lstrecibos);
			this.cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (e_recibo_repetido ex) {

			thisAction.guardarMensaje(request, "9902499", new Object[] { null }, Constantes.MENSAJE_ERROR);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm075Service - m�todo m_recliqui", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisadm075Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");

			request.getSession().removeAttribute("CFICHERO");
			String[] C_FICHERO_OUT = { "RETURN" };

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}

				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
