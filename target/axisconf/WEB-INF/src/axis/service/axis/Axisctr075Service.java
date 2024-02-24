package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTADO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr075Service.java 12/12/2008
 * 
 * @author <a href="jgarciam@csi-ti.com">Jaume Garcia</a>
 * @since Java 5.0
 */
public class Axisctr075Service extends AxisBaseService {
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
		logger.debug("Axisctr075Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CFITXER = getCampoTextual(request, "CFITXER");
			String SDESCRIPCIO;
			String SGUIA;

			logger.debug("Fitxer map:" + CFITXER);
			if (CFITXER != null) {
				Map m = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GET_DATMAP(CFITXER);
				logger.debug("map PAC_IAX_MAP.F_GET_DATMAP-->" + m);

				// {RETURN=[{TCOMENTARIO=Interfaz contable con SAP, TPARAMETROS=Data|Empresa
				// /*31012008|1*/}], MENSAJES=null}

				// m.get
				formdata.put("F_GET_DATMAP", m);
				// ---------------------------------------de paso miro el tipo de
				// map.-------------------
				Map m2 = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GET_TIPOMAP(CFITXER);
				logger.debug("map PAC_IAX_MAP.F_GET_TIPOMAP-->" + m2);

				formdata.put("F_GET_TIPOMAP", m2);

			}
			this.cargarCombos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr075Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisfis075Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CMAP = getCampoTextual(request, "CMAP");
			String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");
			String CFICHERO = getCampoTextual(request, "CFICHERO");

			CFICHERO = comprobarFichero(CFICHERO);

			if (!"-0.csv".equals(CFICHERO)) {
				request.getSession().removeAttribute("CFICHERO");
				String[] C_FICHERO_OUT = { "RETURN" };
				Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GENERAR_LISTADOS(CMAP, CPARAMETROS);

				logger.debug("ejecutaPAC_IAX_MAP__F_GENERAR_LISTADOS" + map);

				ajax.guardarContenidoFinalAContenedorAjax(map);

				Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

				if (resultadoAjax[0].equals(new BigDecimal(0))) {
					Map resultado = new HashMap();
					resultado.put("VALOR", resultadoAjax[0]);
					if (!isEmpty(resultadoAjax[1])) {
						resultado.put("FICHERO", resultadoAjax[1]);
						resultado.put("PINTARIMP", map.get(""));
					}

					ajax.guardarContenidoFinalAContenedorAjax(resultado);
				}

			} else {
				Map resultado = new HashMap();
				resultado.put("FICHERO", CFICHERO);
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr075Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
		logger.debug("Axisctr075Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_FICHEROS();
			logger.debug(map);
			LSTVALORES.put("LSTMAPS", tratarRETURNyMENSAJES(request, map));

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr075Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_imprimir_report(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Axisctr075Service m_imprimir_report");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String PDATASOURCE = getCampoTextual(request, "SORTIDA");

			String CMAPEAD = getCampoTextual(request, "CFITXER");

			logger.debug("---> CMAPEAD" + CMAPEAD);

			Map map = new PAC_IAX_LISTADO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTADO__F_GENERA_REPORT(null, usuario.getCempres(), PDATASOURCE,
							usuario.getCidioma(), CMAPEAD);
			logger.debug("----> PDF:" + map);

			tratarRETURNyMENSAJES(request, map);
			String nombreFichero = (String) map.get("PREPORT");
			this.tunnelFichero(request, response, nombreFichero);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr075Service - m�todo m_imprimir_report", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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

}
