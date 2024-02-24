package axis.mvc.view;

import java.math.BigDecimal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.Traductor;

public class AltTag extends TagSupport {
	static Log logger = LogFactory.getLog(AltTag.class);

	// boolean enableDebug=false; // ecg AXIS2413 Bug 16805 codigo mas eficiente
	// public static final int CPRPTY_LITERALALTERNATIVO=8;// ecg AXIS2413 Bug 16805
	// codigo mas eficiente
	String f = null; // form/whoami/pantalla
	String c = null; // campo/item/componente/parrafo
	String lit = null; // SLITERA
	HttpServletRequest request = null;

	// String nouLiteral="";// ecg AXIS2413 Bug 16805 codigo mas eficiente
	// boolean isBBDD=false;// ecg AXIS2413 Bug 16805 codigo mas eficiente
	public AltTag() {
	}

	private AltTag(HttpServletRequest request) {
		this.request = request;
	}

	public void setF(String f) {
		this.f = f;
	}

	public String getF() {
		return f;
	}

	public void setC(String c) {
		this.c = c;
	}

	public void setLit(String li) {
		this.lit = li;
	}

	public String getC() {
		return c;
	}

	public String getLit() {
		return lit;
	}

	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().print(procesar());
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el AltTag", e);
		}

		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	public String procesar() throws Exception {

		HashMap m = null;
		if (pageContext != null) {
			m = (HashMap) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);
			request = (HttpServletRequest) pageContext.getRequest();
		} else if (request != null) {
			m = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
			request = request;
		}

		String nouLiteral = "";

		StringBuffer llave = new StringBuffer(); // ecg AXIS2413 Bug 16805 codigo mas eficiente
		llave.append(f).append("__").append(c).append("__alt"); // ecg AXIS2413 Bug 16805 codigo mas eficiente
		// String llave = f + "__" + c + "__" + "alt";// ecg AXIS2413 Bug 16805 codigo
		// mas eficiente
		String valor = (String) m.get(llave.toString());
		/*
		 * // ecg AXIS2413 Bug 16805 codigo mas eficiente if (enableDebug)
		 * logger.debug("COMPONENTE: " + c + " 'literal': " + (!isEmpty(valor) ? valor :
		 * "No hay info en BD."));
		 */

		if (!isEmpty(valor)) {
			if (valor.equals("0")) {
				nouLiteral = "???" + valor + "???";
			} else {
				nouLiteral = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), valor);
			}

		} else {
			try {
				BigDecimal a = new BigDecimal(lit);

				if (lit.equals("0")) {
					nouLiteral = "???" + lit + "???";
				} else {
					nouLiteral = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), lit);
				}

			} catch (Exception e) {
				nouLiteral = lit;
			}
		}

		/*
		 * // ecg AXIS2413 Bug 16805 codigo mas eficiente if (enableDebug)
		 * logger.debug("Finalmente, el componente " + c + " tiene el literal=\"" +
		 * nouLiteral + "\"");
		 */

		llave = null; // ecg AXIS2413 Bug 16805 codigo mas eficiente
		f = null; // form/whoami/pantalla// ecg AXIS2413 Bug 16805 codigo mas eficiente
		c = null; // campo/item/componente/parrafo// ecg AXIS2413 Bug 16805 codigo mas eficiente
		lit = null; // SLITERA// ecg AXIS2413 Bug 16805 codigo mas eficiente

		return nouLiteral;
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}

	public static String getLiteralAlternativo(HttpServletRequest request, String f, String c) {
		AltTag vt = new AltTag(request);
		vt.setF(f);
		vt.setC(c);

		try {
			return vt.procesar();
		} catch (Exception e) {
			logger.warn("Error : " + e.getMessage());
			logger.warn("No se ha podido ejecutar el AltTag (f=" + f + ",c=" + c + "): " + e.getLocalizedMessage());
			return null;
		}
	}

}
