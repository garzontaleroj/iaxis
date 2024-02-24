//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;

public class ConexionFactoria {
	public static int CC = 0;
	static Log logger = LogFactory.getLog(ConexionFactoria.class);

	private static HashMap datasources;

	public static void main(String[] args) throws Exception {
		Connection conn = getConnection("db01", "TALLER1", "TALLER1");
	}

	/**
	 * AXIS-WLS2CLUSTER-Ready:Recupera conexion taller de la BBDD sin la aplicacion
	 * posibles actualizaciones del contexto o persistencia. Eso se ha de hacer
	 * explicitamente
	 * 
	 * @param dbxx
	 * @param user
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnectionFase2Directo(String dbxx, String user, String password) throws Exception {
		return getConnection(dbxx, user, password);
	}

	/**
	 * AXIS-WLS2CLUSTER-Ready:Recupera conexion logica de la BBDD y aplica posibles
	 * actualizaciones del contexto o persistencia
	 * 
	 * @param dbxx
	 * @param usuarioLogin
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnectionFase2Session(String dbxx, String usuarioLogin, String IDSESSION)
			throws Exception { // AXIS-WLS2CLUSTER-Ready:nuevo metodo
		Connection conn = getConnection(dbxx);
		if (usuarioLogin != null && !usuarioLogin.equalsIgnoreCase("__axisUsuario__")) {
			PAC_IAX_LOGIN pacIaxLogin = new PAC_IAX_LOGIN(conn);
			pacIaxLogin.ejecutaPAC_IAX_LOGIN__P_IAX_INICONNECT(usuarioLogin);
			PAC_PERSISTENCIA pacPersistencia = new PAC_PERSISTENCIA(conn);
			pacPersistencia.ejecutaPAC_PERSISTENCIA__F_INICIALIZAR_CONTEXTO(IDSESSION);
		}
		return conn;
	}

	public static Connection getConnection(String dbxx, String user, String password) throws Exception {
		Class.forName(ConfigCache.getConfig().getProperty(dbxx + ".driver"));
		Connection con = DriverManager.getConnection(ConfigCache.getConfig().getProperty(dbxx + ".url"), user,
				password);
		con.setAutoCommit(false);
		return con;
	}

	public static Connection getConnection(String dbxx) throws Exception {

		if (datasources == null)
			datasources = new HashMap();

		if (datasources.get(dbxx) == null) {
			ConexionFactoria.setupDatasource(dbxx);
		}

		Connection con = ((DataSource) datasources.get(dbxx)).getConnection();

		// Checkear conexi�n estado Datasourde - Evitar bucles LCF 9/12/2009
		checkConnection(con, dbxx);
		con.setAutoCommit(false);
		return con;
	}

	public static DataSource getDataSource(String dbxx) throws Exception {
		if (datasources == null)
			datasources = new HashMap();

		if (datasources.get(dbxx) == null) {
			ConexionFactoria.setupDatasource(dbxx);
		}

		return (DataSource) datasources.get(dbxx);
	}

	public static DataSource getDataSource() throws Exception {
		return getDataSource("db01");
	}

	public static void setupDatasource(String dbxx) throws Exception {
		if (datasources == null)
			datasources = new HashMap();

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) datasources.get(dbxx);
		if (ds == null) {
			String[] dbxxJndiNames = ConfigCache.getConfig().getProperty("datasource." + dbxx).split(",");
			if (dbxxJndiNames.length == 0)
				throw new Exception("No se ha encontrado jndiNames para:" + dbxx + ".jndi");
			for (int i = 0; i < dbxxJndiNames.length; i++) {
				try {
					ds = (DataSource) ctx.lookup(dbxxJndiNames[i].trim());
					datasources.put(dbxx, ds);
					break;
				} catch (Exception e) {
					logger.error("No se ha podido encontrar un DS con [" + dbxxJndiNames[i].trim()
							+ "]. Probando alternativas...", e);
				}
			}
			if (ds == null)
				throw new Exception("No se ha podido establecer un datasource para:" + dbxx);
		}

	}

	public static void restartDatasource(String dbxx) throws Exception {

		javax.sql.DataSource ds = null;
		java.sql.Connection con = null;

		try {

			String[] dbxxJndiNames = ConfigCache.getConfig().getProperty("datasource." + dbxx).split(",");
			if (dbxxJndiNames.length == 0)
				throw new Exception("No se ha encontrado jndiNames para:" + dbxx + ".jndi");

			for (int i = 0; i < dbxxJndiNames.length; i++) {

				javax.naming.InitialContext ctx = new javax.naming.InitialContext();
				ds = (DataSource) ctx.lookup(dbxxJndiNames[i].trim());

				con = ds.getConnection();
				con.close();
			}

			setupDatasource(dbxx);

		} catch (Exception e) {
			logger.error("Error en restartDataSource data source" + e.toString());
		}

	}

	/**
	 * Cierra de forma silenciosa la conexion "conn" a la BBDD (en un caso de un
	 * pool - lo retorna al gestor). Pero antes intenta ejecutar scripts de limpieza
	 * de temporales
	 * 
	 * @param conn
	 */
	public static void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				// new
				// PAC_IAX_SUPLEMENTOS(conn).ejecutaPAC_IAX_SUPLEMENTOS__LIMPIARTEMPORALES();
			} catch (Exception e) {
				logger.error("error lanzando un script de limpieza de temporales de suplementos", e);
			}
			try {
				// new PAC_IAX_PRODUCCION(conn).ejecutaPAC_IAX_PRODUCCION__LIMPIARTEMPORALES();
			} catch (Exception e) {
				logger.error("error lanzando un script de limpieza de temporales de produccion", e);
			}
			try {
				// new
				// PAC_IAX_SIMULACIONES(conn).ejecutaPAC_IAX_SIMULACIONES__LIMPIARTEMPORALES();
			} catch (Exception e) {
				logger.error("error lanzando un script de limpieza de temporales de simulaciones", e);
			}
		}

		try {
			conn.clearWarnings();
		} catch (Exception e) {
		}
		try {
			conn.rollback();
		} catch (Exception e) {
		}
		try {
			conn.close();
		} catch (Exception e) {
		}
		conn = null;
	}

	public static void checkConnection(Connection conn, String dbxx) throws Exception {
		try {
			// AccesoSQL accesoSQL=new AccesoSQL(conn);
			String sql = "select sysdate from dual";

			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			// ecg20130124 http://mantis.srvcsi.com/view.php?id=25799#c135722 faltaba cerrar
			// rs y stmt
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			if (e.toString().indexOf("No hay mas datos") >= 0) {
				logger.error("Error en checkConnection:" + e.toString());
				restartDatasource(dbxx);
			} else if (e.toString().indexOf("OALL8") >= 0) {
				logger.error("Error en checkConnection:" + e.toString());
				restartDatasource(dbxx);
			} else if (e.toString().indexOf("socket write error") >= 0) {
				logger.error("Error en checkConnection:" + e.toString());
				restartDatasource(dbxx);
			}

		}

	}

}
