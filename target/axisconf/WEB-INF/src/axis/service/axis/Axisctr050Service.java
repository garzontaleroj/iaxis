//Revision:# Pa2pG2rjV0M4F9BHeUwmVA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_DINCARTERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr050Service.java 12/12/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor/Jaume Garcia</a>
 * @since Java 5.0
 */
public class Axisctr050Service extends AxisBaseService {
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
		logger.debug("Axisctr050Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String MODOCARTERA = getCampoTextual(request, "MODOCARTERA");
			// String VCIDIOMA = getCampoTextual(request, "VCIDIOMA");
			// String VCEMPRES = getCampoTextual(request, "VCEMPRES");

			BigDecimal VCIDIOMA = (BigDecimal) usuario.getCidioma();
			BigDecimal VCEMPRES = (BigDecimal) usuario.getCempres();

			formdata.put("VCIDIOMA", VCIDIOMA);
			formdata.put("VCEMPRES", VCEMPRES);

			Integer SHOW_RADIO_PROD = (Integer) AbstractDispatchAction.topPila(request, "SHOW_RADIO_PROD");
			formdata.put("SHOW_RADIO_PROD", SHOW_RADIO_PROD);

			if (isEmpty(MODOCARTERA)) {
				formdata.put("MODOCARTERA", "CARTERA");
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					formdata.put("MODOCARTERA", "PREVI_CARTERA");
			}

			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal NPOLIZA = isEmpty(getCampoNumerico(request, "NPOLIZA"))
					? getCampoNumerico(request, "NPOLIZA_WIZARD")
					: getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = isEmpty(getCampoNumerico(request, "NCERTIF"))
					? getCampoNumerico(request, "NCERTIF_WIZARD")
					: getCampoNumerico(request, "NCERTIF");
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("NCERTIF", NCERTIF);
			logger.debug("user:" + usuario.getCidioma() + "empresa:" + usuario.getCempres());

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(1);

			formdata.put("RADIO", RADIO);
			formdata.put("CFICHERO", "");
			formdata.put("CFICHERO2", "");
			formdata.put("CFICHERO3", "");
			// formdata.put("JGM_PROCES","");
			formdata.put("NANYO2", "");

			if (isEmpty(SPROCAR)) {
				Map m = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_GET_PROCESO();
				logger.debug("map dincartera -->" + m);
				formdata.put("SPROCAR", m.get("PSPROCES"));
			} else
				formdata.put("JGM_PROCES", "");

			this.cargarCombos(request);

			Map LSTVALORES = (Map) formdata.get("LSTVALORES");

			if (!isEmpty(CEMPRES) || !isEmpty(NPOLIZA))
				m_actualitzarMeses(request);

			if (!isEmpty(LSTVALORES) && !isEmpty(RAMO)) {
				PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				String tipo = this.getCampoTextual(request, "tipo");
				Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, RAMO,
						new BigDecimal(1));
				logger.debug(map);
				LSTVALORES.put("LSTPRODUCTOS", tratarRETURNyMENSAJES(request, map));

			}

			BigDecimal CARTERA_DIARIA = BigDecimal.ZERO;
			BigDecimal CARTERA_PROGRAMADA = BigDecimal.ZERO;

			String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");
			if (RADIO.equals(new BigDecimal("1")) && !isEmpty(productosSeleccionados)) {
				CARTERA_DIARIA = this.getCarteraDiariaProductos(productosSeleccionados, request);
				CARTERA_PROGRAMADA = this.getCarteraProgramadaProductos(productosSeleccionados, request);
			}

			if (RADIO.equals(new BigDecimal("2")) && !isEmpty(NPOLIZA)) {
				PAC_IAX_DINCARTERA pacIaxDinCartera = new PAC_IAX_DINCARTERA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxDinCartera.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_POLIZA(NPOLIZA);
				logger.debug(map);
				CARTERA_DIARIA = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				// NULL, poliza no existe por tanto no miramos m�s parametros
				if (CARTERA_DIARIA != null) {
					map = pacIaxDinCartera.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_POLIZA(NPOLIZA);
					logger.debug(map);
					CARTERA_PROGRAMADA = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				}
			}

