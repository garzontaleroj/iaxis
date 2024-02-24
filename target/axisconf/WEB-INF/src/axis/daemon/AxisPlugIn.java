//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.daemon;

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.config.ModuleConfig; //AXIS-WLS2CLUSTER-Ready

import axis.cache.ConfigCache;
import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_AYUDA;
import axis.jdbc.PAC_IAX_COMMON;
import axis.mvc.view.AyudaTag;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

public class AxisPlugIn implements org.apache.struts.action.PlugIn {
	static Log logger = LogFactory.getLog(AxisPlugIn.class);
	public static boolean AUTOLOGINGRANTED = false;

	public void destroy() {
		logger.warn("Context destroy.");
	}

	public void init(ActionServlet actionServlet, ModuleConfig config) throws ServletException {
		String realPath = actionServlet.getServletContext().getRealPath("");
		realPath = realPath.replace('\\', '/');
		if (realPath.endsWith("/"))
			realPath = realPath.substring(0, realPath.length() - 1);
		Constantes.REALPATH = realPath;

		// Comprobar si se permite autologin
		this.getAutologin();

		// Cargar bundles inicialmente
		this.cargarBundles();

		// Cargar los formatos
		this.cargarFormatosMoneda();
	}

	/**
	 * M�todo que carga los literales en cada bundle. Genera una llamada a los
	 * bundles (los correspondientes al idioma y al que tiene por defecto). Esa
	 * llamada actualiza una var. interna est�tica (propia de cada bundle). Una vez
	 * carguemos los literales en todos los bundles, podremos leer de ellas en
	 * funci�n del locale que tenga la aplicaci�n. Se generan tantas llamadas como
	 * Mensajes_XX haya. Lo determinamos gracias a una constante en
	 * config.properties (locale.bundle)
	 * 
	 * @throws Exception
	 */
	private void cargarBundles() {
		try {
			Class clase0;
			Object objeto0;
			Method metUpdateContents0;

			String localeBundle = ConfigCache.getConfig().getProperty("locale.bundle");
			clase0 = Class.forName("axis.bundle.Mensajes");
			objeto0 = clase0.newInstance();
			metUpdateContents0 = clase0.getMethod("updateContents", null);
			metUpdateContents0.invoke(objeto0, null);

			if (localeBundle != null && !localeBundle.equals("")) {
				String[] CIDIOMAs = localeBundle.split(",");
				for (int i = 0; i < CIDIOMAs.length; i++) {
					try {
						String locale = ConversionUtil.CIDIOMA2locale(new BigDecimal(CIDIOMAs[i]));
						Class clase = Class.forName("axis.bundle.Mensajes_" + locale);
						Object objeto = clase.newInstance();
						Method metUpdateContents = clase.getMethod("updateContents", null);
						metUpdateContents.invoke(objeto, null);
					} catch (Exception e) {
						logger.warn("Error al cargar un locale.", e);
						continue;
					}

				}
			} else {
				throw new Exception("Error al cargar los mensajes asociados a los locales.");
			}
		} catch (Exception e) {
			logger.fatal("Error fatal al cargar los bundles", e);
		}
	}

	private void cargarAyuda() {
		Connection conn = null; // WLX
		try {
			conn = ConexionFactoria.getConnection("db01");
			PAC_IAX_AYUDA paxIaxAyuda = new PAC_IAX_AYUDA(conn);
			HashMap m = paxIaxAyuda.ejecutaPAC_IAX_AYUDA__F_GET_AYUDA();
			AyudaTag.popularAyuda((ArrayList) m.get("AYUDACURSOR"));
		} catch (Exception e) {
			logger.error("Error recuperando la ayuda.", e);
		} finally {
			ConexionFactoria.closeConnection(conn);
		}
	}

	private void cargarFormatosMoneda() {
		Connection conn = null; // WLX
		try {
			conn = ConexionFactoria.getConnection("db01");
			PAC_IAX_COMMON pacIaxCommon = new PAC_IAX_COMMON(conn);
			HashMap m = pacIaxCommon.ejecutaPAC_IAX_COMMON__F_OBTENER_FORMATOS_MONEDA();
			List lstFmtMon = (ArrayList) m.get("RETURN");
			for (int i = 0; i < lstFmtMon.size(); i++) {
				Map map = (HashMap) lstFmtMon.get(i);
				if (((BigDecimal) map.get("BDEFECTO")).intValue() == 1) {
					Constantes.DEFAULT_CMONEDA = ((BigDecimal) map.get("CMONEDA"));
					Constantes.DEFAULT_CMONINT = (String) map.get("CMONINT");
				}
				Constantes.FORMAT_CURRENCY_PATTERNS.put(((BigDecimal) map.get("CMONEDA")).intValue(),
						map.get("PATRON"));
				Constantes.FORMAT_CURRENCY_PATTERNS.put(map.get("CMONEDA"), map.get("PATRON"));
				Constantes.FORMAT_CURRENCY_PATTERNS.put(map.get("CMONINT"), map.get("PATRON"));
			}

		} catch (Exception e) {
			logger.error("Error recuperando la  formatos de moneda disponibles.", e);
		} finally {
			ConexionFactoria.closeConnection(conn);
		}
	}

	private void getAutologin() {
		Connection conn = null; // WLX

		try {
			conn = ConexionFactoria.getConnection("db01");
			Map mapAutoLogin = new HashMap();
			mapAutoLogin = ejecutaPAC_IAX_LOGIN__F_EMPRESA_AUTOLOGIN(conn);
			BigDecimal returnAutoLogin = ((!AxisBaseService.isEmpty(mapAutoLogin)
					&& !AxisBaseService.isEmpty(mapAutoLogin.get("RETURN"))) ? (BigDecimal) mapAutoLogin.get("RETURN")
							: BigDecimal.ZERO);
			AUTOLOGINGRANTED = (BigDecimal.ZERO.equals(returnAutoLogin) ? false : true);
		} catch (Exception e) {
			logger.fatal("Error fatal al comprobar autologin.", e);
		} finally {
			ConexionFactoria.closeConnection(conn);
		}

	}

	/**
	 * M�todo que realiza la llamada a la funci�n pl f_empresa_autologin.
	 * 
	 * @param conn
	 * @return
	 * @throws Exception
	 */
	public HashMap ejecutaPAC_IAX_LOGIN__F_EMPRESA_AUTOLOGIN(Connection conn) throws Exception {
		return new ConversionUtil().convertOracleObjects(this.callPAC_IAX_LOGIN__F_EMPRESA_AUTOLOGIN(conn));
	}

	private HashMap callPAC_IAX_LOGIN__F_EMPRESA_AUTOLOGIN(Connection conn) throws Exception {
		String callQuery = "{?=call PAC_IAX_LOGIN.F_EMPRESA_AUTOLOGIN()}";

		CallableStatement cStmt = conn.prepareCall(callQuery);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		cStmt.close();

		return retVal;
	}
}
