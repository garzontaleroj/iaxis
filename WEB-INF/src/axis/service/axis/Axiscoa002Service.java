package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * MANTENIMIENTO CUENTAS Y LIQUIDACI�N COA. - AXISCOA081 segun analisis!
 */
public class Axiscoa002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Funcionalidad simple de pedir un SPROCES desde PAC_IAX_COA por JSON
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recuperarsprocesajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String identificador = this.getCampoTextual(request, "identificador");
			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|....
				BigDecimal CEMPRES = null;
				if (identificadorSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(identificadorSplitted[0].trim());

				PAC_IAX_COA pac_axis_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

				java.sql.Date FPERFIN = new java.sql.Date(new java.util.Date().getTime());
				String sFPERFIN = this.getCampoTextual(request, "FPERFIN");
				if (sFPERFIN != null && sFPERFIN.trim().length() > 0) {
					FPERFIN = this.stringToSqlDate(sFPERFIN);
				}
				Map map = pac_axis_coa.ejecutaPAC_IAX_COA__F_REGISTRA_PROCESO(FPERFIN, CEMPRES);
				logger.debug("map:" + map);
				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				}
				request.setAttribute(Constantes.AJAXCONTAINER, map);
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.remove("PRODUCTO"); // q puede venir del menu

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa002Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recuperar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_recuperar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NUMPROCES = null;
			BigDecimal CESTADO = null;

			String filtros = this.getCampoTextual(request, "filtros");
			String[] filtrosSplitted = StringUtils.splitPreserveAllTokens(filtros, "|"); // CEMPRES|CRAMO|SPRODUC|NPOLIZA|NCERTIF|CESTADO

			if (filtrosSplitted[5].trim().length() > 0)
				CESTADO = new BigDecimal(filtrosSplitted[5].trim());

			if (filtrosSplitted[11].trim().length() > 0)
				NUMPROCES = new BigDecimal(filtrosSplitted[11].trim());

			String identificador = this.getCampoTextual(request, "identificador");
			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPAPR|CCOMPANI|SSEGURO|FCIERRE//ej:12|1|262310|31/10/2011
				BigDecimal CEMPRES = null;
				if (identificadorSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
				BigDecimal CCOMPAPR = null;
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[1].trim());
				BigDecimal CCOMPANI = null;
				if (identificadorSplitted[2].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[2].trim());
				BigDecimal SSEGURO = null;
				if (identificadorSplitted[3].trim().length() > 0)
					SSEGURO = new BigDecimal(identificadorSplitted[3].trim());
				Date FCIERRE = null;
				if (identificadorSplitted[4].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[4].trim());
				BigDecimal ES_LIQUIDABLE = null;
				if (identificadorSplitted[5].trim().length() > 0)
					ES_LIQUIDABLE = new BigDecimal(identificadorSplitted[5].trim());
				// String TMONEDA=null;
				// if (identificadorSplitted[6].trim().length()>0)
				// TMONEDA=new String(identificadorSplitted[6].trim());

				PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));
				ArrayList GET_CAB_CTACOA = (ArrayList) this.tratarRETURNyMENSAJES(request, pac_iax_coa
						.ejecutaPAC_IAX_COA__F_GET_CAB_CTACOA(CEMPRES, CCOMPAPR, CCOMPANI, SSEGURO, FCIERRE));
				logger.debug("******* mapa cabecera coa:" + GET_CAB_CTACOA);
				formdata.put("CAB_COASEGURO", GET_CAB_CTACOA);

				// formdata.put("TMONEDA", TMONEDA);

				String ver_todos = this.getCampoTextual(request, "CHECK_VER_TODOS");
				// Si marcamos el check "Ver todos", dejaremos de filtrar por estado y no
				// relacionaremos los movimientos a traves del numero de la liquidacion
				if (ver_todos != null && ver_todos.equals("on")) {
					CESTADO = null;
					NUMPROCES = null;
				}

				ArrayList GET_MOV_CTACOA = (ArrayList) this.tratarRETURNyMENSAJES(request,
						pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_MOV_CTACOA(CEMPRES, CCOMPAPR, CCOMPANI, SSEGURO, FCIERRE,
								CESTADO, NUMPROCES, ES_LIQUIDABLE));
				logger.debug("******* mapa movimientos coa:" + GET_MOV_CTACOA);
				formdata.put("GET_MOV_CTACOA", GET_MOV_CTACOA);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa002Service - m�todo m_recuperar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_delete_linea(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_delete_linea");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String IDREGISTRO = this.getCampoTextual(request, "IDREGISTRO");
			String identificador = this.getCampoTextual(request, "identificador");
			BigDecimal CEMPRES = null;
			BigDecimal CCOMPANI = null;
			BigDecimal SSEGURO = null;
			Date FCIERRE = null;
			BigDecimal NNUMLIN = null;
			BigDecimal CCOMPAPR = null;

			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPAPR|CCOMPANI|SSEGURO|FCIERRE
				if (identificadorSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[1].trim());
				if (identificadorSplitted[2].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[2].trim());
				if (identificadorSplitted[3].trim().length() > 0)
					SSEGURO = new BigDecimal(identificadorSplitted[3].trim());
				if (identificadorSplitted[4].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[4].trim());
			}

			if (IDREGISTRO != null) {
				String[] IDREGISTROSplitted = StringUtils.splitPreserveAllTokens(IDREGISTRO, "|"); // NNUMLIN
				if (IDREGISTROSplitted[0].trim().length() > 0)
					NNUMLIN = new BigDecimal(IDREGISTROSplitted[0].trim());

				PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_coa.ejecutaPAC_IAX_COA__F_DEL_MOV_CTACOA(CEMPRES, CCOMPANI, SSEGURO, FCIERRE,
						NNUMLIN);
				logger.debug("map:" + map);

				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa002Service - m�todo m_delete_linea", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
