//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.ConfigCache;
import axis.jdbc.ConexionFactoria;
import axis.jdbc.PAC_IAX_CON;
import axis.util.Constantes;
import axis.util.ConversionUtil;

//AXIS-WLS2CLUSTER-Ready

public class UsuarioBean implements HttpSessionBindingListener, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4335210199127654183L;

	static Log logger = LogFactory.getLog(UsuarioBean.class);

	/**
	 * Mapeo entre USERNAMEs y posibles objetos propios de talleres
	 */
	private static Properties ownerdata = new Properties();

//    private ArrayList pila=new ArrayList();
	private String remoteip;
	private String jsessionid;

	private String cusuari = null; // VARCHAR2 C�digo de usuario
	private BigDecimal cidioma = null; // NUMBER C�digo idioma
	private BigDecimal cempres = null; // NUMBER C�digo empresa
	private BigDecimal cagente = null; // NUMBER C�digo agente
	private String tagente = null;

	private BigDecimal ctipusu = null; // NUMBER C�digo tipo usuario
	private String nombre = null; // VARCHAR2 Nombre del usuario
	private BigDecimal pool = new BigDecimal(1); // NUMBER 1 conexi�n pool 2 conexi�n exclusiva // por defecto POOL
	private String cusuariodb = null; // VARCHAR2 Usuario de la base datos para volver a conectar
	private String passworddb = null; // VARCHAR2 Contrase�a usuario en la db encriptada
	private BigDecimal copcion = null; // NUMBER ID de la opci�n
	private String oficina = null;
	private String puesto = null;
	private String autologin = null;
	private boolean puestoAbierto = false;

	private boolean primeravez = true;

	private Date factuallogin = null;
	private Date fultimologin = null;

	// ecg20110914 AXIS-WLS1SERVER . contenedor generico, por ejemplo para
	// CONTINUE's
	private HashMap contenedor = new HashMap();

	public HashMap getContenedor() {
		return this.contenedor;
	}

	public void setContenedor(HashMap p) {
		this.contenedor.putAll(p);
	}

	/**
	 * Entorno de la aplicaci�n - se constituye con cada getConnection():
	 * {TEST,VALIDACI�N,PRODUCCI�N}
	 */
	private String entorno = null;
	private String locale = null; // C�digo de letras del Locale Java ca, es, en...:

	private String usuario = null;
	private String pwd = null;
	// ya no hay conexiones aki! private HashMap misConexiones = null;//WLX

	public UsuarioBean(String usuario, String pwd) {
		this.usuario = usuario;
		if (pwd != null) {
			this.pwd = ConversionUtil.encriptar(pwd.trim());
		} else {
			this.pwd = null;
		}
		// aki ya no hay conexiones this.misConexiones = new HashMap();//WLX
	}

	public void setPrimeraVez(boolean primeraVez) {
		this.primeravez = primeraVez;
	}

	public void parsearDatuser(HashMap datuser) {
		if (datuser == null)
			return;

		this.cagente = (BigDecimal) datuser.get("CAGENTE");
		this.cempres = (BigDecimal) datuser.get("CEMPRES");
		this.cidioma = (BigDecimal) datuser.get("CIDIOMA");
		this.locale = ConversionUtil.CIDIOMA2locale(this.cidioma);
		this.copcion = (BigDecimal) datuser.get("COPCION");
		this.ctipusu = (BigDecimal) datuser.get("CTIPUSU");
		this.cusuari = (String) datuser.get("CUSUARI");
		this.cusuariodb = (String) datuser.get("CUSUARIODB");
		this.nombre = (String) datuser.get("NOMBRE");
		this.passworddb = (String) datuser.get("PASSWORDDB");
		this.pool = (BigDecimal) datuser.get("POOL");
		this.autologin = (String) datuser.get("AUTOLOGIN");

		// this.factuallogin=(Date)datuser.get("FACTUALLOGIN");
		this.factuallogin = new Date();
		this.fultimologin = (Date) datuser.get("FULTIMOLOGIN");

	}

	public void setUsuario(String p) {
		this.usuario = p.trim();
	}

	public void setOficina(String o) {
		this.oficina = o.trim();
	}

	public void setPuesto(String p) {
		this.puesto = p.trim();
	}

	public void setPwd(String p) {
		this.pwd = ConversionUtil.encriptar(p.trim());
	}

	public String getUsuario() {
		return this.usuario;
	}

	public String getPwd() {
		return this.pwd;
	}

	public String getAutologin() {
		return this.autologin;
	}

	public boolean getPrimeravez() {
		return this.primeravez;
	}

	public void setAutologin(String autologin) {
		this.autologin = autologin;
	}

	public String setOficina() {
		return this.oficina;
	}

	public String setPuesto() {
		return this.puesto;
	}

	/**
	 * Intenta recuperar del mapa "ownerdata" el due�o del objeto NOMBREOBJETO, que
	 * puede ser el USERNAME mismo, o el POOLOWNER.
	 * 
	 * @param USERNAME
	 * @param NOMBREOBJETO
	 * @return
	 */
	public static String fixOwner(String USERNAME, String NOMBREOBJETO) {
		String owner = "";
		owner = ownerdata.getProperty(USERNAME.toUpperCase() + "__" + NOMBREOBJETO.trim().toUpperCase(),
				Constantes.DB01_POOLOWNER);
		if (owner != null && owner.length() > 0)
			owner = owner + ".";
		// if (owner==null) owner="ICRE_T.";
		if (owner == null)
			owner = "ICRE_T.";
		return owner + NOMBREOBJETO;
	}

	public static void alimentarOwnerdata(String cusuariodb, ArrayList ownerobjs) {
		// primero se limpia el ownerdata
		Object[] keysetarray = ownerdata.keySet().toArray();
		for (int i = 0; i < keysetarray.length; i++) {
			if (keysetarray[i].toString().toUpperCase().startsWith(cusuariodb + "__")) {
				ownerdata.remove(keysetarray[i].toString().toUpperCase());
				// logger.debug("ownerdata liberado
				// de:"+keysetarray[i].toString().toUpperCase());
			}
		}
		// a�adir posibles objetos de este..
		for (int i = 0; i < ownerobjs.size(); i++) {
			ownerdata.setProperty(
					cusuariodb + "__" + ((HashMap) ownerobjs.get(i)).get("OBJECT_NAME").toString().trim().toUpperCase(),
					cusuariodb);
		}

	}

	public void closeAllConnections() {
		/*
		 * //WLX Iterator iteratorKey = misConexiones.keySet().iterator(); while
		 * (iteratorKey.hasNext()) { String tempKey = (String)iteratorKey.next(); if
		 * (tempKey != null) this.closeConnection(tempKey); }
		 */
	}

	public void closeConnection(String dbxx) {
		// logger.warn("Piensa que no hago nada aqui!!"); //AXIS-WLS2CLUSTER-Ready

		/*
		 * logger.warn("voy a cerrar una conexi�n " + dbxx + " para " + this + ".");
		 * ConexionFactoria.closeConnection((Connection)misConexiones.get(dbxx));
		 * logger.debug("cnx a " + dbxx + " de usuario " + this.usuario + " cerrado.");
		 */
	}

	public void valueBound(HttpSessionBindingEvent arg0) {

	}

	private void ejecutarASalir(String ejecutarASalir) {
		if (ejecutarASalir == null)
			return;

	}

	public void valueUnbound(HttpSessionBindingEvent arg0) {
		// Llamada a PL cerrar puesto

		java.sql.Connection conn = null;
		try {

			if (usuario != null && this.puestoAbierto) {
				conn = ConexionFactoria.getConnectionFase2Session("db01", this.usuario, this.jsessionid);
				String usuario = this.getUsuario();
				PAC_IAX_CON pacIaxCon = new PAC_IAX_CON(conn);
			}

		} catch (Exception e) {
			logger.error("Error:" + e);
		} finally {
			ConexionFactoria.closeConnection(conn);
		}
		// release de TODAS conexiones
		closeAllConnections();
	}

	public void setRemoteip(String remoteip) {
		this.remoteip = remoteip;
	}

	public String getRemoteip() {
		return remoteip;
	}

	public void setJsessionid(String jsessionid) {
		this.jsessionid = jsessionid;
	}

	public String getJsessionid() {
		return jsessionid;
	}

	public void setCusuari(String cusuari) {
		this.cusuari = cusuari;
	}

	public String getCusuari() {
		return cusuari;
	}

	public void setCidioma(BigDecimal cidioma) {
		this.cidioma = cidioma;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	public BigDecimal getCidioma() {
		if (cidioma == null)
			cidioma = new BigDecimal(ConfigCache.getConfig().getProperty("locale.defecto"));
		return cidioma;
	}

	public String getLocale() {
		if (locale == null)
			locale = ConversionUtil.getDefaultLocale();
		return locale;
	}

	public void setCempres(BigDecimal cempres) {
		this.cempres = cempres;
	}

	public BigDecimal getCempres() {
		return cempres;
	}

	public void setCagente(BigDecimal cagente) {
		this.cagente = cagente;
	}

	public BigDecimal getCagente() {
		return cagente;
	}

	public void setCtipusu(BigDecimal ctipusu) {
		this.ctipusu = ctipusu;
	}

	public BigDecimal getCtipusu() {
		return ctipusu;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setPool(BigDecimal pool) {
		this.pool = pool;
	}

	public BigDecimal getPool() {
		return pool;
	}

	public void setCusuariodb(String cusuariodb) {
		this.cusuariodb = cusuariodb;
	}

	public String getCusuariodb() {
		return cusuariodb;
	}

	public void setPassworddb(String passworddb) {
		this.passworddb = passworddb;
	}

	public String getPassworddb() {
		return passworddb;
	}

	public void setCopcion(BigDecimal copcion) {
		this.copcion = copcion;
	}

	public BigDecimal getCopcion() {
		return copcion;
	}

	public void setEntorno(String entorno) {
		this.entorno = entorno;
	}

	public String getEntorno() {
		return entorno;
	}

	private boolean isPuestoAbierto() {
		return puestoAbierto;
	}

	public void setPuestoAbierto(boolean puestoAbierto) {
		this.puestoAbierto = puestoAbierto;
	}

	public String toString() {
		StringBuffer sB = new StringBuffer();
		sB.append("#usuario=").append(this.usuario).append(" remoteip=").append(this.remoteip).append("#");
		return sB.toString();
	}

	public void setTagente(String tagente) {
		this.tagente = tagente;
	}

	public String getTagente() {
		return tagente;
	}

	public void setFactuallogin(Date factuallogin) {
		this.factuallogin = factuallogin;
	}

	public Date getFactuallogin() {
		return factuallogin;
	}

	public void setFultimologin(Date fultimologin) {
		this.fultimologin = fultimologin;
	}

	public Date getFultimologin() {
		return fultimologin;
	}
}
