package axis.mvc.control;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileReader;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import axis.service.axis.AxisBaseService;
import axis.util.Traductor;

public class ParsealiteralesAction extends AbstractDispatchAction {
	static Log logger = LogFactory.getLog(AjaxAction.class);

	private Vector itemsJSP = new Vector();
	private Vector itemsJAVA = new Vector();

	private Vector itemsJSPTraducidos = new Vector();
	private Vector itemsJAVATraducidos = new Vector();

	private Vector itemsNoTraducidos = new Vector();

	/**
	 * M�todo que limpia las variables de instancia de la clase.
	 * 
	 * @throws Exception
	 */
	private synchronized void vaciarObjetosParseo() throws Exception {
		if (!AxisBaseService.isEmpty(itemsJSP))
			itemsJSP.removeAllElements();
		if (!AxisBaseService.isEmpty(itemsJAVA))
			itemsJAVA.removeAllElements();
		if (!AxisBaseService.isEmpty(itemsJSPTraducidos))
			itemsJSPTraducidos.removeAllElements();
		if (!AxisBaseService.isEmpty(itemsJAVATraducidos))
			itemsJAVATraducidos.removeAllElements();
		if (!AxisBaseService.isEmpty(itemsNoTraducidos))
			itemsNoTraducidos.removeAllElements();
	}

	/**
	 * M�todo que guarda en una lista los ficheros de una directorio (dirName) segun
	 * la extensi�n pedida
	 * 
	 * @param dirName
	 * @param ext
	 * @return
	 * @throws Exception
	 */
	private List doFileFilterDirectoryAndFilesListing(String dirName, String ext) throws Exception {

		List listaFicheros = new ArrayList();
		final String fileFilter = ext;
		File mainDir = new File(dirName);
		File[] dirs = mainDir.listFiles();

		String mainDirSA = parseaArrays(mainDir.toString(), "public_html", File.separator)[1];

		// Filtro que devuelve directorios
		FileFilter dirFilter = new FileFilter() {
			public boolean accept(File dir) {
				return dir.isDirectory();
			}
		};

		// Filtro que devuelve ficheros con extensi�n
		FilenameFilter filter = new FilenameFilter() {
			public boolean accept(File dir, String name) {
				return name.endsWith("." + fileFilter);
			}
		};

		dirs = mainDir.listFiles(dirFilter);
		File[] files = mainDir.listFiles(filter);

		if (dirs.length > 0) {

			// logger.debug("Listado de directorios de " + mainDirSA + " :");
			// logger.debug("---------------------------");

			for (int i = 0; i < dirs.length; i++) {
				String dirsS = parseaArrays(dirs[i].toString(), "public_html", File.separator)[1];
				// logger.debug(mainDirSA + " [D] : " + dirsS);
				listaFicheros.addAll(doFileFilterDirectoryAndFilesListing(dirs[i].toString(), fileFilter));
			}
		} else {
			// logger.debug("El directorio " + mainDirSA + " no tiene directorios.");
		}

		if (files.length > 0) {

			// logger.debug("Listado de ficheros del directorio " + mainDirSA + " :");
			// logger.debug("----------------------");

			for (int j = 0; j < files.length; j++) {
				String filesS = parseaArrays(files[j].toString(), "public_html", File.separator)[1];
				listaFicheros.add(files[j]);
				logger.debug("A�adiendo del directorio: " + mainDirSA + " el fichero [F] : " + filesS);
			}

		} else {
			// logger.debug("El directorio " + mainDirSA + " no tiene archivos de la
			// extensi�n " + ext + ".");
		}

		// logger.debug("");

		return listaFicheros;
	}

	/**
	 * M�todo para obtener una ruta mas especifica de un fichero/directorio
	 * 
	 * @param cadena    a dividir
	 * @param divisor   Elemento divisor
	 * @param cadenaAlt Si peta, que devuelva un string alternativo
	 * @return
	 * @throws Exception
	 */
	private String[] parseaArrays(String cadena, String divisor, String cadenaAlt) throws Exception {
		String[] strFinal = cadena.split(divisor);

		if (strFinal.length > 1) {
			return strFinal;
		} else {
			strFinal = new String[2];
			strFinal[1] = cadenaAlt;
		}
		return strFinal;
	}

