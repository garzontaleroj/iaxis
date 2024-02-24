package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FACTURAS;
import axis.mvc.control.axis.Axisfis005Action;
import axis.mvc.model.ObIaxAsigfactura;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfis005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisfis005Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisfis005Action thisAction) {
		logger.debug("Axisfis005Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	private ObIaxAsigfactura generarObIaxAsigfactura(String ccarpeta, BigDecimal sfactura, BigDecimal ninicio,
			BigDecimal nfinal, List errores, String userName) throws Exception {

		ObIaxAsigfactura paramFact = null;
		TIaxInfo objErr = null;
		int count = 0;
		List tinfo = errores;

		int n = tinfo.size(); // numero de parametros
		ObIaxInfo[] paramsList = new ObIaxInfo[n];

		ObIaxInfo paramObj = null;
		for (int i = 0; i < tinfo.size(); i++) {
			String value = (String) tinfo.get(i);

			if (!isEmpty(value)) {
				count++;
				paramObj = new ObIaxInfo(value, value, "", new BigDecimal(1));
				paramObj._SQL_NAME = UsuarioBean.fixOwner(userName, "OB_IAX_INFO");
				paramsList[i] = paramObj;
			}

		}
		if (count == 0)
			paramsList = new ObIaxInfo[count];

		objErr = new TIaxInfo(paramsList);
		objErr._SQL_NAME = UsuarioBean.fixOwner(userName, "T_IAX_INFO");

		ObIaxAsigfactura objRet = new ObIaxAsigfactura(ccarpeta, sfactura, ninicio, nfinal, objErr);
		objRet._SQL_NAME = UsuarioBean.fixOwner(userName, "OB_IAX_ASIGFACTURA");

		return objRet;

	}

	private List cvsToList(String str) {
		List ret = new ArrayList();

		StringTokenizer tokens = new StringTokenizer(str, ",");
		while (tokens.hasMoreTokens()) {
			ret.add(tokens.nextToken());
		}
		return ret;
	}

	public void m_asignar(HttpServletRequest request, Axisfis005Action thisAction) {
		logger.debug("Axisfis005Service m_asignar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData()
					.getUserName();
			String CCARPETA = getCampoTextual(request, "CCARPETA");
			BigDecimal SFACTURA = getCampoNumerico(request, "SFACTURA");
			BigDecimal NFINAL = getCampoNumerico(request, "NFINAL");
			BigDecimal NINICIO = getCampoNumerico(request, "NINICIO");
			String ERRORES = getCampoTextual(request, "FOLIOERRORSEND");
			List lstErrs = (ERRORES == null) ? new ArrayList() : cvsToList(ERRORES);
			formdata.put("ERRORES", lstErrs);
			ObIaxAsigfactura objAsiFac = null;
			objAsiFac = generarObIaxAsigfactura(CCARPETA, SFACTURA, NINICIO, NFINAL, lstErrs, USERNAME);
			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_ASIGNA_CARPETA(objAsiFac);

			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				formdata.put("Guardado", "true");
			} else {
				formdata.put("Guardado", "false");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_asignar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_generar(HttpServletRequest request, Axisfis005Action thisAction) {
		logger.debug("Axisfis005Service m_generar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData()
					.getUserName();
			String CCARPETA = getCampoTextual(request, "CCARPETA");

			Map map = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_GENERA_CARPETA(CCARPETA);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				formdata.put("Guardado", "true");
			} else {
				formdata.put("Guardado", "false");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_generar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axisfis005Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String NFACT = getCampoTextual(request, "PNFACT");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "PNORDEN");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_DEL_OBJ_DETFACTURA(NFACT, NORDEN);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_datos_carpeta(HttpServletRequest request) {
		logger.debug("Axisfis005Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CCARPETA = getCampoTextual(request, "CCARPETA");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_SEL_CARPETA(CCARPETA);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_ins_detalle(HttpServletRequest request) {
		logger.debug("Axisfis005Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String PNFACT = getCampoTextual(request, "PNFACT");

			Map m = new PAC_IAX_FACTURAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FACTURAS__F_INSERT_OBJ_DETFACTURA(PNFACT);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis005Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
