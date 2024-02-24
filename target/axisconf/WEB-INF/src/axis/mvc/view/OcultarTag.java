package axis.mvc.view;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class OcultarTag extends BodyTagSupport {

	static Log logger = LogFactory.getLog(OcultarTag.class);

	String f = null; // form/whoami/pantalla
	String c = null; // campo/item/componente/parrafo
	Boolean dejarHueco = Boolean.valueOf(false); // dejar o no hueco en blanco en la pantalla HTML
	Boolean defaultOcultar = Boolean.valueOf(false); // ecg20131112 http://mantis.srvcsi.com/view.php?id=29465

	protected boolean enableDebug = false;
	protected boolean esVisible = true;

	public OcultarTag() {
	}

	public void setF(String f) {
		this.f = f;
	}

	public void setC(String c) {
		this.c = c;
	}

	public void setDejarHueco(Boolean dejarHueco) {
		this.dejarHueco = dejarHueco;
	}

	public int doStartTag() throws JspException {
		if (esVisible = esComponteVisible()) {
			// Procesar body del tag normalmente
			return EVAL_BODY_INCLUDE;
		} else {
			// Evaluar el body para procesarlo en doAfterBody()
			return EVAL_BODY_BUFFERED;
		}
	}

	public int doAfterBody() throws JspException {
		if (esVisible) {
			// Si es visible no debemos hacer nada m�s
			return SKIP_BODY;
		}

		// Si es invisible, debemos procesar el body
		// Cargar el cuerpo del tag
		String contenido = bodyContent.getString();
		String[] tagTypes = { "td", "table", "tr", "div", "input", "select", "img" };
		boolean validador = false;
		// Ocultar todos los HTML tags que contenga
		for (int i = 0; i < tagTypes.length; i++) {
			// if(contenido.matches("(?i).*<"+ tagTypes[i] +".*")){
			if (contenido.indexOf(tagTypes[i]) > 0) {
				validador = true;
			}
		}

		if (validador == false) {
			return SKIP_BODY;
		}

		String nuevoContenido = ocultarTags(contenido, tagTypes);

		try {
			// Escribir el resultado del contenido alterado
			bodyContent.getEnclosingWriter().print(nuevoContenido);
		} catch (IOException ioe) {
			logger.error("Error en OcultarTag - doAfterBody(), f: " + f + " c: " + c, ioe);
		}

		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	protected String ocultarTags(String contenido, String[] tagTypes) {
		String style = dejarHueco.booleanValue() ? " style=\"visibility:hidden\""
				: " style=\"visibility:hidden;display:none\"";
		for (int i = 0; i < tagTypes.length; i++) {

			contenido = contenido.replaceAll("<" + tagTypes[i], "<" + tagTypes[i] + style);
			// Comentado por razones de eficiencia: NO PONDREMOS TAGS EN MAY�SCULAS...
			// contenido = contenido.replaceAll("<" + tagTypes[i].toUpperCase(), "<" +
			// tagTypes[i].toUpperCase() + style);

		}
		return contenido;
	}

	protected boolean esComponteVisible() {
		// Descomentar lo siguiente para testear el tag (que el componente siempre sea
		// invisible)
		// if (true) return false;

		boolean visible = true;
		Map map = (Map) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);
		String clave = f + "__" + c + "__" + "visible";
		String valor = (String) map.get(clave);

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'visible': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (!isEmpty(valor) && valor.equalsIgnoreCase("false")) {
			visible = false;
		} else {
			if (defaultOcultar) { // si no hay info y si es defaultOcultar, lo ocultamos
				visible = false;
			} else {
				visible = true;
			}
		}

		if (enableDebug)
			logger.debug("Finalmente, el componente " + c + " queda como visible=\"" + visible + "\"");

		return visible;
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}
}
