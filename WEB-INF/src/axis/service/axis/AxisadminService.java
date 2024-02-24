package axis.service.axis;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.mvc.control.axis.AxisadminAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class AxisadminService extends AxisBaseService {
	static Log logger = LogFactory.getLog(AxisadminService.class);

	public void m_init(HttpServletRequest request, AxisadminAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			logger.debug("Error", e);
		}
	}

	public void m_form(HttpServletRequest request, AxisadminAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// bundles encontardos
			String localeBundle = ConfigCache.getConfig().getProperty("locale.bundle", "");
			request.setAttribute("bundles", localeBundle.split(","));

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			logger.debug("Error", e);
		}
	}

	/**
	 * Recarga el completo ResourceBundle. Funciona a aprtir de Java 5.0.
	 * Detecta/actua segun si el campo "cacheList" del ResourceBundle es un
	 * sun.misc.SoftCache o un java.util.concurrent.ConcurrentHashMap.
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_recargarbundles(HttpServletRequest request, AxisadminAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			try {
				Class klass3 = ResourceBundle.getBundle("axis.bundle.Mensajes").getClass().getSuperclass()
						.getSuperclass();
				logger.debug("klass3" + klass3.getName());

				Field field = klass3.getDeclaredField("cacheList");
				field.setAccessible(true);

				String cacheListFieldClassName = field.get(null).getClass().getName();

				boolean done = false;

				logger.warn("Lo de recargar solo funciona a partir de Java 1.5");

				if (cacheListFieldClassName.equalsIgnoreCase("sun.misc.SoftCache")) {
					// sun.misc.SoftCache cache = (sun.misc.SoftCache)field.get(null);
					logger.debug("cacheList es del tipo:" + cacheListFieldClassName);
					// cache.clear();
					logger.debug(cacheListFieldClassName + " cleared");
					done = true;
				}

				if (cacheListFieldClassName.equalsIgnoreCase("java.util.concurrent.ConcurrentHashMap")) {
					logger.debug("cacheList es del tipo:" + cacheListFieldClassName);
					java.util.concurrent.ConcurrentHashMap cache = (java.util.concurrent.ConcurrentHashMap) field
							.get(null);
					cache.clear();
					logger.debug(cacheListFieldClassName + " cleared");
					done = true;
				}

				if (!done) {
					thisAction.guardarMensaje(request, "1000050",
							new Object[] {
									"cacheListFieldClassName:" + cacheListFieldClassName + " Bundles not updated" },
							Constantes.MENSAJE_ERROR);
				}

				field.setAccessible(false); // to prevent any access by anything else

			} catch (Exception e) {
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}

			cargarBundles(request, thisAction);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			logger.debug("Error", e);
		}
	}

	/**
	 * Clono del AxisPlugIn.cargarBundles
	 */
	private void cargarBundles(HttpServletRequest request, AxisadminAction thisAction) {
		try {
			Class clase0;
			Object objeto0;
			Method metUpdateContents0;

			String localeBundle = ConfigCache.getConfig().getProperty("locale.bundle");
			clase0 = Class.forName("axis.bundle.Mensajes");
			objeto0 = clase0.newInstance();
			metUpdateContents0 = clase0.getMethod("updateContents", null);
			metUpdateContents0.invoke(objeto0, null);

			thisAction.guardarMensaje(request, "verbatim:Bundle " + "axis.bundle.Mensajes" + " updated", null,
					Constantes.MENSAJE_INFO);

			if (localeBundle != null && !localeBundle.equals("")) {
				String[] locale = localeBundle.split(",");
				for (int i = 0; i < locale.length; i++) {
					Class clase = Class.forName("axis.bundle.Mensajes_" + locale[i].trim());
					Object objeto = clase.newInstance();
					Method metUpdateContents = clase.getMethod("updateContents", null);
					metUpdateContents.invoke(objeto, null);
					logger.debug("bundloe actualizado: axis.bundle.Mensajes_" + locale[i].trim());
					thisAction.guardarMensaje(request,
							"verbatim:Bundle " + "axis.bundle.Mensajes_" + locale[i].trim() + " updated", null,
							Constantes.MENSAJE_INFO);
				}
			} else {
				throw new Exception("Error al cargar los mensajes asociados a los locales.");
			}
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
