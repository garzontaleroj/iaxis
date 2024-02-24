package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisadm031Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axispro018Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm031Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisadm031Action thisAction) {
		logger.debug("Axisadm031Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_INICIALIZAR_REC_REVIS(SDEVOLU);
			logger.debug(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisadm031Action thisAction) {
		logger.debug("Axisadm031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			logger.debug("SDEVOLU : " + SDEVOLU);
			if (!isEmpty(SDEVOLU)) {

				Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DATOS_DEVOLUCION(SDEVOLU);
				logger.debug(m);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					ArrayList dev = (ArrayList) m.get("PDEVOLUCIONES");
					formdata.putAll((Map) dev.get(0));

					m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DATOS_RECIBOS_DEVOL(SDEVOLU);
					logger.debug(m);

					if (!isEmpty(this.tratarRETURNyMENSAJES(request, m))
							&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

						List rebuts = this.mergedObjDevolucions(request, (ArrayList<HashMap>) m.get("PLSTRECIBOS"));

						formdata.put("recibos", rebuts);
					}

					Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800086));
					logger.debug(map);
					listValores.put("lstconcepto", (List) tratarRETURNyMENSAJES(request, map, false));
					formdata.put("listValores", listValores);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private ArrayList mergedObjDevolucions(HttpServletRequest request, ArrayList<HashMap> recibos) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_REC_REVIS(SDEVOLU);
			logger.debug(m);

			ArrayList<HashMap> objrecdev = (ArrayList<HashMap>) m.get("PTSITRECDEV");
			logger.debug("1->" + recibos);

			// bug 0022030
			if (!isEmpty(objrecdev)) {

				for (HashMap r : recibos) {
					BigDecimal NRECIBO = new BigDecimal(String.valueOf(r.get("NRECIBO")));
					logger.debug("NRECIBO->" + NRECIBO);
					logger.debug("objrecdev1->" + objrecdev);
					for (HashMap rod : objrecdev) {
						logger.debug("objrecdev->" + objrecdev);
						HashMap obj = (HashMap) rod.get("OB_IAX_SITRECDEV");
						logger.debug("obj->" + obj);
						BigDecimal NRECIBOobj = new BigDecimal(String.valueOf(obj.get("NRECIBO")));
						logger.debug("NRECIBOobj->" + NRECIBOobj);
						if (NRECIBO.intValue() == NRECIBOobj.intValue()) {
							logger.debug("obj.get(\"CDEVSIT\")->" + obj.get("CDEVSIT"));
							r.put("CDEVSIT", obj.get("CDEVSIT"));
						}
					}
				}
				logger.debug("2->" + recibos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm031Service - m�todo mergedObjDevolucions", e);
		} finally {
			return recibos;
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisadm031Action thisAction) {
		logger.debug("Axisadm031Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_SET_REC_REVIS();
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_generar_listados(HttpServletRequest request, Axisadm031Action thisAction) {
		logger.debug("Axisadm031Service m_generar_listados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			/*
			 * PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new
			 * PAC_IAX_DEVOLUCIONES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			 * logger.debug("SDEVOLU : " + SDEVOLU); Map m =
			 * pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_LISTADO_DEVOL(
			 * SDEVOLU);
			 * 
			 * if (((BigDecimal)this.tratarRETURNyMENSAJES(request,
			 * m)).equals(BigDecimal.ZERO)){ formdata.put("TFILE", m.get("PNOMFICHERO")); }
			 */

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			logger.debug("SDEVOLU : " + SDEVOLU);

			PAC_IAX_CFG pac_axis_cfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_cfg.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISADM031"),
					new String("GENERAL"), null);
			logger.debug(m);

			List<Map> maps = (List<Map>) m.get("PCURCONFIGSINF");
			String MAPS = new String("|");
			for (Map registro : maps) {
				String CMAP = (String) registro.get("CMAP");
				if (!isEmpty(CMAP)) {
					MAPS = MAPS.toString() + CMAP.toString() + new String("|");
				}
			}

			m = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISADM031"),
							new String("GENERAL"), null, MAPS,
							new String("|SDEVOLU:" + SDEVOLU + "|CIDIOMA:" + usuario.getCidioma() + "|"));

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + m);

			formdata.put("LIST_FICHEROS", m.get("VTIMP"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm031Service - m�todo m_generar_listados", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_generar_cartas(HttpServletRequest request, Axisadm031Action thisAction) {
		logger.debug("Axisadm031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			logger.debug("SDEVOLU : " + SDEVOLU);

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CARTAS_DEVOL(SDEVOLU);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO)) {
				formdata.put("TFILE_CARTAS", m.get("PNOMFICHERO"));
				// bug 0022030
				formdata.put("PPLANTILLA", m.get("PPLANTILLA"));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm037Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardarRecRevis(HttpServletRequest request) {
		logger.debug("Axisadm031Service m_guardarRecRevis");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SDEVOLU = this.getCampoNumerico(request, "SDEVOLU");
			logger.debug("SDEVOLU : " + SDEVOLU);
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			logger.debug("NRECIBO : " + NRECIBO);
			BigDecimal CDEVSIT = this.getCampoNumerico(request, "CDEVSIT");
			logger.debug("CDEVSIT : " + CDEVSIT);

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_SET_OBJETO_REC_REVIS(NRECIBO, SDEVOLU,
					CDEVSIT);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr009Service - m�todo m_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_setestimp(HttpServletRequest request) {
		logger.debug("Axisadm031Service m_ajax_setestimp");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_DEVOLUCIONES pac_axis_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSDEVOLU = this.getCampoNumerico(request, "PSDEVOLU");
			logger.debug("PSDEVOLU : " + PSDEVOLU);
			BigDecimal PNRECIBO = this.getCampoNumerico(request, "PNRECIBO");
			logger.debug("PNRECIBO : " + PNRECIBO);
			BigDecimal pPCESTIMP = this.getCampoNumerico(request, "PCESTIMP");
			logger.debug("pPCESTIMP : " + pPCESTIMP);

			Map m = pac_axis_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_SET_ESTIMP_CARTA(PSDEVOLU, PNRECIBO,
					pPCESTIMP);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm031Service - m�todo m_ajax_setestimp", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_setcaccpre(HttpServletRequest request) {
		logger.debug("Axisadm031Service m_ajax_setcaccpre");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPNRECIBO = this.getCampoNumerico(request, "PNRECIBO");
			logger.debug("pPNRECIBO : " + pPNRECIBO);
			;
			BigDecimal pPCACCPRE = this.getCampoNumerico(request, "PCACCPRE");
			logger.debug("pPCACCPRE : " + pPCACCPRE);

			Map m = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_MODIFICA_ACCPRECONOCIDA(pPNRECIBO, pPCACCPRE);

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm031Service m_ajax_setcaccpre", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
