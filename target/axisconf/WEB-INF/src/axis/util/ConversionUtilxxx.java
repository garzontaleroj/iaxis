package axis.util;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.lang.StringUtils;

// import axis.cache.ConfigCache;

public class ConversionUtilxxx {
	public static String SIMPLENUMBERFORMAT = "#.#";

	/**
	 * Convierte un oracle.sql.STRUCT a un HashMap. Requiere que se mantiene la
	 * conexion abierta durante esa operacion. Funcion se ejecuta de forma recursiva
	 * / alterando con listOracleARRAY
	 * 
	 * @param mySTRUCT STRUCT de entrada
	 * @return
	 * @throws Exception
	 */
	public HashMap hashOracleSTRUCT(oracle.sql.STRUCT mySTRUCT) throws Exception {
		return this.hashOracleSTRUCT(mySTRUCT, null);
		// return this.hashOracleSTRUCT(mySTRUCT, "__");
	}

	/**
	 * Convierte un oracle.sql.STRUCT a un HashMap. Requiere que se mantiene la
	 * conexion abierta durante esa operacion. Funcion se ejecuta de forma recursiva
	 * / alterando con listOracleARRAY
	 * 
	 * @param mySTRUCT          STRUCT de entrada
	 * @param typenameSeparator Cadena con la cual se va a sustituir el "." entre
	 *                          Esquema-Prefix y nombre del Tipo de dato (por
	 *                          ejemplo: "__"). Un 'null' causa una no-utilizacion
	 *                          del esquema.
	 * @return
	 * @throws Exception
	 */
	public HashMap hashOracleSTRUCT(oracle.sql.STRUCT mySTRUCT, String typenameSeparator) throws Exception {
		HashMap tempHash = null;
		if (mySTRUCT != null) {
			oracle.sql.Datum[] dats = mySTRUCT.getOracleAttributes();
			tempHash = new HashMap();
			for (int i = 1; i <= mySTRUCT.getDescriptor().getMetaData().getColumnCount(); i++) {
				String colName = mySTRUCT.getDescriptor().getMetaData().getColumnName(i);
				Object colObject = dats[i - 1];
				if (colObject != null)
					colObject = dats[i - 1].toJdbc();
				boolean done = false;
				if (!done && colObject != null && colObject instanceof oracle.sql.ARRAY) {
					colObject = listOracleARRAY((oracle.sql.ARRAY) colObject, typenameSeparator);
					done = true;
				}
				if (!done && colObject != null && colObject instanceof oracle.sql.STRUCT) {
					colObject = hashOracleSTRUCT((oracle.sql.STRUCT) colObject, typenameSeparator);
					done = true;
				}
				if (!done && colObject != null) {
					// colObject=colObject; // ...o se que : pasa nada.
					done = true;
				}
				if (!done) {
					colObject = null;
					done = true;
				}
				tempHash.put(colName.toUpperCase(), colObject);
			}
		}
		return tempHash;
	}

	/**
	 * Convierte un oracle.sql.ARRAY a un ArrayList. Requiere que se mantiene la
	 * conexion abierta durante esa operacion. Funcion se ejecuta de forma recursiva
	 * / alterando con hashOracleSTRUCT
	 * 
	 * @param myARRAY ARRAY de etrada
	 * @return
	 * @throws Exception
	 */
	public ArrayList listOracleARRAY(oracle.sql.ARRAY myARRAY) throws Exception {
		return this.listOracleARRAY(myARRAY, null);
		// return this.listOracleARRAY( myARRAY, "__");
	}

