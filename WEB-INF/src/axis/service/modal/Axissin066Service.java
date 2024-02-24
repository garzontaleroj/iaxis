//Revision:# hElCJLWdNw9Fs/mXogxdyQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.modal.Axissin066Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin066Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin066Action thisAction) throws Exception {
		logger.debug("Axissin006Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		try {

			PAC_IAX_LISTVALORES_SIN pac_axis_listValores = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTGARANTIAS_CAP(SSEGURO);
			List listaGarantias = (List) tratarRETURNyMENSAJES(request, map1);
			logger.debug(listaGarantias);
			formdata.put("listaGarantias", !isEmpty(listaGarantias) ? listaGarantias : new ArrayList());
			formdata.put("CMONEDAFAUL", "COP");

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin066 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin066Action thisAction) {
		logger.debug("Axissin066Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map resultado;
		logger.debug("Axissin066Service m_form");
		PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal isNew = getCampoNumerico(request, "isNew");
			BigDecimal origen = getCampoNumerico(request, "ORIGEN");
			if (origen == null)
				origen = new BigDecimal(0);
			formdata.put("NSINIES", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("SSEGURO", SSEGURO);
			formdata.put("NORDEN", NORDEN);
			formdata.put("ORIGEN", origen);
			formdata.put("isNew", isNew);

			this.cargarListas(request, thisAction);
			if (new BigDecimal(0).equals(isNew)) {

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin066Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin066Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map resultado = null;
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITAL");
				String NSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				BigDecimal ORIGEN = getCampoNumerico(request, "ORIGEN");
				formdata.put("SSEGURO", SSEGURO);
				BigDecimal CGARANT = null;

				String TGARANT = getCampoTextual(request, "CGARANT");
				if (TGARANT != null) {
					String valores[] = TGARANT.split("/");
					CGARANT = new BigDecimal(valores[0]);
				}
				formdata.put("ICAPITAL", ICAPITAL);

				BigDecimal IPRETEN = getCampoNumerico(request, "IPRETEN");

				if (ORIGEN.equals(new BigDecimal(1))) {
					resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL_VALPRET(NSINIES,
							NTRAMIT, NORDEN, CGARANT, IPRETEN);
				} else {
					resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_VALPRET(NSINIES,
							NTRAMIT, NORDEN, CGARANT, IPRETEN);
				}

				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
				request.setAttribute("grabarOK", true);
				if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
					if (ORIGEN.equals(new BigDecimal(1))) {
						Map resulfiscal = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(NSINIES,
								NTRAMIT, NORDEN);
						Map objFiscal = (Map) resulfiscal.get("OBJFISCAL");
						if (((List) objFiscal.get("GARANTIAS")).size() > 0)
							formdata.put("GARANTIAS", (List) objFiscal.get("GARANTIAS"));
						request.setAttribute("ITOTASEG", objFiscal.get("ITOTASEG"));
						request.setAttribute("ITOTPRET", objFiscal.get("ITOTPRET"));
						request.setAttribute("CMONEDAFAUL", "COP");

					} else {

						// INI AXIS-3597 EA 2019-05-16 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
						// MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL
						// LA PANTALLA
						Map resultado2 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(NSINIES,
								NTRAMIT, NORDEN);
						Map objudicial = (Map) resultado2.get("OBJUDICIAL");
						if (((List) objudicial.get("GARANTIAS")).size() > 0)
							formdata.put("GARANTIAS", (List) objudicial.get("GARANTIAS"));
						request.setAttribute("ITOTASEG", objudicial.get("ITOTASEG"));
						request.setAttribute("ITOTPRET", objudicial.get("ITOTPRET"));
						request.setAttribute("CMONEDAFAUL", "COP");
						// FIN AXIS-3597 EA 2019-05-16 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
						// MODIFICACION Y ELIMINACION DE Amparo(s) afectado(s) SIN AFECTAR EL RESTO DEL
						// LA PANTALLA

					}
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin066Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	public void m_init(HttpServletRequest request, Axissin066Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
