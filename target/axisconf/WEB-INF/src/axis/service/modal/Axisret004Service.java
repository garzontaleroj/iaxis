package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RETORNO;
import axis.mvc.control.modal.Axisret004Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisret004Service.java 19/02/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisret004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request) {
		logger.debug("Axisret004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_init", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request, Axisret004Action thisAction) {
		logger.debug("Axisret004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarCombos(HttpServletRequest request, Axisret004Action thisAction) throws Exception {
		logger.debug("Axisret004Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ArrayList lista_ramos = new ArrayList();
			ArrayList lista_prod_total = new ArrayList();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_RETORNO pac_axis_Retornos = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = (BigDecimal) usuario.getCempres();
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");

			Map m_prod = pac_axis_Retornos.ejecutaPAC_IAX_RETORNO__F_GET_PRODCONVENIO(IDCONVENIO);
			ArrayList lista_productos = (ArrayList) tratarRETURNyMENSAJES(request, m_prod);
			logger.debug("********************* productos:" + m_prod);
			BigDecimal CRAMO_LISTA = (BigDecimal) m_prod.get("PCRAMO");
			formdata.put("CRAMO", CRAMO); // CRAMO_LISTA
			request.setAttribute("lista_productos", lista_productos);

			if (!isEmpty(CEMPRES)) { // Devuelve todos los ramos
				HashMap ramos = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				lista_ramos = (ArrayList) tratarRETURNyMENSAJES(request, ramos, true);
				logger.debug(lista_ramos);
				request.setAttribute("lista_ramos", lista_ramos);
			}

			HashMap productos = new HashMap();
			if (!isEmpty(CEMPRES)) {
				if (CRAMO != null)
					productos = (HashMap) pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null,
							CEMPRES, CRAMO);
				else
					productos = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES,
							CRAMO_LISTA);
				lista_prod_total = (ArrayList) tratarRETURNyMENSAJES(request, productos, true);
				logger.debug(lista_prod_total);

			}

			/*
			 * *****************************************************************************
			 * ******************
			 */
			/*
			 * ************************* REESCRIBIMOS MAPA CON VALS SELECTED
			 * *********************************
			 */
			/*
			 * *****************************************************************************
			 * ******************
			 */

			/*
			 * if(!isEmpty(lista_prod_total)){
			 * 
			 * if(!isEmpty(lista_productos)){ for (int i=0;i<lista_productos.size();i++){
			 * HashMap mapa = (HashMap)lista_productos.get(i); BigDecimal SPRODUC_IN =
			 * (BigDecimal)mapa.get("SPRODUC");
			 * 
			 * for(int j=0;j<lista_prod_total.size();j++){ HashMap mapa_total =
			 * (HashMap)lista_prod_total.get(j); BigDecimal SPRODUC_GEN =
			 * (BigDecimal)mapa_total.get("SPRODUC");
			 * 
			 * if(SPRODUC_GEN.equals(SPRODUC_IN)){
			 * ((HashMap)lista_prod_total.get(j)).put("MARCADO",1); break; }else{
			 * ((HashMap)lista_prod_total.get(j)).put("MARCADO",0); }
			 * 
			 * } } }
			 * 
			 * 
			 * }
			 */

			if (!isEmpty(lista_productos)) {

				if (!isEmpty(lista_prod_total)) {

					for (int i = 0; i < lista_prod_total.size(); i++) {
						HashMap mapa = (HashMap) lista_prod_total.get(i);
						BigDecimal SPRODUC_IN = (BigDecimal) mapa.get("SPRODUC");

						for (int j = 0; j < lista_productos.size(); j++) {
							HashMap mapa_total = (HashMap) lista_productos.get(j);
							BigDecimal SPRODUC_GEN = (BigDecimal) mapa_total.get("SPRODUC");

							if (SPRODUC_GEN.equals(SPRODUC_IN)) {
								((HashMap) lista_prod_total.get(i)).put("MARCADO", 1);
								break;
							} else {
								((HashMap) lista_prod_total.get(i)).put("MARCADO", 0);
							}

						}
					}

				}

			}

			request.setAttribute("lista_prod_total", lista_prod_total);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisret004Service cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}

	}

	public void m_aceptar(HttpServletRequest request, Axisret004Action thisAction) {
		logger.debug("Axisret004Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			formdata.remove("OK");

			m_actualizar_combos(request);

			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");
			String LISTACONVE = getCampoTextual(request, "LISTACONVE");
			String NULOS = getCampoTextual(request, "NULOS");

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			TIaxInfo objeto_iax = this.generarT_IAX_Info(request, usuario, LISTACONVE, new BigDecimal("1"));
			TIaxInfo objeto_iax_nulos = this.generarT_IAX_Info(request, usuario, NULOS, new BigDecimal("0"));

			/* Grabamos los campos de valor uno */
			Map mapa_resultado = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_SET_PRODCONVENIO(IDCONVENIO, objeto_iax);
			logger.debug(mapa_resultado);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_resultado);

			/* Grabamos los campos nulos */
			Map mapa_resultado_nulos = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_SET_PRODCONVENIO(IDCONVENIO,
					objeto_iax_nulos);
			logger.debug(mapa_resultado_nulos);
			BigDecimal resultado_nulos = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_resultado_nulos);

			if (resultado.intValue() == 0 && resultado_nulos.intValue() == 0) {
				formdata.put("OK", "OK");
			} else {
				formdata.put("OK", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*
	 * *********************************************** ACCIONES
	 * ************************************************
	 */

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisret004Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("comboOrigen  ---------> " + comboOrigen);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				if (!isEmpty(CEMPRES)) {
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug("CARGO RAMOS ---------> " + ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					if (isEmpty(CRAMO)) {
						Map m = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
										this.getCampoNumerico(request, "CEMPRES"), null);
						logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
						ajax.rellenarPlAContenedorAjax(m);
						ajaxResponse.put("SPRODUC", m);
						request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
					}
				}
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			logger.debug("FINALLY");
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisret004Service m_actualizar_combos");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			logger.debug("CEMPRES  ---------> " + CEMPRES);
			logger.debug("CRAMO  ---------> " + CRAMO);

			formdata.put("CRAMO", CRAMO);
			formdata.put("SPRODUC", SPRODUC);

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CEMPRES)) {
				ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				logger.debug("CARGO RAMOS ---------> " + ramos);
				request.setAttribute("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

				if (isEmpty(CRAMO)) {
					Map m = new PAC_IAX_LISTVALORES((Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"),
									this.getCampoNumerico(request, "CEMPRES"), null);
					logger.debug("CARGO PRODUCTOOOOOOS ---------> " + m);
					request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, m, false));
				}
			}

			if (!isEmpty(CRAMO)) {
				BigDecimal CTERMFIN = BigDecimal.ZERO; // TODO: Hard-coded CTERMFIN
				productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, CRAMO, CTERMFIN);
				logger.debug(productos);
				request.setAttribute("DOM_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret004Service - m�todo m_actualizar_combos", e);

		} finally {
			logger.debug("FINALLY");

		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, String cadena, BigDecimal param)
			throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		int n = 0;
		ObIaxInfo[] paramsList = new ObIaxInfo[2];
		if (!isEmpty(cadena)) {
			n = cadena.length(); // numero de parametros
			paramsList = new ObIaxInfo[n];
		}

		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;

			if (!isEmpty(cadena)) {
				String[] campos = cadena.split("x");

				for (int i = 1; i < campos.length; i++) { // Omitimos el primer registro que ser� null
					paramObj = new ObIaxInfo("sproduc", campos[i] + "", "", param); // sproduc con minusculas definido
																					// en PL
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			} else {
				paramObj = new ObIaxInfo("sproduc", "", "", new BigDecimal("0")); // sproduc con minusculas definido en
																					// PL
				paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
				paramsList[1] = paramObj;
			}
		}

		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

}
