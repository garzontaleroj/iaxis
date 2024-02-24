package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.modal.Axisadm071Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm071Service 26/06/2012
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm071Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * MÃ‰TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public void m_init(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/*
			 * PAC_IAX_TRANSFERENCIAS pac_iax_transferencias = new
			 * PAC_IAX_TRANSFERENCIAS((Connection)request.getAttribute(Constantes.DB01CONN))
			 * ; Map map =
			 * pac_iax_transferencias.ejecutaPAC_IAX_TRANSFERENCIAS__F_LIMPIA_REMESASPREVIO(
			 * ); logger.debug(map);
			 * 
			 * formdata.remove("NREMESA"); request.removeAttribute("NREMESA");
			 * 
			 * logger.debug("borrando");
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * 
	 * @param cargarListaValores
	 */
	private void cargarlistas(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service cargarlistas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			SINPAQUETE sinpaquete = new SINPAQUETE((Connection) request.getAttribute(Constantes.DB01CONN));
			Map listValores = new HashMap();

			Map empresas = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(empresas);
			listValores.put("empresas", this.tratarRETURNyMENSAJES(request, empresas, false));

			if (!isEmpty(CEMPRES)) {
				Map cobbancarios = this.cargaCobBancario(request, CEMPRES);
				logger.debug(cobbancarios);
				listValores.put("cobbancarios", this.tratarRETURNyMENSAJES(request, cobbancarios, false));
			}

			formdata.put("listvalores", listValores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarlistas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			String NMATRIC = this.getCampoTextual(request, "NMATRIC");
			BigDecimal CCOBBAN = this.getCampoNumerico(request, "CCOBBAN");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");

			Date FENVINI = this.stringToSqlDate(this.getCampoTextual(request, "FENVINI"));
			Date FENVFIN = this.stringToSqlDate(this.getCampoTextual(request, "FENVFIN"));

			BigDecimal CIDIOMA = usuario.getCidioma();

			BigDecimal TIPOPER = null;

			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");
			BigDecimal IIMPORTT = this.getCampoNumerico(request, "IIMPORTT");

			String valorTipoPer = getCampoTextual(request, "tipoper");
			TIPOPER = new BigDecimal(valorTipoPer);
			formdata.put("TIPOPER", valorTipoPer);

			/* Realizamos la bÃºsqueda */
			Map m = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_MATRICULAS(CEMPRES, NPOLIZA, NCERTIF, NRECIBO, CCOBBAN,
					NMATRIC, FENVINI, FENVFIN, SPERSON, TIPOPER, CIDIOMA);
			logger.debug(m);

			ArrayList lista = (ArrayList) tratarRETURNyMENSAJES(request, m, false);

			/*
			 * ArrayList lista = new ArrayList();
			 * 
			 * HashMap m = new HashMap(); m.put("NMATRIC","123456");
			 * m.put("COBBANCAR","BANCO DE ESPAÃ‘A"); m.put("CBANCAR","000001225441225441");
			 * lista.add(0,m); m = new HashMap(); m.put("NMATRIC","744100");
			 * m.put("COBBANCAR","CAJA ALMERÃ�A"); m.put("CBANCAR","000001662222233333");
			 * lista.add(1,m);
			 */

			formdata.put("LISTA_MATRICULAS", lista);

			/*
			 * if (((BigDecimal)this.tratarRETURNyMENSAJES(request,
			 * m)).equals(BigDecimal.ZERO)) formdata.put("OK", "0"); else { if
			 * (((BigDecimal)m.get("RETURN")).intValue() == 2) { formdata.put("OK", "0");
			 * HashMap msg = (HashMap)((ArrayList)m.get("MENSAJES")).get(0);
			 * formdata.put("MSG", ((HashMap)msg.get("OB_IAX_MENSAJES")).get("TERROR")); } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_aceptar(HttpServletRequest request, Axisadm071Action thisAction) {
		logger.debug("Axisadm071Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			String NMATRIC = this.getCampoTextual(request, "NMATRIC");
			BigDecimal CCOBBAN = this.getCampoNumerico(request, "CCOBBAN");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");
			Date FENVINI = this.stringToSqlDate(this.getCampoTextual(request, "FENVINI"));
			Date FENVFIN = this.stringToSqlDate(this.getCampoTextual(request, "FENVFIN"));

			BigDecimal CIDIOMA = usuario.getCidioma();

			BigDecimal TIPOPER = null;

			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");
			BigDecimal IIMPORTT = this.getCampoNumerico(request, "IIMPORTT");

			String valorTipoPer = getCampoTextual(request, "tipoper");
			TIPOPER = new BigDecimal(valorTipoPer);
			formdata.put("TIPOPER", valorTipoPer);

			/* Realizamos la bÃºsqueda */
			Map m = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_MATRICULAS(CEMPRES, NPOLIZA, NCERTIF, NRECIBO, CCOBBAN,
					NMATRIC, FENVINI, FENVFIN, SPERSON, TIPOPER, CIDIOMA);
			logger.debug(m);

			/*
			 * if (((BigDecimal)this.tratarRETURNyMENSAJES(request,
			 * m)).equals(BigDecimal.ZERO)) formdata.put("OK", "0"); else { if
			 * (((BigDecimal)m.get("RETURN")).intValue() == 2) { formdata.put("OK", "0");
			 * HashMap msg = (HashMap)((ArrayList)m.get("MENSAJES")).get(0);
			 * formdata.put("MSG", ((HashMap)msg.get("OB_IAX_MENSAJES")).get("TERROR")); } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la peticiÃ³n del cliente
	 *                web.
	 */
	private Map cargaCobBancario(HttpServletRequest request, BigDecimal CEMPRES) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
		// ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRES);

		return map;
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MÃ‰TODOS DE ACTUALIZACIÃ“N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_cargarDatosPersona(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisadm071Service m_cargarDatosPersona");
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

			Map map = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);
			logger.debug(map);

			List DATOSPERSONA = (List) ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(DATOSPERSONA);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm071Service - mÃ©todo m_cargarDatosPersona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
