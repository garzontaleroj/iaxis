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

public class ObIaxGfiformRef implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5216368121321329218L;
	public static final String _SQL_BASETYPE = "ICRE_T.OB_IAX_GFIFORM";
	public static final int _SQL_TYPECODE = OracleTypes.REF;

	REF _ref;

	private static final ObIaxGfiformRef _ObIaxGfiformRefFactory = new ObIaxGfiformRef();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxGfiformRefFactory;
	}

	/* constructor */
	public ObIaxGfiformRef() {
	}

	/* ORAData interface */
	public Datum toDatum(Connection c) throws SQLException {
		return _ref;
	}

	/* ORADataFactory interface */
	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		ObIaxGfiformRef r = new ObIaxGfiformRef();
		r._ref = (REF) d;
		return r;
	}

	public static ObIaxGfiformRef cast(ORAData o) throws SQLException {
		if (o == null)
			return null;
		try {
			return (ObIaxGfiformRef) getORADataFactory().create(o.toDatum(null), OracleTypes.REF);
		} catch (Exception exn) {
			throw new SQLException(
					"Unable to convert " + o.getClass().getName() + " to ObIaxGfiformRef: " + exn.toString());
		}
	}

	public ObIaxGfiform getValue() throws SQLException {
		return (ObIaxGfiform) ObIaxGfiform.getORADataFactory().create(_ref.getSTRUCT(), OracleTypes.REF);
	}

	public void setValue(ObIaxGfiform c) throws SQLException {
		_ref.setValue((STRUCT) c.toDatum(_ref.getJavaSqlConnection()));
	}
}
