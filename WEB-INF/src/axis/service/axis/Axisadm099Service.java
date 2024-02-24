package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG_FILE;
import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROYPROVIS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm099Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm099Service.java 01/12/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0
 */
public class Axisadm099Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm099Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map LSTVALORES = new HashMap();

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* LSTPRODUC */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPRODPROYP();
			logger.debug(map);
			LISTVALORES.put("LSTPRODUC", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm099Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm099Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_PROYPROVIS pac_iax_proyprovis = new PAC_IAX_PROYPROVIS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal PSPRODUC = getCampoNumerico(request, "SEL_SPRODUC");
			Map map = pac_iax_proyprovis.ejecutaPAC_IAX_PROYPROVIS__F_CONSUL_PARAM_MTO_POS(PSPRODUC);

			logger.debug(map);
			formdata.put("LSTPROYPROV", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm099Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public void m_limpiar(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm099Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			formdata.put("LSTPROYPROV", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm099Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public void m_cargar(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm099Service m_cargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_COMISIONES pacIaxComisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PCEMPRES = getCampoNumerico(request, "SEL_CEMPRESA");
			BigDecimal PMMES_I = getCampoNumerico(request, "SEL_NMES_I");
			BigDecimal PMMES_F = getCampoNumerico(request, "SEL_NMES_F");
			BigDecimal PPANULAC = getCampoNumerico(request, "SEL_PANULAC");
			Map map = pacIaxComisiones.ejecutaPAC_IAX_COMISIONES__F_DEL_CONFCLAWBACK(PCEMPRES, PMMES_I, PMMES_F,
					PPANULAC);
			logger.debug(map);
			request.removeAttribute("SEL_CEMPRESA");
			request.removeAttribute("SEL_NMES_I");
			request.removeAttribute("SEL_NMES_F");
			request.removeAttribute("SEL_PANULAC");
			formdata.remove("SEL_CEMPRESA");
			formdata.remove("SEL_NMES_I");
			formdata.remove("SEL_NMES_F");
			formdata.remove("SEL_PANULAC");
			tratarRETURNyMENSAJES(request, map, false);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			} else
				formdata.put("OK", 1);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm099Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_descargar(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm002Service m_ejecutar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = new BigDecimal(17);
		String CEXPORT = "CSV";
		String CMAP = "ParamProyProv";
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CEMAIL = null;
		String PSPRODUC = getCampoTextual(request, "SPRODUC");
		PARAMETROS__.put("PSPRODUC", PSPRODUC);
		TPARAMETROS__.put("TPSPRODUC", "1");

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);
			request.setAttribute(Constantes.AJAXCONTAINER, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	public void m_cargarArchivo(HttpServletRequest request, Axisadm099Action thisAction) {
		logger.debug("Axisadm099Service m_cargarArchivo");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String TFICHERO = FilenameUtils.getName((getCampoTextual(request, "TFICHERO")));
			BigDecimal CPROCESO = getCampoNumerico(request, "CPROCESO");

			Map map = new PAC_IAX_CFG_FILE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG_FILE__F_GET_PROCESO_CARGADO(CPROCESO, TFICHERO);
			logger.debug(map);

			// Esto rellenar� los MENSAJES en pantalla, as� que no nos preocupamos de si el
			// RETURN es 0 � 1
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm099Service - m�todo m_procesar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.configSuplementos(request);
		}

	}
}
