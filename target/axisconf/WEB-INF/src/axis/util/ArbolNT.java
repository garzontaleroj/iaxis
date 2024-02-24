package axis.util;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class ArbolNT {
	BigDecimal id = null;
	Integer nivel = null;
	BigDecimal padreid = null;
	String descrip = null;
	String link = null;
	String accion = null;
	String form = null;
	String modo = null;

	ArrayList hijos = new ArrayList();
	private boolean expanded = false;

	private int maxisNiveles = 3;
	private ResourceBundle rB = null;

	private String traducir(String s) {
		try {
			return rB.getString(s);
		} catch (Exception e) {

			return "" + s + "";
		}

	}

	/**
	 * Monta un texto apto para jquerytreeview
	 * 
	 * @return
	 */
	public String toJqueryTreeviewString() {
		String TDESCRIP = this.descrip;
		StringBuffer sB = new StringBuffer();

		if (TDESCRIP == null || TDESCRIP.trim().length() == 0) {

			String nivelS = "";
			while (nivel.intValue() > nivelS.length())
				nivelS = nivelS + " ";

			sB.append(nivelS);

			if (hijos != null && hijos.size() > 0) {
				sB.append("\n").append(nivelS).append("<ul>\n");
				for (int i = 0; i < hijos.size(); i++) {
					sB.append(((ArbolNT) hijos.get(i)).toJqueryTreeviewString());
				}
				sB.append("\n").append(nivelS).append("</ul>\n");
			}
			sB.append(nivelS).append("\n");
		} else {
			TDESCRIP = traducir(TDESCRIP);
			String nivelS = "";
			while (nivel.intValue() > nivelS.length())
				nivelS = nivelS + " ";
			if (this.form != null) {
				TDESCRIP = "<a href=\"" + form + "\">" + TDESCRIP + "</a>";
			}
			sB.append(nivelS).append("<li><span>").append(TDESCRIP).append("</span>");
			if (hijos != null && hijos.size() > 0) {
				sB.append("\n").append(nivelS).append("<ul>\n");
				for (int i = 0; i < hijos.size(); i++) {
					sB.append(((ArbolNT) hijos.get(i)).toJqueryTreeviewString());
				}
				sB.append("\n").append(nivelS).append("</ul>\n");
			}
			sB.append(nivelS).append("</li>\n");
		}

		return sB.toString();
	}

	public String toString() {

		String TDESCRIP = this.descrip;
		TDESCRIP = traducir(TDESCRIP);

		StringBuffer sB = new StringBuffer();
		String nivelS = "";
		while (nivel.intValue() > nivelS.length())
			nivelS = nivelS + "+";
		sB.append(nivelS).append("[" + id + "]").append("[P:" + padreid + "]").append("'" + descrip + "'")
				.append(":" + TDESCRIP + ":").append("; hijos:" + hijos.size() + "\n");
		for (int i = 0; i < hijos.size(); i++) {
			sB.append((ArbolNT) hijos.get(i));
		}
		return sB.toString();
	}

	public String toXML() {

		String TDESCRIP = this.descrip;
		TDESCRIP = traducir(TDESCRIP);

		StringBuffer sB = new StringBuffer();
		String nivelS = "";
		while (nivel.intValue() > nivelS.length())
			nivelS = nivelS + " ";

		if (form == null)
			form = "";

		if (id != null && id.intValue() != 1) {
			sB.append(nivelS)
					.append("<item" + " modo=\"" + modo + "\" form=\"" + (form.equals("") ? "*" : form.toLowerCase())
							+ "\" opcion=\"" + id + "\" text=\"" + TDESCRIP + "\">")
					.append("\n");
		}

		for (int i = 0; i < hijos.size(); i++) {
			sB.append(((ArbolNT) hijos.get(i)).toXML());
		}

		if (id != null && id.intValue() != 1) {
			sB.append(nivelS).append("</item>").append("\n");
		}

		return sB.toString();
	}

	public String toXML_old() {

		String TDESCRIP = this.descrip;
		TDESCRIP = traducir(TDESCRIP);

		StringBuffer sB = new StringBuffer();
		String nivelS = "";
		while (nivel.intValue() > nivelS.length())
			nivelS = nivelS + " ";

		sB.append(nivelS).append("<hoja hijos=\"" + hijos.size() + "\">").append("\n");
		sB.append(nivelS + " ").append("<id>").append((id != null) ? "" + id : "").append("</id>").append("\n");
		sB.append(nivelS + " ").append("<padreid>").append((padreid != null) ? "" + padreid : "").append("</padreid>")
				.append("\n");
		sB.append(nivelS + " ").append("<descrip>").append((descrip != null) ? "" + descrip : "").append("</descrip>")
				.append("\n");
		sB.append(nivelS + " ").append("<TDESCRIP>").append((TDESCRIP != null) ? "" + TDESCRIP : "")
				.append("</TDESCRIP>").append("\n");
		sB.append(nivelS + " ").append("<link>").append((link != null) ? "" + link : "").append("</link>").append("\n");
		sB.append(nivelS + " ").append("<nivel>").append((nivel != null) ? "" + nivel : "").append("</nivel>")
				.append("\n");
		sB.append(nivelS + " ").append("<hijos padreid=\"" + ((id != null) ? "" + id : "") + "\">").append("\n");
		for (int i = 0; i < hijos.size(); i++) {
			sB.append(((ArbolNT) hijos.get(i)).toXML());
		}
		sB.append(nivelS + " ").append("</hijos>").append("\n");
		sB.append(nivelS).append("</hoja>").append("\n");

		return sB.toString();
	}

	public String toHTML() {

		String TDESCRIP = this.descrip;
		String SCRIPT = null;
		String ACTION = null;
		if (this.link != null && this.link.startsWith("action:")) {
			ACTION = this.link.substring("action:".length());
		}
		if (this.link != null && this.link.startsWith("script:")) {
			SCRIPT = this.link.substring("script:".length());
		}

		TDESCRIP = traducir(TDESCRIP);

		String p11 = "            <tr>\n"
				+ "            <td id=\"m$ID\" class=\"menusubtitulo\" onclick=\"toggleDisplay(this)\" onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td>\n"
				+ "            </tr>\n" + "            <tr id=\"m$ID_children\" style=\"display:none\">\n"
				+ "            <td style=\"padding-left:10px\">\n"
				+ "            <table style=\"100%\" align=\"right\" cellspacing=\"0\" cellpadding=\"0\">\n";
		String p12 = "            </table>\n" + "            </td>\n" + "            </tr>\n";

		String p2x = "            <tr><td id=\"m$ID\" class=\"menuitem\"  onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\" onclick=\"opcionclicked(this);opcionejecutarnt('FORM','"
				+ link
				+ "');\"><img src=\"images/icono_forms.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td></tr>\n";
		String p2xSCRIPT = "            <tr><td id=\"m$ID\" class=\"menuitem\"  onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\" onclick=\"opcionclicked(this);opcionejecutar_$SCRIPT(this);\"><img src=\"images/icono_forms.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td></tr>\n";
		String p2xACTION = "            <tr><td id=\"m$ID\" class=\"menuitem\"  onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\" onclick=\"opcionclicked(this);opcionejecutaraction('$ACTION');\"><img src=\"images/icono_forms.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td></tr>\n";
		String p3x = "<tr><td id=\"m$ID\" class=\"menusubtitulo\" onclick=\"toggleDisplayMore(this)\" onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>$DESCRIP<img id=\"im$ID\" src=\"images/icono_mas.gif\" border=\"0\" align=\"middle\"/></td></tr>\n";

		if (this.getExpanded()) {
			p11 = "            <tr>\n"
					+ "            <td id=\"m$ID\" class=\"menusubtitulo\"  onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td>\n"
					+ "            </tr>\n" + "            <tr id=\"m$ID_children\" style=\"display:\">\n"
					+ "            <td style=\"padding-left:10px\">\n"
					+ "            <table style=\"100%\" align=\"right\" cellspacing=\"0\" cellpadding=\"0\">\n";
			p3x = "<tr><td id=\"m$ID\" class=\"menusubtitulo\" onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>$DESCRIP<img id=\"im$ID\" src=\"images/icono_mas.gif\" border=\"0\" align=\"middle\"/></td></tr>\n";
		}

		if (ACTION != null)
			p2x = p2xACTION;
		if (SCRIPT != null)
			p2x = p2xSCRIPT;

		if (this.id != null)
			p11 = StringUtils.replace(p11, "$ID", "" + this.id.intValue());
		else
			p11 = StringUtils.replace(p11, "$ID", "99999");
		if (TDESCRIP != null)
			p11 = StringUtils.replace(p11, "$DESCRIP", "" + TDESCRIP);
		else
			p11 = StringUtils.replace(p11, "$DESCRIP", "(?)");
		if (this.id != null)
			p2x = StringUtils.replace(p2x, "$ID", "" + this.id.intValue());
		else
			p2x = StringUtils.replace(p2x, "$ID", "99999");
		if (TDESCRIP != null)
			p2x = StringUtils.replace(p2x, "$DESCRIP", "" + TDESCRIP);
		else
			p2x = StringUtils.replace(p2x, "$DESCRIP", "(?)");

		if (ACTION != null)
			p2x = StringUtils.replace(p2x, "$ACTION", "" + ACTION);
		if (SCRIPT != null)
			p2x = StringUtils.replace(p2x, "$SCRIPT", "" + SCRIPT);

		if (this.id != null)
			p3x = StringUtils.replace(p3x, "$ID", "" + this.id.intValue());
		else
			p3x = StringUtils.replace(p3x, "$ID", "99999");
		if (TDESCRIP != null)
			p3x = StringUtils.replace(p3x, "$DESCRIP", "" + TDESCRIP);
		else
			p3x = StringUtils.replace(p3x, "$DESCRIP", "(?)");

		StringBuffer sB = new StringBuffer();

		if (this.getNhijos() > 0) {
			if (this.nivel.intValue() < maxisNiveles) {
				sB.append(p11);
				for (int i = 0; i < hijos.size(); i++) {
					sB.append(((ArbolNT) hijos.get(i)).toHTML());
				}
				sB.append(p12);
			} else {
				sB.append(p3x);
			}

		} else {
			sB.append(p2x);
		}
		return sB.toString();

	}

	public String depr_toHTML() {
		String p11 = "            <tr>\n"
				+ "            <td id=\"m$ID\" class=\"menusubtitulo\" onclick=\"toggleDisplay(this)\" onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td>\n"
				+ "            </tr>\n" + "            <tr id=\"m$ID_children\" style=\"display:none\">\n"
				+ "            <td style=\"padding-left:10px\">\n"
				+ "            <table style=\"100%\" align=\"right\" cellspacing=\"0\" cellpadding=\"0\">\n";
		String p12 = "            </table>\n" + "            </td>\n" + "            </tr>\n";

		String p2x = "            <tr><td id=\"m$ID\" class=\"menuitem\"  onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\" onclick=\"opcionclicked(this);opcionejecutar(this);\"><img src=\"images/icono_forms.gif\" border=\"0\" align=\"middle\"/>$DESCRIP</td></tr>\n";

		String retVal = "";

		String TDESCRIP = this.descrip;
		TDESCRIP = traducir(TDESCRIP);

		if (this.hijos.size() > 0) {
			if (this.nivel.intValue() < maxisNiveles) {
				if (this.id != null)
					p11 = StringUtils.replace(p11, "$ID", "" + this.id.intValue());
				else
					p11 = StringUtils.replace(p11, "$ID", "99999");
				if (this.descrip != null)
					p11 = StringUtils.replace(p11, "$DESCRIP", TDESCRIP);
				else
					p11 = StringUtils.replace(p11, "$DESCRIP", "(?)");

				for (int i = 0; i < hijos.size(); i++) {
					retVal = retVal + p11;
					retVal = retVal + ((ArbolNT) hijos.get(i)).toHTML();
					retVal = retVal + p12;
				}
			} else {
				retVal = retVal + "<tr>\n";
				retVal = retVal + "<td id=\"m" + this.id.intValue()
						+ "\" class=\"menusubtitulo\" onclick=\"toggleDisplayMore(this)\" onmouseover=\"statusOn(this)\" onmouseout=\"statusOff(this)\"><img src=\"images/icono_submenu.gif\" border=\"0\" align=\"middle\"/>"
						+ TDESCRIP + " <img id=\"im" + this.id.intValue()
						+ "\" src=\"images/icono_mas.gif\" border=\"0\" align=\"middle\"/></td>\n";
				retVal = retVal + "</tr>\n";
			}

		} else {
			p2x = StringUtils.replace(p2x, "$ID", "" + this.id.intValue());
			p2x = StringUtils.replace(p2x, "$DESCRIP", TDESCRIP);

			retVal = retVal + p2x;
		}
		return retVal;
	}

	public ArbolNT(ArrayList a, BigDecimal ID, ResourceBundle rB, int maxisNiveles, boolean expanded) {
		this.maxisNiveles = maxisNiveles;
		this.expanded = expanded;

		this.rB = rB;

		if (ID != null) {
			for (int i = 0; i < a.size(); i++) {
				HashMap m = (HashMap) a.get(i);
				if (m.get("ID").equals(ID)) {
					id = new BigDecimal(m.get("ID").toString());

					// a veces NIVEL viene como Integer o BigDecimal. Asi lo controlamos de las 2
					// maneras
					if (m.get("NIVEL") != null && m.get("NIVEL").toString().trim().length() > 0) {
						nivel = new Integer(m.get("NIVEL").toString());
					}

					if (m.get("PADREID") != null) {
						padreid = new BigDecimal(m.get("PADREID").toString());
					} else {
						padreid = null;
					}

					// descrip = (String)m.get("DESCRIP");
					descrip = (String) m.get("LITERAL");
					// link = (String)m.get("LINK");
					form = (String) m.get("FORM");
					modo = (String) m.get("CMODO");
				}
			}
		} else {
			id = null;
			nivel = new Integer(0);
			padreid = null;
			descrip = null;
			link = null;
		}

		this.detectarHijos(a);
	}

	private void detectarHijos(ArrayList a) {
		for (int i = 0; i < a.size(); i++) {
			HashMap m = (HashMap) a.get(i);
			BigDecimal PADREID = (BigDecimal) m.get("PADREID");
			if (PADREID == null && id == null) {
				hijos.add(new ArbolNT(a, (BigDecimal) m.get("ID"), this.rB, this.maxisNiveles, this.expanded));
			}
			if (PADREID != null && PADREID.equals(id)) {
				hijos.add(new ArbolNT(a, (BigDecimal) m.get("ID"), this.rB, this.maxisNiveles, this.expanded));
			}
		}
	}

	public void setId(BigDecimal id) {
		this.id = id;
	}

	public BigDecimal getId() {
		return id;
	}

	public void setNivel(Integer nivel) {
		this.nivel = nivel;
	}

	public Integer getNivel() {
		return nivel;
	}

	public void setPadreid(BigDecimal padreid) {
		this.padreid = padreid;
	}

	public BigDecimal getPadreid() {
		return padreid;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getLink() {
		return link;
	}

	public int getNhijos() {
		return hijos.size();
	}

	public ArrayList getHijos() {
		return hijos;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	public boolean getExpanded() {
		return expanded;
	}

}