//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_UNDERWRITING;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr307Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisctr307Service.java 08/07/2015
 * 
 * @author <a href="igil@csi-ti.com">Ivan Gil</a>
 * @since Java 5.0 Servicio de la pantalla modal CITAS MEDICAS
 *        (ALTA/MODIFICACION)
 */
public class Axisctr307Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisctr307Action thisAction) {
		logger.debug("Axisctr307Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		DateFormat format = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		try {

			this.cargarCombos(request);

			if ("axis.isNew".equals(formdata.get("MODO"))) {
				formdata.put("isNew", "true");
			} else {
				formdata.put("isNew", "false");

			}

			if (!"true".equals(formdata.get("isNew"))) {

				String TMEDICO = getCampoTextual(request, "NOMMEDI");
				BigDecimal CODEVID = getCampoNumerico(request, "CODEVID");
				String TEVIDEN = getCampoTextual(request, "TEVIDEN");
				BigDecimal CEVIDEN = getCampoNumerico(request, "CEVIDEN");
				String NOMASEG = getCampoTextual(request, "NOMASEG");
				String NOMMEDI = getCampoTextual(request, "NOMMEDI");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal SPERSON_MED = getCampoNumerico(request, "SPERSON_MED");

				String TESTADO = getCampoTextual(request, "TESTADO");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");

				Date FEVIDEN = null;
				if (formdata.get("FEVIDEN") != null && formdata.get("FEVIDEN") instanceof Date) {
					FEVIDEN = (Date) formdata.get("FEVIDEN");
				}

				BigDecimal CPAGO = getCampoNumerico(request, "CPAGO");
				String IEVIDEN = getCampoTextual(request, "IEVIDEN");

				formdata.put("TMEDICO", TMEDICO);
				Map mapMedicos = new HashMap();
				Map medico = new HashMap();

				if (SPERSON_MED != null) {
					mapMedicos = retornaHospitalDoc(request, null, "HPL");
					ArrayList lst = (ArrayList) mapMedicos.get("RETURN");
					if (!isEmpty(lst)) {
						for (Object m1 : lst) {
							Map m;
							if (m1 instanceof Map) {
								m = (Map) m1;
								BigDecimal codiPersona = (BigDecimal) m.get("CODI");

								if (codiPersona.intValue() == SPERSON_MED.intValue()) {
									medico = m;
								}
							}
						}
					}
				}
				formdata.put("CMEDICO", medico.get("NNUMNIF"));
				formdata.put("axisctr_medico.CODI", SPERSON_MED);
				formdata.put("SPERSON_HOS", SPERSON_MED);
				formdata.put("CODEVID", CODEVID);
				formdata.put("TEVIDEN", TEVIDEN);
				formdata.put("CEVIDEN", CEVIDEN);
				formdata.put("SPERASEG", SPERSON);
				formdata.put("FEVIDEN", FEVIDEN);
				formdata.put("CPAGO", CPAGO);
				formdata.put("CPAGO_CLK", CPAGO);
				formdata.put("IEVIDEN", IEVIDEN);
				formdata.put("CASEGURA", SPERSON);
				System.out.println(SPERSON + " / " + NOMASEG);

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisctr307Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			/* LISTVALORES */
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_UNDERWRITING pacIaxUnderwriting = new PAC_IAX_UNDERWRITING(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map LISTVALORES = new HashMap();

			/* LSTEMPRESAS */
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map, false));

			Map map1 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001025));
			logger.debug(map1);
			LISTVALORES.put("LSTESTADOS", tratarRETURNyMENSAJES(request, map1, false));

			Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_LISTASEGURA();
			logger.debug(map2);
			LISTVALORES.put("LSTASEGURADOS", tratarRETURNyMENSAJES(request, map2, false));

			Map map3 = pacIaxUnderwriting.ejecutaPAC_IAX_UNDERWRITING__F_GET_EVIDENCES();
			logger.debug(map3);
			LISTVALORES.put("LSTEVIDENCIAS", tratarRETURNyMENSAJES(request, map3, false));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisctr307Action thisAction) {
		logger.debug("Axisctr307Action m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		DateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		try {

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			BigDecimal CMEDICO = getCampoNumerico(request, "SPERSON_HOS");
			String TMEDICO = getCampoTextual(request, "NOMBRE_TEXT");

			String TPERSON = getCampoTextual(request, "TPERASEG");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERASEG");

			Date FEVIDEN = null;
			if (formdata.get("FEVIDEN") instanceof Date) {
				FEVIDEN = (Date) formdata.get("FEVIDEN");
			}
			String FEVIDEN_F = null;
			System.out.println(" SPERSON ASEGURADO =" + " otro " + FEVIDEN);
			BigDecimal IEVIDEN = getCampoNumerico(request, "IEVIDEN");
			BigDecimal CEVIDEN = getCampoNumerico(request, "CEVIDEN");
			String TEVIDEN = getCampoTextual(request, "TEVIDEN");
			String CODEVID = getCampoTextual(request, "CODEVID");
			BigDecimal CPAGO = getCampoNumerico(request, "CPAGO_CLK");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			String TESTADO = getCampoTextual(request, "TESTADO");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (FEVIDEN != null) {
				FEVIDEN_F = format.format(FEVIDEN);
			}
			if (!"true".equals(formdata.get("isNew"))) {

				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				BigDecimal NORDEN_R = getCampoNumerico(request, "NORDEN_R");
				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_EDITAR_CITASMEDICAS(SSEGURO, NRIESGO, NMOVIMI,
						TPERSON, SPERSON, CMEDICO, TMEDICO, CEVIDEN, TEVIDEN, CODEVID, FEVIDEN_F, CESTADO, TESTADO,
						NORDEN, IEVIDEN, CPAGO, NORDEN_R, CTIPO);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					request.setAttribute("grabarOK", true);
				}

			} else {

				if (CPAGO == null) {
					IEVIDEN = new BigDecimal(0);
					CPAGO = new BigDecimal(0);
				}

				Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_CITASMEDICAS(SSEGURO, NRIESGO, NMOVIMI,
						TPERSON, SPERSON, CMEDICO, TMEDICO, CEVIDEN, TEVIDEN, CODEVID, FEVIDEN_F, CESTADO, TESTADO,
						IEVIDEN, CPAGO, CTIPO, BigDecimal.ZERO);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
					request.setAttribute("grabarOK", true);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr307Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_medico(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CMEDICO = getCampoTextual(request, "CMEDICO");
			Map m = (Map) this.ActualizaMedico(request, CMEDICO);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr307Service - m�todo m_ajax_actualizar_medico", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el medico inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaMedico(HttpServletRequest request, String CMEDICO) throws Exception {
		Map mapMedicos = new HashMap();

		// Cargar Medico de la BD
		Map medico = new HashMap();
		if (!isEmpty(CMEDICO)) {

			mapMedicos = retornaHospitalDoc(request, CMEDICO, "HPL");
			logger.debug(mapMedicos);
			ArrayList lst = (ArrayList) mapMedicos.get("RETURN");
			if (!isEmpty(lst)) {
				medico = (HashMap) lst.get(0);
			}

		}

		request.getSession().setAttribute("axisctr_medico", medico);

		return mapMedicos;
	}

	public void m_ajax_ver_medico(HttpServletRequest request) {
		logger.debug("Axisctr307Service AJAX m_ajax_ver_medico");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map mapMedicos = new HashMap();
		Map medico = new HashMap();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			mapMedicos = retornaHospitalDoc(request, null, "HPL");
			logger.debug(mapMedicos);
			ArrayList lst = (ArrayList) mapMedicos.get("RETURN");
			if (!isEmpty(lst)) {
				for (Object m1 : lst) {
					Map m;
					if (m1 instanceof Map) {
						m = (Map) m1;
						BigDecimal codiPersona = (BigDecimal) m.get("CODI");

						if (codiPersona.intValue() == SPERSON.intValue()) {
							medico = m;
						}
					}
				}

			}
			request.getSession().setAttribute("axisctr_medico", medico);
			ajax.rellenarPlAContenedorAjax(medico);
			ajax.guardarContenidoFinalAContenedorAjax(medico);
		} catch (Exception e) {

			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_importe(HttpServletRequest request) {
		logger.debug("Axisctr307Service AJAX m_ajax_ver_medico");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map mapEvidencias = new HashMap();
		Map evidencia = new HashMap();

		try {
			BigDecimal CEVIDEN = getCampoNumerico(request, "CEVIDEN");

			mapEvidencias = retornaImporte(request, CEVIDEN);
			logger.debug(mapEvidencias);
			ArrayList lst = (ArrayList) mapEvidencias.get("RETURN");
			if (!isEmpty(lst)) {
				for (Object m1 : lst) {
					Map m;
					if (m1 instanceof Map) {
						m = (Map) m1;
						BigDecimal codiEviden = (BigDecimal) m.get("CEVIDEN");

						if (codiEviden.intValue() == CEVIDEN.intValue()) {
							evidencia = m;
						}
					}
				}

			}
			request.getSession().setAttribute("axisctr_evidencia", evidencia);
			ajax.rellenarPlAContenedorAjax(evidencia);
			ajax.guardarContenidoFinalAContenedorAjax(evidencia);
		} catch (Exception e) {

			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public Map retornaHospitalDoc(HttpServletRequest request, String NNUMNIF, String MODO) throws Exception {
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		PAC_IAX_PERSONA PAC_IAX_PERSONA = new PAC_IAX_PERSONA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map;
		if (NNUMNIF == null) {

			map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(null, null, null, SSEGURO, null, null,
					null, null, null, null, null, MODO, null);
		} else {
			map = PAC_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONAS_AGENTES(NNUMNIF + "", null, null, SSEGURO,
					null, null, null, null, null, null, null, MODO, null);

		}
		return map;
	}

	public Map retornaImporte(HttpServletRequest request, BigDecimal CEVIDEN) throws Exception {
		PAC_IAX_UNDERWRITING pacIaxUnderwriting = new PAC_IAX_UNDERWRITING(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = null;
		if (CEVIDEN != null) {
			map = pacIaxUnderwriting.ejecutaPAC_IAX_UNDERWRITING__F_GET_EVIDENCES();
		}
		return map;
	}
}
