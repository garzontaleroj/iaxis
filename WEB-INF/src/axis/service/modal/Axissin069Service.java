//Revision:# 4Lz7/Txa5Rjukqv1v8n7Iw== #
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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.modal.Axissin069Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin069Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin069Action thisAction) throws Exception {
		logger.debug("Axissin006Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		BigDecimal TIPO = getCampoNumerico(request, "TIPO");
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (TIPO.equals(new BigDecimal(1))) {
				Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("800067"));
				List listaRoles = (List) tratarRETURNyMENSAJES(request, map1);
				logger.debug(listaRoles);
				formdata.put("listaRoles", !isEmpty(listaRoles) ? listaRoles : new ArrayList());
			} else {
				Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001099"));
				List listaRoles = (List) tratarRETURNyMENSAJES(request, map1);
				logger.debug(listaRoles);
				formdata.put("listaRoles", !isEmpty(listaRoles) ? listaRoles : new ArrayList());
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006 cargarCombos", e);
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
	public void m_form(HttpServletRequest request, Axissin069Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map resultado;
		logger.debug("Axissin011Service m_form");
		PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal TIPO = getCampoNumerico(request, "TIPO");
			BigDecimal isNew = getCampoNumerico(request, "isNew");
			formdata.put("NRECLAMA", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("TIPO", TIPO);
			formdata.put("NORDEN", NORDEN);
			formdata.put("isNew", isNew);

			this.cargarListas(request, thisAction);
			if (new BigDecimal(0).equals(isNew)) {

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin069Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin069Action thisAction) {
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
				String NSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal NTIPPER = getCampoNumerico(request, "NTIPPER");
				BigDecimal NPERSONA = getCampoNumerico(request, "NPERSONA");
				BigDecimal NROL = getCampoNumerico(request, "TIPO");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String TNOMBRE = getCampoTextual(request, "TNOMBRE");
				BigDecimal IIMPORTE = getCampoNumerico(request, "IIMPORTE");
				resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_JUDICIAL_DETPER(NSINIES, NTRAMIT,
						NORDEN, NROL, NPERSONA, NTIPPER, NNUMIDE, TNOMBRE, IIMPORTE);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
				if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
					request.setAttribute("grabarOK", true);
					// INI AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
					// MODIFICACION Y ELIMINACION DE (Beneficiarios) SIN AFECTAR EL RESTO DEL LA
					// PANTALLA
					Map resultado2 = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_JUDICIAL(NSINIES,
							NTRAMIT, NORDEN);
					Map objudicial = (Map) resultado2.get("OBJUDICIAL");
					if (((List) objudicial.get("PERSONAS")).size() > 0) {

						List<Map> personas = (List<Map>) objudicial.get("PERSONAS");
						List personasBenef = new ArrayList<Map>();
						List personasDeman = new ArrayList<Map>();
						for (Map obpersona : personas) {
							if (((Map) obpersona.get("OB_IAX_SIN_T_JUDICIAL_DETPER")).get("NROL")
									.equals(new BigDecimal(2))) {
								personasBenef.add(obpersona);
							} else {
								personasDeman.add(obpersona);
							}
						}
						if (personasBenef.size() > 0)
							formdata.put("personasBenef", personasBenef);
						if (personasDeman.size() > 0)
							formdata.put("personasDeman", personasDeman);
					}
					// FIN AXIS-AXIS-3597 EA 2019-05-13 SE AGREGARON FUNCIONES PARA REALIZAR EDICION
					// MODIFICACION Y ELIMINACION DE (Beneficiarios) SIN AFECTAR EL RESTO DEL LA
					// PANTALLA
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin069Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	public void m_init(HttpServletRequest request, Axissin069Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
