package axis.bundle;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.ListResourceBundle;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.service.axis.AxisBaseService;

//AXIS-WLS2CLUSTER-Ready

public class Mensajes_7 extends ListResourceBundle {
	private static Log logger = LogFactory.getLog(Mensajes_7.class);
	private static Properties literales = new Properties();
	static Object[][] contents_ca = new Object[1][2];

	/**
	 * M�todo que carga los literales (desde properties, o desde BBDD) y los guarda
	 * en un List.
	 * 
	 * @return
	 */
	private static List loadContents() {
		List retVal = new ArrayList();
		retVal = MensajesUtil.loadContens(literales, new BigDecimal(7));
		return retVal;
	}

	/**
	 * M�todo que actualiza el listado de literales de la aplicaci�n
	 * 
	 * @param list -> Literales guardadas en lista
	 */
	public static void updateContents() {
		synchronized (contents_ca) {
			try {
				// Cargamos y guardamos literales en lista
				List list = loadContents();

				if (!AxisBaseService.isEmpty(list)) {
					// Actualizamos la var contents
					contents_ca = new Object[list.size()][2];
					Map m = null;
					for (int i = 0; i < list.size(); i++) {
						m = (Map) list.get(i);
						contents_ca[i][0] = m.get("ALIAS");
						contents_ca[i][1] = m.get("LITERAL");
					}

					logger.debug("Bundle Mensajes_7 actualizado");
				} else
					throw new Exception("ERROR. No se han cargado literales para Mensajes_7.");
			} catch (Exception e) {
				logger.fatal("Bundle Mensajes_7 no cargado", e);
			}
		}
	}

	/**
	 * M�todo que da todos los literales al aplicativo
	 * 
	 * @return
	 */
	public Object[][] getContents() {
		return contents_ca;
	}

}
