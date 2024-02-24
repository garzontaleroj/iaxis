//Revision:# mKlsNkQuHfMCd+96zKeyHw== #
//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
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

import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_GEDOX;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AbstractFileUploadServlet;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Servlet que es llamado directamente des de un Form tipo multipart Se encarga
 * de subir el fichero seleccionado en el JSP al servidor. Para que este Servlet
 * funcione, tiene que haber la entrada correspondiente en web.xml.
 */
public class Axiscga003Servlet extends AbstractFileUploadServlet {

	Log logger = LogFactory.getLog(this.getClass());
	private String idDestinationFile = null;

	/**
	 * M�todo que comprueba que existe el fichero de destino
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
	 * M�todo concreto de Axiscga003Servlet. Se encarga de recuperar el path destino
	 * donde se alojar� el fichero.
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
	 * M�todo concreto de Axiscga003Servlet. Se encarga de recuperar el id del
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

		BigDecimal SCONTGAR = null;
		BigDecimal NMOVIMI = null;
		BigDecimal IDDOCGEDOX = null;
		BigDecimal myIDCAT = null;
		java.sql.Date FALTA = null;
		String TDESC = null;
		String TFILENAME = null;
		String TOBSERVA = null;
		java.sql.Date FCADUCA = null;

		for (FileItem item : fileItems) {
			if (item.isFormField()) {
				logger.debug("campo:" + item.getFieldName() + " valor:" + item.getString());

				if ("myIDCAT".equals(item.getFieldName())) {
					try {
						myIDCAT = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("SCONTGAR".equals(item.getFieldName())) {
					try {
						SCONTGAR = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("NMOVIMI".equals(item.getFieldName())) {
					try {
						NMOVIMI = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("myTDESC".equals(item.getFieldName())) {
					TDESC = escaparChars(item.getString());
				} else if ("TFILENAME".equals(item.getFieldName())) {
					// En FF, no se recogen bien los acentos. Por eso, recibimos el nombre
					// de fichero como un campo hidden. Aqu�, lo convertimos a UTF-8 para
					// preservar los acentos
					TFILENAME = escaparChars(item.getString());
				} else if ("IDDOCGEDOX".equals(item.getFieldName())) {
					try {
						IDDOCGEDOX = new BigDecimal(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("OBSERVACIONES".equals(item.getFieldName())) {
					try {
						TOBSERVA = new String(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("FCADUCIDAD".equals(item.getFieldName())) {
					try {
						FCADUCA = AxisBaseService.stringToSqlDate(item.getString());
					} catch (NumberFormatException nfe) {
					}
				} else if ("FALTA".equals(item.getFieldName())) {
					try {
						FALTA = AxisBaseService.stringToSqlDate(item.getString());
					} catch (NumberFormatException nfe) {
					}
				}

			}
		}

		fields.put("TDESC", TDESC);
		fields.put("TFILENAME", TFILENAME);
		fields.put("IDDOCGEDOX", IDDOCGEDOX);
		fields.put("TOBSERVA", TOBSERVA);
		fields.put("FCADUCA", FCADUCA);
		fields.put("SCONTGAR", SCONTGAR);
		fields.put("NMOVIMI", NMOVIMI);
		fields.put("FALTA", FALTA);
		fields.put("myIDCAT", myIDCAT);

		logger.debug("fields:" + fields);
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
	public Boolean uploadFile(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		FileItem item = (FileItem) obj[1];
		UsuarioBean usuario = (UsuarioBean) obj[2];
		logger.debug("obj :" + obj);
		Map formFields = (Map) obj[3];
		logger.debug("formFields :" + formFields);

		boolean isUpload = false;

		BigDecimal SCONTGAR = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SCONTGAR"))) ? (BigDecimal) formFields.get("SCONTGAR")
						: null);
		BigDecimal NMOVIMI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NMOVIMI"))) ? (BigDecimal) formFields.get("NMOVIMI")
						: null);

		BigDecimal myIDCAT = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("myIDCAT"))) ? (BigDecimal) formFields.get("myIDCAT")
						: null);
		java.sql.Date FALTA = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("FALTA"))) ? (java.sql.Date) formFields.get("FALTA") : null);

		BigDecimal SPERSON = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SPERSON"))) ? (BigDecimal) formFields.get("SPERSON")
						: null);
		BigDecimal CAGENTE = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CAGENTE"))) ? (BigDecimal) formFields.get("CAGENTE")
						: null);
		String TDESC = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("TDESC")))
				? (String) formFields.get("TDESC")
				: null);
		BigDecimal IDCAT = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("IDCAT")))
				? (BigDecimal) formFields.get("IDCAT")
				: null);
		String TOBSERVA = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("TOBSERVA"))) ? (String) formFields.get("TOBSERVA") : null);

		java.sql.Date FCADUCA = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("FCADUCA"))) ? (java.sql.Date) formFields.get("FCADUCA")
						: null);
		BigDecimal IDDOCGEDOX = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("IDDOCGEDOX"))) ? (BigDecimal) formFields.get("IDDOCGEDOX")
						: null);

		String TFILENAME = getSourceFilePath();
		String sIDFICHERO = getIdDestinationFile();
		BigDecimal IDFICHERO = ((!AxisBaseService.isEmpty(sIDFICHERO)) ? new BigDecimal(sIDFICHERO) : null);
		String TAMANO = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("TAMANO")))
				? (String) formFields.get("TAMANO")
				: null);

		if (AxisBaseService.isEmpty(IDDOCGEDOX)) {
			// Grabar el fichero con el ID y en el directorio especificados
			File uploadDir = new File(getDestinationFilePath());
			logger.debug("file:" + uploadDir);

			if (!uploadDir.exists())
				uploadDir.mkdir();

			logger.debug("getIdDestinationFile():" + getIdDestinationFile());
			// setUploadedFile(new File(uploadDir, getIdDestinationFile()));
			logger.debug("TFILENAME:" + TFILENAME);
			setUploadedFile(new File(uploadDir, TFILENAME));
			item.write(getUploadedFile());

			logger.debug("desp del write");

			if (!AxisBaseService.isEmpty(getUploadedFile()) && getUploadedFile().exists()) {
				// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
				PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = null;
				map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_DOC(SCONTGAR, NMOVIMI,
						IDDOCGEDOX, myIDCAT, TDESC, TOBSERVA, TFILENAME, FCADUCA, FALTA);

				// BigDecimal.ONE = PORIGEN --> Manual
				logger.debug(map);

				BigDecimal returnUpload = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (BigDecimal.ZERO.equals(returnUpload)) {
					isUpload = true;
					request.setAttribute("isUpload", "ok");
					// PAC_IAX_LOG pacIaxLog =
					// new PAC_IAX_LOG(usuario.getConnection("db01"));
					// pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisgedox", OPTPATH,
					// IDDOC,null);
				}
			} else {
				// Fichero no se ha grabado, algo no ha ido bien
				throw new IOException();
			}
		} else {
			// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_DOC(SCONTGAR, NMOVIMI,
					IDDOCGEDOX, myIDCAT, TDESC, TOBSERVA, TFILENAME, FCADUCA, FALTA);
		}

		return isUpload;
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

		BigDecimal myIDCAT = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("myIDCAT"))) ? (BigDecimal) formFields.get("myIDCAT")
						: null);
		java.sql.Date FALTA = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("FALTA"))) ? (java.sql.Date) formFields.get("FALTA") : null);

		String TOBSERVA = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("TOBSERVA"))) ? (String) formFields.get("TOBSERVA") : null);
		String myTDESC = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("myTDESC")))
				? (String) formFields.get("myTDESC")
				: null);
		BigDecimal SCONTGAR = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SCONTGAR"))) ? (BigDecimal) formFields.get("SCONTGAR")
						: null);
		BigDecimal NMOVIMI = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NMOVIMI"))) ? (BigDecimal) formFields.get("NMOVIMI")
						: null);
		BigDecimal SPERSON = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("SPERSON"))) ? (BigDecimal) formFields.get("SPERSON")
						: null);
		BigDecimal CAGENTE = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("CAGENTE"))) ? (BigDecimal) formFields.get("CAGENTE")
						: null);
		BigDecimal IDDOCGEDOX = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("IDDOCGEDOX"))) ? (BigDecimal) formFields.get("IDDOCGEDOX")
						: null);
		BigDecimal NDOCUME = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("NDOCUME"))) ? (BigDecimal) formFields.get("NDOCUME")
						: null);
		String ORIGEN = ((!AxisBaseService.isEmpty(formFields) && !AxisBaseService.isEmpty(formFields.get("ORIGEN")))
				? (String) formFields.get("ORIGEN")
				: null);
		request.getRequestDispatcher("/modal_axiscga003.do?operation=form&IDDOCGEDOX=" + IDDOCGEDOX + "&NDOCUME="
				+ NDOCUME + "&ORIGEN=" + ORIGEN + "&SCONTGAR=" + SCONTGAR + "&NMOVIMI=" + NMOVIMI + "&TOBSERVA="
				+ TOBSERVA + "&myTDESC=" + myTDESC + "&myIDCAT=" + myIDCAT + "&FALTA=" + FALTA)
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
						"Error de programaci�n: Axiscga003Servlet no ha sido llamado desde un form multipart.");
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
							if (item.getSize() == 0) {
								AbstractDispatchAction.guardarMensaje(request, "verbatim:0 bytes", null,
										Constantes.MENSAJE_INFO);
							}
						}

						break;
					}
				}
			}
		} catch (Throwable error) {
			logger.error("Error en Axiscga003Servlet - m�todo doPost(), proceso: subida de fichero", error);
			AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
					+ error.getClass().getName() + ":</b> " + error.getLocalizedMessage(), null,
					Constantes.MENSAJE_ERROR);
		} finally {
			new axis.daemon.AxisRequestProcessor().extractConnection(request);
			try {
				setUploadFileError("9001144"); // Cargamos el/los mensajes de error si ocurre una excepci�n durante el
												// proceso de borrado de TMP
				// Borrar fichero temporal
				deleteRemoteFile();
				// Redireccionamos a la pantalla destino pas�ndole unos par�metros de entrada.
				setUploadFileError("9001270");

				forwardRedirect(request, response, screenFields);
			} catch (Exception e) {
				logger.error(
						"Error en Axiscga003Servlet - m�todo doPost(), proceso: borrar fichero temporal y redirecci�n de pantalla");
				AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + getUploadFileError()
						+ e.getClass().getName() + ":</b> " + e.getLocalizedMessage(), null, Constantes.MENSAJE_ERROR);
			}

		}

	}
}
