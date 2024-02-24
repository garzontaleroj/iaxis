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

public class TIaxGfiparam implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8824153172800040589L;
	public String _SQL_NAME = "ICRE_T.T_IAX_GFIPARAM";
	public static final int _SQL_TYPECODE = OracleTypes.ARRAY;

	MutableArray _array;

	private static final TIaxGfiparam _TIaxGfiparamFactory = new TIaxGfiparam();

	public static ORADataFactory getORADataFactory() {
		return _TIaxGfiparamFactory;
	}

	/* constructors */
	public TIaxGfiparam() {
		this((ObIaxGfiparam[]) null);
	}

	public TIaxGfiparam(ObIaxGfiparam[] a) {
		_array = new MutableArray(2002, a, ObIaxGfiparam.getORADataFactory());
	}

	/* ORAData interface */
	public Datum toDatum(Connection c) throws SQLException {
		return _array.toDatum(c, _SQL_NAME);
	}

	/* ORADataFactory interface */
	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		TIaxGfiparam a = new TIaxGfiparam();
		a._array = new MutableArray(2002, (ARRAY) d, ObIaxGfiparam.getORADataFactory());
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
	public ObIaxGfiparam[] getArray() throws SQLException {
		return (ObIaxGfiparam[]) _array.getObjectArray(new ObIaxGfiparam[_array.length()]);
	}

	public ObIaxGfiparam[] getArray(long index, int count) throws SQLException {
		return (ObIaxGfiparam[]) _array.getObjectArray(index, new ObIaxGfiparam[_array.sliceLength(index, count)]);
	}

	public void setArray(ObIaxGfiparam[] a) throws SQLException {
		_array.setObjectArray(a);
	}

	public void setArray(ObIaxGfiparam[] a, long index) throws SQLException {
		_array.setObjectArray(a, index);
	}

	public ObIaxGfiparam getElement(long index) throws SQLException {
		return (ObIaxGfiparam) _array.getObjectElement(index);
	}

	public void setElement(ObIaxGfiparam a, long index) throws SQLException {
		_array.setObjectElement(a, index);
	}

}
