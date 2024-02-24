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

public class ObIaxMarcasRef implements ORAData, ORADataFactory, Serializable {

	private static final long serialVersionUID = 6895420798830937293L;

	public String _SQL_BASETYPE = "OB_IAX_MARCAS";
	public static final int _SQL_TYPECODE = OracleTypes.REF;

	REF _ref;

	private static final ObIaxMarcasRef _ObIaxMarcasRefFactory = new ObIaxMarcasRef();

	public static ORADataFactory getORADataFactory() {
		return _ObIaxMarcasRefFactory;
	}
	/* constructor */

	public ObIaxMarcasRef() {
	}

	/* ORAData interface */

	public Datum toDatum(Connection c) throws SQLException {
		return _ref;
	}

	/* ORADataFactory interface */

	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		ObIaxMarcasRef r = new ObIaxMarcasRef();
		r._ref = (REF) d;
		return r;
	}

	public static ObIaxMarcasRef cast(ORAData o) throws SQLException {
		if (o == null)
			return null;
		try {
			return (ObIaxMarcasRef) getORADataFactory().create(o.toDatum(null), OracleTypes.REF);
		} catch (Exception exn) {
			throw new SQLException(
					"Unable to convert " + o.getClass().getName() + " to ObIaxMarcasRef: " + exn.toString());
		}
	}

	public ObIaxMarcas getValue() throws SQLException {
		return (ObIaxMarcas) ObIaxMarcas.getORADataFactory().create(_ref.getSTRUCT(), OracleTypes.REF);
	}

	public void setValue(ObIaxMarcas c) throws SQLException {
		_ref.setValue((STRUCT) c.toDatum(_ref.getJavaSqlConnection()));
	}
}
