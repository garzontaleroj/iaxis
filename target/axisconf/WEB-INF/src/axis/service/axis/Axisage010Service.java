//Revision:# Pph8/CoaEPd2WDXjth3RhA== #
package axis.service.axis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.jdbc.PAC_IAX_CAMPANAS;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LOG;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage010Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.modal.AxisimprimirService;
import axis.util.Constantes;

public class Axisage010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisage010Service() {
		super();
	}

	/**
	 * Carga formulario
	 * 
	 * @param request
	 * @param axisage010Action
	 */
	public void m_form(HttpServletRequest request, Axisage010Action axisage010Action) {
		logger.debug("Axisage010Service m_form");
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map LSTVALORES = new HashMap();
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			/* LISTVALORES */
			// Carga combo estado campa�a
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_ESTADOCAMPANA();
			LSTVALORES.put("LSTESTADOS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LSTVALORES", LSTVALORES);
			Map map2 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(3921));
			LSTVALORES.put("LSTCONVEN", tratarRETURNyMENSAJES(request, map2));
			formdata.put("LSTVALORES", LSTVALORES);

			// Carga los m�dios de comunicaci�n din�micamente para poder seleccionados por
			// medio de checkbox
			// si se selecciona los medios 1 2 y 3 graba en CMEDIOS='1,2,3' para ello
			// utilizo la clase interna Medios.
			map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_MEDIOS();
			List mediosList = (List) tratarRETURNyMENSAJES(request, map);
			Map<Integer, Medios> medios = new HashMap<Integer, Medios>();
			Iterator mediosIt = mediosList.iterator();
			while (mediosIt.hasNext()) {
				Map entry = (Map) mediosIt.next();
				BigDecimal catribu = (BigDecimal) entry.get("CATRIBU");
				String tatribu = (String) entry.get("TATRIBU");
				medios.put(catribu.intValue(), new Medios(catribu, tatribu, false));
			}

			// Si est� en modo editar isEdit='true' carga la campa�a, si est� en modo
			// isNew='true' cargo una campa�a vac�a.
			BigDecimal CCODIGO = getCampoNumerico(request, "CCODIGO");
			if (CCODIGO != null && Boolean.TRUE.toString().equals(formdata.get("isEdit"))) {
				logger.debug("Axisage010Service isEdit");
				map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_EDITAR(CCODIGO);
				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					Map campana = (Map) map.get("POBCAMPANA");
					formdata.put("CAMPAPRD", campana.get("CAMPAPRD"));
					formdata.put("CAMPAAGE", campana.get("CAMPAAGE"));
					formdata.put("CAMPAAGE_GANADOR", campana.get("CAMPAAGE_GANADOR"));
					formdata.put("CCODIGO", campana.get("CCODIGO"));
					formdata.put("TDESCRIP", campana.get("TDESCRIP"));
					formdata.put("CESTADO", campana.get("CESTADO"));
					formdata.put("NAGECAM", campana.get("NAGECAM"));
					formdata.put("IVALINI", campana.get("IVALINI"));
					formdata.put("FINICAM", campana.get("FINICAM"));
					formdata.put("TOBSERV", campana.get("TOBSERV"));
					formdata.put("IVTAPRV", campana.get("IVTAPRV"));
					formdata.put("FFINCAM", campana.get("FFINCAM"));
					formdata.put("IVTAREA", campana.get("IVTAREA"));
					formdata.put("TDESCRIP", campana.get("TDESCRIP"));
					formdata.put("IPREMIO", campana.get("IPREMIO"));
					formdata.put("NAGEGAN", campana.get("NAGEGAN"));
					String str = (String) campana.get("CMEDIOS");

					formdata.put("CEXCCRR", campana.get("CEXCCRR"));
					formdata.put("CEXCNEWP", campana.get("CEXCNEWP"));
					formdata.put("FINIREC", campana.get("FINIREC"));
					formdata.put("FFINREC", campana.get("FFINREC"));
					formdata.put("CCONVEN", campana.get("CCONVEN"));
					if (str != null) {
						String[] cmedios = str.split(",");
						for (String key : cmedios) {
							Medios medio = medios.get(new Integer(key));
							if (medio != null) {
								medio.setValor(Boolean.TRUE);
								medios.put(new Integer(key), medio);
							}
						}
					}

				}
			} else if (Boolean.TRUE.toString().equals(formdata.get("isNew"))) {
				logger.debug("Axisage010Service isNew");
				formdata.put("CAMPAPRD", null);
				formdata.put("CAMPAAGE", null);
				formdata.put("CAMPAAGE_GANADOR", null);
				formdata.put("CCODIGO", null);
				formdata.put("TDESCRIP", null);
				formdata.put("CESTADO", null);
				formdata.put("NAGECAM", null);
				formdata.put("IVALINI", null);
				formdata.put("FINICAM", null);
				formdata.put("TOBSERV", null);
				formdata.put("IVTAPRV", null);
				formdata.put("FFINCAM", null);
				formdata.put("IVTAREA", null);
				formdata.put("TDESCRIP", null);
				formdata.put("IPREMIO", null);
				formdata.put("NAGEGAN", null);
				formdata.put("CMEDIOS", null);

				formdata.put("CEXCCRR", null);
				formdata.put("CEXCNEWP", null);
				formdata.put("FINIREC", null);
				formdata.put("FFINREC", null);
				formdata.put("CCONVEN", null);
			}

			// Documentos campa�a
			if (CCODIGO != null) {
				map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_DOCUMENTOS(CCODIGO);
				List documentos = (List) map.get("PLISTDOCUMENTOS");
				if (documentos != null && documentos.size() > 0) {
					formdata.put("PLISTDOCUMENTOS", documentos);
				}
			}

			formdata.put("medios", medios);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Guarda la campalla mediante la funci�n PAC_IAX_CAMPANAS__F_GRABAR
	 * 
	 * @param request
	 * @param axisage010Action
	 */
	public void m_aceptar(HttpServletRequest request, Axisage010Action axisage010Action) {
		logger.debug("Axisage010Service m_aceptar");
		PAC_IAX_CAMPANAS pac_iax_campanas = new PAC_IAX_CAMPANAS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// Construye la cadena para grabar en CMEDIOS='1,2,3'
			StringBuffer medios = new StringBuffer();
			Map map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GET_MEDIOS();
			List mediosList = (List) tratarRETURNyMENSAJES(request, map);
			Iterator mediosIt = mediosList.iterator();
			while (mediosIt.hasNext()) {
				Map entry = (Map) mediosIt.next();
				BigDecimal catribu = (BigDecimal) entry.get("CATRIBU");
				StringBuffer strCatribu = new StringBuffer();
				strCatribu.append("CMEDIO_");
				strCatribu.append(catribu.intValue());
				if (Boolean.TRUE.toString().equals(getCampoTextual(request, strCatribu.toString()))) {
					if (medios.toString().length() > 0) {
						medios.append(",");
					}
					medios.append(catribu.intValue());
				}
			}

			// Obtine valores y graba
			String pPCCODIGO = getCampoTextual(request, "CCODIGO");
			String pPTDESCRIP = getCampoTextual(request, "TDESCRIP");
			String pPCESTADO = getCampoTextual(request, "CESTADO");
			java.sql.Date pPFINICAM = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FINICAM"));
			java.sql.Date pPFFINCAM = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FFINCAM"));
			BigDecimal pPIVALINI = getCampoNumerico(request, "IVALINI");
			BigDecimal pPIPREMIO = getCampoNumerico(request, "IPREMIO");
			BigDecimal pPIVTAPRV = getCampoNumerico(request, "IVTAPRV");
			BigDecimal pPIVTAREA = getCampoNumerico(request, "IVTAREA");
			String pPCMEDIOS = medios.toString();
			BigDecimal pPNAGECAM = getCampoNumerico(request, "NAGECAM");
			BigDecimal pPNAGEGAN = getCampoNumerico(request, "NAGEGAN");
			String pPTOBSERV = getCampoTextual(request, "TOBSERV");

			java.sql.Date pPFINIREC = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FINIREC"));
			java.sql.Date pPFFINREC = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FFINREC"));
			BigDecimal pPEXCCRR = getCampoNumerico(request, "CEXCEPCION1");
			BigDecimal pPCEXCNEWP = getCampoNumerico(request, "CEXCEPCION2");
			String pPCCONVEN = getCampoTextual(request, "CCONVEN");

			map = pac_iax_campanas.ejecutaPAC_IAX_CAMPANAS__F_GRABAR(pPCCODIGO, pPTDESCRIP, pPCESTADO, pPFINICAM,
					pPFFINCAM, pPIVALINI, pPIPREMIO, pPIVTAPRV, pPIVTAREA, pPCMEDIOS, pPNAGECAM, pPNAGEGAN, pPTOBSERV,
					pPEXCCRR, pPCEXCNEWP, pPFINIREC, pPFFINREC, pPCCONVEN);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				formdata.put("OK", "1");
				m_form(request, axisage010Action);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * @param request
	 * @param axisage010Action
	 */
	public void m_miajaxjson(HttpServletRequest request, Axisage010Action axisage010Action) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {
			// ejecutar report
			logger.debug("****  Accion EJECUTAR map: " + map);
			String CEXPORT = "PDF";
			String CMAP = new String(formdata.get("CMAP").toString());
			String CCODIGO = new String(formdata.get("CCODIGO").toString());
			String CAGENTE = new String(formdata.get("CCAGENTE").toString());
			BigDecimal batch = new BigDecimal(0);
			BigDecimal CIDIOMA = new BigDecimal(2); // usuario.getCidioma();
			BigDecimal CEMPRES = new BigDecimal(17); // usuario.getCempres();
			String CEMAIL = null;

			HashMap<String, String> PARAMETROS__ = new HashMap();
			HashMap<String, String> TPARAMETROS__ = new HashMap();
			PARAMETROS__.put("CCODIGO", CCODIGO);
			PARAMETROS__.put("CCAGENTE", CAGENTE);
			TPARAMETROS__.put("TCCODIGO", "2");
			TPARAMETROS__.put("TCCAGENTE", "2");

			Map mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));

			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);

			logger.debug("Resultado accion ejecutar LISTADOS: " + map);
			map.put("LISTADOS", mapINFORME);

			request.setAttribute(Constantes.AJAXCONTAINER, map);

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

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
		logger.debug("Axisage010Service m_tunnel_doc");
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		String SO = ConfigCache.getConfig().getProperty("SOSERVER", "WINDOWS");

		try {
			String FICHERO = null;
			if (SO.equals(new String("UNIX"))) {
				FICHERO = getCampoTextual(request, "file").replace("\\", "/");
			} else {
				FICHERO = getCampoTextual(request, "file");
			}

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
				pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisage010", f.getAbsolutePath(), null, null);
				// Lectura del fichero y env�o como stream de Response
				byte[] attachment = new byte[bytesA];
				// sos = new ServletOutputStream();
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
			logger.error("Error en el servicio Axisage010Service - m�todo m_tunnel_doc", e);
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

			// Cerrar los recursos en el finally suele ser una buena pr�ctica
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
			} catch (IOException ioe) {
				logger.error("Error en el servicio Axisage010Service - m�todo m_tunnel. Al limpiar recursos de IO.",
						ioe);
				AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	/**
	 */
	public class Medios {
		BigDecimal catribu;
		String tatribu;
		Boolean valor = false;

		public Medios(BigDecimal catribu, String tatribu, Boolean valor) {
			super();
			this.catribu = catribu;
			this.tatribu = tatribu;
			this.valor = valor;
		}

		public void setCatribu(BigDecimal catribu) {
			this.catribu = catribu;
		}

		public BigDecimal getCatribu() {
			return catribu;
		}

		public void setTatribu(String tatribu) {
			this.tatribu = tatribu;
		}

		public String getTatribu() {
			return tatribu;
		}

		public void setValor(Boolean valor) {
			this.valor = valor;
		}

		public Boolean getValor() {
			return valor;
		}
	}

}
