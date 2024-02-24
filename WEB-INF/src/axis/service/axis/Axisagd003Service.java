//Revision:# NzR76W+zS0l2jWZ9/pdeZw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisagd003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisagd003Action.java 17/11/2010
 * 
 * @since Java 5.0
 */
public class Axisagd003Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisagd003Action thisAction) {
		logger.debug("Axisagd003Service M_INIT");
		// Inicialitzem el camp CHECKCUSUARI
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		formdata.put("CHECKCUSUARI", new BigDecimal(1));
		// formdata.put("CESTAPU", new BigDecimal(0));
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		if (usuario.getCempres().equals(new BigDecimal(10))) {
			formdata.put("CAPUAGE", "1"); // Se inicia con Asignados a mi
			request.setAttribute("CAPUAGE", "1");
		} else {
			formdata.put("CAPUAGE", "3"); // S'inicialitza amb Asignados a mi y al grupo
			request.setAttribute("CAPUAGE", "3");
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisagd003Action thisAction) {
		logger.debug("Axisagd003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			if (AbstractDispatchAction.topPila(request, "CMODO_BIS") != null) {
				AbstractDispatchAction.topPila(request, "CMODO", AbstractDispatchAction.topPila(request, "CMODO_BIS"));
				AbstractDispatchAction.topPila(request, "CMODO_BIS", null);
			}

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");
			BigDecimal CCLAGD = this.getHiddenCampoNumerico(request, "CCLAGD");
			BigDecimal CCONAPU = this.getHiddenCampoNumerico(request, "CCONAPU");
			BigDecimal CESTAPU = this.getCampoNumerico(request, "CESTAPU");
			String CGRUPO = this.getCampoTextual(request, "CGRUPO");
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");
			String TGRUPO = this.getCampoTextual(request, "TGRUPO");
			BigDecimal CTIPAPU = this.getHiddenCampoNumerico(request, "CTIPAPU");
			BigDecimal CPERAGD = this.getHiddenCampoNumerico(request, "CPERAGD");
			BigDecimal CAMBITO = this.getHiddenCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = this.getHiddenCampoNumerico(request, "CPRIORI");
			String TCLAGD = this.getHiddenCampoTextual(request, "TCLAGD");
			String TTITAPU = this.getHiddenCampoTextual(request, "TTITAPU");
			BigDecimal CHECKCUSUARI = this.getCampoNumerico(request, "CHECKCUSUARI");
			// Bug 0017744 - 25/02/2011 - JMF
			// if ((CHECKCUSUARI!=null)&&(CHECKCUSUARI.intValue() == 1)){
			CUSUARI = usuario.getCusuari();
			// }
			String CAPUAGE = this.getCampoTextual(request, "CAPUAGE");

			java.sql.Date FALTA = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FALTA"));
			java.sql.Date FAPUNTE = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FAPUNTE"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FRECORDATORIO"));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			CESTAPU = isEmpty(CESTAPU) ? isEmpty(getValorPorDefecto(request, "CESTAPU")) ? CESTAPU
					: new BigDecimal(getValorPorDefecto(request, "CESTAPU")) : CESTAPU;

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(IDAPUNTE, IDAGENDA, CCLAGD, TCLAGD, CCONAPU,
					CESTAPU, CGRUPO, TGRUPO, TTITAPU, CTIPAPU, CPERAGD, CAMBITO, CPRIORI, FAPUNTE, FALTA, FRECORDATORIO,
					CUSUARI, CAPUAGE, null);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("resultagenda", m.get("PLSTAGENDA"));
			}
			formdata.put("CUSUARI", CUSUARI);
			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private String getValorPorDefecto(HttpServletRequest request, String ITEM) {
		if (request.getAttribute("VALOR_POR_DEFECTO") != null) {
			try {
				int valores_defecto_size = ((java.util.List) request.getAttribute("VALOR_POR_DEFECTO")).size();

				for (int i = 0; i < valores_defecto_size; i++) {
					String campoid = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID");
					String valor = (String) ((java.util.Map) ((java.util.List) request
							.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR");
					if (campoid.equals(ITEM))
						return valor;

				}
			} catch (Exception e) {
				logger.error("Error en el servicio Axisagd003Service - m�todo m_form", e);

			}

		}
		return null;
	}

	public void m_buscar(HttpServletRequest request, Axisagd003Action thisAction) {
		logger.debug("Axisagd003Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");
			BigDecimal CCLAGD = this.getHiddenCampoNumerico(request, "CCLAGD");
			BigDecimal CCONAPU = this.getHiddenCampoNumerico(request, "CCONAPU");
			BigDecimal CESTAPU = this.getCampoNumerico(request, "CESTAPU");
			String CGRUPO = this.getCampoTextual(request, "CGRUPO");
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");
			String TGRUPO = this.getCampoTextual(request, "TGRUPO");
			BigDecimal CTIPAPU = this.getHiddenCampoNumerico(request, "CTIPAPU");
			BigDecimal CPERAGD = this.getHiddenCampoNumerico(request, "CPERAGD");
			BigDecimal CAMBITO = this.getHiddenCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = this.getHiddenCampoNumerico(request, "CPRIORI");
			@SuppressWarnings("static-access")
			String TCLAGD = this.getHiddenCampoTextual(request, "TCLAGD") == null
					? this.getHiddenCampoTextual(request, "TCLAGD_OUT")
					: this.getHiddenCampoTextual(request, "TCLAGD");
			String TTITAPU = this.getHiddenCampoTextual(request, "TTITAPU");
			BigDecimal CHECKCUSUARI = this.getCampoNumerico(request, "CHECKCUSUARI");
			// Bug 0017744 - 25/02/2011 - JMF
			// if ((CHECKCUSUARI!=null)&&(CHECKCUSUARI.intValue() == 1)){
			CUSUARI = usuario.getCusuari();
			// }
			String CAPUAGE = this.getHiddenCampoTextual(request, "CAPUAGE");

			java.sql.Date FALTA = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FALTA"));
			java.sql.Date FAPUNTE = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FAPUNTE"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FRECORDATORIO"));

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(IDAPUNTE, IDAGENDA, CCLAGD, TCLAGD, CCONAPU,
					CESTAPU, CGRUPO, TGRUPO, TTITAPU, CTIPAPU, CPERAGD, CAMBITO, CPRIORI, FAPUNTE, FALTA, FRECORDATORIO,
					CUSUARI, CAPUAGE, null);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("resultagenda", m.get("PLSTAGENDA"));
			}
			formdata.put("CUSUARI", CUSUARI);
			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd003Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisagd003Action thisAction) {
		logger.debug("Axisagd003Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();

		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800031));
			logger.debug(map);
			listValores.put("lstconcepto", (List) tratarRETURNyMENSAJES(request, map, false));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800029));
			logger.debug(map);
			listValores.put("lstmodulos", (List) tratarRETURNyMENSAJES(request, map, false));
			/*
			 * map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			 * BigDecimal(800032)); logger.debug(map);
			 * listValores.put("lstgrupos",tratarRETURNyMENSAJES(request, map, false));
			 */
			map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTGRUPOS();
			logger.debug(map);
			listValores.put("lstgrupos", tratarRETURNyMENSAJES(request, map, false));

			// Bug 0017744 - 25/02/2011 - JMF
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1030));
			logger.debug(map);
			listValores.put("lstapuage", tratarRETURNyMENSAJES(request, map, false));

			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");

			if (!isEmpty(CGRUPO)) {
				map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(0));
				logger.debug(map);
				listValores.put("lstvaloresgrupos", tratarRETURNyMENSAJES(request, map, false));
			}
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA();
			logger.debug(map);
			listValores.put("lsttipos", (List) tratarRETURNyMENSAJES(request, map, false));
			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			logger.debug(map);
			listValores.put("lstusuarios", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd003Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_busqueda_valoresgrupo(HttpServletRequest request, Axisagd003Action thisAction) {
		logger.debug("Axisagd003 m_ajax_busqueda_valoresgrupo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CGRUPO = getHiddenCampoTextual(request, "CGRUPO");
			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(0));
			logger.debug(map);

			ArrayList datos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datos)) {
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(datos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd003 - m�todo m_ajax_busqueda_valoresgrupo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