			formdata.put("CARTERA_DIARIA", CARTERA_DIARIA == null ? BigDecimal.ZERO : CARTERA_DIARIA);
			formdata.put("CARTERA_PROGRAMADA", CARTERA_PROGRAMADA == null ? BigDecimal.ZERO : CARTERA_PROGRAMADA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
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
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisfis050Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCES = getCampoNumerico(request, "NPROCES");
			BigDecimal registroOK = new BigDecimal(1);
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");
			String CFICHERO = getCampoTextual(request, "CFICHERO");

			CFICHERO = comprobarFichero(CFICHERO);

			if (!"-0.csv".equals(CFICHERO)) {
				// Date CFINI =
				// stringToSqlDate(getCampoTextual(request, "CFINI"));
				// Date CFFIN =
				// stringToSqlDate(getCampoTextual(request, "CFFIN"));
				// String CANYOFISC = getCampoTextual(request, "CANYOFISC");
				// String CTIPOSOP = getCampoTextual(request, "CTIPOSOP");
				// String CTIPOCIU = getCampoTextual(request, "CTIPOCIU");

				request.getSession().removeAttribute("CFICHERO");
				String[] C_FICHERO_OUT = { "RETURN" };

				if ("327".equals(CMAP)) {
					logger.debug("empresa:" + CEMPRES);
					logger.debug("proceso" + SPROCES);
					Map map2 = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_DINCARTERA__F_EVAL_GENERA_DIFERIDOS(CEMPRES, SPROCES);

					// registroOK = ((BigDecimal)tratarRETURNyMENSAJES(request, map2));
					// ${__formdata.F_GET_DATMAP.RETURN[0].TCOMENTARIO}

					logger.debug(map2);

					registroOK = (BigDecimal) map2.get("PGENERAMAP");

				}
				logger.debug("resultado:" + registroOK);

				if (registroOK.intValue() == 1) {

					Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP, CPARAMETROS);

					logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

					ajax.guardarContenidoFinalAContenedorAjax(map);

					System.out.println(ajax.getAjaxContainer());

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
				} else {
					Map resultado = new HashMap();
					resultado.put("VDIFERIDOS", registroOK);
					ajax.guardarContenidoFinalAContenedorAjax(resultado);
				}
			} else {
				Map resultado = new HashMap();
				resultado.put("FICHERO", CFICHERO);
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisctr050Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
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
			String tipo = this.getCampoTextual(request, "tipo");
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
			logger.debug(map);
			LSTVALORES.put("LSTRAMOS", tratarRETURNyMENSAJES(request, map));

			if (!isEmpty(CEMPRES) && !isEmpty(SPROCAR)) {

				String MODOCARTERA = getCampoTextual(request, "MODOCARTERA");

				if (isEmpty(MODOCARTERA)) {
					MODOCARTERA = "CARTERA";
					String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

					if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
						MODOCARTERA = "PREVI_CARTERA";
				}

				map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(CEMPRES, RAMO, SPRODUC, SPROCAR, MODOCARTERA);
				logger.debug(map);
				logger.debug("JGM empr:" + CEMPRES + "prod:" + SPRODUC);

				formdata.put("LSTPRODCARTERA", map.get("PCURPRCAR"));
				formdata.put("CEMPRES", CEMPRES);
				m_actualitzarMeses(request);
			}

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
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
		logger.debug("Axisctr050Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_actualitzarMeses(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_actualitzarMesos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(1);

			String MODOCARTERA = getCampoTextual(request, "MODOCARTERA");

			if (isEmpty(MODOCARTERA)) {
				MODOCARTERA = "CARTERA";
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					MODOCARTERA = "PREVI_CARTERA";
			}

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(NPOLIZA, CEMPRES, MODOCARTERA, SPROCAR);
			logger.debug(map);
			formdata.put("LSTMESESCARTERA", map.get("PCURMESCAR"));

			// Inici BUG 28821/172422 - RCL - 10/04/2014
			if (!isEmpty(map.get("PCURMESCAR"))) {
				int numList = ((List) map.get("PCURMESCAR")).size();
				formdata.put("SHOW_MSG_FCARPRO", "false");
				if (numList > 1 && !isEmpty(NPOLIZA)) {
					String NCONTRATO = getCampoTextual(request, "NCONTRATO");
					BigDecimal SPRODUC = null;
					HashMap mapPoliza = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(null, null, NPOLIZA, null, null, null, null,
									null, null, null, null, null, null, null, null, null, null, null, null, null, null,
									null, null, null, null, null, null, null, null, NCONTRATO, null, null, null, null,
									null, null, null);
					logger.debug(mapPoliza);
					List plReturn = (List) tratarRETURNyMENSAJES(request, mapPoliza);

					if (plReturn != null && plReturn.size() > 1)
						SPRODUC = (BigDecimal) ((Map) plReturn.get(0)).get("SPRODUC");

					Map mapParProducto = new PAC_IAXPAR_PRODUCTOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("CARTERA_FCARPRO", SPRODUC);
					logger.debug(mapParProducto);
					BigDecimal carteraFcarPro = (BigDecimal) tratarRETURNyMENSAJES(request, mapParProducto);

					if (carteraFcarPro.compareTo(new BigDecimal(1)) == 0) {
						formdata.put("SHOW_MSG_FCARPRO", "true");
					}
				}
			}
			// Fi BUG 28821/172422 - RCL - 10/04/2014

			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTMESES();
			logger.debug(map2);
			formdata.put("LSTMESESCARTERA2", tratarRETURNyMENSAJES(request, map2));

			formdata.put("RADIO", RADIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_actualitzarMesos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_actualitzarAnyo(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_actualitzarMesos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal NMES = getCampoNumerico(request, "NMES");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(String.valueOf(request.getParameter("RADIO")));

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_GET_ANYO_CARTERA(CEMPRES, NPOLIZA, NMES, SPROCAR);
			logger.debug(map);

			formdata.put("NANYO", map.get("PNANYO"));
			formdata.put("RADIO", RADIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_actualitzarAnyo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajaxseleccionarProd(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_seleccionarProd");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SELECCIO = getCampoNumerico(request, "SELECCIO");

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_SET_PRODCARTERA(CEMPRES, SPROCAR, SPRODUC, SELECCIO);
			logger.debug(map);

			// formdata.put("NANYO",tratarRETURNyMENSAJES(request, map));
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			String MODOCARTERA = getCampoTextual(request, "MODOCARTERA");

			if (isEmpty(MODOCARTERA)) {
				MODOCARTERA = "CARTERA";
				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

				if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
					MODOCARTERA = "PREVI_CARTERA";
			}

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");

			map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_GET_MES_CARTERA(NPOLIZA, CEMPRES, MODOCARTERA, SPROCAR);
			logger.debug(map);
			// formdata.put("LSTMESESCARTERA",map.get("RETURN"));

			// Si actualizarParProductos = 1 actualizaremos el valor CARTERA_DIARIA y
			// CARTERA_PROGRAMADA para el conjunto de productos seleccionados
			// actualizarParProductos ser� igual 0, solo cuando vengamos de
			// seleccionar/deseleccionar todos los productos, en este caso no nos interesa
			// para cada selecci�n
			// de producto actualizar el valor CARTERA_DIARIA y CARTERA_PROGRAMADA, sino que
			// lo haremos una �nica vez con la funci�n m_ajax_actualizarParametrosProductos
			BigDecimal actualizarParProductos = getCampoNumerico(request, "actualizarParProductos");
			BigDecimal CARTERA_DIARIA = BigDecimal.ZERO;
			BigDecimal CARTERA_PROGRAMADA = BigDecimal.ZERO;
			if (actualizarParProductos.intValue() == 1) {
				String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");
				CARTERA_DIARIA = this.getCarteraDiariaProductos(productosSeleccionados, request);
				CARTERA_PROGRAMADA = this.getCarteraProgramadaProductos(productosSeleccionados, request);
			}
			map.put("CARTERA_DIARIA", CARTERA_DIARIA == null ? BigDecimal.ZERO : CARTERA_DIARIA);
			map.put("CARTERA_PROGRAMADA", CARTERA_PROGRAMADA == null ? BigDecimal.ZERO : CARTERA_PROGRAMADA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_seleccionarProd", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal getCarteraDiariaProductos(String productosSeleccionados, HttpServletRequest request) {
		try {
			BigDecimal CARTERA_DIARIA = new BigDecimal(0);
			if (!isEmpty(productosSeleccionados)) {
				String[] productosSplitted = productosSeleccionados.split("#");
				for (int i = 0; i < productosSplitted.length; i++) {
					if (!isEmpty(productosSplitted[i])) {
						BigDecimal sproduc = new BigDecimal(productosSplitted[i]);
						Map map2 = new PAC_IAX_DINCARTERA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERADIARIA_PRODUCTO(sproduc);
						logger.debug(map2);
						CARTERA_DIARIA = (BigDecimal) tratarRETURNyMENSAJES(request, map2);
						if (CARTERA_DIARIA.intValue() == 0) {
							break;
						}
					}
				}
			}
			return CARTERA_DIARIA;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo getCarteraDiariaProductos", e);
			return null;
		}
	}

	public BigDecimal getCarteraProgramadaProductos(String productosSeleccionados, HttpServletRequest request) {
		try {
			BigDecimal CARTERA_PROGRAMADA = new BigDecimal(0);
			if (!isEmpty(productosSeleccionados)) {
				String[] productosSplitted = productosSeleccionados.split("#");
				for (int i = 0; i < productosSplitted.length; i++) {
					if (!isEmpty(productosSplitted[i])) {
						BigDecimal sproduc = new BigDecimal(productosSplitted[i]);
						Map map2 = new PAC_IAX_DINCARTERA(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_DINCARTERA__F_GET_CARTERAPROG_PRODUCTO(sproduc);
						logger.debug(map2);
						CARTERA_PROGRAMADA = (BigDecimal) tratarRETURNyMENSAJES(request, map2);
						if (CARTERA_PROGRAMADA.intValue() == 0) {
							break;
						}
					}
				}
			}
			return CARTERA_PROGRAMADA;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo getCarteraProgramadaProductos", e);
			return null;
		}
	}

	public void m_ajax_actualizarParametrosProductos(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_ajax_actualizarParametrosProductos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			Map map = new HashMap();
			String productosSeleccionados = getCampoTextual(request, "productosSeleccionados");
			BigDecimal CARTERA_DIARIA = this.getCarteraDiariaProductos(productosSeleccionados, request);
			map.put("CARTERA_DIARIA", CARTERA_DIARIA);

			BigDecimal CARTERA_PROGRAMADA = this.getCarteraProgramadaProductos(productosSeleccionados, request);
			map.put("CARTERA_PROGRAMADA", CARTERA_PROGRAMADA);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_ajax_actualizarParametrosProductos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajaxregistrar(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_ajaxregistrar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			String MODO = getCampoTextual(request, "MODOCARTERA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal MES = getCampoNumerico(request, "NMES");
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");

			java.sql.Date FCARTERA = null;
			String sFCARTERA = this.getCampoTextual(request, "FCARTERA");
			if (sFCARTERA != null && sFCARTERA.trim().length() > 0) {
				FCARTERA = this.stringToSqlDate(sFCARTERA);
			}

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(MODO, MES, ANYO, CEMPRES, FCARTERA);
			logger.debug(map);

			// formdata.put("NANYO",tratarRETURNyMENSAJES(request, map));
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_ajaxregistrar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal m_procesar(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_procesar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			// String MODO = getCampoTextual(request, "MODOCARTERA");
			String MODO = request.getParameter("MODOCARTERA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal MES = getCampoNumerico(request, "NMES");
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");

			java.sql.Date FCARTERA = null;
			String sFCARTERA = this.getCampoTextual(request, "FCARTERA");
			if (sFCARTERA != null && sFCARTERA.trim().length() > 0) {
				FCARTERA = this.stringToSqlDate(sFCARTERA);
			}

			BigDecimal NRENOVA = getCampoNumerico(request, "NRENOVA");
			formdata.put("NRENOVA", NRENOVA);

			if (isEmpty(SPROCES) && !isEmpty(request.getParameter("SPROCES")))
				SPROCES = new BigDecimal(String.valueOf(request.getParameter("SPROCES")));

			Map map = new HashMap();
			logger.debug("modo:" + MODO);

			if (MODO.equals("PREVI_CARTERA")) {
				map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_LANZA_PREVIO(SPROCES, CEMPRES, MES, ANYO, NPOLIZA, NCERTIF,
								SPROCAR, NRENOVA, FCARTERA);
				logger.debug(map);
				logger.debug("JGM: proc:" + SPROCES + " emp:" + CEMPRES + " procar:" + SPROCAR);
				formdata.put("JGM_PROCES", SPROCES);

			} else {
				map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_LANZA_CARTERA(SPROCES, CEMPRES, MES, ANYO, NPOLIZA, NCERTIF,
								SPROCAR, FCARTERA);
				logger.debug(map);
			}
			BigDecimal registroOK = ((BigDecimal) tratarRETURNyMENSAJES(request, map));

			if (registroOK.intValue() == 0) {
				formdata.put("SPROCES", null);
				formdata.put("SPROCAR", null);
				SPROCAR = null;
				// formdata.put("CEMPRES",null);
				// CEMPRES = null;
				formdata.put("CRAMO", null);
				formdata.put("NPOLIZA", null);
				formdata.put("NCERTIF", null);
				formdata.put("NRENOVA", null);
				formdata.put("NMES", null);
				formdata.put("NANYO", null);
			}

			// }

			if (!isEmpty(CEMPRES) && !isEmpty(SPROCAR)) {
				BigDecimal RAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				this.m_actualitzarMeses(request);

				String MODOCARTERA = getCampoTextual(request, "MODOCARTERA");

				if (isEmpty(MODOCARTERA)) {
					MODOCARTERA = "CARTERA";
					String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

					if (!isEmpty(CMODO) && CMODO.equals("PREVI"))
						MODOCARTERA = "PREVI_CARTERA";
				}

				map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_DINCARTERA__F_GET_PRODCARTERA(CEMPRES, RAMO, SPRODUC, SPROCAR, MODOCARTERA);
				logger.debug(map);
				logger.debug("JGM empr:" + CEMPRES + "prod:" + SPRODUC);
				formdata.put("LSTPRODCARTERA", map.get("PCURPRCAR"));
			}

			formdata.put("RADIO", RADIO);

			return new BigDecimal(0);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_procesar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

		return new BigDecimal(0);
	}

	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_imprimir");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String MODO = getCampoTextual(request, "MODOCARTERA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			logger.debug("CEMPRES :" + CEMPRES);
			BigDecimal MES = getCampoNumerico(request, "NMES");
			logger.debug("NMES :" + MES);
			BigDecimal ANYO = getCampoNumerico(request, "NANYO");
			logger.debug("NANYO :" + ANYO);
			BigDecimal RADIO = getCampoNumerico(request, "RADIO");
			logger.debug("RADIO :" + RADIO);
			BigDecimal SPROCAR = getCampoNumerico(request, "SPROCAR");
			logger.debug("SPROCAR :" + SPROCAR);
			BigDecimal SPROCES = getCampoNumerico(request, "NPROCES");
			logger.debug("NPROCES :" + SPROCES);
			BigDecimal NLISTADO3 = getCampoNumerico(request, "NLISTADO3");
			logger.debug("NLISTADO3 :" + NLISTADO3);
			BigDecimal NLISTADO2 = getCampoNumerico(request, "NLISTADO2");
			logger.debug("NLISTADO2 :" + NLISTADO2);
			BigDecimal NLISTADO1 = getCampoNumerico(request, "NLISTADO1");
			logger.debug("NLISTADO1 :" + NLISTADO1);

			if (isEmpty(RADIO))
				RADIO = new BigDecimal(String.valueOf(request.getParameter("RADIO")));

			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_LISTADO_CARTERA("REPORT", CEMPRES, "1", SPROCES, MES, ANYO, SPROCAR);
			logger.debug(map); // "ESTADO PRODUCTE"

			// BigDecimal registroOK = (BigDecimal)tratarRETURNyMENSAJES(request, map) ;

			// if( registroOK.intValue() == 0){
			logger.debug("OK! REIMPRESSIO");
			// }

			formdata.put("RADIO", RADIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public BigDecimal m_diferidos(HttpServletRequest request) {
		logger.debug("Axisctr050Service m_diferidos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		/*
		 * FUNCTION f_eval_genera_diferidos(pcempres IN NUMBER, psproces IN NUMBER,
		 * pgeneramap OUT NUMBER, mensajes OUT t_iax_mensajes) RETURN NUMBER;
		 */
		BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
		BigDecimal SPROCES = getCampoNumerico(request, "NPROCES");

		if (isEmpty(SPROCES) && !isEmpty(request.getParameter("SPROCES")))
			SPROCES = new BigDecimal(String.valueOf(request.getParameter("SPROCES")));

		try {
			Map map = new PAC_IAX_DINCARTERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DINCARTERA__F_EVAL_GENERA_DIFERIDOS(CEMPRES, SPROCES);

			logger.debug(map);

			BigDecimal registroOK = ((BigDecimal) tratarRETURNyMENSAJES(request, map));

			return registroOK;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_diferidos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
		return new BigDecimal(0);
	}

	/**
	 * Funcionalidad simple de pedir un SPROCES desde PAC_IAX_REA por JSON
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recuperarsprocesajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			String MODOCARTERA = this.getCampoTextual(request, "MODOCARTERA");
			BigDecimal NMES = this.getCampoNumerico(request, "NMES");
			BigDecimal NANYO = this.getCampoNumerico(request, "NANYO");

			java.sql.Date FCARTERA = new java.sql.Date(new java.util.Date().getTime());
			String sFCARTERA = null;
			if (sFCARTERA != null && sFCARTERA.trim().length() > 0) {
				FCARTERA = this.stringToSqlDate(sFCARTERA);
			}

			if (CEMPRES != null) {
				PAC_IAX_DINCARTERA pac_axis_dincartera = new PAC_IAX_DINCARTERA(
						(Connection) request.getAttribute(Constantes.DB01CONN));

				java.sql.Date FPERFIN = new java.sql.Date(new java.util.Date().getTime());
				String sFPERFIN = this.getCampoTextual(request, "FPERFIN");
				if (sFPERFIN != null && sFPERFIN.trim().length() > 0) {
					FPERFIN = this.stringToSqlDate(sFPERFIN);
				}
				Map map = pac_axis_dincartera.ejecutaPAC_IAX_DINCARTERA__F_REGISTRA_PROCESO(MODOCARTERA, NMES, NANYO,
						CEMPRES, FCARTERA);
				logger.debug("map:" + map);
				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				}
				request.setAttribute(Constantes.AJAXCONTAINER, map);
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_carteraprogramada(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr050Service m_carteraprogramada");
		try {
			BigDecimal SPROCES = this.getCampoNumerico(request, "SPROCES");
			String MODOCARTERA = this.getCampoTextual(request, "MODOCARTERA");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			// BigDecimal NMES=this.getCampoNumerico(request, "NMES_prog");
			// BigDecimal NANYO=this.getCampoNumerico(request, "NANYO_prog");
			BigDecimal NMES = this.getCampoNumerico(request, "NMES");
			BigDecimal NANYO = this.getCampoNumerico(request, "NANYO");
			String productosSeleccionados = this.getCampoTextual(request, "productosSeleccionados");
			BigDecimal SPROCAR = this.getCampoNumerico(request, "SPROCAR");
			BigDecimal NPOLIZA = this.getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = this.getCampoNumerico(request, "NCERTIF");

			java.sql.Date FEJECUCION = new java.sql.Date(new java.util.Date().getTime());
			String sFEJECUCION = this.getCampoTextual(request, "FEJECUCION");
			if (sFEJECUCION != null && sFEJECUCION.trim().length() > 0) {
				FEJECUCION = this.stringToSqlDate(sFEJECUCION);
			}

			java.sql.Date FCARTERA = null;
			String sFCARTERA = this.getCampoTextual(request, "FCARTERA");
			if (sFCARTERA != null && sFCARTERA.trim().length() > 0) {
				FCARTERA = this.stringToSqlDate(sFCARTERA);
			}

			PAC_IAX_DINCARTERA pac_axis_dincartera = new PAC_IAX_DINCARTERA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_dincartera.ejecutaPAC_IAX_DINCARTERA__F_PROGRAMAR_CARTERA(SPROCES, MODOCARTERA, CEMPRES,
					NMES, NANYO, productosSeleccionados, NPOLIZA, NCERTIF, SPROCAR, FEJECUCION, FCARTERA);
			this.tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr050Service - m�todo m_carteraprogramada", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
