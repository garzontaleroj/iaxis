package axis.service.axis;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
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

import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AbstractFileUploadServlet;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfinv002fileuploadServlet extends AbstractFileUploadServlet {

	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo abstracto de AxisFileUploadServlet. Se encarga de cargar el path
	 * destino recuperado del form.
	 * 
	 * @param obj (0->Map)
	 * @return
	 * @throws Exception
	 */
	@Override
	public void getAbstractDestinationFilePath(Object... obj) throws Exception {
		setDestinationFilePath(null);

		HttpServletRequest request = (HttpServletRequest) obj[0];
		UsuarioBean usuario = (UsuarioBean) obj[1];

		PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map1 = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GET_DIRECTORIO();
		logger.debug(map1);

		if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map1)))
			setDestinationFilePath((String) map1.get("PPATH"));

	}

	/**
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadAction. Se
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
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadServlet.
	 * M�todo que recoge el nombre del fichero que se pretende subir dependiendo del
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
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadServlet. Se
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
		BigDecimal CEMPRES = null;
		BigDecimal CCODFON = null;
		String FVALOR = null;
		String TFILE = null;

		for (FileItem item : fileItems) {
			if (item.isFormField()) {
				if ("CEMPRES_CONSULTA".equals(item.getFieldName())) {
					try {
						CEMPRES = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("FVALOR_CONSULTA".equals(item.getFieldName())) {
					try {
						logger.debug("FVALOR 0: " + item.getString());
						FVALOR = item.getString();
						logger.debug("FVALOR 1: " + FVALOR);
					} catch (Exception nfe) {
					}
				}

				else if ("CCODFON_CONSULTA".equals(item.getFieldName())) {
					try {
						CCODFON = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				}

				else if ("TFILENAME".equals(item.getFieldName())) {
					// En FF, no se recogen bien los acentos. Por eso, recibimos el nombre
					// de fichero como un campo hidden. Aqu�, lo convertimos a UTF-8 para
					// preservar los acentos
					TFILE = escaparChars(item.getString());
				}
			}
		}

		fields.put("TFILENAME", TFILE);
		fields.put("CEMPRES", CEMPRES);
		fields.put("CCODFON", CCODFON);
		fields.put("FVALOR", FVALOR);

		return fields;
	}

	/**
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadServlet. Se
	 * encarga de recuperar los items guardados en formdata.
	 * 
	 * @param obj (0->request, 1-> FileItem, 2->usuario, 3->Map formFields)
	 * @return
	 * @throws Exception
	 */
	@Override
	public BigDecimal uploadFile(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		FileItem item = (FileItem) obj[1];
		UsuarioBean usuario = (UsuarioBean) obj[2];
		Map formFields = (Map) obj[3];

		BigDecimal fileProces = null;

		BigDecimal CEMPRES = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CEMPRES"))) ? (BigDecimal) formFields.get("CEMPRES")
						: null);
		Date FVALOR = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("FVALOR")))
				? AxisBaseService.stringToSqlDate((String) formFields.get("FVALOR"))
				: null);
		String TFILENAME = getSourceFilePath();

		// Grabar el fichero con el ID y en el directorio especificados
		File uploadDir = new File(getDestinationFilePath());

		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		setUploadedFile(new File(uploadDir, TFILENAME));
		item.write(getUploadedFile());

		if (!AxisBaseService.isEmpty(getUploadedFile()) && getUploadedFile().exists()) {
			// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
			PAC_IAX_OPERATIVA_FINV pac_iax_operativa_finv = new PAC_IAX_OPERATIVA_FINV(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (AxisBaseService.isEmpty(FVALOR))
				FVALOR = (java.sql.Date) request.getSession().getAttribute("FVALOR_CONSULTA");

			Map map = pac_iax_operativa_finv.ejecutaPAC_IAX_OPERATIVA_FINV__F_GRABAROPERACIONFILEFINV(
					getDestinationFilePath() + File.separator + TFILENAME, CEMPRES, FVALOR);
			// BigDecimal.ONE = PORIGEN --> Manual
			logger.debug(map);

			BigDecimal returnUpload = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (BigDecimal.ZERO.equals(returnUpload))
				fileProces = returnUpload;
			else
				fileProces = BigDecimal.ONE;

		} else {
			// Fichero no se ha grabado, algo no ha ido bien
			throw new IOException();
		}

		return fileProces;
	}

	/**
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadServlet. Se
	 * encarga de la redirecci�n una vez se ha tratado el servlet
	 * 
	 * @param obj (0->request, 2->response, 3->Map formFields)
	 * @throws Exception
	 */
	@Override
	public void forwardRedirect(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		HttpServletResponse response = (HttpServletResponse) obj[1];
		Map formFields = (Map) obj[2];

		BigDecimal CEMPRES = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CEMPRES"))) ? (BigDecimal) formFields.get("CEMPRES")
						: null);
		BigDecimal CCODFON = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CCODFON"))) ? (BigDecimal) formFields.get("CCODFON")
						: null);
		String FVALOR = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("FVALOR")))
				? (String) formFields.get("FVALOR")
				: null);
		// Date
		// FVALOR=((!AxisBaseService.isEmpty(formFields)&&!AxisBaseService.isEmpty(formFields.get("FVALOR")))?
		// AxisBaseService.stringToSqlDate((String)formFields.get("FVALOR")) :null);
		if (AxisBaseService.isEmpty(FVALOR))
			FVALOR = String.valueOf(request.getSession().getAttribute("FVALOR_CONSULTA"));
		logger.debug("FVALOR: " + FVALOR);

		request.getRequestDispatcher(
				"/axis_axisfinv002.do?operation=form&CCODFON=" + CCODFON + "&CEMPRES=" + CEMPRES + "&FVALOR=" + FVALOR)
				.forward(request, response);

	}

	/**
	 * M�todo que sobreescibe el m�todo abstracto de AbstractFileUploadServlet.
	 * M�todo que realiza el an�lisis de una request POST para un form multipart
	 * 
	 * @param request
	 * @param response
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		BigDecimal fileProces = null;
		Map screenFields = new HashMap();

		request.setAttribute(Constantes.MENSAJES, new HashMap());
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		setLocale(AxisBaseService.getLocale(request));
		setUploadFileError("1000610"); // Cargamos el/los mensajes de error si ocurre una excepci�n durante el proceso
										// de subida del fichero

		try {
			new axis.daemon.AxisRequestProcessor().injectConnection(request);
			// 1-Tratamos si un formulario es multipart
			if (!isFormMultipart(request)) {
				throw new Exception(
						"Error de programaci�n: Axisadm022fileuploadServlet no ha sido llamado desde un form multipart.");
			} else {
				// Recuperamos los campos de la pantalla que realiza la request.
				List<FileItem> fileItems = getItems(request);

				// Cargar los campos que nos interesan en el servlet para tratarlos (menos el
				// fichero)
				screenFields = getAbstractFormScreenFields(fileItems);

				// Tratamos el campo de la request de tipo fichero para subirlo.
				for (FileItem item : fileItems) {
					if (!item.isFormField()) {
						// Cargamos el path origen del fichero seg�n agente (FF o IE)
						setAbstractSourceFilePath(screenFields, item);

						// Si existe fichero local
						if (item.getSize() > 0 && !isEmptySourceFilePath(this.getSourceFilePath())) {
							// Recuperar el path de destino del fichero
							getAbstractDestinationFilePath(request, usuario);

							// Si tenemos el path destino, hacemos upload
							if (!AxisBaseService.isEmpty(getDestinationFilePath())) {
								fileProces = uploadFile(request, item, usuario, screenFields);
								if (BigDecimal.ZERO.equals(fileProces)) {
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
			logger.error("Error en AxisFileuploadServlet - m�todo doPost(), proceso: subida de fichero", error);
			AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
					+ error.getClass().getName() + ":</b> " + error.getLocalizedMessage(), null,
					Constantes.MENSAJE_ERROR);
		} finally {
			try {
				setUploadFileError("9001144"); // Cargamos el/los mensajes de error si ocurre una excepci�n durante el
												// proceso de borrado de TMP
				// Borrar fichero temporal
				// BUG 9716 : El fichero se sube correctamente al directorio remoto, pero luego
				// el deleteRemoteFile que viene a continuacion lo borra.
				// deleteRemoteFile();

				// Redireccionamos a la pantalla destino pas�ndole unos par�metros de entrada.
				setUploadFileError("9001270");
				forwardRedirect(request, response, screenFields);

			} catch (Exception e) {
				logger.error(
						"Error en AxisFileuploadServlet - m�todo doPost(), proceso: borrar fichero temporal y redireccion a pantalla destino.");
				AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
						+ e.getClass().getName() + ":</b> " + e.getLocalizedMessage(), null, Constantes.MENSAJE_ERROR);
			}
		}

	}
}
