package axis.mvc.view;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;

public class TablaTag extends TagSupport {
	static Log logger = LogFactory.getLog(TablaTag.class);
	ArrayList name = null;
	String miid = null;
	String style = null;
	String styleClass = null;
	String cellspacing = null;
	String cellpadding = null;
	String titulos = null;
	String campos = null;
	String estilos = null;
	String objeto = null;

	String columnHeaderClass = null;
	String iconsImages = null;
	String iconsInfo = null;

	private String[] titulos_s = null;
	private String[] campos_s = null;
	private String[] campos_ordenables_s = null;
	private String[] estilos_s = null;

	private String[] columnHeaderClass_s = null;
	private String[] iconsImages_s = null;
	private String[] iconsInfo_s = null;

	/*
	 * POJO de la classe
	 */
	public void setName(ArrayList name) {
		this.name = name;
	}

	public ArrayList getName() {
		return name;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getStyle() {
		return style;
	}

	public void setCellspacing(String cellspacing) {
		this.cellspacing = cellspacing;
	}

	public String getCellspacing() {
		return cellspacing;
	}

	public void setCellpadding(String cellpadding) {
		this.cellpadding = cellpadding;
	}

	public String getCellpadding() {
		return cellpadding;
	}

	public void setTitulos(String titulos) {
		this.titulos = titulos;
	}

	public String getTitulos() {
		return titulos;
	}

	public void setCampos(String campos) {
		this.campos = campos;
	}

	public String getCampos() {
		return campos;
	}

	public void setEstilos(String estilos) {
		this.estilos = estilos;
	}

	public String getEstilos() {
		return estilos;
	}

	public void setStyleClass(String styleClass) {
		this.styleClass = styleClass;
	}

	public String getStyleClass() {
		return styleClass;
	}

	public void setObjeto(String objeto) {
		this.objeto = objeto;
	}

	public String getObjeto() {
		return objeto;
	}

	public void setMiid(String miid) {
		this.miid = miid;
	}

	public String getMiid() {
		return miid;
	}

	public void setColumnHeaderClass(String columnHeaderClass) {
		this.columnHeaderClass = columnHeaderClass;
	}

	public String getColumnHeaderClass() {
		return columnHeaderClass;
	}

	public void setIconsImages(String iconsImages) {
		this.iconsImages = iconsImages;
	}

	public String getIconsImages() {
		return iconsImages;
	}

	public void setIconsInfo(String iconsInfo) {
		this.iconsInfo = iconsInfo;
	}

	public String getIconsInfo() {
		return iconsInfo;
	}

	public int doStartTag() throws JspException {
		try {
			procesar();
		} catch (Exception e) {
			logger.error("No se ha podido ejecutar el TablaTag", e);
		}
		return SKIP_BODY;
	}

	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	public void procesar() throws Exception {
		String a_pintar = new String();
		StringBuffer retVal = new StringBuffer();
		try {
			estilos_s = ((!AxisBaseService.isEmpty(this.getEstilos())) ? this.getEstilos().split("#") : null);
			campos_s = ((!AxisBaseService.isEmpty(this.getCampos())) ? this.getCampos().split("#") : null);
			titulos_s = ((!AxisBaseService.isEmpty(this.getTitulos())) ? this.getTitulos().split("@@") : null);

			// TODO: Lo siguiente es para debugar qu� separador poner en los t�tulos
			/*
			 * logger.debug("TITULOS: " + this.getTitulos());
			 * logger.debug("TITULOS SEPARADOS: "); for (int i = 0; i < campos_s.length;
			 * i++) logger.debug(titulos_s[i]);
			 */
			// END DEBUG

			campos_ordenables_s = new String[campos_s.length];

			for (int i = 0; i < campos_s.length; i++) {
				if (campos_s[i].endsWith("(O)")) {
					// Es campo ordenable
					campos_s[i] = StringUtils.replace(campos_s[i], "(O)", "");
					campos_ordenables_s[i] = campos_s[i];
				}
			}

			if (!AxisBaseService.isEmpty(this.getColumnHeaderClass()))
				columnHeaderClass_s = this.getColumnHeaderClass().split("#");
			else {
				if (!AxisBaseService.isEmpty(campos_s)) {
					columnHeaderClass_s = new String[campos_s.length];
					columnHeaderClass_s[0] = "headwidth5 sortable gridsorted gridasc";
					for (int i = 1; i < columnHeaderClass_s.length; i++)
						columnHeaderClass_s[i] = "sortable gridsorted gridasc";
				}
			}

			if (!AxisBaseService.isEmpty(iconsImages))
				iconsImages_s = iconsImages.split("#");

			if (!AxisBaseService.isEmpty(iconsInfo))
				iconsInfo_s = iconsInfo.split("#");

			a_pintar = montarTexto();

		} catch (Exception e) {
			logger.error(e);
			retVal.append("<table>\n");
			retVal.append("<thead><tr>\n");
			retVal.append("<th>Error</th>\n");
			retVal.append("</tr></thead>\n");
			retVal.append("<tbody>\n");
			retVal.append("<tr><td>Exception into axis:tabla</td></tr>\n");
			retVal.append("</tbody>\n");
			a_pintar = retVal.toString();
		}

		pageContext.getOut().write(a_pintar);
	}

	private String montarTexto() {
		StringBuffer retVal = new StringBuffer();

		Map map = null;
		Object dato = null;
		String divStyle = null;
		int posIcon = 0;
		int posAlt = 0;
		String iconTemp = new String("");
		String[] infoTemp = null;
		String altTemp = new String("");
		String functionTemp = new String("");

		if (!AxisBaseService.isEmpty(this.getName())) {
			// <table...>
			retVal.append("<table");
			retVal.append(
					(!AxisBaseService.isEmpty(this.getCellpadding())) ? " cellpadding=\"" + this.getCellpadding() + "\""
							: "");
			retVal.append(
					(!AxisBaseService.isEmpty(this.getCellspacing())) ? " cellspacing=\"" + this.getCellspacing() + "\""
							: "");
			retVal.append(" id=\"" + id + "\"");
			retVal.append(" class=\"dsptgtable grid\"");
			retVal.append(">\n");

			// <thead>
			retVal.append("<thead><tr>\n");

			if (!AxisBaseService.isEmpty(titulos_s))
				for (int i = 0; i < titulos_s.length; i++) {
					if (campos_s[i].equals(campos_ordenables_s[i]) && !titulos_s[i].equals("")) {
						retVal.append("<th class=\" gridsortable "
								+ (!AxisBaseService.isEmpty(columnHeaderClass_s) ? columnHeaderClass_s[i].trim() : "")
								+ "\">").append(" <a href=\"javascript:f_ordenar(");
						retVal.append("'" + campos_s[i] + "', '" + miid + "', '" + objeto + "'");
						retVal.append(")\">").append(titulos_s[i]).append("</a></th>\n");
					} else {
						retVal.append("<th class=\""
								+ ((!AxisBaseService.isEmpty(columnHeaderClass_s)) ? columnHeaderClass_s[i].trim() : "")
								+ "\">").append(((!AxisBaseService.isEmpty(titulos_s)) ? titulos_s[i].trim() : ""))
								.append("</th>\n");
					}

				}
			retVal.append("</tr></thead>\n");

			// <tbody>
			retVal.append("<tbody>\n");

			for (int j = 0; j < this.getName().size(); j++) {
				retVal.append("<tr");
				retVal.append(" class=\"" + ((j % 2 == 0) ? "gridNotEven" : "gridEven") + "\"");
				retVal.append(">\n");

				map = (Map) this.getName().get(j);

				if (!AxisBaseService.isEmpty(campos_s)) {
					for (int i = 0; i < campos_s.length; i++) {

						if (!AxisBaseService.isEmpty(estilos_s[i])) {
							if (estilos_s[i].trim().startsWith("style:"))
								retVal.append("<td style=\"" + estilos_s[i].trim().substring("style:".length()) + "\"");
							else
								retVal.append("<td><div class=\"" + estilos_s[i].trim() + "\">");
						} else
							retVal.append("<td><div>");

						/**** RECUPERAR EL VALOR DE LES DADES ******/
						if (!AxisBaseService.isEmpty(objeto)) {
							Map ObjetoTemp = (Map) map.get(objeto);
							if (!AxisBaseService.isEmpty(ObjetoTemp)) {
								// Verificar campos
								dato = ((!AxisBaseService.isEmpty(campos_s[i])) ? ObjetoTemp.get(campos_s[i].trim())
										: null);

							} else
								dato = null;
						} else
							dato = ((!AxisBaseService.isEmpty(campos_s[i])) ? map.get(campos_s[i].trim()) : null);

						/**** FI RECUPERAR EL VALOR DE LES DADES ******/

						if (AxisBaseService.isEmpty(dato))
							retVal.append(new String(""));
						else {
							divStyle = ((!AxisBaseService.isEmpty(estilos_s[i])) ? estilos_s[i].trim() : null);
							if (!AxisBaseService.isEmpty(divStyle) && divStyle.equalsIgnoreCase("dspText"))
								retVal.append(dato.toString());
							else if (!AxisBaseService.isEmpty(divStyle) && divStyle.equalsIgnoreCase("dspNumber"))
								retVal.append(new BigDecimal(dato.toString()));
							else if (!AxisBaseService.isEmpty(divStyle) && divStyle.equalsIgnoreCase("dspDate"))
								retVal.append(new SimpleDateFormat("dd/MM/yyyy").format(dato));
							else if (!AxisBaseService.isEmpty(divStyle) && divStyle.equalsIgnoreCase("dspIcons")) {
								if (!AxisBaseService.isEmpty(iconsImages_s[posIcon]))
									iconTemp = "src=\"" + iconsImages_s[posIcon].trim() + "\"";
								else
									iconTemp = "src=\"";

								if (!AxisBaseService.isEmpty(iconsInfo_s[posAlt])) {
									infoTemp = iconsInfo_s[posAlt].split("%");
									altTemp = ((!AxisBaseService.isEmpty(infoTemp))
											? "title=\"" + infoTemp[0].trim() + "\"  alt=\"" + infoTemp[0].trim() + "\""
											: "alt=\"\"");

									functionTemp = ((!AxisBaseService.isEmpty(infoTemp) && infoTemp.length > 0)
											? "href=\"javascript:" + infoTemp[1].trim() + "('" + dato.toString()
													+ "')\""
											: "href=\"javascript:void(0)\"");

								} else {
									altTemp = "alt=\"\"";
									functionTemp = "href=\"javascript:void(0)\"";
								}
								retVal.append("<a " + functionTemp + "\"><img border=\"0\" " + altTemp + " " + iconTemp
										+ " style=\"cursor:pointer;vertical-align:middle;\"/></a>");

								iconTemp = "";
								altTemp = "";
								functionTemp = "";

								posIcon = ((!AxisBaseService.isEmpty(iconTemp)) ? posIcon + 1 : posIcon);
								posAlt = ((!AxisBaseService.isEmpty(altTemp) || !AxisBaseService.isEmpty(functionTemp))
										? posAlt + 1
										: posAlt);

							} else
								retVal.append(dato);

						}
						if (!AxisBaseService.isEmpty(estilos_s[i]) && estilos_s[i].trim().startsWith("style:"))
							retVal.append("\n</td>");
						else
							retVal.append("\n</div></td>");
					}
					retVal.append("</tr>\n");
				} // Fi for
			} // Fi if
			retVal.append("</tbody>\n");

			retVal.append("</table>\n");
		}
		return retVal.toString();
	}

}

/*
 * 
 * <table cellpadding="0" class="dsptgtable grid" cellspacing="0"
 * id="miclausulasprod"> <thead> <tr> <th
 * class="headwidth5 sortable gridsorted gridasc">Tipo</th> <th
 * class="headwidth5 sortable">Identificador</th> <th
 * class="headwidth5 sortable">Clave</th> </tr> </thead> <tbody> <tr
 * class="gridNotEven"> <td> <div class="dspText">4</div> </td> <td> <div
 * class="dspText">2</div> </td> <td> <div class="dspText">10</div> </td> </tr>
 * </tbody> </table>
 * 
 * 
 * 
 */