package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisadm059Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm059Service.java
 * 
 * @author <a href="mailto:icanada@csi-ti.com">Ivan Canada</a>
 */
public class Axisadm059Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm059Action thisAction) {
		logger.debug("Axisadm059Service m_init");
		try {
			// this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm059Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_form(HttpServletRequest request, Axisadm059Action thisAction) {
		logger.debug("Axisadm059Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCOBAN_BUS = getCampoNumerico(request, "CCOBAN_BUS");

			if (!isEmpty(CCOBAN_BUS)) {
				Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_DET(CCOBAN_BUS);
				logger.debug("----> Cobradores axisadm059:" + map.get("POBJBAN"));
				tratarRETURNyMENSAJES(request, map);
				ArrayList cob = (ArrayList) map.get("POBJBAN");
				Map co = (Map) cob.get(0);
				formdata.putAll((Map) co.get("OB_IAX_COBBANCARIO"));
				formdata.put("CMODO", "MODIF");
			} else {
				Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COBRADOR__F_GET_NOUCOBRADOR();
				logger.debug("----> Nou cobrador axisadm059:" + map.get("PCCOBBAN"));
				tratarRETURNyMENSAJES(request, map);
				formdata.put("CCOBBAN", map.get("PCCOBBAN"));
				formdata.put("CMODO", "NUEVO");
			}

			this.cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm059Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.gestionarOrdenacionTablas(request);
	}

	public void cargar_listas(HttpServletRequest request, Axisadm059Action thisAction) {
		logger.debug("Axisadm061Service m_cargar_listas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map_tipcuen = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOCUENTA();
			List listaCuenta = (List) tratarRETURNyMENSAJES(request, map_tipcuen);
			formdata.put("listaCuenta", listaCuenta);
			listaCuenta = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm059Service - m�todo m_cargar_listas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_aceptar(HttpServletRequest request, Axisadm059Action thisAction) {
		logger.debug("Axisadm059Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// BUG 25929/136957:JLTS:20130212Se adicionan las siguientes dos variables
			BigDecimal CCOBBAN = getCampoNumerico(request, "CCOB_AUX");
			String NCUENTA = getCampoTextual(request, "NCTA_AUX");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIP_AUX");
			BigDecimal CDOMSUC = getCampoNumerico(request, "CDOMSUC");
			BigDecimal CDOMENT = getCampoNumerico(request, "CDOMENT");
			String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");
			BigDecimal NPRISEL = getCampoNumerico(request, "NPRISEL");
			String TSUFIJO = getCampoTextual(request, "TSUFIJO");
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			BigDecimal CBAJA = getCampoNumerico(request, "CBAJA");
			BigDecimal CAGRUPREC = getCampoNumerico(request, "CAGRUPREC");
			String CMODO = getCampoTextual(request, "CMODO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal PRECIMP = getCampoNumerico(request, "PRECIMP");
			String DOM_FILLER_LN3 = getCampoTextual(request, "DOM_FILLER_LN3");
			String TCOBBAN = getCampoTextual(request, "TCOBBAN");
			BigDecimal CCONTABAN = getCampoNumerico(request, "CCONTABAN");

			Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COBRADOR__F_SET_COBRADOR(CCOBBAN, NCUENTA, TSUFIJO, CEMPRES, CDOMENT, CDOMSUC,
							NPRISEL, CBAJA, DESCRIPCION, NNUMNIF, TCOBBAN, CTIPBAN, CCONTABAN, DOM_FILLER_LN3, CMODO,
							PRECIMP, CAGRUPREC);
			logger.debug("Guardar ---> " + map);
			tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
			} else {
				formdata.put("OK", new BigDecimal(0));
			}

			this.cargar_listas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm059Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		this.gestionarOrdenacionTablas(request);
	}

}
