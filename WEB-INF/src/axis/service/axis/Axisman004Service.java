package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MANDATOS;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axisman004Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisman004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisman004Action thisAction) {
		logger.debug("Axisman004Service m_form");
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axisman004Action thisAction) {
		logger.debug("Axisman004Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			this.cargarDatos(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axisman004Action thisAction, Map formdata) throws Exception {
		try {
			Map m = null;
			List plReturn = null;
			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_GET_LSTESTADOS_MANDMASIVA();
			logger.debug(m);
			plReturn = (List) tratarRETURNyMENSAJES(request, m);
			// formdata.put("listsitmandato", plReturn);
			request.getSession().setAttribute("listsitmandato", plReturn);
		} catch (Exception e) {
			logger.error("Error en el m�todo Axisman004Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void aceptar(HttpServletRequest request, Axisman004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map;
		try {
			PAC_IAX_MANDATOS pac_iax_mandatos = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CADENA = this.getCampoTextual(request, "CADENA");
			logger.debug("+++++++CADENA: " + CADENA);
			BigDecimal ACCION = this.getCampoNumerico(request, "ACCION");
			logger.debug("+++++++ACCION: " + ACCION);

			String CADENAB = "";

			List tinfo = (List) request.getSession().getAttribute("listmandatos");

			logger.debug("tinfo: " + tinfo);
			// ArrayList tinfo
			// =(ArrayList)request.getSession().getAttribute("listmandatos");

			for (int i = 0; i < tinfo.size(); i++) {
				if (((Map) tinfo.get(i)).get("MARCAR").equals(new BigDecimal(1))) {

					CADENAB = CADENAB + "-" + ((Map) tinfo.get(i)).get("NUMEROFOLIO").toString();

				}

			}

			logger.debug("CADENAB" + CADENAB);

			map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_GESTION_MASIVA(CADENAB, ACCION);
			logger.debug(map);
			BigDecimal respuesta = (BigDecimal) map.get("PNOMINA");
			if (respuesta != null) {
				formdata.put("NOMINASEL", respuesta);
				request.getSession().setAttribute("listmandatos", null);
				this.cargarDatos(request, thisAction, formdata);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo m_aceptar", e);

		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void buscar(HttpServletRequest request, Axisman004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map;
		try {
			if (formdata.get("paginar") == null) {
				PAC_IAX_MANDATOS pac_iax_caja = new PAC_IAX_MANDATOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				BigDecimal SITMANDATO = this.getCampoNumerico(request, "SITMANDATO");
				formdata.put("SITMANDATO", SITMANDATO);
				logger.debug("+++++++SITMANDATO: " + SITMANDATO);
				BigDecimal NOMINA = this.getCampoNumerico(request, "NOMINA");
				formdata.put("NOMINA", NOMINA);
				logger.debug("+++++++NOMINA: " + NOMINA);

				map = pac_iax_caja.ejecutaPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS_MASIVA(SITMANDATO, NOMINA);
				logger.debug(map);
				List plReturn = (List) tratarRETURNyMENSAJES(request, map);
				BigDecimal ESTADOSEL = null, EDITABLE = null;
				if (plReturn != null && plReturn.size() > 0) {

					for (int i = 0; i < plReturn.size(); i++) {

						HashMap mandato = (HashMap) plReturn.get(i);
						EDITABLE = (BigDecimal) mandato.get("EDITABLE");
						if (EDITABLE.equals(new BigDecimal("1"))) {
							ESTADOSEL = (BigDecimal) mandato.get("SITUACION");
							formdata.put("ESTADOSEL", ESTADOSEL);
							break;
						}

					}

					for (int i = 0; i < plReturn.size(); i++) {
						HashMap mandato = (HashMap) plReturn.get(i);
						mandato.put("MARCAR", new BigDecimal(0));
						((Map) plReturn.get(i)).put("MARCAR", new BigDecimal(0));
					}

				}

				request.getSession().setAttribute("listmandatos", plReturn);
				this.cargarDatos(request, thisAction, formdata);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo m_aceptar", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_ajax_cargar_acciones(HttpServletRequest request) {
		logger.debug("Axisman004Service m_ajax_cargar_acciones");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			// ajax.guardarContenidoFinalAContenedorAjax(this.cargar_acciones(request));

			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");
			BigDecimal VALIDA = this.getCampoNumerico(request, "VALIDA");
			BigDecimal NUMFOLIO = this.getCampoNumerico(request, "NUMFOLIO");

			List tinfo = (List) request.getSession().getAttribute("listmandatos");

			logger.debug("tinfo: " + tinfo);
			// ArrayList tinfo
			// =(ArrayList)request.getSession().getAttribute("listmandatos");

			for (int i = 0; i < tinfo.size(); i++) {
				if (!isEmpty(NUMFOLIO)) {
					if (((Map) tinfo.get(i)).get("NUMEROFOLIO").equals(NUMFOLIO)) {
						((Map) tinfo.get(i)).put("MARCAR", MARCAR);
					}
				} else {
					((Map) tinfo.get(i)).put("MARCAR", VALIDA);
				}
			}

			request.getSession().setAttribute("listmandatos", tinfo);

			Map devolver = new HashMap();

			devolver.put("listmandatos", tinfo);
			ajax.rellenarPlAContenedorAjax(devolver);
			ajax.guardarContenidoFinalAContenedorAjax(this.cargar_acciones(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo m_ajax_cargar_acciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List cargar_acciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map m = null;
		List plReturn = null;

		try {

			PAC_IAX_MANDATOS pac_axis_common = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal ESTADO = this.getCampoNumerico(request, "ESTADO");

			BigDecimal MARCAR = this.getCampoNumerico(request, "MARCAR");
			BigDecimal VALIDA = this.getCampoNumerico(request, "VALIDA");
			BigDecimal NUMFOLIO = this.getCampoNumerico(request, "NUMFOLIO");

			logger.debug("valida" + VALIDA + " estado" + ESTADO);

			if (!isEmpty(ESTADO) && !VALIDA.equals(new BigDecimal(0))) {
				m = pac_axis_common.ejecutaPAC_IAX_MANDATOS__F_GET_ACCIONES_MANDMASIVA(ESTADO);
				logger.debug(m);
				plReturn = (List) tratarRETURNyMENSAJES(request, m);
				request.getSession().setAttribute("listacciones", plReturn);
			}
			logger.debug("$$$$$$$$$$$$ fin pac_iax_caja: " + m);

			return plReturn;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman004Service - m�todo cargar_acciones", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

		return null;

	}

}
