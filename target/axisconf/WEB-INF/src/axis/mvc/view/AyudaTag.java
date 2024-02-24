package axis.mvc.view;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.util.Constantes;
import axis.util.ConversionUtil;

public class AyudaTag extends TagSupport {
	static Log logger = LogFactory.getLog(AyudaTag.class);
	public static ArrayList ayudacursor = null;
	private static HashMap ayudamap = new HashMap();

	boolean enableDebug = false;

	String f = null; // form/whoami/pantalla
	String c = null; // componente

	/**
	 * Alimenta el ayudacursor y el ayudamap
	 * 
	 * @param ayudacursor
	 */
	public static void popularAyuda(ArrayList ayudacursor) {
		AyudaTag.ayudacursor = (ArrayList) ayudacursor.clone();
		// logger.debug("ayudacursor vale:"+ayudacursor);
		HashMap reg = null;
		for (Object rego : AyudaTag.ayudacursor) {
			reg = (HashMap) rego;
			if (reg.get("AYUDA") != null && reg.get("TAYUDA") != null) {
				ayudamap.put(reg.get("AYUDA"), reg.get("TAYUDA"));
			}
		}
		// logger.debug("ayudamap vale:"+ayudamap);
	}

	public String getF() {
		return f;
	}

	public void setF(String f) {
		this.f = f;
	}

	public void setC(String c) {
		this.c = c;
	}

	public String getC() {
		return c;
	}

	public int doStartTag() throws JspException {
		try {
			// Escribir en el JSP de salida los atributos del campo
			pageContext.getOut().print(procesar());
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el AyudaTag", e);
		}
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		try {
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el AyudaTag", e);
		}
		return EVAL_PAGE;

	}

	public String procesar() throws Exception {
		StringBuffer sb = new StringBuffer();
		String LOCALE = (String) pageContext.getSession().getAttribute(Constantes.LOCALE);
		BigDecimal CIDIOMA = ConversionUtil.locale2CIDIOMA(LOCALE);
		String AYUDA = (CIDIOMA.intValue() + "__" + f + "__" + c).toUpperCase();
		// String TAYUDA=(String)AyudaTag.ayudamap.get(AYUDA);
		// logger.debug("Texto de ayuda recuperada para "+AYUDA);
		if (AyudaTag.ayudamap.get(AYUDA) != null) {
			String ayudaIconLink = "<img src=\"images/ayuda.png\" style=\"margin-left:3px;cursor:help\" onclick=\"objAyuda.abrirAyuda('FFF','CCC')\" />";
			ayudaIconLink = StringUtils.replace(ayudaIconLink, "FFF", f.toUpperCase());
			ayudaIconLink = StringUtils.replace(ayudaIconLink, "CCC", c.toUpperCase());
			sb.append(ayudaIconLink);
			return sb.toString();
		} else {
			logger.warn("No se va a producir el icono de ayuda por falta de texto de ayuda");
			return "";
		}

	}

}
