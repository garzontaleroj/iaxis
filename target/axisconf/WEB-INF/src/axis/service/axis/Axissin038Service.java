package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;

/**
 * Axissin038Service.java 08/02/2009
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axissin038Service extends AxisBaseService {
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
		logger.debug("Axissin038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.configForm(request, whoami(this));
		try {
			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CK_OPCION = this.getHiddenCampoNumerico(request, "CK_OPCION");
			BigDecimal CEMPRES = this.getHiddenCampoNumerico(request, "CEMPRES");

			if (isEmpty(CK_OPCION)) {

				logger.debug("-in CK_OPCION vacio");
				if (VisibleTag.esComponenteVisible(request, "axissin038", "CK_BAJAS")) {
					logger.debug("-in bajas");
					Map m = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(CEMPRES,
							new BigDecimal(2));
					logger.debug("-CK_BAJAS--> m:" + m);
					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
						formdata.put("LSTPRODUCTOS", m.get("PPRODUCTOS"));
						formdata.put("CK_OPCION", new BigDecimal(2));
					}

				} else {
					if (VisibleTag.esComponenteVisible(request, "axissin038", "CK_RENTAS")) {

						Map m = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(CEMPRES,
								new BigDecimal(1));
						logger.debug("--CK_RENTAS--> m:" + m);
						if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
							formdata.put("LSTPRODUCTOS", m.get("PPRODUCTOS"));
							formdata.put("CK_OPCION", new BigDecimal(1));
						}
					}

				}

			} else {

				Map m = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS_OB();
				logger.debug("-OB--> m:" + m);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
					formdata.put("LSTPRODUCTOS", m.get("PPRODUCTOS"));
				}

			}

			Map map2 = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISSIN038"),
							new String("GENERAL"), null);

			if (!isEmpty(map2.get("PCURCONFIGSINF"))) {
				formdata.put("LISTADO", "SI");
			} else {
				formdata.put("LISTADO", "NO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin038Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axissin038Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String pfecha = getCampoTextual(request, "FECHAINI");
			BigDecimal CK_OPCION = this.getHiddenCampoNumerico(request, "CK_OPCION");

			Date FECHAINI = stringToSqlDate(pfecha);

			BigDecimal csproces = null;
			if (!isEmpty(CK_OPCION) && CK_OPCION.intValue() == 2) {
				Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_PAGO_AUT(FECHAINI);
				logger.debug("-----> map:" + map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					formdata.put("COBRADOS", map.get("PNCOBROS"));
					csproces = (BigDecimal) map.get("PSPROCES");
				}
				tratarRETURNyMENSAJES(request, map);
			}

			if (!isEmpty(CK_OPCION) && CK_OPCION.intValue() == 1) {
				Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_PAGO_RENTA_AUT(FECHAINI);
				logger.debug("-----> map:" + map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					formdata.put("COBRADOS_RENTAS", map.get("PNCOBROS"));
					csproces = (BigDecimal) map.get("PSPROCES");
				}
				tratarRETURNyMENSAJES(request, map);
			}

			Map map2 = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(usuario.getCempres(), new String("AXISSIN038"),
							new String("GENERAL"), null);

			List<Map> maps = (List<Map>) map2.get("PCURCONFIGSINF");
			if (!isEmpty(maps) && !isEmpty(csproces)) {
				String MAPS = new String("|");
				for (Map registro : maps) {
					String CMAP = (String) registro.get("CMAP");
					if (!isEmpty(CMAP)) {
						MAPS = MAPS.toString() + CMAP.toString() + new String("|");
					}
				}

				map2 = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_CFG__F_EJECUTAR_INFORME(usuario.getCempres(), new String("AXISSIN038"),
								new String("GENERAL"), null, MAPS,
								new String("|CIDIOMA:" + usuario.getCidioma() + "|CSPROCES:" + csproces + "|"));

				ArrayList ficheros = new ArrayList();
				ficheros = (ArrayList) map2.get("VTIMP");
				logger.debug("---> map generado:" + ficheros);
				formdata.put("LIST_FICHEROS", ficheros);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin038Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_actualitzarProd(HttpServletRequest request) {
		logger.debug("Axissin038Service m_actualitzarProd");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CK_OPCION = this.getHiddenCampoNumerico(request, "CK_OPCION");
			BigDecimal CEMPRES = this.getHiddenCampoNumerico(request, "CEMPRES");

			Map m = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PRODUCTOS_PAGOS(CEMPRES, CK_OPCION);
			logger.debug("-----> m:" + m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("LSTPRODUCTOS", m.get("PPRODUCTOS"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin038Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_ajaxseleccionarProd(HttpServletRequest request) {
		logger.debug("Axissin038Action m_seleccionarProd");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = this.getHiddenCampoNumerico(request, "SPRODUC");
			BigDecimal SELECCIO = this.getHiddenCampoNumerico(request, "SELECCIO");

			Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_MARCAR_PRODUCTO(SPRODUC, SELECCIO);
			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin038Action - m�todo m_seleccionarProd", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
