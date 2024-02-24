package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_EMPLEADOS_REPRESENT;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisper036Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisper036Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisper036Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisper036Action thisAction) {
		logger.debug("Axisper036Service m_init");
		try {
			this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper036Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisper036Action thisAction) {
		logger.debug("Axisper036Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			PAC_IAX_EMPLEADOS_REPRESENT pac_iax_empleados_represent = new PAC_IAX_EMPLEADOS_REPRESENT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			this.cargaListas(request);

			String CMODO = getCampoTextual(request, "CMODO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			formdata.put("CMODO", CMODO);
			formdata.put("SPERSON", SPERSON);

			if (CMODO.equals(new String("MODIF")) && !isEmpty(SPERSON)) {

				Map map = pac_iax_empleados_represent.ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_GET_EMPLEADO(SPERSON);
				logger.debug("--> map:" + map);
				tratarRETURNyMENSAJES(request, map);
				HashMap empleado = (HashMap) map.get("OBEMPLEADO");
				logger.debug("--> empleado:" + empleado);

				formdata.put("CTIPO", empleado.get("CTIPO"));
				formdata.put("CSUBTIPO", empleado.get("CSUBTIPO"));
				formdata.put("CCARGO", empleado.get("CARGO"));
				formdata.put("CCANAL", empleado.get("CCANAL"));

				BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																					// AbstractDispatchAction.topPila(request,
																					// "SSEGURO");

				CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
				map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug("get PERSONA()" + map);
				tratarRETURNyMENSAJES(request, map);
				HashMap persona = (HashMap) map.get("OBPERSONA");
				String NOMBRE = (String) ((persona.get("TNOMBRE1") != null) ? persona.get("TNOMBRE1")
						: persona.get("TNOMBRE"))
						+ ((persona.get("TNOMBRE2") != null) ? " " + persona.get("TNOMBRE2") : "") + ","
						+ ((persona.get("TAPELLI1") != null) ? " " + persona.get("TAPELLI1") : "") + " "
						+ ((persona.get("TAPELLI2") != null) ? " " + persona.get("TAPELLI2") : "");
				formdata.put("NOMBRE", NOMBRE);
				formdata.put("CTIPPER", persona.get("CTIPPER"));
				formdata.put("NNUMIDE", persona.get("NNUMIDE"));
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper036Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = new HashMap();
		Map listValores = new HashMap();

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
		logger.debug(map);
		listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo de documento
		BigDecimal TIDENTI = getCampoNumerico(request, "TPERSONA");
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
		logger.debug(map);
		listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800050));
		logger.debug(map);
		listValores.put("tipoList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800052));
		logger.debug(map);
		listValores.put("subtipoList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800056));
		logger.debug(map);
		listValores.put("cargoList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800053));
		logger.debug(map);
		listValores.put("canalList", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listValores", listValores);
	}

	public void m_guardar(HttpServletRequest request, Axisper036Action thisAction) {

		logger.debug("Axisper036Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_EMPLEADOS_REPRESENT pac_iax_empleados_represent = new PAC_IAX_EMPLEADOS_REPRESENT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			BigDecimal CSUBTIPO = getCampoNumerico(request, "CSUBTIPO");
			BigDecimal CCARGO = getCampoNumerico(request, "CCARGO");
			BigDecimal CCANAL = getCampoNumerico(request, "CCANAL");

			logger.debug("--> SPERSON:" + SPERSON);
			logger.debug("--> CTIPO:" + CTIPO);
			logger.debug("--> CSUBTIPO:" + CSUBTIPO);
			logger.debug("--> CARGO:" + CCARGO);
			logger.debug("--> CCANAL:" + CCANAL);

			Map map = pac_iax_empleados_represent.ejecutaPAC_IAX_EMPLEADOS_REPRESENT__F_SET_EMPLEADO(SPERSON, CTIPO,
					CSUBTIPO, CCARGO, CCANAL);

			logger.debug("-->guardar empleado:" + map);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			} else
				formdata.put("OK", 1);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisper036Action thisAction) {
		logger.debug("Axisper025Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");

			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug("--> persona:" + OB_PERSONA);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisper036Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