	/**
	 * M�todo que se encarga de listar los archivos de una determinada extension
	 * colgados en el directorio /public_html de la aplicaci�n y parsearlos para
	 * mostrar los literales en pantalla.
	 * 
	 * @param request
	 * @param dir
	 * @param extension
	 * @param locale
	 * @param items
	 * @param itemsTraducidos
	 * @return
	 * @throws Exception
	 */
	private synchronized void parseador(HttpServletRequest request, String dir, String extension, String locale,
			Vector items, Vector itemsTraducidos) throws Exception {

		List listaFicheros = this.doFileFilterDirectoryAndFilesListing(dir, extension);

		if (!AxisBaseService.isEmpty(listaFicheros)) {
			for (int i = 0; i < listaFicheros.size(); i++) {
				File ficheroTmp = (File) listaFicheros.get(i);

				logger.debug("Parseando ( " + extension + " ): " + ficheroTmp.getName());

				if (extension.equals("java") && !ficheroTmp.getName().equals("ParsealiteralesAction.java"))
					parseJava(ficheroTmp);
				if (extension.equals("jsp"))
					parseJSP(ficheroTmp);
			}

			Collections.sort(items);
			logger.debug("ITEMS: " + items);
			traducir(items, itemsTraducidos, itemsNoTraducidos, locale);
			// logger.debug("TRADUCIDOS OK: " + itemsTraducidos);
			// logger.debug("TRADUCIDOS KO: " + itemsNoTraducidos);

		} else {
			request.setAttribute("items", "ERROR! No hay ficheros que parsear con extensi�n: " + extension + ".");
		}
	}

	/**
	 * M�todo que parsea los ficheros con extensi�n JSP
	 * 
	 * @param jspFile
	 * @throws Exception
	 */
	private synchronized void parseJSP(File jspFile) throws Exception {
		StringBuffer sB = null;

		try {
			BufferedReader br = new BufferedReader(new FileReader(jspFile));
			int b = 0;
			sB = new StringBuffer();
			while (true) {
				b = br.read();
				if (b < 0)
					break;
				sB.append((char) b);
			}
			// System.out.println("Fichero como texto recuperado....");
			String item = null;
			// parse sB por <fmt:message 's
			String jspString = sB.toString();

			while (jspString.indexOf("<fmt:message") >= 0) {
				int offset = jspString.indexOf("<fmt:message");
				int til = jspString.indexOf("/>", offset);

				item = jspString.substring(offset, til);

				String tempItem = item;

				if (item.indexOf("'") >= 0) {
					item = item.substring(item.indexOf("'") + 1);
					item = item.substring(0, item.indexOf("'"));
				} else {
					item = item.substring(item.indexOf("\"") + 1);
					item = item.substring(0, item.indexOf("\""));
				}

				item = item + "#" + jspFile.getName();

				if (!itemsJSP.contains(item)) {
					itemsJSP.addElement(item);
					// System.out.println("Item a�adido:"+item);
				}

				jspString = StringUtils.replace(jspString, tempItem, "[OK]");

			}

		} catch (Exception e) {
			logger.error("Error de jsp: ", e);
		}
		// System.out.println(items);
	}

	/**
	 * M�todo que parsea los ficheros con extensi�n JAVA
	 * 
	 * @param javaFile
	 * @throws Exception
	 */
	private synchronized void parseJava(File javaFile) throws Exception {
		StringBuffer sB = null;
		String item = null;
		String itemTmp = null;
		String javaString = null;

		try {
			BufferedReader br = new BufferedReader(new FileReader(javaFile));
			int b = 0;
			sB = new StringBuffer();
			while (true) {
				b = br.read();
				if (b < 0)
					break;
				sB.append((char) b);
			}
			// System.out.println("Fichero como texto recuperado....");
			// parse sB por guardarMensaje
			javaString = sB.toString();

			// Comprueba que no sea la cabecera del m�todo (Map guardarMensaje o void
			// guardarMensaje) y si una llamada al
			// m�todo.
			while (javaString.indexOf("void guardarMensaje") < 0 && javaString.indexOf("Map guardarMensaje") < 0
					&& javaString.indexOf("guardarMensaje") >= 0) {

				int offset = javaString.indexOf("guardarMensaje");
				int til = javaString.indexOf(";", offset);
				itemTmp = javaString.substring(offset, til);
				String tempItem = itemTmp;

				if (tempItem.indexOf("\"") >= 0) {
					itemTmp = itemTmp.substring(itemTmp.indexOf("\"") + 1);
					itemTmp = itemTmp.substring(0, itemTmp.indexOf("\""));
					item = itemTmp + "#" + javaFile.getName();
				}

				if (!AxisBaseService.isEmpty(item) && !itemsJAVA.contains(item)) {
					itemsJAVA.addElement(item);
					// System.out.println("Item a�adido:"+item);
				}

				javaString = StringUtils.replace(javaString, tempItem, "[OK]");
			}

		} catch (Exception e) {
			logger.error("error java", e);
		}
		// System.out.println(items);
	}

