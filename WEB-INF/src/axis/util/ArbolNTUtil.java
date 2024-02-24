package axis.util;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_LOGIN;
import axis.jdbc.PAC_IAX_MENU;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;

public class ArbolNTUtil {
	static Log logger = LogFactory.getLog(ArbolNTUtil.class);

	public ArbolNTUtil() {
	}

	public static HashMap mFactory(String descrip, String link, BigDecimal id, BigDecimal padreid, Integer nivel) {
		HashMap retVal = new HashMap();
		retVal.put("DESCRIP", descrip);
		retVal.put("LINK", link);
		retVal.put("ID", id);
		retVal.put("PADREID", padreid);
		retVal.put("NIVEL", nivel);
		return retVal;
	}

	public static HashMap mFactory(String descrip, String link, Integer nivel) {
		HashMap retVal = new HashMap();
		retVal.put("DESCRIP", descrip);
		retVal.put("LINK", link);
		retVal.put("ID", null);
		retVal.put("PADREID", null);
		retVal.put("NIVEL", nivel);
		return retVal;
	}

	public static HashMap mFactory(String descrip, String link, Integer id, Integer padreid) {
		HashMap retVal = new HashMap();
		retVal.put("DESCRIP", descrip);
		retVal.put("LINK", link);
		retVal.put("ID", id);
		retVal.put("PADREID", padreid);
		retVal.put("NIVEL", null);
		return retVal;
	}

	/*
	 * Se supone que los hashmaps del arraylist vienen con la informacion de nivel,
	 * pero sin ids o padreids. Ademas, se asume que el orden respecto a niveles ya
	 * esta correcto!
	 */

	public static void preprocesarSinIdsConNiveles(ArrayList a) {
		HashMap tempData = new HashMap();

		for (int i = 0; i < a.size(); i++) {
			HashMap m = (HashMap) a.get(i);
			m.put("ID", new Integer(i + 1));
			m.put("PADREID", null);
			// HashMap m = (HashMap)a.get(i);
			if (m.get("NIVEL") != null) {
				m.put("NIVEL", (BigDecimal) m.get("NIVEL"));
				int NIVEL = ((BigDecimal) m.get("NIVEL")).intValue();
				// BigDecimal NIVEL = (BigDecimal)m.get("NIVEL");
				m.put("PADREID", tempData.get("ULTIMOIDCONNIVEL_" + (NIVEL - 1)));
				tempData.put("ULTIMOIDCONNIVEL_" + (NIVEL), m.get("ID"));
			}
		}

	}

	/*
	 * Se supone que los hashmaps del arraylist vienen con la de ids/padreids, pero
	 * sin niveles. Ademas, se asume que el orden respecto a ids/padresids ya esta
	 * correcto!
	 */

	public static void preprocesarConIdsSinNiveles(ArrayList a) {
		HashMap tempData = new HashMap();

		for (int i = 0; i < a.size(); i++) {
			HashMap m = (HashMap) a.get(i);
			tempData.put(m.get("ID"), m.get("PADREID")); // el padre de "ID" es "PADREID"
		}

		for (int i = 0; i < a.size(); i++) {
			HashMap m = (HashMap) a.get(i);
			BigDecimal ancestroid = (BigDecimal) tempData.get(m.get("ID"));
			int niveles = 1;
			while (ancestroid != null) {
				ancestroid = (BigDecimal) tempData.get(ancestroid);
				niveles++;
			}
			m.put("NIVEL", new Integer(niveles));
		}

	}

