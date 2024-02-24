package axis.mvc.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;
import oracle.sql.Datum;
import oracle.sql.ORAData;
import oracle.sql.ORADataFactory;
import oracle.sql.REF;
import oracle.sql.STRUCT;

public class ObIaxAsigfacturaRef implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 984537123884642977L;
	public String _SQL_BASETYPE = "OB_IAX_ASIGFACTURA";
	public static final int _SQL_TYPECODE = OracleTypes.REF;

	REF _ref;

	private static final ObIaxAsigfacturaRef _ObIaxAsigfacturaRefFactory = new ObIaxAsigfacturaRef();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxAsigfacturaRefFactory;
	}
	/* constructor */

	public ObIaxAsigfacturaRef() {
	}

	/* ORAData interface */

	public Datum toDatum(Connection c) throws SQLException {
		return _ref;
	}

	/* ORADataFactory interface */

	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		ObIaxAsigfacturaRef r = new ObIaxAsigfacturaRef();
		r._ref = (REF) d;
		return r;
	}

	public static ObIaxAsigfacturaRef cast(ORAData o) throws SQLException {
		if (o == null)
			return null;
		try {
			return (ObIaxAsigfacturaRef) getORADataFactory().create(o.toDatum(null), OracleTypes.REF);
		} catch (Exception exn) {
			throw new SQLException(
					"Unable to convert " + o.getClass().getName() + " to ObIaxAsigfacturaRef: " + exn.toString());
		}
	}

	public ObIaxAsigfactura getValue() throws SQLException {
		return (ObIaxAsigfactura) ObIaxAsigfactura.getORADataFactory().create(_ref.getSTRUCT(), OracleTypes.REF);
	}

	public void setValue(ObIaxAsigfactura c) throws SQLException {
		_ref.setValue((STRUCT) c.toDatum(_ref.getJavaSqlConnection()));
	}
}