	/**
	 * M�todo que intenta traducir los literales encontrados durante el parseo. Los
	 * que se puedan traducir, se guardan en un vector. Los que no, en otro Vector.
	 * 
	 * @param itemsTmp
	 * @param itemsTraducidosTmp
	 * @param itemsNoTraducidosTmp
	 * @param locale
	 * @throws Exception
	 */
	private static void traducir(Vector itemsTmp, Vector itemsTraducidosTmp, Vector itemsNoTraducidosTmp, String locale)
			throws Exception {
		String item = null;
		String itemAdd = null;

		for (int i = 0; i < itemsTmp.size(); i++) {
			String itemArray[] = new String[2];
			item = (String) itemsTmp.elementAt(i);

			itemArray = item.split("#");
			item = itemArray[0];

			try {
				String traduccion = Traductor.s_traducir(locale, item);
				itemAdd = item + "#" + traduccion;

				if (hayErroresDeTraduccion(traduccion)) {
					if (!itemsNoTraducidosTmp.contains(item))
						itemsNoTraducidosTmp.addElement(item + " -> " + itemArray[1]);

				} else if (!itemsTraducidosTmp.contains(itemAdd))
					itemsTraducidosTmp.addElement(itemAdd);

			} catch (Exception e) {
				itemAdd = item + "#" + "(Error de traduccion: " + e.toString();

				if (!itemsNoTraducidosTmp.contains(itemAdd))
					itemsNoTraducidosTmp.addElement(itemAdd + " -> " + itemArray[1]);
			}

		}
	}

	/**
	 * M�todo para saber que literales no estan traducidos
	 * 
	 * @param traduccion Cadena a comprobar
	 * @throws Exception
	 */
	private static boolean hayErroresDeTraduccion(String traduccion) throws Exception {
		if (!AxisBaseService.isEmpty(traduccion)) {
			if (traduccion.toCharArray()[0] == '?' && traduccion.toCharArray()[1] == '!'
					&& traduccion.toCharArray()[2] == '?')
				return true;
			else
				return false;
		} else {
			return true;
		}
	}

	/**
	 * M�todo que pinta los items en su pantalla (jsp) correspondiente (via HTML)
	 * 
	 * @param mapping
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private synchronized ActionForward pintarPantallaHTML(ActionMapping mapping, HttpServletRequest request)
			throws Exception {
		if (!AxisBaseService.isEmpty(itemsJSPTraducidos))
			request.setAttribute("itemsJSPTraducidos", htmlLiterales(itemsJSPTraducidos, "Traducci�n"));

		if (!AxisBaseService.isEmpty(itemsJAVATraducidos))
			request.setAttribute("itemsJAVATraducidos", htmlLiterales(itemsJAVATraducidos, "Traducci�n"));

		if (!AxisBaseService.isEmpty(itemsNoTraducidos))
			request.setAttribute("itemsNoTraducidos", htmlLiterales(itemsNoTraducidos, "Fichero"));

		return mapping.findForward("html");
	}

	/**
	 * M�todo que pinta los items en su pantalla (jsp) correspondiente (via txt)
	 * 
	 * @param mapping
	 * @param request
	 * @param separador
	 * @return
	 * @throws Exception
	 */
	private synchronized ActionForward pintarPantallaText(ActionMapping mapping, HttpServletRequest request,
			String separador) throws Exception {
		if (!AxisBaseService.isEmpty(itemsJSPTraducidos))
			request.setAttribute("itemsJSPTraducidos", textLiterales(itemsJSPTraducidos, separador));

		if (!AxisBaseService.isEmpty(itemsJAVATraducidos))
			request.setAttribute("itemsJAVATraducidos", textLiterales(itemsJAVATraducidos, separador));

		if (!AxisBaseService.isEmpty(itemsNoTraducidos))
			request.setAttribute("itemsNoTraducidos", textLiterales(itemsNoTraducidos, separador));

		return mapping.findForward("text");
	}

	/**
	 * M�todo que genera la tabla HTML para mostrar el listado de los vectores en el
	 * jsp.
	 * 
	 * @param items
	 * @param titulo2
	 * @return
	 * @throws Exception
	 */
	private String htmlLiterales(Vector items, String titulo2) throws Exception {
		StringBuffer sb = new StringBuffer();

		sb.append("<table style='width:100%;border:1px solid #ff0000;'>\n");
		sb.append("<tr>\n");
		sb.append("<td style='width:33%;border:1px solid #ff0000;' align='center'><b>Literal</b></td>\n");
		sb.append("<td style='width:33%;border:1px solid #ff0000;' align='center'><b>" + titulo2 + "</b></td>\n");
		sb.append("</tr>\n");

		for (int i = 0; i < items.size(); i++) {
			String item = (String) items.elementAt(i);

			String[] parseoLiteral = item.split("#");
			String[] parseoValue = ((parseoLiteral.length > 1) ? new String[] { parseoLiteral[1] }
					: parseoLiteral[0].split(" -> "));

			String literal = ((parseoLiteral.length > 1) ? parseoLiteral[0] : parseoValue[0]);
			String value = ((parseoLiteral.length > 1) ? parseoLiteral[1] : parseoValue[1]);
			// String pagina = ((parseoLiteral.length > 1) ? "" : parseoValue[1] );

			sb.append("<tr>\n");
			sb.append("<td style='border:1px solid #ff0000;'>" + literal + "</td>\n");
			sb.append("<td style='border:1px solid #ff0000;'>" + value + "</td>\n");
			sb.append("</tr>\n");

		}

		sb.append("</table>\n");

		return sb.toString();

	}

