package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.mvc.control.modal.Axiscaj010Action;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscaj010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axiscaj010Action thisAction) {
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axiscaj010Action thisAction) {
		logger.debug("Axiscaj010Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", pSPERSON);
			logger.debug("++++SPERSON: " + pSPERSON);
			String pTNOMBRE = this.getCampoTextual(request, "TNOMBRE");
			formdata.put("TNOMBRE", pTNOMBRE);
			logger.debug("++++pTNOMBRE: " + pTNOMBRE);
			String pNNUMIDE = this.getCampoTextual(request, "NNUMIDE");
			formdata.put("NNUMIDE", pNNUMIDE);
			logger.debug("++++pNNUMIDE: " + pNNUMIDE);
			BigDecimal IPAGSIN = (this.getHiddenCampoNumerico(request, "IPAGSIN") == null) ? new BigDecimal(0)
					: this.getHiddenCampoNumerico(request, "IPAGSIN");
			formdata.put("IPAGSIN", IPAGSIN);
			logger.debug("++++IPAGSIN: " + IPAGSIN);
			BigDecimal IMOVIMI = this.getCampoNumerico(request, "IMOVIMI");
			formdata.put("IMOVIMI", IMOVIMI);
			logger.debug("++++IMOVIMI: " + IMOVIMI);
			BigDecimal IAUTOLIQP = (this.getHiddenCampoNumerico(request, "IAUTOLIQP") == null) ? new BigDecimal(0)
					: this.getHiddenCampoNumerico(request, "IAUTOLIQP");
			formdata.put("IAUTOLIQP", IAUTOLIQP);
			logger.debug("++++IAUTOLIQP: " + IAUTOLIQP);
			BigDecimal IAUTOLIQI = (this.getHiddenCampoNumerico(request, "IAUTOLIQI") == null) ? new BigDecimal(0)
					: this.getHiddenCampoNumerico(request, "IAUTOLIQI");
			formdata.put("IAUTOLIQI", IAUTOLIQI);
			logger.debug("++++IAUTOLIQI: " + IAUTOLIQI);
			BigDecimal DIFERENCIAL = this.getCampoNumerico(request, "DIFERENCIAL");
			formdata.put("DIFERENCIAL", DIFERENCIAL);
			logger.debug("++++DIFERENCIAL: " + DIFERENCIAL);
			BigDecimal pIMPCAJA = IMOVIMI;
			formdata.put("IMPCAJA", pIMPCAJA);
			logger.debug("++++IMPCAJA: " + pIMPCAJA);
			String pCMONOPE = this.getCampoTextual(request, "CMONOPE");
			formdata.put("CMONOPE", pCMONOPE);
			logger.debug("++++pCMONOPE: " + pCMONOPE);
			BigDecimal pCAGENTE = this.getCampoNumerico(request, "CAGENTE");
			formdata.put("CAGENTE", pCAGENTE);
			logger.debug("++++CAGENTE: " + pCAGENTE);
			BigDecimal pCAGENTE_BUSCAR = this.getCampoNumerico(request, "CAGENTE_BUSCAR");
			formdata.put("CAGENTE_BUSCAR", pCAGENTE_BUSCAR);
			logger.debug("++++CAGENTE_BUSCAR: " + pCAGENTE_BUSCAR);
			BigDecimal CLIQUIDO = this.getCampoNumerico(request, "CLIQUIDO");
			formdata.put("CLIQUIDO", CLIQUIDO);
			logger.debug("++++CLIQUIDO: " + CLIQUIDO);
			BigDecimal PCLIQUIDO = this.getCampoNumerico(request, "PCLIQUIDO");
			formdata.put("PCLIQUIDO", PCLIQUIDO);
			logger.debug("++++PCLIQUIDO: " + PCLIQUIDO);

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_LEE_PAGOS_MAS_PDTES(pCAGENTE, pCMONOPE);
			logger.debug("++++map: " + map);
			List LSTFICHEROS = (List) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("++++pendientes: " + LSTFICHEROS);

			formdata.put("LSTFICHEROS", LSTFICHEROS);

			String FICHEROS = this.getCampoTextual(request, "FICHEROS");
			formdata.put("FICHEROS", FICHEROS);
			logger.debug("++++FICHEROS: " + FICHEROS);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj010Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void guardar(HttpServletRequest request, Axiscaj010Action thisAction) {
		logger.debug("Axiscaj010Service guardar");
		// this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", pSPERSON);
			logger.debug("++++SPERSON: " + pSPERSON);

			String pFICHEROS = this.getHiddenCampoTextual(request, "FICHEROS");
			formdata.put("FICHEROS", pFICHEROS);
			logger.debug("++++FICHEROS: " + pFICHEROS);

			List listaAutoLiq = new ArrayList();
			Map map = new HashMap();

			for (Enumeration en = request.getParameterNames(); en.hasMoreElements();) {
				String key = (String) en.nextElement();
				if (key.startsWith("AUTOLIQUIDACION") && !key.endsWith("MODIFVISIBLE")) {
					map = new HashMap();
					String[] secc = key.split("-");
					map.put("SPROCES", new BigDecimal(secc[1]));
					map.put("CMONEOP", new BigDecimal(secc[2]));
					map.put("CAGENTE", new BigDecimal(secc[3]));
					map.put("SPRODUC", new BigDecimal(secc[4]));
					map.put("IAUTLIQ", new BigDecimal(request.getParameter(key)));
					listaAutoLiq.add(map);
				}
			}

			request.getSession().setAttribute("LSTAUTLIQ", listaAutoLiq);
			logger.debug("++++LSTAUTLIQ: " + listaAutoLiq);

			request.getSession().setAttribute("CADENA", pFICHEROS);
			logger.debug("CADENA" + listaAutoLiq);

			formdata.put("guardat", "0");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj010Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
