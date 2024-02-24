//Revision:# 4RD4vbbpid0Kj28PH402Gg== #
package axis.service.modal;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
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
import axis.jdbc.PAC_IAX_GEDOX;
import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.jdbc.PAC_IAX_IMPRESION;
import axis.jdbc.PAC_IAX_LOG;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.AxisgedoxAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class AxisgedoxService extends AxisBaseService {
	static Log logger = LogFactory.getLog(AxisgedoxService.class);

	// Consultar http://www.w3schools.com/media/media_mimeref.asp
	// Para la lista completa de extensiones MIME
	public static final String[] extensionMimeXPairs = new String[] { "htm,html=text/html", "mht,mhtml=message/rfc822",
			"txt=text/plain", "xml=text/xml", "pdf=application/pdf", "doc,dot=application/msword",
			"rtf=application/rtf", "xls,csv=application/vnd.ms-excel", "ppt,pps,pot=application/vnd.ms-powerpoint",
			"zip=application/zip", "tar=application/x-tar", "gtar=application/x-gtar", "gz=application/x-gzip",
			"jpg,jpe,jpeg=image/jpeg", "gif=image/gif", "tif,tiff=image/tiff", "bmp=image/bmp", "ico=image/x-icon",
			"exe,bin=application/octet-stream", "avi=video/x-msvideo", "mov,qt=video/quicktime",
			"mpg,mp2,mpa,mpe,mpeg,mpv2=video/mpeg", "wav=audio/x-wav", "mp3=audio/mpeg", "ra,ram=audio/x-pn-realaudio",
			"mdb=application/x-msaccess", "pub=application/x-mspublisher", "swf=application/x-shockwave-flash",
			"(DEFAULT)=application/download" };

	private static Properties extensionMime = new Properties();

	// Bloque est�tico para cargar los Mime Properties
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
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, AxisgedoxAction thisAction) {
		logger.debug("AxisgedoxService m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio AxisgedoxService - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al cargar la pantalla. Se encarga de cargar los
	 * documentos GEDOX disponibles para un determinado SSEGURO y NMOVIMI, cargar
	 * sus iconos en funci�n de sus extensiones y ponerlos en "formdata.axisgedox".
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AxisgedoxAction thisAction) {
		logger.debug("AxisgedoxService m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String TIPO;
		if (isEmpty(getCampoTextual(request, "TIPO")) && isEmpty(getCampoTextual(request, "TIPO_EXC"))) {
			TIPO = "";
		} else if (!isEmpty(getCampoTextual(request, "TIPO_EXC"))) {
			TIPO = getCampoTextual(request, "TIPO_EXC");
		} else {
			TIPO = getCampoTextual(request, "TIPO");
		}

		formdata.put("TIPO", TIPO);

		try {
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal IDOBS = getCampoNumerico(request, "IDOBS");
			if (CCOMPANI != null) {
				PAC_IAX_REA pac_IAX_REA = new PAC_IAX_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_IAX_REA.ejecutaPAC_IAX_REA__F_GET_COMPANI_DOCS(CCOMPANI);
				logger.debug(map);
				List DOCUMENTOS = (List) tratarRETURNyMENSAJES(request, map);
//                if(DOCUMENTOS==null)
				DOCUMENTOS = new ArrayList();
				formdata.put("axisgedox", DOCUMENTOS);
				formdata.put("CCOMPANI", CCOMPANI);
			} else if (IDOBS != null) {
				PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_DOCGSFAVCLIS(IDOBS);
				logger.debug(map);
				List DOCUMENTOS = (List) tratarRETURNyMENSAJES(request, map);
				if (DOCUMENTOS == null)
					DOCUMENTOS = new ArrayList();
				formdata.put("axisgedox", DOCUMENTOS);
				formdata.put("IDOBS", IDOBS);
			} else {
				BigDecimal SSEGURO = getCampoNumerico(request, "SEGURO");

				if (isEmpty(SSEGURO))
					SSEGURO = getCampoNumerico(request, "SSEGURO");

				BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");

				formdata.put("SSEGURO", SSEGURO);
				formdata.put("NMOVIMI", NMOVIMI);

				PAC_IAX_GEDOX pac_axis_gedox = new PAC_IAX_GEDOX(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map;
				if (TIPO.compareTo("EXC") == 0) {
					map = pac_axis_gedox.ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV_EXC(SSEGURO, NMOVIMI);

				} else {
					map = pac_axis_gedox.ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV(SSEGURO, NMOVIMI);
				}

				logger.debug(map);

				List RETURN = (List) tratarRETURNyMENSAJES(request, map);

				// Poner iconos
				if (!isEmpty(RETURN)) {
					for (int i = 0; i < RETURN.size(); i++) {
						String FICHERO = (String) ((Map) RETURN.get(i)).get("FICHERO");

						if (isEmpty(FICHERO))
							continue;

						String ICONO = getIcono(request, FICHERO);
						((Map) RETURN.get(i)).put("ICONO", ICONO);

					}
				}
				formdata.put("axisgedox", RETURN);

				Map mapreq = pac_axis_gedox.ejecutaPAC_IAX_GEDOX__F_GET_DOCUMMOV_REQUERIDA(SSEGURO, NMOVIMI);
				logger.debug(mapreq);

				List RETURNreq = (List) tratarRETURNyMENSAJES(request, mapreq);

				// Poner iconos
				if (!isEmpty(RETURNreq)) {
					for (int i = 0; i < RETURNreq.size(); i++) {
						String FICHERO = (String) ((Map) RETURNreq.get(i)).get("FICHERO");

						if (isEmpty(FICHERO))
							continue;

						String ICONO = getIcono(request, FICHERO);
						((Map) RETURNreq.get(i)).put("ICONO", ICONO);

					}
				}
				formdata.put("axisgedoxreq", RETURNreq);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio AxisgedoxService - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza el tunneling de un fichero, es decir, dado un IDDOC para un documento
	 * existente, obtiene su path, lo lee y lo env�a como un stream al navegador web
	 * v�a Response.
	 * 
	 * @param request
	 * @param thisAction
	 * @param response
	 */
	public void m_tunnel(HttpServletRequest request, AxisgedoxAction thisAction, HttpServletResponse response) {
		logger.debug("AxisgedoxService m_tunnel");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String SO = ConfigCache.getConfig().getProperty("SOSERVER", "WINDOWS");

		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		try {
			String fileMime = null;
			BigDecimal IDDOC = getCampoNumerico(request, "IDDOC");
			String FICHERO = getCampoTextual(request, "FICHERO");
			PAC_IAX_IMPRESION pac_axis_impresion = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_impresion.ejecutaPAC_IAX_IMPRESION__F_GEDOX_VERDOC(IDDOC);
			logger.debug(map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			String OPTPATH = (String) map.get("OPTPATH");

			if (SO.equals("UNIX")) {
				OPTPATH = OPTPATH.replace("\\", "/");
			}

			if (new BigDecimal(0).equals(RETURN) && !isEmpty(OPTPATH)) {
				logger.debug("Path del fichero: " + OPTPATH);

				// Instanciar un objeto File en funci�n de lo devuelto en OPTPATH
				File f = new File(OPTPATH);

				if (f == null) {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
					return;
				}
				if (!f.exists()) {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
					return;
				}
				if (!f.canRead()) {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
							Constantes.MENSAJE_ERROR);
					return;
				}

				// Si estamos aqu�, podemos tratar f
				bis = new BufferedInputStream(new FileInputStream(f));
				int bytesA = bis.available();
				response.setContentLength(bytesA);

				// Establecer tipo de Contenido Mime para la Response
				if (fileMime == null)
					fileMime = AxisgedoxService.detectMime(f.getName());
				response.setContentType(fileMime);
				logger.debug(fileMime + ", " + f.getName());
				response.setHeader("Content-Disposition", "attachment; filename=\"" + (f.getName()) + "\"");
				byte[] attachment = new byte[bytesA];

				PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				if (!isEmpty(FICHERO))
					OPTPATH = FICHERO;

				pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisgedox", OPTPATH, IDDOC, null);
				// Lectura del fichero y env�o como stream de Response
				sos = response.getOutputStream();
				while (true) {
					int bytesRead = bis.read(attachment, 0, attachment.length);
					if (bytesRead < 0)
						break;
					sos.write(attachment, 0, bytesRead);
				}
			} else
				AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
						Constantes.MENSAJE_ERROR);

		} catch (Exception e) {
			logger.error("Error en el servicio AxisgedoxService - m�todo m_tunnel", e);
			thisAction.guardarMensaje(request, "1000053", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Cerrar los recursos en el finally suele ser una buena pr�ctica
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
			} catch (IOException ioe) {
				logger.error("Error en el servicio AxisgedoxService - m�todo m_tunnel. Al limpiar recursos de IO.",
						ioe);
				thisAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	/**
	 * Devuelve, para un FICHERO, su nombre de extensi�n (por ej, pdf) siempre que
	 * exista en el servidor un fichero de imagen con el mismo nombre que la
	 * extensi�n.
	 * 
	 * @param request
	 * @param FICHERO
	 * @return
	 * @throws Exception
	 */
	private String getIcono(HttpServletRequest request, String FICHERO) throws Exception {
		if (!isEmpty(FICHERO)) {
			// Cargar en sesi�n el icono que representa el tipo de archivo
			String extension = AxisgedoxService.getExtension(FICHERO);
			if (!isEmpty(extension)) {
				// Es una l�stima pero esto no funciona en Tomcat...lo hago con el REALPATH
				// Obtenemos la URL del fichero de icono
				// java.net.URL url =
				// request.getSession().getServletContext().getResource("/images/filetypes/" +
				// extension + ".jpg");
				// Si existe la URL, instanciamos un objeto File que apunte al fichero
				// if (url != null && !isEmpty(url.getFile())) {
				String filePath = Constantes.REALPATH + "/images/filetypes/" + extension + ".jpg";
				File iconFile = new File(filePath);
				// Si el fichero para esta extensi�n existe, guardamos su nombre en sesi�n.
				if (iconFile.exists() && iconFile.canRead())
					return extension;
			}
		}
		return null;
	}

	/**
	 * Detecta y devuelve el tipo MIME de un fichero en funci�n de su extensi�n.
	 * 
	 * @param fileNameAndPath
	 * @return
	 */
	public static String detectMime(String fileNameAndPath) {
		String retVal = extensionMime.getProperty("(DEFAULT)");

		retVal = extensionMime.getProperty(AxisgedoxService.getExtension(fileNameAndPath), retVal);
		return retVal;
	}

	/**
	 * Recupera y devuelve la extensi�n de un fichero sin el punto. Ex: xls, pdf,
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

}
