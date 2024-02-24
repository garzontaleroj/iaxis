//Revision:# Gy6b+wICUp04Kwow59pKuA== #
package axis.service.axis;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_IMPRESION;
import axis.jdbc.PAC_IAX_LOG;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.service.modal.AxisgedoxService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * 
 * Super clase para los servicios de la aplicación. Contiene métodos comunes a
 * todos los servicios.
 * 
 */
public class AxisBaseService implements Serializable {

	private static final long serialVersionUID = 2482124757714807891L;

	protected static Log logger = LogFactory.getLog(AxisBaseService.class);

	// ecg201201018 hemos de añadir el control del SOSERVER aqui tb
	private static String SO = "WINDOWS";
	private static String SOSLASH = "\\"; // es el slash segun OS, por defecto es el backslash para WINDOWS
	private static String SOSLASH_MALO = "/"; // es el slash malo (por defectpo el /) que hay q sustituir por el
												// SOSPLASH
	static {
		SO = ConfigCache.getConfig().getProperty("SOSERVER", "WINDOWS");
		if (SO.equals("UNIX")) {
			SOSLASH = "/"; // el slash de UNIX
			SOSLASH_MALO = "\\"; // ahora el backslash de WINDOWS es el malo
		}
	}

	/**
	 * @Deprecated Utilizar request.setAttribute(Constantes.PASSFORMDATA, Map
	 *             passformdata); y request.setAttribute(Constantes.PASSTOPPILA, Map
	 *             passTopPila); para guardar datos entre flujos, para recuperarlos
	 *             es automáticamente gestionado por AxisRequestProcessor y
	 *             FlujodetrabajoService, respectivamente.
	 * 
	 * @param request
	 * @throws Exception
	 */
	protected void z_tratarDatosDelSalto(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		// passformdata?
		HashMap passformdata = (HashMap) request.getAttribute("passformdata");
		if (passformdata != null) {
			Object[] keys = passformdata.keySet().toArray();
			for (int i = 0; i < keys.length; i++) {
				formdata.put((String) keys[i], passformdata.get((String) keys[i]));
			}
		}

		// passTopPila?
		Map passTopPila = (Map) request.getAttribute("passTopPila");

		if (!isEmpty(passTopPila)) {
			Object[] keySetArray = passTopPila.keySet().toArray();
			for (int i = 0; i < keySetArray.length; i++) {
				AbstractDispatchAction.topPila(request, keySetArray[i].toString(),
						passTopPila.get(keySetArray[i].toString()));
			}
		}

	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_doc(HttpServletRequest request, BigDecimal SEGURO, String CCIDIOMA) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		// TODO:CCIDIOMA se envía a null
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_GET_DOCUMPROD(SEGURO, null);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_doc_tipo(HttpServletRequest request, BigDecimal SEGURO, String CTIPO,
			BigDecimal CIDIOMA) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		// TODO:CCIDIOMA se envía a null
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_GET_DOCUMPROD_TIPO(SEGURO, CTIPO, CIDIOMA);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	// INI - TCS_324B - JLTS - 11/02/2019. Se adiciona la opción idioma por
	// parámetro CIDOOMAREP
	protected ArrayList imprimir_sperson(HttpServletRequest request, BigDecimal SPERSON, String TIPO,
			BigDecimal CIDIOMAREP) throws Exception {
		// FIN - TCS_324B - JLTS - 11/02/2019.
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		// TODO:CCIDIOMA se envía a null
		// INI - TCS_324B - JLTS - 11/02/2019. Se adiciona la opción idioma por
		// parámetro CIDOOMAREP
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPERSON(SPERSON, TIPO, CIDIOMAREP);
		// FIN - TCS_324B - JLTS - 11/02/2019.
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	// bug 0022030
	protected ArrayList imprimir_impresion_cartas(HttpServletRequest request, BigDecimal SGESCARTA, BigDecimal SDEVOLU)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		// bug 0022030
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CARTA(SGESCARTA, SDEVOLU);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_impresion_recibos(HttpServletRequest request, BigDecimal SPROIMP) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		// TODO:CCIDIOMA se envía a null
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBOS(SPROIMP);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SPRODUC
	 * @param CTIPO
	 * @param NOMFITXER
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_docproducto_tipo(HttpServletRequest request, BigDecimal SPRODUC, BigDecimal NRIESGO,
			String CTIPO, String NOMFITXER) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		// TODO:CCIDIOMA se envía a null
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_GET_DOCPRODUCTO_TIPO(SPRODUC, NRIESGO, CTIPO, NOMFITXER);

		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_factura_tipo(HttpServletRequest request, BigDecimal NREEMB, BigDecimal NFACT,
			BigDecimal NRIESGO, BigDecimal SSEGURO, String TIPO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_FACTURA(NREEMB, NFACT, NRIESGO, SSEGURO, TIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente
		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}

			}

		}

		return lista;
	}

