package axis.service.axis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FISCALIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LOG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisfis001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.modal.AxisimprimirService;
import axis.util.Constantes;

public class Axisfis001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisfis001Action thisAction) {
		logger.debug("Axisfis001Service m_form");
		try {
			init_empresa_presentadora(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * M�todo que carga el combo inicial de empresa
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void init_empresa_presentadora(HttpServletRequest request) throws Exception {
		List empresas = new ArrayList();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Carga de empresas
		Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		empresas = (List) tratarRETURNyMENSAJES(request, map);
		logger.debug(empresas);

		// Metemos el ArrayList en session para poder mostralo en la pantalla
		request.getSession().setAttribute("axisfis_empresas", !isEmpty(empresas) ? empresas : new ArrayList());
	}

	/**
	 * M�todo que se encarga de cargar los modelos, los tipos de soporte, los tipos
	 * de ciudadano en funci�n de la empresa seleccionada
	 * 
	 * @param request
	 */
	public void m_cargar_modelo(HttpServletRequest request) {
		logger.debug("Axisfis001Service m_cargar_modelo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CIDIOMA = usuario.getCidioma();

			// Si hay selecci�n de modelo, vaciamos la session asociada
			request.getSession().removeAttribute("axisfis_selectedModelo");

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_FISCALIDAD pac_axis_fiscalidad = new PAC_IAX_FISCALIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_fiscalidad.ejecutaPAC_IAX_FISCALIDAD__F_GET_MODELOS(CEMPRES, CIDIOMA);
			logger.debug("ejecutaPAC_IAX_FISCALIDAD__F_GET_MODELOS" + map);
			List modelos = (List) tratarRETURNyMENSAJES(request, map);

			// En funci�n de la empresa, cargamos los parametros tambi�n
			Map map1 = pac_axis_fiscalidad.ejecutaPAC_IAX_FISCALIDAD__F_GETDETVALORES(CEMPRES, "TIPOCIUDADANO",
					CIDIOMA);
			logger.debug("ejecutaPAC_IAX_FISCALIDAD__F_GETDETVALORES TIPOCIUDADANO" + map1);
			List tipoCiudadano = (List) tratarRETURNyMENSAJES(request, map1);

			Map map2 = new PAC_IAX_FISCALIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FISCALIDAD__F_GETDETVALORES(CEMPRES, "TIPOSOPORTE", CIDIOMA);
			logger.debug("ejecutaPAC_IAX_FISCALIDAD__F_GETDETVALORES TIPOSOPORTE" + map2);
			List tipoSoporte = (List) tratarRETURNyMENSAJES(request, map2);

			// Metemos el ArrayList en session para poder mostralo en la pantalla
			request.getSession().setAttribute("axisfis_modelos", !isEmpty(modelos) ? modelos : new ArrayList());
			request.getSession().setAttribute("axisfis_selectedEmpres", CEMPRES);
			request.getSession().setAttribute("axisfis_tipociu",
					!isEmpty(tipoCiudadano) ? tipoCiudadano : new ArrayList());
			request.getSession().setAttribute("axisfis_tiposop", !isEmpty(tipoSoporte) ? tipoSoporte : new ArrayList());
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_cargar_modelo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	/**
	 * M�todo que selecciona el modelo y fuerza el submit para poder trabajar
	 * correctamente con las dependencias aunque el combo est� vac�o
	 * 
	 * @param request
	 */
	public void m_seleccionar_modelo(HttpServletRequest request) {
		logger.debug("Axisfis001Service m_seleccionar_modelo");
		try {
			String CMODELO = getCampoTextual(request, "CMODELO");
			request.getSession().setAttribute("axisfis_selectedModelo", CMODELO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_seleccionar_modelo", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));

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
	public void m_ajax_generar_resultados(HttpServletRequest request) {
		logger.debug("Axisfis001Service m_ajax_generar_resultados");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			String CMODELO = getCampoTextual(request, "CMODELO");
			String CFICHERO = getCampoTextual(request, "CFICHERO");

			CFICHERO = comprobarFichero(CFICHERO);

			if (!"-0.csv".equals(CFICHERO)) {
				Date CFINI = stringToSqlDate(getCampoTextual(request, "CFINI"));
				Date CFFIN = stringToSqlDate(getCampoTextual(request, "CFFIN"));
				String CANYOFISC = getCampoTextual(request, "CANYOFISC");
				String CTIPOSOP = getCampoTextual(request, "CTIPOSOP");
				String CTIPOCIU = getCampoTextual(request, "CTIPOCIU");

				request.getSession().removeAttribute("CFICHERO");
				String[] C_FICHERO_OUT = { "P_FICHERO_OUT" };

				Map map = new PAC_IAX_FISCALIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_FISCALIDAD__F_GENERAR(CEMPRES, CMODELO, CFICHERO, CFINI, CFFIN, CANYOFISC,
								CTIPOSOP, CTIPOCIU, usuario.getCidioma());
				logger.debug("ejecutaPAC_IAX_FISCALIDAD__F_GENERAR" + map);
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
				resultado.put("FICHERO", CFICHERO);
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_ajax_generar_resultados", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza el tunneling de un fichero, es decir, dado un File, lo lee y lo env�a
	 * como un stream al navegador web v�a Response.
	 * 
	 * @param request
	 * @param thisAction
	 * @param response
	 */
	public void m_tunnel_doc(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Axisfis001Service m_tunnel_doc");
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String FICHERO = (String) request.getSession().getAttribute("CFICHERO");
			File f = ((!isEmpty(FICHERO)) ? new File(FICHERO) : null);
			// Recogemos el archivo correspondiente
			if (f != null && f.exists()) {
				// Si estamos aqu�, podemos tratar f
				bis = new BufferedInputStream(new FileInputStream(f));
				int bytesA = bis.available();
				response.setContentLength(bytesA);
				// Establecer tipo de Contenido Mime para la Response
				String fileMime = AxisimprimirService.detectMime(f.getName());
				response.setContentType(fileMime); // Extension obtenida de la lista p.ej rtf -> application/rtf
				logger.debug(fileMime + ", " + f.getName());
				response.setHeader("Content-Disposition", "attachment; filename=\"" + (f.getName()) + "\"");

				PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisfis001", f.getAbsolutePath(), null, null);
				// Lectura del fichero y env�o como stream de Response
				byte[] attachment = new byte[bytesA];
				sos = response.getOutputStream();
				while (true) {
					int bytesRead = bis.read(attachment, 0, attachment.length);
					if (bytesRead < 0)
						break;
					sos.write(attachment, 0, bytesRead);

				}
			} else {
				logger.debug("ERROR! No se ha podido pasar el fichero");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_tunnel_doc", e);
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Cerrar los recursos en el finally suele ser una buena pr�ctica
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
			} catch (IOException ioe) {
				logger.error("Error en el servicio Axisfis001Service - m�todo m_tunnel. Al limpiar recursos de IO.",
						ioe);
				AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	public static void main(String... args) throws Exception {
		// System.out.println("RESULTAT: " + comprobarFichero(".a.assa.343"));
	}
}
