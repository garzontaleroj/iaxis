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
import axis.jdbc.PAC_IAX_FIC_PROCESOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axislist007Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm007Service.java
 * 
 * @author <a href="jmgutierrez@csi-ti.com">Jenny Gutierrez</a>
 * @since Java 5.0
 */
public class Axislist007Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axislist007Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axislist007Action thisAction) {
		logger.debug("Axislist007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("CIDIOMA", usuario.getCidioma());
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(CEMPRES, whoami(this).toUpperCase(), CMODO, SPRODUC);

			logger.debug(map);
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0)
				request.setAttribute("LISTADOS", map.get("PCURCONFIGSINF"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request, Axislist007Action thisAction) {
		logger.debug("Axislist007Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_FIC_PROCESOS paciaxFICPROCESOS = new PAC_IAX_FIC_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = null;
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			Date FPROINI = stringToSqlDate(getCampoTextual(request, "FPROINI"));
			String CPROCES = getCampoTextual(request, "CPROCES");
			BigDecimal NERROR = getCampoNumerico(request, "NERROR");
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			BigDecimal EMPRESA = getCampoNumerico(request, "EMPRESA");
			String GESTOR = getCampoTextual(request, "GESTOR");
			String FORMATO = getCampoTextual(request, "FORMATO");
			String ANIO = getCampoTextual(request, "ANIO");
			String MES = getCampoTextual(request, "MES");
			String DIA = getCampoTextual(request, "DIA");

			m = paciaxFICPROCESOS.ejecutaPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOS(EMPRESA, SPROCES, GESTOR, FORMATO,
					ANIO, MES, DIA, NERROR, CUSUARI, FPROINI);
			logger.debug("m:" + m);
			thisAction.topPila(request, "m", m);
			tratarRETURNyMENSAJES(request, m);
			ArrayList axislist008_lista = (ArrayList) m.get("RETURN");

			formdata.put("axislist008_lista", axislist008_lista);

			formdata.put("FPROINI_", FPROINI);
			formdata.put("CPROCES_", CPROCES);
			formdata.put("NERROR_", NERROR);
			formdata.put("CUSUARI_", CUSUARI);
			formdata.put("EMPRESA_", EMPRESA);
			formdata.put("GESTOR", GESTOR);
			formdata.put("FORMATO", FORMATO);
			formdata.put("ANIO", ANIO);
			formdata.put("MES", MES);
			formdata.put("DIA", DIA);
			formdata.put("NERROR", NERROR);
			formdata.put("SPROCES_", SPROCES);
			formdata.put("SPROCES", SPROCES);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist007Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga las cuentas del tomador y las devuelve en modo Ajax.
	 * 
	 * @param request
	 */
	public void m_ajax_busqueda_lineas(HttpServletRequest request) {
		logger.debug("Axislist007Service m_ajax_busqueda_lineas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			PAC_IAX_FIC_PROCESOS pac_iax_fic_procesos = new PAC_IAX_FIC_PROCESOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_fic_procesos.ejecutaPAC_IAX_FIC_PROCESOS__F_GET_FICPROCESOSDET(SPROCES);
			logger.debug(map);

			if (!isEmpty(map)) {
				List LSTPROCESOSDET = (List) tratarRETURNyMENSAJES(request, map);
				ajax.guardarContenidoFinalAContenedorAjax(LSTPROCESOSDET);
				formdata.put("REC_LSTPROCESOSDET", LSTPROCESOSDET);
			}

			formdata.put("VALOR", SPROCES);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist007Service - m�todo m_ajax_busqueda_lineas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