	/**
	 * Realiza el tunneling de un fichero genérico, existente en el FileSystem. Lo
	 * lee y lo envía como un stream al navegador web vía Response.
	 * 
	 * @param request
	 */
	public static void tunnelFichero(HttpServletRequest request, HttpServletResponse response,
			String fileAbsolutePath) {

		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		if (isEmpty(fileAbsolutePath))
			throw new IllegalArgumentException("fileAbsolutePath es nulo.");

		try {
			String fileMime = null;

			// ecg20120118 hagamos un retoque del valor fileAbsolutePath, considerando el SO
			fileAbsolutePath = StringUtils.replace(fileAbsolutePath, SOSLASH_MALO, SOSLASH);

			// Instanciar un objeto File
			File f = new File(fileAbsolutePath);

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

			// Si estamos aquí, podemos tratar f
			bis = new BufferedInputStream(new FileInputStream(f));
			int bytesA = bis.available();
			response.setContentLength(bytesA);

			// Establecer tipo de Contenido Mime para la Response
			if (fileMime == null)
				fileMime = AxisgedoxService.detectMime(f.getName());
			response.setContentType(fileMime);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + (f.getName()) + "\"");
			byte[] attachment = new byte[bytesA];

			PAC_IAX_LOG pacIaxLog = new PAC_IAX_LOG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			pacIaxLog.ejecutaPAC_IAX_LOG__F_LOG_ACTIVIDAD("axisbase", fileAbsolutePath, null, null);
			// Lectura del fichero y envío como stream de Response
			sos = response.getOutputStream();
			while (true) {
				int bytesRead = bis.read(attachment, 0, attachment.length);
				if (bytesRead < 0)
					break;
				sos.write(attachment, 0, bytesRead);
			}

		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// Cerrar los recursos en el finally suele ser una buena práctica
			try {
				if (bis != null)
					bis.close();
				if (sos != null) {
					sos.flush();
					sos.close();
				}
			} catch (IOException ioe) {
				logger.error("Error en el servicio AxisBaseService - método tunnelFichero. Al limpiar recursos de IO.",
						ioe);
				AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { ioe.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}
	}

	protected void configSuplementos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_SUPLEMENTOS pacIaxSuplementos = new PAC_IAX_SUPLEMENTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			// RCL 09/07/2013 - INICI BUG 23860
			BigDecimal sSeguro = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			String pTablas = (String) AbstractDispatchAction.topPila(request, "PTABLAS");

			Map m = pacIaxSuplementos.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_SUPLEMENTOS(SPRODUC, sSeguro, pTablas);
			// RCL 09/07/2013 - FI BUG 23860

			List<HashMap> supl = (ArrayList<HashMap>) m.get("PCURCONFIGSUPL");
			ArrayList grupdades = new ArrayList();
			for (HashMap s : supl) {
				grupdades.add(s.get("TGRUPDADES"));
			}
			request.getSession().setAttribute("GRUP_DADES", grupdades);
			request.getSession().setAttribute("CONF_SUPL", m.get("PCURCONFIGSUPL"));
		} catch (Exception e) {
			logger.error("Config para ejecutaPAC_IAX_SUPLEMENTOS__F_GET_SUPLEMENTOS " + " ha causado un error", e);
		}
	}

	/**
	 * Converte el resultset que viene como configform a una HashMap con parejas
	 * tipo ($whoami__CITEM__sCPRPTY, sCVALUE) Donde CITEM es el nombre del
	 * componente del form whoami a controlar, sCPRPTY el codigo de la propiedad
	 * traducida a {"VISIBLE"|"OBLIGATORIO"|"MODIFICABLE"|...} y cVALUE el codigo de
	 * valor correspondiente posible, por ejemplo {"SI"|"NO"} en el caso de
	 * sCPRPTY="VISIBLE". La informacion se deja en el atributo denominado
	 * Constantes.CONFIGFORM en la request.
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @param whoami  Nombre del formulario, por ejemplo "axisctr002"
	 */
	protected void configForm(HttpServletRequest request, String whoami) {
		// {CVALUE=1, CITEM=FNACIMI, CPRPTY=1}, {CVALUE=0, CITEM=FNACIMI, CPRPTY=2},
		// {CVALUE=1, CITEM=FNACIMI, CPRPTY=3}, {CVALUE=3, CITEM=FNACIMI, CPRPTY=6},
		// {CVALUE=1, CITEM=CSEXO, CPRPTY=1}, {CVALUE=0, CITEM=CSEXO, CPRPTY=2},
		// {CVALUE=1, CITEM=CSEXO, CPRPTY=3}, {CVALUE=1, CITEM=CSEXO, CPRPTY=6}]
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		List valorPorDefecto = new ArrayList();
		List<HashMap> filtro = new ArrayList<HashMap>();

		try {
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// String CMODO
			// =(String)((HashMap)AbstractDispatchAction.topPila(request)).get("CMODO");
			// BigDecimal
			// SPRODUC=(BigDecimal)((HashMap)AbstractDispatchAction.topPila(request)).get("SPRODUC");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			HashMap m = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_FORM_PROPERTY(whoami.toUpperCase(), CMODO, SPRODUC);
			// mesnajes se ignoran aqui por completo
			// solo se pintan en el log, si habian...
			ArrayList pMENSAJES = (ArrayList) m.get("MENSAJES");
			ArrayList pRETURN = (ArrayList) m.get("RETURN");
			if (pRETURN != null) {
				HashMap tempM = null;
				String CITEM = null;
				BigDecimal CPRPTY = null;
				BigDecimal CVALUE = null;
				String TVALUE = null;
				String sCPRPTY = null;
				String sCVALUE = null;
				List displayItems = new ArrayList();
				int indexDisplayItems = 0;

				for (int i = 0; i < pRETURN.size(); i++) {
					sCPRPTY = null;
					sCVALUE = null;
					tempM = (HashMap) pRETURN.get(i);
					CITEM = (String) tempM.get("CITEM");

					// Guardamos los items con DSP_ equivalentes a los displayTags, en una lista
					if (CITEM.startsWith("DSP_")) {
						if (!existeItem(displayItems, CITEM)) {
							Map propertiesIntoItems = new HashMap();
							propertiesIntoItems.put("CAMPOID", CITEM);
							displayItems.add(propertiesIntoItems);
							indexDisplayItems = displayItems.size() - 1;
						} else {
							indexDisplayItems = displayItems.size() - 1;
						}
					}

					CPRPTY = (BigDecimal) tempM.get("CPRPTY");
					CVALUE = (BigDecimal) tempM.get("CVALUE");
					TVALUE = (String) tempM.get("TVALUE");

					if (CITEM != null && CPRPTY != null && CVALUE != null) {
						switch (CPRPTY.intValue()) {
						case Constantes.CPRPTY_MODIFICABLE:
							sCPRPTY = "modificable";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_MODIFICABLE_SI:
								sCVALUE = "true";
								break;
							case Constantes.CPRPTY_MODIFICABLE_NO:
								sCVALUE = "false";
								break;
							default:
								sCVALUE = null;
							}
							// Guardamos la propiedad en la lista asociada a los displayTags (DSP_XXX)
							if (CITEM.startsWith("DSP_")) {
								((Map) displayItems.get(indexDisplayItems)).put("modificable", sCVALUE);
							}
							break;
						case Constantes.CPRPTY_OBLIGATORIO:
							sCPRPTY = "obligatorio";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_OBLIGATORIO_SI:
								sCVALUE = "true";
								break;
							case Constantes.CPRPTY_OBLIGATORIO_NO:
								sCVALUE = "false";
								break;
							default:
								sCVALUE = null;
							}
							break;
						case Constantes.CPRPTY_TIPODELCAMPO:
							sCPRPTY = "formato";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_TIPODELCAMPO_ALFANUMERICO:
								// sCVALUE="ALFANUMERICO";
								sCVALUE = null; // No hace falta validarlo
								break;
							case Constantes.CPRPTY_TIPODELCAMPO_FECHA:
								sCVALUE = "fecha";
								break;
							case Constantes.CPRPTY_TIPODELCAMPO_NUMERICO:
								// sCVALUE="NUMERICO";
								sCVALUE = "decimal";
								break;
							case 9: // Constantes.CPRPTY_TIPODELCAMPO_NUMERICO_SINFORMATEO
								sCVALUE = "numerico"; // sin formateo, para campos como SNIP, NPOLIZA, CERTIFICADO...
								break;
							// bfp bug 22253 ini
							case Constantes.CPRPTY_TIPODELCAMPO_LISTA:
								// sCVALUE="LISTA";
								sCVALUE = "lista";
								break;
							// bfp bug 22253 fi
							default:
								sCVALUE = null;
							}
							break;
						case Constantes.CPRPTY_VISIBLE:
							sCPRPTY = "visible";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_VISIBLE_SI:
								sCVALUE = "true";
								break;
							case Constantes.CPRPTY_VISIBLE_NO:
								sCVALUE = "false";
								break;
							default:
								sCVALUE = null;
							}

							// Guardamos la propiedad en la lista asociada a los displayTags (DSP_XXX)
							if (CITEM.startsWith("DSP_")) {
								((Map) displayItems.get(indexDisplayItems)).put("visible", sCVALUE);
							}
							break;
						case Constantes.CPRPTY_LITERALALTERNATIVO:
							sCPRPTY = "alt";
							if (CVALUE != null)
								sCVALUE = String.valueOf(CVALUE.intValue());

							/* RKV bug 10467 */
							if (Constantes.CPRPTY_MENSAJE_INI.equals(CITEM)) {
								if (request.getSession().getAttribute(whoami + "_QUITAR_MENSAJE_INI") == null) {
									AbstractDispatchAction.guardarMensaje(request, sCVALUE, null,
											Constantes.MENSAJE_INFO);
									request.getSession().setAttribute(whoami + "_MENSAJE_INI", sCVALUE);
								}
							}
							/* RKV bug 10467 */

							break;
						case Constantes.CPRPTY_EXPANDER:
							sCPRPTY = "expander";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_EXPANDER_SI:
								sCVALUE = "true";
								break;
							case Constantes.CPRPTY_EXPANDER_NO:
								sCVALUE = "false";
								break;
							default:
								sCVALUE = null;
							}

							break;
						case Constantes.CPRPTY_VALORDEFECTO:
							sCPRPTY = "valordefecto";
							if (CVALUE != null) {
								sCVALUE = "" + CVALUE.intValue();

								// Guardamos los valores x defecto en una lista para procesarla mediante js.
								Map propiedadesValorDefecto = new HashMap();
								propiedadesValorDefecto.put("CAMPOID", CITEM);
								propiedadesValorDefecto.put("VALOR", sCVALUE);
								valorPorDefecto.add(propiedadesValorDefecto);
							}

							break;
						case 10:
							sCPRPTY = "filtro";
							if (CVALUE != null) {
								sCVALUE = "" + CVALUE.intValue();

								HashMap propiedadesFiltro = new HashMap();
								propiedadesFiltro.put("CAMPOID", CITEM);
								propiedadesFiltro.put("VALOR", sCVALUE);
								filtro.add(propiedadesFiltro);
							}

							break;
						case Constantes.CPRPTY_DEPENDENCIA:
							sCPRPTY = "dependencia";
							if (CVALUE != null) {
								sCVALUE = "" + CVALUE.intValue();
							}
							break;

						// Bug 19490
						case Constantes.CPRPTY_MASKING:
							sCPRPTY = "masc";
							sCVALUE = "" + CVALUE.intValue();

							// Guardamos la propiedad en la lista asociada a los displayTags (DSP_XXX)
							if (CITEM.startsWith("DSP_")) {
								((Map) displayItems.get(indexDisplayItems)).put("masc", sCVALUE);
							}
							break;

						// Bug 19490
						case Constantes.CPRPTY_ENCRYPT:
							sCPRPTY = "encrypt";
							sCVALUE = "" + CVALUE.intValue();

							// Guardamos la propiedad en la lista asociada a los displayTags (DSP_XXX)
							if (CITEM.startsWith("DSP_")) {
								((Map) displayItems.get(indexDisplayItems)).put("encrypt", sCVALUE);
							}
							break;

						default:
							sCPRPTY = null;
						}
						if (sCPRPTY != null && sCVALUE != null) {
							configForm.put(whoami + "__" + CITEM + "__" + sCPRPTY, sCVALUE);
						}
					}
				}
				// Guardamos la lista asociada a los displayTags (DSP_XXX) en request
				request.setAttribute("DISPLAY_ITEMS", ((isEmpty(displayItems)) ? null : displayItems));
				request.setAttribute("VALOR_POR_DEFECTO", ((isEmpty(valorPorDefecto)) ? null : valorPorDefecto));
				request.getSession().setAttribute("filtro", ((isEmpty(filtro)) ? null : filtro));

			}

		} catch (Exception e) {
			logger.error("ConfigForm para F_GET_FORM_PROPERTY " + whoami + " ha causado un error", e);
		}

		try {
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// String CMODO
			// =(String)((HashMap)AbstractDispatchAction.topPila(request)).get("CMODO");
			// BigDecimal
			// SPRODUC=(BigDecimal)((HashMap)AbstractDispatchAction.topPila(request)).get("SPRODUC");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			HashMap m = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_DEP_FORM_PROPERTY(whoami.toUpperCase(), CMODO, SPRODUC);
			List<Map> dependencias = (List<Map>) tratarRETURNyMENSAJES(request, m, false);
			// Se informa el tercer parametro a false para omitir los mensajes de
			// NumeroMaximoDeRegistros. NCC bug 12599
			// Para la pantalla de consulta de polizas no es necesario la propiedad 2 de las
			// config form
			// por este motivo se recorren las dependencias en busca de esta propiedad si
			// existe
			// se hará caso omiso para evitar problemas en pantalla(canvi demanat per
			// jazorin). XPL bug 8957
			List<Map> dependencias_sinCPRPTY2_paraconsulta = new ArrayList();
			if (whoami.toUpperCase().equals("AXISCTR020")) {
				if (!isEmpty(dependencias)) {
					for (Map dep : dependencias) {
						if (!isEmpty(dep.get("CPRPTY"))) {
							BigDecimal CPRPTY = (BigDecimal) dep.get("CPRPTY");
							if (!CPRPTY.equals(new BigDecimal(2))) {
								dependencias_sinCPRPTY2_paraconsulta.add(dep);
							}
						}
					}
					dependencias = dependencias_sinCPRPTY2_paraconsulta;

				}
			}
			// fi bug 8957
			request.setAttribute("DEPENDENCIAS", ((!isEmpty(dependencias)) ? dependencias : new ArrayList()));
			// mesnajes se ignoran aqui por completo
			// solo se pintan en el log, si habian...
			ArrayList pMENSAJES = (ArrayList) m.get("MENSAJES");
			ArrayList pRETURN = (ArrayList) m.get("RETURN");
			if (pRETURN != null) {
				HashMap tempM = null;
				BigDecimal CCFGDEP = null;

				String CITORIG = null;
				String TVALORIG = null;
				String CITDEST = null;
				BigDecimal CPRPTY = null;
				BigDecimal CVALUE = null;
				String sCPRPTY = null;
				String sCVALUE = null;

				for (int i = 0; i < pRETURN.size(); i++) {
					sCPRPTY = null;
					sCVALUE = null;
					tempM = (HashMap) pRETURN.get(i);
					CITORIG = (String) tempM.get("CITORIG");
					CITDEST = (String) tempM.get("CITDEST");
					TVALORIG = (String) tempM.get("TVALORIG");

					CPRPTY = null; // (BigDecimal)tempM.get("CPRPTY");
					CVALUE = (BigDecimal) tempM.get("CVALUE");

					if (CPRPTY != null) {
						switch (CPRPTY.intValue()) {
						case Constantes.CPRPTY_VISIBLE:
							sCPRPTY = "visible";
							switch (CVALUE.intValue()) {
							case Constantes.CPRPTY_VISIBLE_SI:
								sCVALUE = "true";
								break;
							case Constantes.CPRPTY_VISIBLE_NO:
								sCVALUE = "false";
								break;
							default:
								sCVALUE = null;
							}
							break;
						default:
							sCPRPTY = null;
						}
						if (sCPRPTY != null && sCVALUE != null) {
							configForm.put("dep__" + whoami + "__" + CITORIG + "__" + CITDEST + "__" + TVALORIG,
									sCVALUE);
						}

					}
				}
			}

		} catch (Exception e) {
			logger.error("ConfigForm para F_GET_DEP_FORM_PROPERTY " + whoami + " ha causado un error", e);
		}

	}

	/**
	 * Método que comprueba si existe un item en el listado de items asociados al
	 * displayTags para la configuración de pantallas (DSP_XXX).
	 * 
	 * @param displayItems
	 * @param CITEM
	 * @return
	 * @throws Exception
	 */
	private boolean existeItem(List displayItems, String CITEM) throws Exception {
		boolean existe = false;
		if (!isEmpty(displayItems)) {
			for (int i = 0; i < displayItems.size(); i++) {
				String item = ((!isEmpty(((Map) displayItems.get(i)).get("CAMPOID")))
						? (String) ((Map) displayItems.get(i)).get("CAMPOID")
						: null);
				if (!isEmpty(item) && item.equals(CITEM)) {
					existe = true;
					break;
				}
			}
		}

		return existe;
	}

	/**
	 * Método que se encarga de gestionar la carga de dependencias de base de datos
	 * de cara a la jsp. Divide las dependencias (relación entre dos campos) en
	 * listas. Luego, estas listas se controlan en la jsp (mediante javascript)
	 * 
	 * @param request
	 * @param dependencias_tmp
	 */
	protected void cargaDependencias(HttpServletRequest request, List dependencias_tmp) {
		BigDecimal CCFGDEP_PRI = null;
		BigDecimal CCFGDEP_CUR = null;

		if (!isEmpty(dependencias_tmp)) {
			// Obtenemos la cantidad de dependencias (Relaciones entre dos campos)
			int j = 0;
			for (int i = 0; i < dependencias_tmp.size(); i++) {
				CCFGDEP_CUR = (BigDecimal) ((Map) dependencias_tmp.get(i)).get("CCFGDEP");
				if (isEmpty(CCFGDEP_PRI) || !CCFGDEP_PRI.equals(CCFGDEP_CUR)) {
					CCFGDEP_PRI = (BigDecimal) ((Map) dependencias_tmp.get(i)).get("CCFGDEP");
					j++;
				}
			}
			request.setAttribute("NUM_DEPENDENCIAS", new Integer(j));

			// Cargamos las listas (una por dependencia)
			List[] dependencias = new ArrayList[j];
			CCFGDEP_PRI = null;
			CCFGDEP_CUR = null;
			int k = -1;
			for (int i = 0; i < dependencias_tmp.size(); i++) {
				Map valores_tmp = new HashMap();
				CCFGDEP_CUR = (BigDecimal) ((Map) dependencias_tmp.get(i)).get("CCFGDEP");
				if (isEmpty(CCFGDEP_PRI) || !CCFGDEP_PRI.equals(CCFGDEP_CUR)) {
					if (!isEmpty(CCFGDEP_PRI)) {
						request.setAttribute("DEPENDENCIA" + k, dependencias[k]);
					}
					k++;
					dependencias[k] = new ArrayList();
					CCFGDEP_PRI = (BigDecimal) ((Map) dependencias_tmp.get(i)).get("CCFGDEP");
				}

				valores_tmp.put("CCFGDEP", CCFGDEP_PRI);
				valores_tmp.put("CITORIG", (String) ((Map) dependencias_tmp.get(i)).get("CITORIG"));
				valores_tmp.put("TVALORIG", (String) ((Map) dependencias_tmp.get(i)).get("TVALORIG"));
				valores_tmp.put("CITDEST", (String) ((Map) dependencias_tmp.get(i)).get("CITDEST"));
				valores_tmp.put("CPRPTY", (BigDecimal) ((Map) dependencias_tmp.get(i)).get("CPRPTY"));
				valores_tmp.put("TVALUE", (BigDecimal) ((Map) dependencias_tmp.get(i)).get("TVALUE"));

				dependencias[k].add(valores_tmp);
			}

			// Sacamos el ultimo
			request.setAttribute("DEPENDENCIA" + k, dependencias[k]);
		}

	}

	protected static String whoami(Object ths) {
		String className = "";

		if (ths instanceof java.lang.Class)
			// Si se pasa algo como "Axisctr002Service.class"
			className = ((Class) ths).getName().toLowerCase();
		else
			// Si se pasa algo como "this"
			className = ths.getClass().getName().toLowerCase();

		if (className.indexOf(".") >= 0)
			className = className.substring(className.lastIndexOf(".") + 1);
		if (className.endsWith("service"))
			className = className.substring(0, className.indexOf("service"));
		if (className.endsWith("action"))
			className = className.substring(0, className.indexOf("action"));
		return className;
	}

	/**
	 * Devuelve el parámetro RETURN de una llamada a una función JDBC y parsea los
	 * MENSAJES si existen.
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @param map     El Map que retorna la función JDBC.
	 * @return Object - El objeto contenido en RETURN.
	 * @trows IllegalArgumentException - Si alguno de los parámetros está vacío.
	 */
	protected Object tratarRETURNyMENSAJES(HttpServletRequest request, Map map) {
		return tratarRETURNyMENSAJES(request, map, false);// por defecto no sale el mensaje
	}

	/**
	 * Devuelve el parámetro RETURN de una llamada a una función JDBC y parsea los
	 * MENSAJES si existen.
	 * 
	 * @param request                     El HttpServletRequest que contiene la
	 *                                    petición del cliente web.
	 * @param map                         El Map que retorna la función JDBC.
	 * @param muestraAvisoMuchosRegistros - Si hay que mostrar un mensaje cuando el
	 *                                    return excede de 100 registros.
	 * @return Object - El objeto contenido en RETURN.
	 * @trows IllegalArgumentException - Si alguno de los parámetros está vacío.
	 */
	protected Object tratarRETURNyMENSAJES(HttpServletRequest request, Map map, boolean muestraAvisoMuchosRegistros) {
		if (request == null)
			throw new IllegalArgumentException("El argumento request no puede ser nulo.");
		if (map == null)
			throw new IllegalArgumentException("El argumento map no puede ser nulo.");

		if (!isEmpty(map.get("MENSAJES")))
			AbstractDispatchAction.parsearMensajes(request, (List) map.get("MENSAJES"));

		// Si el RETURN es una Lista, que excede de 100 posiciones...
		if (muestraAvisoMuchosRegistros && !isEmpty(map.get("RETURN")) && map.get("RETURN") instanceof List
				&& ((List) map.get("RETURN")).size() > 100) {
			// Guardar un mensaje de información para mostrarlo en Mensajes.jsp
			AbstractDispatchAction.guardarMensaje(request, "1000055",
					new Object[] { "" + ((List) map.get("RETURN")).size() }, Constantes.MENSAJE_INFO);
		}

		if (!isEmpty(map.get("RETURN")))
			return map.get("RETURN");

		return null;
	}

	/**
	 * Determina el tipo de un atributo contenido en un map.
	 * 
	 * @param map         El Map donde se encuentra el atributo a examinar.
	 * @param nombreClave El nombre de la clave del atributo a examinar.
	 * @return Un Object instanceof Integer, BigDecimal o String.
	 */
	protected Object getTipoAtributo(Map map, String nombreClave) {
		if (map.get(nombreClave.trim()) instanceof Integer) {
			Integer integer = (Integer) map.get(nombreClave.trim());
			return integer;
		}
		if (map.get(nombreClave.trim()) instanceof BigDecimal) {
			BigDecimal bigDecimal = (BigDecimal) map.get(nombreClave.trim());
			return bigDecimal;
		}
		if (map.get(nombreClave.trim()) instanceof String) {
			String string = (String) map.get(nombreClave.trim());
			return string;
		}
		// Si no es ninguno de estos, devolvemos el objeto.
		return map.get(nombreClave.trim());
	}

	/**
	 * Intenta convertir un objeto String a una instancia de uno de los tres tipos
	 * que utilizamos (Integer, BigDecimal, String).
	 * 
	 * @param atributo El atributo en formato String a convertir.
	 * @return Un Object instanceof Integer, BigDecimal o String.
	 */
	private Object getTipoAtributo(String atributo) {
		try {
			// Integer
			Integer integer = Integer.valueOf(atributo);
			return integer;
		} catch (Exception e) {
			try {
				// BigDecimal
				BigDecimal bigDecimal = new BigDecimal(atributo);
				return bigDecimal;
			} catch (Exception e2) {
				// String
				String string = String.valueOf(atributo);
				return string;
			}
		}
	}

	/**
	 * Método resumen para inicializar las preguntas/respuestas de un registro sin
	 * tener que guardar las respuestas en una variable de sesión aparte. Mirar
	 * método inicializarPreguntas extendido.
	 * 
	 * @param preguntas
	 * @param respuestas
	 */
	protected void inicializarPreguntas(List preguntas, List respuestas) {
		inicializarPreguntas(preguntas, respuestas, null, null);
	}

	/**
	 * Método que guarda las respuestas acumuladas en una lista de objetos tipo
	 * OB_IAX_PREGUNTAS, en la lista de objetos de tipo OB_IAXPAR_PREGUNTAS. Para
	 * tal fin se extrae de la segunda lista para cada pregunta, el BigDecimal
	 * CRESPUE que contiene la respuesta del usuario, y se inserta en la primera
	 * lista. Este método debe llamarse en el método form de cada service, cada vez
	 * que se ejecuta cada Form. Para ver como tratar las preguntas/respuestas en
	 * cada JSP, ver axisctr004.jsp. Opcionalmente, si rellenamos las casillas
	 * request i sessionAttributeField, guardaremos en una variable de sesión las
	 * respuestas para poderlas recuperar cuando queramos guardar las preguntas a
	 * nivel de validación (guardarPreguntas) y el registro de preguntas/respuestas
	 * esté desactivo/no visible.
	 * 
	 * @param preguntas             La lista de preguntas que contiene objetos de
	 *                              tipo OB_IAXPAR_PREGUNTAS.
	 * @param respuestas            La lista de preguntas que contiene objetos de
	 *                              tipo OB_IAX_PREGUNTAS.
	 * @param request               Solo lo utilizamos cuando queremso guardar las
	 *                              respuestas en una var de sesión nombrada en
	 *                              sessionAttributeField
	 * @param sessionAttributeField Nombre de la variable de sesión donde se guardan
	 *                              las respuestas.
	 */
	protected void inicializarPreguntas(List preguntas, List respuestas, HttpServletRequest request,
			String sessionAttributeField) {
		Map sessionField = new HashMap();
		if (!isEmpty(respuestas) && !isEmpty(preguntas)) {
			// Merge de las respuestas del usuario en las preguntas
			for (int i = 0; i < preguntas.size(); i++) {
				try {
					// Recuperar el CPREGUN
					BigDecimal CPREGUN = (BigDecimal) ((Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS"))
							.get("CPREGUN");
					if (isEmpty(CPREGUN))
						continue;

					// Recuperar el OB_IAX_PREGUNTAS con las respuestas del usuario
					Map respuestaUsuario = getObjetoDeLista(respuestas, CPREGUN.toString(), "CPREGUN",
							"OB_IAX_PREGUNTAS");

					if (isEmpty(respuestaUsuario))
						continue;

					// Recuperar CRESPUE (respuesta del usuario a la pregunta
					BigDecimal CRESPUE = (BigDecimal) respuestaUsuario.get("CRESPUE");
					if (!isEmpty(CRESPUE)) {
						// Poner el CRESPUE en el OB_IAXPAR_PREGUNTAS
						((Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS")).put("CRESPUE", CRESPUE);

						// Si tenemos que recuperar los valores de respuesta de una session en vez de
						// una request
						if (!isEmpty(sessionAttributeField))
							sessionField.put("respuesta_" + i, CRESPUE);

					}

					// Recuperar TRESPUE (respuesta del usuario a la pregunta
					String TRESPUE = (String) respuestaUsuario.get("TRESPUE");
					TRESPUE = TRESPUE.replaceAll((Character.valueOf((char) 13)).toString(), "<br />");
					TRESPUE = TRESPUE.replaceAll("\n", "");
					if (!isEmpty(TRESPUE)) {
						// Poner el TRESPUE en el OB_IAXPAR_PREGUNTAS
						((Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS")).put("TRESPUE", TRESPUE);

						if (isEmpty(CRESPUE) && !isEmpty(sessionAttributeField))
							sessionField.put("respuesta_" + i, TRESPUE);
					}

				} catch (NullPointerException npe) {
					// npe.printStackTrace();
					continue;
				}
			}

			// Si tenemos que recuperar los valores de respuesta de una session en vez de
			// una request
			if (!isEmpty(sessionAttributeField))
				request.getSession().setAttribute(sessionAttributeField,
						!isEmpty(sessionField) ? sessionField : new HashMap());
		}
	}

	/**
	 * Método estándar para guardar preguntas. Representa una llamada a
	 * guardarPreguntas (HttpServletRequest request, List preguntas, String
	 * llamadaJDBC, Object[] otherParams) con el argumento otherParams vacío. Con
	 * esta llamada, no rellenamos ni otherParams ni el sessionAttributeField.
	 * 
	 * @see - Documentación de guardarPreguntas (HttpServletRequest, List, String,
	 *      Object[])
	 * @param request     El HttpServletRequest que contiene la petición del cliente
	 *                    web.
	 * @param preguntas   La lista de preguntas a grabar.
	 * @param llamadaJDBC La llamada JDBC en formato "PAC_XXX__F_YYY"
	 * @throws Exception
	 */
	protected void guardarPreguntas(HttpServletRequest request, List preguntas, String llamadaJDBC) throws Exception {
		guardarPreguntas(request, preguntas, llamadaJDBC, new Object[0], null);
	}

	protected void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, String llamadaJDBC)
			throws Exception {
		guardarPreguntasProvisional(request, preguntas, llamadaJDBC, new Object[0], null, null);
	}

	protected void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, String llamadaJDBC,
			BigDecimal recarga) throws Exception {
		guardarPreguntasProvisional(request, preguntas, llamadaJDBC, new Object[0], null, recarga);
	}

	/**
	 * Método de guardarPreguntas si tenemos que rellenar el otherParams y no el
	 * sessionAttributeField
	 * 
	 * @param request
	 * @param preguntas
	 * @param llamadaJDBC
	 * @param otherParams
	 * @throws Exception
	 */
	protected void guardarPreguntas(HttpServletRequest request, List preguntas, String llamadaJDBC,
			Object[] otherParams) throws Exception {
		guardarPreguntas(request, preguntas, llamadaJDBC, otherParams, null);
	}

	/**
	 * Método de guardarPreguntas si tenemos que rellenar el sessionAttributeField y
	 * no el otherParams
	 * 
	 * @param request
	 * @param preguntas
	 * @param llamadaJDBC
	 * @param sessionAttributeField
	 * @throws Exception
	 */
	protected void guardarPreguntas(HttpServletRequest request, List preguntas, String llamadaJDBC,
			String sessionAttributeField) throws Exception {
		guardarPreguntas(request, preguntas, llamadaJDBC, new Object[0], sessionAttributeField);
	}

	protected void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, String llamadaJDBC,
			String sessionAttributeField) throws Exception {
		guardarPreguntasProvisional(request, preguntas, llamadaJDBC, new Object[0], sessionAttributeField, null);
	}

	protected void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, String llamadaJDBC,
			String sessionAttributeField, BigDecimal recarga) throws Exception {
		guardarPreguntasProvisional(request, preguntas, llamadaJDBC, new Object[0], sessionAttributeField, recarga);
	}

	/**
	 * Método estándar para guardar preguntas.
	 * 
	 * @param request               El HttpServletRequest que contiene la petición
	 *                              del cliente web.
	 * @param preguntas             La lista de preguntas a grabar.
	 * @param llamadaJDBC           La llamada JDBC en formato "PAC_XXX__F_YYY"
	 * @param otherParams           Parámetros fijos que se le pasan a la función,
	 *                              no dependiendo de la pregunta.
	 * @param sessionAttributeField Atributo de sesión donde hemos guardado las
	 *                              respuestas. Si no estan en sesión, lo rellenamos
	 *                              a null. Por ejemplo, el NRIESGO o la CGARANT.
	 *                              Estos deben ir en el mismo orden que están
	 *                              declarados en la función.
	 * @throws Exception
	 *
	 *                   Ejemplo de llamada:
	 * 
	 *                   List preguntas = (List)
	 *                   request.getSession().getAttribute("axisctr_preguntasGarantia");
	 *                   if (!isEmpty(preguntas)) guardarPreguntas(request,
	 *                   preguntas, "PAC_IAX_PRODUCCION__F_GRABAPREGUNTASGARANTIA",
	 *                   new Object[] {NRIESGO, garantia.get("CGARANT")});
	 */
	protected void guardarPreguntas(HttpServletRequest request, List preguntas, String llamadaJDBC,
			Object[] otherParams, String sessionAttributeField) throws Exception {
		final String paquete = "axis.jdbc.";
		final String prefijo = "ejecuta";
		final String separador = "__";

		Class clase = null;
		Method metodo = null;
		String nombreClase = null;
		String nombreMetodo = null;

		if (isEmpty(preguntas))
			return;

		try {
			// No hay que pasarle el "ejecuta", pero por esta vez seremos permisivos
			if (llamadaJDBC.startsWith(prefijo))
				llamadaJDBC = StringUtils.replace(llamadaJDBC, prefijo, "");

			// Recuperar nombre de la clase JDBC
			nombreClase = llamadaJDBC.split(separador)[0];
			// Recuperar nombre del método de dicha clase a ejecutar
			nombreMetodo = prefijo + nombreClase + separador + llamadaJDBC.split(separador)[1];

			// Instanciar la Class
			clase = Class.forName(paquete + nombreClase);

			// Recuperar los métodos de la clase
			Method[] methodArray = clase.getMethods();
			// Class[] argumentTypes = null;

			// Recorremos todos los métodos buscando el deseado
			for (int i = 0; i < methodArray.length; i++) {
				if (methodArray[i].getName().equals(nombreMetodo)) {
					// Cuando encontramos nuestro método, como no hay sobrecargas
					// (mismo nombre para distintos métodos), sabemos que es el que buscamos,
					// por tanto, recuperaremos los tipos de sus argumentos
					metodo = methodArray[i];
					// argumentTypes = metodo.getParameterTypes();
					break;
				}
			}

		} catch (Exception e) {
			throw new IllegalArgumentException("No se ha encontrado la clase JDBC: " + nombreClase);
		}

		// Llamamos a la función privada que instancia la clase y el constructor
		if (metodo != null)
			guardarPreguntas(request, preguntas, clase, metodo, otherParams, sessionAttributeField);
		else
			throw new IllegalArgumentException(
					"No se ha encontrado el método JDBC: " + nombreMetodo + " de la classe " + nombreClase);

	}

	protected void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, String llamadaJDBC,
			Object[] otherParams, String sessionAttributeField, BigDecimal recarga) throws Exception {
		final String paquete = "axis.jdbc.";
		final String prefijo = "ejecuta";
		final String separador = "__";

		Class clase = null;
		Method metodo = null;
		String nombreClase = null;
		String nombreMetodo = null;

		if (isEmpty(preguntas))
			return;

		try {
			// No hay que pasarle el "ejecuta", pero por esta vez seremos permisivos
			if (llamadaJDBC.startsWith(prefijo))
				llamadaJDBC = StringUtils.replace(llamadaJDBC, prefijo, "");

			// Recuperar nombre de la clase JDBC
			nombreClase = llamadaJDBC.split(separador)[0];
			// Recuperar nombre del método de dicha clase a ejecutar
			nombreMetodo = prefijo + nombreClase + separador + llamadaJDBC.split(separador)[1];

			// Instanciar la Class
			clase = Class.forName(paquete + nombreClase);

			// Recuperar los métodos de la clase
			Method[] methodArray = clase.getMethods();
			// Class[] argumentTypes = null;

			// Recorremos todos los métodos buscando el deseado
			for (int i = 0; i < methodArray.length; i++) {
				if (methodArray[i].getName().equals(nombreMetodo)) {
					// Cuando encontramos nuestro método, como no hay sobrecargas
					// (mismo nombre para distintos métodos), sabemos que es el que buscamos,
					// por tanto, recuperaremos los tipos de sus argumentos
					metodo = methodArray[i];
					// argumentTypes = metodo.getParameterTypes();
					break;
				}
			}

		} catch (Exception e) {
			throw new IllegalArgumentException("No se ha encontrado la clase JDBC: " + nombreClase);
		}

		// Llamamos a la función privada que instancia la clase y el constructor
		if (metodo != null)
			guardarPreguntasProvisional(request, preguntas, clase, metodo, otherParams, sessionAttributeField, recarga);
		else
			throw new IllegalArgumentException(
					"No se ha encontrado el método JDBC: " + nombreMetodo + " de la classe " + nombreClase);

	}

	/**
	 * Método privado para grabar preguntas, es llamado desde el método análogo
	 * público guardarPreguntas (HttpServletRequest request, List preguntas, String
	 * llamadaJDBC, Object[] otherParams)
	 * 
	 * @param request               El HttpServletRequest que contiene la petición
	 *                              del cliente web.
	 * @param preguntas             La lista de preguntas a grabar.
	 * @param clase                 El objeto Class de la clase JDBC a instanciar
	 *                              (por ejemplo, PAC_IAX_PRODUCCION)
	 * @param method                El método JDBC a ejecutar, conteniendo el nombre
	 *                              y los tipos de los argumentos de la función.
	 * @param otherParams           Parámetros fijos que se le pasan a la función,
	 *                              no dependiendo de la pregunta.
	 * @param sessionAttributeField Atributo de sesión donde hemos guardado las
	 *                              respuestas. Si no estan en sesión, lo rellenamos
	 *                              a null. Por ejemplo, el NRIESGO o la CGARANT.
	 *                              Estos deben ir en el mismo orden que están
	 *                              declarados en la función.
	 * @throws Exception
	 * 
	 */
	private void guardarPreguntas(HttpServletRequest request, List preguntas, Class clase, Method method,
			Object[] otherParams, String sessionAttributeField) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Object JDBC_CLASS = null;
		try {
			// Instanciar clase JDBC mediante java.lang.reflect
			Constructor constructor = clase.getConstructor(new Class[] { Connection.class });
			JDBC_CLASS = constructor
					.newInstance(new Object[] { (java.sql.Connection) request.getAttribute(Constantes.DB01CONN) });
		} catch (Exception e) {
			throw new IllegalArgumentException("No se ha podido instanciar la clase JDBC: " + clase.getName());
		}

		// Buclamos por todas las preguntas...
		for (int i = 0; i < preguntas.size(); i++) {

			Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPPRE = (BigDecimal) pregunta.get("CTIPPRE");
			BigDecimal CPRETIP = (BigDecimal) pregunta.get("CPRETIP");
			BigDecimal CRESPUE = null;
			String TRESPUE = null;
			// Si és agutomatica no fem res
			if ((!new BigDecimal(2).equals(CPRETIP))) {
				if ((new BigDecimal(1).equals(CTIPPRE) || new BigDecimal(2).equals(CTIPPRE)
						|| new BigDecimal(3).equals(CTIPPRE) || new BigDecimal(6).equals(CTIPPRE))
						&& (!new BigDecimal(2).equals(CPRETIP))) {
					try {
						// Dependiendo de donde tengamos guardadas las respuestas (sessio o request) los
						// cargamos de uno o de otro.
						BigDecimal respuesta = null;

						if (!isEmpty(sessionAttributeField))
							respuesta = getSessionCampoNumerico(request, "respuesta_" + i, sessionAttributeField);
						else
							respuesta = getCampoNumerico(request, "respuesta_" + i);

						// Al ser un número sin control de decimales (no jugamos con PL), forzamos
						// nosotros estos decimales
						if (new BigDecimal(3).equals(CTIPPRE))
							if (!isEmpty(respuesta))
								respuesta.setScale(2, BigDecimal.ROUND_HALF_EVEN);

						CRESPUE = respuesta;
					} catch (Exception e) {
						CRESPUE = null;
					}
				} else {
					if (!isEmpty(sessionAttributeField))
						TRESPUE = getSessionCampoTextual(request, "respuesta_" + i, sessionAttributeField);
					else
						TRESPUE = getCampoTextual(request, "respuesta_" + i);

				}
				// Inicializar parámetros para llamada al método JDBC
				List params = new ArrayList();
				List otherParamsList = Arrays.asList(otherParams);
				params.addAll(otherParamsList);

				params.add(pregunta.get("CPREGUN"));
				params.add(CRESPUE);
				params.add(TRESPUE);

				try {
					// Llamada al método JDBC mediante java.lang.reflect
					Object PLRETURN = method.invoke(JDBC_CLASS, params.toArray());
					tratarRETURNyMENSAJES(request, (Map) PLRETURN);
				} catch (Exception e) {
					throw new IllegalArgumentException("No se ha podido ejecutar el método " + method.getName()
							+ " de la clase JDBC: " + clase.getName());
				}
			}
		}
	}

	private void guardarPreguntasProvisional(HttpServletRequest request, List preguntas, Class clase, Method method,
			Object[] otherParams, String sessionAttributeField, BigDecimal recarga) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Object JDBC_CLASS = null;
		try {
			// Instanciar clase JDBC mediante java.lang.reflect
			Constructor constructor = clase.getConstructor(new Class[] { Connection.class });
			JDBC_CLASS = constructor
					.newInstance(new Object[] { (java.sql.Connection) request.getAttribute(Constantes.DB01CONN) });
		} catch (Exception e) {
			throw new IllegalArgumentException("No se ha podido instanciar la clase JDBC: " + clase.getName());
		}

		// Buclamos por todas las preguntas...
		for (int i = 0; i < preguntas.size(); i++) {
			Map pregunta = (Map) ((Map) preguntas.get(i)).get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPPRE = (BigDecimal) pregunta.get("CTIPPRE");
			BigDecimal CRESPUE = null;
			String TRESPUE = null;

			if (new BigDecimal(1).equals(CTIPPRE) || new BigDecimal(2).equals(CTIPPRE)
					|| new BigDecimal(3).equals(CTIPPRE) || new BigDecimal(6).equals(CTIPPRE)) {
				try {
					// Dependiendo de donde tengamos guardadas las respuestas (sessio o request) los
					// cargamos de uno o de otro.
					BigDecimal respuesta = null;
					if (!isEmpty(sessionAttributeField)) {
						respuesta = getSessionCampoNumericoProvisional(request, "respuesta_" + i,
								sessionAttributeField);
					} else {
						respuesta = getCampoNumerico(request, "respuesta_" + i);
					}

					// Al ser un número sin control de decimales (no jugamos con PL), forzamos
					// nosotros estos decimales
					if (new BigDecimal(3).equals(CTIPPRE))
						if (!isEmpty(respuesta))
							respuesta.setScale(2, BigDecimal.ROUND_HALF_EVEN);

					CRESPUE = respuesta;
				} catch (Exception e) {
					CRESPUE = null;
				}
			} else if (new BigDecimal(8).equals(CTIPPRE)) {
				if (recarga == null) {
					try {
						// Dependiendo de donde tengamos guardadas las respuestas (sessio o request) los
						// cargamos de uno o de otro.
						BigDecimal respuesta = null;
						if (!isEmpty(sessionAttributeField)) {
							respuesta = getSessionCampoNumericoProvisional(request, "respuesta_" + i,
									sessionAttributeField);
						} else {
							respuesta = getCampoNumerico(request, "respuesta_" + i);
						}

						// Al ser un número sin control de decimales (no jugamos con PL), forzamos
						// nosotros estos decimales
						if (new BigDecimal(3).equals(CTIPPRE))
							if (!isEmpty(respuesta))
								respuesta.setScale(2, BigDecimal.ROUND_HALF_EVEN);

						CRESPUE = respuesta;
					} catch (Exception e) {
						CRESPUE = null;
					}
				}
			} else {
				if (!isEmpty(sessionAttributeField))
					TRESPUE = getSessionCampoTextualProvisional(request, "respuesta_" + i, sessionAttributeField);// getSessionCampoTextual(request,
																													// "respuesta_"+i,
																													// sessionAttributeField);
				else
					TRESPUE = getCampoTextual(request, "respuesta_" + i);

			}
			// Inicializar parámetros para llamada al método JDBC
			List params = new ArrayList();
			List otherParamsList = Arrays.asList(otherParams);
			params.addAll(otherParamsList);

			params.add(pregunta.get("CPREGUN"));
			params.add(CRESPUE);
			params.add(TRESPUE);

			try {
				// Llamada al método JDBC mediante java.lang.reflect
				Object PLRETURN = method.invoke(JDBC_CLASS, params.toArray());
				tratarRETURNyMENSAJES(request, (Map) PLRETURN);
			} catch (Exception e) {
				throw new IllegalArgumentException("No se ha podido ejecutar el método " + method.getName()
						+ " de la clase JDBC: " + clase.getName());
			}
		}
	}

	/**
	 * Método para utilizarse en los Services de pantallas que tienen un DisplayTag
	 * con múltiples CheckBoxs para seleccionar cada fila. Actualiza el estado de
	 * estos CheckBox en su lista de objetos.
	 * 
	 * @param listaObjetos                El List (normalmente en session) que
	 *                                    contiene la lista de objetos.
	 * @param requestParam                Un String que contiene las casillas
	 *                                    seleccionadas por el usuario, separadas
	 *                                    por un guión (ej: 0-1-3-6-)
	 * @param idObjeto                    El id del objeto requestParam.
	 * @param nombrePropiedadSeleccionada El literal que identifica la propiedad
	 *                                    "selected" del objeto, p.ej.
	 *                                    selectedClausula, selectedGarantia...
	 * @param nombreOuterMap              El nombre del objeto que, en ciertas
	 *                                    ocasiones, encapsula el objeto real: Ex:
	 *                                    OB_IAX_CLAUSULAS.
	 * @return List Un List con los objetos actualizados (concretamente, ponemos a
	 *         cada HashMap el atributo 'nombrePropiedadSeleccionada' a true o false
	 *         según convenga.
	 * @throws IllegalArgumentException si el argumento pasado en listaObjetos es
	 *                                  nulo.
	 */
	protected List guardarSeleccionCheckBoxs(List listaObjetos, String requestParam, String idObjeto,
			String nombrePropiedadSeleccionada, String nombreOuterMap) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("Parámetro listaObjetos no puede ser null.");
		if (nombrePropiedadSeleccionada == null)
			nombrePropiedadSeleccionada = "selected";

		String[] selectedCBs = getCasillasSeleccionadas(requestParam);

		for (int i = 0; i < listaObjetos.size(); i++) {
			// Recorremos las checkbox y buscamos coincidencias
			Map map = (Map) listaObjetos.get(i);

			if (!isEmpty(nombreOuterMap)) {
				Map innerMap = (Map) map.get(nombreOuterMap);
				if (!isEmpty(innerMap))
					map = innerMap;

			}

			Object actualCB = getTipoAtributo(map, idObjeto.trim());

			// Desseleccionar la CB
			map.put(nombrePropiedadSeleccionada, new Boolean(false));

			inner: for (
					// Si no hay ninguna seleccionada, no entrará
					int j = 0; j < selectedCBs.length; j++) {
				boolean igualdad = false;

				if (actualCB instanceof Integer) {
					// Por si la clave es un Integer
					if (actualCB.equals(Integer.valueOf(selectedCBs[j])))
						igualdad = true;
				} else if (actualCB instanceof BigDecimal) {
					// Por si la clave es un BigDecimal
					if (actualCB.equals(new BigDecimal(selectedCBs[j])))
						igualdad = true;
				} else {
					// Por si la clave es un String
					if (actualCB.equals(selectedCBs[j]))
						igualdad = true;
				}

				if (igualdad) {
					// Seleccionar la CB
					map.put(nombrePropiedadSeleccionada, new Boolean(true));
					break inner;
				}
			}

			if (!isEmpty(nombreOuterMap)) {
				// Reencapsulación del objeto dentro de su objeto contenedor
				Map outerMap = new HashMap();
				outerMap.put(nombreOuterMap, map);
				map = outerMap;
			}

			// Actualizamos la lista inicial
			listaObjetos.set(i, map);
		}
		// Devolvemos la lista con las CheckBox actualizadas
		return listaObjetos;
	}

	/**
	 * Devuelve un array de int conteniendo los índices de los checkbox marcados.
	 * 
	 * @param requestParam Un String que contiene las casillas seleccionadas por el
	 *                     usuario, separadas por un guión (ej: 0-1-3-6-).
	 * @return int[] Un array de enteros conteniendo las posiciones de las casillas
	 *         seleccionadas.
	 */
	private String[] getCasillasSeleccionadas(String requestParam) {
		if (requestParam != null && !requestParam.equals("")) {
			// Recuperar CBs seleccionadaS
			String[] selectedCasillas = requestParam.split("-");
			return selectedCasillas;
		}

		return new String[0];
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos), recupera y devuelve el
	 * objeto especificado en idObjeto contenido dentro de dicha List. Si no hay
	 * coincidencia, devuelve null.
	 * 
	 * @param listaObjetos Un List conteniendo Objetos (Maps).
	 * @param idObjeto     El id del objeto a buscar en este List.
	 * @param nombreClave  El literal que identifica la clave (ejemplo, "idObjeto").
	 * @return Map El Objeto con nombreClave = idObjeto.
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected Map getObjetoDeLista(List listaObjetos, String idObjeto, String nombreClave) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		for (int i = 0; i < listaObjetos.size(); i++) {
			Map map = (Map) listaObjetos.get(i);

			Object idAComparar = getTipoAtributo(map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (Integer.valueOf(idObjeto).equals(idAComparar))
					return map;
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (new BigDecimal(idObjeto).equals(idAComparar))
					return map;
			} else {
				// Por si la clave es un String
				if (idObjeto.equals(idAComparar))
					return map;
			}
		}
		return null;
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos), recupera y devuelve el
	 * objeto especificado en idObjeto contenido dentro de dicha List. Si no hay
	 * coincidencia, devuelve null.
	 * 
	 * @param listaObjetos   Un List conteniendo Objetos (Maps).
	 * @param idObjeto       El id del objeto a buscar en este List.
	 * @param nombreClave    El literal que identifica la clave (ejemplo,
	 *                       "idObjeto").
	 * @param nombreOuterMap El nombre del objeto Map que hay en cada posición del
	 *                       List, que encapsula otro objeto Map con los datos
	 *                       reales.
	 * @return Map El Objeto con nombreClave = idObjeto.
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected Map getObjetoDeLista(List listaObjetos, String idObjeto, String nombreClave, String nombreOuterMap) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		for (int i = 0; i < listaObjetos.size(); i++) {
			Map map = (Map) listaObjetos.get(i);

			Map map_map = (Map) map.get(nombreOuterMap);
			if (!isEmpty(map_map))
				map = map_map;

			Object idAComparar = getTipoAtributo(map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (Integer.valueOf(idObjeto).equals(idAComparar))
					return map;
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (new BigDecimal(idObjeto).equals(idAComparar))
					return map;
			} else {
				// Por si la clave es un String
				if (idObjeto.equals(idAComparar))
					return map;
			}
		}
		return null;
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos) y un objeto (Map) que se
	 * quiere insertar en dicho List, se pueden producir dos casos: 1) Que el objeto
	 * ya exista en el List: se actualiza el objeto existente con el pasado en el
	 * parámetro. 2) Que el objeto no exista en ninguna posición del List; si es
	 * así, lo insertamos al final.
	 * 
	 * @param listaObjetos Un List conteniendo Objetos (Maps).
	 * @param objeto       El objeto a insertar / modificar en el List.
	 * @return List El List actualizado.
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected List setObjetoALista(List listaObjetos, Map objeto) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (objeto == null)
			throw new IllegalArgumentException("objeto no puede ser null.");

		if (listaObjetos.contains(objeto))
			// Machacamos el objeto de la lista por el deseado
			listaObjetos.set(listaObjetos.indexOf(objeto), objeto);
		else
			// Si no existe en el List. Lo añadimos igualmente (al final).
			listaObjetos.add(objeto);

		return listaObjetos;
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos) y un objeto (Map) que se
	 * quiere insertar en dicho List, se pueden producir dos casos: 1) Que el objeto
	 * ya exista en el List: se actualiza el objeto existente con el pasado en el
	 * parámetro. 2) Que el objeto no exista en ninguna posición del List; si es
	 * así, lo insertamos al final.
	 * 
	 * @param listaObjetos   Un List conteniendo Objetos (Maps).
	 * @param objeto         El objeto a insertar / modificar en el List.
	 * @param nombreOuterMap El nombre del objeto Map que hay en cada posición del
	 *                       List, que encapsula otro objeto Map con los datos
	 *                       reales.
	 * @return List El List actualizado.
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected List setObjetoALista(List listaObjetos, Map objeto, String nombreOuterMap) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (objeto == null)
			throw new IllegalArgumentException("objeto no puede ser null.");

		if (!isEmpty(nombreOuterMap)) {
			// Reencapsulación del objeto dentro de su objeto contenedor
			Map outerMap = new HashMap();
			outerMap.put(nombreOuterMap, objeto);
			objeto = outerMap;
		}

		if (listaObjetos.contains(objeto))
			// Machacamos el objeto de la lista por el deseado
			listaObjetos.set(listaObjetos.indexOf(objeto), objeto);
		else
			// Si no existe en el List. Lo añadimos igualmente (al final).
			listaObjetos.add(objeto);

		return listaObjetos;
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos) y un objeto (Map) que se
	 * quiere quitar de dicho List, el método comprueba si existe el objeto en la
	 * lista y lo elimina.
	 * 
	 * @param listaObjetos Un List conteniendo Objetos (Maps).
	 * @param idObjeto     El id del objeto a eliminar de este List.
	 * @param nombreClave  El literal que identifica la clave (ejemplo, "idObjeto").
	 * @return Map El objeto eliminado (null si no se ha encontrado).
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected Map quitaObjetoDeLista(List listaObjetos, String idObjeto, String nombreClave) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		for (int i = 0; i < listaObjetos.size(); i++) {
			Map map = (Map) listaObjetos.get(i);
			Object idAComparar = getTipoAtributo(map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (((Integer) idAComparar).equals(Integer.valueOf(idObjeto))) {
					listaObjetos.remove(map);
					return map;
				}
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (((BigDecimal) idAComparar).equals(new BigDecimal(idObjeto))) {
					listaObjetos.remove(map);
					return map;
				}
			} else {
				// Por si la clave es un String
				if (((String) idAComparar).equals(idObjeto.trim())) {
					listaObjetos.remove(map);
					return map;
				}
			}
		}
		return null;
	}

	/**
	 * Dado un List de Objetos en session (listaObjetos) y un objeto (Map) que se
	 * quiere quitar de dicho List, el método comprueba si existe el objeto en la
	 * lista y lo elimina.
	 * 
	 * @param listaObjetos   Un List conteniendo Objetos (Maps).
	 * @param idObjeto       El id del objeto a eliminar de este List.
	 * @param nombreClave    El literal que identifica la clave (ejemplo,
	 *                       "idObjeto").
	 * @param nombreOuterMap El nombre del objeto Map que hay en cada posición del
	 *                       List, que encapsula otro objeto Map con los datos
	 *                       reales.
	 * @return Map El objeto eliminado (null si no se ha encontrado).
	 * @throws IllegalArgumentException si los argumentos pasados son nulos.
	 */
	protected Map quitaObjetoDeLista(List listaObjetos, String idObjeto, String nombreClave, String nombreOuterMap) {
		if (listaObjetos == null)
			throw new IllegalArgumentException("listaObjetos no puede ser null.");
		if (nombreClave == null)
			throw new IllegalArgumentException("nombreClave no puede ser null.");
		if (isEmpty(idObjeto))
			throw new IllegalArgumentException("idObjeto no puede ser null.");

		nombreClave = nombreClave.trim();
		idObjeto = idObjeto.trim();

		for (int i = 0; i < listaObjetos.size(); i++) {
			Map map = (Map) listaObjetos.get(i);

			Map map_map = (Map) map.get(nombreOuterMap);

			Object idAComparar = getTipoAtributo(map_map, nombreClave);

			if (idAComparar instanceof Integer) {
				// Por si la clave es un Integer
				if (((Integer) idAComparar).equals(Integer.valueOf(idObjeto))) {
					listaObjetos.remove(map_map);
					listaObjetos.remove(map);
					return map;
				}
			} else if (idAComparar instanceof BigDecimal) {
				// Por si la clave es un BigDecimal
				if (((BigDecimal) idAComparar).equals(new BigDecimal(idObjeto))) {
					listaObjetos.remove(map_map);
					listaObjetos.remove(map);
					return map;
				}
			} else {
				// Por si la clave es un String
				if (((String) idAComparar).equals(idObjeto.trim())) {
					listaObjetos.remove(map_map);
					listaObjetos.remove(map);
					return map;
				}
			}
		}
		return null;
	}

	/**
	 * Devuelve el Locale actual o, si no existe, el Locale por defecto.
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @return Locale
	 */
	public static Locale getLocale(HttpServletRequest request) {
		String localeString = (String) request.getSession().getAttribute(Constantes.LOCALE);
		if (localeString == null)
			localeString = ConversionUtil.getDefaultLocale();

		String language = localeString.split("_")[0];
		String country = localeString.split("_")[1];

		return new Locale(language, country);
	}

	/**
	 * Devuelve el NumberFormat tipo ###,###.##
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @return Locale
	 */
	protected static NumberFormat getNumberFormat(HttpServletRequest request) {
		NumberFormat nf = NumberFormat.getNumberInstance(getLocale(request));
		nf.setMinimumFractionDigits(2);
		nf.setMaximumFractionDigits(2);
		return nf;
	}

	/**
	 * Devuelve un String con una fecha formateada.
	 * 
	 * @param requestDate Un objeto Date a formatear.
	 * @param finalFormat El patrón o formato a aplicar, ex. "dd/MM/yyyy".
	 * @return Date La fecha formateada.
	 */
	public static String datePrintf(Date requestDate, String finalFormat) {
		SimpleDateFormat sdf = new SimpleDateFormat(finalFormat);
		return sdf.format(requestDate);
	}

	/**
	 * Devuelve un String con una fecha formateada estilo "dd/MM/yyyy".
	 * 
	 * @param requestDate Un objeto Date a formatear.
	 * @return Date La fecha formateada.
	 */
	public static String datePrintfddMMyyyy(Date requestDate) {
		return datePrintf(requestDate, "dd/MM/yyyy");
	}

	/**
	 * @deprecated - Ahora esto se controla des de
	 *             <code>AxisRequestProcessor</code>, al montar el formdata. Util
	 *             method para convertir las fechas del formdata a Date y que no
	 *             peten al mostrarlas en la JSP via JSTL.
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 * @param fechas  - Un array conteniendo los IDs de las fechas a formatear
	 * @throws Exception
	 */
	protected void actualizarFormatoFechas(HttpServletRequest request, String[] fechas) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		for (int i = 0; i < fechas.length; i++) {
			// La fecha debe ser Date, si no, peta el JSTL
			if (formdata.get(fechas[i]) instanceof String) {
				String fecha = (String) formdata.get(fechas[i]);
				if (!isEmpty(fecha)) {
					try {
						formdata.put(fechas[i], new SimpleDateFormat("dd/MM/yyyy").parse(fecha));
					} catch (Exception e) {
						// ParseException o similar
						continue;
					}
				}
			}
		}
	}

	/**
	 * Devuelve un booleano aleatorio
	 * 
	 * @return boolean
	 */
	protected static boolean randomBoolean() {
		return Math.random() >= 0.5;
	}

	/**
	 * Devuelve un char aleatorio
	 * 
	 * @return char
	 */
	protected static char randomChar() {
		return (char) random(0x41, 0x5a);
	}

	/**
	 * Devuelve un entero aleatorio entre min y maxis.
	 * 
	 * @param min   El número mínimo del intervalo a calcular.
	 * @param maxis El número máximo del intervalo a calcular.
	 * @return int
	 */
	protected static int random(int min, int maxis) {
		return (int) Math.floor(Math.random() * (maxis - min + 1)) + min;
	}

	/**
	 * Devuelve un entero aleatorio entre 0 y maxis.
	 * 
	 * @param maxis El número máximo del intervalo a calcular.
	 * @return int
	 */
	protected static int random(int maxis) {
		return random(0, maxis);
	}

	/**
	 * Devuelve un double aleatorio entre min y maxis.
	 * 
	 * @param min   El número mínimo del intervalo a calcular.
	 * @param maxis El número máximo del intervalo a calcular.
	 * @return double
	 */
	protected static double random(double min, double maxis) {
		return roundNum(Math.random() * (maxis - min + 1) + min);
	}

	/**
	 * Devuelve un double aleatorio entre 0.0 y maxis.
	 * 
	 * @param maxis El número máximo del intervalo a calcular.
	 * @return double
	 */
	protected static double random(double maxis) {
		return random(0.0, maxis);
	}

	/**
	 * Redondea un número a dos cifras decimales.
	 * 
	 * @param num El número a redondear.
	 * @return double
	 */
	protected static double roundNum(double num) {
		double valor = 0;
		valor = num;
		valor = valor * 100;
		valor = Math.round(valor);
		valor = valor / 100;

		return valor;
	}

	/**
	 * Comprueba que el String pasado no es nulo ni está en blanco.
	 * 
	 * @param s El String a comprobar.
	 * @return boolean True si es nulo o en blanco, False en otro caso.
	 */
	public static boolean isEmpty(String s) {
		return (s == null || s.equals(""));
	}

	/**
	 * Comprueba que la Collection pasada no es nula ni está vacía.
	 * 
	 * @param col La Collection a comprobar (List, ArrayList, Set...).
	 * @return boolean True si es nula o vacía, False en otro caso.
	 */
	public static boolean isEmpty(Collection col) {
		return (col == null || col.isEmpty());
	}

	/**
	 * Comprueba que el Map pasado no es nulo ni está vacío.
	 * 
	 * @param map El Map a comprobar (Map, HashMap...).
	 * @return boolean True si es nulo o vacío, False en otro caso.
	 */
	public static boolean isEmpty(Map map) {
		return (map == null || map.isEmpty());
	}

	/**
	 * Comprueba que el array pasado no es nulo ni está vacío.
	 * 
	 * @param object El Object[] a comprobar (String[], int[]...).
	 * @return boolean True si es nulo o vacío, False en otro caso.
	 */
	public static boolean isEmpty(Object[] object) {
		return (object == null || object.length == 0);
	}

	/**
	 * Comprueba que el Objeto pasado no es nulo ni está vacío. Estar vacío (no
	 * tener elmentos o valor) funciona para Collections, Maps o Strings. Para los
	 * demás objetos devuelve el resultado de la condición object == null.
	 * 
	 * @param object El objeto a comprobar.
	 * @return boolean True si es nulo o vacío, False en otro caso.
	 * @throws IllegalArgumentException si el argumento pasado es de tipo erróneo.
	 */
	public static boolean isEmpty(Object object) {
		if (object == null)
			return true;
		else if (object instanceof Collection)
			return isEmpty((Collection) object);
		else if (object instanceof Map)
			return isEmpty((Map) object);
		else if (object instanceof String)
			return isEmpty((String) object);
		else if (object instanceof String[])
			return isEmpty((String[]) object);
		else
			return false;
		/*
		 * throw new IllegalArgumentException("No puedo inspeccionar el valor de " +
		 * object +
		 * " para comprobar si está vacío. Tiene que ser un String, un BigDecimal, un Map o un Collection."
		 * );
		 */
	}

	/**
	 * Monta un ArrayList de 5 registros (HashMap's), con cada registro llaves como
	 * "campos", y cada valor asociado es una cadena de tipo "#__"+campos[j]
	 * 
	 * @param campos Lista de campos de retorna, por ejemplo 'new
	 *               String[]{"CPAIS","TPAIS"}'
	 * @return Mocked data
	 */
	public static ArrayList mockeddata(String[] campos) {
		return mockeddata(campos, 5);
	}

	/**
	 * Monta un ArrayList de n (n=parametro "registros") registros (HashMap's), con
	 * cada registro llaves como "campos", y cada valor asociado es una cadena de
	 * tipo "#__"+campos[j]
	 * 
	 * @param campos    Lista de campos de retorna, por ejemplo 'new
	 *                  String[]{"CPAIS","TPAIS"}'
	 * @param registros Numero de registros a producir
	 * @return Mocked data
	 */
	public static ArrayList mockeddata(String[] campos, int registros) {
		ArrayList retVal = new ArrayList();
		HashMap m = null;
		for (int i = 0; i < registros; i++) {
			m = new HashMap();
			for (int j = 0; j < campos.length; j++) {
				m.put(campos[j], "" + (j + 1) + "__" + campos[j]);
			}
			retVal.add(m);
		}
		return retVal;
	}

	/**
	 * pasa un string a un java.sql.Date - se ha de informar el formato de la fecha
	 * "string"
	 * 
	 * @param value   String que queremos convertir
	 * @param formato Formato de la fecha que representa el String
	 * @return El valor de java.sql.Date
	 */
	public static java.sql.Date stringToSqlDate(String value, String formato) {
		java.sql.Date retVal = null;

		try {
			if (value != null)
				retVal = new java.sql.Date(new SimpleDateFormat(formato).parse(value).getTime());
		} catch (Exception e) {
			throw new IllegalArgumentException(
					"AxisBaseService->stringToSqlDate: El valor que quieres pasar como java.sql.Date no puede convertirse como tal");
		} finally {
			return retVal;
		}
	}

	/**
	 * pasa un string a un java.sql.Date El formato que se asume para el String de
	 * entrada es dd/MM/yyyy
	 * 
	 * @param value String que queremos convertir
	 * @return El valor de java.sql.Date
	 */
	public static java.sql.Date stringToSqlDate(String value) {
		return stringToSqlDate(value, "dd/MM/yyy");
	}

	/**
	 * Pasa un string a un BigDecimal.
	 * 
	 * @param value String que queremos convertir
	 * @return El valor de BigDecimal
	 */
	public static BigDecimal stringToBigDecimal(String value) {
		return stringToBigDecimal(value, null);
	}

	/**
	 * Pasa un string a un BigDecimal. Si no hay valor, le pasamos un valor
	 * alternativo
	 * 
	 * @param value    String que queremos convertir
	 * @param valueAlt String alternativo->Puede ser null o un valor numérico
	 * @return El valor de BigDecimal
	 */
	public static BigDecimal stringToBigDecimal(String value, String valueAlt) {
		BigDecimal realValue = null;
		BigDecimal emptyValue = null;

		try {
			if (value != null)
				realValue = new BigDecimal(value);
			if (valueAlt != null)
				emptyValue = new BigDecimal(valueAlt);
		} catch (Exception e) {
			throw new IllegalArgumentException(
					"AxisBaseService->stringToBigDecimal: El valor que quieres pasar como BigDecimal no puede convertirse como tal");
		} finally {
			return ((isEmpty(realValue)) ? emptyValue : realValue);
		}
	}

	/**
	 * Pasa un BigDecimal a un String.
	 * 
	 * @param value BigDecimal que queremos convertir
	 * @return El valor de String final
	 */
	public static String bigDecimalToString(BigDecimal value) {
		return bigDecimalToString(value, null);
	}

	/**
	 * Pasa un BigDecimal a un String. Si no hay valor, le pasamos un valor
	 * alternativo
	 * 
	 * @param value    Bigdecimal que queremos convertir
	 * @param valueAlt Bigdecimal alternativo->Puede ser null o un valor numérico
	 * @return El valor de String final.
	 */
	public static String bigDecimalToString(BigDecimal value, BigDecimal valueAlt) {
		String realValue = null;
		String emptyValue = null;

		try {
			if (!isEmpty(value))
				realValue = value.toString();
			if (!isEmpty(valueAlt))
				emptyValue = valueAlt.toString();
		} catch (Exception e) {
			throw new IllegalArgumentException(
					"AxisBaseService->bigDecimalToString: El valor que quieres pasar como String no puede convertirse como tal");
		} finally {
			return ((isEmpty(realValue)) ? emptyValue : realValue);
		}
	}

	/**
	 * Recupera un campo numérico de formdata, lo formatea, y lo intenta encapsular
	 * dentro de un BigDecimal.
	 * 
	 * @param request   El HttpServletRequest que contiene la petición del cliente
	 *                  web.
	 * @param fieldName El nombre del campo del formulario cuyo atributo queremos
	 *                  recuperar.
	 * @return El BigDecimal conteniendo el número, o null si no se puede recuperar
	 *         o parsear el número.
	 */
	public static BigDecimal getCampoNumerico(HttpServletRequest request, String fieldName) {
		String localeNumerico = ((isEmpty(request.getSession().getAttribute(Constantes.LOCALENUMERICO))) ? "EUR"
				: (String) request.getSession().getAttribute(Constantes.LOCALENUMERICO));
		if (isEmpty(fieldName))
			return null;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		String field = null;

		/** 10/09/2008 para evitar ClassCastException */
		if (formdata.get(fieldName) instanceof String) {
			field = (String) formdata.get(fieldName);
		} else if (formdata.get(fieldName) instanceof java.math.BigDecimal) {
			return (BigDecimal) formdata.get(fieldName); // Se devuelve directamente ya que es lo que queremos!
		} else
			return null;

		field = field.trim();
		field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ".", "")
				: StringUtils.replace(field, ",", ""));
		field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ",", ".")
				: StringUtils.replace(field, ".", "."));

		try {
			formdata.put(fieldName, new BigDecimal(field));
			return new BigDecimal(field);
		} catch (NumberFormatException e) {
			return null;
		}
	}

	/**
	 * Método que comprueba que, si un valor de campo devuelto en una request de
	 * pantalla devuelve null, miramos su equivalente en session. Puede darse el
	 * caso que, en la pantalla, el campo esté desactivado (disabled) y no podamos
	 * recuperar su valor en request. En tal caso, debemos guardar el mismo valor en
	 * session, al cargar los datos en m_form y recuperarlos utilizando este método.
	 * 
	 * @param request
	 * @param fieldName
	 * @param sessionAttributeName
	 * @return
	 */
	public static BigDecimal getSessionCampoNumerico(HttpServletRequest request, String fieldName,
			String sessionAttributeName) {
		BigDecimal valorCampo = getCampoNumerico(request, fieldName);
		try {
			// En el caso que queramos responder a la pregunta como nulo miraremos si el
			// campo existe,
			// se hace ya que si respondemos una pregunta y grabamos, la segunda vez que
			// intentemos grabar con un nulo
			// no nos dejaba ya que siempre miraba que el parametro no fuera nulo y cogia el
			// campo de session
			if (request.getParameter(fieldName) != null && request.getParameter(fieldName).length() == 0) {
				return valorCampo;
			}

			return ((isEmpty(valorCampo))
					? (BigDecimal) ((Map) request.getSession().getAttribute(sessionAttributeName)).get(fieldName)
					: valorCampo);
		} catch (Exception es) {
			return null;
		}

	}

	public static BigDecimal getSessionCampoNumericoProvisional(HttpServletRequest request, String fieldName,
			String sessionAttributeName) {
		BigDecimal valorCampo = getCampoNumerico(request, fieldName);
		try {
			// En el caso que queramos responder a la pregunta como nulo miraremos si el
			// campo existe,
			// se hace ya que si respondemos una pregunta y grabamos, la segunda vez que
			// intentemos grabar con un nulo
			// no nos dejaba ya que siempre miraba que el parametro no fuera nulo y cogia el
			// campo de session

			if (request.getParameter(fieldName).getClass() != null) { // LCF &&
																		// request.getParameter(fieldName).length()==0
				return valorCampo;
			} else { // LCF
				return (BigDecimal) ((Map) request.getSession().getAttribute(sessionAttributeName)).get(fieldName);
			}

			// LCF return ((isEmpty(valorCampo)) ?
			// (BigDecimal)((Map)request.getSession().getAttribute(sessionAttributeName)).get(fieldName)
			// : valorCampo);
		} catch (Exception es) {
			return null;
		}

	}

	/**
	 * Método que comprueba que, si un valor de campo devuelto en una request de
	 * pantalla devuelve null, miramos su equivalente en un hidden creado para la
	 * ocasión. Puede darse el caso que, en la pantalla, el campo esté desactivado
	 * (disabled) y no podamos recuperar su valor en request. En tal caso, debemos
	 * guardar el mismo valor en un hidden, al cargar los datos en m_form y
	 * recuperarlos utilizando este método.
	 * 
	 * @param request
	 * @param fieldName
	 * @return
	 */
	public static BigDecimal getHiddenCampoNumerico(HttpServletRequest request, String fieldName) {
		BigDecimal valorCampo = getCampoNumerico(request, fieldName);

		try {
			return ((isEmpty(valorCampo)) ? getCampoNumerico(request, fieldName + "_MODIFVISIBLE") : valorCampo);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * Recupera un campo textual (no numérico) de formdata y lo encapsula dentro de
	 * un String.
	 * 
	 * @param request   El HttpServletRequest que contiene la petición del cliente
	 *                  web.
	 * @param fieldName El nombre del campo del formulario cuyo atributo queremos
	 *                  recuperar.
	 * @return El String conteniendo el número, o null si no se puede recuperar el
	 *         campo o está en blanco.
	 */
	public static String getCampoTextual(HttpServletRequest request, String fieldName) {
		if (isEmpty(fieldName))
			return null;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		String field = null;
		if (formdata.get(fieldName) instanceof String) {
			field = (String) formdata.get(fieldName);
		} else if (formdata.get(fieldName) instanceof java.util.Date) {
			field = datePrintfddMMyyyy((java.util.Date) formdata.get(fieldName));
		}

		if (isEmpty(field) || field.equalsIgnoreCase("null"))
			return null;

		field = field.trim();

		return field;

		/*
		 * try { byte[] bytes = field.getBytes("ISO-8859-1"); return new String(bytes,
		 * "UTF-8"); } catch (UnsupportedEncodingException e) { return field; }
		 */
	}

	/**
	 * Método que comprueba que, si un valor de campo devuelto en una request de
	 * pantalla devuelve null, miramos su equivalente en session. Puede darse el
	 * caso que, en la pantalla, el campo esté desactivado (disabled) y no podamos
	 * recuperar su valor en request. En tal caso, debemos guardar el mismo valor en
	 * session, al cargar los datos en m_form y recuperarlos utilizando este método.
	 * 
	 * @param request
	 * @param fieldName
	 * @param sessionAttributeName
	 * @return
	 */
	public static String getSessionCampoTextual(HttpServletRequest request, String fieldName,
			String sessionAttributeName) {
		String valorCampo = getCampoTextual(request, fieldName);

		try {
			return ((isEmpty(valorCampo))
					? (String) ((Map) request.getSession().getAttribute(sessionAttributeName)).get(fieldName)
					: valorCampo);
		} catch (Exception e) {
			return null;
		}
	}

	public static String getSessionCampoTextualProvisional(HttpServletRequest request, String fieldName,
			String sessionAttributeName) {
		String valorCampo = getCampoTextual(request, fieldName);
		try {
			// En el caso que queramos responder a la pregunta como nulo miraremos si el
			// campo existe,
			// se hace ya que si respondemos una pregunta y grabamos, la segunda vez que
			// intentemos grabar con un nulo
			// no nos dejaba ya que siempre miraba que el parametro no fuera nulo y cogia el
			// campo de session
			if (request.getParameter(fieldName).getClass() != null) { // LCF &&
																		// request.getParameter(fieldName).length()==0
				return valorCampo;
			} else { // LCF
				return (String) ((Map) request.getSession().getAttribute(sessionAttributeName)).get(fieldName);
			}

			// LCF return ((isEmpty(valorCampo)) ?
			// (BigDecimal)((Map)request.getSession().getAttribute(sessionAttributeName)).get(fieldName)
			// : valorCampo);
		} catch (Exception es) {
			return null;
		}
	}

	/**
	 * Método que comprueba que, si un valor de campo devuelto en una request de
	 * pantalla devuelve null, miramos su equivalente en un hidden creado para la
	 * ocasión. Puede darse el caso que, en la pantalla, el campo esté desactivado
	 * (disabled) y no podamos recuperar su valor en request. En tal caso, debemos
	 * guardar el mismo valor en un hidden, al cargar los datos en m_form y
	 * recuperarlos utilizando este método.
	 * 
	 * @param request
	 * @param fieldName
	 * @return
	 */
	public static String getHiddenCampoTextual(HttpServletRequest request, String fieldName) {
		String valorCampo = getCampoTextual(request, fieldName);

		try {
			return ((isEmpty(valorCampo)) ? getCampoTextual(request, fieldName + "_MODIFVISIBLE") : valorCampo);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * Realiza una ordenación ascendente o descendiente según convenga, de una tabla
	 * a partir de un campo (parámetro de request "campo" y un outerMap (parámetro
	 * de request "outerMap"). Éste método es llamado desde
	 * <code>gestionarOrdenacionTablas(request)</code>.
	 * 
	 * Ejemplo: En axisctr_tomadores.OB_IAX_TOMADORES.SPERSON, - axisctr_tomadores
	 * es la tabla en sesión o request a ordenar (requestParam "tabla") -
	 * OB_IAX_TOMADORES es el Map de cada posición que contiene los atributos
	 * (requestParam "outerMap"), este "outerMap" es opcional. - SPERSON es el campo
	 * o atributo a partir del cual se quiere ordenar (requestParam "campo).
	 * 
	 * @param request     El HttpServletRequest que contiene la petición del cliente
	 *                    web.
	 * @param nombreTabla El nombre de la tabla
	 * @param scope       El scope o ámbito donde se encuentra la tabla ("request" o
	 *                    "session").
	 */
	protected void ordenarTabla(HttpServletRequest request, String nombreTabla, String scope) {

		/* **********************************/
		/* *** INNER CLASSES COMPARADORAS ***/
		/* **********************************/

		/**
		 * Comparador propio para ordenar una tabla en orden natural.
		 */
		class ComparadorOrdenNatural implements Comparator {
			String campo;
			String outerMap;

			ComparadorOrdenNatural(String campo, String outerMap) {
				this.campo = campo;
				this.outerMap = outerMap;
			}

			public int compare(Object o1, Object o2) {
				try {
					if (isEmpty(campo)) {
						return o1.toString().compareTo(o2.toString());
					} else {
						Map map1 = (Map) o1;
						Map map2 = (Map) o2;

						if (!isEmpty(outerMap)) {
							map1 = (Map) map1.get(outerMap);
							map2 = (Map) map2.get(outerMap);
						}

						if (map1.get(campo) == null)
							return -1;
						else if (map2.get(campo) == null)
							return 1;
						else if (map1.get(campo) instanceof Comparable && map2.get(campo) instanceof Comparable)
							return ((Comparable) map1.get(campo)).compareTo(map2.get(campo));
						else
							return map1.get(campo).toString().compareTo(map2.get(campo).toString());
					}
				} catch (Exception e) {
					return 0;
				}
			}
		}

		/**
		 * Comparador propio para ordenar una tabla en orden inverso al natural.
		 */
		class ComparadorOrdenInverso implements Comparator {
			String campo;
			String outerMap;

			ComparadorOrdenInverso(String campo, String outerMap) {
				this.campo = campo;
				this.outerMap = outerMap;
			}

			public int compare(Object o1, Object o2) {
				try {
					if (isEmpty(campo)) {
						return o2.toString().compareTo(o1.toString());
					} else {
						Map map1 = (Map) o1;
						Map map2 = (Map) o2;

						if (!isEmpty(outerMap)) {
							map1 = (Map) map1.get(outerMap);
							map2 = (Map) map2.get(outerMap);
						}

						if (map1.get(campo) == null)
							return 1;
						else if (map2.get(campo) == null)
							return -1;
						else if (map1.get(campo) instanceof Comparable && map2.get(campo) instanceof Comparable)
							return ((Comparable) map2.get(campo)).compareTo(map1.get(campo));
						else
							return map2.get(campo).toString().compareTo(map1.get(campo).toString());
					}
				} catch (Exception e) {
					return 0;
				}
			}
		}

		/* ********************************/
		/* *** INICIO CUERPO DEL MÉTODO ***/
		/* ********************************/

		List tabla = null;
		if (scope == null || scope.trim().equalsIgnoreCase("session"))
			tabla = ((List) request.getSession().getAttribute(nombreTabla));
		else if (scope.trim().equalsIgnoreCase("request"))
			tabla = ((List) request.getAttribute(nombreTabla));

		if (!isEmpty(tabla)) {
			try {
				if (request.getParameterValues("campo") == null)
					return;

				String campo = request.getParameterValues("campo")[request.getParameterValues("campo").length - 1];

				String outerMap = "";
				if (request.getParameterValues("outerMap") != null)
					outerMap = request.getParameterValues("outerMap")[request.getParameterValues("outerMap").length
							- 1];

				String sTablaCampoOrden = "axis_ordenacion_" + nombreTabla + "_" + campo + "_order";
				Boolean tablaCampoOrden = (Boolean) request.getSession().getAttribute(sTablaCampoOrden);

				if (request.getSession().getAttribute(sTablaCampoOrden) == null) {
					// Realizaremos una comparación entre el primer elemento y el último,
					// para ver en qué orden está la tabla
					int orden;
					Object o1 = tabla.get(0);
					Object o2 = tabla.get(tabla.size() - 1);

					Map map1 = (Map) o1;
					Map map2 = (Map) o2;

					if (!isEmpty(outerMap)) {
						map1 = (Map) map1.get(outerMap);
						map2 = (Map) map2.get(outerMap);
					}

					if (map1.get(campo) == null)
						orden = -1;
					else if (map2.get(campo) == null)
						orden = 1;
					else if (map1.get(campo) instanceof Comparable && map2.get(campo) instanceof Comparable)
						orden = ((Comparable) map1.get(campo)).compareTo(map2.get(campo));
					else
						orden = map1.get(campo).toString().compareTo(map2.get(campo).toString());

					// Establecemos el parámetro de ordenación en función del orden inicial
					// Si orden > 0, está ordenada de forma descendiente. Por tanto, hay que
					// ordenar de forma ascendiente (true).
					// Si orden < 0, está ordenada de forma ascendiente. Por tanto, hay que
					// ordenar de forma descendiente (false).
					// Si orden = 0, es igual como ordenemos la tabla (todos sus elementos tienen el
					// mismo valor)
					tablaCampoOrden = Boolean.valueOf(orden > 0);
				}

				if (tablaCampoOrden.equals(Boolean.valueOf(true)))
					Collections.sort(tabla, new ComparadorOrdenNatural(campo, outerMap));
				else if (tablaCampoOrden.equals(Boolean.valueOf(false)))
					Collections.sort(tabla, new ComparadorOrdenInverso(campo, outerMap));

				if ("request".equals(scope)) {
					// Invertir parámetro de orden en sesión
					request.getSession().setAttribute(sTablaCampoOrden,
							Boolean.valueOf(!tablaCampoOrden.booleanValue()));
				}

			} catch (Exception e) {
				logger.debug("Error en la ordenación de la tabla " + nombreTabla + ": " + e);
				return;
			}
		}
	}

	/**
	 * Recupera los parámetros de request "paginar" y "ordenar". Si existe el
	 * primero, almacenamos el nombre de la tabla a ordenar (parámetro de request
	 * "tabla") y lo ponemos de nuevo en request por si lo necesitamos de retorno en
	 * la JSP (nombre de atributo "tabla_ordenada"). Si el parámetro es "ordenar",
	 * además de lo anterior, ordena la tabla de forma personalizada con una llamada
	 * a <code>ordenarTabla()</code>;
	 * 
	 * A parte de "paginar" y "ordenar", tenemos que tener los siguientes parámetros
	 * de request:
	 * 
	 * Ejemplo: En axisctr_tomadores.OB_IAX_TOMADORES.SPERSON, - axisctr_tomadores
	 * es la tabla en sesión o request a ordenar (requestParam "tabla") -
	 * OB_IAX_TOMADORES es el Map de cada posición que contiene los atributos
	 * (requestParam "outerMap"), este "outerMap" es opcional. - SPERSON es el campo
	 * o atributo a partir del cual se quiere ordenar (requestParam "campo).
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	protected void gestionarOrdenacionTablas(HttpServletRequest request) {
		String nombreTabla = null;
		if (request.getParameterValues("paginar") != null && "true"
				.equals(request.getParameterValues("paginar")[request.getParameterValues("paginar").length - 1])) {
			// "Paginar" significa que la tabla se representa en un displaytag
			// Hacemos getParameterValues() porque el mecanismo de displaytag va añadiendo
			// los parémtros
			// paginar y tabla a los request parameters, sin sobreescribirlos.
			// Ej: &paginar=true&paginar=true&tabla=una_tabla&tabla=otra_tabla
			// Por tanto, debemos coger el último parámetro "paginar" y el último "tabla"
			try {
				nombreTabla = request.getParameterValues("tabla")[request.getParameterValues("tabla").length - 1];
			} catch (Exception e) {
				nombreTabla = null;
			}
		} else if (request.getParameterValues("paginar") != null && "false"
				.equals(request.getParameterValues("paginar")[request.getParameterValues("paginar").length - 1])) {
			// Do nothing, pero no saltar al siguiente caso
			// El parámetro "ordenar" estará presente si se ha ordenado antes una tabla tipo
			// <axis:tabla>
			// Y no nos interesa pasar por aquí
		} else if (request.getParameterValues("ordenar") != null && "true"
				.equals(request.getParameterValues("ordenar")[request.getParameterValues("ordenar").length - 1])) {
			// "Ordenar" significa que es un <axis:tabla>, no un displaytag
			// Por tanto tenemos que llamar al método de ordenación propio
			nombreTabla = request.getParameterValues("tabla")[request.getParameterValues("tabla").length - 1];
			// Donde está la tabla?
			String scope = request.getAttribute(nombreTabla) != null ? "request" : "session";

			// Llamar a método de ordenación
			ordenarTabla(request, nombreTabla, scope);
		}

		if (!isEmpty(nombreTabla)) {
			// Traspasar el nombre de la tabla a la JSP
			// Para poder "desplegar" la sección que estamos paginando
			request.setAttribute("tabla_ordenada", nombreTabla);
		}
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SEGURO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_questsalud(HttpServletRequest request, BigDecimal SSEGURO, BigDecimal NRIESGO,
			String NOMFITXER) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));

		String PMODO = "EST";
		if (!isEmpty(VMODO)) {
			if (VMODO.equals(new String("ALTA_POLIZA")))
				PMODO = "EST";
			else
				PMODO = "POL";
		}
		;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_GET_QUESTSALUD(SSEGURO, NRIESGO, NOMFITXER, PMODO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_ListComi(HttpServletRequest request, BigDecimal CEMPRES, BigDecimal CPROCES,
			BigDecimal CAGENTE, String NOMFITXER) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		/*
		 * String VMODO=String.valueOf(AbstractDispatchAction.topPila(request,
		 * "CMODO"));
		 * 
		 * String PMODO="EST"; if (!isEmpty(VMODO)) { if (VMODO.equals(new
		 * String("ALTA_POLIZA"))) PMODO="EST";9- else PMODO="POL"; };
		 */

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_GET_LISTCOMI(CEMPRES, CPROCES, CAGENTE, NOMFITXER); // posaba MODO
																										// despres de
																										// FITXER
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}
	// etm ini

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param SSEGURO
	 * @param SIDEPAG
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_pagosini(HttpServletRequest request, BigDecimal SSEGURO, BigDecimal SIDEPAG,
			String CTIPO, BigDecimal CCAUSIN, BigDecimal CMOTSIN) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		// ETM NUEVOS PARAMETROS
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_PAGO(SSEGURO, SIDEPAG, CTIPO, CCAUSIN, CMOTSIN);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}
	// etm fin

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param NSINIES
	 * @param NTRAMIT
	 * @param CESTADO
	 * @param CTIPO
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_trami(HttpServletRequest request, String NSINIES, BigDecimal NTRAMIT,
			BigDecimal CESTADO, String TIPO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		// ETM NUEVOS PARAMETROS
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_TRAMI(NSINIES, NTRAMIT, CESTADO, TIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_Recibo(HttpServletRequest request, BigDecimal NRECIBO, BigDecimal NDOCUME,
			BigDecimal SEGURO, String CTIPO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RECIBO(NRECIBO, NDOCUME, SEGURO, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList impresion_traspas(HttpServletRequest request, BigDecimal STRASPAS, BigDecimal SEGURO,
			String CTIPO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_TRASPAS(STRASPAS, SEGURO, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	public static void formattingNumericValues(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Enumeration enumera = request.getParameterNames();
		while (enumera.hasMoreElements()) {
			String fieldName = (String) enumera.nextElement();
			String[] todos_valores = request.getParameterValues(fieldName);
			for (int i = 0; i < todos_valores.length; i++) {
				String fieldValue = todos_valores[i];
				if (!isEmpty(fieldValue)) {
					if (fieldValue.indexOf(".") >= 0 || fieldValue.indexOf(",") >= 0) {
						if (!isEmpty(getCampoFormateado(request, fieldValue))) {
							if (i == 0)
								formdata.put(fieldName, getCampoFormateado(request, fieldValue));
							else
								formdata.put(fieldName + "__" + i, getCampoFormateado(request, fieldValue));
						}
					}
				}
			}
		}
	}

	private static BigDecimal getCampoFormateado(HttpServletRequest request, String field) {
		String localeNumerico = ((isEmpty(request.getSession().getAttribute(Constantes.LOCALENUMERICO))) ? "EUR"
				: (String) request.getSession().getAttribute(Constantes.LOCALENUMERICO));
		try {
			field = field.trim();
			field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ".", "")
					: StringUtils.replace(field, ",", ""));
			field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ",", ".")
					: StringUtils.replace(field, ".", "."));
			return new BigDecimal(field);
		} catch (NumberFormatException e) {
			return null;
		}
	}

	/*
	 * Función para cargar los estandards del aplicativo
	 */

	protected void f_Cargar_Propiedades_Pantalla(HttpServletRequest request, String whoami) {
		this.configForm(request, whoami);
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}
	/*
	 * Metodo para poder filtrar la consulta por oficina según los campos
	 * configurados en la cfg_form_property. Si uno de ellos esta lleno o no hay
	 * cfg's con esta propiedad (10) se hará el filtro por RedComercial en caso
	 * contrario se hará el filtro exclusivo por oficina XPL
	 */

	protected BigDecimal getFiltro(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			ArrayList<HashMap> lstFiltro = (ArrayList<HashMap>) request.getAttribute("filtro");

			if (isEmpty(lstFiltro))
				lstFiltro = (ArrayList<HashMap>) request.getSession().getAttribute("filtro");
			if (!isEmpty(lstFiltro)) {
				for (HashMap filtro : lstFiltro) {
					BigDecimal valor = new BigDecimal(String.valueOf(filtro.get("VALOR")));
					if (!isEmpty(valor) && valor.intValue() == 1) {

						if (!this.esVacio(request, (String) filtro.get("CAMPOID"))) {
							return new BigDecimal(1); // Funcionamiento Normal por Redcomercial
						}

					}
				}
			} else {
				// Cuando no tengmos configuraciones devovleremos un 1 para que tenga el
				// funcionamiento normal
				return new BigDecimal(1); // Funcionamiento Normal por Redcomercial
			}

			return new BigDecimal(0); // Restricción por Oficina

		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return new BigDecimal(1);
		}
	}

	private boolean esVacio(HttpServletRequest request, String fieldName) {

		if (isEmpty(this.getCampoNumerico(request, fieldName)) && isEmpty(this.getCampoTextual(request, fieldName))) {
			return true;
		}
		return false;

	}
	/*
	 * Función que llena en un string todos los parametros de la request
	 */

	protected String getInfoStringConcatenar(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	/*
	 * Función para cargar los avisos
	 */

	protected HashMap f_Get_Avisos(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			// se ha detectado que a veces llega el literal "null" en el modo
			if (CMODO != null && CMODO.equalsIgnoreCase("null")) {
				CMODO = null;
			}
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			String pparams = this.getInfoStringConcatenar(request);
			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			if (VisibleTag.esComponenteVisibleDefectoNoVer(request, whoami.toLowerCase(), "ALERT_WARNS")) {
				if (!isEmpty(m.get("MENSAJES"))) {
					m.put("RETURN", new BigDecimal(1));
				}
			}

			/*
			 * BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,m);
			 * 
			 * if (pRETURN != null) {
			 * request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS")); }
			 */
			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos " + whoami + " ha causado un error", e);
			return null;
		}

	}

	protected HashMap f_Get_Avisos(HttpServletRequest request, String whoami, String modo) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO;
			if (isEmpty(modo))
				CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			else
				CMODO = modo;

			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			String pparams = this.getInfoStringConcatenar(request);
			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos " + whoami + " ha causado un error", e);
			return null;
		}

	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList impresion_preavisos(HttpServletRequest request, BigDecimal CSPROCES, String CTIPO)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CARTASPREAVISOS(CSPROCES, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_proceso(HttpServletRequest request, BigDecimal SPROCES, String CTIPO)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES(SPROCES, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/**
	 * Retorna el objeto Java de java.io.File si un fichero obtenido por
	 * f_axis_imprimir de veras existe, se generado, se puede acceder y leer
	 * 
	 * @param request
	 * @param CPROCES
	 * @param CAGENTE
	 * @param CEMPRES
	 * @return
	 * @throws Exception
	 */
	protected ArrayList imprimir_renovcero(HttpServletRequest request, BigDecimal SEGURO, String CTIPO)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_RENOVCERO(SEGURO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolvera lista de ficheros - Cuando exista error, se enviara
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	/*
	 * Obtiene la IP del cliente dado un request. Intenta obtenerlo de diferentes
	 * cabeceras HTTP ya que no todos los routers lo ponen en la misma TODO:
	 * recortar a 50 ya que esto acaba en una tabla LOG_CONEXIONES Mejor truncar
	 * aqui o en el insert de PAC_LOGIN
	 */
	public static String getClientIp(HttpServletRequest request) {
		String[] headers = { "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR", "HTTP_X_FORWARDED", "HTTP_X_CLUSTER_CLIENT_IP",
				"HTTP_FORWARDED_FOR", "HTTP_FORWARDED", "REMOTE_ADDR" };
		Set<String> ips = new HashSet<String>();
		ips.add(request.getRemoteHost());
		for (String header : headers) {
			String val = request.getHeader(header);
			if (val != null && !val.equals("")) {
				ips.add(val);
			}
		}
		String ret = "";
		for (String ip : ips) {
			ret += ip + "-";
		}
		return ret.endsWith("-") ? ret.substring(0, ret.length() - 1) : "";
	}

	protected ArrayList imprimir_proceso_compania(HttpServletRequest request, BigDecimal SPROCES, BigDecimal CCOMPANI,
			String CTIPO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SPROCES_CCOMPANI(SPROCES, CCOMPANI, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	protected ArrayList imprimir_referencia_deposito(HttpServletRequest request, BigDecimal REFDEPOSTO, String CTIPO)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_CASHDESK(REFDEPOSTO, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");
				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	// CTIPO, SSEGURO NSINIES, NTRAMIT, SIDEPAG
	protected ArrayList imprimir_sinies_soldoc(HttpServletRequest request, BigDecimal CTIPO, BigDecimal SSEGURO,
			String NSINIES, BigDecimal NTRAMIT, BigDecimal SIDEPAG) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;
		// ETM NUEVOS PARAMETROS
		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SINIES_SOLDOC(CTIPO, SSEGURO, NSINIES, NTRAMIT, SIDEPAG);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverá lista de ficheros - Cuando exista error, se enviará
		// que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");

				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}

	// TCS_19 - ACL - 11/03/2019 - INICIO IMPRESION PAGARES CONTRAGARANTIAS
	protected ArrayList imprimir_pagare(HttpServletRequest request, BigDecimal SCONTGAR, String CTIPO)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);

		PAC_IAX_IMPRESION impresion = new PAC_IAX_IMPRESION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap m = null;

		m = impresion.ejecutaPAC_IAX_IMPRESION__F_IMPRIMIR_SCONTGAR(SCONTGAR, CTIPO);
		ArrayList lista = (ArrayList) this.tratarRETURNyMENSAJES(request, m);

		File f = null;

		// TODO:Siempre se devolverÃ¡ lista de ficheros - Cuando exista error, se
		// enviarÃ¡ que la
		// poliza ha sido retenida igualmente

		if (lista != null) {

			// ecg20120118 hagamos un retoque del valor FICHERO, considerando el SO
			HashMap miMap = null;
			String miFICHERO = null;
			for (int i = 0; i < lista.size(); i++) {
				miMap = (HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION");
				miFICHERO = (String) miMap.get("FICHERO");
				if (miFICHERO != null) {
					miFICHERO = StringUtils.replace(miFICHERO, SOSLASH_MALO, SOSLASH);
					((HashMap) ((HashMap) lista.get(i)).get("OB_IAX_IMPRESION")).put("FICHERO", miFICHERO);
				}
			}

			for (int i = 0; i < lista.size(); i++) {
				String path = (String) ((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).get("FICHERO");
				f = new File(path);
				if (f.exists()) {
					((Map) ((Map) lista.get(i)).get("OB_IAX_IMPRESION")).put("FILE", f);
					if (f.canRead()) {
						// OK!
					} else {
						AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_READ" },
								Constantes.MENSAJE_ERROR);
					}
				} else {
					AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { "NO_EXISTS" },
							Constantes.MENSAJE_ERROR);
				}
			}
		}

		return lista;
	}
	// TCS_19 - ACL - FIN IMPRESION PAGARE CONTRAGARANTIA

}
