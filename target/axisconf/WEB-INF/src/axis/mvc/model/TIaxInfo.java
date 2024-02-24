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

public class TIaxInfo implements ORAData, ORADataFactory, Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8534945054717363653L;
	public String _SQL_NAME = "T_IAX_INFO";
	public static final int _SQL_TYPECODE = OracleTypes.ARRAY;

	MutableArray _array;

	private static final TIaxInfo _TIaxInfoFactory = new TIaxInfo();

	public static ORADataFactory getORADataFactory() {
		return _TIaxInfoFactory;
	}
	/* constructors */

	public TIaxInfo() {
		this((ObIaxInfo[]) null);
	}

	public TIaxInfo(ObIaxInfo[] a) {
		_array = new MutableArray(2002, a, ObIaxInfo.getORADataFactory());
	}

	/* ORAData interface */

	public Datum toDatum(Connection c) throws SQLException {

		return _array.toDatum(c, _SQL_NAME);
	}

	/* ORADataFactory interface */

	public ORAData create(Datum d, int sqlType) throws SQLException {
		if (d == null)
			return null;
		TIaxInfo a = new TIaxInfo();
		a._array = new MutableArray(2002, (ARRAY) d, ObIaxInfo.getORADataFactory());
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

	public ObIaxInfo[] getArray() throws SQLException {
		return (ObIaxInfo[]) _array.getObjectArray(new ObIaxInfo[_array.length()]);
	}

	public ObIaxInfo[] getArray(long index, int count) throws SQLException {
		return (ObIaxInfo[]) _array.getObjectArray(index, new ObIaxInfo[_array.sliceLength(index, count)]);
	}

	public void setArray(ObIaxInfo[] a) throws SQLException {
		_array.setObjectArray(a);
	}

	public void setArray(ObIaxInfo[] a, long index) throws SQLException {
		_array.setObjectArray(a, index);
	}

	public ObIaxInfo getElement(long index) throws SQLException {
		return (ObIaxInfo) _array.getObjectElement(index);
	}

	public void setElement(ObIaxInfo a, long index) throws SQLException {
		_array.setObjectElement(a, index);
	}

}
