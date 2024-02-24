package axis.mvc.model;

import java.beans.Transient;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;
import oracle.jpub.runtime.MutableStruct;
import oracle.sql.Datum;
import oracle.sql.ORAData;
import oracle.sql.ORADataFactory;
import oracle.sql.STRUCT;
import sqlj.runtime.ConnectionContext;
import sqlj.runtime.ref.DefaultContext;

public class ObIaxMarcas implements ORAData, ORADataFactory, Serializable {

	private static final long serialVersionUID = -138372462594422555L;

	public String _SQL_NAME = "OB_IAX_MARCAS";
	public static final int _SQL_TYPECODE = OracleTypes.STRUCT;

	/* connection management */
	protected Connection __onn = null;
	protected javax.sql.DataSource __dataSource = null;

	public void setDataSource(javax.sql.DataSource dataSource) throws SQLException {
		release();
		__dataSource = dataSource;
	}

	public void setDataSourceLocation(String dataSourceLocation) throws SQLException {
		javax.sql.DataSource dataSource;
		try {
			Class cls = Class.forName("javax.naming.InitialContext");
			Object ctx = cls.newInstance();
			java.lang.reflect.Method meth = cls.getMethod("lookup", new Class[] { String.class });
			dataSource = (javax.sql.DataSource) meth.invoke(ctx,
					new Object[] { "java:comp/env/" + dataSourceLocation });
			setDataSource(dataSource);
		} catch (Exception e) {
			throw new java.sql.SQLException(
					"Error initializing DataSource at " + dataSourceLocation + ": " + e.getMessage());
		}
	}

	public Connection getConnection() throws SQLException {
		if (__onn != null)
			return __onn;
		else if (__tx != null)
			return __tx.getConnection();
		else if (__dataSource != null)
			__onn = __dataSource.getConnection();
		return __onn;
	}

	public void release() throws SQLException {
		if (__tx != null && __onn != null)
			__tx.close(ConnectionContext.KEEP_CONNECTION);
		__onn = null;
		__tx = null;
		__dataSource = null;
	}

	public void closeConnection() {
		if (__dataSource != null) {
			try {
				if (__onn != null) {
					__onn.close();
				}
			} catch (java.sql.SQLException e) {
			}
			try {
				if (__tx != null) {
					__tx.close();
				}
			} catch (java.sql.SQLException e) {
			}
			__onn = null;
			__tx = null;
		}
	}

	protected DefaultContext __tx = null;

	public void setConnectionContext(DefaultContext ctx) throws SQLException {
		release();
		__tx = ctx;
	}

	public DefaultContext getConnectionContext() throws SQLException {
		if (__tx == null) {
			__tx = (getConnection() == null) ? DefaultContext.getDefaultContext() : new DefaultContext(getConnection());
		}
		return __tx;
	}

	protected transient MutableStruct _struct;

	// INI TCS-344 CJMR 19/02/2019
	protected static int[] _sqlType = { 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50,
			50, 50, 50 };
	protected static ORADataFactory[] _factory = new ORADataFactory[23];
	// FIN TCS-344 CJMR 19/02/2019

