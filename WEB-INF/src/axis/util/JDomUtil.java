package axis.util;

import java.io.OutputStream;
import java.io.StringReader;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.jdom.xpath.XPath;

public class JDomUtil {
	private static Log logger = LogFactory.getLog(JDomUtil.class);

	public static String documentoToString(Document doc) throws Exception {
		XMLOutputter out = new XMLOutputter(Format.getPrettyFormat()); // .setEncoding("windows-1252"));
		return out.outputString(doc);
	}

	public static void documentoToStream(Document doc, OutputStream outStream) throws Exception {
		XMLOutputter out = new XMLOutputter(Format.getPrettyFormat());
		out.output(doc, outStream);
		outStream.flush();
		outStream.close();
	}

	public static String documentoToCompactString(Document doc) throws Exception {
		XMLOutputter out = new XMLOutputter(Format.getCompactFormat());
		return out.outputString(doc);
	}

	public static Document parseString(String xmlString) throws Exception {
		SAXBuilder builder = new SAXBuilder();
		builder.setValidation(false);
		builder.setIgnoringElementContentWhitespace(true);
		Document doc = builder.build(new StringReader(xmlString));
		logger.debug("Cadena ha sido parseado exitosamente un objeto jDom:" + doc);
		return doc;

	}

	public static Object getXpathObject(Document d, String xPath) throws Exception {
		Object o = XPath.selectSingleNode(d, xPath);
		return o;
	}

	public static Object getXpathObject(Element e, String xPath) throws Exception {
		Object o = XPath.selectSingleNode(e, xPath);
		return o;
	}

	public static List getXpathObjects(Document d, String xPath) throws Exception {
		List o = XPath.selectNodes(d, xPath);
		return o;
	}

	public static List getXpathObjects(Element e, String xPath) throws Exception {
		List o = XPath.selectNodes(e, xPath);
		return o;
	}

	public static Object getXpathObject(Document d, String xPath, Namespace ns) throws Exception {
		XPath xp = XPath.newInstance(xPath);
		xp.addNamespace(ns);
		Object o = xp.selectSingleNode(d, xPath);
		return o;
	}

	public static Object getXpathObject(Element e, String xPath, Namespace ns) throws Exception {
		XPath xp = XPath.newInstance(xPath);
		xp.addNamespace(ns);
		Object o = xp.selectSingleNode(e, xPath);
		return o;
	}

	public static List getXpathObjects(Document d, String xPath, Namespace ns) throws Exception {
		XPath xp = XPath.newInstance(xPath);
		xp.addNamespace(ns);
		List o = xp.selectNodes(d, xPath);
		return o;
	}

	public static List getXpathObjects(Element e, String xPath, Namespace ns) throws Exception {
		XPath xp = XPath.newInstance(xPath);
		xp.addNamespace(ns);
		List o = xp.selectNodes(e, xPath);
		return o;
	}

	public static void main(String[] args) {
		JDomUtil jDomUtil = new JDomUtil();
	}
}
