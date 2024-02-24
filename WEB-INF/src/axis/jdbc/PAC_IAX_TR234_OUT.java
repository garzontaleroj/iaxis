package axis.jdbc; //WLS-Ready

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.mvc.model.UsuarioBean;
import axis.util.ConversionUtil;

public class PAC_IAX_TR234_OUT extends AccesoPL {

	static Log logger = LogFactory.getLog(PAC_IAX_TR234_OUT.class);
	private Connection conn = null;

	public PAC_IAX_TR234_OUT(Connection conn) {
		this.conn = conn;
	}

	// --START-PAC_IAX_TR234_OUT.F_GENERAR_FICHERO(PCINOUT, PFHASTA, PNFICHERO)
	private HashMap callPAC_IAX_TR234_OUT__F_GENERAR_FICHERO(java.math.BigDecimal pPCINOUT, java.sql.Date pPFHASTA,
			java.math.BigDecimal pPNFICHERO) throws Exception {
		String callQuery = "{?=call PAC_IAX_TR234_OUT.F_GENERAR_FICHERO(?, ?, ?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCINOUT", "pPFHASTA", "pPNFICHERO" },
				new Object[] { pPCINOUT, pPFHASTA, pPNFICHERO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCINOUT);
		cStmt.setObject(3, pPFHASTA);
		cStmt.setObject(6, pPNFICHERO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(4, java.sql.Types.VARCHAR); // Valor de "PTNOMFICH"
		cStmt.registerOutParameter(5, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PTNOMFICH", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PTNOMFICH", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(5));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TR234_OUT__F_GENERAR_FICHERO(java.math.BigDecimal pPCINOUT, java.sql.Date pPFHASTA,
			java.math.BigDecimal pPNFICHERO) throws Exception {
		return this.callPAC_IAX_TR234_OUT__F_GENERAR_FICHERO(pPCINOUT, pPFHASTA, pPNFICHERO);
	}

	// --END-PAC_IAX_TR234_OUT.F_GENERAR_FICHERO
	// --START-PAC_IAX_TR234_OUT.F_BUSCAR_TRASPASOS(PCINOUT, PFHASTA)
	private HashMap callPAC_IAX_TR234_OUT__F_BUSCAR_TRASPASOS(java.math.BigDecimal pPCINOUT, java.sql.Date pPFHASTA)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TR234_OUT.F_BUSCAR_TRASPASOS(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPCINOUT", "pPFHASTA" }, new Object[] { pPCINOUT, pPFHASTA });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPCINOUT);
		cStmt.setObject(3, pPFHASTA);
		cStmt.registerOutParameter(1, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_TRASPASOS".toUpperCase())); // Valor de "RETURN"
		cStmt.registerOutParameter(4, oracle.jdbc.OracleTypes.ARRAY,
				UsuarioBean.fixOwner(USERNAME, "T_IAX_MENSAJES".toUpperCase())); // Valor de "MENSAJES"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// AXIS-WLS1SERVER-Ready
		cStmt.close();// AXIS-WLS1SERVER-Ready

		return retVal;
	}

	public HashMap ejecutaPAC_IAX_TR234_OUT__F_BUSCAR_TRASPASOS(java.math.BigDecimal pPCINOUT, java.sql.Date pPFHASTA)
			throws Exception {
		return this.callPAC_IAX_TR234_OUT__F_BUSCAR_TRASPASOS(pPCINOUT, pPFHASTA);
	}
	// --END-PAC_IAX_TR234_OUT.F_BUSCAR_TRASPASOS

}
