//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service;

import java.io.Serializable;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MENU;
import axis.jdbc.PAC_IAX_USER;
import axis.jdbc.PAC_PERSISTENCIA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.MainAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class MainService implements Serializable {

	private static final long serialVersionUID = -5140301108922772531L;
	static Log logger = LogFactory.getLog(MainService.class);

	public void m_cancelar(HttpServletRequest request, MainAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			usuario.closeConnection("db01");
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	public void m_frames(HttpServletRequest request, MainAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Connection conn = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN); // necesario para
																								// establecer el entorno
		} catch (Exception e) {
			logger.error("m_menu", e);
		}
	}

	public void m_cabecera(HttpServletRequest request, MainAction thisAction) {
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

	public void m_pie(HttpServletRequest request, MainAction thisAction) {
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

	public void m_trabajo(HttpServletRequest request, MainAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// usuario.closeConnection("db01");

			Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);

			// Llamada a PL/SQL para recuperar los �tems de men�
			PAC_IAX_MENU pacIaxMenu = new PAC_IAX_MENU(con);
			//
			Map map = pacIaxMenu.ejecutaPAC_IAX_MENU__F_GET_MENU(usuario.getCidioma());
			List menu = map.get("RETURN") != null ? (List) map.get("RETURN") : new ArrayList();

			if (map.get("MENSAJES") != null) {
				AbstractDispatchAction.parsearMensajes(request, (ArrayList) map.get("MENSAJES"));
				request.getSession().setAttribute("axis_menu_mensajes", map.get("MENSAJES"));
				request.getSession().removeAttribute("axis_menu");
			} else if (menu.size() > 0) {

				// request.setAttribute ("axis_xml_menu", menuXML);
				request.getSession().setAttribute("axis_menu", menu);
			}

			/*
			 * PAC_IAX_USER pacIaxUser = new
			 * PAC_IAX_USER((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			 * 
			 * 
			 * String USER = usuario.getCusuari();
			 * 
			 * map = pacIaxUser.ejecutaPAC_IAX_USER__F_VAL_CAMBIO_PASWD(USER); logger.
			 * debug("ejecutaPAC_IAX_USER__F_VAL_CAMBIO_PASWD ----------------------> "+map)
			 * ; AbstractDispatchAction.parsearMensajes(request,
			 * (ArrayList)map.get("MENSAJES"));
			 * request.getSession().setAttribute("axis_menu_mensajes", map.get("MENSAJES"));
			 * request.getSession().removeAttribute("axis_menu");
			 */

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	public void m_menu(HttpServletRequest request, MainAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			if (request.getSession().getAttribute("axis_menu") != null) {
				request.setAttribute("axis_menu", request.getSession().getAttribute("axis_menu"));
			} else {
				AbstractDispatchAction.parsearMensajes(request,
						(ArrayList) request.getSession().getAttribute("axis_menu_mensajes"));
			}

			// WLS2Cluster-Ready
			// ecg2011122: invocar cuando se invoca el menu
			// WLS2Cluster-Ready
			PAC_PERSISTENCIA pAC_PERSISTENCIA = new PAC_PERSISTENCIA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			pAC_PERSISTENCIA.ejecutaPAC_PERSISTENCIA__F_LIMPIAR_CONTEXTO(request.getSession().getId());
			// WLS2Cluster-Ready

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			usuario.closeConnection("db01");
		}
	}

	public void old_m_menu(HttpServletRequest request, MainAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			Connection con = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);

			// Llamada a PL/SQL para recuperar los �tems de men�
			PAC_IAX_MENU pacIaxMenu = new PAC_IAX_MENU(con);
			//
			Map map = pacIaxMenu.ejecutaPAC_IAX_MENU__F_GET_MENU(usuario.getCidioma());
			List menu = map.get("RETURN") != null ? (List) map.get("RETURN") : new ArrayList();

			if (map.get("MENSAJES") != null) {
				AbstractDispatchAction.parsearMensajes(request, (ArrayList) map.get("MENSAJES"));
			} else if (menu.size() > 0) {
				/*
				 * ArbolNTUtil.preprocesarSinIdsConNiveles((ArrayList) menu); // te pone IDs y
				 * PADREIDs ArbolNT h = new ArbolNT((ArrayList) menu, null, null , 999, false);
				 * String menuXML = (ArbolNTUtil.wrapXML(h, true, usuario.getLocale())); //
				 * logger.debug(menuXML);
				 * 
				 * // Escribir el fichero XML en el path de la aplicaci�n/WEB-INF/xsl
				 * 
				 * String path = request.getSession().getServletContext().getRealPath("/") +
				 * "WEB-INF" + File.separator + "xsl"; File file = new File(path, "menu.xml");
				 * BufferedWriter bw = new BufferedWriter(new FileWriter(file));
				 * bw.write(menuXML); bw.flush(); bw.close();
				 */

				// request.setAttribute ("axis_xml_menu", menuXML);
				request.setAttribute("axis_menu", menu);
			}
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	public void m_submenu(HttpServletRequest request, MainAction thisAction) {
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

	public void old_m_submenu(HttpServletRequest request, MainAction thisAction) {
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

	public void m_teaser(HttpServletRequest request, MainAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			if (usuario.getPrimeravez()) {
				PAC_IAX_USER pacIaxUser = new PAC_IAX_USER(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				String USER = usuario.getCusuari();
				Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_VAL_CAMBIO_PASWD(USER);
				AbstractDispatchAction.parsearMensajes(request, (ArrayList) map.get("MENSAJES"));
				request.getSession().setAttribute("axis_menu_mensajes", map.get("MENSAJES"));

				usuario.setPrimeraVez(false);
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
		}
	}

	public static void main(String[] args) {

	}
}
