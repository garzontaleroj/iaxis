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
import org.apache.struts.action.ActionForward;

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfinv002Service extends AxisBaseService {
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
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfinv002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Empresa
			BigDecimal CEMPRES_MODAL = getCampoNumerico(request, "CEMPRES_MODAL");
			BigDecimal CEMPRES;
			if (!isEmpty(CEMPRES_MODAL)) {
				CEMPRES = CEMPRES_MODAL;
			} else {
				CEMPRES = getCampoNumerico(request, "CEMPRES");
			}

			// C�digo de fondo de inversi�n
			BigDecimal CCODFON_MODAL = getCampoNumerico(request, "CCODFON_MODAL");
			BigDecimal CCODFON;
			if (!isEmpty(CCODFON_MODAL)) {
				CCODFON = CCODFON_MODAL;
			} else {
				CCODFON = getCampoNumerico(request, "CCODFON");
			}

			String sFVALOR = request.getParameter("FVALOR");

			if (!isEmpty(sFVALOR)) {
				Date FVALOR = stringToSqlDate(sFVALOR);
				PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETFONDOSOPERAFINV(CEMPRES, CCODFON,
						FVALOR);
				List T_IAX_OPERACIONES = (List) tratarRETURNyMENSAJES(request, map);
				logger.debug(T_IAX_OPERACIONES);

				java.util.Date utilDate = new java.util.Date();
				Date FVALOR_ACTUAL = new Date(utilDate.getTime());

				Map map1 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(CEMPRES,
						FVALOR_ACTUAL);
				String ESTADO_FONDOS = (String) tratarRETURNyMENSAJES(request, map1);
				logger.debug(ESTADO_FONDOS);

				Map map2 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(CEMPRES,
						FVALOR_ACTUAL);
				String APERTURA_CIERRE = (String) tratarRETURNyMENSAJES(request, map2);
				logger.debug(APERTURA_CIERRE);

				request.getSession().setAttribute("T_IAX_OPERACIONES",
						!isEmpty(T_IAX_OPERACIONES) ? T_IAX_OPERACIONES : new ArrayList());
				request.setAttribute("CEMPRES_CONSULTA", !isEmpty(CEMPRES) ? CEMPRES : null);
				request.setAttribute("CCODFON_CONSULTA", !isEmpty(CCODFON) ? CCODFON : null);
				request.setAttribute("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
				formdata.put("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
				request.getSession().setAttribute("FVALOR_CONSULTA", FVALOR);
				request.setAttribute("ESTADO_FONDOS", !isEmpty(ESTADO_FONDOS) ? ESTADO_FONDOS : null);
				request.setAttribute("APERTURA_CIERRE", !isEmpty(APERTURA_CIERRE) ? APERTURA_CIERRE : null);
				request.setAttribute("PAESTADO",
						((!isEmpty(map2) && !isEmpty(map2.get("PAESTADO"))) ? map2.get("PAESTADO") : null));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_valorar_valores(HttpServletRequest request) {
		logger.debug("Axisfinv002Service m_valorar_valores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_VALORAR");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON_VALORAR");

			// Bug 009716 Se caambia por la fecha actual Date
			// FVALOR=stringToSqlDate(sFVALOR);
			Date FVALOR = stringToSqlDate((String) request.getParameter("FVALOR"));
			// java.util.Date utilDate = new java.util.Date();
			// Date FVALOR = new Date(utilDate.getTime());

			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_VALORARFINV(FVALOR, CEMPRES);
			BigDecimal returnValorar = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(returnValorar);

			java.util.Date utilDate = new java.util.Date();
			Date FVALOR_ACTUAL = new Date(utilDate.getTime());

			Map map1 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(CEMPRES,
					FVALOR_ACTUAL);
			String ESTADO_FONDOS = (String) tratarRETURNyMENSAJES(request, map1);
			logger.debug(ESTADO_FONDOS);

			Map map2 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(CEMPRES,
					FVALOR_ACTUAL);
			String APERTURA_CIERRE = (String) tratarRETURNyMENSAJES(request, map2);
			logger.debug(APERTURA_CIERRE);

			request.setAttribute("CEMPRES_CONSULTA", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON_CONSULTA", !isEmpty(CCODFON) ? CCODFON : null);
			request.setAttribute("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
			formdata.put("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
			request.getSession().setAttribute("FVALOR_CONSULTA", FVALOR);
			request.setAttribute("ESTADO_FONDOS", !isEmpty(ESTADO_FONDOS) ? ESTADO_FONDOS : null);
			request.setAttribute("APERTURA_CIERRE", !isEmpty(APERTURA_CIERRE) ? APERTURA_CIERRE : null);
			request.setAttribute("PAESTADO",
					((!isEmpty(map2) && !isEmpty(map2.get("PAESTADO"))) ? map2.get("PAESTADO") : null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_valorar_valores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_asignar_valores(HttpServletRequest request) {
		logger.debug("Axisfinv002Service m_asignar_valores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// Bug 009716 Se caambia por la fecha actual Date
			// FVALOR=stringToSqlDate(sFVALOR);
			// Date FVALOR=stringToSqlDate(getCampoTextual(request, "FVALOR_CONSULTA"));

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_ASIGNAR");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON_ASIGNAR");

			Date FVALOR = stringToSqlDate((String) request.getParameter("FVALOR"));
			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_VALORARFINV(FVALOR, CEMPRES);
			BigDecimal returnValorar = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			// logger.debug(returnValorar);

			// java.util.Date utilDate = new java.util.Date();
			// Date FVALOR = new Date(utilDate.getTime());
			// PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv=new
			// PAC_IAX_OPERATIVA_FINV((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));

			map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_ASIGNARFINV(FVALOR, CEMPRES);
			BigDecimal returnAsignar = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(returnAsignar);

			// Bug 10828 - RSC - 16/09/2009
			java.util.Date utilDate = new java.util.Date();
			Date FVALOR_ACTUAL = new Date(utilDate.getTime());

			Map map1 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(CEMPRES,
					FVALOR_ACTUAL);
			String ESTADO_FONDOS = (String) tratarRETURNyMENSAJES(request, map1);
			logger.debug(ESTADO_FONDOS);

			Map map2 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(CEMPRES,
					FVALOR_ACTUAL);
			String APERTURA_CIERRE = (String) tratarRETURNyMENSAJES(request, map2);
			logger.debug(APERTURA_CIERRE);

			request.setAttribute("CEMPRES_CONSULTA", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON_CONSULTA", !isEmpty(CCODFON) ? CCODFON : null);
			request.setAttribute("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
			formdata.put("FVALOR_CONSULTA", !isEmpty(FVALOR) ? FVALOR : null);
			request.getSession().setAttribute("FVALOR_CONSULTA", FVALOR);
			request.setAttribute("ESTADO_FONDOS", !isEmpty(ESTADO_FONDOS) ? ESTADO_FONDOS : null);
			request.setAttribute("APERTURA_CIERRE", !isEmpty(APERTURA_CIERRE) ? APERTURA_CIERRE : null);
			request.setAttribute("PAESTADO",
					((!isEmpty(map2) && !isEmpty(map2.get("PAESTADO"))) ? map2.get("PAESTADO") : null));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_asignar_valores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_abrir_cerrar_valores(HttpServletRequest request) {
		logger.debug("Axisfinv002Service m_abrir_cerrar_valores");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_ESTADO");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON_ESTADO");
			Date FVALOR_CONSULTA = stringToSqlDate((String) request.getParameter("FVALOR"));

			// Bug 009716 Se caambia por la fecha actual Date
			// FVALOR=stringToSqlDate(sFVALOR);
			// Date FVALOR=stringToSqlDate(getCampoTextual(request, "FVALOR_CONSULTA"));
			java.util.Date utilDate = new java.util.Date();
			Date FVALOR = new Date(utilDate.getTime());

			String PAESTADO = getCampoTextual(request, "PAESTADO");

			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_CAMBIO_ESTADO(CEMPRES, FVALOR, PAESTADO);
			BigDecimal returnAbrirCerrar = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(returnAbrirCerrar);

			Map map1 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETESTADOFONDOSFINV(CEMPRES, FVALOR);
			String ESTADO_FONDOS = (String) tratarRETURNyMENSAJES(request, map1);
			logger.debug(ESTADO_FONDOS);

			Map map2 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_ESTADO_A_MODIFICAR(CEMPRES, FVALOR);
			String APERTURA_CIERRE = (String) tratarRETURNyMENSAJES(request, map2);
			logger.debug(APERTURA_CIERRE);

			request.setAttribute("CEMPRES_CONSULTA", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON_CONSULTA", !isEmpty(CCODFON) ? CCODFON : null);
			request.setAttribute("FVALOR_CONSULTA", !isEmpty(FVALOR_CONSULTA) ? FVALOR_CONSULTA : null);
			formdata.put("FVALOR_CONSULTA", !isEmpty(FVALOR_CONSULTA) ? FVALOR_CONSULTA : null);
			request.getSession().setAttribute("FVALOR_CONSULTA", FVALOR);
			request.setAttribute("ESTADO_FONDOS", !isEmpty(ESTADO_FONDOS) ? ESTADO_FONDOS : null);
			request.setAttribute("APERTURA_CIERRE", !isEmpty(APERTURA_CIERRE) ? APERTURA_CIERRE : null);
			request.setAttribute("PAESTADO",
					((!isEmpty(map2) && !isEmpty(map2.get("PAESTADO"))) ? map2.get("PAESTADO") : null));

			// request.setAttribute("CEMPRES_MODAL", !isEmpty(CEMPRES)?CEMPRES:null);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_abrir_cerrar_valores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_modificar_valores(HttpServletRequest request) {
		logger.debug("Axisfinv002Service m_modificar_valores");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			AbstractDispatchAction.topPila(request, "formdata_axisfinv002", formdata);
			AbstractDispatchAction.topPila(request, Constantes.SALTARDESTINOACTION,
					new ActionForward("/axis_axisfinv003.do?operation=init"));
			AbstractDispatchAction.topPila(request, Constantes.SALTARORIGENACTION,
					new ActionForward("/axis_axisfinv002.do?operation=volverValores"));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_modificar_valores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_volverValores(HttpServletRequest request) {
		logger.debug("Axisfinv002Service m_volverValores");
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			Map formdata_axisfinv002 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axisfinv002");

			if (!AxisBaseService.isEmpty(formdata_axisfinv002))
				formdata.putAll(formdata_axisfinv002);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv002Service - m�todo m_volverValores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisfinv002Service.class));
	}
}
