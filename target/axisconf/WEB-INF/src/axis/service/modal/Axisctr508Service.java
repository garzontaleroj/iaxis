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

import axis.jdbc.PAC_IAX_BONFRAN;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr508Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr508Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axisctr508Action thisAction) throws Exception {
		logger.debug("Axisctr508Service m_cargarCombos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("1104"));
			List listaTipoUnidad = (List) tratarRETURNyMENSAJES(request, map1);
			logger.debug(listaTipoUnidad);
			formdata.put("listaTipoUnidad", !isEmpty(listaTipoUnidad) ? listaTipoUnidad : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisctr508 cargarCombos", e);
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
	public void m_form(HttpServletRequest request, Axisctr508Action thisAction) {
		logger.debug("Axisctr508Service m_guardar");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map resultado;
		logger.debug("Axisctr508Service m_form");
		try {
			PAC_IAX_BONFRAN pac_axis_deducibles = new PAC_IAX_BONFRAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal PCGRUP = getCampoNumerico(request, "CGRUP");
			BigDecimal PCSUBGRUP = getCampoNumerico(request, "CSUBGRUP");
			BigDecimal PCVERSION = getCampoNumerico(request, "CVERSION");
			BigDecimal PCNIVEL = getCampoNumerico(request, "CNIVEL");
			resultado = pac_axis_deducibles.ejecutaPAC_IAX_BONFRAN__F_VALIDAR_DEDUCIBLE_MANUAL(PCGRUP, PCSUBGRUP,
					PCVERSION, PCNIVEL);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
			if (!isEmpty(resultado) && new BigDecimal(1).equals(RETURN) && (request.getAttribute("grabarOK") == null
					|| !(Boolean) request.getAttribute("grabarOK") == true)) {
				request.setAttribute("validacionFallo", true);
			} else {
				request.setAttribute("validacionFallo", false);
				BigDecimal PCVALOR1 = getCampoNumerico(request, "CVALOR1");
				BigDecimal PIMPVALOR1 = getCampoNumerico(request, "IMPVALOR1");
				BigDecimal PCIMPMIN = getCampoNumerico(request, "CIMPMIN");
				BigDecimal PIMPMIN = getCampoNumerico(request, "IMPMIN");
				BigDecimal PCIMPMAX = getCampoNumerico(request, "CIMPMAX");
				BigDecimal PIMPMAX = getCampoNumerico(request, "IMPMAX");
				formdata.put("CVALOR1", resultado.get("PCVALOR1"));
				formdata.put("IMPVALOR1", resultado.get("PIMPVALOR1"));
				formdata.put("CIMPMIN", resultado.get("PCIMPMIN"));
				formdata.put("IMPMIN", resultado.get("PIMPMIN"));
				formdata.put("CIMPMAX", resultado.get("PCIMPMAX"));
				formdata.put("IMPMAX", resultado.get("PIMPMAX"));
				this.cargarListas(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr508Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axisctr508Action thisAction) {
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			PAC_IAX_BONFRAN pac_axis_deducibles = new PAC_IAX_BONFRAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map resultado = null;
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				BigDecimal PCGRUP = getCampoNumerico(request, "CGRUP");
				BigDecimal PCSUBGRUP = getCampoNumerico(request, "CSUBGRUP");
				BigDecimal PCVERSION = getCampoNumerico(request, "CVERSION");
				BigDecimal PCNIVEL = getCampoNumerico(request, "CNIVEL");
				BigDecimal PCVALOR1 = getCampoNumerico(request, "CVALOR1");
				BigDecimal PIMPVALOR1 = getCampoNumerico(request, "IMPVALOR1");
				BigDecimal PCIMPMIN = getCampoNumerico(request, "CIMPMIN");
				BigDecimal PIMPMIN = getCampoNumerico(request, "IMPMIN");
				BigDecimal PCIMPMAX = getCampoNumerico(request, "CIMPMAX");
				BigDecimal PIMPMAX = getCampoNumerico(request, "IMPMAX");

				resultado = pac_axis_deducibles.ejecutaPAC_IAX_BONFRAN__F_SET_DEDUCIBLE(PCGRUP, PCSUBGRUP, PCVERSION,
						PCNIVEL, PCVALOR1, PIMPVALOR1, PCIMPMIN, PIMPMIN, PCIMPMAX, PIMPMAX);

				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
				if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
					request.setAttribute("grabarOK", true);
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr508Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	public void m_init(HttpServletRequest request, Axisctr508Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin068Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
