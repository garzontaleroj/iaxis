package axis.service.axis;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
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

import axis.jdbc.PAC_IAX_DEVOLUCIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AbstractFileUploadServlet;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm035fileuploadServlet extends AbstractFileUploadServlet {

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

		PAC_IAX_DEVOLUCIONES pac_iax_devoluciones = new PAC_IAX_DEVOLUCIONES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map1 = pac_iax_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_DIRECTORIO();
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

		String TFILENAME = getSourceFilePath();

		// Grabar el fichero con el ID y en el directorio especificados
		logger.debug("getDestinationFilePath-->" + getDestinationFilePath());
		logger.debug("TFILENAME-->" + TFILENAME);

		File uploadDir = new File(getDestinationFilePath());

		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		setUploadedFile(new File(uploadDir, TFILENAME));
		item.write(getUploadedFile());

		if (!AxisBaseService.isEmpty(getUploadedFile()) && getUploadedFile().exists()) {
			// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
			PAC_IAX_DEVOLUCIONES pac_iax_devoluciones = new PAC_IAX_DEVOLUCIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Map
			// map1=pac_iax_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CARGA_FICHERO(getDestinationFilePath()
			// + File.separator + TFILENAME);
			Map map1 = pac_iax_devoluciones.ejecutaPAC_IAX_DEVOLUCIONES__F_GET_CARGA_FICHERO(TFILENAME);
			logger.debug(map1);

			// BigDecimal.ONE = PORIGEN --> Manual

			BigDecimal returnUpload = (BigDecimal) tratarRETURNyMENSAJES(request, map1);
			request.setAttribute("SDEVOLU", map1.get("PSPROCES"));
			request.setAttribute("P_FICH_OUT", map1.get("P_FICH_OUT"));
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

		logger.debug("spr-->" + request.getAttribute("SDEVOLU"));
		logger.debug("P_FICH_OUT-->" + request.getAttribute("P_FICH_OUT"));
		HashMap APFICHOUT = new HashMap();
		APFICHOUT.put("fichero", request.getAttribute("P_FICH_OUT"));

		ArrayList FICHEROS = new ArrayList();
		FICHEROS.add(APFICHOUT);

		request.getSession().setAttribute("FICHEROS", FICHEROS);

		request.getRequestDispatcher("/axis_axisadm035.do?operation=form&SDEVOLU=" + request.getAttribute("SDEVOLU"))
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
