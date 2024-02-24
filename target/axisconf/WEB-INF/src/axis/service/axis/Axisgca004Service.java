//Revision:# 83FUg0qbTNioVzaz54/+tg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca004Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca004Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca004Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			// AxisServiceDetValores service = new AxisServiceDetValores(); SGM
			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");

			Date pPPERCORTE = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "PERCORTE"), "dd/MM/yyyy");

			BigDecimal pPCPENDIENTES = getCampoNumerico(request, "CPENDIENTES");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
			BigDecimal pPNNUMIDEAGE = getCampoNumerico(request, "NNUMIDEAGE");
			BigDecimal pPNNUMIDECLI = getCampoNumerico(request, "NNUMIDECLI");// SGM IAXIS-7653
			Date pPFDOCINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDOCINI"), "dd/MM/yyyy");
			Date pPFDOCFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDOCFIN"), "dd/MM/yyyy");
			BigDecimal pPNDOCSAP = getCampoNumerico(request, "NDOCSAP");
			Date pPFCONTINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTINI"), "dd/MM/yyyy");
			Date pPFCONTFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTFIN"), "dd/MM/yyyy");
			// PARAMETROS PARA LA SUBTABLA
			BigDecimal IDDETALLE1 = getCampoNumerico(request, "IDDETALLE1");
			BigDecimal IDDETALLE2 = getCampoNumerico(request, "IDDETALLE2");

			// INI - IAXIS-7653 - SGM - 16/12/2019. SE CORRIGEN TODOS LOS FILTROS
			// HashMap map=null;
			// map = new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(null,
			// null, null, new BigDecimal(55), null, new BigDecimal(2));

			// logger.debug(map);
			// List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
			// request.getSession().setAttribute("LS_SUCURSALES", listaAgentes );
			// service.addSucursales(request, "LS_SUCURSALES", new BigDecimal(2),
			// usuario.getCidioma()); SGM

			Map map1 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(null, null, null, new BigDecimal(55),
							null, new BigDecimal(2));

			AjaxContainerService ajax = new AjaxContainerService();
			List getSucursalesReturn = (List) ajax.rellenarPlAContenedorAjax(map1);
			request.getSession().removeAttribute("LS_SUCURSALES");

			if (!isEmpty(getSucursalesReturn) && getSucursalesReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getSucursalesReturn);
				request.getSession().setAttribute("LS_SUCURSALES", getSucursalesReturn);
			}

			// FIN - IAXIS-7653 - SGM - 16/12/2019. SE CORRIGEN TODOS LOS FILTROS

			if (action != null && action.equals("BUSCAR")) {
				Map mapReturnDEPU_SALDOFAVCLI = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(
						pPPERCORTE, pPCPENDIENTES, pPCSUCURSAL, pPNNUMIDEAGE, pPNNUMIDECLI, pPFDOCINI, pPFDOCFIN,
						pPNDOCSAP, pPFCONTINI, pPFCONTFIN, new BigDecimal("1"), null, null);
				List<Map> listDEPU_SALDOFAVCLI = (List) tratarRETURNyMENSAJES(request, mapReturnDEPU_SALDOFAVCLI);

				formdata.put("LISTDEPU_SALDOFAVCLI", listDEPU_SALDOFAVCLI);

				if (IDDETALLE1 != null && IDDETALLE2 != null) {
					Map mapDetReturnDEPU_SALDOFAVCLI = pac_IAX_GESTION_CAR
							.ejecutaPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(null, null, null, null, null, null,
									null, null, null, null, new BigDecimal("2"), IDDETALLE1, IDDETALLE2);
					List<Map> listDETDEPU_SALDOFAVCLI = (List) tratarRETURNyMENSAJES(request,
							mapDetReturnDEPU_SALDOFAVCLI);

					formdata.put("DETLISTDEPU_SALDOFAVCLI", listDETDEPU_SALDOFAVCLI);
				}
			}
			// @BRSP En esta seccion se deja preparado para guardar
			if (action != null && action.equals("GUARDAR")) {
				BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
				for (int i = 0; i < CUENTA.intValue(); i++) {
					BigDecimal IDPARAM1_ = getCampoNumerico(request, "IDPARAM1_" + i);
					BigDecimal IDPARAM2_ = getCampoNumerico(request, "IDPARAM2_" + i);
					BigDecimal SELEC_ = getCampoNumerico(request, "SELEC_" + i);

					Map mapa = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_SET_GCA_SALFAVCLI(IDPARAM1_, null,
							null, null, null, null, null, null, null, null, null, null, null, null, null, SELEC_, null,
							null, null, null, null);
					tratarRETURNyMENSAJES(request, mapa);
				}

				Map mapReturnDEPU_SALDOFAVCLI = pac_IAX_GESTION_CAR.ejecutaPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(
						pPPERCORTE, pPCPENDIENTES, pPCSUCURSAL, pPNNUMIDEAGE, pPNNUMIDECLI, pPFDOCINI, pPFDOCFIN,
						pPNDOCSAP, pPFCONTINI, pPFCONTFIN, new BigDecimal("1"), null, null);
				List<Map> listDEPU_SALDOFAVCLI = (List) tratarRETURNyMENSAJES(request, mapReturnDEPU_SALDOFAVCLI);

				formdata.put("LISTDEPU_SALDOFAVCLI", listDEPU_SALDOFAVCLI);

				if (IDDETALLE1 != null && IDDETALLE2 != null) {
					Map mapDetReturnDEPU_SALDOFAVCLI = pac_IAX_GESTION_CAR
							.ejecutaPAC_IAX_GESTION_CAR__F_GET_DEPU_SALDOFAVCLI(null, null, null, null, null, null,
									null, null, null, null, new BigDecimal("2"), IDDETALLE1, IDDETALLE2);
					List<Map> listDETDEPU_SALDOFAVCLI = (List) tratarRETURNyMENSAJES(request,
							mapDetReturnDEPU_SALDOFAVCLI);

					formdata.put("DETLISTDEPU_SALDOFAVCLI", listDETDEPU_SALDOFAVCLI);
				}
			}

			formdata.put("PERCORTE", pPPERCORTE);
			formdata.put("CPENDIENTES", pPCPENDIENTES);
			formdata.put("CSUCURSAL", pPCSUCURSAL);
			formdata.put("NNUMIDEAGE", pPNNUMIDEAGE);
			formdata.put("NNUMIDECLI", pPNNUMIDECLI);
			formdata.put("FDOCINI", pPFDOCINI);
			formdata.put("FDOCFIN", pPFDOCFIN);
			formdata.put("NDOCSAP", pPNDOCSAP);
			formdata.put("FCONTINI", pPFCONTINI);
			formdata.put("FCONTFIN", pPFCONTFIN);
			formdata.put("IDDETALLE1", IDDETALLE1);
			formdata.put("IDDETALLE2", IDDETALLE2);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}