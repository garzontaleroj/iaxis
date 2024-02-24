package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr006Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr006Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Operaciones relacionadas con los beneficierios especiales Segun el parametro
	 * "opBENEIDENT" se actua.
	 * 
	 * @param conn
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void opBENEIDENT(Connection conn, HttpServletRequest request, AbstractDispatchAction thisAction)
			throws Exception {

		HashMap m = this.f_Get_Avisos(request, this.whoami(this), new String("MODIF_BENE"));
		logger.debug(m);
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1) {

			String opBENEIDENT = request.getParameter("opBENEIDENT");
			HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
			// BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SPERSON_BENEIDENT = getCampoNumerico(request, "SPERSON_BENEIDENT");
			BigDecimal CGARANT_BENEIDENT = getCampoNumerico(request, "CGARANT_BENEIDENT");
			BigDecimal NORDEN_BENEIDENT = getCampoNumerico(request, "NORDEN_BENEIDENT");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String TNOMBRE1 = getCampoTextual(request, "TNOMBRE1");
			String TNOMBRE2 = getCampoTextual(request, "TNOMBRE2");
			String TAPELLI1 = getCampoTextual(request, "TAPELLI1");
			String TAPELLI2 = getCampoTextual(request, "TAPELLI2");
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); // tipo de documento
			BigDecimal TIDENTI = getCampoNumerico(request, "TIDENTI"); // tipo persona
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			String fecha = getCampoTextual(request, "FNACIMI");
			String NNUMNIF = getCampoTextual(request, "NNUMNIF");
			java.sql.Date FNACIMI = this.stringToSqlDate(fecha, "dd/MM/yyyy");

			if (request.getParameterValues("paginar") == null) {
				if (opBENEIDENT != null && opBENEIDENT.trim().length() > 0) {
					if (opBENEIDENT.equals("ANADIR_BENRIESGO")) {

						BigDecimal SIMUL = getCampoNumerico(request, "SIMUL");

						if (isEmpty(SIMUL)) {
							PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(conn);
							Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(NRIESGO,
									SPERSON_BENEIDENT);
							logger.debug(map);
							BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
							if (ok.intValue() == 0) {
								formdata.put("okBen", "1");
								formdata.put("NRIESGO", NRIESGO);
								formdata.put("NORDEN", map.get("PNORDEN"));
							}

						} else {
							BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN");
							if (isEmpty(NORDEN)) {
								PAC_IAX_SIMULACIONES pacIaxSimulacion = new PAC_IAX_SIMULACIONES(conn);
								Map map = pacIaxSimulacion.ejecutaPAC_IAX_SIMULACIONES__F_GRABABENEFICIARIOS(NRIESGO,
										SPERSON_BENEIDENT, CSEXPER, FNACIMI, NNUMNIF, TNOMBRE, TNOMBRE1, TNOMBRE2,
										TAPELLI1, TAPELLI2, CTIPIDE, TIDENTI);
								logger.debug(map);
								BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
								if (ok.intValue() == 0) {
									formdata.put("okBen", "1");
									formdata.put("NRIESGO", NRIESGO);
									formdata.put("NORDEN", map.get("PNORDEN"));
								}
							} else {
								formdata.put("okBen", "1");
								formdata.put("NRIESGO", NRIESGO);
								formdata.put("NORDEN", NORDEN);
							}
						}

					}
					if (opBENEIDENT.equals("ELIMINAR_BENRIESGO")) {
						PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(conn);
						Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(NRIESGO,
								NORDEN_BENEIDENT);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
					}
					/*
					 * if (opBENEIDENT.equals("ANADIR_GAR_BENEF")) { PAC_IAX_PRODUCCION
					 * pacIaxProduccion=new PAC_IAX_PRODUCCION(conn); Map map =
					 * pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_G(NRIESGO,
					 * CGARANT_BENEIDENT, SPERSON_BENEIDENT); logger.debug(map);
					 * tratarRETURNyMENSAJES(request, map); }
					 */if (opBENEIDENT.equals("ELIMINAR_GAR_BENEF")) {
						PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(conn);
						Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_GAR_BENEIDENT(NRIESGO,
								CGARANT_BENEIDENT);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
					}
					if (opBENEIDENT.equals("ANADIR_GAR_BENEF_AMPARO")) {
						PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(conn);
						Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_G(NRIESGO,
								CGARANT_BENEIDENT, SPERSON_BENEIDENT);
						logger.debug(map);
						BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
						if (ok.intValue() == 0) {
							formdata.put("okGar", "1");
							formdata.put("CGARANT", CGARANT_BENEIDENT);
							formdata.put("NRIESGO", NRIESGO);
							formdata.put("NORDEN", map.get("PNORDEN"));
						}

					}
					if (opBENEIDENT.equals("ELIMINAR_GAR_BENEF_AMPARO")) {
						PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(conn);
						Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_G(NRIESGO,
								NORDEN_BENEIDENT, CGARANT_BENEIDENT);
						logger.debug(map);
						tratarRETURNyMENSAJES(request, map);
					}

				}
			}

			request.removeAttribute("opBENEIDENT");
			formdata.remove("opBENEIDENT");
			formdata.put("opBENEIDENT", "");
		}

	}

	/**
	 * Lee el numero de la p�liza.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		// Recogemos el n�mero de p�liza para recuperar el ramo
		try {
			opBENEIDENT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN), request, thisAction);

			Map mapGenPoliza = new HashMap();
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
			// Recuperamos el riesgo
			// BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			formdata.put("CMODO", CMODO);
			request.setAttribute("NRIESGO_BENEIDENT", AbstractDispatchAction.topPila(request, "NRIESGO"));
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			// Map mm=
			// pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_COMPROBAR_BENIDGAR(SSEGURO,NRIESGO);
			// logger.debug(mm);
			// Recuperaci�n riesgo

			// BARTOLO INICIO IAXIS-5281 04/02/2021
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal masBen = BigDecimal.ZERO;
			Map map_masBen = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MAS_BENEF", SPRODUC);
			masBen = (BigDecimal) tratarRETURNyMENSAJES(request, map_masBen);
			formdata.put("MAS_BENEF", masBen);

			// BARTOLO FIN
			
			//BJHB INICIO IAXIS-16375 04/04/2022
			Map varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ISPROPERTY",SPRODUC);
			BigDecimal ISPROPERTY = (BigDecimal) tratarRETURNyMENSAJES (request, varParametro);
			formdata.put("ISPROPERTY", ISPROPERTY);
			//BJHB FIN IAXIS-16375 04/04/2022

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
			logger.debug(map);
			map = (Map) tratarRETURNyMENSAJES(request, map);

			// HashMap retorno =(HashMap)map.get("RETURN");
			// logger.debug("----> retorno:"+retorno);
			HashMap bene = (HashMap) map.get("BENEFICIARIO");
			logger.debug("----> bene:" + bene);

			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

			if (isEmpty(bene)) {
				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_INIBENEFICIARIOS(NRIESGO);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map);

				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
				logger.debug("---->2 Bene:" + ((HashMap) map.get("RETURN")).get("BENEFICIARIO"));
				map = (Map) tratarRETURNyMENSAJES(request, map);
			}

			formdata.put("OB_IAX_RIESGOS", map);
			/* Recuperamos el riesgo */
			// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
			List axisctr006_listaClausulasBeneficiario = new ArrayList();
			Map clausulasGrabadas = new HashMap();

			/* PL/SQL */
			/* Recupera los valores introducidos si es anterior */

			map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CLAUBENEFICIARIO(NRIESGO);
			logger.debug(map); // Devuelve null
			clausulasGrabadas = (Map) tratarRETURNyMENSAJES(request, map);

			if (clausulasGrabadas != null) {
				BigDecimal numero = ((!AxisBaseService.isEmpty(clausulasGrabadas.get("SCLABEN")))
						? (BigDecimal) clausulasGrabadas.get("SCLABEN")
						: null);
				String clausulas_especificas = ((!AxisBaseService.isEmpty(clausulasGrabadas.get("TCLAESP")))
						? (String) clausulasGrabadas.get("TCLAESP")
						: null);

				if (!AxisBaseService.isEmpty(numero))
					request.setAttribute("axisctr006_clausulaSeleccionada", numero.toString());

				if (!AxisBaseService.isEmpty(clausulas_especificas))
					request.setAttribute("clausulas_especificas", clausulas_especificas);
			}

			/* PL/SQL */
			/* Recupera la lista de clausulas de beneficiario */
			PAC_IAXPAR_PRODUCTOS pacIaxClausulasBene = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_clausulas = pacIaxClausulasBene.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CLAUBENEFI();
			axisctr006_listaClausulasBeneficiario = (List) tratarRETURNyMENSAJES(request, map_clausulas);

			logger.debug(axisctr006_listaClausulasBeneficiario);

			request.setAttribute("axisctr006_listaClausulasBeneficiario", axisctr006_listaClausulasBeneficiario);

			logger.debug("------- clausulas no obligatorias");
			// BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "SPRODUC");
			Map map_benef = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("NO_CLAU_BENEF", SPRODUC);

			BigDecimal benef = (BigDecimal) tratarRETURNyMENSAJES(request, map_benef);
			logger.debug(map_benef);
			if (!isEmpty(map_benef) && benef.intValue() == 1) {
				formdata.put("CLAUSU_NOOBLIG", new BigDecimal(1));
			} else {
				formdata.put("CLAUSU_NOOBLIG", new BigDecimal(0));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr006Service m_siguiente");
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr006Service m_anterior");
		m_validar(request, thisAction, Constantes.ANTERIOR);
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr006Service m_validar");
		BigDecimal NTIPO = null;
		String TCLABEN = null;
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SCLABEN = getCampoNumerico(request, "selected");
			if (AxisBaseService.isEmpty(SCLABEN))
				SCLABEN = new BigDecimal(0);

			if (AxisBaseService.isEmpty(SCLABEN) || SCLABEN.equals(new BigDecimal(0))) {
				TCLABEN = getCampoTextual(request, "clausulas_especificas");
				NTIPO = new BigDecimal(1);
			} else
				NTIPO = new BigDecimal(2);

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Validar los datos de la pantalla mediante funci�n de PL
			PAC_IAX_PRODUCCION validacion_clausulas = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// llamada a funcion
			// BigDecimal NRIESGO = (BigDecimal) thisAction.topPila(request, "NRIESGO");
			BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
					: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			Map map_grabar = validacion_clausulas.ejecutaPAC_IAX_PRODUCCION__F_GRABABENEFICIARIOS(NRIESGO, NTIPO,
					SCLABEN, TCLABEN);
			// List axisctr006_validalausulasBeneficiario =(List) tratarRETURNyMENSAJES
			// (request, map_grabar);
			logger.debug(map_grabar);

			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map_grabar);

			if (codiRetorn.intValue() == 0) {
				formdata.put("ok", "0");
				// vaya al siguiente...
				if (isEmpty(getCampoTextual(request, "ORIGEN"))) {

					if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla")))
						// No hace falta buscar el forward si estamos en multi-pantalla, lo buscar� la
						// AXCTR028
						request.setAttribute(Constantes.FORWARDACTION,
								AxisCodeWizard.findForward(request, direccion, whoami(this), null));
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr006Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_ajax_buscar_avisos(HttpServletRequest request) {
		logger.debug("Axisctr006Service m_buscar_avisos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this), new String("MODIF_BENE"));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			// request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS"));
			ajax.guardarContenidoFinalAContenedorAjax(m.get("PLSTAVISOS"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr101Service - m�todo m_buscar_avisos", e);

		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
