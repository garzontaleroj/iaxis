package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_COMPANIAS;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axismnt017Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axismnt017Action.java 10/07/2012
 * 
 * @author <a href="autor@csi-ti.com">Javier del Rio</a>
 * @since Java 5.0
 */
public class Axismnt017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axismnt017Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismnt017Action thisAction) {
		logger.debug("Axismnt017Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CCOMPANI = getCampoNumerico(request, "PAR_CCOMPANI");
			BigDecimal SPERSON = getCampoNumerico(request, "PAR_SPERSON");
			BigDecimal SPERSON2 = getCampoNumerico(request, "SPERSON");
			if (isEmpty(CCOMPANI)) {
				CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			}
			String TCOMPANI = getCampoTextual(request, "TCOMPANI");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIA(CCOMPANI, SPERSON, TCOMPANI);
			logger.debug(map);

			if (!isEmpty(tratarRETURNyMENSAJES(request, map, false))) {

				// inicio modificacion bartolo herrera 22-02-2019
				// INI - AXIS 4406 - 14/6/2019 - AABG - SE REALIZA VALIDACION DE NULL PARA
				// PROCEDER A REALIZAR CONSULTA
				if (SPERSON != null) {
					PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapVinPer = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_TIPO_VINCULACION_PERSONA(SPERSON);
					List tipoVinculacion = (List) tratarRETURNyMENSAJES(request, mapVinPer);
					String CODSUBVINCULO = "-2147483648", CTIPIVA = "";
					if (tipoVinculacion != null) {
						Map aux = (Map) tipoVinculacion.get(0);
						if (!isEmpty(aux.get("CODSUBVINCULO")))
							CODSUBVINCULO = aux.get("CODSUBVINCULO").toString();

						if (!isEmpty(aux.get("CTIPIVA")))
							CTIPIVA = aux.get("CTIPIVA").toString();
					}

					formdata.put("CTIPCOM", CODSUBVINCULO);
					formdata.put("CTIPIVA", CTIPIVA);
				}
				// FIN - AXIS 4406 - 14/6/2019 - AABG - SE REALIZA VALIDACION DE NULL PARA
				// PROCEDER A REALIZAR CONSULTA

				// fin modificacion bartolo herrera 22-02-2019

				HashMap m2 = (HashMap) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(m2);

				if (SPERSON != null && CAGENTE != null && m2.get("CCOMPANI") == null) {

					PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
					logger.debug(map);
					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
						Map OBPERSONA = (Map) map.get("OBPERSONA");
						if (!isEmpty(OBPERSONA)) {
							if (!isEmpty(OBPERSONA.get("NNUMIDE"))) {
								formdata.put("NNUMIDE", OBPERSONA.get("NNUMIDE"));
								formdata.put("CCOMPANI", "");
								if (!isEmpty(OBPERSONA.get("TSIGLAS"))) {
									formdata.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
									formdata.put("TCOMPANI", OBPERSONA.get("TSIGLAS"));
								} else {
									String TNOMBRE = OBPERSONA.get("TNOMBRE") == null ? ""
											: (String) OBPERSONA.get("TNOMBRE");
									String TAPELLI1 = OBPERSONA.get("TAPELLI1") == null ? ""
											: (String) OBPERSONA.get("TAPELLI1");
									String TAPELLI2 = OBPERSONA.get("TAPELLI2") == null ? ""
											: (String) OBPERSONA.get("TAPELLI2");
									formdata.put("TNOMBRE", TNOMBRE + " " + TAPELLI1 + " " + TAPELLI2);
									formdata.put("TCOMPANI", TNOMBRE + " " + TAPELLI1 + " " + TAPELLI2);
								}
							}
						}
					}
				} else {
					formdata.putAll(m2);
				}
			}
			SPERSON = (BigDecimal) formdata.get("SPERSON");
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOIVA();
			logger.debug(map);
			formdata.put("LSTTIPOIVA", tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800101));
			logger.debug(map);
			formdata.put("LSTCENTICALIFI", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800100));
			logger.debug(map);
			formdata.put("LSTCCALIFI", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800102));
			logger.debug(map);
			formdata.put("LSTCTIPCOM", tratarRETURNyMENSAJES(request, map, false));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002025));
			logger.debug(map);
			formdata.put("LSTCTIPREA", tratarRETURNyMENSAJES(request, map, false));

			PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal(5));
			logger.debug(map);
			formdata.put("LSTCTRAMTAX", tratarRETURNyMENSAJES(request, map, false));

			map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(SPERSON, null);
			logger.debug("LSTCALIFICA: " + map);
			formdata.put("LSTCALIFICA", tratarRETURNyMENSAJES(request, map, false));

			// INVERFAS
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(307));
			logger.debug(map);
			request.setAttribute("LSTINVERFAS", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt017Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public BigDecimal m_consulta_persona(HttpServletRequest request, Axismnt017Action thisAction) {
		logger.debug("Axismnt017Service m_consulta_persona");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "DEC_SPERSON");
		try {
			// BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES");
			logger.debug(SPERSON);
			// formdata.put("NSINIES_axissin006", NSINIES);
			thisAction.topPila(request, "formdata_axismnt017", formdata);
			return SPERSON;

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt017Service - m�todo m_consulta_persona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			return SPERSON;

		}
		// this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_direccion(HttpServletRequest request, Axismnt017Action thisAction) {
		logger.debug("Axismnt017Service m_ajax_direccion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getHiddenCampoTextual(request, "op");
			BigDecimal CPAIS_RESIDENCIA = this.getHiddenCampoNumerico(request, "CPAIS_RESIDENCIA");
			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPAIS_RESIDENCIA")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPAIS(CPAIS_RESIDENCIA);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS_RESIDENCIA", CPAIS_RESIDENCIA);
					pais.put("TPAISRESIDENCIA", map.get("RETURN"));
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("TPAISRESIDENCIA", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map pais = new HashMap();
					pais.put("CPAIS", CPAIS_RESIDENCIA);
					formdata.put("CPAIS", CPAIS_RESIDENCIA);
					pais.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(pais);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt017Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_volver_per(HttpServletRequest request, Axismnt017Action thisAction) {
		logger.debug("Axismnt017Service m_volver_per");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			logger.debug("eiii" + formdata);

			Map formdata_axismnt017 = (Map) AbstractDispatchAction.removeTopPila(request, "formdata_axismnt017");

			if (!this.isEmpty(formdata_axismnt017)) {
				formdata.putAll(formdata_axismnt017);
				// formdata.put("NSINIES", formdata.get("NSINIES_axismnt017"));
				request.setAttribute(Constantes.FORMDATA, formdata);
			}

			logger.debug("eiii" + formdata);

			logger.debug(AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));
			logger.debug(request.getSession().getAttribute("SPERSON_ALTA"));

			if (!isEmpty(AbstractDispatchAction.topPila(request, "SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", AbstractDispatchAction.topPila(request, "SPERSON_ALTA"));

			if (!isEmpty(request.getSession().getAttribute("SPERSON_ALTA")))
				formdata.put("DEC_SPERSON_ALTA", request.getSession().getAttribute("SPERSON_ALTA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt017Service - m�todo m_volver_per", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axismnt017Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axismnt017Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String TCOMPANI = getCampoTextual(request, "TCOMPANI");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPIVA = getCampoNumerico(request, "CTIPIVA");
			// IAXIS-4823
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");
			// IAXIS-4823
			java.sql.Date FBAJA = stringToSqlDate(getCampoTextual(request, "FBAJA"));
			BigDecimal CAFILI = getCampoNumerico(request, "CAFILI");
			BigDecimal CENTICALIFI = getCampoNumerico(request, "CENTICALIFI");
			BigDecimal CCALIFI = getCampoNumerico(request, "CCALIFI");
			BigDecimal NANYCALIF = getCampoNumerico(request, "NANYCALIF");
			String CDIAN = getCampoTextual(request, "CDIAN");
			String CCASAMAT = getCampoTextual(request, "CCASAMAT");
			String CSUPERFINAN = getCampoTextual(request, "CSUPERFINAN");
			BigDecimal CTIPCOM = getCampoNumerico(request, "CTIPCOM");
			BigDecimal NPATRIMONIO = getCampoNumerico(request, "NPATRIMONIO");
			BigDecimal PIMPINT = getCampoNumerico(request, "PIMPINT");
			java.sql.Date FFALTA = stringToSqlDate(getCampoTextual(request, "FFALTA"));
			BigDecimal CRESIDFISC = getCampoNumerico(request, "CRESIDFISC"); // CONFCC-5
			java.sql.Date FRESFINI = stringToSqlDate(getCampoTextual(request, "FRESFINI")); // CONFCC-5
			java.sql.Date FRESFFIN = stringToSqlDate(getCampoTextual(request, "FRESFFIN")); // CONFCC-5

			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			String CCOMISI = getCampoTextual(request, "CCOMISI");
			String CUNESPA = getCampoTextual(request, "CUNESPA");
			BigDecimal CCONTABLE = getCampoNumerico(request, "CCONTABLE");
			BigDecimal CTRAMTAX = getCampoNumerico(request, "CTRAMTAX");
			BigDecimal CINVERFAS = getCampoNumerico(request, "CINVERFAS");

			BigDecimal APLICAVALIDACION = (getCampoNumerico(request, "APLICAVALIDACION") == null) ? new BigDecimal(0)
					: new BigDecimal(1);

			Map mapval = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_VAL_COMPANIAS_CALIF(SPERSON);
			BigDecimal calif = (BigDecimal) mapval.get("RETURN");
			if (APLICAVALIDACION.intValue() == 1 && calif.intValue() < 2) {
				thisAction.guardarMensaje(request, "9905534", new Object[] { "" }, Constantes.MENSAJE_ERROR);
			} else {

				Map map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_COMPANIA(SPERSON, CCOMPANI, TCOMPANI,
						CPAIS, CTIPIVA, CCOMISI, CUNESPA, FFALTA, FBAJA, CCONTABLE, CTIPCOM, CAFILI, CCASAMAT,
						CSUPERFINAN, CDIAN, CCALIFI, CENTICALIFI, NANYCALIF, NPATRIMONIO, PIMPINT, CTRAMTAX, CINVERFAS,
						CRESIDFISC, FRESFINI, FRESFFIN, CTIPREA);// IAXIS-4823 AGREGAR CAMPO CTIPREA
				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					logger.debug("guardardo");
					if (isEmpty(CCOMPANI)) {
						logger.debug("NUEVA COMPA�IA" + map.get("PCCOMPANI_NEW"));
						CCOMPANI = (BigDecimal) map.get("PCCOMPANI_NEW");
						formdata.put("CCOMPANI", CCOMPANI);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt017Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
