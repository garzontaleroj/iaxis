package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr191Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public static final BigDecimal CODIGO_INQUILINO = new BigDecimal(1);
	public static final BigDecimal CODIGO_AVALISTA = new BigDecimal(2);

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr191Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			ArrayList<HashMap> listaInquilinos = new ArrayList();
			ArrayList<HashMap> listaAvalistas = new ArrayList();

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista Situaci�n laboral
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800087));
			logger.debug(map);
			listValores.put("lstsitlaboral", tratarRETURNyMENSAJES(request, map));

			// Lista tipo de contrato
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800088));
			logger.debug(map);
			listValores.put("lsttipcontrato", tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_INQUILINO);
			logger.debug("----> inquilinos:" + listaInquilinos);
			formdata.put("axisctr_inquilinos", listaInquilinos);

			listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_AVALISTA);
			logger.debug("----> avalistas:" + listaAvalistas);
			formdata.put("axisctr_avalistas", listaAvalistas);

			BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");

			if (!isEmpty(listaInquilinos) && listaInquilinos.size() > 0 && isEmpty(SPERSON_INQUI)) {
				HashMap mm = (HashMap) listaInquilinos.get(0);
				HashMap inquilino = (HashMap) mm.get("OB_IAX_INQUIAVAL");
				logger.debug("----> inquilino : " + inquilino);
				formdata.put("SPERSON_INQUI", inquilino.get("SPERSON"));
				logger.debug("sperson : " + inquilino.get("SPERSON"));
				formdata.put("obinquilino", inquilino);
				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(inquilino.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				formdata.put("lstdomicilios", direcciones);

				if (!isEmpty(direcciones) && direcciones.size() == 1) {
					HashMap m = (HashMap) direcciones.get(0);
					this.actualizarInquiAval(request, new BigDecimal(String.valueOf(inquilino.get("SPERSON"))),
							new BigDecimal(String.valueOf(m.get("CDOMICI"))), CODIGO_INQUILINO);
					listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_INQUILINO);
					mm = (HashMap) listaInquilinos.get(0);
					inquilino = (HashMap) mm.get("OB_IAX_INQUIAVAL");
				}

				ArrayList l = (ArrayList) inquilino.get("DIRECCIONES");

				logger.debug("--->CDOMICI:" + this.getCdomici(request, l));
				formdata.put("CDOMICI", this.getCdomici(request, l));

			} else {

				if (!isEmpty(SPERSON_INQUI) && !isEmpty(listaInquilinos) && listaInquilinos.size() > 0) {
					Map m = this.getInquiAval(request, listaInquilinos, SPERSON_INQUI);
					logger.debug("LISTA DE TOMADORES BBDD ->" + m);
					// Map m = (HashMap)tratarRETURNyMENSAJES (request, map);
					formdata.put("obinquilino", m);
					Map mm = this.dbGetLstDomiPerson(request, usuario, SPERSON_INQUI);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mm);
					formdata.put("lstdomicilios", direcciones);
					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap lstdir = (HashMap) direcciones.get(0);
						logger.debug("--->lstdir:" + lstdir);
						this.actualizarInquiAval(request, SPERSON_INQUI,
								new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))), CODIGO_INQUILINO);
						listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_INQUILINO);
						m = this.getInquiAval(request, listaInquilinos, SPERSON_INQUI);
						logger.debug("--->inquilino:" + m);
					}
					logger.debug("--->inquilino:" + m);
					ArrayList l = (ArrayList) m.get("DIRECCIONES");
					logger.debug("--->domicilios:" + l);
					logger.debug("--->CDOMICI:" + this.getCdomici(request, l));
					formdata.put("CDOMICI", this.getCdomici(request, l));

				}
			}

			if (!isEmpty(listaAvalistas) && listaAvalistas.size() > 0 && isEmpty(SPERSON_AVAL)) {
				HashMap mm = (HashMap) listaAvalistas.get(0);
				HashMap avalista = (HashMap) mm.get("OB_IAX_INQUIAVAL");
				logger.debug("avalista : " + avalista);
				formdata.put("SPERSON_AVAL", avalista.get("SPERSON"));
				logger.debug("sperson : " + avalista.get("SPERSON"));
				formdata.put("obavalista", avalista);
				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(avalista.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				formdata.put("lstdomiciliosaval", direcciones);

				if (!isEmpty(direcciones) && direcciones.size() == 1) {
					HashMap m = (HashMap) direcciones.get(0);
					this.actualizarInquiAval(request, new BigDecimal(String.valueOf(avalista.get("SPERSON"))),
							new BigDecimal(String.valueOf(m.get("CDOMICI"))), CODIGO_AVALISTA);
					listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_AVALISTA);
					mm = (HashMap) listaAvalistas.get(0);
					avalista = (HashMap) mm.get("OB_IAX_INQUIAVAL");
				}

				ArrayList l = (ArrayList) avalista.get("DIRECCIONES");
				formdata.put("CDOMICIAVAL", this.getCdomici(request, l));

			} else {

				if (!isEmpty(SPERSON_AVAL) && !isEmpty(listaAvalistas) && listaAvalistas.size() > 0) {

					Map m = this.getInquiAval(request, listaAvalistas, SPERSON_AVAL);
					logger.debug("LISTA DE AVALISTAS BBDD ->" + m);
					formdata.put("obavalista", m);
					Map mm = this.dbGetLstDomiPerson(request, usuario, SPERSON_AVAL);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mm);
					formdata.put("lstdomiciliosaval", direcciones);
					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap lstdir = (HashMap) direcciones.get(0);
						this.actualizarInquiAval(request, SPERSON_AVAL,
								new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))), CODIGO_AVALISTA);
						listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_AVALISTA);
						m = this.getInquiAval(request, listaInquilinos, SPERSON_AVAL);
					}

					logger.debug("--->inquilino:" + m);
					ArrayList l = (ArrayList) m.get("DIRECCIONES");
					logger.debug("--->domicilios:" + l);
					logger.debug("--->CDOMICI:" + this.getCdomici(request, l));
					formdata.put("CDOMICIAVAL", this.getCdomici(request, l));

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr191Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Map dbGetLstDomiPerson(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_siguiente");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		guardarTipoPersonaReq(request, thisAction, formdata);

		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void guardarTipoPersonaReq(HttpServletRequest request, AbstractDispatchAction thisAction, Map formdata) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");
		BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_INQUI");

		try {
			ArrayList<HashMap> listaInquilinos = new ArrayList();
			ArrayList<HashMap> listaAvalistas = new ArrayList();
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_INQUILINO);
			listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_AVALISTA);

			for (HashMap mInquilino : listaInquilinos) {
				HashMap mInq = (HashMap) mInquilino.get("OB_IAX_INQUIAVAL");
				BigDecimal CTIPFIG = (BigDecimal) mInq.get("CTIPFIG");

				Map rdoInquilino = dbGrabarInquiAval(request, usuario, (BigDecimal) mInq.get("SPERSON"), NRIESGO,
						(BigDecimal) mInq.get("IINGRMEN"), (BigDecimal) mInq.get("IINGRANUAL"),
						(BigDecimal) mInq.get("CSITLABORAL"), (BigDecimal) mInq.get("CTIPCONTRATO"), CTIPFIG,
						(BigDecimal) mInq.get("DOMICILIO"));
				this.tratarRETURNyMENSAJES(request, rdoInquilino);
				formdata.put("MIS", rdoInquilino.get("MENSAJES"));
				formdata.put("ERROR", rdoInquilino.get("RETURN"));
				if (!isEmpty(rdoInquilino.get("MENSAJES"))) {
					ArrayList MENSAJES = (ArrayList) rdoInquilino.get("MENSAJES");
					logger.debug("antes de a�adir:" + MENSAJES);

					limpiarPersonaReqEnCasoError(request, usuario, formdata, (BigDecimal) mInq.get("SPERSON"), CTIPFIG,
							MENSAJES);
				}
			}

			for (HashMap mAvalista : listaAvalistas) {
				HashMap mAval = (HashMap) mAvalista.get("OB_IAX_INQUIAVAL");
				BigDecimal CTIPFIG = (BigDecimal) mAval.get("CTIPFIG");

				Map rdoInquilino = dbGrabarInquiAval(request, usuario, (BigDecimal) mAval.get("SPERSON"), NRIESGO,
						(BigDecimal) mAval.get("IINGRMEN"), (BigDecimal) mAval.get("IINGRANUAL"),
						(BigDecimal) mAval.get("CSITLABORAL"), (BigDecimal) mAval.get("CTIPCONTRATO"), CTIPFIG,
						(BigDecimal) mAval.get("DOMICILIO"));
				this.tratarRETURNyMENSAJES(request, rdoInquilino);
				formdata.put("MIS", rdoInquilino.get("MENSAJES"));
				formdata.put("ERROR", rdoInquilino.get("RETURN"));
				if (!isEmpty(rdoInquilino.get("MENSAJES"))) {
					ArrayList MENSAJES = (ArrayList) rdoInquilino.get("MENSAJES");
					logger.debug("antes de a�adir:" + MENSAJES);

					limpiarPersonaReqEnCasoError(request, usuario, formdata, (BigDecimal) mAval.get("SPERSON"), CTIPFIG,
							MENSAJES);
				}
			}

		} catch (Exception e) {
			logger.debug("Exception at guardarTipoPersonaReq()");
			e.printStackTrace();
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_anterior");
		m_validar_anterior(request, thisAction, Constantes.ANTERIOR);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza la validaci�n de la pantalla y guarda en FORWARDACTION la siguiente
	 * p�gina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar_anterior(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal direccion) {
		logger.debug("Axisctr191Service m_validar_anterior");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			guardarTipoPersonaReq(request, thisAction, formdata);
			// vaya al siguiente...
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, direccion, whoami(this), null));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
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
		logger.debug("Axisctr191Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDA_INQUIAVAL();
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			} else {
				this.m_form(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar_inquilino(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal gavalista) {
		logger.debug("Axisctr002Service m_guardar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");
			if (!isEmpty(SPERSON_AVAL) && isEmpty(gavalista)) {
				formdata.put("CTIPFIG", CODIGO_AVALISTA);
				// FIXME
				this.m_guardar_avalista(request, thisAction, CODIGO_INQUILINO);
				formdata.put("CTIPFIG", CODIGO_INQUILINO);
			}

			BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal IINGRMEN = getCampoNumerico(request, "IINGRMEN");
			BigDecimal IINGRANUAL = getCampoNumerico(request, "IINGRANUAL");
			BigDecimal CSITLABORAL = getCampoNumerico(request, "CSITLABORAL");
			BigDecimal CTIPCONTRATO = getCampoNumerico(request, "CTIPCONTRATO");
			BigDecimal CTIPFIG = getCampoNumerico(request, "CTIPFIG");
			BigDecimal DOMICILIO = getCampoNumerico(request, "DOMICILIO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map insertInquilinos = this.dbGrabarInquiAval(request, usuario, SPERSON_INQUI, NRIESGO, IINGRMEN,
					IINGRANUAL, CSITLABORAL, CTIPCONTRATO, CTIPFIG, DOMICILIO);
			this.tratarRETURNyMENSAJES(request, insertInquilinos);
			logger.debug("insertInquilinos-->" + insertInquilinos);
			formdata.put("MIS", insertInquilinos.get("MENSAJES"));
			formdata.put("ERROR", insertInquilinos.get("RETURN"));
			if (!isEmpty(insertInquilinos.get("MENSAJES"))) {
				ArrayList MENSAJES = (ArrayList) insertInquilinos.get("MENSAJES");
				logger.debug("antes de a�adir:" + MENSAJES);

				limpiarPersonaReqEnCasoError(request, usuario, formdata, SPERSON_INQUI, CTIPFIG, MENSAJES);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_guardar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void limpiarPersonaReqEnCasoError(HttpServletRequest request, UsuarioBean usuario, Map formdata,
			BigDecimal SPERSON_INQUI, BigDecimal CTIPFIG, ArrayList MENSAJES) throws Exception {
		for (int i = 0; i < MENSAJES.size(); i++) {
			HashMap mensaje = (HashMap) MENSAJES.get(i);
			HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
			BigDecimal TIPERROR = (BigDecimal) OB_IAX_MENSAJES.get("TIPERROR");

			if (TIPERROR.intValue() == 1) {
				eliminaInquiAvalReqDB(request, usuario, formdata, SPERSON_INQUI, CTIPFIG);
			}
		}
	}

	/**
	 * 
	 * @param request
	 * @param usuario
	 * @param formdata
	 * @param SPERSON
	 * @param tipoInquiAval > CTIPFIG
	 * @throws Exception
	 */
	private void eliminaInquiAvalReqDB(HttpServletRequest request, UsuarioBean usuario, Map formdata,
			BigDecimal SPERSON, BigDecimal tipoInquiAval) throws Exception {
		this.dbEliminaInquiAval(request, usuario, SPERSON, tipoInquiAval);
		formdata.put("hayMensaje", "1");
		String sPersona = "";
		limpiarRequestSpersona(request, formdata, tipoInquiAval);
	}

	private void limpiarRequestSpersona(HttpServletRequest request, Map formdata, BigDecimal tipoInquiAval) {
		String sPersona;
		if (tipoInquiAval == CODIGO_INQUILINO) {
			sPersona = "SPERSON_INQUI";
		} else {
			sPersona = "SPERSON_AVAL";
		}
		request.removeAttribute(sPersona);
		formdata.remove(sPersona);
	}

	public void m_guardar_avalista(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal ginquilino) {
		logger.debug("Axisctr191Service m_guardar_avalista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");
			if (!isEmpty(SPERSON_AVAL) && isEmpty(ginquilino)) {
				formdata.put("CTIPFIG", CODIGO_AVALISTA);
			}

			BigDecimal IINGRMENA = getCampoNumerico(request, "IINGRMENA");
			BigDecimal IINGRANUALA = getCampoNumerico(request, "IINGRANUALA");
			BigDecimal CSITLABORALA = getCampoNumerico(request, "CSITLABORALA");
			BigDecimal CTIPCONTRATOA = getCampoNumerico(request, "CTIPCONTRATOA");
			BigDecimal CTIPFIG = getCampoNumerico(request, "CTIPFIG");
			BigDecimal DOMICILIO = getCampoNumerico(request, "DOMICILIOAVAL");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map insertAvalistas = this.dbGrabarInquiAval(request, usuario, SPERSON_AVAL, NRIESGO, IINGRMENA,
					IINGRANUALA, CSITLABORALA, CTIPCONTRATOA, CTIPFIG, DOMICILIO);
			this.tratarRETURNyMENSAJES(request, insertAvalistas);
			logger.debug("insertAvalistas-->" + insertAvalistas);
			formdata.put("MIS", insertAvalistas.get("MENSAJES"));
			formdata.put("ERROR", insertAvalistas.get("RETURN"));
			formdata.put("PPREGUN", insertAvalistas.get("PPREGUN"));
			if (!isEmpty(insertAvalistas.get("MENSAJES"))) {
				ArrayList MENSAJES = (ArrayList) insertAvalistas.get("MENSAJES");
				logger.debug("antes de a�adir:" + MENSAJES);

				limpiarPersonaReqEnCasoError(request, usuario, formdata, SPERSON_AVAL, CTIPFIG, MENSAJES);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_guardar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Map dbGrabarInquiAval(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			BigDecimal NRIESGO, BigDecimal INGMENSUALESI, BigDecimal INGANUALESI, BigDecimal SITLABORALI,
			BigDecimal TIPCONTRATOI, BigDecimal CTIPFIG, BigDecimal CDOMICI) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARINQUIAVAL(null, SPERSON, null, NRIESGO, CTIPFIG, CDOMICI,
						INGMENSUALESI, INGANUALESI, null, null, TIPCONTRATOI, SITLABORALI, null);
		logger.debug(map);
		return map;
	}

	private Map dbEliminaInquiAval(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			BigDecimal CTIPFIG) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAINQUIAVAL(SPERSON, CTIPFIG);
		logger.debug(map);
		return map;
	}

	public void m_cambiar_inquilino(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_cambiar_inquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal SPERSON_ANTIGUO = this.getCampoNumerico(request, "SPERSON_ANTIGUO");

			if (!isEmpty(SPERSON_ANTIGUO)) {

				Map grabarInquilinos = this.dbGrabarInquilinos(request, usuario, SPERSON_INQUI, new BigDecimal(0),
						CODIGO_INQUILINO);
				this.tratarRETURNyMENSAJES(request, grabarInquilinos);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, grabarInquilinos)).intValue() != 1) {
					this.dbEliminaInquiAval(request, usuario, SPERSON_ANTIGUO, CODIGO_INQUILINO);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_cambiar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cambiar_avalista(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_cambiar_avalista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");
			BigDecimal SPERSON_ANTIGUO = this.getCampoNumerico(request, "SPERSON_ANTIGUO");

			if (!isEmpty(SPERSON_ANTIGUO)) {
				Map grabarAvalistas = this.dbGrabarInquilinos(request, usuario, SPERSON_AVAL, new BigDecimal(0),
						CODIGO_AVALISTA);
				this.tratarRETURNyMENSAJES(request, grabarAvalistas);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, grabarAvalistas)).intValue() != 1) {
					this.dbEliminaInquiAval(request, usuario, SPERSON_ANTIGUO, CODIGO_AVALISTA);
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_cambiar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Map dbGrabarInquilinos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			BigDecimal CDOMICI, BigDecimal CTIPFIG) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARINQUIAVAL(null, SPERSON, null, null, CTIPFIG, CDOMICI, null, null,
						null, null, null, null, null);
		logger.debug(map);
		return map;
	}

	private List dbLeeInquiAval(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO, BigDecimal CTIPFIG)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEINQUIAVAL_RIE(NRIESGO, CTIPFIG);
		logger.debug("LISTA DE INQUILINOS BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	private void actualizarInquiAval(HttpServletRequest request, BigDecimal SPERSON, BigDecimal CDOMICI,
			BigDecimal CTIPFIG) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList<HashMap> listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CTIPFIG);
			Map inquilino = this.getInquiAval(request, listaInquilinos, SPERSON);
			logger.debug("LISTA DE TOMADOR BBDD ->" + inquilino);
			logger.debug("CDOMICI ->" + CDOMICI);
			if (!isEmpty(inquilino)) {
				// FIXME >>>>>> CDOMICI.equals("null")
				// null como un String!?!?!?!?
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					ArrayList l = (ArrayList) inquilino.get("DIRECCIONES");
					CDOMICI = this.getCdomici(request, l);
				}
			}

			BigDecimal IINGRMEN = null;
			BigDecimal IINGRANUAL = null;
			BigDecimal CSITLABORAL = null;
			BigDecimal CTIPCONTRATO = null;
			BigDecimal DOMICILIO = null;

			if (CTIPFIG.equals(CODIGO_INQUILINO)) {
				IINGRMEN = getCampoNumerico(request, "IINGRMEN");
				IINGRANUAL = getCampoNumerico(request, "IINGRANUAL");
				CSITLABORAL = getCampoNumerico(request, "CSITLABORAL");
				CTIPCONTRATO = getCampoNumerico(request, "CTIPCONTRATO");
				DOMICILIO = getCampoNumerico(request, "DOMICILIO");
			} else {
				IINGRMEN = getCampoNumerico(request, "IINGRMENA");
				IINGRANUAL = getCampoNumerico(request, "IINGRANUALA");
				CSITLABORAL = getCampoNumerico(request, "CSITLABORALA");
				CTIPCONTRATO = getCampoNumerico(request, "CTIPCONTRATOA");
				DOMICILIO = getCampoNumerico(request, "DOMICILIOAVAL");
			}

			Map grabarInquilinos = this.dbGrabarInquiAval(request, usuario, SPERSON, NRIESGO, IINGRMEN, IINGRANUAL,
					CSITLABORAL, CTIPCONTRATO, CTIPFIG, CDOMICI);

			logger.debug(grabarInquilinos);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_ajax_selected_tomador", e);

		}
	}

	/**
	 * @param tipusPersona  refers to SPERSON_INQUI/SPERSON_AVAL
	 * @param listaPersonas refers to old inquilinos/avalistas
	 */
	private HashMap getInquiAval(HttpServletRequest request, ArrayList<HashMap> listaPersonas,
			BigDecimal tipusPersona) {
		HashMap inquiAvalMap = null;
		if (!isEmpty(listaPersonas) && listaPersonas.size() > 0) {
			for (HashMap persona : listaPersonas) {
				logger.debug("OB_IAX_INQUIAVAL:" + persona.get("OB_IAX_INQUIAVAL"));
				HashMap mapInquiAval = (HashMap) persona.get("OB_IAX_INQUIAVAL");
				BigDecimal SPERSON = new BigDecimal(String.valueOf(mapInquiAval.get("SPERSON")));
				if (tipusPersona.intValue() == SPERSON.intValue()) {
					// FIXME return mapInquiAval; as Temporal
					// inquiAvalMap=mapInquiAval; OR inquiAvalMap.putAll(mapInquiAval);
					return mapInquiAval;
				}
			}
		}
		return inquiAvalMap;
	}

	private BigDecimal getCdomici(HttpServletRequest request, ArrayList<HashMap> domicilios) {
		try {
			BigDecimal CDOMICI = null;
			if (!isEmpty(domicilios) && domicilios.size() > 0) {
				logger.debug("domicilios-->" + domicilios);
				for (HashMap dom : domicilios) {
					logger.debug("dom-->" + dom);
					logger.debug("CDOMICI:" + dom.get("CDOMICI"));
					HashMap m = (HashMap) dom.get("OB_IAX_DIRECCIONES");
					logger.debug("m:" + m);
					logger.debug("m.get('CDOMICI'):" + m.get("CDOMICI"));
					CDOMICI = (BigDecimal) m.get("CDOMICI");
				}

			}
			return CDOMICI;
		} catch (Exception e) {
			return null;
		}

	}

	public void ajax_update_inquilino(HttpServletRequest request) {
		logger.debug("Axisctr191Service AJAX ajax_update_inquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map inquilino = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList<HashMap> listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO,
					CODIGO_INQUILINO);
			inquilino = this.getInquiAval(request, listaInquilinos, SPERSON);
			logger.debug("LISTA DE INQUILINO BBDD ->" + inquilino);
			if (!isEmpty(inquilino)) {
				// FIXME >>>>>> CDOMICI.equals("null")
				// null como un String!?!?!?!?
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					if (!isEmpty(inquilino.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) inquilino.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}

				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(inquilino.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				inquilino.put("LSTDOMICILIOS", direcciones);

			}

			ajax.guardarContenidoFinalAContenedorAjax(inquilino);
			// Grabar a BD
			Map grabarInquilinos = this.dbGrabarInquilinos(request, usuario, SPERSON, CDOMICI, CODIGO_INQUILINO);
			ajax.rellenarPlAContenedorAjax(grabarInquilinos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(inquilino);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_selecciona_inquilino(HttpServletRequest request) {
		logger.debug("Axisctr191Service AJAX ajax_selecciona_inquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map inquilino = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList<HashMap> listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO,
					CODIGO_INQUILINO);
			inquilino = this.getInquiAval(request, listaInquilinos, SPERSON);
			logger.debug("LISTA DE INQUILINO BBDD ->" + inquilino);
			if (!isEmpty(inquilino)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					if (!isEmpty(inquilino.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) inquilino.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}

				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(inquilino.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				inquilino.put("LSTDOMICILIOS", direcciones);

			}

			ajax.guardarContenidoFinalAContenedorAjax(inquilino);
			ajax.rellenarPlAContenedorAjax(inquilino);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(inquilino);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_update_avalista(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX ajax_update_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map avalista = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_AVAL");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList<HashMap> listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO,
					CODIGO_AVALISTA);
			avalista = this.getInquiAval(request, listaAvalistas, SPERSON);
			logger.debug("LISTA DE AVALISTA BBDD ->" + avalista);
			if (!isEmpty(avalista)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// CDOMICI = new BigDecimal(String.valueOf( tomador.get("SELECTEDDOMICI")));
					if (!isEmpty(avalista.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) avalista.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}

				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(avalista.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				avalista.put("LSTDOMICILIOS", direcciones);
			}

			ajax.guardarContenidoFinalAContenedorAjax(avalista);
			// Grabar a BD
			Map grabarAvalistas = this.dbGrabarInquilinos(request, usuario, SPERSON, CDOMICI, CODIGO_AVALISTA);
			ajax.rellenarPlAContenedorAjax(grabarAvalistas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(avalista);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_selecciona_avalista(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX ajax_update_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map avalista = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_AVAL");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList<HashMap> listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO,
					CODIGO_AVALISTA);
			avalista = this.getInquiAval(request, listaAvalistas, SPERSON);
			logger.debug("LISTA DE AVALISTA BBDD ->" + avalista);
			if (!isEmpty(avalista)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// CDOMICI = new BigDecimal(String.valueOf( tomador.get("SELECTEDDOMICI")));
					if (!isEmpty(avalista.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) avalista.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}

				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(avalista.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				avalista.put("LSTDOMICILIOS", direcciones);

			}

			ajax.guardarContenidoFinalAContenedorAjax(avalista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(avalista);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void ajax_guarda_inquilino(HttpServletRequest request) {
		logger.debug("Axisctr191Service ajax_guarda_inquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map insertInquilinos = null;
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal IINGRMEN = getCampoNumerico(request, "IINGRMEN");
			BigDecimal IINGRANUAL = getCampoNumerico(request, "IINGRANUAL");
			BigDecimal CSITLABORAL = getCampoNumerico(request, "CSITLABORAL");
			BigDecimal CTIPCONTRATO = getCampoNumerico(request, "CTIPCONTRATO");
			BigDecimal CTIPFIG = getCampoNumerico(request, "CTIPFIG");
			BigDecimal DOMICILIO = getCampoNumerico(request, "DOMICILIO");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			logger.debug("---> CTIPFIG:" + CTIPFIG);

			insertInquilinos = this.dbGrabarInquiAval(request, usuario, SPERSON, NRIESGO, IINGRMEN, IINGRANUAL,
					CSITLABORAL, CTIPCONTRATO, CTIPFIG, DOMICILIO);
			this.tratarRETURNyMENSAJES(request, insertInquilinos);
			logger.debug("insertInquilinos-->" + insertInquilinos);
			formdata.put("MIS", insertInquilinos.get("MENSAJES"));
			formdata.put("ERROR", insertInquilinos.get("RETURN"));
			formdata.put("PPREGUN", insertInquilinos.get("PPREGUN"));
			if (!isEmpty(insertInquilinos.get("MENSAJES"))) {
				ArrayList MENSAJES = (ArrayList) insertInquilinos.get("MENSAJES");
				logger.debug("antes de a�adir:" + MENSAJES);

				limpiarPersonaReqEnCasoError(request, usuario, formdata, SPERSON, CTIPFIG, MENSAJES);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(insertInquilinos);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void ajax_guarda_avalista(HttpServletRequest request) {
		logger.debug("Axisctr191Service ajax_guarda_avalista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map insertAvalistas = null;
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal IINGRMEN = getCampoNumerico(request, "IINGRMENA");
			BigDecimal IINGRANUAL = getCampoNumerico(request, "IINGRANUALA");
			BigDecimal CSITLABORAL = getCampoNumerico(request, "CSITLABORALA");
			BigDecimal CTIPCONTRATO = getCampoNumerico(request, "CTIPCONTRATOA");
			BigDecimal CTIPFIG = getCampoNumerico(request, "CTIPFIGA");
			BigDecimal DOMICILIO = getCampoNumerico(request, "DOMICILIOAVAL");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			logger.debug("---> CTIPFIG:" + CTIPFIG);

			insertAvalistas = this.dbGrabarInquiAval(request, usuario, SPERSON, NRIESGO, IINGRMEN, IINGRANUAL,
					CSITLABORAL, CTIPCONTRATO, CTIPFIG, DOMICILIO);
			this.tratarRETURNyMENSAJES(request, insertAvalistas);
			logger.debug("insertAvalistas-->" + insertAvalistas);
			formdata.put("MIS", insertAvalistas.get("MENSAJES"));
			formdata.put("ERROR", insertAvalistas.get("RETURN"));
			formdata.put("PPREGUN", insertAvalistas.get("PPREGUN"));
			if (!isEmpty(insertAvalistas.get("MENSAJES"))) {
				ArrayList MENSAJES = (ArrayList) insertAvalistas.get("MENSAJES");
				logger.debug("antes de a�adir:" + MENSAJES);

				limpiarPersonaReqEnCasoError(request, usuario, formdata, SPERSON, CTIPFIG, MENSAJES);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo ajax_update_inquilino", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(insertAvalistas);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private Map dbGetInquilino(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON, BigDecimal CTIPFIG)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_INQUIAVAL(SPERSON, CTIPFIG);
		logger.debug(map);
		return map;
	}

	public void m_actInquilino(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_actInquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_INQUI");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList listaInquilinos = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_INQUILINO);
			HashMap m = this.getInquiAval(request, listaInquilinos, SPERSON_INQUI);
			logger.debug("----> inquilino:" + m);
			BigDecimal CDOMICI = null;
			if (!isEmpty(m.get("DIRECCIONES"))) {
				ArrayList l = (ArrayList) m.get("DIRECCIONES");
				CDOMICI = this.getCdomici(request, l);
			}

			if (!isEmpty(SPERSON_INQUI))
				this.dbGetInquilino(request, usuario, SPERSON_INQUI, CODIGO_INQUILINO);

			if (!isEmpty(CDOMICI)) {
				this.actualizarInquiAval(request, SPERSON_INQUI, CDOMICI, CODIGO_INQUILINO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_actTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actAvalista(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_actAvalista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_AVAL");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			ArrayList listaAvalistas = (ArrayList) this.dbLeeInquiAval(request, usuario, NRIESGO, CODIGO_AVALISTA);
			HashMap m = this.getInquiAval(request, listaAvalistas, SPERSON_AVAL);
			logger.debug("----> avalista:" + m);
			BigDecimal CDOMICI = null;
			if (!isEmpty(m.get("DIRECCIONES"))) {
				ArrayList l = (ArrayList) m.get("DIRECCIONES");
				CDOMICI = this.getCdomici(request, l);
			}

			if (!isEmpty(SPERSON_AVAL))
				this.dbGetInquilino(request, usuario, SPERSON_AVAL, CODIGO_AVALISTA);

			if (!isEmpty(CDOMICI)) {
				this.actualizarInquiAval(request, SPERSON_AVAL, CDOMICI, CODIGO_AVALISTA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_actTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void eliminaInquiAval(HttpServletRequest request, UsuarioBean usuario, Map formdata,
			BigDecimal sPersonInquiAval, BigDecimal tipoInquiAval) throws Exception {
		String sPersona = "";
		BigDecimal tipoPersona = tipoInquiAval;
		limpiarRequestSpersona(request, formdata, tipoInquiAval);

		Map eliminaInquiAval = this.dbEliminaInquiAval(request, usuario, sPersonInquiAval, tipoPersona);
		this.tratarRETURNyMENSAJES(request, eliminaInquiAval);
	}

	public void m_borrarInquilino(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_borrarInquilino");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_INQUI = this.getCampoNumerico(request, "SPERSON_TOMAD");

			if (!isEmpty(SPERSON_INQUI)) {
				eliminaInquiAval(request, usuario, formdata, SPERSON_INQUI, CODIGO_INQUILINO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_borrarTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_borrarAvalista(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr191Service m_borrarAvalista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_AVAL = this.getCampoNumerico(request, "SPERSON_TOMAD");

			if (!isEmpty(SPERSON_AVAL)) {
				eliminaInquiAval(request, usuario, formdata, SPERSON_AVAL, CODIGO_AVALISTA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_borrarTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_delete_session_inquiaval(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX m_ajax_delete_session_tomador");
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			request.getSession().removeAttribute("axisctr_inquilinos");
			request.getSession().removeAttribute("axisctr_avalistas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr191Service - m�todo m_ajax_delete_session_inquiaval", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
