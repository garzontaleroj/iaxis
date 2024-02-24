/*@lineinfo:filename=ObIaxGfiform*//*@lineinfo:user-code*//*@lineinfo:1^1*/
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

public class ObIaxGfiform implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4283906522103516621L;
	public String _SQL_NAME = "ICRE_T.OB_IAX_GFIFORM";
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

	protected static int[] _sqlType = { 2, 12, 12, 12, 2, 2, 2, 2, 2003 };
	protected static ORADataFactory[] _factory = new ORADataFactory[9];
	static {
		_factory[8] = TIaxGfiparam.getORADataFactory();
	}
	protected static final ObIaxGfiform _ObIaxGfiformFactory = new ObIaxGfiform();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxGfiformFactory;
	}

	/* constructors */
	protected void _init_struct(boolean init) {
		if (init)
			_struct = new MutableStruct(new Object[9], _sqlType, _factory);
	}

	public ObIaxGfiform() {
		_init_struct(true);
		__tx = DefaultContext.getDefaultContext();
	}

	public ObIaxGfiform(DefaultContext c) /* throws SQLException */
	{
		_init_struct(true);
		__tx = c;
	}

	public ObIaxGfiform(Connection c) /* throws SQLException */
	{
		_init_struct(true);
		__onn = c;
	}

	public ObIaxGfiform(java.math.BigDecimal clave, String codigo, String descripcion, String formula,
			java.math.BigDecimal cramo, java.math.BigDecimal cutili, java.math.BigDecimal crastro,
			java.math.BigDecimal sumatorio, TIaxGfiparam params) throws SQLException {
		_init_struct(true);
		setClave(clave);
		setCodigo(codigo);
		setDescripcion(descripcion);
		setFormula(formula);
		setCramo(cramo);
		setCutili(cutili);
		setCrastro(crastro);
		setSumatorio(sumatorio);
		setParams(params);
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

	public void setFrom(ObIaxGfiform o) throws SQLException {
		setContextFrom(o);
		setValueFrom(o);
	}

	protected void setContextFrom(ObIaxGfiform o) throws SQLException {
		release();
		__tx = o.__tx;
		__onn = o.__onn;
	}

	protected void setValueFrom(ObIaxGfiform o) {
		_struct = o._struct;
	}

	protected ORAData create(ObIaxGfiform o, Datum d, int sqlType) throws SQLException {
		if (d == null) {
			if (o != null) {
				o.release();
			}
			;
			return null;
		}
		if (o == null)
			o = new ObIaxGfiform();
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

	public String getCodigo() throws SQLException {
		return (String) _struct.getAttribute(1);
	}

	public void setCodigo(String codigo) throws SQLException {
		_struct.setAttribute(1, codigo);
	}

	public String getDescripcion() throws SQLException {
		return (String) _struct.getAttribute(2);
	}

	public void setDescripcion(String descripcion) throws SQLException {
		_struct.setAttribute(2, descripcion);
	}

	public String getFormula() throws SQLException {
		return (String) _struct.getAttribute(3);
	}

	public void setFormula(String formula) throws SQLException {
		_struct.setAttribute(3, formula);
	}

	public java.math.BigDecimal getCramo() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(4);
	}

	public void setCramo(java.math.BigDecimal cramo) throws SQLException {
		_struct.setAttribute(4, cramo);
	}

	public java.math.BigDecimal getCutili() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(5);
	}

	public void setCutili(java.math.BigDecimal cutili) throws SQLException {
		_struct.setAttribute(5, cutili);
	}

	public java.math.BigDecimal getCrastro() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(6);
	}

	public void setCrastro(java.math.BigDecimal crastro) throws SQLException {
		_struct.setAttribute(6, crastro);
	}

	public java.math.BigDecimal getSumatorio() throws SQLException {
		return (java.math.BigDecimal) _struct.getAttribute(7);
	}

	public void setSumatorio(java.math.BigDecimal sumatorio) throws SQLException {
		_struct.setAttribute(7, sumatorio);
	}

	public TIaxGfiparam getParams() throws SQLException {
		return (TIaxGfiparam) _struct.getAttribute(8);
	}

	public void setParams(TIaxGfiparam params) throws SQLException {
		_struct.setAttribute(8, params);
	}

	public ObIaxGfiform obAxisGfiform(ObIaxGfiform __jPt_out[]) throws java.sql.SQLException {
		ObIaxGfiform __jPt_temp = (ObIaxGfiform) this;
		ObIaxGfiform __jPt_result;
		try {
			/* @lineinfo:generated-code */
			/* @lineinfo:196^5 */

//  ************************************************************
//  #sql [getConnectionContext()] { BEGIN
//        :__jPt_result := OB_IAX_GFIFORM();
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
					String theSqlTS = "BEGIN\n       :1  := OB_IAX_GFIFORM();\n      END;";
					__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "0axis.mvc.model.ObIaxGfiform", theSqlTS);
					if (__sJT_ec.isNew()) {
						__sJT_st.registerOutParameter(1, 2002, "ICRE_T.OB_IAX_GFIFORM");
					}
					// execute statement
					__sJT_ec.oracleExecuteUpdate();
					// retrieve OUT parameters
					__jPt_result = (axis.mvc.model.ObIaxGfiform) __sJT_st.getORAData(1,
							axis.mvc.model.ObIaxGfiform.getORADataFactory());
				} finally {
					__sJT_ec.oracleClose();
				}
			}

//  ************************************************************

			/* @lineinfo:user-code *//* @lineinfo:200^5 */
			__jPt_out[0] = __jPt_temp;
		} catch (java.sql.SQLException _err) {
			try {
				getConnectionContext().getExecutionContext().close();
				closeConnection();
				if (__dataSource == null)
					throw _err;
				/* @lineinfo:generated-code *//* @lineinfo:207^5 */

//  ************************************************************
//  #sql [getConnectionContext()] { BEGIN
//        :__jPt_result := OB_IAX_GFIFORM();
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
						String theSqlTS = "BEGIN\n       :1  := OB_IAX_GFIFORM();\n      END;";
						__sJT_st = __sJT_ec.prepareOracleCall(__sJT_cc, "1axis.mvc.model.ObIaxGfiform", theSqlTS);
						if (__sJT_ec.isNew()) {
							__sJT_st.registerOutParameter(1, 2002, "ICRE_T.OB_IAX_GFIFORM");
						}
						// execute statement
						__sJT_ec.oracleExecuteUpdate();
						// retrieve OUT parameters
						__jPt_result = (axis.mvc.model.ObIaxGfiform) __sJT_st.getORAData(1,
								axis.mvc.model.ObIaxGfiform.getORADataFactory());
					} finally {
						__sJT_ec.oracleClose();
					}
				}

//  ************************************************************

				/* @lineinfo:user-code *//* @lineinfo:211^5 */
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