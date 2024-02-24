//Revision:# bHQP7JeWPdXAX98IcW9TUw== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_COA;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea050Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * ALTA Y MANTENIMIENTO CUENTAS COASEGURO - AXISCOA082 segun analisis!
 */
public class Axisrea050Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisrea050Action thisAction) {
		logger.debug("Axiscoa003Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request,
		// whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisrea050Action thisAction) {
		logger.debug("Axiscoa003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			@SuppressWarnings("static-access")
			String CMODO = this.getCampoTextual(request, "CMODO");

			AbstractDispatchAction.topPila(request, "CMODO", CMODO);
			BigDecimal SMVCOA = getCampoNumerico(request, "SMOVCOA");

			formdata.put("CMODO", CMODO);
			formdata.put("SMVCOA", SMVCOA);

			if (CMODO.equals("MODIFICACION_REMESA")) {

				this.cargarDatosMovimiento(request, thisAction);

			}

			this.cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosMovimiento(HttpServletRequest request, Axisrea050Action thisAction) {
		// TODO Auto-generated method stub
		logger.debug("Axiscoa001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SMVCOA = getCampoNumerico(request, "SMVCOA");
			BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRES");

			@SuppressWarnings("rawtypes")
			Map mapa_resultado = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_REMESA_DET(null, null, null, null, null,
					pPCEMPRES, null, null, null, null, null, SMVCOA);

			List RETURN = (List) tratarRETURNyMENSAJES(request, mapa_resultado);

			if (!isEmpty(RETURN)) {

				formdata.put("CTACOASEGURO", RETURN);

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

	private void cargar_listas(HttpServletRequest request, Axisrea050Action thisAction) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		String identificador = this.getCampoTextual(request, "identificador");
		BigDecimal CEMPRES = null;
		if (identificador != null) {
			String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CEMPRES|CCOMPANI|SSEGURO|FCIERRE
			if (identificadorSplitted[0].trim().length() > 0)
				CEMPRES = new BigDecimal(identificadorSplitted[0].trim());
		}

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_COA pac_iax_listvalores_coa = new PAC_IAX_LISTVALORES_COA(
				(Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pac_iax_listvaloress = new PAC_IAX_LISTVALORES(
				(Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal CCONCEPTO = this.getCampoNumerico(request, "CCONCEPTO");
		logger.debug(
				tratarRETURNyMENSAJES(request, pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEP_CTA()));

		if (!isEmpty(CCONCEPTO)) {
			request.setAttribute("LSTTIPO_CTA", tratarRETURNyMENSAJES(request,
					pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_CTA(CCONCEPTO)));
		}

		request.setAttribute("DETVALORES", tratarRETURNyMENSAJES(request,
				pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800017))));

		request.setAttribute("ESTADO_CTA", tratarRETURNyMENSAJES(request,
				pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA()));
		/*
		 * CONF-403 - Casuisticas de Remesas de Coaseguros Se agregan conceptos manuales
		 * adicional a lo indicado en el bug 1620 45 - Ajuste por p�liza no emitida 46 -
		 * Aprovechamientos 47 - Gastos menores Marzo/2018
		 */
		request.setAttribute("TIPO_IMPORTE",
				tratarRETURNyMENSAJES(request,
						pac_iax_listvaloress.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(150),
								"CATRIBU IN (1, 2, 4, 13, 39, 38, 42, 5, 17, 32, 33, 43, 44, 45, 46, 47)")));

		Map map = null;
		map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("CTIPAGE_LISTADOS", CEMPRES);
		BigDecimal ctipage_listado = (BigDecimal) map.get("RETURN");

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(ctipage_listado, usuario.getCidioma(), null);

		HashMap listValores = new HashMap();
		logger.debug(map);
		listValores.put("LSTASUC", this.tratarRETURNyMENSAJES(request, map, false)); // sucursal

		Map map2 = null;
		map2 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();

		listValores.put("LSTCIA_REA", this.tratarRETURNyMENSAJES(request, map2, false)); // sucursal

		HashMap orden;
		Map mapa_monedas = null;
		try {
			PAC_IAX_PARAM param = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("LSTMONEDA", usuario.getCempres());

			mapa_monedas = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();

		} catch (Exception e) {
			e.toString();
		}
		List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa_monedas, false);
		formdata.put("listaMonedas", listaMonedas);
		logger.debug(mapa_monedas);
		listaMonedas = null;

		formdata.put("listValores", listValores);

	}

	public void m_aceptar(HttpServletRequest request, Axisrea050Action thisAction) {
		logger.debug("Axiscoa003Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPCEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal pPCCOMPANI = getCampoNumerico(request, "CCOMPANI");
			BigDecimal pPNNUMLIN = getCampoNumerico(request, "NNUMLIN");
			BigDecimal pPCTIPCOA = new BigDecimal(8);
			BigDecimal pPCDEBHAB = getCampoNumerico(request, "CDEBHAB");
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal pPSIDEPAG = getCampoNumerico(request, "SIDEPAG");
			java.sql.Date pPFCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));
			BigDecimal pPCMOVIMI = getCampoNumerico(request, "CMOVIMI");
			BigDecimal pPCIMPORT = getCampoNumerico(request, "CIMPORT");
			BigDecimal pPIMOVIMI = getCampoNumerico(request, "IIMPORT");
			java.sql.Date pPFCAMBIO = stringToSqlDate(getCampoTextual(request, "FCAMBIO"));
			BigDecimal pPCESTADO = getCampoNumerico(request, "ESTADO");
			String pPTDESCRI = this.getCampoTextual(request, "TDESCRI");
			String pPTDOCUME = this.getCampoTextual(request, "TDOCUME");
			BigDecimal pPMODO = null;
			BigDecimal pPNPOLCIA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal pPCSUCURSAL = getCampoNumerico(request, "SUCURSAL");
			BigDecimal CMONEDA = getCampoNumerico(request, "CMONEDA");
			BigDecimal SMVCOA = getCampoNumerico(request, "SMVCOA");

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (CMODO.equals("ALTA_REMESA")) {

				pPMODO = new BigDecimal(1);

			} else {

				pPMODO = new BigDecimal(0);

			}

			@SuppressWarnings("rawtypes")
			Map mapa_resultado = pac_iax_coa.ejecutaPAC_IAX_COA__F_SET_REMESA_DET(pPCEMPRES, pPCCOMPANI, pPNNUMLIN,
					pPCTIPCOA, pPCDEBHAB, pPSSEGURO, pPNRECIBO, pPSIDEPAG, pPFCIERRE, pPCMOVIMI, pPCIMPORT, pPIMOVIMI,
					pPFCAMBIO, pPCESTADO, pPTDESCRI, pPTDOCUME, pPMODO, pPNPOLCIA, pPCSUCURSAL, CMONEDA, SMVCOA);

			BigDecimal retorno = (BigDecimal) mapa_resultado.get("RETURN");

			if (retorno.equals(new BigDecimal("0"))) {

				formdata.put("ok", 1);

			} else {

				formdata.put("ok", 0);

			}

			this.tratarRETURNyMENSAJES(request, mapa_resultado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea050Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
