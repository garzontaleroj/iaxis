package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CON;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin060Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin060Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin060Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axissin060Action thisAction) throws Exception {
		logger.debug("Axissin060Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal PIPAGO = getCampoNumerico(request, "IPAGO");
			BigDecimal PSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal PSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal PSIDEPAG = getCampoNumerico(request, "SIDEPAG");
			logger.debug("++++PSIDEPAG: " + PSIDEPAG);
			formdata.put("SIDEPAG", PSIDEPAG);
			String PNSINIES = getCampoTextual(request, "NSINIES");

			PAC_IAX_CON pac_iax_con = new PAC_IAX_CON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_con.ejecutaPAC_IAX_CON__F_LISTA_CONTRATOS_PAGO(PIPAGO, PSPERSON, PNSINIES, PSSEGURO);
			logger.debug("---> CONTRATOS:" + m);

			if (!isEmpty(m) && ((BigDecimal) tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("CONTRATOS", m.get("PCURCONTRATOS"));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin060Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000060", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axissin060Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String pCDP = getCampoTextual(request, "CDP");
			String pPOSPRES = getCampoTextual(request, "POSPRES");
			String pCRP = getCampoTextual(request, "CRP");
			String pPOSCRP = getCampoTextual(request, "POSCRP");
			String pCONTRATO = getCampoTextual(request, "PCONTRATO");
			String pCGESTOR = getCampoTextual(request, "CGESTOR");
			BigDecimal pSIDEPAG = new BigDecimal(request.getParameter("SIDEPAG"));

			PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = new HashMap();

			map = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_INS_PAGO_CONTRATO(pSIDEPAG, pCDP, pPOSPRES, pCRP,
					pPOSCRP, pCONTRATO, pCGESTOR);

			logger.debug(map);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
				formdata.put("aceptar", "0");
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
