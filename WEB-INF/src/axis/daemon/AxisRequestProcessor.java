//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.daemon;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.RequestProcessor;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LOGIN;
import axis.jdbc.PAC_IAX_MENU;
import axis.jdbc.PAC_PERSISTENCIA;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.FlujodetrabajoService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class AxisRequestProcessor extends RequestProcessor {
	static Log logger = LogFactory.getLog(AxisRequestProcessor.class);

	public AxisRequestProcessor() {
		super();
	}

	public void injectConnection(HttpServletRequest request) { // WLX//AXIS-WLS2CLUSTER-Ready

		java.sql.Connection conn = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
		try {
			if (conn == null) {
				UsuarioBean usuario = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
				if (usuario != null) {

					if (usuario.getPool().intValue() == 1) { // pool
						// AXIS-WLS2CLUSTER-Ready:...probamos con la
						// funcionalidad nueva de recuperar conexiones
						conn = ConexionFactoria.getConnectionFase2Session("db01", usuario.getUsuario(),
								request.getSession().getId());
						request.setAttribute("ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO", true);
					} else { // exclusiva
								// AXIS-WLS2CLUSTER-Ready:...probamos con la
								// funcionalidad nueva de recuperar conexiones

						conn = ConexionFactoria.getConnectionFase2Directo("db01", usuario.getCusuariodb(),
								usuario.getPassworddb());
						usuario.alimentarOwnerdata(usuario.getCusuariodb().toUpperCase(),
								(ArrayList) new SINPAQUETE(conn).ejecutaF_IAX_OWNEROBJ().get("RETURN"));
						PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(conn);
						pacIaxLogin.ejecutaPAC_IAX_LOGIN__P_IAX_INICONNECT(usuario.getUsuario()); // ,this.cidioma,this.cagente,this.cempres);
						PAC_PERSISTENCIA pacPersistencia = new PAC_PERSISTENCIA(conn);
						pacPersistencia.ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO(request.getSession().getId());
						request.setAttribute("ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO", true);

					}
					HashMap m = new PAC_IAX_COMMON(conn).ejecutaPAC_IAX_COMMON__F_GET_ENTORNO();
					usuario.setEntorno((String) m.get("RETURN"));
				} else {
					conn = ConexionFactoria.getConnection("db01");
				}

				request.setAttribute(Constantes.DB01CONN, conn);

			}
		} catch (Exception e) {
			logger.error("No se ha pdodio inyectar la ocnexion a la BBDD db01", e);
		}
	}

	public void extractConnection(HttpServletRequest request) { // WLX//AXIS-WLS2CLUSTER-Ready
		java.sql.Connection conn = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
			if (usuario != null && request.getAttribute("ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO") != null) {
				if ((Boolean) request.getAttribute("ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO")) {
					PAC_PERSISTENCIA pacPersistencia = new PAC_PERSISTENCIA(conn);
					pacPersistencia.ejecutaPAC_PERSISTENCIA__F_GUARDAR_CONTEXTO(request.getSession().getId());
				}

			}
		} catch (Exception e) {
			logger.warn("extractConnection no ha podido extraer la conexion de la request:" + e);
		}
		ConexionFactoria.closeConnection(conn);
		request.removeAttribute(Constantes.DB01CONN);
	}

	public void doForward(String string, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		response.addHeader("Cache-Control", "private");
		response.addHeader("Cache-Control", "no-cache");
		response.addHeader("Cache-Control", "no-store");
		// response.addHeader("X-UA-Compatible", "IE=EmulateIE7");
		response.setContentType("text/html;charset=windows-1252");

		extractConnection(request); // WLX//AXIS-WLS2CLUSTER-Ready

		// ecg axisjsontest:si hay el usuariobean con el flag de solojson,
		// redireccionamos JSPs a JSON
		if (string != null && string.endsWith(".jsp") && !string.endsWith("axiserror.jsp")) {
			try {
				if (("" + request.getParameter(Constantes.__solojson)).equals("true")) {
					// hay que pasar solo JSONs
					super.doForward("/json.do?operation=__solojson", request, response);
				}
			} catch (Exception e) {
				logger.warn("do ward fallado", e);
			}
		}

		super.doForward(string, request, response);
	}

	/**
	 * Retorn a true si hay una session.
	 * 
	 * @param request
	 * @return
	 */
	public boolean existsSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return (session != null);
	}

	private void echoFormData(HttpServletRequest request) {
		Enumeration parameterNames = request.getParameterNames();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		String encryptedParam = "";
		if (formdata == null)
			formdata = new HashMap();
		while (parameterNames.hasMoreElements()) {
			String parameterName = (String) parameterNames.nextElement();

			String[] parameterValues = request.getParameterValues(parameterName);
			if (parameterValues.length == 1) {
				/*
				 * Si el par�metro de formdata es Integer.MIN_VALUE, poner un null
				 */
				/*
				 * Esto se utiliza en los valores por defecto de los combos, en los que queremos
				 * un null, pero no como String ("null"), sino como null Todo esto para evitar
				 * que pete la conversi�n en el JSTL
				 */
				if (parameterValues[0] != null && parameterValues[0].equals(Integer.toString(Integer.MIN_VALUE)))
					parameterValues[0] = null;

				formdata.put(parameterName, parameterValues[0]);

				/*
				 * Si el par�metro de formdata es una fecha, convertirlo a Date * Todo esto para
				 * evitar que pete la conversi�n en el JSTL
				 */
				if (parameterValues[0] != null && parameterValues[0].indexOf("/") > 0
						&& parameterValues[0].lastIndexOf("/") > 0
						&& parameterValues[0].indexOf("/") != parameterValues[0].lastIndexOf("/")) {
					try {
						// Bug 36596 IGIL INI
						if (parameterValues[0].contains(":")) {
							formdata.put(parameterName,
									new SimpleDateFormat("dd/MM/yyyy HH:mm").parse(parameterValues[0]));
						} else {
							formdata.put(parameterName, new SimpleDateFormat("dd/MM/yyyy").parse(parameterValues[0]));
						}
						// Bug 36596 IGIL FIN
					} catch (Exception e) { /* ParseException o similar */
					}
				}

				// Bug 19490 - Enmascaramiento de Datos
				if (parameterName.indexOf("encrypt_") > -1) {
					try {
						encryptedParam = parameterName.substring("encrypt_".length(), parameterName.length());
					} catch (Exception e) {
						logger.debug("[ERROR] [AxisRequestProcessor] [parameterName] = " + parameterName);
						logger.debug("[ERROR] [AxisRequestProcessor] Desencripci�n fallida\n" + e.getMessage());
					} finally {
						encryptedParam = "";
					}
				}
				if (parameterName.equals(encryptedParam) && parameterValues[0] != null) {
					try {
						AESUtil aesUtil = new AESUtil();
						String decriptado = aesUtil.decrypt(parameterValues[0]);
						formdata.put(parameterName, decriptado);
						encryptedParam = "";
					} catch (Exception e) {
						logger.debug("[ERROR] [AxisRequestProcessor] Desencripci�n fallida\n" + e.getMessage());
					}
				}

				// End Bug 19490
			} else {
				formdata.put(parameterName, parameterValues);
			}
			formdata.put(parameterName + "__joined",
					"|" + org.apache.commons.lang.StringUtils.join(parameterValues, "|") + "|");
		}

		// Passformdata?
		if (request.getAttribute(Constantes.PASSFORMDATA) != null) {
			Map passFormData = (Map) request.getAttribute(Constantes.PASSFORMDATA);
			formdata.putAll(passFormData);
		}

		request.setAttribute(Constantes.FORMDATA, formdata);
	}

	/**
	 * Implementaci�n del processMapping. Comprueba la validez de la session actual
	 * y rechaza el acceso,
	 */
	public ActionMapping processMapping(HttpServletRequest request, HttpServletResponse response, String strMappingPath)
			throws IOException {
		injectConnection(request); // WLX//AXIS-WLS2CLUSTER-Ready

		if (request.getAttribute(Constantes.CONFIGFORM) == null)
			request.setAttribute(Constantes.CONFIGFORM, new HashMap());
		// logger.debug("1");
		HashMap mensajes = null;
		if (request.getAttribute(Constantes.MENSAJES) == null) {
			mensajes = new HashMap();
			mensajes.put("m" + "__maxistipo", new Integer(Constantes.MENSAJE_INFO));
			mensajes.put("m" + "__clave", new Vector());
			mensajes.put("m" + "__nivel", new Vector());
			mensajes.put("m" + "__infos", new Vector());
			request.setAttribute(Constantes.MENSAJES, mensajes);
		}
		mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);

		this.processNoCache(request, response);
		this.logParameters(request, strMappingPath);
		this.logActividad(request, strMappingPath);

		// Control de acceso a opciones de men� que no est�n en el men� de
		// sesi�n
		// DESATIVADO TEMPORALMENTE ya que da falsos positivos: 0012021: Error
		// en la consulta de personas desde red comercial
		if (false) { // !opcionPermitida(request, strMappingPath)) {
			ActionMapping strMapping = new ActionMapping();
			strMapping.setForward("/WEB-INF/jsp/axiserror.jsp");
			return strMapping;
		}

		this.echoFormData(request);
		this.limpiarSession(request, strMappingPath);

		try {
			if (request.getParameter("operation") != null && request.getParameter("operation").equals("closeAll")) {
				// Deslogueamos el usuario
				UsuarioBean usuarioBean = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
				if (usuarioBean != null) {
					String usuario = usuarioBean.getUsuario();
					java.sql.Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
					if (con != null) {
						PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(con);
						HashMap mapLogin = new HashMap();
						mapLogin = pacIaxLogin.ejecutaPAC_IAX_LOGIN__F_DESLOGEA(usuario);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (request.getParameter("CONTINUE") != null && request.getParameter("CONTINUE").trim().length() > 0
				&& request.getSession(false) != null)
			request.getSession(false).setAttribute("CONTINUE", request.getParameter("CONTINUE"));
		if (request.getSession().getAttribute(Constantes.LOCALE) == null) {
			// depr.
			// String
			// localeDefecto=ConfigCache.getConfig().getProperty("locale.defecto","2");
			// String miLOCALE=null;
			// try { miLOCALE=ConversionUtil.CIDIOMA2locale(new
			// BigDecimal(localeDefecto)); } catch(Exception e)
			// {logger.error("No se ha podido convertir CIDIOMA:"+localeDefecto+
			// " a un LOCALE", e);}
			// request.getSession().setAttribute(Constantes.LOCALE, miLOCALE);
			request.getSession().setAttribute(Constantes.LOCALE, ConversionUtil.getDefaultLocale());
		}

		// Esto no tiene sentido...si el path es /axis SI que hay que comprobar
		// la actividad de la sesi�n
		// if (strMappingPath.indexOf("/axis")<0 &&
		// Cuando no hay que comprobarlo es al principio de todo, en la pantalla
		// de login, cuando todav�a no hay session
		// Es decir cuando la requestURI es /axis/axis.do
		// if
		// ((request.getRequestURI()!=null&&request.getRequestURI().indexOf("axis.do")<0)&&strMappingPath.indexOf("/index")<0&&strMappingPath.indexOf("/parsea")<0)
		// {
		if ((request.getRequestURI() != null && request.getRequestURI().indexOf("axis.do") < 0)
				&& strMappingPath.indexOf("/index") < 0 && strMappingPath.indexOf("/parsea") < 0
				&& (request.getRequestURI() != null && request.getRequestURI().indexOf("json.do") < 0)) {

			if ((!existsSession(request) || (request.getSession().getAttribute(Constantes.USUARIO) == null))) {

				// con sessionData if (!existsSession(request) ||
				// (sessionData.get(Constantes.USUARIO) == null ) ) {
				ActionMapping strMapping = new ActionMapping();

				AbstractDispatchAction.guardarMensaje(request, "1000051", null, Constantes.MENSAJE_FATAL);
				strMapping.setForward("/WEB-INF/jsp/axiserror.jsp");

				return strMapping;

			} else {
			}
		}

		// Carga en request el usuario de jcifs, si es necesario.
		cargarUsuarioARequest(request);

		return super.processMapping(request, response, strMappingPath);
	}

	/**
	 * M�todo que carga en request, el usuario devuelto por jcifs
	 * 
	 * @param request
	 */
	private void cargarUsuarioARequest(HttpServletRequest request) {
		String USUARIO = "";
		try {
			if (!AxisBaseService.isEmpty(request.getParameter("USUARIO_AL"))) {
				USUARIO = request.getParameter("USUARIO_AL");
				request.setAttribute(Constantes.AUTOLOGINUSUARIO, USUARIO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void logParameters(HttpServletRequest request, String strMappingPath) {
		if (request.getSession(false) != null) {
			UsuarioBean usuarioBean = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
			Enumeration parameterNames = request.getParameterNames();
			StringBuffer parameters = new StringBuffer();
			parameters.append("usuario=").append(usuarioBean).append(", ");
			parameters.append("IP=").append(AxisBaseService.getClientIp(request)).append(", ").append("strMappingPath")
					.append("=").append(strMappingPath).append(", ");
			parameters.append("parameters:");
			while (parameterNames.hasMoreElements()) {
				String parameterName = (String) parameterNames.nextElement();
				if (parameterName.toLowerCase().indexOf("passwd") >= 0
						|| parameterName.toLowerCase().indexOf("password") >= 0
						|| parameterName.toLowerCase().indexOf("pwd") >= 0
						|| parameterName.toLowerCase().indexOf("pass") >= 0
						|| parameterName.toLowerCase().indexOf("clave") >= 0
						|| parameterName.toLowerCase().indexOf("clau") >= 0) {
					parameters.append(parameterName).append("=").append("(hidden)").append(", ");
				} else {
					parameters.append(parameterName).append("=").append(request.getParameter(parameterName))
							.append(", ");
				}
			}
		}

	}

	/**
	 * Detecta si se trata de un "operation=init" y elimina de la sesion objetos que
	 * no deberian quedarse alli (excepto si lo que lanzamos es una p�gina "modal",
	 * entonces se mantienen los atributos.
	 * 
	 * @param request -
	 */
	private void limpiarSession(HttpServletRequest request, String strMappingPath) {
		Vector atributosQueDebenQuedarse = new Vector();
		atributosQueDebenQuedarse.addElement(Constantes.USUARIO);
		atributosQueDebenQuedarse.addElement(Constantes.PILA);
		atributosQueDebenQuedarse.addElement(Constantes.MENU);
		atributosQueDebenQuedarse.addElement(Constantes.LOCALE);
		atributosQueDebenQuedarse.addElement(Constantes.LOCALENUMERICO);
		atributosQueDebenQuedarse.addElement(Constantes.FLUJODETRABAJO);
		atributosQueDebenQuedarse.addElement(Constantes.LOCALE_SEPARADOR_DECIMALES);
		atributosQueDebenQuedarse.addElement(Constantes.LOCALE_SEPARADOR_MILES);
		atributosQueDebenQuedarse.addElement("NtlmHttpAuth");
		atributosQueDebenQuedarse.addElement("axis_menu");

		String operation = request.getParameter("operation");
		HttpSession session = request.getSession(false);

		if (!strMappingPath.startsWith("/modal_") && !strMappingPath.startsWith("/axis_axis") && operation != null
				&& operation.equals("init") && session != null) {
			Enumeration attributeNames = session.getAttributeNames();
			while (attributeNames.hasMoreElements()) {
				String attributeName = (String) attributeNames.nextElement();
				if (atributosQueDebenQuedarse.contains(attributeName)
						|| attributeName.startsWith("sessionPersistent")) {
					// este se queda
				} else {
					session.removeAttribute(attributeName);
				}
			}
			/* RKV bug 10467 */
		} else if (session != null) {
			String whoami = strMappingPath.substring(strMappingPath.indexOf("axis_") + 5);
			Enumeration<String> attributeNames = request.getSession().getAttributeNames();

			while (attributeNames.hasMoreElements()) {
				String attribute = attributeNames.nextElement();
				if (attribute.endsWith("_QUITAR_MENSAJE_INI") && !attribute.startsWith(whoami)) {
					request.getSession().removeAttribute(attribute);
					break;
				}
			}
		}
		/* RKV bug 10467 */
	}

	// BUG9290-20090302-XVM-Habilitar el log de actividad
	private static String getForm(String strMappingPath) {
		String frm = strMappingPath;
		frm = StringUtils.replace(frm, "/axis_", "");
		frm = StringUtils.replace(frm, "/modal_", "");
		frm = StringUtils.replace(frm, "/", "");
		return frm;
	}

	private void logActividad(HttpServletRequest request, String strMappingPath) {
		UsuarioBean usuarioBean = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
		String CFORM = getForm(strMappingPath);
		if (!(CFORM.equalsIgnoreCase("flujodetrabajo") || CFORM.equalsIgnoreCase("main")
				|| CFORM.equalsIgnoreCase("ajax") || CFORM.equalsIgnoreCase("ajaxp") || CFORM.equalsIgnoreCase("axis")
				|| CFORM.equalsIgnoreCase("ayuda") || CFORM.equalsIgnoreCase("formlaucher"))) {
			new FlujodetrabajoService().logActividad(request, usuarioBean, null, CFORM);
		}
	}

	// BUG3004-Controlar que no se accede a una opci�n de men� no permitida
	private boolean opcionPermitida(HttpServletRequest request, String strMappingPath) {
		String CFORM = getForm(strMappingPath).toUpperCase();
		if (esOpcionMenu(request, CFORM)) { // Es una p�gina que se puede
											// acceder por el men�
			// Miramos el objeto Menu que tenemos en sesi�n, para ver si incluye
			// esa opci�n
			ArrayList<HashMap> menu = (ArrayList<HashMap>) request.getSession(false).getAttribute("axis_menu");
			if (menu != null) {
				for (Map mnu : menu) {
					if (CFORM.equals(mnu.get("FORM"))) {
						return true; // encontrada, opcion permitida
					}
				}
				return false; // No estaba en su menu, p�gina prohibida
			}
		}
		return true;
	}

	// Cache en memoria est�tica la lista de opciones de men�, para evitar
	// a�adir queries innecesarias
	// La cache se refresca cada hora
	private static Map<String, String> opcionesMenu = new HashMap<String, String>();
	private static Date opcionesMenuFeha = null;

	private boolean esOpcionMenu(HttpServletRequest request, String frm) {
		if (opcionesMenuFeha == null || (opcionesMenuFeha.getTime() - new Date().getTime()) > 1000 * 60 * 15) {
			try {
				PAC_IAX_MENU pacIaxMenu = new PAC_IAX_MENU(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxMenu.ejecutaPAC_IAX_MENU__F_GET_MODULOS_MENU();
				if (map.get("MENSAJES") != null) {
					AbstractDispatchAction.parsearMensajes(request, (ArrayList) map.get("MENSAJES"));
					request.getSession().setAttribute("axis_menu_mensajes", map.get("MENSAJES"));
				} else {
					opcionesMenu.clear();
					List<Map> modulos = (List<Map>) map.get("RETURN");
					for (Map modulo : modulos) {
						opcionesMenu.put((String) modulo.get("CINVCOD"), "T");
					}
					opcionesMenuFeha = new Date();
				}
			} catch (Exception e) {
				logger.error("Error.", e);
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}
		}

		return opcionesMenu.containsKey(frm);
	}
}