	protected static final ObIaxMarcas _ObIaxMarcasFactory = new ObIaxMarcas();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxMarcasFactory;
	}
	/* constructors */

	protected void _init_struct(boolean init) {
		if (init)
			// _struct=new MutableStruct(new Object[21], _sqlType, _factory); TCS-344 CJMR
			// 19/02/2019
			_struct = new MutableStruct(new Object[23], _sqlType, _factory);
	}

	public ObIaxMarcas() {
		_init_struct(true);
		__tx = DefaultContext.getDefaultContext();
	}

	public ObIaxMarcas(DefaultContext c) {
		_init_struct(true);
		__tx = c;
	}

	public ObIaxMarcas(Connection c) {
		_init_struct(true);
		__onn = c;
	}

	public ObIaxMarcas(java.math.BigDecimal cempres, java.math.BigDecimal sperson, String carea, String cmarca,
			String descripcion, java.math.BigDecimal nmovimi, java.math.BigDecimal ctipo, java.math.BigDecimal ctomador,
			java.math.BigDecimal cconsorcio, java.math.BigDecimal casegurado, java.math.BigDecimal ccodeudor,
			java.math.BigDecimal cbenef, java.math.BigDecimal caccionista, java.math.BigDecimal cintermed,
			java.math.BigDecimal crepresen, java.math.BigDecimal capoderado, java.math.BigDecimal cpagador,
			// java.math.BigDecimal cvalor, String observacion, String cuser, String
			// falta/*, java.sql.Date falta*/) throws SQLException { TCS-344 CJMR 19/02/2019
			java.math.BigDecimal cvalor, String observacion, String cuser, String falta,
			java.math.BigDecimal cproveedor, java.math.BigDecimal cgrupoecon) throws SQLException {
		_init_struct(true);
		setCempres(cempres);
		setSperson(sperson);
		setCarea(carea);
		setCmarca(cmarca);
		setDescripcion(descripcion);
		setNmovimi(nmovimi);
		setCtipo(ctipo);
		setCtomador(ctomador);
		setCconsorcio(cconsorcio);
		setCasegurado(casegurado);
		setCcodeudor(ccodeudor);
		setCbenef(cbenef);
		setCaccionista(caccionista);
		setCintermed(cintermed);
		setCrepresen(crepresen);
		setCapoderado(capoderado);
		setCpagador(cpagador);
		setCvalor(cvalor);
		setObservacion(observacion);
		setCuser(cuser);
		setFalta(falta);
		// INI TCS-344 CJMR 19/02/2019
		setCproveedor(cproveedor);
		// FIN TCS-344 CJMR 19/02/2019
		// IAXIS-5478 -- 15/01/2021
		setCgrupoecon(cgrupoecon);
		// IAXIS-5478 -- 15/01/2021
	}

	/* ORAData interface */
	@Transient
	public Datum toDatum(Connection c) throws SQLException {
		if (__tx != null && __onn != c)
			release();
		__onn = c;
		return _struct.toDatum(c, _SQL_NAME);
	}

	/* ORADataFactory interface */
	@Transient
	public ORAData create(Datum d, int sqlType) throws SQLException {
		return create(null, d, sqlType);
	}

	@Transient
	public void setFrom(ObIaxMarcas o) throws SQLException {
		setContextFrom(o);
		setValueFrom(o);
	}

	@Transient
	protected void setContextFrom(ObIaxMarcas o) throws SQLException {
		release();
		__tx = o.__tx;
		__onn = o.__onn;
	}

	@Transient
	protected void setValueFrom(ObIaxMarcas o) {
		_struct = o._struct;
	}

	@Transient
	protected ORAData create(ObIaxMarcas o, Datum d, int sqlType) throws SQLException {
		if (d == null) {
			if (o != null) {
				o.release();
			}
			;
			return null;
		}
		if (o == null)
			o = new ObIaxMarcas();
		o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
		o.__onn = ((STRUCT) d).getJavaSqlConnection();
		return o;
	}
	/* accessor methods */

	@Transient
	public java.math.BigDecimal getCempres() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(0);
	}

	@Transient
	public void setCempres(java.math.BigDecimal cempres) throws SQLException {
		_struct.setAttribute(0, cempres);
	}

	@Transient
	public java.math.BigDecimal getSperson() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(1);
	}

	@Transient
	public void setSperson(java.math.BigDecimal sperson) throws SQLException {
		_struct.setAttribute(1, sperson);
	}

	@Transient
	public String getCarea() throws SQLException {
		return (String) _struct.getAttribute(2);
	}

	@Transient
	public void setCarea(String carea) throws SQLException {
		_struct.setAttribute(2, carea);
	}

	@Transient
	public String getCmarca() throws SQLException {
		return (String) _struct.getAttribute(3);
	}

	@Transient
	public void setCmarca(String cmarca) throws SQLException {
		_struct.setAttribute(3, cmarca);
	}

	@Transient
	public String getDescripcion() throws SQLException {
		return (String) _struct.getAttribute(4);
	}

	@Transient
	public void setDescripcion(String descripcion) throws SQLException {
		_struct.setAttribute(4, descripcion);
	}

	@Transient
	public java.math.BigDecimal getNmovimi() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(5);
	}

	@Transient
	public void setNmovimi(java.math.BigDecimal nmovimi) throws SQLException {
		_struct.setAttribute(5, nmovimi);
	}

	@Transient
	public java.math.BigDecimal getCtipo() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(6);
	}

	@Transient
	public void setCtipo(java.math.BigDecimal ctipo) throws SQLException {
		_struct.setAttribute(6, ctipo);
	}

	@Transient
	public java.math.BigDecimal getCtomador() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(7);
	}

	@Transient
	public void setCtomador(java.math.BigDecimal ctomador) throws SQLException {
		_struct.setAttribute(7, ctomador);
	}

	@Transient
	public java.math.BigDecimal getCconsorcio() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(8);
	}

	@Transient
	public void setCconsorcio(java.math.BigDecimal cconsorcio) throws SQLException {
		_struct.setAttribute(8, cconsorcio);
	}

	@Transient
	public java.math.BigDecimal getCasegurado() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(9);
	}

	@Transient
	public void setCasegurado(java.math.BigDecimal casegurado) throws SQLException {
		_struct.setAttribute(9, casegurado);
	}

	@Transient
	public java.math.BigDecimal getCcodeudor() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(10);
	}

	@Transient
	public void setCcodeudor(java.math.BigDecimal ccodeudor) throws SQLException {
		_struct.setAttribute(10, ccodeudor);
	}

	@Transient
	public java.math.BigDecimal getCbenef() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(11);
	}

	@Transient
	public void setCbenef(java.math.BigDecimal cbenef) throws SQLException {
		_struct.setAttribute(11, cbenef);
	}

	@Transient
	public java.math.BigDecimal getCaccionista() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(12);
	}

	@Transient
	public void setCaccionista(java.math.BigDecimal caccionista) throws SQLException {
		_struct.setAttribute(12, caccionista);
	}

	@Transient
	public java.math.BigDecimal getCintermed() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(13);
	}

	@Transient
	public void setCintermed(java.math.BigDecimal cintermed) throws SQLException {
		_struct.setAttribute(13, cintermed);
	}

	@Transient
	public java.math.BigDecimal getCrepresen() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(14);
	}

	@Transient
	public void setCrepresen(java.math.BigDecimal crepresen) throws SQLException {
		_struct.setAttribute(14, crepresen);
	}

	@Transient
	public java.math.BigDecimal getCapoderado() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(15);
	}

	@Transient
	public void setCapoderado(java.math.BigDecimal capoderado) throws SQLException {
		_struct.setAttribute(15, capoderado);
	}

	@Transient
	public java.math.BigDecimal getCpagador() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(16);
	}

	@Transient
	public void setCpagador(java.math.BigDecimal cpagador) throws SQLException {
		_struct.setAttribute(16, cpagador);
	}

	@Transient
	public java.math.BigDecimal getCvalor() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(17);
	}

	@Transient
	public void setCvalor(java.math.BigDecimal cvalor) throws SQLException {
		_struct.setAttribute(17, cvalor);
	}

	@Transient
	public String getObservacion() throws SQLException {
		return (String) _struct.getAttribute(18);
	}

	@Transient
	public void setObservacion(String observacion) throws SQLException {
		_struct.setAttribute(18, observacion);
	}

	@Transient
	public String getCuser() throws SQLException {
		return (String) _struct.getAttribute(19);
	}

	@Transient
	public void setCuser(String cuser) throws SQLException {
		_struct.setAttribute(19, cuser);
	}

	@Transient
	public /* java.sql.Date */String getFalta() throws SQLException {
		return (/* java.sql.Date */String) _struct.getAttribute(20);
	}

	@Transient
	public void setFalta(/* java.sql.Date */String falta) throws SQLException {
		_struct.setAttribute(20, falta);
	}

	// INI TCS-344 CJMR 19/02/2019
	@Transient
	public java.math.BigDecimal getCproveedor() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(21);
	}

	@Transient
	public void setCproveedor(java.math.BigDecimal cproveedor) throws SQLException {
		_struct.setAttribute(21, cproveedor);
	}

	// FIN TCS-344 CJMR 19/02/2019
	// INI IAXIS-5478 15/01/2021
	@Transient
	public java.math.BigDecimal getCgrupoecon() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(22);
	}

	@Transient
	public void setCgrupoecon(java.math.BigDecimal cgrupoecon) throws SQLException {
		_struct.setAttribute(22, cgrupoecon);
	}

	// FIN IAXIS-5478 15/01/2021
	@Transient
	public ObIaxMarcas obIaxMarcas(ObIaxMarcas[] __jPt_out) throws java.sql.SQLException {
		ObIaxMarcas __jPt_temp = (ObIaxMarcas) this;
		ObIaxMarcas __jPt_result;
		try {
			/* @lineinfo:generated-code */
			/* @lineinfo:152^5 */

			// ************************************************************
			// #sql [getConnectionContext()] { BEGIN
			// :__jPt_result := OB_IAX_MARCAS();
			// END;
			// };
			// ************************************************************

			{
				// declare temps
				oracle.jdbc.OracleCallableStatement __sJT_st = null;
				sqlj.runtime.ref.DefaultContext __sJT_cc = getConnectionContext();
				if (__sJT_cc == null)
					sqlj.runtime.error.RuntimeRefErrors.raise_NULL_CONN_CTX();
				sqlj.runtime.ExecutionContext.OracleContext __sJT_ec = ((__sJT_cc.getExecutionContext() == null)
						? sqlj.runtime.ExecutionContext.raiseNullExecCtx()
						: __sJT_cc.getExecutionContext().getOracleContext());
				try {
					String theSqlTS = "BEGIN\n       :1  := OB_IAX_MARCAS();\n      END;";
					__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "0axis.mvc.model.ObIaxMarcas", theSqlTS);
					if (__sJT_ec.isNew()) {
						__sJT_st.registerOutParameter(1, 2002, "OB_IAX_MARCAS");
					}
					// execute statement
					__sJT_ec.oracleExecuteUpdate();
					// retrieve OUT parameters
					__jPt_result = (axis.mvc.model.ObIaxMarcas) __sJT_st.getORAData(1,
							axis.mvc.model.ObIaxMarcas.getORADataFactory());
				} finally {
					__sJT_ec.oracleClose();
				}
			}

			// ************************************************************

			/* @lineinfo:user-code */ /* @lineinfo:156^5 */
			__jPt_out[0] = __jPt_temp;
		} catch (java.sql.SQLException _err) {
			try {
				getConnectionContext().getExecutionContext().close();
				closeConnection();
				if (__dataSource == null)
					throw _err;
				/* @lineinfo:generated-code */ /* @lineinfo:163^5 */

				// ************************************************************
				// #sql [getConnectionContext()] { BEGIN
				// :__jPt_result := OB_IAX_MARCAS();
				// END;
				// };
				// ************************************************************

				{
					// declare temps
					oracle.jdbc.OracleCallableStatement __sJT_st = null;
					sqlj.runtime.ref.DefaultContext __sJT_cc = getConnectionContext();
					if (__sJT_cc == null)
						sqlj.runtime.error.RuntimeRefErrors.raise_NULL_CONN_CTX();
					sqlj.runtime.ExecutionContext.OracleContext __sJT_ec = ((__sJT_cc.getExecutionContext() == null)
							? sqlj.runtime.ExecutionContext.raiseNullExecCtx()
							: __sJT_cc.getExecutionContext().getOracleContext());
					try {
						String theSqlTS = "BEGIN\n       :1  := OB_IAX_MARCAS();\n      END;";
						__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "1axis.mvc.model.ObIaxMarcas", theSqlTS);
						if (__sJT_ec.isNew()) {
							__sJT_st.registerOutParameter(1, 2002, "OB_IAX_MARCAS");
						}
						// execute statement
						__sJT_ec.oracleExecuteUpdate();
						// retrieve OUT parameters
						__jPt_result = (axis.mvc.model.ObIaxMarcas) __sJT_st.getORAData(1,
								axis.mvc.model.ObIaxMarcas.getORADataFactory());
					} finally {
						__sJT_ec.oracleClose();
					}
				}

				// ************************************************************

				/* @lineinfo:user-code */ /* @lineinfo:167^5 */
				__jPt_out[0] = __jPt_temp;
			} catch (java.sql.SQLException _err2) {
				try {
					getConnectionContext().getExecutionContext().close();
				} catch (java.sql.SQLException _sqle) {
				}
				throw _err;
			}
		}
		return __jPt_result;
	}
}/* @lineinfo:generated-code */