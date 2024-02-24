package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
//import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisfinv011Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisfinv011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv011Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// 1027 Tipo comision
			Map mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1027));
			logger.debug(mapa);

			List listaTipcom = (List) tratarRETURNyMENSAJES(request, mapa, false);

			request.setAttribute("listaTipcom", listaTipcom);

			// 1028 Calculo comision
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1028));
			logger.debug(mapa);

			List listaCalcom = (List) tratarRETURNyMENSAJES(request, mapa, false);

			request.setAttribute("listaCalcom", listaCalcom);

			// 1029 Tipo calculo
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1029));
			logger.debug(mapa);

			List listaTipcal = (List) tratarRETURNyMENSAJES(request, mapa, false);

			request.setAttribute("listaTipcal", listaTipcal);

			//
			BigDecimal CEMPRES = getCampoNumerico(request, "PAR_CEMPRES");

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(CEMPRES);
			List T_IAX_FONDOS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_FONDOS);

			request.setAttribute("T_IAX_FONDOS", !isEmpty(T_IAX_FONDOS) ? T_IAX_FONDOS : new ArrayList());

			BigDecimal PCCODFON = getCampoNumerico(request, "PAR_CCODFON");

			mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_FONGASTOS_HIST(PCCODFON);
			logger.debug(mapa);

			List<Map> l2 = (List<Map>) tratarRETURNyMENSAJES(request, mapa);

			formdata.putAll(l2.get(0));

			formdata.put("CCOD_ACT", new BigDecimal(0));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv011Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.formattingNumericValues(request);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_nou(HttpServletRequest request) {
		logger.debug("Axisfinv011Service m_nou");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// 1027 Tipo comision
			Map mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1027));
			logger.debug(mapa);

			List listaTipcom = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaTipcom", listaTipcom);

			// 1028 Calculo comision
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1028));
			logger.debug(mapa);

			List listaCalcom = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaCalcom", listaCalcom);

			// 1029 Tipo calculo
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1029));
			logger.debug(mapa);

			List listaTipcal = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaTipcal", listaTipcal);

			//
			BigDecimal CEMPRES = getCampoNumerico(request, "PAR_CEMPRES");

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(CEMPRES);
			List T_IAX_FONDOS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_FONDOS);

			request.setAttribute("T_IAX_FONDOS", !isEmpty(T_IAX_FONDOS) ? T_IAX_FONDOS : new ArrayList());

			BigDecimal PCCODFON = getCampoNumerico(request, "PAR_CCODFON");

			BigDecimal PNOU = getCampoNumerico(request, "NOU");

			if (PNOU.equals(new BigDecimal(0))) {
				formdata.put("CCODFON", PCCODFON);
			}

			java.util.Date sysdate = new java.util.Date();

			long time = sysdate.getTime();

			Date FINICIO = new Date(time);

			formdata.put("FINICIO", FINICIO);
			formdata.put("CCOD_ACT", new BigDecimal(1));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv011Service - m�todo m_nou", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.formattingNumericValues(request);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_refresh(HttpServletRequest request) {
		logger.debug("Axisfinv011Service m_refresh");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// 1027 Tipo comision
			Map mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1027));
			logger.debug(mapa);

			List listaTipcom = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaTipcom", listaTipcom);

			// 1028 Calculo comision
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1028));
			logger.debug(mapa);

			List listaCalcom = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaCalcom", listaCalcom);

			// 1029 Tipo calculo
			mapa = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1029));
			logger.debug(mapa);

			List listaTipcal = (List) tratarRETURNyMENSAJES(request, mapa);

			request.setAttribute("listaTipcal", listaTipcal);

			//
			BigDecimal CEMPRES = getCampoNumerico(request, "PAR_CEMPRES");

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_FONDOSINVERSION(CEMPRES);
			List T_IAX_FONDOS = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(T_IAX_FONDOS);

			request.setAttribute("T_IAX_FONDOS", !isEmpty(T_IAX_FONDOS) ? T_IAX_FONDOS : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv011Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.formattingNumericValues(request);
	}

	/**
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisfinv011Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CCODFON = getHiddenCampoNumerico(request, "CCODFON");
			Date FINICIO = stringToSqlDate(getHiddenCampoTextual(request, "FINICIO"));
			Date FFIN = stringToSqlDate(getHiddenCampoTextual(request, "FFIN"));

			BigDecimal CTIPCOM = getHiddenCampoNumerico(request, "CTIPCOM");
			BigDecimal CCONCEP = getHiddenCampoNumerico(request, "CCONCEP");
			BigDecimal CTIPOCALCUL = getHiddenCampoNumerico(request, "CTIPOCALCUL");

			BigDecimal PGASTOS = getHiddenCampoNumerico(request, "PGASTOS");
			BigDecimal IIMPFIJ = getHiddenCampoNumerico(request, "IIMPFIJ");

			PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_SET_REGGASTOS(CCODFON, FINICIO, FFIN, null,
					null, null, PGASTOS, IIMPFIJ, null, CTIPCOM, CCONCEP, CTIPOCALCUL, null);
			logger.debug(mapa);

			BigDecimal ret = (BigDecimal) tratarRETURNyMENSAJES(request, mapa, false);
			logger.debug(ret);

			request.setAttribute("guardado", ret);

			m_refresh(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv011Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.formattingNumericValues(request);
	}
}
