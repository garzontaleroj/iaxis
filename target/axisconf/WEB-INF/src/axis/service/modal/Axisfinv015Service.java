package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FONDOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PENSIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfinv015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv015Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formData = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_listavalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map empresas = pac_listavalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			Map claseFondos = pac_listavalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(899));
			Map tipoFondos = pac_listavalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(898));
			Map monedas = pac_listavalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
			logger.debug("Monedas" + monedas);
			PAC_IAX_PENSIONES pacIaxPen = new PAC_IAX_PENSIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map managers = pacIaxPen.ejecutaPAC_IAX_PENSIONES__F_GET_CODGESTORAS(null, null, null, null);
			logger.debug("managers:" + managers);
			request.setAttribute("monedas", (List) monedas.get("RETURN"));
			request.setAttribute("managers", (List) managers.get("CODGESTORAS"));

			BigDecimal cempres = usuario.getCempres();
			BigDecimal codfon = getCampoNumerico(request, "CCODFON");
			if (codfon != null) {
				PAC_IAX_FONDOS pac_fondo = new PAC_IAX_FONDOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map fondo = pac_fondo.ejecutaPAC_IAX_FONDOS__F_GET_FONDO(cempres, codfon);

				request.setAttribute("fondo", fondo);
			}
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000942));
			request.setAttribute("LST_MODABO", tratarRETURNyMENSAJES(request, map));

			logger.debug("empresas:" + empresas);
			logger.debug("claseFondos:" + claseFondos);
			logger.debug("tipoFondos:" + tipoFondos);
			request.setAttribute("empresas", (List) empresas.get("RETURN"));
			request.setAttribute("claseFondos", (List) claseFondos.get("RETURN"));
			request.setAttribute("tipoFondos", (List) tipoFondos.get("RETURN"));
			request.setAttribute("PCEMPRES", usuario.getCempres());

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv015Service - m�todo m_cargar_fondos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardarFondo(HttpServletRequest request) {
		logger.debug("Axisfinv015Service guardarFondo");
		Map formData = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPCEMPRES = getCampoNumerico(request, "pCEMPRES");
			BigDecimal pPCODFON = BigDecimal.ZERO;
			if (!isEmpty(getCampoNumerico(request, "pCCODFON"))) {
				pPCODFON = getCampoNumerico(request, "pCCODFON");
			}
			String pPTFONABV = getCampoTextual(request, "pPTFONABV");
			String pPTFONCMP = getCampoTextual(request, "pTCODFON");
			BigDecimal pPCMONEDA = getCampoNumerico(request, "pCMONEDA");
			BigDecimal pPCMANAGER = getCampoNumerico(request, "pCMANAGER");
			BigDecimal pPNMAXUNI = getCampoNumerico(request, "pMAXCONT");
			BigDecimal pPIGASTTRAN = getCampoNumerico(request, "pEXPTRANS");
			BigDecimal pPCCLSFON = getCampoNumerico(request, "pCCLSFONS");
			BigDecimal pPCTIPFON = getCampoNumerico(request, "pCTIPFON");
			BigDecimal pPCMODABO = getCampoNumerico(request, "selcmodabo");
			BigDecimal pPNDAYAFT = getCampoNumerico(request, "NDAYAFT");
			BigDecimal pNPERIODBON = getCampoNumerico(request, "pNPERIODBON");
			BigDecimal pPCCODFON = getCampoNumerico(request, "pPCCODFON");
			BigDecimal pPNPERIODBON = getCampoNumerico(request, "pPNPERIODBON");
			BigDecimal pPCDIVIDEND = getCampoNumerico(request, "pPCDIVIDEND");

			Date pPFINICIO = null;

			Map retorno = pac_fondos.ejecutaPAC_IAX_FONDOS__F_SET_FONDO(pPCEMPRES, pPCCODFON, pPTFONABV, pPTFONCMP,
					pPCMONEDA, pPCMANAGER, pPNMAXUNI, pPIGASTTRAN, pPFINICIO, pPCCLSFON, pPCTIPFON, pPCMODABO,
					pPNDAYAFT, pPNPERIODBON, pPCDIVIDEND);
			tratarRETURNyMENSAJES(request, retorno);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv015Service - m�todo m_cargar_fondos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}
}
