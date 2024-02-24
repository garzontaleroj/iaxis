package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrea021Service.java 29/06/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisrea021Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea021Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map ramos = new HashMap();
			Map productos = new HashMap();
			Map LISTVALORES = new HashMap();

			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			Map map2 = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADO_FAC();
			logger.debug(map2);
			LISTVALORES.put("LSTESTADO", tratarRETURNyMENSAJES(request, map2));

			// Per a la carrega en val, quan nom�s hi ha una empresa preseleccionada
			if ((!isEmpty(CEMPRES)) || (((ArrayList) LISTVALORES.get("LSTEMPRESAS")).size() == 1)) {
				if (!isEmpty(CEMPRES)) {
					// Cargar Ramos
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				} else {
					ArrayList llistaEmp = (ArrayList) LISTVALORES.get("LSTEMPRESAS");
					HashMap hashEmp = (HashMap) llistaEmp.get(0);
					// Cargar Ramos
					ramos = pacIaxListValores
							.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP((BigDecimal) hashEmp.get("CEMPRES"));
				}
				logger.debug(ramos);
				request.getSession().setAttribute("REA_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));
			}

			// Cargar Productos
			/* De moneto desactivado */
			if (!isEmpty(CRAMO)) {
				BigDecimal CTERMFIN = BigDecimal.ONE; // TODO: Hard-coded CTERMFIN
				String P_TIPO = "1"; // TODO: Hard-coded CTERMFIN
				productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(P_TIPO, CRAMO, CTERMFIN);
				logger.debug(productos);
				request.getSession().setAttribute("REA_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
			}

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea021Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisrea021Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal SFACULT = getCampoNumerico(request, "SFACULT");
			BigDecimal NSOLICI = getCampoNumerico(request, "NSOLICI");

			// BigDecimal CESTADO = new BigDecimal(getCampoTextual(request, "CESTADO"));

			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
			Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
			BigDecimal SCUMULO = getCampoNumerico(request, "SCUMULO");

			Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CUAFACUL_REA(CEMPRES, CRAMO, SPRODUC, NPOLIZA, NCERTIF,
					SFACULT, CESTADO, FEFEINI, FEFEFIN, SCUMULO, NSOLICI);
			logger.debug(map);
			request.setAttribute("LST_CUAFACUL", tratarRETURNyMENSAJES(request, map));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea021Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisrea021Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			Map ramos = new HashMap();
			Map productos = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Ramos
				ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
				logger.debug(ramos);
				ajax.rellenarPlAContenedorAjax(ramos);
				ajaxResponse.put("CRAMO", ramos);
				request.getSession().setAttribute("REA_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ONE; // TODO: Hard-coded CTERMFIN
					String P_TIPO = "1"; // TODO: Hard-coded CTERMFIN
					/* De moneto desactivado */
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(P_TIPO, CRAMO,
							CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.getSession().setAttribute("REA_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));

				}
				break;
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea021Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
