//Revision:# ypqDsrTnpTpDKi8ahuYUKA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea011aAction;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea011aService.java 29/06/2009
 * 
 * @since Java 5.0
 */
public class Axisrea011aService extends AxisBaseService {
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
		logger.debug("Axisrea011aService m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal pPPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapa = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("X", pPPOLIZA, pPSSEGURO, null, null,
					pPNSINIES, null);
			logger.debug(mapa);
			ArrayList<Map> lista = (ArrayList) tratarRETURNyMENSAJES(request, mapa);
			int count = 0;
			if (lista != null)
				for (Map lm : lista) {
					BigDecimal proceso = new BigDecimal(lm.get("SPROCES").toString());
					BigDecimal cgenera = new BigDecimal(lm.get("CGENERA").toString());
					BigDecimal pscontra = new BigDecimal(lm.get("SCONTRA").toString());
					Map mp = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_REASEGURO_X_GARANTIA("B", pPPOLIZA, pPSSEGURO, proceso,
							cgenera, pPNSINIES, pscontra);
					ArrayList<Map> lp = (ArrayList) tratarRETURNyMENSAJES(request, mp);
					count = lp.size();
					lm.put("PROCESOS", lp);
					lm.put("ITEMSTO", count);
				}

			formdata.put("NPOLIZA", pPPOLIZA);
			formdata.put("SSEGURO", pPSSEGURO);
			formdata.put("SPROCES", pPSPROCES);
			request.setAttribute("T_IAX_CESIONESREA", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea011aService - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_descargar_reporte(HttpServletRequest request, Axisrea011aAction thisAction) {
		logger.debug("Axisrea011aService m_descargar_reporte");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String CMAP = "ConfianzaReaseguro";
		BigDecimal pPPOLIZA = getCampoNumerico(request, "NPOLIZA");
		BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal pPSPROCES = getCampoNumerico(request, "SPROCES");

		String CEXPORT = "PDF";
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = usuario.getCidioma();
		String CEMAIL = null;

		PARAMETROS__.put("PSSEGURO", "" + pPSSEGURO);
		PARAMETROS__.put("PSPROCESO", "" + pPSPROCES);
		PARAMETROS__.put("PCIDIOMA", "" + usuario.getCidioma());

		TPARAMETROS__.put("TPSSEGURO", "1");
		TPARAMETROS__.put("TPSPROCESO", "1");
		TPARAMETROS__.put("TPCIDIOMA", "1");

		// BigDecimal pPCTIPO = getCampoNumerico(request, "CEXCEPCION1");
		try {

			TIaxInfo params = this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__);
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, usuario.getCempres(), CEXPORT, params, CIDIOMA,
							batch, CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			request.setAttribute(Constantes.AJAXCONTAINER, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea011aService - m�todo m_generar_list", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[3];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.info("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	public void m_tunnel_doc(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Axisrea037Service m_tunnel_doc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String fileAbsolutePath = this.getCampoTextual(request, "fileAbsolutePath");
			this.tunnelFichero(request, response, fileAbsolutePath);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_tunnel_doc", e);
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
