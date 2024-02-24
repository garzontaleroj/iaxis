package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm020Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm020Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm020Service m_form");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm020Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm020Action thisAction) {
		logger.debug("Axisadm020Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			// Datos que provienen de un flujo externo para controlar:
			// a- Si queremos ver el modal
			// b- A que pantalla de vuelta se dirige cuando se cancela.
			boolean acceso_externo = ((!isEmpty(thisAction.topPila(request, "acceso_externo")))
					? (Boolean) thisAction.topPila(request, "acceso_externo")
					: false);
			String pantalla_origen = ((!isEmpty(thisAction.topPila(request, "pantalla_origen")))
					? (String) thisAction.topPila(request, "pantalla_origen")
					: "axisctr020");

			request.setAttribute("acceso_externo", acceso_externo);
			request.setAttribute("pantalla_origen", pantalla_origen);

			if (!isEmpty(NRECIBO)) {
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Info del recibo
				Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO, new BigDecimal(0));
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map1);
				logger.debug(OB_IAX_RECIBOS);

				// ReFormateo el valor de CBANCAR
				if (!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) {
					String CBANCAR_TMP = (String) OB_IAX_RECIBOS.get("CBANCAR");
					CBANCAR_TMP = CBANCAR_TMP.replaceAll("-", "");
					OB_IAX_RECIBOS.put("CBANCAR", CBANCAR_TMP);
					logger.debug(OB_IAX_RECIBOS);
				}

				// Info. general de la p�liza
				BigDecimal SSEGURO = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("SSEGURO")))
						? (BigDecimal) OB_IAX_RECIBOS.get("SSEGURO")
						: null);
				Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map2);
				logger.debug(OB_IAX_GENPOLIZA);

				// Carga del radio button general
				Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_ANULA_PEND(NRECIBO);
				BigDecimal returnRadio = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
				logger.debug(returnRadio);

				request.setAttribute("NRECIBO", !isEmpty(NRECIBO) ? NRECIBO : null);

				request.setAttribute("OB_IAX_RECIBOS", !isEmpty(OB_IAX_RECIBOS) ? OB_IAX_RECIBOS : new HashMap());

				request.setAttribute("OB_IAX_GENPOLIZA", !isEmpty(OB_IAX_GENPOLIZA) ? OB_IAX_GENPOLIZA : new HashMap());

				request.setAttribute("PANULA", !isEmpty(returnRadio) ? returnRadio : null);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm020Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que realiza la anulaci�n del cobro del recibo
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm020Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal PANULA = getCampoNumerico(request, "PANULA");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Anulo el recibo
			Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_ANULACION_PENDIENTE(NRECIBO);// , PANULA);
			BigDecimal returnAnulacion = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
			logger.debug(returnAnulacion);

			if (BigDecimal.ZERO.equals(returnAnulacion)) {
				List T_IAX_ANULADO = new ArrayList();
				Map OB_IAX_ANULADO = new HashMap();
				String TPRODUC = getCampoTextual(request, "TPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				String TAGENTE = getCampoTextual(request, "TAGENTE");
				BigDecimal ICOMISI = getCampoNumerico(request, "ICOMISI");
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");

				OB_IAX_ANULADO.put("NRECIBO", NRECIBO);
				OB_IAX_ANULADO.put("TPRODUC", TPRODUC);
				OB_IAX_ANULADO.put("NPOLIZA", NPOLIZA);
				OB_IAX_ANULADO.put("TAGENTE", TAGENTE);
				OB_IAX_ANULADO.put("ICOMISI", ICOMISI);
				OB_IAX_ANULADO.put("IMPORTE", IMPORTE);

				T_IAX_ANULADO.add(OB_IAX_ANULADO);

				logger.debug(OB_IAX_ANULADO);

				request.setAttribute("T_IAX_ANULADO", !isEmpty(T_IAX_ANULADO) ? T_IAX_ANULADO : new ArrayList());
				// Para evitar repetir el proceso de anulaci�n, en pantalla, con la misma p�liza
				request.setAttribute("ANULADO", true);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm020Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
