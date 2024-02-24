//Revision:# dizPaymmeQ0CriKXG4sPZA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_CAR;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgca002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisgca002Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca002Service - mï¿½todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisgca002Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			AxisServiceDetValores service = new AxisServiceDetValores();

			PAC_IAX_GESTION_CAR pac_IAX_GESTION_CAR = new PAC_IAX_GESTION_CAR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String action = getCampoTextual(request, "action");
			// INI - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
			String pPNNUMIDE = getCampoTextual(request, "NNUMIDE");
			// FIN - ML - 27/05/2019 - EL NIT DE UN CONSORCIO PODRIA CONTENER CARACTERES
			BigDecimal pPCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal pPSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal pPNPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String pPNCERTIF = getCampoTextual(request, "NCERTIF");
			BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");
			Date pPFINICIO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINICIO"), "dd/MM/yyyy");
			Date pPFFINAL = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FFINAL"), "dd/MM/yyyy");
			BigDecimal pPCRECOPEN = getCampoNumerico(request, "CRECOPEN_SEL");
			BigDecimal pPTIPO = getCampoNumerico(request, "TIPO");
			BigDecimal pPRECURSO = getCampoNumerico(request, "RECURSO");
			BigDecimal pPOPCION = getCampoNumerico(request, "OPCION");

			if (action != null && action.equals("BUSCAR")) {
				Map mapReturnGESTION_CARTERA_RECOBRO = pac_IAX_GESTION_CAR
						.ejecutaPAC_IAX_GESTION_CAR__F_GET_GESTION_CARTERA_RECOBRO(pPNNUMIDE, pPCRAMO, pPSPRODUC,
								pPNPOLIZA, pPNCERTIF, pPNSINIES, pPFINICIO, pPFFINAL, pPCRECOPEN, pPTIPO, pPRECURSO,
								pPOPCION);
				List<Map> GCA_CONCILIACIONCABS = (List) tratarRETURNyMENSAJES(request,
						mapReturnGESTION_CARTERA_RECOBRO);
				formdata.put("GCA_CONCILIACIONCABS", GCA_CONCILIACIONCABS);
			}
			service.addRamos(request, "LS_RAMOS");
			// INI - AXIS 3999 - ML - SE AGREGA LISTA LS_RAMOS AL FORMDATA
			formdata.put("LS_RAMOS", request.getAttribute("LS_RAMOS"));
			// FIN - AXIS 3999 - ML - SE AGREGA LISTA LS_RAMOS AL FORMDATA

			// INI - AXIS 3999 - ML - SE AGREGA LS_PRODUCTOS A AJAX CONTAINER
			if (pPCRAMO != null) {
				request.removeAttribute("LS_PRODUCTOS");
				service.addProductos(request, "LS_PRODUCTOS", pPCRAMO);
				if (action != null && action.equals("BUSCAR")) {
					formdata.put("LS_PRODUCTOS", request.getAttribute("LS_PRODUCTOS"));
				} else {
					AjaxContainerService ajax = new AjaxContainerService();
					try {
						ajax.guardarContenidoFinalAContenedorAjax(request.getAttribute("LS_PRODUCTOS"));
					} catch (Exception e) {
						logger.error("Error en el servicio axisgca002Service - método f_form", e);
						ajax.rellenarExcepcionAContenedorAjax(e);
					} finally {
						request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
					}
				}
			}
			// FIN - AXIS 3999 - ML - SE AGREGA LS_PRODUCTOS A AJAX CONTAINER

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgca002Service - mï¿½todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}