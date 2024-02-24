package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper054Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisper054Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisper054Action thisAction) {
		logger.debug("Axisper054Service m_form");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CTIPPER = getHiddenCampoNumerico(request, "CTIPPER");

			logger.debug("Axisper054Service m_form : CTIPPER : " + CTIPPER);
			formdata.put("TABEL_INFO", "HIDE");
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el metodo Axisper054Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void cargarValoresDesplegables(HttpServletRequest request, Axisper054Action thisAction, UsuarioBean usuario,
			Map formdata) throws Exception {
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (isEmpty(formdata.get("listValores"))) {
				// Tipo de persona
				Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
				logger.debug(map);
				listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

				// Tipo de documento
				BigDecimal TIDENTI = getCampoNumerico(request, "CTIPPER");

				if (isEmpty(TIDENTI)) {
					TIDENTI = getCampoNumerico(request, "CTIPPER");
				}
				logger.debug(" tipDocum TIDENTI : " + TIDENTI);

				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER_CIFIN(TIDENTI);
				logger.debug(map);
				listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

				logger.debug(":: Listas Cargadas OK ::");
			}
		} catch (Exception e) {
			logger.error("Error en el método Axisper054Service.cargarValoresDesplegables", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			if (isEmpty(formdata.get("listValores"))) {
				formdata.put("listValores", listValores);
			}
		}
	}

	public void m_buscarDatos(HttpServletRequest request, Axisper054Action thisAction) {
		logger.debug("Axisper054Service m_buscarDatos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal CTIPPER = null;
		BigDecimal CTIPIDE = null;
		String NNUMIDE = null;
		BigDecimal resultado = null;
		try {
			CTIPPER = AxisBaseService.getCampoNumerico(request, "CTIPPER");
			CTIPIDE = AxisBaseService.getCampoNumerico(request, "CTIPIDE");
			NNUMIDE = AxisBaseService.getCampoTextual(request, "NNUMIDE");

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_BUSCAR_DATOS_CIFIN(NNUMIDE, CTIPIDE);

			logger.debug("Axisper054Service m_buscarDatos: map: " + map);

			formdata.put("CTIPPER", CTIPPER);
			formdata.put("CTIPIDE", CTIPIDE);
			formdata.put("NNUMIDE", NNUMIDE);

			resultado = (BigDecimal) map.get("RETURN");

			logger.debug("resultado -----------------> " + resultado);

			if (new BigDecimal(0).equals(resultado) || new BigDecimal(1).equals(resultado)
					|| new BigDecimal(2).equals(resultado)) {
				formdata.put("TABEL_INFO", "SHOW");
				if (new BigDecimal(0).equals(resultado)) {
					formdata.put("OPTION", "CREATE");
					formdata.put("ISACTIVE", "FALSE");
				} else {
					formdata.put("OPTION", "UPDATE");
					formdata.put("ISACTIVE", "FALSE");
				}
				List MENSAJES = (List) map.get("MENSAJES");
				logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

				HashMap mm = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");

				logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);
				request.getSession().setAttribute("resultadoBusqueda", (ArrayList) (List) map.get("RESULTADO"));

				List rL = (List) map.get("RESULTADO");
				HashMap rr = (HashMap) rL.get(0);
				formdata.put("SPERSON", rr.get("SPERSON"));
				formdata.put("CAGENTE", rr.get("CAGENTE"));

				AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(), null,
						Constantes.MENSAJE_INFO);
				// AbstractDispatchAction.guardarMensaje(request, "", null,
				// Constantes.MENSAJE_INFO);
			} else {
				AbstractDispatchAction.guardarMensaje(request, resultado.toString(), null, Constantes.MENSAJE_INFO);
				formdata.put("TABEL_INFO", "HIDE");
			}
			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper054Service - m�todo m_buscarDatos ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_limpiar(HttpServletRequest request, Axisper054Action thisAction) {
		logger.debug("Axisper054Service m_limpiar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			formdata.put("CTIPPER", null);
			formdata.put("CTIPIDE", null);
			formdata.put("NNUMIDE", null);
			formdata.put("TABEL_INFO", "HIDE");

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper054Service - m�todo m_limpiar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscarDatosCIFIN(HttpServletRequest request, Axisper054Action thisAction) {
		logger.debug("Axisper054Service m_buscarDatosCIFIN");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		String CTIPIDE = null;
		String NNUMIDE = null;
		BigDecimal resultado = null;
		try {

			CTIPIDE = getCampoTextual(request, "CTIPIDE");
			NNUMIDE = getCampoTextual(request, "NNUMIDE");

			logger.debug("Axisper054Service m_buscarDatosCIFIN : CTIPIDE :" + CTIPIDE);
			logger.debug("Axisper054Service m_buscarDatosCIFIN : NNUMIDE :" + NNUMIDE);

			logger.debug("Axisper054Service m_buscarDatosCIFIN : OPTION :" + getCampoTextual(request, "OPTION"));
			logger.debug("Axisper054Service m_buscarDatosCIFIN : ISACTIVE :" + getCampoTextual(request, "ISACTIVE"));
			logger.debug("Axisper054Service m_buscarDatosCIFIN : SPERSON :" + getCampoTextual(request, "SPERSON"));
			logger.debug("Axisper054Service m_buscarDatosCIFIN : CAGENTE :" + getCampoTextual(request, "CAGENTE"));

			formdata.put("SPERSON", getCampoTextual(request, "SPERSON"));
			formdata.put("CAGENTE", getCampoTextual(request, "CAGENTE"));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_BUSCAR_SERVICIO_CIFIN(NNUMIDE,
					new BigDecimal(CTIPIDE));

			logger.debug("Axisper054Service m_buscarDatosCIFIN: map: " + map);

			resultado = (BigDecimal) map.get("RETURN");
			logger.debug("resultado -----------------> " + resultado);

			if (new BigDecimal(0).equals(resultado)) {
				formdata.put("TABEL_INFO", "SHOW");
				formdata.put("OPTION", getCampoTextual(request, "OPTION"));
				formdata.put("ISACTIVE", "TRUE");

				List MENSAJES = (List) map.get("MENSAJES");
				logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

				HashMap mm = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");

				logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);
				logger.debug("PERSONAS_CIFIN : " + map.get("PERSONAS_CIFIN"));

				request.getSession().setAttribute("PERSONAS_CIFIN", map.get("PERSONAS_CIFIN"));

				AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(),
						new Object[] {}, Constantes.MENSAJE_INFO);
			} else if (new BigDecimal(1).equals(resultado)) {
				List MENSAJES = (List) map.get("MENSAJES");
				logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

				HashMap mm = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");

				logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);
				AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(),
						new Object[] {}, Constantes.MENSAJE_INFO);
			} else {
				AbstractDispatchAction.guardarMensaje(request, resultado.toString(), new Object[] {},
						Constantes.MENSAJE_INFO);
			}

			cargarValoresDesplegables(request, thisAction, usuario, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper054Service - m�todo m_buscarDatosCIFIN ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ajax_actualizarPersonCIFIN(HttpServletRequest request, Axisper054Action thisAction) {
		logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		String CTIPIDE = null;
		String NNUMIDE = null;
		String SPERSON = null;
		String CAGENTE = null;
		BigDecimal resultado = null;

		try {
			CTIPIDE = getCampoTextual(request, "CTIPIDE");
			NNUMIDE = getCampoTextual(request, "NNUMIDE");
			SPERSON = getCampoTextual(request, "SPERSON");
			CAGENTE = getCampoTextual(request, "CAGENTE");

			logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN : CTIPIDE :" + CTIPIDE);
			logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN : NNUMIDE :" + NNUMIDE);
			logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN : SPERSON :" + SPERSON);
			logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN : CAGENTE :" + CAGENTE);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_ACTUALIZAR_DATOS_CIFIN(NNUMIDE,
					new BigDecimal(CTIPIDE));

			logger.debug("Axisper054Service m_ajax_actualizarPersonCIFIN: map: " + map);

			resultado = (BigDecimal) map.get("RETURN");
			logger.debug("resultado -----------------> " + resultado);

			if (new BigDecimal(0).equals(resultado)) {
				formdata.put("SPERSON", SPERSON);
				formdata.put("CAGENTE", CAGENTE);

				List MENSAJES = (List) map.get("MENSAJES");
				logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

				HashMap mm = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");

				logger.debug("OB_IAX_MENSAJES resultado 0: " + OB_IAX_MENSAJES);
				AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(),
						new Object[] {}, Constantes.MENSAJE_INFO);
			} else {
				formdata.put("TABEL_INFO", "SHOW");
				formdata.put("OPTION", getCampoTextual(request, "OPTION"));
				formdata.put("ISACTIVE", "TRUE");

				List MENSAJES = (List) map.get("MENSAJES");
				logger.debug("MENSAJES -----------------> " + MENSAJES.toString());

				HashMap mm = (HashMap) MENSAJES.get(0);
				HashMap OB_IAX_MENSAJES = (HashMap) mm.get("OB_IAX_MENSAJES");

				logger.debug("OB_IAX_MENSAJES : " + OB_IAX_MENSAJES);
				logger.debug("PERSONAS_CIFIN : " + map.get("PERSONAS_CIFIN"));
				AbstractDispatchAction.guardarMensaje(request, OB_IAX_MENSAJES.get("TERROR").toString(),
						new Object[] {}, Constantes.MENSAJE_INFO);
			}
			ajax.rellenarPlAContenedorAjax(map);
			Map resultadoMAP = new HashMap();
			resultadoMAP.put("resultado", resultado);
			ajax.guardarContenidoFinalAContenedorAjax(resultadoMAP);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper054Service - m�todo m_ajax_actualizarPersonCIFIN ", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
