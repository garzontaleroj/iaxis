package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm053Service extends AxisBaseService {
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
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			request.getSession().removeAttribute("ORDEN_LINEA");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// BigDecimal ORDEN_LINEA = getCampoNumerico(request,"ORDEN_LINEA");
			// request.getSession().setAttribute("ORDEN_LINEA",ORDEN_LINEA);
			// this.cargaListaAsientos(request);
			// this.cargaListaConceptos(request);
			this.cargaListaCuentas(request);
			// this.cargaListaPaises(request);
			// Cargar lista de apuntes de cada movimiento
			this.m_consultar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisadm053Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			java.sql.Date FCONTAB = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTAB"));
			String CCUENTA = getCampoTextual(request, "CCUENTA");

			logger.debug("CEMPRES : " + CEMPRES);
			logger.debug("FCONTAB : " + FCONTAB);
			logger.debug("CCUENTA : " + CCUENTA);

			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal SMODCON = getCampoNumerico(request, "NASIENT");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			java.sql.Date FEFEADM = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEFEADM"));
			BigDecimal CPROCES = getCampoNumerico(request, "CPROCES");

			logger.debug("------------> NLINEA :" + NLINEA + " SMODCON : " + SMODCON + " CPAIS :" + CPAIS + " FEFEADM :"
					+ FEFEADM + " CPROCES : " + CPROCES);

			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GET_DETCONTABILIDAD_DIARIA(CEMPRES, FCONTAB, CCUENTA, NLINEA,
							SMODCON, CPAIS, FEFEADM, CPROCES);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0)
				if (!isEmpty(map))
					request.getSession().setAttribute("LISTA_CONT", map.get("PDETCONTAB"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm053Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga la lista de empresas en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaCuentas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCUENTACONTABLE();
		List listaCuentas = (List) tratarRETURNyMENSAJES(request, map, false);
		request.getSession().setAttribute("axisadm_listaCuentas",
				listaCuentas != null ? listaCuentas : new ArrayList());
		listaCuentas = null;
	}

	/* ********************************************************** */

	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisadm053Service m_ajax_generar_resultados_map");
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

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr029Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/** Bug 0014782 - JMF - 06/09/2010 **/
	@SuppressWarnings("all")
	public void m_montarfichero_detalle(HttpServletRequest request) {
		logger.debug("Axisadm053Service m_montarfichero_detalle");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			java.sql.Date FCONTAB = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTAB"));

			/*
			 * java.sql.Date FCONTABINI =
			 * AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABINI"));
			 * 
			 * java.sql.Date FCONTABFIN =
			 * AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABFIN"));
			 */

			String CCUENTA = getCampoTextual(request, "CCUENTA");

			PAC_IAX_CONTABILIDAD pacIaxContabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			logger.debug(
					"MONTARFICHERO_DETALLE CEMPRES: " + CEMPRES + " FCONTAB : " + FCONTAB + " CCUENTA :" + CCUENTA);

			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal SMODCON = getCampoNumerico(request, "NASIENT");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			java.sql.Date FEFEADM = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEFEADM"));
			BigDecimal CPROCES = getCampoNumerico(request, "CPROCES");

			logger.debug("FICHERO------------> NLINEA :" + NLINEA + " SMODCON : " + SMODCON + " CPAIS :" + CPAIS
					+ " FEFEADM :" + FEFEADM + " CPROCES : " + CPROCES);

			Map map = pacIaxContabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_MONTARFICHERO_DETALLE(CEMPRES, FCONTAB, FCONTAB,
					CCUENTA, NLINEA, SMODCON, CPAIS, FEFEADM, CPROCES);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("LINK_INFORME", map.get("P_NOMFICHERO"));
			this.m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - m�todo m_montarfichero_detalle", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
