package axis.mvc.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;

import oracle.jdbc.OracleTypes;
import oracle.jpub.runtime.MutableArray;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.Datum;
import oracle.sql.ORAData;
import oracle.sql.ORADataFactory;

public class TIaxMarcas implements ORAData, ORADataFactory, Serializable {

	private static final long serialVersionUID = -6027135373076688681L;

	public String _SQL_NAME = "T_IAX_MARCAS";
	public static final int _SQL_TYPECODE = OracleTypes.ARRAY;

	MutableArray _array;

	private static final TIaxMarcas _TIaxMarcasFactory = new TIaxMarcas();

	public static ORADataFactory getORADataFactory() {
		return _TIaxMarcasFactory;
	}
	/* constructors */

	public TIaxMarcas() {
		this((ObIaxMarcas[]) null);
	}

	public TIaxMarcas(ObIaxMarcas[] a) {
		_array = new MutableArray(2002, a, ObIaxMarcas.getORADataFactory());
	}

	/* ORAData interface */

	public Datum toDatum(Connection c) throws SQLException {

		return _array.toDatum(c, _SQL_NAME);
	}

	/* ORADataFactory interface */

	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		TIaxMarcas a = new TIaxMarcas();
		a._array = new MutableArray(2002, (ARRAY) d, ObIaxMarcas.getORADataFactory());
		return a;
	}

	public int length() throws SQLException {
		return _array.length();
	}

	public int getBaseType() throws SQLException {
		return _array.getBaseType();
	}

	public String getBaseTypeName() throws SQLException {
		return _array.getBaseTypeName();
	}

	public ArrayDescriptor getDescriptor() throws SQLException {
		return _array.getDescriptor();
	}

	/* array accessor methods */

	public ObIaxMarcas[] getArray() throws SQLException {
		return (ObIaxMarcas[]) _array.getObjectArray(new ObIaxMarcas[_array.length()]);
	}

	public ObIaxMarcas[] getArray(long index, int count) throws SQLException {
		return (ObIaxMarcas[]) _array.getObjectArray(index, new ObIaxMarcas[_array.sliceLength(index, count)]);
	}

	public void setArray(ObIaxMarcas[] a) throws SQLException {
		_array.setObjectArray(a);
	}

	public void setArray(ObIaxMarcas[] a, long index) throws SQLException {
		_array.setObjectArray(a, index);
	}

	public ObIaxMarcas getElement(long index) throws SQLException {
		return (ObIaxMarcas) _array.getObjectElement(index);
	}

	public void setElement(ObIaxMarcas a, long index) throws SQLException {
		_array.setObjectElement(a, index);
	}

}
