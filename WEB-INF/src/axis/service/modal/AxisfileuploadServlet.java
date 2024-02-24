package axis.service.modal;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GEDOX;
import axis.jdbc.PAC_IAX_LOG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AbstractFileUploadServlet;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Servlet que es llamado directamente des de un Form tipo multipart desde
 * <code>axisfileupload.jsp</code>. Se encarga de subir el fichero seleccionado
 * en el JSP al servidor.
 * 
 * Para que este Servlet funcione, tiene que haber la entrada correspondiente en
 * web.xml.
 * 
 * @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
 * @see org.apache.commons.fileupload.*;
 * @since Java 5.0
 */
public class AxisfileuploadServlet extends AbstractFileUploadServlet {

	Log logger = LogFactory.getLog(this.getClass());
	private String idDestinationFile = null;

	/**
	 * Método que comprueba que existe el fichero de destino
	 * 
	 * @param destinationFilePath
	 * @return
	 */
	protected boolean isEmptyIdDestinationFile(String idDestinationFile) {
		boolean isEmpty = false;
		if (AxisBaseService.isEmpty(idDestinationFile))
			isEmpty = true;
		return isEmpty;
	}

	protected String getIdDestinationFile() {
		return idDestinationFile;
	}

	protected void setIdDestinationFile(String idDestinationFile) {
		this.idDestinationFile = idDestinationFile;
	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadServlet.
	 * Mètodo que recoge el nombre del fichero que se pretende subir dependiendo del
	 * cliente que lo ejecuta (IE o FF) En IE, el nombre del fichero se recoge de
	 * forma normal, con item.getName().
	 * 
	 * @param obj (0-> sourceFilePath, 1->item)
	 */
	@Override
	public void setAbstractSourceFilePath(Object... obj) throws Exception {
		Map formFields = (Map) obj[0];
		FileItem item = (FileItem) obj[1];

		String TFILENAME = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("TFILENAME"))) ? (String) formFields.get("TFILENAME")
						: null);
		this.setSourceFilePath(AxisBaseService.isEmpty(TFILENAME) ? FilenameUtils.getName(item.getName()) : TFILENAME);
	}

	/**
	 * Método concreto de AxisfileuploadServlet. Se encarga de recuperar el path
	 * destino donde se alojará el fichero.
	 * 
	 * @param obj (0->request, 1->Usuario)
	 * @return
	 * @throws Exception
	 */
	public void getAbstractDestinationFilePath(Object... obj) throws Exception {
		setDestinationFilePath(null);

		HttpServletRequest request = (HttpServletRequest) obj[0];
		UsuarioBean usuario = (UsuarioBean) obj[1];

		PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_DIRECTORIO();
		logger.debug(map);

		if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
			setDestinationFilePath((String) map.get("PPATH"));
	}

	/**
	 * Método concreto de AxisfileuploadServlet. Se encarga de recuperar el id del
	 * fichero en servidor.
	 * 
	 * @param obj (0-> request, 1->Usuario)
	 * @return
	 * @throws Exception
	 */
	public void getIdDestinationFile(Object... obj) throws Exception {
		setIdDestinationFile(null);

		HttpServletRequest request = (HttpServletRequest) obj[0];
		UsuarioBean usuario = (UsuarioBean) obj[1];

		PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_IDFICHERO();
		logger.debug(map);

		if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
			BigDecimal IDFICHERO = (BigDecimal) map.get("PID");
			setIdDestinationFile(((!AxisBaseService.isEmpty(IDFICHERO)) ? IDFICHERO.toString() : null));
		}
	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadAction. Se
	 * encarga de recuperar los items guardados en request.
	 * 
	 * @param obj (0->request)
	 * @return
	 * @throws Exception
	 */

	@Override
	public List<FileItem> getItems(Object... obj) throws Exception {
		List<FileItem> items = null;
		HttpServletRequest request = (HttpServletRequest) obj[0];

		// File upload handler
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());

		// Parsear la request
		items = upload.parseRequest(request);

		return items;
	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadServlet. Se
	 * encarga de recuperar los campos normales de pantalla.
	 * 
	 * @param obj (0->List<FileItems>)
	 * @return
	 * @throws Exception
	 */
	@Override
	public Map getAbstractFormScreenFields(Object... obj) throws Exception {
		Map fields = new HashMap();
		List<FileItem> fileItems = (List<FileItem>) obj[0];
		BigDecimal SSEGURO = null;
		BigDecimal NMOVIMI = null;
		BigDecimal CCOMPANI = null;
		BigDecimal IDOBS = null;
		BigDecimal IDCAT = null;
		String TDESC = null;
		String TFILENAME = null;
		BigDecimal NSINIES = null;
		BigDecimal NTRAMIT = null;
		BigDecimal NDOCUME = null;
		String ORIGEN = null;
		String NAVEGADOR = "";
		String TIPO = null;

		for (FileItem item : fileItems) {

			if (item.isFormField()) {
				logger.debug("item.getFieldName()" + item.getFieldName());
				if ("USERAGENT".equals(item.getFieldName())) {
					NAVEGADOR = escaparChars(item.getString());
				}
			}
		}
		for (FileItem item : fileItems) {

			if (item.isFormField()) {
				logger.debug("item.getFieldName()" + item.getFieldName());
				if ("SSEGURO".equals(item.getFieldName())) {
					try {
						SSEGURO = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("NMOVIMI".equals(item.getFieldName())) {
					try {
						NMOVIMI = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				}
				if ("CCOMPANI".equals(item.getFieldName())) {
					try {
						CCOMPANI = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				}
				if ("IDOBS".equals(item.getFieldName())) {
					try {
						IDOBS = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				}

				else if ("IDCAT".equals(item.getFieldName())) {
					try {
						IDCAT = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("TDESC".equals(item.getFieldName())) {
					logger.debug("NAVEGADOR : " + NAVEGADOR);
					// userAgent.indexOf("Firefox") > 0
					if (NAVEGADOR.indexOf("MSIE") > 0)
						TDESC = item.getString();
					else
						TDESC = escaparChars(item.getString());
				} else if ("TFILENAME".equals(item.getFieldName())) {
					// En FF, no se recogen bien los acentos. Por eso, recibimos el nombre
					// de fichero como un campo hidden. Aquí, lo convertimos a UTF-8 para
					// preservar los acentos
					logger.debug("NAVEGADOR : " + NAVEGADOR);
					// userAgent.indexOf("Firefox") > 0
					if (NAVEGADOR.indexOf("MSIE") > 0)
						TFILENAME = item.getString();
					else
						TFILENAME = escaparChars(item.getString());

				} else if ("NSINIES".equals(item.getFieldName())) {
					try {
						NSINIES = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("NTRAMIT".equals(item.getFieldName())) {
					try {
						NTRAMIT = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("NDOCUME".equals(item.getFieldName())) {
					try {
						NDOCUME = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("ORIGEN".equals(item.getFieldName())) {
					// En FF, no se recogen bien los acentos. Por eso, recibimos el nombre
					// de fichero como un campo hidden. Aquí, lo convertimos a UTF-8 para
					// preservar los acentos
					ORIGEN = escaparChars(item.getString());
				} else if ("TIPO".equals(item.getFieldName())) {
					TIPO = escaparChars(item.getString());
				}
			}
		}

		fields.put("SSEGURO", SSEGURO);
		fields.put("NMOVIMI", NMOVIMI);
		fields.put("CCOMPANI", CCOMPANI);
		fields.put("IDOBS", IDOBS);
		fields.put("IDCAT", IDCAT);
		fields.put("TDESC", TDESC);
		fields.put("TFILENAME", TFILENAME);
		fields.put("NSINIES", NSINIES);
		fields.put("NTRAMIT", NTRAMIT);
		fields.put("NDOCUME", NDOCUME);
		fields.put("ORIGEN", ORIGEN);
		fields.put("TIPO", TIPO);

		return fields;
	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadServlet. Se
	 * encarga de recuperar los items guardados en formdata.
	 * 
	 * @param obj (0->request, 1-> FileItem, 2->usuario, 3->Map formFields)
	 * @return
	 * @throws Exception
	 */
	@Override
	public Boolean uploadFile(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		FileItem item = (FileItem) obj[1];
		UsuarioBean usuario = (UsuarioBean) obj[2];
		Map formFields = (Map) obj[3];

		boolean isUpload = false;

		BigDecimal SSEGURO = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SSEGURO"))) ? (BigDecimal) formFields.get("SSEGURO")
						: null);
		BigDecimal NMOVIMI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NMOVIMI"))) ? (BigDecimal) formFields.get("NMOVIMI")
						: null);
		BigDecimal CCOMPANI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CCOMPANI"))) ? (BigDecimal) formFields.get("CCOMPANI")
						: null);
		BigDecimal IDOBS = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("IDOBS")))
				? (BigDecimal) formFields.get("IDOBS")
				: null);
		String TDESC = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("TDESC")))
				? (String) formFields.get("TDESC")
				: null);
		BigDecimal IDCAT = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("IDCAT")))
				? (BigDecimal) formFields.get("IDCAT")
				: null);
		BigDecimal NSINIES = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NSINIES"))) ? (BigDecimal) formFields.get("NSINIES")
						: null);
		BigDecimal NTRAMIT = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NTRAMIT"))) ? (BigDecimal) formFields.get("NTRAMIT")
						: null);
		BigDecimal NDOCUME = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NDOCUME"))) ? (BigDecimal) formFields.get("NDOCUME")
						: null);
		String ORIGEN = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("ORIGEN")))
				? (String) formFields.get("ORIGEN")
				: null);
		String TIPO = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("TIPO")))
				? (String) formFields.get("TIPO")
				: "NO EXC");

		if (TIPO.compareTo("EXC") == 0) {
			TDESC = "EXC-" + TDESC;
		}

		String TFILENAME = getSourceFilePath();
		String sIDFICHERO = getIdDestinationFile();
		BigDecimal IDFICHERO = ((!AxisBaseService.isEmpty(sIDFICHERO)) ? new BigDecimal(sIDFICHERO) : null);
		BigDecimal IDFICHERO2 = new BigDecimal(0);

		// Grabar el fichero con el ID y en el directorio especificados

		String uploadFilePath = getDestinationFilePath();

		File uploadFolder = new File(uploadFilePath);
		if (!uploadFolder.exists()) {
			uploadFolder.mkdirs();
			// logger.debug("Archivo: " );
		}

		item.write(new File(uploadFilePath + File.separator + TFILENAME));
		logger.debug("Archivo Cargado: " + uploadFolder.getAbsolutePath() + File.separator + TFILENAME);

		if (!AxisBaseService.isEmpty(uploadFolder) && uploadFolder.exists()) {
			// Si todo ha ido bien, informamos a GEDOX de la grabación correcta del fichero
			File uploadDir = new File(getDestinationFilePath());
			if (!uploadDir.exists())
				uploadDir.mkdir();

			setUploadedFile(new File(uploadDir, TFILENAME));
			item.write(getUploadedFile());

			if (!AxisBaseService.isEmpty(getUploadedFile()) && getUploadedFile().exists()) {
				// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
				PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = null;
				if (!AxisBaseService.isEmpty(ORIGEN) && ORIGEN.equals("SINIESTROS")) {
					map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_SET_DOCUMSINISTRESGEDOX(NSINIES, NTRAMIT, NDOCUME,
							TFILENAME, IDFICHERO, TDESC, IDCAT, ORIGEN);
					if (((BigDecimal) map.get("RETURN")).intValue() == 0)
						request.setAttribute("isUpload", "ok");
				} else if (!AxisBaseService.isEmpty(ORIGEN) && ORIGEN.equals("GENERICO")) {
					map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_SET_DOCUMGEDOX(usuario.getUsuario(), TFILENAME,
							IDFICHERO, TDESC, IDCAT);
					request.setAttribute("IDFICHERO", map.get("PIDDOCGEDOX"));
					request.getSession().setAttribute("IDFICHERO", map.get("PIDDOCGEDOX"));
				} else {
					if (SSEGURO != null && NMOVIMI != null) {
						map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_SET_DOCUMMOVSEGGEDOX(SSEGURO, NMOVIMI, TFILENAME,
								IDFICHERO, TDESC, IDCAT, BigDecimal.ONE);
					}
					if (CCOMPANI != null) {
						map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_SET_DOCUMMOVCOMPANIGEDOX(CCOMPANI, TFILENAME,
								"" + IDFICHERO, TDESC, IDCAT);
					}
					if (IDOBS != null) {
						map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_SET_GCA_DOCGSFAVCLIS(IDOBS, TFILENAME,
								"" + IDFICHERO, TDESC, IDCAT);
					}

				}
				// BigDecimal.ONE = PORIGEN --> Manual
				logger.debug(map);

				BigDecimal returnUpload = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (BigDecimal.ZERO.equals(returnUpload)) {
					isUpload = true;
					request.setAttribute("isUpload", "ok");
					PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					// pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisgedox", OPTPATH,
					// IDDOC,null);
				}
			} else {
				// Fichero no se ha grabado, algo no ha ido bien
				throw new IOException();
			}
		}
		return isUpload;

	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadServlet. Se
	 * encarga de la redirección una vez se ha tratado el servlet
	 * 
	 * @param obj (0->request, 2->response, 3->Map formFields)
	 * @throws Exception
	 */
	@Override
	public void forwardRedirect(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		HttpServletResponse response = (HttpServletResponse) obj[1];
		Map formFields = (Map) obj[2];

		BigDecimal SSEGURO = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SSEGURO"))) ? (BigDecimal) formFields.get("SSEGURO")
						: null);
		BigDecimal NMOVIMI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NMOVIMI"))) ? (BigDecimal) formFields.get("NMOVIMI")
						: null);
		BigDecimal CCOMPANI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CCOMPANI"))) ? (BigDecimal) formFields.get("CCOMPANI")
						: null);
		BigDecimal IDOBS = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("IDOBS")))
				? (BigDecimal) formFields.get("IDOBS")
				: null);
		BigDecimal NSINIES = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NSINIES"))) ? (BigDecimal) formFields.get("NSINIES")
						: null);
		BigDecimal NTRAMIT = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NTRAMIT"))) ? (BigDecimal) formFields.get("NTRAMIT")
						: null);
		BigDecimal NDOCUME = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NDOCUME"))) ? (BigDecimal) formFields.get("NDOCUME")
						: null);
		String ORIGEN = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("ORIGEN")))
				? (String) formFields.get("ORIGEN")
				: null);
		String TIPO = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("TIPO")))
				? (String) formFields.get("TIPO")
				: "NO EXC");
		request.getRequestDispatcher("/modal_axisfileupload.do?operation=form&SSEGURO=" + SSEGURO + "&NMOVIMI="
				+ NMOVIMI + "&CCOMPANI=" + CCOMPANI + "&NSINIES=" + NSINIES + "&NTRAMIT=" + NTRAMIT + "&NDOCUME="
				+ NDOCUME + "&ORIGEN=" + ORIGEN + "&TIPO=" + TIPO).forward(request, response);
	}

	/**
	 * Método que sobreescibe el método abstracto de AbstractFileUploadServlet.
	 * Método que realiza el análisis de una request POST para un form multipart
	 * 
	 * @param request
	 * @param response
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		Map screenFields = new HashMap();

		request.setAttribute(Constantes.MENSAJES, new HashMap());
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		setLocale(AxisBaseService.getLocale(request));
		setUploadFileError("1000610"); // Cargamos el/los mensajes de error si ocurre una excepción durante el proceso
										// de subida del fichero

		try {
			new axis.daemon.AxisRequestProcessor().injectConnection(request);
			// 1-Tratamos si un formulario es multipart
			if (!isFormMultipart(request)) {
				throw new Exception(
						"Error de programación: AxisfileuploadServlet no ha sido llamado desde un form multipart.");
			} else {

				// Recuperamos los campos de la pantalla que realiza la request.
				List<FileItem> fileItems = getItems(request);

				// Cargar los campos que nos interesan en el servlet para tratarlos (menos el
				// fichero)
				screenFields = getAbstractFormScreenFields(fileItems);

				// Tratamos el campo de la request de tipo fichero para subirlo.
				for (FileItem item : fileItems) {
					if (!item.isFormField()) {
						// Cargamos el path origen del fichero según agente (FF o IE)
						setAbstractSourceFilePath(screenFields, item);
						// Si existe fichero local
						if (item.getSize() > 0 && !isEmptySourceFilePath(this.getSourceFilePath())) {
							// Recuperar el path de destino del fichero
							getAbstractDestinationFilePath(request, usuario);

							// Recuperar el id del fichero
							getIdDestinationFile(request, usuario);

							// Si tenemos el path destino y el id del archivo, hacemos upload
							if (!AxisBaseService.isEmpty(getDestinationFilePath())
									&& !AxisBaseService.isEmpty(getIdDestinationFile())) {
								if (uploadFile(request, item, usuario, screenFields)) {
									// Respuesta OK
									AbstractDispatchAction.guardarMensaje(request, "1000611", null,
											Constantes.MENSAJE_INFO);
								}
							}
						} else {
							// Fichero no informado o no existe en local
							AbstractDispatchAction.guardarMensaje(request, "1000595", null, Constantes.MENSAJE_INFO);
						}

						break;
					}
				}
			}
			new axis.daemon.AxisRequestProcessor().extractConnection(request);
		} catch (Throwable error) {
			logger.error("Error en AxisFileuploadServlet - método doPost(), proceso: subida de fichero", error);
			AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
					+ error.getClass().getName() + ":</b> " + error.getLocalizedMessage(), null,
					Constantes.MENSAJE_ERROR);
		} finally {
			try {
				setUploadFileError("9001144"); // Cargamos el/los mensajes de error si ocurre una excepción durante el
												// proceso de borrado de TMP
				// Borrar fichero temporal
				deleteRemoteFile();
				// Redireccionamos a la pantalla destino pasándole unos parámetros de entrada.
				setUploadFileError("9001270");
				forwardRedirect(request, response, screenFields);
			} catch (Exception e) {
				logger.error(
						"Error en AxisFileuploadServlet - método doPost(), proceso: borrar fichero temporal y redirección de pantalla");
				AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
						+ e.getClass().getName() + ":</b> " + e.getLocalizedMessage(), null, Constantes.MENSAJE_ERROR);
			}

		}

	}
}
