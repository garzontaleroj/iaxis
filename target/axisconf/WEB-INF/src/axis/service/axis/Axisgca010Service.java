//Revision:# VwxySVQwKWA8pceQ5jgNoQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisgca010Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca010Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca010Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca010Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca010Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			AxisServiceDetValores service = new AxisServiceDetValores();

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSIDCON = getCampoNumerico(request, "SIDCON");

			String action = getCampoTextual(request, "action");
			BigDecimal pPNCONCIACT = getCampoNumerico(request, "NCONCIACT");
			BigDecimal pPCCONACTA = getCampoNumerico(request, "CCONACTA");
			BigDecimal pPNCANTIDAD = getCampoNumerico(request, "NCANTIDAD");
			BigDecimal pPNVALOR = getCampoNumerico(request, "NVALOR");
			BigDecimal pPCRESPAGE = getCampoNumerico(request, "CRESPAGE");
			BigDecimal pPCRESPCIA = getCampoNumerico(request, "CRESPCIA");
			Date pPFSOLUCION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FSOLUCION"),
					"dd/MM/yyyy");
			String pPTOBS = getCampoTextual(request, "TOBS");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUMOD = getCampoTextual(request, "CUSUMOD");
			Date pPFMODIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FMODIFI"), "dd/MM/yyyy");

			Map mapReturnGCA_PARAMPRE_CONC = pac_IAX_GESTION_CAR
					.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null, new BigDecimal(1), new BigDecimal(8));
			List<Map> LISTA_SEC_1 = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_PARAMPRE_CONC);

			mapReturnGCA_PARAMPRE_CONC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null,
					new BigDecimal(2), new BigDecimal(8));
			List<Map> LISTA_SEC_2 = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_PARAMPRE_CONC);

			mapReturnGCA_PARAMPRE_CONC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null,
					new BigDecimal(3), new BigDecimal(8));
			List<Map> LISTA_SEC_3 = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_PARAMPRE_CONC);

			mapReturnGCA_PARAMPRE_CONC = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null,
					new BigDecimal(4), new BigDecimal(8));
			List<Map> LISTA_SEC_4 = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_PARAMPRE_CONC);

			if (action != null && action.equals("FORM")) {
				Map mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(null, pPSIDCON, null);
				List<Map> listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request,
						mapReturnGCA_CONCILIACION_ACTA);

				if (listGCA_CONCILIACION_ACTA == null || listGCA_CONCILIACION_ACTA.isEmpty()) {
					Map MAPPREG = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null, null,
							null);
					List<Map> LISPREG = (List) tratarRETURNyMENSAJES(request, MAPPREG);

					for (Map m : LISPREG) {
						Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(null,
								pPSIDCON, new BigDecimal(m.get("NCODPARCON").toString()), pPNCANTIDAD, pPNVALOR,
								pPCRESPAGE, pPCRESPCIA, pPFSOLUCION, pPTOBS, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
					}

				}

				mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(null, pPSIDCON, null);
				listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACION_ACTA);
				formdata.put("LISTGCA_CONCILIACION_ACTA", listGCA_CONCILIACION_ACTA);

				Map mapReturnGCA_CONCILIACIONCAB = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONCAB(pPSIDCON, null, null, null, null);
				List<Map> listGCA_CONCILIACIONCAB = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACIONCAB);

				Map ITMGCA_CONCILIACIONCAB = null;
				for (Map m : listGCA_CONCILIACIONCAB) {
					ITMGCA_CONCILIACIONCAB = m;
				}

				formdata.put("ITMGCA_CONCILIACIONCAB", ITMGCA_CONCILIACIONCAB);
			}

			if (action != null && action.equals("GUARDAR")) {
				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(pPNCONCIACT,
						pPSIDCON, pPCCONACTA, pPNCANTIDAD, pPNVALOR, pPCRESPAGE, pPCRESPCIA, pPFSOLUCION, pPTOBS,
						pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
				this.tratarRETURNyMENSAJES(request, map);
			}

			if (action != null && action.equals("FINALIZAR")) {
				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(pPNCONCIACT,
						pPSIDCON, pPCCONACTA, pPNCANTIDAD, pPNVALOR, pPCRESPAGE, pPCRESPCIA, pPFSOLUCION,
						"#FINALIZAR_ACTA#$", pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
				this.tratarRETURNyMENSAJES(request, map);
			}

			if (action != null && action.equals("GUARDAREVIADOS")) {

				Map mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(pPNCONCIACT, null, null);
				List<Map> listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request,
						mapReturnGCA_CONCILIACION_ACTA);

				Map ITMGCA_CONCILIACION_ACTA = null;
				for (Map m : listGCA_CONCILIACION_ACTA) {
					ITMGCA_CONCILIACION_ACTA = m;
				}

				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(pPNCONCIACT,
						pPSIDCON, pPCCONACTA,
						ITMGCA_CONCILIACION_ACTA.get("NCANTIDAD") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("NCANTIDAD").toString())
								: null,
						ITMGCA_CONCILIACION_ACTA.get("NVALOR") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("NVALOR").toString())
								: null,
						pPCRESPAGE, pPCRESPCIA, pPFSOLUCION, pPTOBS, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
				this.tratarRETURNyMENSAJES(request, map);

			}

			if (action != null && (action.equals("GUARDARCANTIDADN") || action.equals("GUARDARVALOR"))) {

				Map mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(pPNCONCIACT, null, null);
				List<Map> listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request,
						mapReturnGCA_CONCILIACION_ACTA);

				Map ITMGCA_CONCILIACION_ACTA = null;
				for (Map m : listGCA_CONCILIACION_ACTA) {
					ITMGCA_CONCILIACION_ACTA = m;
				}

				Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(pPNCONCIACT,
						ITMGCA_CONCILIACION_ACTA.get("SIDCON") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("SIDCON").toString())
								: null,
						ITMGCA_CONCILIACION_ACTA.get("CCONACTA") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("CCONACTA").toString())
								: null,
						pPNCANTIDAD, pPNVALOR,
						ITMGCA_CONCILIACION_ACTA.get("CRESPAGE") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("CRESPAGE").toString())
								: null,
						ITMGCA_CONCILIACION_ACTA.get("CRESPCIA") != null
								? new BigDecimal(ITMGCA_CONCILIACION_ACTA.get("CRESPCIA").toString())
								: null,
						ITMGCA_CONCILIACION_ACTA.get("FSOLUCION") != null
								? AxisBaseService.stringToSqlDate(ITMGCA_CONCILIACION_ACTA.get("FSOLUCION").toString(),
										"yyyy-MM-dd")
								: null,
						ITMGCA_CONCILIACION_ACTA.get("TOBS") != null ? ITMGCA_CONCILIACION_ACTA.get("TOBS").toString()
								: null,
						ITMGCA_CONCILIACION_ACTA.get("CUSUALT") != null
								? ITMGCA_CONCILIACION_ACTA.get("CUSUALT").toString()
								: null,
						ITMGCA_CONCILIACION_ACTA.get("FALTA") != null
								? AxisBaseService.stringToSqlDate(ITMGCA_CONCILIACION_ACTA.get("FALTA").toString(),
										"dd/MM/yyyy")
								: null,
						ITMGCA_CONCILIACION_ACTA.get("CUSUMOD") != null
								? ITMGCA_CONCILIACION_ACTA.get("CUSUMOD").toString()
								: null,
						ITMGCA_CONCILIACION_ACTA.get("FMODIFI") != null
								? AxisBaseService.stringToSqlDate(ITMGCA_CONCILIACION_ACTA.get("FMODIFI").toString(),
										"dd/MM/yyyy")
								: null);
				this.tratarRETURNyMENSAJES(request, map);

			}

			formdata.put("LISTA_SEC_1", LISTA_SEC_1);
			formdata.put("LISTA_SEC_2", LISTA_SEC_2);
			formdata.put("LISTA_SEC_3", LISTA_SEC_3);
			formdata.put("LISTA_SEC_4", LISTA_SEC_4);
			service.addDetvalores(request, 54, "LS_MESES");
			service.addDetvalores(request, 4000, "LS_ESTADOS");
			service.addSucursales(request, "LS_SUCURSALES", new BigDecimal(2), usuario.getCidioma());
			formdata.put("SIDCON", pPSIDCON);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca010Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("unchecked")
	public void m_descargar_reporte(HttpServletRequest request, Axisgca010Action thisAction) {
		logger.debug("Axisgca010Service m_descargar_reporte");
		Map<String, Object> map = new HashMap();
		Map<String, Object> mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String CMAP = "ActaConciliacion";
		BigDecimal pPSCONTGAR = getCampoNumerico(request, "SIDCON");
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
			logger.error("Error en el servicio Axisgca010Service - m�todo m_generar_list", e);
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