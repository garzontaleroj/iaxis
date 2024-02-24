package axis.mvc.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class EncryptTag extends TagSupport {
	static Log logger = LogFactory.getLog(VisibleTag.class);

	boolean enableDebug = false;

	String f = null; // form/whoami/pantalla
	String c = null; // campo/item/componente/parrafo
	String value = null; // valor/dato a encriptar

	HttpServletRequest request = null;

	public EncryptTag() {
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
			logger.warn("No se ha podido ejecutar el MascTag (f=" + f + ",c=" + c + "): " + e.getLocalizedMessage());
			e.getMessage();
		}

		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	private String procesar() throws Exception {

		Map map = (Map) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);
		AESUtil encryptedVal = new AESUtil();

		String encryptData = "", clave = f + "__" + c + "__" + "encrypt", valor = "0";

		if (map.get(clave) != null) {
			valor = (String) map.get(clave);
		} else {
			logger.warn("No se encuentra valor para el tag, en la parametrizaci�n");
		}

		encryptData = Integer.valueOf(valor) == 1 ? encryptedVal.encrypt(this.getValue())
				: (this.getValue() != null ? this.getValue() : "");

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'encrypt': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (enableDebug)
			logger.debug("Finalmente, el componente " + c + " queda encriptado=\"" + encryptData + "\"");

		logger.debug("[DEBUG] [EncryptTag] valor:       " + valor);
		logger.debug("[DEBUG] [EncryptTag] tag value:   " + this.getValue());
		logger.debug("[DEBUG] [EncryptTag] encryptData: " + encryptData);

		return encryptData;
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}

}
