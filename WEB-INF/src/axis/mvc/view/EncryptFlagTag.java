package axis.mvc.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class EncryptFlagTag extends TagSupport {
	static Log logger = LogFactory.getLog(VisibleTag.class);

	boolean enableDebug = false;

	String f = null; // form/whoami/pantalla
	String c = null; // campo/item/componente/parrafo

	HttpServletRequest request = null;

	public EncryptFlagTag() {
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

	public int doStartTag() throws JspException {
		try {
			pageContext.getOut().print(procesar());
		} catch (Exception e) {
			logger.warn(
					"No se ha podido ejecutar el EncryptFlagTag (f=" + f + ",c=" + c + "): " + e.getLocalizedMessage());
			e.getMessage();
		}

		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	private String procesar() throws Exception {

		Map map = (Map) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);

		// String encryptData = "<input name=\"encrypt_" + c + "\" type=\"hidden\"
		// value=\"",
		String encryptData = "<input name=\"encrypt_" + c + "\"  id=\"encrypt_" + c + "\"  type=\"hidden\" value=\"",
				clave = f + "__" + c + "__" + "encrypt", valor = "0";

		if (map.get(clave) != null) {
			valor = (String) map.get(clave);
		} else {
			logger.warn("No se encuentra valor para el tag, en la parametrizaci�n");
		}

		if (Integer.valueOf(valor) == 1) {
			encryptData += "1\" />";
		} else {
			encryptData += "0\" />";
		}

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'encrypt': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (enableDebug)
			logger.debug("Finalmente, el componente " + c + " queda encriptado=\"" + encryptData + "\"");

		logger.debug("[DEBUG] [EncryptFlagTag] valor:       " + valor);
		logger.debug("[DEBUG] [EncryptFlagTag] encryptData: " + encryptData);

		return encryptData;
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}

}
