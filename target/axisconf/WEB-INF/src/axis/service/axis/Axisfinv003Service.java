package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfinv003Service extends AxisBaseService {
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
		logger.debug("Axisfinv003Service m_form");

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_hidden");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON_hidden");
			String TFONABV = getCampoTextual(request, "TFONABV_hidden");
			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR_hidden"));
			BigDecimal IIMPCMP = getCampoNumerico(request, "IIMPCMP_hidden");
			BigDecimal NUNICMP = getCampoNumerico(request, "NUNICMP_hidden");
			BigDecimal IIMPVNT = getCampoNumerico(request, "IIMPVNT_hidden");
			BigDecimal NUNIVNT = getCampoNumerico(request, "NUNIVNT_hidden");
			BigDecimal IUNIACT = getCampoNumerico(request, "IUNIACT_hidden");
			BigDecimal IUNIACTCMP = getCampoNumerico(request, "IUNIACTCMP_hidden");
			BigDecimal IUNIACTVTASHW = getCampoNumerico(request, "IUNIACTVTASHW_hidden");
			BigDecimal IUNIACTCMPSHW = getCampoNumerico(request, "IUNIACTCMPSHW_hidden");
			BigDecimal IVALACT = getCampoNumerico(request, "IVALACT_hidden");

//            request.setAttribute("CEMPRES_FILTRO", !isEmpty(CEMPRES_FILTRO)?CEMPRES_FILTRO:null);
//            request.setAttribute("CCODFON_FILTRO", !isEmpty(CCODFON_FILTRO)?CCODFON_FILTRO:null);
//            request.setAttribute("FVALOR_FILTRO", !isEmpty(FVALOR_FILTRO)?FVALOR_FILTRO:null);

			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GETCTIPFONFINV(CEMPRES, CCODFON);
			BigDecimal CTIPFON = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (isEmpty(IUNIACT)) {
				IUNIACTCMP = null;
				IUNIACTVTASHW = null;
				IUNIACTCMPSHW = null;
			}
			request.setAttribute("CEMPRES", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON", !isEmpty(CCODFON) ? CCODFON : null);
			request.setAttribute("TFONABV", !isEmpty(TFONABV) ? TFONABV : null);
			request.setAttribute("FVALOR", !isEmpty(FVALOR) ? FVALOR : null);
			request.setAttribute("IIMPCMP", !isEmpty(IIMPCMP) ? IIMPCMP : new BigDecimal(0));
			request.setAttribute("NUNICMP", !isEmpty(NUNICMP) ? NUNICMP : new BigDecimal(0));
			request.setAttribute("IIMPVNT", !isEmpty(IIMPVNT) ? IIMPVNT : new BigDecimal(0));
			request.setAttribute("NUNIVNT", !isEmpty(NUNIVNT) ? NUNIVNT : new BigDecimal(0));
			request.setAttribute("IUNIACT", !isEmpty(IUNIACT) ? IUNIACT : null);
			request.setAttribute("IUNIACTCMP", !isEmpty(IUNIACTCMP) ? IUNIACTCMP : null);
			request.setAttribute("IUNIACTVTASHW", !isEmpty(IUNIACTVTASHW) ? IUNIACTVTASHW : null);
			request.setAttribute("IUNIACTCMPSHW", !isEmpty(IUNIACTCMPSHW) ? IUNIACTCMPSHW : null);
			request.setAttribute("IVALACT", !isEmpty(IVALACT) ? IVALACT : null);
			request.setAttribute("CTIPFON", !isEmpty(CTIPFON) ? CTIPFON : null);
			formdata.put("CTIPFON", CTIPFON);
		} catch (Exception e) {

			logger.error("Error en el servicio Axisfinv003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_calcular(HttpServletRequest request) {
		logger.debug("Axisfinv003Service m_calcular");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON");
			String TFONABV = getCampoTextual(request, "TFONABV");
			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR"));

			BigDecimal IIMPCMP = getCampoNumerico(request, "IIMPCMP");
			BigDecimal NUNICMP = getCampoNumerico(request, "NUNICMP");
			BigDecimal IIMPVNT = getCampoNumerico(request, "IIMPVNT");
			BigDecimal NUNIVNT = getCampoNumerico(request, "NUNIVNT");
			BigDecimal IUNIACT = getCampoNumerico(request, "IUNIACT");
			/*
			 * NO se si sha de calcular BigDecimal IUNIACTCMP=getCampoNumerico(request,
			 * "IUNIACTCMP"); BigDecimal IUNIACTVTASHW=getCampoNumerico(request,
			 * "IUNIACTVTASHW"); BigDecimal IUNIACTCMPSHW=getCampoNumerico(request,
			 * "IUNIACTCMPSHW");
			 */

			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_SINCCALCULAROPERACIONFINV(IIMPCMP,
					NUNICMP, IIMPVNT, NUNIVNT, IUNIACT);
			BigDecimal returnSinc = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(returnSinc);

			if (BigDecimal.ZERO.equals(returnSinc)) {
				BigDecimal PICOMPRA_OUT = ((!isEmpty(map) && !isEmpty(map.get("PICOMPRA_OUT")))
						? (BigDecimal) map.get("PICOMPRA_OUT")
						: null);
				BigDecimal PNCOMPRA_OUT = ((!isEmpty(map) && !isEmpty(map.get("PNCOMPRA_OUT")))
						? (BigDecimal) map.get("PNCOMPRA_OUT")
						: null);
				BigDecimal PIVENTA_OUT = ((!isEmpty(map) && !isEmpty(map.get("PIVENTA_OUT")))
						? (BigDecimal) map.get("PIVENTA_OUT")
						: null);
				BigDecimal PNVENTA_OUT = ((!isEmpty(map) && !isEmpty(map.get("PNVENTA_OUT")))
						? (BigDecimal) map.get("PNVENTA_OUT")
						: null);
				BigDecimal PIVALACT_OUT = ((!isEmpty(map) && !isEmpty(map.get("PIVALACT_OUT")))
						? (BigDecimal) map.get("PIVALACT_OUT")
						: null);

				logger.debug("Map: " + map);

				request.setAttribute("IIMPCMP", !isEmpty(PICOMPRA_OUT) ? PICOMPRA_OUT : null);
				request.setAttribute("NUNICMP", !isEmpty(PNCOMPRA_OUT) ? PNCOMPRA_OUT : null);
				request.setAttribute("IIMPVNT", !isEmpty(PIVENTA_OUT) ? PIVENTA_OUT : null);
				request.setAttribute("NUNIVNT", !isEmpty(PNVENTA_OUT) ? PNVENTA_OUT : null);
				request.setAttribute("IUNIACT", !isEmpty(IUNIACT) ? IUNIACT : null);
				request.setAttribute("IVALACT", !isEmpty(PIVALACT_OUT) ? PIVALACT_OUT : null);
			}

			request.setAttribute("CEMPRES", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON", !isEmpty(CCODFON) ? CCODFON : null);
			request.setAttribute("TFONABV", !isEmpty(TFONABV) ? TFONABV : null);
			request.setAttribute("FVALOR", !isEmpty(FVALOR) ? FVALOR : null);

			request.setAttribute("PATRIMONIO",
					!isEmpty(getCampoNumerico(request, "PATRIMONIO")) ? getCampoNumerico(request, "PATRIMONIO") : null);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv003Service - m�todo m_calcular", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisfinv003Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON");
			String TFONABV = getCampoTextual(request, "TFONABV");
			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR"));
			BigDecimal IIMPCMP = getCampoNumerico(request, "IIMPCMP");
			BigDecimal NUNICMP = getCampoNumerico(request, "NUNICMP");
			BigDecimal IIMPVNT = getCampoNumerico(request, "IIMPVNT");
			BigDecimal NUNIVNT = getCampoNumerico(request, "NUNIVNT");
			BigDecimal IUNIACT = getCampoNumerico(request, "IUNIACT");
			BigDecimal PATRIMONIO = getCampoNumerico(request, "PATRIMONIO");
			BigDecimal IVALACT = getCampoNumerico(request, "IVALACT");
			BigDecimal IUNIACTCMP = getCampoNumerico(request, "IUNIACTCMP");
			BigDecimal IUNIACTVTASHW = getCampoNumerico(request, "IUNIACTVTASHW");
			BigDecimal IUNIACTCMPSHW = getCampoNumerico(request, "IUNIACTCMPSHW");

			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map0 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_SINCCALCULAROPERACIONFINV(IIMPCMP,
					NUNICMP, IIMPVNT, NUNIVNT, IUNIACT);
			BigDecimal returnSinc0 = (BigDecimal) tratarRETURNyMENSAJES(request, map0);
			logger.debug(returnSinc0);

			if (BigDecimal.ZERO.equals(returnSinc0)) {
				BigDecimal PICOMPRA_OUT = ((!isEmpty(map0) && !isEmpty(map0.get("PICOMPRA_OUT")))
						? (BigDecimal) map0.get("PICOMPRA_OUT")
						: null);
				BigDecimal PNCOMPRA_OUT = ((!isEmpty(map0) && !isEmpty(map0.get("PNCOMPRA_OUT")))
						? (BigDecimal) map0.get("PNCOMPRA_OUT")
						: null);
				BigDecimal PIVENTA_OUT = ((!isEmpty(map0) && !isEmpty(map0.get("PIVENTA_OUT")))
						? (BigDecimal) map0.get("PIVENTA_OUT")
						: null);
				BigDecimal PNVENTA_OUT = ((!isEmpty(map0) && !isEmpty(map0.get("PNVENTA_OUT")))
						? (BigDecimal) map0.get("PNVENTA_OUT")
						: null);
				BigDecimal PIVALACT_OUT = ((!isEmpty(map0) && !isEmpty(map0.get("PIVALACT_OUT")))
						? (BigDecimal) map0.get("PIVALACT_OUT")
						: null);

				IIMPCMP = PICOMPRA_OUT;
				NUNICMP = PNCOMPRA_OUT;
				IIMPVNT = PIVENTA_OUT;
				NUNIVNT = PNVENTA_OUT;
				IVALACT = PIVALACT_OUT;
			}

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFINV(CEMPRES, CCODFON,
					FVALOR, IIMPCMP, NUNICMP, IIMPVNT, NUNIVNT, IUNIACT, IVALACT, PATRIMONIO, IUNIACTCMP, IUNIACTVTASHW,
					IUNIACTCMPSHW);
			BigDecimal returnSinc = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(returnSinc);

			if (BigDecimal.ZERO.equals(returnSinc)) {
				request.setAttribute("volver_pantalla_anterior", "true");
			} else {
				request.setAttribute("volver_pantalla_anterior", "false");
				request.setAttribute("CEMPRES", !isEmpty(CEMPRES) ? CEMPRES : null);
				request.setAttribute("CCODFON", !isEmpty(CCODFON) ? CCODFON : null);
				request.setAttribute("TFONABV", !isEmpty(TFONABV) ? TFONABV : null);
				request.setAttribute("FVALOR", !isEmpty(FVALOR) ? FVALOR : null);
				request.setAttribute("IIMPCMP", !isEmpty(IIMPCMP) ? IIMPCMP : null);
				request.setAttribute("NUNICMP", !isEmpty(NUNICMP) ? NUNICMP : null);
				request.setAttribute("IIMPVNT", !isEmpty(IIMPVNT) ? IIMPVNT : null);
				request.setAttribute("NUNIVNT", !isEmpty(NUNIVNT) ? NUNIVNT : null);
				request.setAttribute("IUNIACT", !isEmpty(IUNIACT) ? IUNIACT : null);
				request.setAttribute("IUNIACTCMP", !isEmpty(IUNIACTCMP) ? IUNIACTCMP : null);
				request.setAttribute("IUNIACTVTASHW", !isEmpty(IUNIACTVTASHW) ? IUNIACTVTASHW : null);
				request.setAttribute("IUNIACTCMPSHW", !isEmpty(IUNIACTCMPSHW) ? IUNIACTCMPSHW : null);
				request.setAttribute("IVALACT", !isEmpty(IVALACT) ? IVALACT : null);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv003Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_cancelar(HttpServletRequest request) {
		logger.debug("Axisfinv003Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON");

			// request.setAttribute("volver_pantalla_anterior", "true");
			request.setAttribute("CEMPRES_CONSULTA", !isEmpty(CEMPRES) ? CEMPRES : null);
			request.setAttribute("CCODFON_CONSULTA", !isEmpty(CCODFON) ? CCODFON : null);
			// request.setAttribute("FVALOR_CONSULTA",
			// !isEmpty(FVALOR_CONSULTA)?FVALOR_CONSULTA:null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv003Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_comprovarValor(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfinv003Service m_comprovarValor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap origen = new HashMap();
		ArrayList lista = new ArrayList();

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			Date FVALOR = stringToSqlDate(getCampoTextual(request, "FVALOR"));
			BigDecimal CCODFON = getCampoNumerico(request, "CCODFON");
			BigDecimal IUNIACT = getCampoNumerico(request, "IUNIACT");
			String ORIGEN = getCampoTextual(request, "ORIGEN");
			origen.put("ORIGEN", ORIGEN);
			lista.add(origen);

			Map map = new PAC_IAX_OPERATIVA_FINV((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_OPERATIVA_FINV__F_CONTROL_VALORPART(CEMPRES, CCODFON, FVALOR, IUNIACT);
			logger.debug(map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv003Service - m�todo m_comprovarValor", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(lista);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
