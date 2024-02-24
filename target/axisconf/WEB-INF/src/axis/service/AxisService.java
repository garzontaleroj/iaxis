//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForward;
import org.json.JSONObject;

import com.csi_ti.security.aes.AESUtil;

import axis.cache.ConfigCache;
import axis.daemon.AxisPlugIn;
import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LOGIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.AxisAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class AxisService extends AxisBaseService implements Serializable {

	private static final long serialVersionUID = 2448204999544752367L;
	static Log logger = LogFactory.getLog(AxisService.class);

	public static void main(String[] args) throws Exception {

		String ticket = "X0VcRUnNVOcAwLDYtVXtZcQCJdUOR97EnmS0YEZ89rk5ZemaN8loH86wVh2pzxye3JxyyFywNTecYXb62LlfKzFfiJJL/wcp3pd8akbm5lc75J3plye5KmXbdpwAb8t7";
		ticket = "N/jPwfCrumJoeaq0rLMHbwXeNcQ1f2kTlTZN2DAXugZoDyGlt1eS4Ogz67z1j7HieXmxedt28AgRghEEl0DSCeiYgQjjs00/EojcgHy5G9lSXabtHihmnaZGqiAFzxXP";
		AESUtil aESUtil = new AESUtil();
		String ticketDecrypted = aESUtil.decrypt(ticket);
		org.json.JSONObject miJSONObject = new JSONObject(ticketDecrypted);
	}

	public static final String[] TICKET_OPERATIONS = { "MENU", "CONSULTA_POLIZA", "NUEVAPP", "PPE", "AX_",
			"SIMULACION" }; // TODO: NUEVAPP
	public static final String[] TICKET_VERSIONS = { "1" };

	/**
	 * Proceso algo de tipo
	 * {"M":"MENU","R":"","A":"0","H":"20121029102200253","U":"AXIS_CALI","P":"AXIS","V":"1","E":"15"}
	 * donde H: valida hasta, U: usuario, P: password, V:version ticket,
	 * R:idententificador de referncia, E:cempres, A:codigo agentes, M:operacion
	 * deseadoa hasta ahora tenemos como valores para M:{"CONSULTA_POLIZA"|"MENU"}
	 * Ejemplo URLs:
	 * http://port-56:8988/axistest/axis.do?operation=ticket&ticket=X0VcRUnNVOcAwLDYtVXtZcQCJdUOR97EnmS0YEZ89rkSJmBJ1r5aWj9ZRk0UpIc5LfVRjaJS%2FRO3v7z9bOG4xr9847%2BmAu3bP5pbhwStSOk%3D
	 * http://port-56:8988/axistest/axis.do?operation=ticket&ticket=X0VcRUnNVOcAwLDYtVXtZcQCJdUOR97EnmS0YEZ89rk5ZemaN8loH86wVh2pzxye3JxyyFywNTecYXb62LlfKzFfiJJL%2Fwcp3pd8akbm5lenjnXcDW%2FXWAK0lkFHRpY4
	 * http://192.168.10.113:8988/axistest/axis.do?operation=ticket&ticket=aTX7lENS4og1ZdtkNoeeltpSlhZeQtxVQVDI4UgW2OwjtcAw0XlNDpwXt2%2BGt6j3X5Uy8H%2BCxCWjXbyHGw5xbGykL%2Fzewtl4k4HeWdUiZLUs%2FhLIKkQGKSb0xRRMwiYx
	 * * Ejemplo PPE:
	 * http://169.254.208.3:8989/axistest/axis.do?operation=ticket&ticket=N%2FjPwfCrumJoeaq0rLMHbwXeNcQ1f2kTlTZN2DAXugZoDyGlt1eS4Ogz67z1j7HieXmxedt28AgRghEEl0DSCajxhtldm9lj0e%2FC0aFwzwTQPKpNcfpmrz%2FuvBCAbPhz
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_ticket(HttpServletRequest request, AxisAction thisAction) throws Exception {
		ActionForward fallBackToLogin = new ActionForward("/axis.do?operation=init");
		try {
			String ticket = request.getParameter("ticket"); // "X0VcRUnNVOcAwLDYtVXtZcQCJdUOR97EnmS0YEZ89rkSJmBJ1r5aWj9ZRk0UpIc5LfVRjaJS/RO3v7z9bOG4xpRfOldzKiKr6gI+GqnBL9U=";
			AESUtil aESUtil = new AESUtil();
			String ticketDecrypted = aESUtil.decrypt(ticket);
			org.json.JSONObject miJSONObject = new JSONObject(ticketDecrypted);
			String V = miJSONObject.getString("V");
			String U = miJSONObject.getString("U");
			String P = miJSONObject.getString("P");
			String A = miJSONObject.getString("A");
			String M = miJSONObject.getString("M");
			String R = miJSONObject.getString("R");
			String E = miJSONObject.getString("E");
			String H = miJSONObject.getString("H");
			long lH = Long.parseLong(H);

			boolean foundone = false;
			// revisamos version del ticket
			for (int i = 0; i < TICKET_VERSIONS.length; i++) {
				foundone = false;
				if (V.equals(TICKET_VERSIONS[i])) {
					foundone = true;
					break;
				}
			}
			if (!foundone) {
				throw new Exception("Ticket version unknown");
			}

			// revisamos "validez hasta" del ticket
			java.util.Date ahora = new java.util.Date();
			String ahora_yyyyMMddHHmmss = new java.text.SimpleDateFormat("yyyyMMddHHmmss").format(ahora);
			long ahora_ = Long.parseLong(ahora_yyyyMMddHHmmss);
			if ((lH) < ahora_) { // si lH es inferior que TS actual es que ya ha cadicado
				throw new Exception("Ticket timeout");
			}

			// revisamos operacion del ticket (M)
			for (int i = 0; i < TICKET_OPERATIONS.length; i++) {
				foundone = false;
				if (M.equals(TICKET_OPERATIONS[i])) {
					foundone = true;
					break;
				}
			}
			// ecg20130705 experimental http://mantis.srvcsi.com/view.php?id=26795#c148399
			// probamos poner AX_nombre_de_la_pantalla
			if (M.startsWith("AX_")) {
				foundone = true;
			}
			if (!foundone) {
				throw new Exception("Ticket operation unknown");
			}

			// implementacion de la operaci�n
			String USUARIO = U;
			String PWD = P;
			// String AUTOLOGIN=getCampoTextual(request, "AUTOLOGIN");
			// String PUESTO=getCampoTextual(request, "PUESTO");
			// String sOFICINA=getCampoTextual(request, "OFICINA");
			// BigDecimal cOFICINA=stringToBigDecimal(sOFICINA);

			// Como montar el CONTINUE valor:
			// "axismenu:" hace el axismenu.jsp la lanza como si fuera un flujodetrabajo
			// lo que sigue del "axismenu:" se parte con "|"
			// 1er item (obligatrio): nombre del FORM_ACT
			// 2ndo item: un identificador y codigo el codigo de referencia
			// 3er item: valor para MODO en el axismenu.jsp
			// ejemplo: axismenu:axisctr001|SPRODUC=1161|ALTA_POLIZA ... y por supuesto:
			// urlencoded!

			BigDecimal CEMPRES = stringToBigDecimal(E);
			if (M.equals("MENU")) {
				ActionForward miForward = new ActionForward(
						"/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P + "&CEMPRES=" + CEMPRES);
				request.setAttribute("TICKETDESTINO", miForward);
			}
			if (M.equals("CONSULTA_POLIZA")) {
				String CONTINUE = "axismenu%3Aaxisctr020%7CSSEGURO%3D" + R; // URL encoded, para que llega algo como
																			// axismenu:axisctr020|SSEGURO=###### a
																			// iAXIS
				ActionForward miForward = new ActionForward("/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P
						+ "&CEMPRES=" + CEMPRES + "&CONTINUE=" + CONTINUE);
				request.setAttribute("TICKETDESTINO", miForward);
			}
			if (M.equals("NUEVAPP")) { // nueva produccion (con producto preseleccionado opcionalmente) //TODO: NUEVAPP
				// onclick="iniciarFlujo('*','ALTA_POLIZA','axisctr001','983');"
				String CONTINUE = "axismenu%3Aaxisctr001%7CSPRODUC_Y_CRAMO%3D" + R + "%7CALTA_POLIZA";
				ActionForward miForward = new ActionForward("/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P
						+ "&CEMPRES=" + CEMPRES + "&CONTINUE=" + CONTINUE);
				request.setAttribute("TICKETDESTINO", miForward);
			}
			if (M.equals("SIMULACION")) { // nueva produccion (con producto preseleccionado opcionalmente) //TODO:
											// NUEVAPP
				// onclick="iniciarFlujo('*','ALTA_POLIZA','axisctr001','983');"
				String CONTINUE = "axismenu%3Aaxisctr102%7CSPRODUC_Y_CRAMO%3D" + R + "%7CSIMULACION";
				ActionForward miForward = new ActionForward("/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P
						+ "&CEMPRES=" + CEMPRES + "&CONTINUE=" + CONTINUE);
				request.setAttribute("TICKETDESTINO", miForward);
			}
			if (M.equals("PPE")) { // Polizas pendientes de emitir
				String CONTINUE = "axismenu%3Aaxisctr018"; // URL encoded, para que llega algo como
															// axismenu:axisctr018|SSEGURO=###### a iAXIS
				ActionForward miForward = new ActionForward("/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P
						+ "&CEMPRES=" + CEMPRES + "&CONTINUE=" + CONTINUE);
				request.setAttribute("TICKETDESTINO", miForward);
			}

			if (M.startsWith("AX_")) { // experimental , nunca probado!!!
				String CONTINUE = "axismenu%3A" + M + "%7R%3D" + R + "%7AX_";
				ActionForward miForward = new ActionForward("/axis.do?operation=aceptar&USUARIO=" + U + "&PWD=" + P
						+ "&CEMPRES=" + CEMPRES + "&CONTINUE=" + CONTINUE);
				request.setAttribute("TICKETDESTINO", miForward);
			}

		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			request.setAttribute("TICKETDESTINO", fallBackToLogin);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_init(HttpServletRequest request, AxisAction thisAction) throws Exception {
		// request.getSession(false).invalidate();
		// Este invalidate ha pasado al form.
		// No lo hacemos en el init(), ya que necesitaremos session para pasar mensajes
		// de error
		// (atributo forcedUserLogout) o quiz�s para pasar informaci�n externa (vars. de
		// entorno)
	}

	/**
	 * Salir de la aplicaci�n: mirar si ha sido un logout forzado, mostrar errores
	 * si es el caso, invalidar la sesi�n. Mirar tambi�n si el usuario se conect�
	 * mediante autologin.
	 * 
	 * @param request
	 * @return
	 */
	public void m_salir(HttpServletRequest request) {
		java.sql.Connection conn = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
		try {
			String error_menu = getCampoTextual(request, "error_menu");

			if (Boolean.TRUE.equals(request.getSession().getAttribute("forcedUserLogout"))) {
				AbstractDispatchAction.guardarMensaje(request,
						"verbatim:" + axis.util.Traductor.traducir(null, "9000605"), null, Constantes.MENSAJE_ERROR);
			}

			// Si el men� no se ha cargado correctamente mostraremos un mensaje de error.
			if (!isEmpty(error_menu)) {
				AbstractDispatchAction.guardarMensaje(request, error_menu, null, Constantes.MENSAJE_ERROR);
			}

			PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(conn);

			HashMap mapLogin = new HashMap();
			UsuarioBean usuario = (UsuarioBean) request.getSession(false).getAttribute(Constantes.USUARIO);
			if (usuario != null) {
				mapLogin = pacIaxLogin.ejecutaPAC_IAX_LOGIN__F_DESLOGEA(usuario.getUsuario());
				BigDecimal returnLogin = (BigDecimal) tratarRETURNyMENSAJES(request, mapLogin);

				// ecg20130305 http://mantis.srvcsi.com/view.php?id=24603 vulnerabilidad login
				// sesiones compartidas
			}
			String comportamiento_sesiones_compartidas = ConfigCache.getConfig()
					.getProperty("comportamiento.sesiones.compartidas", "");
			if (comportamiento_sesiones_compartidas.equals("highlander")) {
				// no desvalida la session aunque es un salir, ya que se trata de un highlander
			} else {
				request.getSession(false).invalidate();
			}

			ConexionFactoria.closeConnection(conn);

		} catch (Exception e) {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			logger.error(e);
			e.printStackTrace();
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_frames(HttpServletRequest request, AxisAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	/**
	 * M�todo que se encarga de decidir si la validaci�n se har� desde login.jsp o
	 * desde autologin.jsp. Todo depende de si el usuario es validado para acceder a
	 * la aplicaci�n por autologin. Adem�s, este m�todo es el encargado de cargar
	 * las empresas que tienen contratado iAxis.
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_form(HttpServletRequest request, AxisAction thisAction) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			if (!isEmpty(request.getSession())) {
				PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				HashMap mapLogin = new HashMap();
				mapLogin = pacIaxLogin.ejecutaPAC_IAX_LOGIN__F_LIMITE_SESIONES();
				BigDecimal returnLogin = (BigDecimal) tratarRETURNyMENSAJES(request, mapLogin);

				if (returnLogin == new BigDecimal(0))
					request.getSession(false).invalidate();
			}
			// Si usuario == '' -> login | usuario == "VALOR" -> autologin
			String USUARIO = ((!isEmpty(request.getAttribute(Constantes.AUTOLOGINUSUARIO)))
					? (String) request.getAttribute(Constantes.AUTOLOGINUSUARIO)
					: "");

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// En funci�n de autologin, realizamos diferentes acciones.
			if (AxisPlugIn.AUTOLOGINGRANTED && !isEmpty(USUARIO)) {
				// AUTOLOGIN para este usuario
				request.setAttribute("autologin_para_este_usuario", true);
				formdata.put("USUARIO", USUARIO);
			}

			// Cargamos el combo de empresa...
			Map listValores = new HashMap();
			Map mapLstEmpresas = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List lLstEmpresas = (List) tratarRETURNyMENSAJES(request, mapLstEmpresas);
			listValores.put("lstempresas", lLstEmpresas);

			formdata.put("listValores", ((!isEmpty(listValores)) ? listValores : new HashMap()));

		} catch (Exception e) {
			logger.error(e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que realiza el proceso de login: Abrir nueva sesi�n de usuario y se
	 * rellena el objeto UsuarioBean
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_aceptar(HttpServletRequest request, AxisAction thisAction) throws Exception {
		try {

			// Primero comprobamos que la sesi�n no est� ya abierta (Firefox reutiliza la
			// misma sesi�n para
			// todas las pesta�as e instancia del navegador)
			PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap mapLogin = new HashMap();
			mapLogin = pacIaxLogin.ejecutaPAC_IAX_LOGIN__F_LIMITE_SESIONES();
			BigDecimal returnLogin = (BigDecimal) tratarRETURNyMENSAJES(request, mapLogin);

			if (returnLogin.intValue() == 1
					&& "TRUE".equals((String) request.getSession().getAttribute(Constantes.CONNECTED))) {
				AbstractDispatchAction.guardarMensaje(request, "180549", new Object[] {}, Constantes.MENSAJE_ERROR);
				AbstractDispatchAction.guardarMensaje(request, "9903720", new Object[] {}, Constantes.MENSAJE_ERROR);
			} else {
				Integer numTries = 0;
				String USUARIO = getCampoTextual(request, "USUARIO");
				String PWD = getCampoTextual(request, "PWD");
				String AUTOLOGIN = getCampoTextual(request, "AUTOLOGIN");
				String PUESTO = getCampoTextual(request, "PUESTO");
				String sOFICINA = getCampoTextual(request, "OFICINA");
				BigDecimal cOFICINA = stringToBigDecimal(sOFICINA);
				BigDecimal CEMPRES = stringToBigDecimal(getCampoTextual(request, "CEMPRES"));

				UsuarioBean usuario = new UsuarioBean(USUARIO, PWD);
				usuario.setRemoteip(AxisBaseService.getClientIp(request));
				usuario.setJsessionid(request.getSession().getId());

				// Inicializamos el n�mero de intentos hasta ahora
				numTries = (Integer) request.getSession().getAttribute("numTries");
				if (numTries == null) {
					numTries = new Integer(0);
				}

				String ipuser = usuario.getRemoteip();
				if ((ipuser != null) && (ipuser.length() > 50)) {
					ipuser = ipuser.substring(0, 50);
				}
				mapLogin = pacIaxLogin.ejecutaPAC_IAX_LOGIN__F_IAX_LOGIN(usuario.getUsuario(), usuario.getPwd(), ipuser,
						AUTOLOGIN, cOFICINA, PUESTO, CEMPRES);
				returnLogin = (BigDecimal) tratarRETURNyMENSAJES(request, mapLogin);

				// 1 indica que el usuario es correcto, 0 no se ha validado correctamente el
				// usuario
				if (BigDecimal.ONE.equals(returnLogin)) {

					HashMap PDATUSER = ((!isEmpty(mapLogin) && !isEmpty(mapLogin.get("PDATUSER"))
							? (HashMap) mapLogin.get("PDATUSER")
							: new HashMap()));
					usuario.parsearDatuser(PDATUSER);

					if (!isEmpty(sOFICINA))
						usuario.setOficina(sOFICINA);

					if (!isEmpty(PUESTO))
						usuario.setOficina(PUESTO);

					if (!isEmpty(AUTOLOGIN))
						usuario.setAutologin(AUTOLOGIN);

					// ecg20130215 bug 25799 es la BBDD que debe decidir si o no se va a abrir el
					// puesto
					PAC_IAX_PARAM param = new PAC_IAX_PARAM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					HashMap m = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("ABRIR_PUESTO", usuario.getCempres());
					if (m.get("RETURN") != null && m.get("RETURN").equals(BigDecimal.ONE)) {
						usuario.setPuestoAbierto(true);
					} else {
						usuario.setPuestoAbierto(false);
					}

					// Creamos las sesiones de usuario
					request.getSession().setAttribute(Constantes.USUARIO, usuario);
					request.getSession().setAttribute(Constantes.LOCALE, usuario.getLocale());
					//
					request.getSession().setAttribute(Constantes.CONNECTED, "TRUE");
					PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("SHOW_AYUDA", usuario.getCempres());
					Constantes.SHOW_AYUDA.put(Constantes.SHOW_AYUDA_STR, (BigDecimal) map.get("RETURN"));

				} else {
					AbstractDispatchAction.guardarMensaje(request, "180549", new Object[] {}, Constantes.MENSAJE_ERROR);
					numTries = numTries + 1;
					request.getSession().setAttribute("numTries", numTries);
				}
				// TODO: a ver si va (o no...)
				/*
				 * PAC_IAX_CFG pAC_IAX_CFG = new PAC_IAX_CFG(
				 * (java.sql.Connection)request.getAttribute(Constantes.DB01CONN)); HashMap
				 * m1=pAC_IAX_CFG.ejecutaPAC_IAX_CFG__F_GET_FORM_WIZARD("ALTA_POLIZA", new
				 * BigDecimal(207), "AXISCTR004", null, Constantes.ANTERIOR);
				 * logger.debug("m1:"+m1); tratarRETURNyMENSAJES(request, m1);
				 * //m1:{RETURN=null, MENSAJES=[{OB_IAX_MENSAJES={TIPERROR=1, CERROR=1000001,
				 * TERROR=pac_axis_cfg.f_get_user_cfgwiz - SQLERROR: 100 - ORA-01403: No se ha
				 * encontrado ning�n dato}}, {OB_IAX_MENSAJES={TIPERROR=1, CERROR=1000001,
				 * TERROR=null}}]}
				 */
			}
		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

}
