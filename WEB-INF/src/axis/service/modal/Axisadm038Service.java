package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_TRANSFERENCIAS;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.modal.Axisadm038Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm038Service.java 06/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm038Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO();
			logger.debug(map);

			formdata.remove("NREMESA");
			request.removeAttribute("NREMESA");

			logger.debug("borrando");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recargar_agrupa(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// Se cambia la agrupaci�n, entonces se reinicia todo

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CAGRUP = this.getCampoNumerico(request, "CAGRUP");
			String TIPO = this.getCampoTextual(request, "tipo");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			SINPAQUETE sinpaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map listValores = new HashMap();

			Map empresas = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(empresas);
			listValores.put("empresas", this.tratarRETURNyMENSAJES(request, empresas, false));
			/*
			 * BigDecimal empresa_def = CEMPRES; Map EMPRESADEF =
			 * sinpaquete.ejecutaF_PARINSTALACION_N("EMPRESADEF"); logger.debug(EMPRESADEF);
			 * if (!isEmpty(EMPRESADEF.get("RETURN"))) { formdata.put("EMPRESADEF",
			 * EMPRESADEF.get("RETURN")); empresa_def =
			 * (BigDecimal)EMPRESADEF.get("RETURN"); }
			 * 
			 * CEMPRES = isEmpty(empresa_def) ? CEMPRES : empresa_def; if
			 * (!isEmpty(CEMPRES)) { Map agrupacions =
			 * pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES(CEMPRES);
			 * logger.debug(agrupacions); listValores.put("agrupaciones",
			 * this.tratarRETURNyMENSAJES(request, agrupacions, false));
			 * 
			 * if (!isEmpty(CAGRUP)) { //LCF Map ramos =
			 * pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(
			 * CEMPRES, CAGRUP); logger.debug(ramos); listValores.put("ramos",
			 * this.tratarRETURNyMENSAJES(request, ramos, false));
			 * 
			 * 
			 * CRAMO=null;
			 * 
			 * }
			 * 
			 * 
			 * formdata.put("CRAMO",CRAMO);
			 * 
			 * 
			 * 
			 * }
			 * 
			 * Map tiposbusqueda =
			 * pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			 * BigDecimal(701)); logger.debug(tiposbusqueda);
			 * listValores.put("tiposbusqueda", this.tratarRETURNyMENSAJES(request,
			 * tiposbusqueda, false));
			 * 
			 * 
			 * formdata.put("listvalores", listValores);
			 */

			cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarlistas(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service cargarlistas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CAGRUP = this.getCampoNumerico(request, "CAGRUP");
			String TIPO = this.getCampoTextual(request, "tipo");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			SINPAQUETE sinpaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map listValores = new HashMap();

			Map empresas = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(empresas);
			listValores.put("empresas", this.tratarRETURNyMENSAJES(request, empresas, false));
			/*
			 * BigDecimal empresa_def = CEMPRES; Map EMPRESADEF =
			 * sinpaquete.ejecutaF_PARINSTALACION_N("EMPRESADEF"); logger.debug(EMPRESADEF);
			 * if (!isEmpty(EMPRESADEF.get("RETURN"))) { formdata.put("EMPRESADEF",
			 * EMPRESADEF.get("RETURN")); empresa_def =
			 * (BigDecimal)EMPRESADEF.get("RETURN"); }
			 * 
			 * CEMPRES = isEmpty(CEMPRES) ? empresa_def : CEMPRES;
			 */
			if (!isEmpty(CEMPRES)) {
				Map agrupacions = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPACIONES(CEMPRES);
				logger.debug(agrupacions);
				listValores.put("agrupaciones", this.tratarRETURNyMENSAJES(request, agrupacions, false));

				if (!isEmpty(CAGRUP)) { // LCF

					Map ramos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(CEMPRES, CAGRUP);
					logger.debug(ramos);
					listValores.put("ramos", this.tratarRETURNyMENSAJES(request, ramos, false));

				} else {

					Map ramos = cargaListaRamos(request, TIPO, CEMPRES); // Llamamos a la carga de ramo con el TIPO de
																			// la pantalla
					ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, ramos, false);
					if (lista.size() == 1)
						CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
					listValores.put("ramos", this.tratarRETURNyMENSAJES(request, ramos, false));

				}

				formdata.put("CRAMO", CRAMO);

				if (!isEmpty(CRAMO)) {
					Map productos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(TIPO, CEMPRES,
							CRAMO);
					logger.debug(productos);
					listValores.put("productos", this.tratarRETURNyMENSAJES(request, productos, false));
				} else {
					Map productos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(TIPO, CEMPRES,
							CRAMO);
					logger.debug(productos);
					listValores.put("productos", this.tratarRETURNyMENSAJES(request, productos, false));
				}
				// } //LCF
			}

			Map tiposbusqueda = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(701));
			logger.debug(tiposbusqueda);
			listValores.put("tiposbusqueda", this.tratarRETURNyMENSAJES(request, tiposbusqueda, false));

			formdata.put("listvalores", listValores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisadm038Action thisAction) {
		logger.debug("Axisadm038Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new PAC_IAX_TRANSFERENCIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CAGRUP = this.getCampoNumerico(request, "CAGRUP");
			String TIPOBUSQUEDA = this.getCampoTextual(request, "tipos");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			java.sql.Date FABONOINI = this.stringToSqlDate(this.getCampoTextual(request, "FABONOINI"));
			java.sql.Date FABONOFIN = this.stringToSqlDate(this.getCampoTextual(request, "FABONOFIN"));
			java.sql.Date FTRANSINI = this.stringToSqlDate(this.getCampoTextual(request, "FTRANSINI"));
			java.sql.Date FTRANSFIN = this.stringToSqlDate(this.getCampoTextual(request, "FTRANSFIN"));
			BigDecimal CTRANSFERIDOS = this.getCampoNumerico(request, "CTRANSFERIDOS");

			BigDecimal NREMESA = this.getCampoNumerico(request, "NREMESA");
			BigDecimal NREMESA1 = this.getCampoNumerico(request, "NREMESA1");

			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");
			BigDecimal IIMPORTT = this.getCampoNumerico(request, "IIMPORTT");

			if (NREMESA == null && NREMESA1 != null) {
				NREMESA = NREMESA1;
			}

			Map m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_REGISTROS_DUPLICADOS(TIPOBUSQUEDA);
			logger.debug(m);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO)) {
				m = pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_INSERT_REMESAS_PREVIO(CEMPRES, CAGRUP,
						CRAMO, SPRODUC, FABONOINI, FABONOFIN, FTRANSINI, FTRANSFIN, CTRANSFERIDOS, NREMESA,
						TIPOBUSQUEDA, IIMPORTT, SPERSON);
				logger.debug(m);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).equals(BigDecimal.ZERO))
					formdata.put("OK", "0");
				else {
					if (((BigDecimal) m.get("RETURN")).intValue() == 2) {
						formdata.put("OK", "0");
						HashMap msg = (HashMap) ((ArrayList) m.get("MENSAJES")).get(0);
						formdata.put("MSG", ((HashMap) msg.get("OB_IAX_MENSAJES")).get("TERROR"));
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map cargaListaRamos(HttpServletRequest request, String TIPO, BigDecimal CEMPRES) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(TIPO, CEMPRES);
		/*
		 * List listaRamos = (List)tratarRETURNyMENSAJES(request, map);
		 * request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos :
		 * new ArrayList()); listaRamos = null;
		 */
		return map;
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
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisadm038Service m_cargarDatosPersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");

			if (NNUMIDE == null)
				NNUMIDE = "";
			if (TNOMBRE == null)
				TNOMBRE = "";

			String CODIGO = "DATOSPERSONA";
			String CONDICION = NNUMIDE + "|" + TNOMBRE;

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm038Service - m�todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
