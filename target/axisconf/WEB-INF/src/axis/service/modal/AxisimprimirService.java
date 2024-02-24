//Revision:# 0CdeA1QaBr6pcj/A2082nA== #
package axis.service.modal;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.jdbc.PAC_IAX_DINCARTERA;
import axis.jdbc.PAC_IAX_IMPRESION;
import axis.jdbc.PAC_IAX_LOG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.AxisimprimirAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class AxisimprimirService extends AxisBaseService {
	static Log logger = LogFactory.getLog(AxisimprimirService.class);

	// Consultar http://www.w3schools.com/media/media_mimeref.asp
	// Para la lista completa de extensiones MIME
	public static final String[] extensionMimeXPairs =
			// "xml=text/xml",
			// Modificado cuando sea formato xml que fuerce a rtf??
			// JMF 08-06-2015 bug 36435/0206989 : cambio xml para que se asocie al texto
			new String[] { "htm,html=text/html", "mht,mhtml=message/rfc822", "txt,xml=text/plain",
					"pdf=application/pdf", "doc,dot=application/msword", "rtf=application/rtf",
					"xls,csv=application/vnd.ms-excel", "ppt,pps,pot=application/vnd.ms-powerpoint",
					"zip=application/zip", "tar=application/x-tar", "gtar=application/x-gtar", "gz=application/x-gzip",
					"jpg,jpe,jpeg=image/jpeg", "gif=image/gif", "tif,tiff=image/tiff", "bmp=image/bmp",
					"ico=image/x-icon", "exe,bin=application/octet-stream", "avi=video/x-msvideo",
					"mov,qt=video/quicktime", "mpg,mp2,mpa,mpe,mpeg,mpv2=video/mpeg", "wav=audio/x-wav",
					"mp3=audio/mpeg", "ra,ram=audio/x-pn-realaudio", "mdb=application/x-msaccess",
					"pub=application/x-mspublisher", "swf=application/x-shockwave-flash",
					"(DEFAULT)=application/download" };

	public static final String[] directorio = new String[] { "GEDOXTEMPORAL", "AXIS_PLANTILLAS" };
	public static final String[] clavesDir = new String[] { "gedox", "plantilles" };

	public static final HashMap dirs = new HashMap();

	private static Properties extensionMime = new Properties();

	// Bloque estático para cargar los Mime Properties
	static {
		for (int i = 0; i < extensionMimeXPairs.length; i++) {
			String extensionMimeXPair = extensionMimeXPairs[i];
			String[] extensionMimeXExtensions = StringUtils
					.split(extensionMimeXPair.substring(0, extensionMimeXPair.indexOf("=")), ",");
			String extensionMimeXMime = extensionMimeXPair.substring(extensionMimeXPair.indexOf("=") + 1).trim();
			for (int j = 0; j < extensionMimeXExtensions.length; j++) {
				if (extensionMimeXExtensions[j].trim().length() > 0) {
					extensionMime.setProperty(extensionMimeXExtensions[j].trim(), extensionMimeXMime);
				}
			}
		}
		for (int i = 0; i < directorio.length; i++) {
			dirs.put(clavesDir[i], directorio[i]);
		}
	}

	/**
	 * Método inicial al llamar a éste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Método que se llama al cargar la pantalla. Se encarga de cargar el documento
	 * a imprimir, dado un determinado SSEGURO y CTIPO. Además, realiza una
	 * comprobación de si el fichero se puede leer des de Java, y si efectivamente
	 * se puede leer lo encapsula en un objeto File y lo mete en sesión
	 * ("axisimprimir_f").
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form");

		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SEGURO = getCampoNumerico(request, "SEGURO");
			String CTIPO = getCampoTextual(request, "CTIPO");
			String mensaje = getCampoTextual(request, "MENSAJE");
			if (CTIPO == null)
				CTIPO = "8"; // TODO: eso para pruebas, debe desaparecer

			// File f = this.imprimir(request, SEGURO, CTIPO);
			ArrayList lista = this.imprimir_doc(request, SEGURO, CTIPO);

			/*
			 * if (f != null) { request.getSession().setAttribute("axisimprimir_f", f);
			 * 
			 * // Cargar en sesión el icono que representa el tipo de archivo String
			 * extension = AxisimprimirService.getExtension(f.getName()); if
			 * (!isEmpty(extension)) { // Es una lástima pero esto no funciona en
			 * Tomcat...lo hago con el REALPATH // Obtenemos la URL del fichero de icono //
			 * java.net.URL url =
			 * request.getSession().getServletContext().getResource("/images/filetypes/" +
			 * extension + ".jpg"); // Si existe la URL, instanciamos un objeto File que
			 * apunte al fichero String filePath = Constantes.REALPATH +
			 * "/images/filetypes/" + extension + ".jpg"; File iconFile = new
			 * File(filePath); // Si el fichero para esta extensión existe, guardamos su
			 * nombre en sesión. if (iconFile.exists() && iconFile.canRead())
			 * request.getSession().setAttribute("axisimprimir_ico", extension); } }
			 */
			if (lista != null) {

				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}

						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));

				}

				request.getSession().setAttribute("lista_impresion", lista);

			}

			request.setAttribute("MENSAJE", mensaje);
			request.setAttribute("EMAILENVIODOC", getCampoTextual(request, "EMAILENVIODOC"));

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Método que se llama al cargar la pantalla. Se encarga de cargar el documento
	 * a imprimir, dado un determinado SSEGURO y CTIPO. Además, realiza una
	 * comprobación de si el fichero se puede leer des de Java, y si efectivamente
	 * se puede leer lo encapsula en un objeto File y lo mete en sesión
	 * ("axisimprimir_f").
	 * 
	 * @param request
	 * @param thisAction
	 */
	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form

	void m_form_doc(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc");

		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SEGURO = getCampoNumerico(request, "SEGURO");
			// String mensaje=getCampoTextual(request, "MENSAJE");

			String mensaje = java.net.URLDecoder.decode(request.getParameter("MENSAJE"), "ISO-8859-1");
			logger.debug("-----> comentario:" + mensaje);

			String fingreso = new String(request.getParameter("MENSAJE").getBytes("ISO-8859-1"), "UTF-8");
			logger.debug("-----> fingreso:" + fingreso);

			String CTIPO = getCampoTextual(request, "CTIPO");
			if (CTIPO == null)
				CTIPO = "8"; // TODO: eso para pruebas, debe desaparecer

			ArrayList lista = this.imprimir_doc(request, SEGURO, CTIPO);
			if (lista != null) {

				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {

						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}

						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));

				}

				request.getSession().setAttribute("lista_impresion", lista);

			}

			/*
			 * ********************************* RECUPERAR VALORES OBJETO_INFO
			 * ************************************
			 */

			request.setAttribute("MENSAJE", mensaje);

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_form_doc_tipo(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SEGURO = getCampoNumerico(request, "SEGURO");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");
			String TIPO = request.getParameter("TIPO");
			if (CTIPO == null)
				CTIPO = "8"; // TODO: eso para pruebas, debe desaparecer
			ArrayList lista = this.imprimir_doc_tipo(request, SEGURO, TIPO, CIDIOMA);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
			request.setAttribute("SEGURO", SEGURO);
			request.setAttribute("CIDIOMA", CIDIOMA);
			request.setAttribute("CTIPO", CTIPO);
			request.setAttribute("TIPO", TIPO);
			request.setAttribute("EMAILENVIODOC", getCampoTextual(request, "EMAILENVIODOC"));
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc_tipo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public
	// TODO: Metodo que imprima los datos de una persona desde la pantalla
	// AXISPER009
	void m_form_sperson(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_sperson");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String TIPO = request.getParameter("TIPO");
			// INI - TCS_324B - JLTS - 11/02/2019. Se adiciona la opción idioma por
			// parámetro CIDOOMAREP
			BigDecimal CIDOOMAREP = getCampoNumerico(request, "CIDOOMAREP");
			ArrayList lista = this.imprimir_sperson(request, SPERSON, TIPO, CIDOOMAREP);
			// FIN - TCS_324B - JLTS - 11/02/2019. Se adiciona la opción idioma por
			// parámetro CIDOOMAREP
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
			request.setAttribute("SPERSON", SPERSON);
			request.setAttribute("TIPO", TIPO);
			request.setAttribute("EMAILENVIODOC", getCampoTextual(request, "EMAILENVIODOC"));
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_sperson", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_impresion_cartas(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			// bug 0022030
			BigDecimal SGESCARTA = getCampoNumerico(request, "SGESCARTA");
			BigDecimal SDEVOLU = getCampoNumerico(request, "SDEVOLU");
			String mensaje = getCampoTextual(request, "MENSAJE");

			ArrayList lista = this.imprimir_impresion_cartas(request, SGESCARTA, SDEVOLU);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc_tipo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_impresion_recibos(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SPROIMP = getCampoNumerico(request, "SPROIMP");
			String mensaje = getCampoTextual(request, "MENSAJE");

			ArrayList lista = this.imprimir_impresion_recibos(request, SPROIMP);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc_tipo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_form_docproducto_tipo(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String NOMFITXER = request.getParameter("NOMFITXER");
			String TIPO = request.getParameter("TIPO");

			ArrayList lista = this.imprimir_docproducto_tipo(request, SPRODUC, NRIESGO, TIPO, NOMFITXER);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc_tipo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/* Impresion lista facturas */

	public

			void m_form_factura_tipo(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_factura_tipo");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal NFACT = getCampoNumerico(request, "NFACTURA");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String TIPO = request.getParameter("TIPO");

			ArrayList lista = this.imprimir_factura_tipo(request, NREEMB, NFACT, NRIESGO, SSEGURO, TIPO);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_doc_tipo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
	// etm ini

	/* Impresion lista pagossini */

	public

			void m_form_impresion_pagosini(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_impresion_pagosini");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			String TIPO = request.getParameter("TIPO");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			ArrayList lista = this.imprimir_pagosini(request, SSEGURO, SIDEPAG, TIPO, CCAUSIN, CMOTSIN);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_impresion_pagosini", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}
	// etm fin
	// --ETM INI 24-11-2011

	/* Impresion lista TRAMITA */

	public

			void m_form_impresion_trami(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_impresion_trami");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			String NSINIES = request.getParameter("NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			String TIPO = request.getParameter("TIPO");

			ArrayList lista = this.imprimir_trami(request, NSINIES, NTRAMIT, CESTADO, TIPO);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_impresion_trami", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	// --ETM FIN

	/**
	 * Realiza el tunneling de un fichero, es decir, dado un File en Session llamado
	 * axisimprimir_f, lo lee y lo envía como un stream al navegador web vía
	 * Response.
	 * 
	 * @param request
	 * @param thisAction
	 * @param response
	 */
	public void m_tunnel(HttpServletRequest request, AxisimprimirAction thisAction, HttpServletResponse response) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		logger.debug("AxisimprimirService m_tunnel");
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;

		String SO = ConfigCache.getConfig().getProperty("SOSERVER", "WINDOWS");

		int fila = -1;
		try {
			fila = Integer.parseInt((String) formdata.get("document"));
		} catch (Exception e) {
		}

		try {

			if (formdata.get("file") != null) { // EXISTE EL PARAMETRO FILE
				/////// ///////////////////////////// ////////
				///// TRATAMIENTO 1: FICHERO RELLENADO ////////
				/////// ///////////////////////////// ////////

				String filedir = null;

				if (SO.equals(new String("UNIX"))) {
					filedir = getCampoTextual(request, "file").replace("\\", "/");
				} else {
					filedir = getCampoTextual(request, "file");
				}

				File dir = new File(filedir);

				if (dir.isFile()) {
					logger.debug("es un fichero:" + dir.getAbsolutePath());
					if (dir.length() == 0) {
						logger.debug("es de longitud 0, tiro error");
						throw new Exception("Documento vacio.");
					}
				}
				if (!dir.isFile()) {
					//////////////////////////////////
					// FILE RELLENADO - DIR
					//////////////////////////////////
					String dirString = dir.getAbsolutePath();

					File[] ficheros = dir.listFiles();
					// Mirar si el resultado del listado es cero o no
					// Revisar que está devolviendo esta función
					StringBuffer listado = new StringBuffer("<html><body>");
					if (dir.getParent() != null) {
						listado.append("[D] <a href=\"modal_axisimprimir.do?operation=tunnel&file=")
								.append(dir.getParent()).append("\">").append("..").append("</a><br />").append("\n");
					}

					if (ficheros == null) {
						System.out.println("No hay ficheros en el directorio especificado");

					} else {
						for (int x = 0; x < ficheros.length; x++) {
							if (ficheros[x].isFile()) {
								listado.append(
										"[F] <a target=\"_new\" href=\"modal_axisimprimir.do?operation=tunnel&file=")
										.append(ficheros[x]).append("\">").append(ficheros[x].getName()).append("</a> ")
										.append(ficheros[x].length() + "B").append("<br />").append("\n");
							}
							if (ficheros[x].isDirectory()) {
								listado.append(
										"[D] <a target=\"_new\" href=\"modal_axisimprimir.do?operation=tunnel&file=")
										.append(ficheros[x]).append("\">").append(ficheros[x].getName())
										.append("</a><br />").append("\n");
							}
						}

					}

					listado.append("</html></body>");

					// El contenido de la cadenation en bytes
					byte[] cadena = listado.toString().getBytes();

					String fileMime = null;
					// Cargamos en bis el contenido del listado de ficheros
					InputStream cadena_aux = new ByteArrayInputStream(cadena); // listado.getBytes());
					bis = new BufferedInputStream(cadena_aux);

					int bytesA = cadena.length;
					response.setContentLength(bytesA);

					// mimetype aki siempre text/html
					fileMime = "text/html";
					response.setContentType(fileMime);
					String nombre_dir = "DIR.html";
					response.setHeader("Content-Disposition", "attachment; filename=\"" + nombre_dir + "\"");

					// Lectura del fichero y envío como stream de Response
					byte[] attachment = new byte[bytesA];

					logger.debug("long:" + attachment.length);

					if (attachment.length == 0)
						throw new Exception("Documento vacio.");

					sos = response.getOutputStream();
					while (true) {
						int bytesRead = bis.read(attachment, 0, attachment.length);
						if (bytesRead < 0)
							break;
						sos.write(attachment, 0, bytesRead);
					}

				} else {
					////////////////////////////////////////////////////
					// FILE RELLENADO - FICHERO
					//
					////////////////////////////////////////////////////

					String fileMime = null;
					// Si nos viene rellenado el mime ya no irá a buscar su valor
					fileMime = getCampoTextual(request, "mimetype");
					// Recogemos el valor del fichero de sesión

					File f = new File(filedir);
					if (f != null) {
						// Si estamos aquí, podemos tratar f

						bis = new BufferedInputStream(new FileInputStream(f));
						int bytesA = bis.available();
						response.setContentLength(bytesA);

						// Establecer tipo de Contenido Mime para la Response
						if (fileMime == null)
							fileMime = AxisimprimirService.detectMime(f.getName());
						response.setContentType(fileMime);
						logger.debug(fileMime + ", " + f.getName());
						String nombre_fichero = f.getName();
						int posicion = nombre_fichero.indexOf(".");
						int longitud = nombre_fichero.length();
						String extension = nombre_fichero.substring(longitud - 3, longitud);

						// JMF 08-06-2015 bug 36435/0206989 : cambio xml para que se asocie al texto
						// Cuando se trata de un tipo xml concatena al nombre el tipo rtf
						// if (request.getParameter("mantenerExtension")==null) { // ecg 20100217 tenia
						// añadir este control porque se ha prodicodo un XML, y no me intetresa la
						// extension .rtf
						// if (extension.equals("xml"))
						// nombre_fichero=nombre_fichero+".rtf";
						// }
						// else {
						nombre_fichero = f.getName();
						// }

						response.setHeader("Content-Disposition", "attachment; filename=\"" + (nombre_fichero) + "\"");

						// Lectura del fichero y envío como stream de Response
						byte[] attachment = new byte[bytesA];
						logger.debug("long:" + attachment.length);

						PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisimprimir", f.getAbsolutePath(), null,
								new BigDecimal(fila));
						sos = response.getOutputStream();
						while (true) {
							int bytesRead = bis.read(attachment, 0, attachment.length);
							if (bytesRead < 0)
								break;
							sos.write(attachment, 0, bytesRead);
						}
					}

				}

			} else { // ELSE A FILE VIENE NO RELLENADO

				/////////////////////////////////
				// TRATAMIENTO 3: TRADICIONAL
				/////////////////////////////////

				String fileMime = null;
				// Si nos viene rellenado el mime ya no irá a buscar su valor
				fileMime = getCampoTextual(request, "mimetype");
				File f = (File) request.getSession().getAttribute("axisimprimir_f");

				if (f != null) {
					// Si estamos aquí, podemos tratar f
					bis = new BufferedInputStream(new FileInputStream(f));

					int bytesA = bis.available();
					response.setContentLength(bytesA);

					// Establecer tipo de Contenido Mime para la Response
					if (fileMime == null)
						fileMime = AxisimprimirService.detectMime(f.getName());
					response.setContentType(fileMime); // Extension obtenida de la lista p.ej rtf -> application/rtf
					logger.debug(fileMime + ", " + f.getName());
					response.setHeader("Content-Disposition", "attachment; filename=\"" + (f.getName()) + "\"");

					PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisimprimir", f.getAbsolutePath(), null,
							new BigDecimal(fila));
					// Lectura del fichero y envío como stream de Response
					byte[] attachment = new byte[bytesA];
					sos = response.getOutputStream();
					while (true) {
						int bytesRead = bis.read(attachment, 0, attachment.length);
						if (bytesRead < 0)
							break;
						sos.write(attachment, 0, bytesRead);
					}
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_tunnel", e);
			thisAction.guardarMensaje(request, "1000053", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Cerrar los recursos en el finally suele ser una buena práctica
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			} catch (IOException ioe) {
				logger.error("Error en el servicio AxisimprimirService - método m_tunnel. Al limpiar recursos de IO.",
						ioe);
				thisAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	/**
	 * Realiza el tunneling de un fichero, es decir, dado un File en Session llamado
	 * axisimprimir_f, lo lee y lo envía como un stream al navegador web vía
	 * Response.
	 * 
	 * @param request
	 * @param thisAction
	 * @param response
	 */
	public void m_tunnel_doc(HttpServletRequest request, AxisimprimirAction thisAction, HttpServletResponse response) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		logger.debug("AxisimprimirService m_tunnel_doc");
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;

		try {

			ArrayList lista = (ArrayList) request.getSession().getAttribute("lista_impresion");

			String fileMime = null;
			// Si nos viene rellenado el mime ya no irá a buscar su valor
			fileMime = getCampoTextual(request, "mimetype");

			int fila = Integer.parseInt((String) formdata.get("document"));

			if (lista != null) {
				File f = (File) ((Map) ((Map) lista.get(fila)).get("OB_IAX_IMPRESION")).get("FILE");
				// Recogemos el archivo correspondiente

				if (f != null) {
					// Si estamos aquí, podemos tratar f
					bis = new BufferedInputStream(new FileInputStream(f));

					int bytesA = bis.available();
					response.setContentLength(bytesA);

					// Establecer tipo de Contenido Mime para la Response
					if (fileMime == null) {
						fileMime = AxisimprimirService.detectMime(f.getName());
						response.setContentType(fileMime); // Extension obtenida de la lista p.ej rtf -> application/rtf
						logger.debug(fileMime + ", " + f.getName());
						response.setHeader("Content-Disposition", "attachment; filename=\"" + (f.getName()) + "\"");

						PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisimprimir", f.getAbsolutePath(), null,
								new BigDecimal(fila));
						// Lectura del fichero y envío como stream de Response
						byte[] attachment = new byte[bytesA];
						sos = response.getOutputStream();
						while (true) {
							int bytesRead = bis.read(attachment, 0, attachment.length);
							if (bytesRead < 0)
								break;
							sos.write(attachment, 0, bytesRead);

						}
					}

				} // final del if inicial
			}
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_tunnel_doc", e);
			thisAction.guardarMensaje(request, "1000053", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Cerrar los recursos en el finally suele ser una buena práctica
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
				this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			} catch (IOException ioe) {
				logger.error(
						"Error en el servicio AxisimprimirService - método m_tunnel_doc. Al limpiar recursos de IO.",
						ioe);
				thisAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}

	}

	/**
	 * Detecta y devuelve el tipo MIME de un fichero en función de su extensión.
	 * 
	 * @param fileNameAndPath
	 * @return
	 */
	public static String detectMime(String fileNameAndPath) {
		String retVal = extensionMime.getProperty("(DEFAULT)");

		retVal = extensionMime.getProperty(AxisimprimirService.getExtension(fileNameAndPath), retVal);
		return retVal;
	}

	/**
	 * Recupera y devuelve la extensión de un fichero sin el punto. Ex: xls, pdf,
	 * doc...
	 * 
	 * @param fileNameAndPath
	 * @return
	 */
	private static String getExtension(String fileNameAndPath) {
		String miExtension = "";

		if (fileNameAndPath.indexOf(".") > 0 && fileNameAndPath.lastIndexOf(".") + 1 <= fileNameAndPath.length())
			miExtension = fileNameAndPath.substring(fileNameAndPath.lastIndexOf(".") + 1);

		miExtension = miExtension.toLowerCase();

		if (extensionMime.getProperty(miExtension) == null)
			return "(DEFAULT)";
		else
			return miExtension;
	}

	private static String getDirectorio(String filePath) {
		for (Iterator iter = dirs.keySet().iterator(); iter.hasNext();) {
			String key = (String) iter.next();
			if (filePath.indexOf(key) >= 0) {
				return (String) dirs.get(key);
			}
		}
		return null;
	}

	public void tratamientoFicheros() {

	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_form_questsalud(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String NOMFITXER = request.getParameter("NOMFITXER");

			ArrayList lista = this.imprimir_questsalud(request, SSEGURO, NRIESGO, NOMFITXER);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_questsalud", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public
	// TODO: Eliminar los metodos duplicados cuando se unifiquen las dos pantallas
	// m_form_doc y m_form
	void m_form_ListComi(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_doc_tipo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CPROCES = getCampoNumerico(request, "CPROCES");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String NOMFITXER = request.getParameter("NOMFITXER");

			ArrayList lista = this.imprimir_ListComi(request, CEMPRES, CPROCES, CAGENTE, NOMFITXER);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_questsalud", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_form_Recibo(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_recibo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal CNRECIBO = getCampoNumerico(request, "CNRECIBO");
			BigDecimal CNDOCUME = getCampoNumerico(request, "CNDOCUME");
			BigDecimal CSSEGURO = getCampoNumerico(request, "CSSEGURO");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");

			ArrayList lista = this.imprimir_Recibo(request, CNRECIBO, CNDOCUME, CSSEGURO, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_recibo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_impresion_traspas(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_impresion_traspas");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal CSTRASPAS = getCampoNumerico(request, "CSTRAPAS");
			BigDecimal CSSEGURO = getCampoNumerico(request, "CSSEGURO");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");

			ArrayList lista = this.impresion_traspas(request, CSTRASPAS, CSSEGURO, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_recibo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_impresion_preavisos(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_impresion_preavisos");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal CSPROCES = getCampoNumerico(request, "CSPROCES");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");

			ArrayList lista = this.impresion_preavisos(request, CSPROCES, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_recibo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_imp_diferida(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal DOC = getCampoNumerico(request, "DOC");
			String DESC = getCampoTextual(request, "DESC");
			String FICH = getCampoTextual(request, "FICH");
			BigDecimal TIPO = getCampoNumerico(request, "TIPO");
			BigDecimal DIF = getCampoNumerico(request, "DIFERIDO");
			BigDecimal CATEGORIA = getCampoNumerico(request, "CATEGORIA");
			logger.debug("AxisimprimirService m_imp_diferida" + "DOC=" + DOC + "DESC=" + DESC + "FICH=" + FICH + "TIPO="
					+ TIPO + "DIF=" + DIF + "CATEGORIA=" + CATEGORIA);

			PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_INS_DOC(DOC, DESC, FICH, TIPO, DIF, CATEGORIA);

			logger.debug(map);
			/*
			 * if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
			 * List listaAgentes =
			 * (List)request.getSession().getAttribute("axisctr014_listaAgentes"); Map
			 * agente = getObjetoDeLista(listaAgentes, CODI, "CODI");
			 * 
			 * if (!isEmpty(agente)) { ajax.guardarContenidoFinalAContenedorAjax(agente);
			 * request.getSession().setAttribute("axisctr_agente", agente); } listaAgentes =
			 * null; }
			 */
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_form_proceso(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_recibo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");

			ArrayList lista = this.imprimir_proceso(request, SPROCES, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_proceso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_enviarcorreo(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_enviarcorreo");
		try {
			BigDecimal SSEGURO = this.isEmpty(getCampoNumerico(request, "SSEGURO"))
					? (BigDecimal) request.getSession().getAttribute("SSEGURO")
					: getCampoNumerico(request, "SSEGURO");
			String EMAILENVIODOC = getCampoTextual(request, "EMAILENVIODOC");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String MODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CIDIOMA = usuario.getCidioma();
			String EVENTO = getCampoTextual(request, "EVENTO");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String fichero = "";
			String directorio = "";
			List ficheroDescompuesto = new ArrayList();
			String listaDoc = "";
			String listaMimeTypes = "";
			String listaDir = "";
			int i = 0;
			while ((fichero = getCampoTextual(request, "FICHERO_" + i++)) != null) {
				String separador = (getCampoTextual(request, "FICHERO_" + i) == null) ? "" : ",";
				listaMimeTypes += detectMime(fichero) + separador;
				ficheroDescompuesto = Arrays.asList(fichero.split("(\\\\|\\/)"));
				listaDoc += ficheroDescompuesto.get(ficheroDescompuesto.size() - 1) + separador;
			}
			i = 0;
			while ((directorio = getCampoTextual(request, "DIRECTORIO_" + i++)) != null) {
				String separador = (getCampoTextual(request, "DIRECTORIO_" + i) == null) ? "" : ",";
				listaDir += directorio + separador;
			}

			request.setAttribute("MENSAJE", mensaje);
			request.setAttribute("EMAILENVIODOC", EMAILENVIODOC);
			// 500031 No hay documentación asignada
			if (listaDoc.equals("")) {
				thisAction.guardarMensaje(request, "500031", new Object[] { "" }, Constantes.MENSAJE_INFO);
				return;
			}

			PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_VIA_CORREO(MODO, EVENTO, CIDIOMA, listaDir,
					listaDoc, listaMimeTypes, EMAILENVIODOC, null, SSEGURO);
			BigDecimal retorno = (BigDecimal) tratarRETURNyMENSAJES(request, map, true);
			logger.debug("Envio de correo >> " + map);

			if (retorno.intValue() == 0) {
				thisAction.guardarMensaje(request, "9904840", new Object[] { "" }, Constantes.MENSAJE_INFO);
			} else {
				List mensajes = (List) map.get("MENSAJES");
				HashMap OB_IAX_MENSAJES = (HashMap) mensajes.get(0);
				String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");
				thisAction.guardarMensaje(request, "9904380", new Object[] { TERROR }, Constantes.MENSAJE_ERROR);
			}
			logger.debug("AxisimprimirService fin  m_enviarcorreo");
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_enviarcorreo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_imprimir_renovcero(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_imprimir_renovcero");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal CSSEGURO = getCampoNumerico(request, "CSSEGURO");
			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");

			ArrayList lista = this.imprimir_renovcero(request, CSSEGURO, CTIPO);

			PAC_IAX_DINCARTERA pac_din_cartera = new PAC_IAX_DINCARTERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_din_cartera.ejecutaPAC_IAX_DINCARTERA__F_RETROCEDER_CARTERA_CERO(CSSEGURO);
			logger.debug("map: " + m);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_imprimir_renovcero", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public void m_form_proceso_compania(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_recibo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

			String mensaje = getCampoTextual(request, "MENSAJE");
			String CTIPO = getCampoTextual(request, "CTIPO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			ArrayList lista = this.imprimir_proceso_compania(request, SPROCES, CCOMPANI, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_proceso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	// RACS INICIO IMPRESION PAGO CASH DESCK
	public void m_refdeposito(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_recibo");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			String CTIPO = getCampoTextual(request, "CTIPO");
			BigDecimal REFDEPOSITO = getCampoNumerico(request, "REFDEPOSITO");
			String mensaje = getCampoTextual(request, "MENSAJE");

			ArrayList lista = this.imprimir_referencia_deposito(request, REFDEPOSITO, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_proceso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

		// RACS FIN IMPRESION PAGO CASH DESCK

	}

	public void m_form_impresion_sinies_soldoc(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_form_impresion_sinies_soldoc");
		try {
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			BigDecimal TIPO = getCampoNumerico(request, "TIPO");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String NSINIES = request.getParameter("NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "TRAMITAC");
			BigDecimal SIDEPAG = getCampoNumerico(request, "NPAGO");

			ArrayList lista = this.imprimir_sinies_soldoc(request, TIPO, SSEGURO, NSINIES, NTRAMIT, SIDEPAG);
			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_impresion_pagosini", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	// TCS_19 - ACL - 11/03/2019 - INICIO IMPRESION PAGARES CONTRAGARANTIAS
	public void m_impresion_pagare(HttpServletRequest request, AxisimprimirAction thisAction) {
		logger.debug("AxisimprimirService m_impresion_pagare");
		try {
			logger.debug("request:" + request);
			request.getSession().removeAttribute("axisimprimir_f");
			request.getSession().removeAttribute("lista_impresion");

			String CTIPO = getCampoTextual(request, "CTIPO");
			BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
			String mensaje = getCampoTextual(request, "MENSAJE");

			ArrayList lista = this.imprimir_pagare(request, SCONTGAR, CTIPO);

			if (lista != null) {
				for (int i = 0; i < lista.size(); i++) {
					if (!isEmpty(lista.get(i)) && !isEmpty(((Map) lista.get(i)).get("OB_IAX_IMPRESION"))) {
						// EXT se recupera por nombre de PL, no por nombre fichero...
						String extension = AxisimprimirService.getExtension(
								(String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO"));

						String NOMBRE_FICHERO = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("FICHERO");
						String NOMBRE_FICHERO_AUX = "";

						if (!isEmpty(NOMBRE_FICHERO)) {
							String PRUEBA[] = NOMBRE_FICHERO.split("\\\\");
							if (PRUEBA != null && PRUEBA.length >= 1) {
								NOMBRE_FICHERO_AUX = PRUEBA[PRUEBA.length - 1];
							}

						}
						// Cargamos la extensión del fichero en la tabla
						if (!isEmpty(extension)) {
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("EXT", extension);
							((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO_AUX", NOMBRE_FICHERO_AUX);
						}

						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */
						ArrayList info_campos = (ArrayList) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION"))
								.get("INFO_CAMPOS");
						if (!isEmpty(info_campos)) {
							for (int j = 0; j < info_campos.size(); j++) {
								Map map_info_campos = (Map) info_campos.get(j);

								Map campos = (Map) map_info_campos.get("OB_IAX_INFO");

								String NOMBRE_COLUMNA = (String) campos.get("NOMBRE_COLUMNA");
								// String VALOR_COLUMNA = (String)campos.get("NOMBRE_COLUMNA");
								if ("IDDOC".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("IDDOC",
											campos.get("VALOR_COLUMNA"));
								} else if ("CFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("TCONFFIRMA".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("TCONFFIRMA",
											campos.get("VALOR_COLUMNA"));
								} else if ("CCODPLAN".equals(NOMBRE_COLUMNA)) {
									((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("CCODPLAN",
											campos.get("VALOR_COLUMNA"));
								}

							}
						}
						/*
						 * ************************** Cargamos valores info_campos
						 * **********************************
						 */

					}
					PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_CATEGORIAS();
					logger.debug("F_GET_CATEGORIAS -----------------------> " + map);
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("LSTCATEGORIAS",
							(List<Map>) tratarRETURNyMENSAJES(request, map, false));
				}
				request.getSession().setAttribute("lista_impresion", lista);
			}
			request.setAttribute("MENSAJE", mensaje);
		} catch (Exception e) {
			logger.error("Error en el servicio AxisimprimirService - método m_form_proceso", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	// TCS_19 - ACL - FIN IMPRESION PAGARE CONTRAGARANTIA

}
