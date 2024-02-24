package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_COA;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * CONSULTA CUENTAS COASEGURO - AXISCOA080 segun analisis!
 */
public class Axisrea049Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			if (isEmpty(CEMPRES)) {
				formdata.put("CEMPRES", CEMPRES.toString());
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request,
			// whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			SINPAQUETE sinpaquete = new SINPAQUETE((Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPCCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "SUCURSAL");
			java.sql.Date pPFCIERRE = null;
			BigDecimal pPCIAPROP = null;
			BigDecimal pPCTIPCOA = null;
			BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal pPCRAMO = null;
			BigDecimal pPSPRODUC = null;
			BigDecimal pPNPOLCIA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPCESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal pPSSEGURO = null;

			Map mapa_resultado = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_REMESA_DET(pPCCOMPANI, pPCSUCURSAL, pPFCIERRE,
					pPCIAPROP, pPCTIPCOA, pPCEMPRES, pPCRAMO, pPSPRODUC, pPNPOLCIA, pPCESTADO, pPSSEGURO, null);

			List RETURN = (List) tratarRETURNyMENSAJES(request, mapa_resultado);

			request.setAttribute("setFiltros", 1);

			if (!isEmpty(RETURN)) {
				request.setAttribute("CTACOASEGURO", tratarRETURNyMENSAJES(request, mapa_resultado));
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargar_listas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargar_listas(HttpServletRequest request) {
		logger.debug("Axiscoa001Service cargar_listas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_COA pac_iax_listvalores_coa = new PAC_IAX_LISTVALORES_COA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");

			Map map = null;

			// Recuperar empresas
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			request.setAttribute("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			// cargar ramos
			if (!isEmpty(CEMPRES)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, CEMPRES);
				request.setAttribute("RAMOS", tratarRETURNyMENSAJES(request, map, false));
			}

			// cargar productos
			if (!isEmpty(CEMPRES) && !isEmpty(CRAMO)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES, CRAMO);
				request.setAttribute("PRODUCTOS", tratarRETURNyMENSAJES(request, map, false));
			}

			// cargar coaseguradoas
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();
			request.setAttribute("LSTCIA_REA", tratarRETURNyMENSAJES(request, map, false));

			// cargar compa�ias
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(new BigDecimal("0"),
					new BigDecimal("4"));
			request.setAttribute("LSTCOMPANIAS", tratarRETURNyMENSAJES(request, map, false));

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// formdata.put("SPRODUC", SPRODUC);
			// cargar tipos de coaseguradoas
			map = pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(CEMPRES, SPRODUC,
					new BigDecimal(1), new BigDecimal(800109));
			request.setAttribute("TIPCOASEGURO", tratarRETURNyMENSAJES(request, map, false));

			// cargar estados
			map = pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA();
			request.setAttribute("LSTESTADOS", tratarRETURNyMENSAJES(request, map, false));

			// INVERFAS
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(307));
			logger.debug(map);
			request.setAttribute("LSTINVERFAS", (List) tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("CTIPAGE_LISTADOS", CEMPRES);
			BigDecimal ctipage_listado = (BigDecimal) map.get("RETURN");

			// map=new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new
			// BigDecimal("2"), usuario.getCidioma(), null);
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(ctipage_listado, usuario.getCidioma(), null);
			// fin Bug 26898 - APD - 13/05/2013

			HashMap listValores = new HashMap();
			logger.debug(map);
			listValores.put("LSTASUC", this.tratarRETURNyMENSAJES(request, map, false)); // sucursal

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo cargar_listas", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
