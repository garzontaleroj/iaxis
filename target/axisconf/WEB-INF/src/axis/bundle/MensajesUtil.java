//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.bundle;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//AXIS-WLS2CLUSTER-Ready

public class MensajesUtil {
	private static Log logger = LogFactory.getLog(MensajesUtil.class);

	public static List loadContens(Properties literales, BigDecimal CIDIOMA) {
		List retVal = new ArrayList();
		Connection conn = null;
		try {
			String resourceLoadBundle = ConfigCache.getConfig().getProperty("resource.load.bundle");

			// Cargamos los literales

			if (!AxisBaseService.isEmpty(resourceLoadBundle) && (resourceLoadBundle.equals(Constantes.LITERALES_BBDD)
					|| resourceLoadBundle.equals(Constantes.LITERALES_PROP))) {
				literales.clear();
				if (resourceLoadBundle.equals(Constantes.LITERALES_BBDD)) {
					conn = ConexionFactoria.getConnection("db01");

					PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(conn);
					Map selectedLiteralesReturn = pac_axis_listvalores
							.ejecutaPAC_IAX_LISTVALORES__F_GETLITERALES(CIDIOMA);
					List selectedLiterales = (List) selectedLiteralesReturn.get("RETURN");

					HashMap m;
					for (int i = 0; i < selectedLiterales.size(); i++) {
						m = (HashMap) selectedLiterales.get(i);
						BigDecimal SLITERA = (BigDecimal) m.get("SLITERA");
						String TLITERA = (String) m.get("TLITERA");

						if (AxisBaseService.isEmpty(SLITERA) || AxisBaseService.isEmpty(TLITERA))
							continue;

						literales.setProperty(SLITERA.toString(), TLITERA);
					}

				} else if (resourceLoadBundle.equals(Constantes.LITERALES_PROP)) {
					throw new Exception("Ya no se permite la carga de literales por ficheros. ");
				}
			} else
				throw new Exception(
						"ERROR-> (File: Config.properties - property: resource.load.bundle). Su valor debe ser 'db' o 'properties'");

			// Almacenamiento de los literales cargados
			for (Enumeration e = literales.keys(); e.hasMoreElements();) {
				Map m = new HashMap();
				Object obj = e.nextElement();
				m.put("ALIAS", obj);
				m.put("LITERAL", literales.getProperty(obj.toString()));

				retVal.add(m);
			}
		} catch (Exception e) {
			logger.fatal("ERROR al cargar literales " + e);
		} finally {
			ConexionFactoria.closeConnection(conn);
		}
		return retVal;
	}
}
