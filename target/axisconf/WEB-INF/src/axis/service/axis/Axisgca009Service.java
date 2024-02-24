//Revision:# yjPlIn65PrFtC+fVwQ2rrQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisgca009Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca009Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca009Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca009Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca009Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			AxisServiceDetValores service = new AxisServiceDetValores();
			String action = getCampoTextual(request, "action");

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSIDCON = getCampoNumerico(request, "SIDCON");
			BigDecimal pCESTADOI = getCampoNumerico(request, "CESTADOI");
			BigDecimal pCESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pCCRUCE = getCampoNumerico(request, "CCRUCE");
			BigDecimal pCCRUCEDET = getCampoNumerico(request, "CCRUCEDET");

			service.addDetvalores(request, 668, "LS_ESTADOS");
			service.addDetvalores(request, 54, "LS_MESES");

			service.addDetvalores(request, 4001, "LS_CESTADOI");
			service.addDetvalores(request, 4001, "LS_CESTADO");
			service.addDetvalores(request, 4002, "LS_CCRUCE");

			service.addDetvalores(request, 4003, "LS_CCRUCEDET_6");
			service.addDetvalores(request, 4004, "LS_CCRUCEDET_7");
			service.addDetvalores(request, 4005, "LS_CCRUCEDET_NO6NO7");

			if (action != null && action.equals("FORM")) {

			}

			if (action != null && action.equals("BUSCAR")) {

				Map mapReturnGCA_CONCILIACIONCAB = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONDET(pPSIDCON, null, null, null, null, null,
								null, null, null, null, null, null, null, null, null, null, null, null, null, null,
								null, null, pCCRUCE, pCCRUCEDET, pCESTADOI, pCESTADO, null, null, null, null, null);
				List<Map> listGCA_CONCILIACIONDETS = (List) tratarRETURNyMENSAJES(request,
						mapReturnGCA_CONCILIACIONCAB);

				formdata.put("GCA_CONCILIACIONDETS", listGCA_CONCILIACIONDETS);
			}

			formdata.put("SIDCON", pPSIDCON);
			formdata.put("CESTADOI", pCESTADOI);
			formdata.put("CESTADO", pCESTADO);
			formdata.put("CCRUCE", pCCRUCE);
			formdata.put("CCRUCEDET", pCCRUCEDET);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca009Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("unchecked")
	public void m_descargar_reporte(HttpServletRequest request, Axisgca009Action thisAction) {
		logger.debug("Axisgca009Service m_descargar_reporte");
		Map<String, Object> map = new HashMap();
		Map<String, Object> mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String CMAP = "ConciliacionDetalle";
		BigDecimal pPSCONTGAR = getCampoNumerico(request, "SIDCON");
		BigDecimal pCESTADO = getCampoNumerico(request, "CESTADO");
		BigDecimal pCESTADOI = getCampoNumerico(request, "CESTADOI");
		BigDecimal pCCRUCE = getCampoNumerico(request, "CCRUCE");
		BigDecimal pCCRUCEDET = getCampoNumerico(request, "CCRUCEDET");

		String CEXPORT = "XLSX";

		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = usuario.getCidioma();
		String CEMAIL = null;

		if (pPSCONTGAR != null) {
			PARAMETROS__.put("PSIDCON", "" + pPSCONTGAR);
			TPARAMETROS__.put("TPSIDCON", "1");
		}

		if (pCESTADO != null) {
			PARAMETROS__.put("PCESTADO", "" + pCESTADO);
			TPARAMETROS__.put("TPCESTADO", "1");
		}
		if (pCESTADOI != null) {
			PARAMETROS__.put("PCESTADOI", "" + pCESTADOI);
			TPARAMETROS__.put("TPCESTADOI", "1");
		}
		if (pCCRUCE != null) {
			PARAMETROS__.put("PCCRUCE", "" + pCCRUCE);
			TPARAMETROS__.put("TPCCRUCE", "1");
		}
		if (pCCRUCEDET != null) {
			PARAMETROS__.put("PCCRUCEDET", "" + pCCRUCEDET);
			TPARAMETROS__.put("TPCCRUCEDET", "1");
		}

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
			logger.error("Error en el servicio Axisgca009Service - m�todo m_generar_list", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario,
			HashMap<String, String> PARAMETROS__, HashMap<String, String> TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
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
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

}