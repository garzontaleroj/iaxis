package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisrea001Service.java 20/08/2008
 * 
 * @author <a href="jtorres@csi-ti.com">Jorge Torres</a>
 * @since Java 5.0
 */
public class Axisrea001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea001Service m_form");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		request.getSession().removeAttribute("T_IAX_CODICONTRATO_REA");
		try {
			this.m_obtener_combos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisrea001Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		request.getSession().removeAttribute("T_IAX_CODICONTRATO_REA");

		try {
			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Busqueda de contratos de reaseguro */
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");
			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");
			BigDecimal CDEVENTO = getCampoNumerico(request, "CDEVENTO");
			// formdata.put("CDEVENTO",CDEVENTO);
			Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_CONTRATOS_REA_PROD(SCONTRA, CEMPRES, SPRODUC, CACTIVI,
					CGARANT, CTIPREA, SCONAGR, CCOMPANI, CDEVENTO);
			logger.debug(map);
			ArrayList T_IAX_CODICONTRATO_REA = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			logger.debug(ConversionUtil.printAsXML(T_IAX_CODICONTRATO_REA, "T_IAX_CODICONTRATO_REA"));

			request.setAttribute("T_IAX_CODICONTRATO_REA", T_IAX_CODICONTRATO_REA); /** LCF **/
			this.m_obtener_combos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea001Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List listaEmpresas = (List) tratarRETURNyMENSAJES(request, mapa, false);
			formdata.put("listaEmpresas", listaEmpresas);
			listaEmpresas = null;

			Map mapa1 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			List listaProductos = (List) tratarRETURNyMENSAJES(request, mapa1, false);
			formdata.put("listaProductos", listaProductos);
			listaProductos = null;

			Map mapa2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
			List listaCompReaseg = (List) tratarRETURNyMENSAJES(request, mapa2, false);
			formdata.put("listaCompReaseg", listaCompReaseg);
			listaCompReaseg = null;

			Map mapa3 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA();
			List listaTipReaseg = (List) tratarRETURNyMENSAJES(request, mapa3, false);
			formdata.put("listaTipReaseg", listaTipReaseg);
			listaTipReaseg = null;

			Map mapa4 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGR_REA();
			List listaAgrReaseg = (List) tratarRETURNyMENSAJES(request, mapa4, false);
			formdata.put("listaAgrReaseg", listaAgrReaseg);
			listaAgrReaseg = null;

			Map mapa5 = new PAC_IAX_OPERATIVA_FINV((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa5, false);
			formdata.put("listaMonedas", listaMonedas);

			/* INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo */
			Map mapa6 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
			List listaRamos = (List) tratarRETURNyMENSAJES(request, mapa6, false);
			formdata.put("listaRamos", listaRamos);
			listaRamos = null;
			/* FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea001Service - m�todo m_obtener_combos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