	/**
	 * Convierte un oracle.sql.ARRAY a un ArrayList. Requiere que se mantiene la
	 * conexion abierta durante esa operacion. Funcion se ejecuta de forma recursiva
	 * / alterando con hashOracleSTRUCT
	 * 
	 * @param myARRAY           ARRAY de etrada
	 * @param typenameSeparator Cadena con la cual se va a sustituir el "." entre
	 *                          Esquema-Prefix y nombre del Tipo de dato (por
	 *                          ejemplo: "__"). Un 'null' causa una no-utilizacion
	 *                          del esquema.
	 * @return
	 * @throws Exception
	 */
	public ArrayList listOracleARRAY(oracle.sql.ARRAY myARRAY, String typenameSeparator) throws Exception {
		ArrayList retVal = new ArrayList();
		HashMap tempHash = null;
		Object[] values = (Object[]) myARRAY.getArray();
		int columnCount = 0;
		for (int v = 0; v < values.length; v++) {
			tempHash = new HashMap();
			Object myValue = values[v];
			boolean done = false;
			if (!done && myValue != null && myValue instanceof oracle.sql.STRUCT) {
				oracle.sql.STRUCT myStruct = (oracle.sql.STRUCT) myValue;
				String sqlTypeName = myStruct.getSQLTypeName();
				if (typenameSeparator == null) {
					if (sqlTypeName.indexOf(".") > 0)
						sqlTypeName = sqlTypeName.substring(sqlTypeName.indexOf(".") + 1);
				} else {
					sqlTypeName = StringUtils.replace(sqlTypeName, ".", typenameSeparator);
				}
				// tempHash.put(
				// StringUtils.replace(myStruct.getSQLTypeName(),".",typenameSeparator),
				// this.hashOracleSTRUCT(myStruct, typenameSeparator));
				tempHash.put(sqlTypeName, this.hashOracleSTRUCT(myStruct, typenameSeparator));
				done = true;
			}
			if (!done && myValue != null && myValue instanceof oracle.sql.ARRAY) {
				oracle.sql.ARRAY myArray = (oracle.sql.ARRAY) myValue;
				String baseTypName = myArray.getBaseTypeName();
				if (typenameSeparator == null) {
					if (baseTypName.indexOf(".") > 0)
						baseTypName = baseTypName.substring(baseTypName.indexOf(".") + 1);
				} else {
					baseTypName = StringUtils.replace(baseTypName, ".", typenameSeparator);
				}
				// tempHash.put(
				// StringUtils.replace(myArray.getBaseTypeName(),".",typenameSeparator),
				// this.listOracleARRAY( myArray, typenameSeparator));
				tempHash.put(baseTypName, this.listOracleARRAY(myArray, typenameSeparator));
				done = true;
			}
			if (!done && myValue != null) {
				tempHash.put("OBJECT", myValue);
				done = true;
			}
			if (!done) {
				tempHash.put("OBJECT", null);
				done = true;
			}
			retVal.add(tempHash);
		}
		return retVal;
	}

	public HashMap convertOracleObjects(HashMap oracleObjectsMap) throws Exception {
		Object[] keySetArray = oracleObjectsMap.keySet().toArray();
		HashMap objectsMap = new HashMap();
		boolean done = false;
		for (int i = 0; i < keySetArray.length; i++) {
			done = false;
			String className = "";
			try {
				className = oracleObjectsMap.get(keySetArray[i].toString()).getClass().getName();
			} catch (NullPointerException e) {
				// logger.warn(keySetArray[i].toString()+" es nulo");
			}
			if (!done && oracleObjectsMap.get(keySetArray[i].toString()) instanceof oracle.sql.STRUCT) {
				objectsMap.put(keySetArray[i].toString(), this
						.hashOracleSTRUCT((oracle.sql.STRUCT) oracleObjectsMap.get(keySetArray[i].toString()), null));
				done = true;
			}
			if (!done && oracleObjectsMap.get(keySetArray[i].toString()) instanceof oracle.sql.ARRAY) {
				objectsMap.put(keySetArray[i].toString(),
						this.listOracleARRAY((oracle.sql.ARRAY) oracleObjectsMap.get(keySetArray[i].toString()), null));
				done = true;
			}

			if (!done && className.indexOf("ResultSet") >= 0) {
				objectsMap.put(keySetArray[i].toString(),
						this.resultSet2ArrayList((java.sql.ResultSet) oracleObjectsMap.get(keySetArray[i].toString())));
				done = true;
			}
			if (!done) {
				// si aun no lo hemos convertido, lo pasamos a saco
				objectsMap.put(keySetArray[i].toString(), oracleObjectsMap.get(keySetArray[i].toString()));
				done = true;
			}
		}
		return objectsMap;
	}

	/**
	 * Convierte un ResultSet en un ArrayList de HashMaps, donde la claves de los
	 * HashMaps son los nombre de las columnas (en MAYUSCULAS). Se copia el tipo de
	 * dato que retorna JDBC tal y cual.
	 * 
	 * @param rs Resultset de entrada
	 * @return
	 * @throws Exception
	 */
	public static ArrayList resultSet2ArrayList(ResultSet rs) throws Exception {
		int columnCount = rs.getMetaData().getColumnCount();
		String[] columnNames = new String[columnCount];
		for (int i = 0; i < columnCount; i++) {
			columnNames[i] = rs.getMetaData().getColumnName(i + 1).toUpperCase();
		}
		ArrayList retVal = new ArrayList();
		HashMap item = null;
		while (rs.next()) {
			item = new HashMap();
			for (int i = 0; i < columnCount; i++) {
				item.put(columnNames[i], rs.getObject(i + 1));
			}
			retVal.add(item);
		}
		return retVal;
	}

	/**
	 * Produce un XML-String (windows-1252) de un objeto ArrayList o HashMap
	 * 
	 * @param o           ArrayList o HashMap
	 * @param rootElement Nombre del elemento raiz del XML-String
	 * @return
	 */
	public String printAsXML(Object o, String rootElement) {
		return this.printAsXML(o, rootElement, true, true, "yyyy-MM-dd'T'HH:mm:ss.SSS'+01:00'");
	}

