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

public class ObIaxInfoRef implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8121040928487081930L;
	public String _SQL_BASETYPE = "OB_IAX_INFO";
	public static final int _SQL_TYPECODE = OracleTypes.REF;

	REF _ref;

	private static final ObIaxInfoRef _ObIaxInfoRefFactory = new ObIaxInfoRef();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxInfoRefFactory;
	}
	/* constructor */

	public ObIaxInfoRef() {
	}

	/* ORAData interface */

	public Datum toDatum(Connection c) throws SQLException {
		return _ref;
	}

	/* ORADataFactory interface */

	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		ObIaxInfoRef r = new ObIaxInfoRef();
		r._ref = (REF) d;
		return r;
	}

	public static ObIaxInfoRef cast(ORAData o) throws SQLException {
		if (o == null)
			return null;
		try {
			return (ObIaxInfoRef) getORADataFactory().create(o.toDatum(null), OracleTypes.REF);
		} catch (Exception exn) {
			throw new SQLException(
					"Unable to convert " + o.getClass().getName() + " to ObIaxInfoRef: " + exn.toString());
		}
	}

	public ObIaxInfo getValue() throws SQLException {
		return (ObIaxInfo) ObIaxInfo.getORADataFactory().create(_ref.getSTRUCT(), OracleTypes.REF);
	}

	public void setValue(ObIaxInfo c) throws SQLException {
		_ref.setValue((STRUCT) c.toDatum(_ref.getJavaSqlConnection()));
	}
}
