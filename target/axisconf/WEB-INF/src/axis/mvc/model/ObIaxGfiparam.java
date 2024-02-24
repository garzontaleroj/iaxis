/*@lineinfo:filename=ObIaxGfiparam*//*@lineinfo:user-code*//*@lineinfo:1^1*/
package axis.mvc.model;

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

public class ObIaxGfiparam implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 5668700181812397396L;
	public String _SQL_NAME = "ICRE_T.OB_IAX_GFIPARAM";
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
	};

	protected MutableStruct _struct;

	protected static int[] _sqlType = { 2, 12, 12 };
	protected static ORADataFactory[] _factory = new ORADataFactory[3];
	protected static final ObIaxGfiparam _ObIaxGfiparamFactory = new ObIaxGfiparam();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxGfiparamFactory;
	}

	/* constructors */
	protected void _init_struct(boolean init) {
		if (init)
			_struct = new MutableStruct(new Object[3], _sqlType, _factory);
	}

	public ObIaxGfiparam() {
		_init_struct(true);
		__tx = DefaultContext.getDefaultContext();
	}

	public ObIaxGfiparam(DefaultContext c) /* throws SQLException */
	{
		_init_struct(true);
		__tx = c;
	}

	public ObIaxGfiparam(Connection c) /* throws SQLException */
	{
		_init_struct(true);
		__onn = c;
	}

	public ObIaxGfiparam(java.math.BigDecimal clave, String parametro, String tparam) throws SQLException {
		_init_struct(true);
		setClave(clave);
		setParametro(parametro);
		setTparam(tparam);
	}

	/* ORAData interface */
	public Datum toDatum(Connection c) throws SQLException {
		if (__tx != null && __onn != c)
			release();
		__onn = c;
		return _struct.toDatum(c, _SQL_NAME);
	}

	/* ORADataFactory interface */
	public ORAData create(Datum d, int sqlType) throws SQLException {
		return create(null, d, sqlType);
	}

	public void setFrom(ObIaxGfiparam o) throws SQLException {
		setContextFrom(o);
		setValueFrom(o);
	}

	protected void setContextFrom(ObIaxGfiparam o) throws SQLException {
		release();
		__tx = o.__tx;
		__onn = o.__onn;
	}

	protected void setValueFrom(ObIaxGfiparam o) {
		_struct = o._struct;
	}

	protected ORAData create(ObIaxGfiparam o, Datum d, int sqlType) throws SQLException {
		if (d == null) {
			if (o != null) {
				o.release();
			}
			;
			return null;
		}
		if (o == null)
			o = new ObIaxGfiparam();
		o._struct = new MutableStruct((STRUCT) d, _sqlType, _factory);
		o.__onn = ((STRUCT) d).getJavaSqlConnection();
		return o;
	}

	/* accessor methods */
	public java.math.BigDecimal getClave() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(0);
	}

	public void setClave(java.math.BigDecimal clave) throws SQLException {
		_struct.setAttribute(0, clave);
	}

	public String getParametro() throws SQLException {
		return (String) _struct.getAttribute(1);
	}

	public void setParametro(String parametro) throws SQLException {
		_struct.setAttribute(1, parametro);
	}

	public String getTparam() throws SQLException {
		return (String) _struct.getAttribute(2);
	}

	public void setTparam(String tparam) throws SQLException {
		_struct.setAttribute(2, tparam);
	}

	public ObIaxGfiparam obAxisGfiparam(ObIaxGfiparam __jPt_out[]) throws java.sql.SQLException {
		ObIaxGfiparam __jPt_temp = (ObIaxGfiparam) this;
		ObIaxGfiparam __jPt_result;
		try {
			/* @lineinfo:generated-code */
			/* @lineinfo:144^5 */

//  ************************************************************
//  #sql [getConnectionContext()] { BEGIN
//        :__jPt_result := OB_IAX_GFIPARAM();
//        END;
//       };
//  ************************************************************

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
					String theSqlTS = "BEGIN\n       :1  := OB_IAX_GFIPARAM();\n      END;";
					__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "0axis.mvc.model.ObIaxGfiparam", theSqlTS);
					if (__sJT_ec.isNew()) {
						__sJT_st.registerOutParameter(1, 2002, "ICRE_T.OB_IAX_GFIPARAM");
					}
					// execute statement
					__sJT_ec.oracleExecuteUpdate();
					// retrieve OUT parameters
					__jPt_result = (axis.mvc.model.ObIaxGfiparam) __sJT_st.getORAData(1,
							axis.mvc.model.ObIaxGfiparam.getORADataFactory());
				} finally {
					__sJT_ec.oracleClose();
				}
			}

//  ************************************************************

			/* @lineinfo:user-code *//* @lineinfo:148^5 */
			__jPt_out[0] = __jPt_temp;
		} catch (java.sql.SQLException _err) {
			try {
				getConnectionContext().getExecutionContext().close();
				closeConnection();
				if (__dataSource == null)
					throw _err;
				/* @lineinfo:generated-code *//* @lineinfo:155^5 */

//  ************************************************************
//  #sql [getConnectionContext()] { BEGIN
//        :__jPt_result := OB_IAX_GFIPARAM();
//        END;
//       };
//  ************************************************************

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
						String theSqlTS = "BEGIN\n       :1  := OB_IAX_GFIPARAM();\n      END;";
						__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "1axis.mvc.model.ObIaxGfiparam", theSqlTS);
						if (__sJT_ec.isNew()) {
							__sJT_st.registerOutParameter(1, 2002, "ICRE_T.OB_IAX_GFIPARAM");
						}
						// execute statement
						__sJT_ec.oracleExecuteUpdate();
						// retrieve OUT parameters
						__jPt_result = (axis.mvc.model.ObIaxGfiparam) __sJT_st.getORAData(1,
								axis.mvc.model.ObIaxGfiparam.getORADataFactory());
					} finally {
						__sJT_ec.oracleClose();
					}
				}

//  ************************************************************

				/* @lineinfo:user-code *//* @lineinfo:159^5 */
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