	/**
	 * Produce un XML-String (windows-1252) de un objeto ArrayList o HashMap
	 * 
	 * @param o                ArrayList o HashMap
	 * @param rootElement      Nombre del elemento raiz del XML-String
	 * @param showJclass       Presentar o no la clase Java en XML (default true)
	 * @param showNull         Presentar o no un indicador de NULLs en XML (default
	 *                         true)
	 * @param timestampPattern Plantilla para representar timeStamps, notaci�n Java
	 *                         (default "yyyy-MM-dd'T'HH:mm:ss.SSS'+01:00'")
	 * @return
	 */
	public String printAsXML(Object o, String rootElement, boolean showJclass, boolean showNull,
			String timestampPattern, boolean autoNodeNames) {

		StringBuffer retVal = new StringBuffer();
		retVal.append("<?xml version=\"1.0\" encoding=\"windows-1252\"?>\n");
		retVal.append("<").append(rootElement).append(">\n");
		retVal.append(asXML(o, showJclass, showNull, timestampPattern, autoNodeNames));
		retVal.append("</").append(rootElement).append(">");
		return retVal.toString();
	}

	public String printAsXML(Object o, String rootElement, boolean showJclass, boolean showNull,
			String timestampPattern) {
		return printAsXML(o, rootElement, showJclass, showNull, timestampPattern, false);
	}

	/**
	 * Produce un XML-String (windows-1252) de un objeto ArrayList o HashMap sin
	 * rootElement
	 * 
	 * @param o                ArrayList o HashMap
	 * @param showJclass       Presentar o no la clase Java en XML (default true)
	 * @param showNull         Presentar o no un indicador de NULLs en XML (default
	 *                         true)
	 * @param timestampPattern Plantilla para representar timeStamps, notaci�n Java
	 *                         (default "yyyy-MM-dd'T'HH:mm:ss.SSS'+01:00'")
	 * @return
	 */
	private String asXML(Object o, boolean showJclass, boolean showNull, String timestampPattern,
			boolean autoNodeNames) {
		String retVal = "";
		boolean done = false;
		if (o instanceof ArrayList) {
			done = true;
			ArrayList t = (ArrayList) o;
			if (t != null) {
				if (autoNodeNames)
					retVal = retVal + "<__node type='COLLECTION'>\n";
				for (int i = 0; i < t.size(); i++) {
					Object oSub = t.get(i);
					retVal = retVal + asXML(oSub, showJclass, showNull, timestampPattern, autoNodeNames);
				}
				if (autoNodeNames)
					retVal = retVal + "</__node>\n";
			} else {
			}
		}
		if (o instanceof HashMap) {
			done = true;
			HashMap t = (HashMap) o;
			if (t != null) {
				if (autoNodeNames)
					retVal = retVal + "<__node type='OBJECT'>\n";
				Object[] myKeySetArray = t.keySet().toArray();
				for (int i = 0; i < myKeySetArray.length; i++) {
					String keyName = (String) myKeySetArray[i];
					Object oSub = t.get(keyName);
					String jclassString = "";
					if (showJclass)
						jclassString = "jclass=\"" + ((oSub != null) ? oSub.getClass().getName() : "(NULL)") + "\"";
					String nullString = "";
					if (showNull)
						nullString = "null=\"" + ((oSub == null) ? "true" : "false");
					retVal = retVal + "<" + keyName + " " + jclassString + " " + nullString + "\">"
							+ asXML(oSub, showJclass, showNull, timestampPattern, autoNodeNames) + "</" + keyName
							+ ">\n";
				}
				if (autoNodeNames)
					retVal = retVal + "</__node>\n";
			} else {
			}
		}

		if (o instanceof java.sql.Timestamp) {
			done = true;
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(timestampPattern);
			retVal = retVal + ((o != null) ? sdf.format(o) : "");
			// Complete date plus hours, minutes, seconds and a decimal fraction of a
			// second
			// YYYY-MM-DDThh:mm:ss.sTZD (eg 1997-07-16T19:20:30.45+01:00)

		}

		if (o instanceof BigDecimal || o instanceof Integer || o instanceof Double || o instanceof Float) {
			done = true;
			retVal = retVal + ((o != null) ? (new DecimalFormat(this.SIMPLENUMBERFORMAT).format(o)) : "");
		}
		if (!done) {
			done = true;
			retVal = retVal + ((o != null) ? o.toString() : "");
		}
		return retVal;
	}

	/**
	 * Funci�n que devuelve un BigDeciam a partir de un String
	 * 
	 * @param String
	 * @return BigDeciaml
	 */
	public static BigDecimal toBigDecimal(String decimal) {
		BigDecimal numero = null;
		try {
			numero = new BigDecimal(decimal);
		} catch (NumberFormatException e) {
			numero = null;
		}
		return numero;
	}

}