	public static void main(String[] args) throws Exception {
		// ecg20120124: en este ejemplo ense�amos como montar a base de la red comercial
		// un jquerytree con la ayuda de jquerytree
		Connection conn = ConexionFactoria.getConnectionFase2Directo("db01", "LCOL_V00", "LCOL_V00");
		PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(conn);
		pacIaxLogin.ejecutaPAC_IAX_LOGIN__P_IAX_INICONNECT("axis_lcol");
		PAC_IAX_REDCOMERCIAL x = new PAC_IAX_REDCOMERCIAL(conn);
		HashMap r = x.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_ARBOLREDCOMERCIAL(new BigDecimal(12),
				new java.sql.Date(112, 0, 13), null, null, null, null, BigDecimal.ONE);

		ArrayList lista = (ArrayList) r.get("RETURN");
		ArrayList lista2 = new ArrayList();
		HashMap m = null;
		// para ArbolNT necesitamos en cada map un ID, y un PADREID, ademas LITERAL,
		// FORM (js por ejecutar) y CMODO (aun no se utiliza)
		for (int i = 0; i < lista.size(); i++) {
			m = (HashMap) lista.get(i);

			m.put("ID", new BigDecimal(m.get("CODIGO").toString()));

			if (m.get("CPADRE") != null) {
				m.put("PADREID", new BigDecimal(m.get("CPADRE").toString()));
			} else {
				m.put("PADREID", null);
			}
			m.put("LITERAL", m.get("TNOMBRE"));
			m.put("FORM", "javascript:f_ver_detalle('" + m.get("CODIGO").toString() + "')");
			m.put("CMODO", null);
			lista2.add(m);
		}
		// Lista retocada con maps q contengan la info necesario para ArbolNT

		ArbolNTUtil.preprocesarConIdsSinNiveles(lista2); // listas con IDSs y PADREIDs, les faltan los NIVELes. Aqui lo
															// pongamos.

		// montamos un arbol a base de la lista, nodo incial es nulo, sin resource
		// bundle, maximo de niveles posibles
		ArbolNT h = new ArbolNT(lista2, null, null, 999, true);
		String jqueryTreeviewString = h.toJqueryTreeviewString();

		// a�adir al 1er ul el id con el cual jquerytree monta la estructura
		jqueryTreeviewString = StringUtils.replace(jqueryTreeviewString, "<ul>", "<ul id=\"example\">", 1);

		// Listo, imprima el jqueryTreeviewString. en axisage002.jsp (arbol red
		// comerical tienes un ejemplo)

	}

