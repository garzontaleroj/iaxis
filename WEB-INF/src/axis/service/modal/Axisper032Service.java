package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTADO;
import axis.jdbc.PAC_IAX_MAP;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper032Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper032Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisper032Action thisAction) {
		try {
			request.getSession().removeAttribute("Axisper032_listaPersonas");
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisper032Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.remove("SPERSON");
			BigDecimal persona = getCampoNumerico(request, "PERSONA");
			log.debug("------> persona:" + persona);

			String numide1 = getCampoTextual(request, "NNUMIDE1");
			formdata.put("BUSCAR", 2);
			if (!isEmpty(numide1)) {
				formdata.put("NNUMNIF", numide1);
			}

			formdata.put("PERSONA", persona);
			request.getSession().removeAttribute("axisper032_listaPersonas");

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un NOMBRE, un NNUMNIF y/o un NSIP de una Persona, ejecuta la consulta de
	 * b�squeda de Personas en BD, y devuelve el resultado en el atributo de sesi�n
	 * Axisper008_listaPersonas.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda_persona(HttpServletRequest request, Axisper032Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String NNUMNIF = getCampoTextual(request, "NNUMNIF");

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axisper032_listaPersonas");
				PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = new HashMap();

				map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DET_PERSONA(NNUMNIF, null, null, null, null, null,
						null, null, null, null, null, null);

				log.debug(map);
				formdata.put("BUSCAR", 1);
				request.getSession().setAttribute("axisper032_listaPersonas",
						(ArrayList) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_imprimir_report(HttpServletRequest request, HttpServletResponse response) {
		log.debug("Axisctr075Service m_imprimir_report");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			String PDATASOURCE = getCampoTextual(request, "SORTIDA");

			// String CMAPEAD = getCampoTextual(request, "CFITXER");
			String CMAPEAD = new String("514");
			log.debug("---> CMAPEAD" + CMAPEAD);

			Map map = new PAC_IAX_LISTADO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTADO__F_GENERA_REPORT(null, usuario.getCempres(), PDATASOURCE,
							usuario.getCidioma(), CMAPEAD);
			log.debug("----> PDF:" + map);

			tratarRETURNyMENSAJES(request, map);
			String nombreFichero = (String) map.get("PREPORT");
			this.tunnelFichero(request, response, nombreFichero);

		} catch (Exception e) {
			log.error("Error en el servicio Axisctr075Service - m�todo m_imprimir_report", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// cargarCombos(request);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		log.debug("Axisfis075Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			// String CMAP = getCampoTextual(request, "CMAP");
			String CMAP = new String("514");

			// String CPARAMETROS = getCampoTextual(request, "CPARAMETROS");
			String CPARAMETROS = new String(usuario.getCidioma().toString()) + "|"
					+ new String(usuario.getCempres().toString());

			String CFICHERO = getCampoTextual(request, "CFICHERO");

			CFICHERO = comprobarFichero(CFICHERO);

			if (!"-0.csv".equals(CFICHERO)) {
				request.getSession().removeAttribute("CFICHERO");
				String[] C_FICHERO_OUT = { "RETURN" };
				Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MAP__F_GENERAR_LISTADOS(CMAP, CPARAMETROS);

				log.debug("ejecutaPAC_IAX_MAP__F_GENERAR_LISTADOS" + map);

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
			log.error("Error en el servicio Axisctr075Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
