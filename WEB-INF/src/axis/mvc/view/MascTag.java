//Revision:# PuGJU0W7sO4UVuKoUXYs5A== #
package axis.mvc.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class MascTag extends TagSupport {
	static Log logger = LogFactory.getLog(VisibleTag.class);

	boolean enableDebug = false;

	String f = null; // form/whoami/pantalla
	String c = null; // campo/item/componente/parrafo
	String value = null; // valor/dato a enmascarar
	String size = "4"; // Tama�o del enmascaramiento
	String mc = "X"; // Caracter con el que se quiere enmascarar

	HttpServletRequest request = null;

	public MascTag() {
		super();
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

	public String getC() {
		return c;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getSize() {
		return this.size;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}

	public String getMc() {
		return this.mc;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getValue() {
		return this.value;
	}

	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().print(procesar());
		} catch (Exception e) {
			logger.warn("No se ha podido ejecutar el MascTag (f=" + f + ",c=" + c + ",size=" + size + ",value:" + value
					+ "): " + e.getLocalizedMessage());
			e.getMessage();
		}

		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	private String procesar() throws Exception {

		Map map = (Map) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);

		String maskData = "", clave = f + "__" + c + "__" + "masc", valor = "0";

		if (map.get(clave) != null) {
			valor = (String) map.get(clave);
		} else {
			logger.warn("No se encuentra valor para el tag, en la parametrizaci�n");
		}

		switch (Integer.valueOf(valor)) {
		case 0:
			maskData = this.getValue();
			break;
		case 1:
			maskData = maskData(this.getValue());
			break;
		case 2:
			this.setMc("x");
			maskData = maskData(this.getValue());
			break;
		case 3:
			this.setMc("*");
			maskData = maskData(this.getValue());
			break;
		case 4:
			this.setMc("-");
			maskData = maskData(this.getValue());
			break;
		default:
			maskData = this.getValue();
			break;
		}

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'masc': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (enableDebug)
			logger.debug("Finalmente, el componente " + c + " queda enmascarado=\"" + maskData + "\"");

		logger.debug("[DEBUG] [MascTag] valor:    " + valor);
		logger.debug("[DEBUG] [MascTag] maskData: " + maskData);

		return maskData;
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}

	private String maskData(String aData) {

		String maskingData = "";

		if (!isEmpty(aData) && aData.compareTo("") != 0) {
			if (Integer.valueOf(this.getSize()) < aData.length()) {
				for (int i = 1; i < value.length() - (Integer.valueOf(this.getSize()) - 1); i++) {
					maskingData += mc;
				}

				maskingData += value.substring(value.length() - Integer.valueOf(this.getSize()), value.length());
			}
		} else {
			maskingData = aData;
		}

		return maskingData;
	}
}
