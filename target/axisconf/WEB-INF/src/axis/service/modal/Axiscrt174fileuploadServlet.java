//Revision:# yQ12R9UM2M8snITyXwaGQg== #
package axis.service.modal;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
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

import axis.jdbc.PAC_IAX_DOCREQUERIDA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AbstractFileUploadServlet;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscrt174fileuploadServlet extends AbstractFileUploadServlet {

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

		PAC_IAX_DOCREQUERIDA pac_iax_devoluciones = new PAC_IAX_DOCREQUERIDA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map1 = pac_iax_devoluciones.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DIRECTORIO();
		logger.debug("ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DIRECTORIO" + map1);

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
		String PTDESCRIP = null;
		String NAVEGADOR = "";

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
				logger.debug("campo:" + item.getFieldName() + " valor:" + item.getString());

				if ("TDESCRIP".equals(item.getFieldName())) {
					// TDESC=new String(item.getString());

					logger.debug("NAVEGADOR : " + NAVEGADOR);
					// userAgent.indexOf("Firefox") > 0
					if (NAVEGADOR.indexOf("MSIE") > 0)
						PTDESCRIP = item.getString();
					else
						PTDESCRIP = escaparChars(item.getString());

				}

			}
		}

		fields.put("TDESCRIP", PTDESCRIP);
		//
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
	public BigDecimal uploadFile(Object... obj) throws Exception {
		HttpServletRequest request = (HttpServletRequest) obj[0];
		FileItem item = (FileItem) obj[1];
		UsuarioBean usuario = (UsuarioBean) obj[2];
		Map formFields = (Map) obj[3];
		BigDecimal pPCDOCUME = !AxisBaseService.isEmpty(request.getParameter("CDOCUME"))
				? new BigDecimal(request.getParameter("CDOCUME").toString())
				: null;
		BigDecimal pPCCLASE = !AxisBaseService.isEmpty(request.getParameter("CCLASE"))
				? new BigDecimal(request.getParameter("CCLASE").toString())
				: null;
		BigDecimal pSPERSON = !AxisBaseService.isEmpty(request.getParameter("SPERSON"))
				? new BigDecimal(request.getParameter("SPERSON").toString())
				: null;
		BigDecimal pPSEQDOCU = !AxisBaseService.isEmpty(request.getParameter("SEQDOCU"))
				? new BigDecimal(request.getParameter("SEQDOCU").toString())
				: null;
		BigDecimal pPNORDEN = !AxisBaseService.isEmpty(request.getParameter("NORDEN"))
				? new BigDecimal(request.getParameter("NORDEN").toString())
				: null;

		// bug RSC 27/11/2012
		BigDecimal pNRIESGO = !AxisBaseService.isEmpty(request.getParameter("NRIESGO"))
				? new BigDecimal(request.getParameter("NRIESGO").toString())
				: null;
		// Fi bug RSC 27/11/2012

		// String pPTDESCRIP= !
		// AxisBaseService.isEmpty(request.getParameter("TDESCRIP")) ?
		// request.getParameter("TDESCRIP"): null;
		// logger.debug("pPTDESCRIP-->"+pPTDESCRIP);
		// logger.debug("item.getFieldName()"+item.getFieldName());

		String pPTDESCRIP = ((!AxisBaseService.isEmpty(formFields)
				&& !AxisBaseService.isEmpty(formFields.get("TDESCRIP"))) ? (String) formFields.get("TDESCRIP") : null);

		BigDecimal fileProces = null;
		String TFILENAME = getSourceFilePath();

		// Grabar el fichero con el ID y en el directorio especificados
		logger.debug("getDestinationFilePath-->" + getDestinationFilePath());
		if (TFILENAME.indexOf(".") != -1) {
			TFILENAME = TFILENAME.replace(".", "_" + new Date().getTime() + ".");
		} else {
			TFILENAME += "_" + new Date().getTime();
		}

		logger.debug("TFILENAME-->" + TFILENAME);

		File uploadDir = new File(getDestinationFilePath());

		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		setUploadedFile(new File(uploadDir, TFILENAME));
		item.write(getUploadedFile());

		if (!AxisBaseService.isEmpty(getUploadedFile()) && getUploadedFile().exists()) {
			// Si todo ha ido bien, informamos a GEDOX de la grabaci�n correcta del fichero
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// getDestinationFilePath() + File.separator + TFILENAME);
			BigDecimal pPSPRODUC, pPSSEGURO, pPCACTIVI, pPNMOVIMI, pPNRIESGO, pPNINQAVAL, pPCTIPDOC, pPADJUNTADO,
					pCRECIBIDO, pPSPERSON = null, pPCTIPBEN;

			pPSPRODUC = null;
			pPSSEGURO = null;
			pPCACTIVI = null;
			pPNMOVIMI = null;
			pPNRIESGO = null;
			pPNINQAVAL = null;
			pPCTIPDOC = null;
			pPADJUNTADO = null;
			pCRECIBIDO = null;
			pPSPERSON = null;
			pPCTIPBEN = null;

			boolean trobat = false;
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_DOCREQUERIDA pacIaxDocrequerida = new PAC_IAX_DOCREQUERIDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
			logger.debug("DATOS POLIZA: " + m);
			tratarRETURNyMENSAJES(request, m);
			Map datos_poliza = (Map) m.get("RETURN");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			if (SPRODUC == null) {
				m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_PRODUCTO();
				logger.debug(m);
				SPRODUC = (BigDecimal) tratarRETURNyMENSAJES(request, m);
			}

			BigDecimal sseguro = (datos_poliza.get("SSEGURO") != null) ? (BigDecimal) datos_poliza.get("SSEGURO")
					: null;
			BigDecimal pCACTIVI = (datos_poliza.get("CACTIVI") != null) ? (BigDecimal) datos_poliza.get("CACTIVI")
					: null;
			// BigDecimal pNMOVIMI= (datos_poliza.get("NMOVIMI") != null) ?
			// (BigDecimal)datos_poliza.get("NMOVIMI") : new BigDecimal(1);
			BigDecimal pNMOVIMI = null;

			String DOCREQUERIDA_SEG = (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG") != null
					? (String) AbstractDispatchAction.topPila(request, "DOCREQUERIDA_SEG")
					: null;

			// Recuperem les dades
			Map mdocrequi;
			if (!AxisBaseService.isEmpty(DOCREQUERIDA_SEG)) {
				mdocrequi = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GET_DOCUREQUERIDA(sseguro,
						new BigDecimal(1));
			} else {
				mdocrequi = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDOCREQUERIDA(SPRODUC, sseguro, pCACTIVI,
						pNMOVIMI);
			}
			if (mdocrequi.get("RETURN") != null) {
				List documents = (List) tratarRETURNyMENSAJES(request, mdocrequi);
				if (documents.size() > 0) {
					for (int i = 0; documents.size() > i; i++) {
						if (documents.get(i) != null) {
							if (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA") != null) {
								if (((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
										.get("CDOCUME") != null) {
									if ((pPSEQDOCU != null) && (pPSEQDOCU.equals(
											((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
													.get("SEQDOCU")))) {
										trobat = true;
									} else if (pPCDOCUME.equals(
											((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
													.get("CDOCUME"))) {
										if (pPCCLASE.equals(
												((HashMap) (((HashMap) (documents.get(i))).get("OB_IAX_DOCREQUERIDA")))
														.get("CCLASE"))) {
											logger.debug("BuixapPNORDEN:" + pPNORDEN);
											if (pPNORDEN.equals(((HashMap) (((HashMap) (documents.get(i)))
													.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN"))) {
												// bug RSC 27/11/2012
												if (pNRIESGO != null) {
													if (pNRIESGO.equals(((HashMap) (((HashMap) (documents.get(i)))
															.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO"))) {
														if (pSPERSON != null) {
															if (pSPERSON
																	.equals(((HashMap) (((HashMap) (documents.get(i)))
																			.get("OB_IAX_DOCREQUERIDA")))
																			.get("SPERSON"))) {
																trobat = true;
															}
														} else {
															trobat = true;
														}
													}
												} else {
													trobat = true;
												}
											}
										}
									}
									if (trobat) {
										trobat = false;
										pPADJUNTADO = new BigDecimal(1);
										pPNRIESGO = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NRIESGO")
														: null;
										pPNINQAVAL = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NINQAVAL") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NINQAVAL")
														: null;
										pPCDOCUME = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CDOCUME") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CDOCUME")
														: null;
										pPCTIPDOC = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CTIPDOC") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CTIPDOC")
														: null;
										pPCCLASE = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CCLASE") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CCLASE")
														: null;
										pPNORDEN = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("NORDEN")
														: null;
										pPSEQDOCU = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("SEQDOCU") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("SEQDOCU")
														: null;
										pPSPERSON = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("SPERSON") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("SPERSON")
														: null;
										pPCTIPBEN = ((HashMap) (((HashMap) (documents.get(i)))
												.get("OB_IAX_DOCREQUERIDA"))).get("CTIPBEN") != null
														? (BigDecimal) ((HashMap) (((HashMap) (documents.get(i)))
																.get("OB_IAX_DOCREQUERIDA"))).get("CTIPBEN")
														: null;
										i = documents.size();
									}
								}
							}
						}
					}
				}
			}
			Map mgrabar;
			if (!AxisBaseService.isEmpty(DOCREQUERIDA_SEG))
				mgrabar = pacIaxDocrequerida.ejecutaPAC_IAX_DOCREQUERIDA__F_GRABARDOCREQUERIDAPOL(pPSEQDOCU, SPRODUC,
						sseguro, pCACTIVI, new BigDecimal(1), pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE,
						pPNORDEN, pPTDESCRIP, TFILENAME, pPADJUNTADO, pCRECIBIDO);
			else
				mgrabar = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA(null, SPRODUC, sseguro,
						pCACTIVI, pNMOVIMI, pPNRIESGO, pPNINQAVAL, pPCDOCUME, pPCTIPDOC, pPCCLASE, pPNORDEN, pPTDESCRIP,
						TFILENAME, pPADJUNTADO, pPSPERSON, pPCTIPBEN);

			logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GRABARDOCREQUERIDA: " + mgrabar);
			BigDecimal returnUpload = (BigDecimal) tratarRETURNyMENSAJES(request, mgrabar);
			// request.setAttribute("SDEVOLU",map1.get("PSPROCES"));
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

		request.getRequestDispatcher("/modal_axisctr174.do?operation=form&subido=1").forward(request, response);

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
						"Error de programaci�n: Axisctr174fileuploadServlet no ha sido llamado desde un form multipart.");
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
						logger.debug("Buixa screenFields:" + screenFields);
						// Si existe fichero local
						if (item.getSize() > 0 && !isEmptySourceFilePath(this.getSourceFilePath())) {
							// Recuperar el path de destino del fichero
							getAbstractDestinationFilePath(request, usuario);
							// Si tenemos el path destino, hacemos upload
							if (!AxisBaseService.isEmpty(getDestinationFilePath())) {
								fileProces = uploadFile(request, item, usuario, screenFields);
								// AbstractDispatchAction.guardarMensaje(request, "1000611", null,
								// Constantes.MENSAJE_INFO);
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
