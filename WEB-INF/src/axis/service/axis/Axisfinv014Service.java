package axis.service.axis;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FONDOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisfinv014Service extends AxisBaseService {
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
		logger.debug("Axisfinv014Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			/*
			 * BigDecimal pPCEMPRES = usuario.getCempres(); BigDecimal pPCCODFON =
			 * getCampoNumerico(request,"CCODFON"); String pPTFONCMP =
			 * getCampoTextual(request, "TCODFON"); BigDecimal pPCMANAGER =
			 * getCampoNumerico(request, "list_CMANAGER"); BigDecimal pPCMONEDA =
			 * getCampoNumerico(request,"list_CMONEDA");
			 * 
			 * 
			 * PAC_IAX_FONDOS pax_iax_fondos = new
			 * PAC_IAX_FONDOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)
			 * ); Map fondos =
			 * pax_iax_fondos.ejecutarPAC_IAX_FONDOS__F_BUSCAR_FONDOS(pPCEMPRES, pPCCODFON,
			 * pPTFONCMP, pPCMONEDA, pPCMANAGER); List
			 * T_IAX_FONDOS=(List)tratarRETURNyMENSAJES(request, fondos);
			 * logger.debug(T_IAX_FONDOS);
			 * 
			 * request.setAttribute("T_IAX_FONDOS", !isEmpty(T_IAX_FONDOS)?T_IAX_FONDOS:new
			 * ArrayList());
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * @param request
	 */
	public void buscar(HttpServletRequest request) {
		logger.debug("Axisfinv014Service buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal pPCEMPRES = usuario.getCempres();
			BigDecimal pPCCODFON = getCampoNumerico(request, "pCCODFON");
			String pPTFONCMP = getCampoTextual(request, "pTCODFON");
			BigDecimal pPCMANAGER = getCampoNumerico(request, "pCMANAGER");
			BigDecimal pPCMONEDA = getCampoNumerico(request, "pCMONEDA");
			BigDecimal pPCDIVIDEND = getCampoNumerico(request, "pPCDIVIDEND");

			PAC_IAX_FONDOS pax_iax_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map fondos = pax_iax_fondos.ejecutaPAC_IAX_FONDOS__F_BUSCAR_FONDOS(pPCEMPRES, pPCCODFON, pPTFONCMP,
					pPCMONEDA, pPCMANAGER, pPCDIVIDEND);
			List T_IAX_FONDOS = (List) tratarRETURNyMENSAJES(request, fondos);

			logger.debug(T_IAX_FONDOS);

			request.setAttribute("T_IAX_FONDOS", T_IAX_FONDOS);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
