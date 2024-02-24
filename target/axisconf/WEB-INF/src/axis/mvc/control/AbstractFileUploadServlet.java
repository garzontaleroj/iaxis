package axis.mvc.control;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Traductor;

public abstract class AbstractFileUploadServlet extends HttpServlet {
	Log logger = LogFactory.getLog(this.getClass());
	private File uploadedFile = null;
	private String sourceFilePath = null;
	private String destinationFilePath = null;

	private Locale locale = null;
	private String uploadFileError = null;

	public AbstractFileUploadServlet() {
	}

	protected void setUploadedFile(File uploadedFile) {
		this.uploadedFile = uploadedFile;
	}

	protected File getUploadedFile() {
		return uploadedFile;
	}

	protected void setSourceFilePath(String sourceFilePath) {
		this.sourceFilePath = sourceFilePath;
	}

	/**
	 * M�todo que comprueba que existe el fichero de origen
	 * 
	 * @param sourceFilePath
	 * @return
	 */
	protected boolean isEmptySourceFilePath(String sourceFilePath) {
		boolean isEmpty = false;
		if (AxisBaseService.isEmpty(sourceFilePath))
			isEmpty = true;
		return isEmpty;
	}

	protected String getSourceFilePath() {
		return sourceFilePath;
	}

	public void setDestinationFilePath(String destinationFilePath) {
		this.destinationFilePath = destinationFilePath;
	}

	/**
	 * M�todo que comprueba que existe el fichero de destino
	 * 
	 * @param destinationFilePath
	 * @return
	 */
	public boolean isEmptyDestinationFilePath(String destinationFilePath) {
		boolean isEmpty = false;
		if (AxisBaseService.isEmpty(destinationFilePath))
			isEmpty = true;
		return isEmpty;
	}

	public String getDestinationFilePath() {
		return destinationFilePath;
	}

	protected void setLocale(Locale locale) {
		this.locale = locale;
	}

	protected Locale getLocale() {
		return locale;
	}

	/**
	 * M�todo que traduce literales de error.
	 * 
	 * @param uploadFileError Puede contener mas de un mensaje
	 */
	protected void setUploadFileError(String uploadFileError) {
		try {
			this.uploadFileError = Traductor.traducir(getLocale().toString(), uploadFileError);
		} catch (Exception e) {
			this.uploadFileError = uploadFileError;
		}
	}

	/**
	 * M�todo que formatea mensajes de error. El formato ser�: MSG1: MSG2, MSG3,
	 * .....MSGULT.
	 * 
	 * @return
	 */
	protected String getUploadFileError() {
		return this.uploadFileError;
	}

	/**
	 * M�todo que borra la referencia del fichero en servidor una vez este se ha
	 * guardado con �xito. Si el fichero se borra con �xito -> se devuelve true,
	 * sino -> false.
	 * 
	 * @param destinationFilePath
	 * @return
	 */
	protected boolean deleteRemoteFile() {
		boolean isDelete = false;

		// Borrar fichero temporal
		if (!AxisBaseService.isEmpty(uploadedFile) && uploadedFile.exists()) {
			uploadedFile.delete();
			isDelete = true;
		}

		return isDelete;
	}

	/**
	 * M�todo que comprueba que la petici�n hecha al servlet sea desde un form
	 * multipart
	 * 
	 * @param request
	 * @throws Exception
	 */
	protected boolean isFormMultipart(HttpServletRequest request) {
		boolean isMultiPart = true;
		if (!ServletFileUpload.isMultipartContent(request)) {
			isMultiPart = false;
		}

		return isMultiPart;
	}

	/**
	 * Convierte un String de entrada a la codificaci�n UTF-8
	 * 
	 * @param s
	 * @return
	 */
	protected String escaparChars(String s) {
		try {
			byte[] bytes = s.getBytes("ISO-8859-1");
			return new String(bytes, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return s;
		}
	}

	/**
	 * Devuelve el par�metro RETURN de una llamada a una funci�n JDBC y parsea los
	 * MENSAJES si existen.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param map     El Map que retorna la funci�n JDBC.
	 * @return Object - El objeto contenido en RETURN.
	 * @trows IllegalArgumentException - Si alguno de los par�metros est� vac�o.
	 */
	protected Object tratarRETURNyMENSAJES(HttpServletRequest request, Map map) {
		if (request == null)
			throw new IllegalArgumentException("El argumento request no puede ser nulo.");
		if (map == null)
			throw new IllegalArgumentException("El argumento map no puede ser nulo.");

		if (!AxisBaseService.isEmpty(map.get("MENSAJES")))
			AbstractDispatchAction.parsearMensajes(request, (List) map.get("MENSAJES"));

		return map.get("RETURN");
	}

	/*
	 * M�todos abstractos: Depende de como se recuperan (clase mas concreta), PL,
	 * WS, EJB...
	 */

	protected abstract void setAbstractSourceFilePath(Object... obj) throws Exception;

	// Passa a ser concreta del servlet
	protected abstract void getAbstractDestinationFilePath(Object... obj) throws Exception;

	protected abstract List<FileItem> getItems(Object... obj) throws Exception;

	protected abstract Map getAbstractFormScreenFields(Object... obj) throws Exception;

	protected abstract Object uploadFile(Object... obj) throws Exception;

	protected abstract void forwardRedirect(Object... obj) throws Exception;

	protected abstract void doPost(javax.servlet.http.HttpServletRequest request,
			javax.servlet.http.HttpServletResponse response);

	/*
	 * TODO Barra de progreso: Maybe in a future release...
	 *
	 * private ProgressListener crearProgressListener() { //Create a progress
	 * listener ProgressListener progressListener = new ProgressListener(){ public
	 * void update(long pBytesRead, long pContentLength, int pItems) {
	 * System.out.println("We are currently reading item " + pItems); if
	 * (pContentLength == -1) { System.out.println("So far, " + pBytesRead +
	 * " bytes have been read."); } else { System.out.println("So far, " +
	 * pBytesRead + " of " + pContentLength + " bytes have been read."); } } };
	 * 
	 * return progressListener; }
	 */
}
