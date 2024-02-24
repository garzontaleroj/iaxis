package axis.service.axis;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_TR234_OUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr155Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Grid de traspasos previo y generaci�n de fichero de traspasos (y su descarga)
 * ecg 20100212 AXIS1585 bug 11363, la primera entrega fue a salto de mata y
 * tiene muchos //TODO:s
 */
public class Axisctr155Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public Axisctr155Service() {
	}

	public void m_init(HttpServletRequest request) {
		logger.debug("Axisctr155Service m_init");
		this.configForm(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisctr155Action thisAction) {
		logger.debug("Axisctr155Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal pcinout = getCampoNumerico(request, "pcinout");
			BigDecimal numfich = getCampoNumerico(request, "numfich");
			java.sql.Date pfhasta = this.stringToSqlDate(this.getCampoTextual(request, "fhasta"));

			if (!isEmpty(pcinout)) {
				PAC_IAX_TR234_OUT pacIaxTr234 = new PAC_IAX_TR234_OUT(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				HashMap m = pacIaxTr234.ejecutaPAC_IAX_TR234_OUT__F_GENERAR_FICHERO(pcinout, pfhasta, numfich);

				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, m);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					request.setAttribute("PTNOMFICH", m.get("PTNOMFICH"));
				}

				request.setAttribute("noabrirmodal", "true");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr155Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	private void logCall(String callQuery, String[] sIN, Object[] pIN) {
		StringBuffer sB = new StringBuffer();
		sB.append("callQuery:").append(callQuery).append(", parametros:");
		for (int i = 0; i < sIN.length; i++) {
			sB.append(sIN[i]).append("=").append(pIN[i]);
			if (i < sIN.length - 1)
				sB.append(", ");
		}
		logger.debug(sB.toString());
	}

	// --START-PAC_IAX_TR234_OUT__GENERAR_FICHERO (pcinout in number, ptnomfich out
	// varchar2, mensajes OUT t_iax_mensajes) return number
	private HashMap callPAC_IAX_TR234_OUT__GENERAR_FICHERO(Connection conn, java.math.BigDecimal pcinout)
			throws Exception {
		String callQuery = "{?=call PAC_IAX_TR234_OUT.GENERAR_FICHERO(?,?,?)}";
		logCall(callQuery, new String[] { "pcinout" }, new Object[] { pcinout });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pcinout);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.VARCHAR); // Valor de "pcinout"
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
			retVal.put("PTNOMFICH", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PTNOMFICH", null);
		}
		try {
			retVal.put("MENSAJES", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("MENSAJES", null);
		}
		cStmt.close();
		return retVal;
	}

}
