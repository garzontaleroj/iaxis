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

public class ObIaxGfiparamRef implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1045957377716867296L;
	public static final String _SQL_BASETYPE = "ICRE_T.OB_IAX_GFIPARAM";
	public static final int _SQL_TYPECODE = OracleTypes.REF;

	REF _ref;

	private static final ObIaxGfiparamRef _ObIaxGfiparamRefFactory = new ObIaxGfiparamRef();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxGfiparamRefFactory;
	}

	/* constructor */
	public ObIaxGfiparamRef() {
	}

	/* ORAData interface */
	public Datum toDatum(Connection c) throws SQLException {
		return _ref;
	}

	/* ORADataFactory interface */
	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		ObIaxGfiparamRef r = new ObIaxGfiparamRef();
		r._ref = (REF) d;
		return r;
	}

	public static ObIaxGfiparamRef cast(ORAData o) throws SQLException {
		if (o == null)
			return null;
		try {
			return (ObIaxGfiparamRef) getORADataFactory().create(o.toDatum(null), OracleTypes.REF);
		} catch (Exception exn) {
			throw new SQLException(
					"Unable to convert " + o.getClass().getName() + " to ObIaxGfiparamRef: " + exn.toString());
		}
	}

	public ObIaxGfiparam getValue() throws SQLException {
		return (ObIaxGfiparam) ObIaxGfiparam.getORADataFactory().create(_ref.getSTRUCT(), OracleTypes.REF);
	}

	public void setValue(ObIaxGfiparam c) throws SQLException {
		_ref.setValue((STRUCT) c.toDatum(_ref.getJavaSqlConnection()));
	}
}
