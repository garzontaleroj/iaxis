package axis.service.axis;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CBANCAR_SEG;
import axis.jdbc.PAC_IAX_COMMON;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisctr055Service.java 19/01/2009
 * 
 * @since Java 5.0
 */
public class Axisctr055Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr055Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			if (!isEmpty(SSEGURO)) {
				request.setAttribute("buscarOK", true);

				// Recuperar NPOLIZA y NCERTIF
				Map map = ejecutaF_BUSCAPOLIZA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN),
						SSEGURO);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					formdata.put("NPOLIZA", map.get("PNPOLIZA"));
					formdata.put("NCERTIF", map.get("PNCERTIF"));
				} else {
					formdata.put("NPOLIZA", null);
					formdata.put("NCERTIF", null);
				}

				// Recuperar HIST�RICO
				PAC_IAX_CBANCAR_SEG pacIaxCbancarSeg = new PAC_IAX_CBANCAR_SEG(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxCbancarSeg.ejecutaPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEGHIS(SSEGURO);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)))
					request.setAttribute("LSTHISTORICO", map.get("PRESULT"));

				// Recuperar CBANCAR/CBANCOB
				java.sql.Date FECHA = new java.sql.Date(new java.util.Date().getTime());
				map = pacIaxCbancarSeg.ejecutaPAC_IAX_CBANCAR_SEG__F_GET_CBANCAR_SEG(SSEGURO, FECHA);
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					formdata.put("CBANCAR", map.get("PCBANCAR"));
					String CBANCOB = (String) map.get("PCBANCOB");

					if (!isEmpty(CBANCOB)) {
						BigDecimal CTIPBAN = BigDecimal.valueOf(4);
						formdata.put("CBANCOB", tratarRETURNyMENSAJES(request,
								new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCOB)));
					} else {
						formdata.put("CBANCOB", null);
					}
				} else {
					formdata.put("CBANCAR", null);
					formdata.put("CBANCOB", null);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr055Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***************************************************
	 * M�TODOS UTILITARIOS
	 *********************************************/

	/*********************************************************************************************************************/
	private

	// --START-F_BUSCAPOLIZA(PSSEGURO)
	HashMap callF_BUSCAPOLIZA(Connection conn, java.math.BigDecimal pPSSEGURO) throws Exception {
		String callQuery = "{?=call F_BUSCAPOLIZA(?, ?, ?)}";

		logCall(callQuery, new String[] { "pPSSEGURO" }, new Object[] { pPSSEGURO });
		CallableStatement cStmt = conn.prepareCall(callQuery);
		String USERNAME = conn.getMetaData().getUserName().toUpperCase();
		cStmt.setObject(2, pPSSEGURO);
		cStmt.registerOutParameter(1, java.sql.Types.NUMERIC); // Valor de "RETURN"
		cStmt.registerOutParameter(3, java.sql.Types.NUMERIC); // Valor de "PNPOLIZA"
		cStmt.registerOutParameter(4, java.sql.Types.NUMERIC); // Valor de "PNCERTIF"
		cStmt.execute();
		HashMap retVal = new HashMap();
		try {
			retVal.put("RETURN", cStmt.getObject(1));
		} catch (SQLException e) {
			retVal.put("RETURN", null);
		}
		try {
			retVal.put("PNPOLIZA", cStmt.getObject(3));
		} catch (SQLException e) {
			retVal.put("PNPOLIZA", null);
		}
		try {
			retVal.put("PNCERTIF", cStmt.getObject(4));
		} catch (SQLException e) {
			retVal.put("PNCERTIF", null);
		}
		retVal = new ConversionUtil().convertOracleObjects(retVal);// ecg20110914 AXIS-WLS1SERVER . mover
																	// convertOracleObjects antes del close
		cStmt.close();
		return retVal;
	}

	public HashMap ejecutaF_BUSCAPOLIZA(Connection conn, java.math.BigDecimal pPSSEGURO) throws Exception {
		return this.callF_BUSCAPOLIZA(conn, pPSSEGURO);
	}
	// --END-F_BUSCAPOLIZA

	protected void logCall(String callQuery, String[] sIN, Object[] pIN) {
		StringBuffer sB = new StringBuffer();
		sB.append("callQuery:").append(callQuery).append(", parametros:");
		for (int i = 0; i < sIN.length; i++) {
			sB.append(sIN[i]).append("=").append(pIN[i]);
			if (i < sIN.length - 1)
				sB.append(", ");
		}
		logger.debug(sB.toString());
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisctr055Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			String CBANCOB = getCampoTextual(request, "CBANCOB");

			if (!isEmpty(CBANCOB)) {
				CBANCOB = CBANCOB.replaceAll("-", "");
				PAC_IAX_CBANCAR_SEG pacIaxCbancarSeg = new PAC_IAX_CBANCAR_SEG(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pacIaxCbancarSeg.ejecutaPAC_IAX_CBANCAR_SEG__F_SET_CBANCAR_SEG(SSEGURO, CBANCOB);
				logger.debug(map);

				tratarRETURNyMENSAJES(request, map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr055Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
