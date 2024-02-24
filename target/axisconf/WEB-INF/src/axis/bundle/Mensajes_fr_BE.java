package axis.bundle;

import java.util.ArrayList;
import java.util.List;
import java.util.ListResourceBundle;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.service.axis.AxisBaseService;
import axis.util.ConversionUtil;

//AXIS-WLS2CLUSTER-Ready

public class Mensajes_fr_BE extends ListResourceBundle {
	private static Log logger = LogFactory.getLog(Mensajes_fr_BE.class);
	private static Properties literales = new Properties();
	static Object[][] contents = new Object[1][2];
	private static String localeName = Mensajes_fr_BE.class.getName().substring("axis.bundle.Mensajes_".length());

	/**
	 * M�todo que carga los literales (desde properties, o desde BBDD) y los guarda
	 * en un List.
	 * 
	 * @return
	 */
	private static List loadContents() {
		List retVal = new ArrayList();
		try {
			retVal = MensajesUtil.loadContens(literales, ConversionUtil.locale2CIDIOMA(localeName));
		} catch (Exception e) {
			logger.error("No he podido cargar literales", e);
		}
		return retVal;
	}

	/**
	 * M�todo que actualiza el listado de literales de la aplicaci�n
	 */
	public static void updateContents() {
		synchronized (contents) {
			try {
				// Cargamos y guardamos literales en lista
				List list = loadContents();

				if (!AxisBaseService.isEmpty(list)) {
					// Actualizamos la var contents
					contents = new Object[list.size()][2];
					Map m = null;
					for (int i = 0; i < list.size(); i++) {
						m = (Map) list.get(i);
						contents[i][0] = m.get("ALIAS");
						contents[i][1] = m.get("LITERAL");
					}

					updateContentsParametrizados();

					logger.debug("Bundle Mensajes_" + localeName + " actualizado");
				} else
					throw new Exception("ERROR. No se han cargado literales para Mensajes_" + localeName + ".");
			} catch (Exception e) {
				logger.fatal("Bundle Mensajes_" + localeName + " no cargado", e);
			}
		}
	}

	/**
	 * M�todo que da todos los literales al aplicativo
	 * 
	 * @return
	 */
	public Object[][] getContents() {
		return contents;
	}

	/**
	 * El valor de esa constante debe conincidir con los literales que se a�aden al
	 * contents en "updateContentsParametrizados()"
	 */
	public static final int NUMERO_DE_LITERALES_PARAMETRIZADOS = 4;

	/**
	 * Carga explicta de los "literales" parametrizados en "config.properties":
	 * <ul>
	 * <li>aplicacion.nombre: por ejemplo: nomde de la aplicacion + cliente
	 * <li>aplicacion.nombre.corto: nombre corto de la aplicaci�n
	 * <li>empresa.nombre: nombre de la empresa (pie de pagina)
	 * <li>empresa.link: link a la empresa (pie de pagina)
	 * </ul>
	 */
	private static void updateContentsParametrizados() {
		logger.debug("updateContentsParametrizados");

		int i = contents.length - NUMERO_DE_LITERALES_PARAMETRIZADOS;
		// logger.debug("i:"+i);
		// aplicacion.nombre=AXIS Credit
		contents[i][0] = "aplicacion.nombre";
		contents[i][1] = ConfigCache.getConfig().getProperty("aplicacion.nombre", "");
		i++;
		// aplicacion.nombre.corto=AXIS
		contents[i][0] = "aplicacion.nombre.corto";
		contents[i][1] = ConfigCache.getConfig().getProperty("aplicacion.nombre.corto", "");
		i++;
		// empresa.nombre=CSI
		contents[i][0] = "empresa.nombre";
		contents[i][1] = ConfigCache.getConfig().getProperty("empresa.nombre", "");
		logger.debug(contents[i][0] + "," + contents[i][1]);
		i++;
		// empresa.link=http://www.csi-ti.com
		contents[i][0] = "empresa.link";
		contents[i][1] = ConfigCache.getConfig().getProperty("empresa.link", "");
		logger.debug(contents[i][0] + "," + contents[i][1]);
		i++;
	}

	public static void main(String[] args) throws Exception {

		logger.debug(ConversionUtil.locale2CIDIOMA(localeName));
		logger.debug(localeName);
	}
}
