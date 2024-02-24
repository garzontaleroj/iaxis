package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr083Service.java 12/12/2008
 * 
 * @author <a href="jgarciam@csi-ti.com">Jaume Garcia</a>
 * @since Java 5.0
 */
public class Axisctr083Service extends AxisBaseService {
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
		logger.debug("Axisctr083Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Date FECHA_ACTUAL = (Date) fcGetFechaActual();

			logger.debug("DATA 1 :: " + FECHA_ACTUAL);

			String VCIDIOMA = getCampoTextual(request, "VCIDIOMA");
			String VCEMPRES = getCampoTextual(request, "VCEMPRES");
			String MODORENTAS = getCampoTextual(request, "MODORENTAS");

			formdata.put("VCIDIOMA", usuario.getCidioma());
			formdata.put("VCEMPRES", usuario.getCempres());

			if (isEmpty(MODORENTAS)) {
				formdata.put("MODORENTAS", "RENTAS");
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					formdata.put("MODORENTAS", "PREVI_RENTAS");
			}

			formdata.put("FECHAINI", FECHA_ACTUAL);

			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");

			logger.debug("user:" + usuario.getCidioma() + "empresa:" + usuario.getCidioma());

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(1);

			formdata.put("RADIO", RADIO);
			formdata.put("CFICHERO", "");
			formdata.put("CFICHERO2", "");
			formdata.put("CFICHERO3", "");
			// formdata.put("JGM_PROCES","");
			formdata.put("NANYO2", "");

			this.cargarCombos(request);

			Map LSTVALORES = (Map) formdata.get("LSTVALORES");

			if (!isEmpty(LSTVALORES) && !isEmpty(RAMO)) {
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, RAMO,
						new BigDecimal(1));

				logger.debug(map);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr083Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * M�todo que comprueba la extensi�n del fichero y, si no coincide con la de
	 * .csv la borra y, a�ade en cualquier caso esta �ltima
	 * 
	 * @param CFICHERO
	 * @return
	 * @throws Exception
	 */
	private static String comprobarFichero(String CFICHERO) throws Exception {
		if (isEmpty(CFICHERO))
			return CFICHERO;

		String regExprExt = "[a-zA-Z0-9]+[\\.[a-zA-Z0-9]+]+";

		Pattern mask = Pattern.compile(regExprExt);
		Matcher matcher = mask.matcher(CFICHERO);

		if (matcher.matches()) {
			String[] CFICHEROTmp = CFICHERO.split("\\.");
			CFICHERO = CFICHEROTmp[0];
		} else {
			// Per for�ar un error en la pantalla al recuperar la info.
			CFICHERO = "-0";
		}

		CFICHERO = CFICHERO + ".csv";
		return CFICHERO;
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisctr083Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			List lista_empresas;

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LSTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			if (isEmpty(CEMPRES)) {

				lista_empresas = (List) tratarRETURNyMENSAJES(request, map);
				if (!isEmpty(lista_empresas) && lista_empresas.size() == 1) {
					HashMap hashEmp = (HashMap) lista_empresas.get(0);
					CEMPRES = new BigDecimal(String.valueOf(hashEmp.get("CEMPRES")));
				}
			}

			/* Recuperar lista de Agentes */
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, CEMPRES);
			logger.debug(map);
			LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));

			if (!isEmpty(CEMPRES)) {

				map = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_RENTAS__F_GET_PRODRENTAS(CEMPRES, RAMO, SPRODUC);
				logger.debug(map);
				logger.debug("JGM empr:" + CEMPRES + "prod:" + SPRODUC);

				formdata.put("LSTPRODRENTAS", tratarRETURNyMENSAJES(request, map));
				formdata.put("CEMPRES", CEMPRES);
			}

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000083", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisctr083Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr083Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	@SuppressWarnings("all")

	public void m_ajaxseleccionarProd(HttpServletRequest request) {
		logger.debug("Axisctr083Service m_seleccionarProd");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal RAMO = getCampoNumerico(request, "RAMO");
			BigDecimal SELECCIO = getCampoNumerico(request, "SELECCIO");

			Map map = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_SETOBJETOPRODRENTA(SPRODUC, SELECCIO);
			logger.debug(map);

			// formdata.put("NANYO",tratarRETURNyMENSAJES(request, map));
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr083Service - m�todo m_seleccionarProd", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*
	 * public void m_ajaxregistrar(HttpServletRequest request) {
	 * logger.debug("Axisctr083Service m_ajaxregistrar"); Map formdata = (Map)
	 * request.getAttribute(Constantes.FORMDATA); UsuarioBean usuario =
	 * (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
	 * AjaxContainerService ajax = new AjaxContainerService(); try {
	 * 
	 * 
	 * BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES"); BigDecimal MES =
	 * getCampoNumerico(request, "NMES"); BigDecimal ANYO =
	 * getCampoNumerico(request, "NANYO");
	 * 
	 * 
	 * Map map = new
	 * PAC_IAX_DINCARTERA((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)).ejecutaPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO("CARTERA",MES,ANYO,
	 * CEMPRES); logger.debug(map);
	 * 
	 * // formdata.put("NANYO",tratarRETURNyMENSAJES(request, map));
	 * ajax.rellenarPlAContenedorAjax(map);
	 * ajax.guardarContenidoFinalAContenedorAjax(map);
	 * 
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axisctr083Service - m�todo m_ajaxregistrar", e);
	 * ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 */

	public BigDecimal m_procesar(HttpServletRequest request) {
		logger.debug("Axisctr083Service m_procesar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal vtipo;
			String MODORENTAS = getCampoTextual(request, "MODORENTAS");
			Date FECHAINI = stringToSqlDate(getCampoTextual(request, "FECHAINI"));

			BigDecimal NRENOVA = getCampoNumerico(request, "NRENOVA");
			formdata.put("NRENOVA", NRENOVA);

			Map map = new HashMap();

			if (MODORENTAS.equals("PREVI_RENTAS")) {
				vtipo = new BigDecimal(1);
				map = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_RENTAS__F_SET_RENTAS(CEMPRES, FECHAINI, vtipo, SPROCES);
			} else {
				vtipo = new BigDecimal(0);
				map = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_RENTAS__F_SET_RENTAS(CEMPRES, FECHAINI, vtipo, SPROCES);
			}

			logger.debug(map);

			BigDecimal registroOK = ((BigDecimal) tratarRETURNyMENSAJES(request, map));

			if (registroOK.intValue() == 0) {
				formdata.put("SPRODUC", null);

				// formdata.put("CEMPRES",null);
				// CEMPRES = null;
				formdata.put("CRAMO", null);
				formdata.put("NPOLIZA", null);
				formdata.put("NCERTIF", null);
				formdata.put("NRENOVA", null);
				formdata.put("NMES", null);
				formdata.put("NANYO", null);
				formdata.put("NOMMAP1", map.get("NOMMAP1"));
			}

			// }

			/*
			 * if (!isEmpty(CEMPRES) && !isEmpty(SPRODUC)){ BigDecimal RAMO =
			 * getCampoNumerico(request, "CRAMO"); this.m_actualitzarMeses(request); map =
			 * new PAC_IAX_DINCARTERA((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(CEMPRES,RAMO,SPRODUC,
			 * SPRODUC); logger.debug(map); logger.debug("JGM empr:"+ CEMPRES + "prod:" +
			 * SPRODUC); formdata.put("LSTPRODCARTERA",map.get("PCURPRCAR")); }
			 */

			return new BigDecimal(0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr083Service - m�todo m_procesar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
		}

		return new BigDecimal(0);
	}

}
