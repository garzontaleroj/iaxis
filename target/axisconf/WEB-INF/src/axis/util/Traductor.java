//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.util;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Traductor {
	static Log logger = LogFactory.getLog(Traductor.class);

	private static Traductor yo;
	public static final String MINOMBRE = "axis.Traductor";
	private static HashMap miBundles;

	static {
		yo = new Traductor();
	}

	private Traductor() {
		try {
			miBundles = new HashMap();
			Traductor.recargar(ConversionUtil.getDefaultLocale());
		} catch (Exception e) {
			logger.fatal("Error durante la incializacion y primera carga de Traductor.", e);
		}
	}

	public static Traductor getInstance() {
		return yo;
	}

	private static String s_traducir(String clave) {
		return Traductor.s_traducir(null, clave, null);
	}

	public static String s_traducir(String locale, String clave) {
		return Traductor.s_traducir(locale, clave, null);
	}

	public static String s_traducir(String locale, String clave, Object[] infos) {
		String texto = "?!!" + clave + "!!?";
		;
		try {
			texto = Traductor.traducir(locale, clave, infos);
		} catch (Exception e) {
		}
		return texto;
	}

	private static String traducir(String clave) throws Exception {
		return Traductor.traducir(null, clave, null);
	}

	public static String traducir(String locale, String clave) throws Exception {
		return Traductor.traducir(locale, clave, null);
	}

	/**
	 * Traduce message formats segun bundle indicado con locale (NO traduce si clave
	 * viene con prefijo "verbatim:")
	 * 
	 * @param locale
	 * @param clave
	 * @param infos
	 * @return
	 * @throws Exception
	 */
	private static String traducir(String locale, String clave, Object[] infos) throws Exception {
		String retVal = clave;
		if (locale == null)
			locale = ConversionUtil.getDefaultLocale();
		if (infos != null) {
			for (int i = 0; i < infos.length; i++) {
				if (i == 0)
					retVal = retVal + "(";
				retVal = retVal + infos[i];
				if (i < infos.length - 1)
					retVal = retVal + 1;
				if (i == infos.length - 1)
					retVal = retVal + ")";
			}
		}
		retVal = "?!?" + retVal + "?!?";

		try {
			String language = locale.split("_")[0];
			String country = locale.split("_")[1];
			if (miBundles.get(new Locale(language, country)) == null) {
				recargar(locale);
			}
			String bundleString = clave;
			if (!clave.startsWith("verbatim:")) {
				ResourceBundle rb = (ResourceBundle) miBundles.get(new Locale(language, country));
				// bundleString=((ResourceBundle)miBundles.get(new Locale(language,
				// country))).getString(clave);
				bundleString = rb.getString(clave);
			} else {
				bundleString = clave.substring("verbatim:".length());
			}

			bundleString = bundleString.replaceAll("\'", "�");
			// Esto es una cosa "fea" porque el MessageFormat.format se carga los ap�strofes
			// '
			retVal = MessageFormat.format(bundleString, infos);
			retVal = retVal.replaceAll("�", "\'");
		} catch (Exception e) {
			logger.error("No se ha podido traducir el literal:" + clave + " con infos[]:" + infos + ". Queda como:"
					+ retVal + " Mensaje-Java:" + e.toString());
		}

		// Si no hay conexi�n a la BBDD, sacamos mensaje a saco.
		if (retVal.compareTo("?!?1000050?!?") == 0) {
			return "Java general error";
		} else {
			return retVal;
		}
	}

	private static boolean recargar(String locale) throws Exception {
		String language = locale.split("_")[0];
		String country = locale.split("_")[1];

		miBundles.put(new Locale(language, country),
				ResourceBundle.getBundle("axis.bundle.Mensajes", new Locale(language, country)));
		return true;
	}

	public static void main(String[] args) throws Exception {

	}
}