	public static void xmain(String[] args) throws Exception {
		// UsuarioBean usuario = new UsuarioBean("aaa","bbb");
		// usuario.setTipo(Const.USUARIO_LOGICO);
		// usuario.setUsuario("aaa");
		// usuario.setPassworddb("bbb");

		/*
		 * IAXAccesoPL axisAccesoPl = new IAXAccesoPL(usuario.getConnection("db01"));
		 * ArrayList __menu = axisAccesoPl.hashedPAC_EXTERNO__F_MENU(new BigDecimal(2));
		 * // TODO:el idioma no venga a saco ArrayList a = new ArrayList();
		 * System.out.println("__menu:\n" + __menu); HashMap m = null; BigDecimal NNIVEL
		 * = null; BigDecimal SLITERA = null; String TDESCRIP = null; String LINK =
		 * null; String DESCRIP = null; for (int i = 1; i < __menu.size(); i++) { // el
		 * primer "Menu" quitamos de la lista m =
		 * (HashMap)((HashMap)__menu.get(i)).get("OB_MENU"); NNIVEL =
		 * (BigDecimal)m.get("NNIVEL"); SLITERA = (BigDecimal)m.get("SLITERA"); TDESCRIP
		 * = (String)m.get("TDESCRIP"); if (TDESCRIP.indexOf("|") > 0) LINK =
		 * TDESCRIP.substring(TDESCRIP.indexOf("|")+1); else LINK = null;
		 * a.add(ArbolNTUtil.mFactory("" + SLITERA.intValue(), LINK, new
		 * Integer(NNIVEL.intValue())));
		 * 
		 * }
		 */

		/* Acceso a BBDD recuperamos el ResultSet */

		// UsuarioBean usuario = new UsuarioBean("cre_t05","cre_t05");

		try {

			Connection conexion;
			Statement s;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.10.15:1521:DELTA";
			String usuario = "cre_t05";
			String password = "cre_t05";

			conexion = DriverManager.getConnection(url, usuario, password);

			PAC_IAX_MENU pacIaxMenu = new PAC_IAX_MENU(conexion);
			Map map = pacIaxMenu.ejecutaPAC_IAX_MENU__F_GET_MENU(new BigDecimal(1));

			List menu = map.get("RETURN") != null ? (List) map.get("RETURN") : new ArrayList();

			/* Fin de acceso a BBDD */
			// vas a la BBDD
			// recuperas el f_menu como arraylist (resultset) y lo dejas en la variable "a"
			ArrayList a = null; // recuperar de la BBDD

			a = (ArrayList) menu;
			// logger.debug("a:"+a);
			ArbolNTUtil.preprocesarSinIdsConNiveles(a); // te pone IDs y PADREIDs

			// ArbolNT h=new ArbolNT(a, null, ResourceBundle.getBundle("messages", new
			// Locale("es_ES")) , 3, false);
			ArbolNT h = new ArbolNT(a, null, null, 999, false);

			// logger.debug(ArbolNTUtil.wrapHTML(h, true));
			// logger.debug(ArbolNTUtil.wrapXML(h, true, "ca"));

			/*
			 * ArbolNTUtil hojaUtil = new ArbolNTUtil();
			 * 
			 * // probar sin Ids: ArrayList a = ArbolNTUtil.arrayListSinIds();
			 * ArbolNTUtil.preprocesarSinIdsConNiveles(a ); for (int i=0;i<a.size();i++) {
			 * logger.debug(a.get(i)); }
			 */
			// probar con Ids:
			/*
			 * ArrayList a = HojaUtil.arrayListConIds();
			 * HojaUtil.preprocesarConIdsSinNiveles(a); for (int i = 0; i < a.size(); i++) {
			 * logger.debug(a.get(i)); }
			 * 
			 * ArbolNT h=new ArbolNT(a, null, ResourceBundle.getBundle("messages", new
			 * Locale("es_ES")) , 3);
			 * 
			 * logger.debug(ArbolNTUtil.wrapHTML(h, true));
			 */

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public static String wrapXML(ArbolNT h, boolean soloHijos, String locale) {
		StringBuffer sB = new StringBuffer();
		sB.append("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n");
		// sB.append("<?xml-stylesheet type=\"text/xsl\" href=\"menu2.xslt\"?>\n");
		// sB.append("<?xml-stylesheet type=\"text/xsl\" href=\"/xsl/menu1.xsl\"
		// encoding=\"ISO-8859-1\" ?>\n");
		sB.append("<menu>\n"); // sB.append("<root>\n");
		if (soloHijos) {
			for (int i = 0; i < h.getNhijos(); i++) {
				sB.append(((ArbolNT) h.getHijos().get(i)).toXML());
			}
		} else {
			sB.append(h.toXML());
		}
		try {
			sB.append("<item text=\"" + Traductor.traducir(locale, "100000") + "\"/>\n");
		} catch (Exception e) {
			sB.append("<item text=\"Sortir\"/>\n");
		}
		sB.append("</menu>\n"); // sB.append("</root>\n");
		return sB.toString();
	}

	public static String wrapHTML(ArbolNT h, boolean soloHijos) {
		StringBuffer sB = new StringBuffer();
		if (soloHijos) {
			for (int i = 0; i < h.getNhijos(); i++) {
				sB.append(((ArbolNT) h.getHijos().get(i)).toHTML());
			}
		} else {
			sB.append(h.toHTML());
		}
		return sB.toString();
	}

	public static String wrapString(ArbolNT h, boolean soloHijos) {
		StringBuffer sB = new StringBuffer();
		if (soloHijos) {
			for (int i = 0; i < h.getNhijos(); i++) {
				sB.append(((ArbolNT) h.getHijos().get(i)).toString());
			}
		} else {
			sB.append(h.toString());
		}

		return sB.toString();
	}

	private static final ArrayList arrayListSinIds() {
		/*
		 * ejemplo: se va a montar este menu: TITULO_1 (__NIVEL=1, SLITERA=S1,
		 * TDESCRIP=T|) ITEM_1_1-->A11 (__NIVEL=2, SLITERA=S2, TDESCRIP=T|A11)
		 * TITULO_1_3 (__NIVEL=2, SLITERA=S3, TDESCRIP=T|) TITULO_1_3_1 (__NIVEL=3,
		 * SLITERA=S4, TDESCRIP=T|) ITEM_1_3_1_1-->A1311 (__NIVEL=4, SLITERA=S5,
		 * TDESCRIP=T|A1311) ITEM_1_3_2-->A132 (__NIVEL=3, SLITERA=S6, TDESCRIP=T|A132)
		 * TITULO_1_3_3 (__NIVEL=3, SLITERA=S7, TDESCRIP=T|) ITEM_1_3_3_1-->A1331
		 * (__NIVEL=4, SLITERA=S8, TDESCRIP=T|A1331) ITEM_1_3_3_2-->A1332 (__NIVEL=4,
		 * SLITERA=S9, TDESCRIP=T|A1332) ITEM_2-->A2 (__NIVEL=1,
		 * SLITERA=S10,TDESCRIP=T|A2)
		 */

		ArrayList a = new ArrayList();
		a.add(ArbolNTUtil.mFactory("S1", null, null, null, new Integer(1)));
		a.add(ArbolNTUtil.mFactory("S2", "A11", null, null, new Integer(2)));
		a.add(ArbolNTUtil.mFactory("S3", null, null, null, new Integer(2)));
		a.add(ArbolNTUtil.mFactory("S4", null, null, null, new Integer(3)));
		a.add(ArbolNTUtil.mFactory("S5", "A1311", null, null, new Integer(4)));
		a.add(ArbolNTUtil.mFactory("S6", "A132", null, null, new Integer(3)));
		a.add(ArbolNTUtil.mFactory("S7", null, null, null, new Integer(3)));
		a.add(ArbolNTUtil.mFactory("S8", "A1331", null, null, new Integer(4)));
		a.add(ArbolNTUtil.mFactory("S9", "A1332", null, null, new Integer(4)));
		a.add(ArbolNTUtil.mFactory("S10", "A2", null, null, new Integer(1)));
		return a;
	}

	public static final ArrayList recolocararray(ArrayList arraymenu) {
		ArrayList resultat = new ArrayList();
		try {

			for (int i = 0; i < arraymenu.size(); i++) {
				HashMap menu = (HashMap) arraymenu.get(i);
				BigDecimal ancestroid = new BigDecimal(String.valueOf(menu.get("CMENPAD")));
				BigDecimal CMENUprincipal = new BigDecimal(String.valueOf(menu.get("COPCION")));
				if (ancestroid.intValue() == 0) {
					resultat.add((HashMap) arraymenu.get(i));
					mirarquipenja(CMENUprincipal.intValue(), arraymenu, resultat);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultat;

	}

	private static void mirarquipenja(int menu, ArrayList arraymenu, ArrayList resultat) {

		for (int i = 0; i < arraymenu.size(); i++) {
			HashMap menuh = (HashMap) arraymenu.get(i);
			BigDecimal ancestroid = new BigDecimal(String.valueOf(menuh.get("CMENPAD")));
			BigDecimal cmenu = new BigDecimal(String.valueOf(menuh.get("COPCION")));

			if (ancestroid.intValue() == menu) {
				resultat.add(menuh);
				mirarquipenja(cmenu.intValue(), arraymenu, resultat);
			}

		}
	}

}
