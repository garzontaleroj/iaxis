package axis.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import axis.mvc.control.JSONAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class JSONService implements Serializable {

	private static final long serialVersionUID = -5263725178967391250L;
	static Log logger = LogFactory.getLog(JSONService.class);

	public void m___solojson(HttpServletRequest request, JSONAction thisAction) throws Exception {
		logger.debug("aki m___solojson");

		try {
			// si no hay un jSONObject en la request, lo creamos
			if (request.getAttribute(Constantes.__jSONObject) == null) {
				HashMap miJsonDataSurrogate = new HashMap();
				logger.debug(
						"traduce conteido del reuqest al __jSONObject (exisecto si hay esta definido, entonces no se hace nada)");

				// primeo pongamos todos los request attributes al miJsonDataSurrogate
				Enumeration attributeNames = request.getAttributeNames();
				while (attributeNames.hasMoreElements()) {
					Object oAttributeName = attributeNames.nextElement();
					if (oAttributeName != null && request.getAttribute(oAttributeName.toString()) != null) {
						// logger.debug("voy a poner eso:"+oAttributeName.toString());
						miJsonDataSurrogate.put(oAttributeName.toString(),
								request.getAttribute(oAttributeName.toString()));
					}
				}
				// despues de primero: sacamos de la request todo slos atributos menos el
				// jSONObject
				while (attributeNames.hasMoreElements()) {
					Object oAttributeName = attributeNames.nextElement();
					if (oAttributeName != null && request.getAttribute(oAttributeName.toString()) != null) {
						if (oAttributeName.toString().equals(Constantes.__jSONObject)) {
							request.removeAttribute(oAttributeName.toString());
						}
					}
				}
				// voy a quitar q no deberia estar en el miJsonDataSurrogate

				miJsonDataSurrogate.remove("org.apache.struts.action.MESSAGE"); // algo
																				// como"org.apache.struts.util.PropertyMessageResources@1918c8f",
				miJsonDataSurrogate.remove("org.apache.struts.action.MODULE"); // algo como
																				// "org.apache.struts.config.impl.ModuleConfigImpl@a32604",
				miJsonDataSurrogate.remove("org.apache.struts.action.mapping.instance");
				miJsonDataSurrogate.remove("org.apache.struts.action.LOCALE");
				miJsonDataSurrogate.remove("__db01conn");
				// logger.debug("request attribute tiene ahora al jSONObject");

				// segundo pongamos todos los session attributes al miJsonDataSurrogate (dentro
				// de un __sessionSurrogate), menos el __usuarioBean. Los datos de la session NO
				// sacamos de session
				HashMap miJsonDataSessionSurrogate = new HashMap();
				if (request.getSession(false) != null) {
					Enumeration sessionAttributeNames = request.getSession(false).getAttributeNames();
					// logger.debug("sessionAttributeNames:"+sessionAttributeNames);
					while (sessionAttributeNames.hasMoreElements()) {
						Object oAttributeName = sessionAttributeNames.nextElement();
						// logger.debug("oAttributeName:"+oAttributeName);
						if (oAttributeName != null
								&& request.getSession(false).getAttribute(oAttributeName.toString()) != null) {
							logger.debug("voy a poner eso:" + oAttributeName.toString());
							miJsonDataSessionSurrogate.put(oAttributeName.toString(),
									request.getSession(false).getAttribute(oAttributeName.toString()));
						}
					}
					miJsonDataSessionSurrogate.put("__jsessionid", request.getSession(false).getId());
				} else {
					logger.debug("request.getSession(false) is null!");
				}
				miJsonDataSurrogate.put("__sessionSurrogate", miJsonDataSessionSurrogate);

				JSONObject jSONObject = new ConversionUtil().convertToJSON2JSONObject(miJsonDataSurrogate);
				request.setAttribute(Constantes.__jSONObject, jSONObject);
				logger.debug("jSONObject set en request");
			} else {
				logger.debug("ya habia una objeto en la request, asi que no he tocado nada");
			}
		} catch (Exception e) {
			logger.debug("Error", e);
		}

	}

	public void m_form(HttpServletRequest request, JSONAction thisAction) throws Exception {
		logger.debug("aki");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			JSONObject jSONObject = new ConversionUtil()
					.convertToJSON2JSONObject(request.getAttribute(Constantes.AJAXCONTAINER));
			request.setAttribute(Constantes.__jSONObject, jSONObject);
			logger.debug("jSONObject set en request");
		} catch (Exception e) {
			logger.debug("Error", e);
		}

	}

	public void m_echo(HttpServletRequest request, JSONAction thisAction) throws Exception {
		logger.debug("aki");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String jsonMessageString = request.getParameter("jsonMessage");

			HashMap retVal = new HashMap();
			retVal.put("jsonMessageString", jsonMessageString);
			try {
				JSONObject parsedJsonObject = new JSONObject(jsonMessageString);
				retVal.put("parsedJsonObject", parsedJsonObject);
				HashMap map = new ConversionUtil().convertToJSON2JavaObject(parsedJsonObject);
				retVal.put("parsedJavaObject", map);
			} catch (Exception e2) {
				retVal.put("parsedJsonObject", "(Error parseando String a JSON, mensaje Java:" + e2 + ")");
			}
			logger.debug("retVal:" + retVal);
			request.setAttribute(Constantes.AJAXCONTAINER, retVal);

			Object jSONObject = new ConversionUtil()
					.convertToJSON2JSONObject(request.getAttribute(Constantes.AJAXCONTAINER));
			request.setAttribute(Constantes.__jSONObject, jSONObject);
			logger.debug("jSONObject set en request");
		} catch (Exception e) {
			logger.debug("Error", e);
		}

	}

	public static void main(String[] args) throws Exception {
		JSONService s = new JSONService();
		ArrayList a = new ArrayList();
		HashMap m = null;
		m = new HashMap();
		m.put("A", new BigDecimal(1.2));
		m.put("B", new java.util.Date());
		m.put("C", new java.sql.Date(1, 2, 3));
		a.add(m);
		m = new HashMap();
		m.put("A1", null);
		m.put("B", "hola");
		m.put("C", new java.util.Date(1, 2, 3));
		a.add(m);

		ArrayList a2 = new ArrayList();

		m = new HashMap();
		m.put("A", new BigDecimal(1.2));
		m.put("B", new java.util.Date());
		m.put("C", new java.sql.Date(1, 2, 3));
		a2.add(m);
		m = new HashMap();
		m.put("A1", null);
		m.put("B", "h�l�");
		m.put("C", new java.util.Date(1, 2, 3));
		a2.add(m);

		m = new HashMap();
		m.put("a2", a2);
		a.add(m);

		JSONObject o = new ConversionUtil().convertToJSON2JSONObject(a);
		System.out.println("a:" + a);
		System.out.println("o:" + o.toString(2));

		HashMap oj = new ConversionUtil().convertToJSON2JavaObject(o);
		System.out.println("oj:" + oj);

	}

}