	/**
	 * M�todo que genera un txt para mostrar el listado de los vectores en el jsp.
	 * 
	 * @param items
	 * @param separador
	 * @return
	 * @throws Exception
	 */
	private String textLiterales(Vector items, String separador) throws Exception {
		StringBuffer sb = new StringBuffer();

		for (int i = 0; i < items.size(); i++) {
			String item = (String) items.elementAt(i);

			String[] parseoLiteral = item.split("#");
			String[] parseoValue = ((parseoLiteral.length > 1) ? new String[] { parseoLiteral[1] }
					: parseoLiteral[0].split(" -> "));

			String literal = ((parseoLiteral.length > 1) ? parseoLiteral[0] : parseoValue[0]);
			String value = ((parseoLiteral.length > 1) ? parseoLiteral[1] : parseoValue[1]);

			sb.append(literal + separador);
			sb.append(value + "\n");

		}

		return sb.toString();
	}

	/**
	 * M�todo 'Main' de la acci�n de parsearLiterales del aplicativo
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public synchronized ActionForward form(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		try {
			// Verificamos parametros de URI
			String extension = ((!AxisBaseService.isEmpty(request.getParameter("extension")))
					? request.getParameter("extension")
					: "");
			if (!(extension.equals("jsp") || extension.equals("java") || extension.equals(""))) {
				request.setAttribute("items",
						"El formato introducido debe ser 'jsp' o 'java' o bien no a�adir el parametro extension.");
				return mapping.findForward("html");
			}

			String formato = ((!AxisBaseService.isEmpty(request.getParameter("formato")))
					? request.getParameter("formato")
					: "HTML");
			if (!(formato.equals("HTML") || formato.equals("properties") || formato.equals("text"))) {
				request.setAttribute("items", "El formato introducido no es ni 'HTML' o 'properties' o 'text'.");
				return mapping.findForward("html");
			}

			String locale = ((!AxisBaseService.isEmpty(request.getParameter("locale"))) ? request.getParameter("locale")
					: "es");
			if (!(locale.equals("es") || locale.equals("ca"))) {
				request.setAttribute("items", "El locale introducido no es ni 'es' ni 'ca'.");
				return mapping.findForward("html");
			}

			// Buscamos directorios de b�squeda de archivos (OC4J .../public_html Tomcat
			// ....../WEB-INF)
			String dirPublico = this.getServlet().getServletContext().getRealPath("");

			// Directorio Java (OC4J .../src Tomcat ....../WEB-INF/src)
			String[] dirJavaTmp = ((dirPublico.indexOf("public_html") != -1) ? dirPublico.split("public_html")
					: dirPublico.split("WEB-INF"));
			String dirJava = dirJavaTmp[0] + ((dirPublico.indexOf("public_html") != -1) ? "src"
					: File.separator + "WEB-INF" + File.separator + "src");

			logger.debug("Dir p�blico: " + dirPublico);
			logger.debug("Dir java: " + dirJava);

			// Parseamos segun extension y locale
			if (extension.equals("jsp") || extension.equals("java")) {
				if (extension.equals("jsp")) { // Parseamos JSP
					parseador(request, dirPublico, extension, locale, itemsJSP, itemsJSPTraducidos);
				} else if (extension.equals("java")) { // Parseamos JAVA
					parseador(request, dirJava, extension, locale, itemsJAVA, itemsJAVATraducidos);
				}

			} else if (extension.equals("")) { // Parseamos todo
				parseador(request, dirPublico, "jsp", locale, itemsJSP, itemsJSPTraducidos);
				parseador(request, dirJava, "java", locale, itemsJAVA, itemsJAVATraducidos);
			}

			request.setAttribute("extension", ((AxisBaseService.isEmpty(extension)) ? "JSP y JAVA" : extension));
			request.setAttribute("locale", locale);
			request.setAttribute("formato", formato);

			// Pintamos segun formato de dise�o
			if (formato.equals("HTML"))
				return pintarPantallaHTML(mapping, request);
			else if (formato.equals("properties"))
				return pintarPantallaText(mapping, request, "=");
			else if (formato.equals("text"))
				return pintarPantallaText(mapping, request, "\t");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("items", "Se ha producido una excepci�n de tipo " + e.toString() + ".");
		} finally {
			// Vaciamos vectores si ejecutamos mas de una vez
			vaciarObjetosParseo();
		}

		return mapping.findForward("html");
	}

}
