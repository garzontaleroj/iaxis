package axis.mvc.view;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * @author <a href="rkirchner@csi-ti.com>Roger Kirchner</a>
 * @version 1.0 Monta atributos para tags XML basandose en la informacion que se
 *          le envia por defecto (a) y lo que detecta en la request (obtenido de
 *          configform), filtrando por el componentes (c). <br />
 *          Nota: lo de la request siempre sobre escribe lo que viene por
 *          defecto
 */
public class AtributosTag extends TagSupport {
	static Log logger = LogFactory.getLog(AtributosTag.class);

	boolean enableDebug = false;

	String f = null; // form/whoami/pantalla
	String c = null; // componente
	String a = null; // atributos
	Boolean isInputText = null; // Es necesario?
	String isInputTextTmp = null;

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

	public void setA(String a) {
		this.a = a;
	}

	public String getA() {
		return a;
	}

	public Boolean getIsInputText() {
		return isInputText;
	}

	public void setIsInputText(Boolean isInputText) {
		this.isInputText = isInputText;
	}

	public int doStartTag() throws JspException {
		try {
			// Escribir en el JSP de salida los atributos del campo
			pageContext.getOut().print(procesar());
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el AtributosTag", e);
		}
		return EVAL_BODY_INCLUDE;
	}

	public int doEndTag() throws JspException {
		try {
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el AtributosTag", e);
		}
		return EVAL_PAGE;

	}

	public String procesar() throws Exception {

		Map map = (Map) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);

		Map atributosDefecto = new HashMap();

		/* Recuperamos si hemos puesto alg�n atributo por defecto */
		if (!isEmpty(getA())) {
			String[] atributosPorDefecto = getA().split("&");

			if (atributosPorDefecto.length == 0)
				// S�lo un par�metro
				atributosPorDefecto[0] = getA();
			isInputTextTmp = null;
			for (int i = 0; i < atributosPorDefecto.length; i++) {
				if (!isEmpty(atributosPorDefecto[i].split("=")[0]) && !isEmpty(atributosPorDefecto[i].split("=")[1])) { // Por
																														// ej->
																														// formato="entero"
					atributosDefecto.put(atributosPorDefecto[i].split("=")[0].trim().toLowerCase(), // Nombre Clave
							atributosPorDefecto[i].split("=")[1].trim().toLowerCase()); // Valor
					// Comprobamos la propiedad isInputText (si existe i que valor tiene)
					if ("isinputtext".equals(atributosPorDefecto[i].split("=")[0].trim().toLowerCase()))
						isInputTextTmp = atributosPorDefecto[i].split("=")[1].trim().toLowerCase();
				}
			}
		}

		/* StringBuffer para almacenar el resultado */
		StringBuffer sb = new StringBuffer();

		/* Empezamos a parsear los atributos */
		/* OBLIGATORIO */
		String llave = f + "__" + c + "__" + "obligatorio";
		String valor = "";
		if (!isEmpty(map))
			valor = ((String) map.get(llave));

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'obligatorio': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (!isEmpty(valor)) {
			// Concatenar el valor de la BD
			sb.append(" obligatorio=\"" + valor + "\"");
		} else {
			if (!isEmpty(atributosDefecto.get("obligatorio")))
				// Concatenar valor por defecto
				sb.append(" obligatorio=\"" + (String) atributosDefecto.get("obligatorio") + "\"");
		}

		/* MODIFICABLE */
		llave = f + "__" + c + "__" + "modificable";
		valor = "";

		// String atributoNoModificable = Boolean.valueOf(false).equals(isInputText()) ?
		// "disabled" : "readonly";
		String atributoNoModificable = "false".equals(isInputTextTmp) ? "disabled" : "readonly";

		if (!isEmpty(map))
			valor = ((String) map.get(llave));

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'modificable': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (!isEmpty(valor)) {
			// Concatenar el valor de la BD
			// OJO: MODIFICABLE es justo lo contrario de READONLY
			if (valor.equalsIgnoreCase("false"))
				sb.append(" " + atributoNoModificable);
		} else {
			if (!isEmpty(atributosDefecto.get("readonly"))
					&& ((String) (atributosDefecto.get("readonly"))).equalsIgnoreCase("true"))
				// Concatenar valor por defecto
				sb.append(" " + atributoNoModificable);
			else if (!isEmpty(atributosDefecto.get("modificable"))
					&& ((String) (atributosDefecto.get("modificable"))).equalsIgnoreCase("false")) {
				// Concatenar valor por defecto
				// OJO: MODIFICABLE es justo lo contrario de READONLY
				sb.append(" " + atributoNoModificable);
			}
		}

		/* FORMATO */
		llave = f + "__" + c + "__" + "formato";
		valor = "";
		if (!isEmpty(map))
			valor = ((String) map.get(llave));

		if (enableDebug)
			logger.debug("COMPONENTE: " + c + " 'formato': " + (!isEmpty(valor) ? valor : "No hay info en BD."));

		if (!isEmpty(valor)) {
			// Concatenar el valor de la BD
			sb.append(" formato=\"" + valor + "\"");
		} else {
			if (!isEmpty(atributosDefecto.get("formato")))
				// Concatenar valor por defecto
				sb.append(" formato=\"" + (String) atributosDefecto.get("formato") + "\"");
		}

		if (enableDebug)
			logger.debug("Finalmente el componente " + c + " queda con los atributos:" + sb);

		return sb.toString();
	}

	private boolean isEmpty(Object obj) {
		return AxisBaseService.isEmpty(obj);
	}
}
