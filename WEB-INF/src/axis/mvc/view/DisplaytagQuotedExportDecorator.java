package axis.mvc.view;

import javax.servlet.jsp.PageContext;

import org.displaytag.decorator.DisplaytagColumnDecorator;
import org.displaytag.properties.MediaTypeEnum;

/**
 * 
 * Utilizar cuando un export a Excel o CSV desde displaytag genera notaci�n
 * cientifica en el caso de numeros, y queremos verlo tal y cual.
 * 
 * Aplicarlo unoxuno en display:column, ejemplo:
 * 
 * <display:column title="TEST" media="csv excel xml" decorator=
 * "axis.mvc.view.DisplaytagQuotedExportDecorator">012345678901234567890123456789</display:column>
 * 
 */
public class

DisplaytagQuotedExportDecorator implements DisplaytagColumnDecorator {

	public Object decorate(Object value, PageContext pageContext, MediaTypeEnum media) {

		if (media.equals(MediaTypeEnum.EXCEL) || media.equals(MediaTypeEnum.CSV)) {

			value = "=\"" + value + "\"";

		}

		return value;

	}

}
