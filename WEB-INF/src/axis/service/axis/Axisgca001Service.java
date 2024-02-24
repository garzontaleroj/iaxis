//Revision:# nCKzT9DkWLUKGpKeyWpXmA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca001Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca001Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca001Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			AxisServiceDetValores service = new AxisServiceDetValores();
			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");
			// SGM IAXIS 4060 CONCILIACIONES DE CARTERA
			BigDecimal pPSIDCON = getCampoNumerico(request, "NNUMPROCESO");
			BigDecimal pPACON = getCampoNumerico(request, "ACON");
			BigDecimal pPMCON = getCampoNumerico(request, "MCON");
			String pPTDESC = getCampoTextual(request, "TDESC");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
			String pPNNUMIDEAGE = getCampoTextual(request, "NNUMIDEAGE");
			Date pPCFICHERO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "CFICHERO"), "dd/MM/yyyy");
			BigDecimal pPSPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal pPCESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pPNCODACTA = getCampoNumerico(request, "NCODACTA");
			String pPCUSUALT = getCampoTextual(request, "CUSUALT");
			Date pPFALTA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FALTA"), "dd/MM/yyyy");
			String pPCUSUMOD = getCampoTextual(request, "CUSUMOD");
			Date pPFMODIFI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FMODIFI"), "dd/MM/yyyy");

			service.addDetvalores(request, 54, "LS_MESES");
			service.addSucursales(request, "LS_SUCURSALES", new BigDecimal(2), usuario.getCidioma());
			service.addDetvalores(request, 4000, "LS_CESTADOS");
			if (action != null && action.equals("BUSCAR")) {

				/*
				 * Map map = pac_IAX_GESTION_CAR.
				 * ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACIONCAB( pPSIDCON, pPACON,
				 * pPMCON, pPTDESC, pPCSUCURSAL, pPNNUMIDEAGE, pPCFICHERO, pPSPROCES, pPCESTADO,
				 * pPNCODACTA, pPCUSUALT, pPFALTA, pPCUSUMOD, pPFMODIFI);
				 * this.tratarRETURNyMENSAJES(request, map);
				 */

				Map mapReturnGCA_CONCILIACIONCAB = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACIONCAB(pPSIDCON, pPACON, pPMCON, pPCSUCURSAL,
								pPNNUMIDEAGE);
				List<Map> listGCA_CONCILIACIONCAB = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACIONCAB);

				formdata.put("LISTGCA_CONCILIACIONCAB", listGCA_CONCILIACIONCAB);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings({ "rawtypes", "unchecked", "static-access" })
	public void generarActa(HttpServletRequest request) {
		logger.debug("Axisgca001Service generarActa");
		try {

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSIDCON = getCampoNumerico(request, "SIDCON");

			Map mapReturnGCA_CONCILIACION_ACTA = pac_IAX_GESTION_CAR
					.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_CONCILIACION_ACTA(null, pPSIDCON, null);
			List<Map> listGCA_CONCILIACION_ACTA = (List) tratarRETURNyMENSAJES(request, mapReturnGCA_CONCILIACION_ACTA);

			if (listGCA_CONCILIACION_ACTA == null || listGCA_CONCILIACION_ACTA.isEmpty()) {
				Map MAPPREG = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_GCA_PARAMPRE_CONC(null, null, null);
				List<Map> LISPREG = (List) tratarRETURNyMENSAJES(request, MAPPREG);

				for (Map m : LISPREG) {
					BigDecimal codigoParametro = new BigDecimal(m.get("NCODPARCON").toString());
					Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(null,
							pPSIDCON, codigoParametro,
							(BigDecimal) tratarRETURNyMENSAJES(request,
									pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_CANTIDAD_ACTA_CON(
											codigoParametro, pPSIDCON)),
							(BigDecimal) tratarRETURNyMENSAJES(request,
									pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_VALOR_ACTA_CON(
											codigoParametro, pPSIDCON)),
							null, null, null, null, null, null, null, null);
					tratarRETURNyMENSAJES(request, map);
				}
				AbstractDispatchAction.guardarMensaje(request, "89905693", new Object[] { "ID PROCESO: " + pPSIDCON },
						Constantes.MENSAJE_INFO);

			} else {
				for (Map m : listGCA_CONCILIACION_ACTA) {
					BigDecimal codigoParametro = new BigDecimal(m.get("CCONACTA").toString());
					BigDecimal CRESPAGE = null, CRESPCIA = null;
					String TOBS = null, CUSUALT = null;
					Date FSOLUCION = null, FALTA = null;
					if (m.get("CRESPAGE") != null)
						CRESPAGE = new BigDecimal(m.get("CRESPAGE").toString());
					if (m.get("FSOLUCION") != null)
						FSOLUCION = new Date(((Timestamp) m.get("FSOLUCION")).getTime());
					if (m.get("CRESPCIA") != null)
						CRESPCIA = new BigDecimal(m.get("CRESPCIA").toString());
					if (m.get("TOBS") != null)
						TOBS = m.get("TOBS").toString();
					if (m.get("CUSUALT") != null)
						CUSUALT = m.get("CUSUALT").toString();
					if (m.get("FALTA") != null)
						FALTA = new Date(((Timestamp) m.get("FALTA")).getTime());

					Map map = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_CONCILIACION_ACTA(
							new BigDecimal(m.get("NCONCIACT").toString()), pPSIDCON, codigoParametro,
							(BigDecimal) tratarRETURNyMENSAJES(request,
									pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_CANTIDAD_ACTA_CON(
											codigoParametro, pPSIDCON)),
							(BigDecimal) tratarRETURNyMENSAJES(request,
									pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_VALOR_ACTA_CON(
											codigoParametro, pPSIDCON)),
							CRESPAGE, CRESPCIA, FSOLUCION, TOBS, CUSUALT, FALTA, null, null);
					tratarRETURNyMENSAJES(request, map);
				}
				AbstractDispatchAction.guardarMensaje(request, "89905694", new Object[] { "ID PROCESO: " + pPSIDCON },
						Constantes.MENSAJE_INFO);

			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Error en el servicio Axisgca001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// SGM IAXIS 4060 CONCILIACIONES DE CARTERA
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
