//Revision:# aJ5gIn/FENw5cRmW7sxxfg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SIMULACIONES;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/*****************************************************
	 * MTODOS DE BBDD
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * Lee los tomadores de la pliza.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbLeeTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
		logger.debug("LISTA DE TOMADORES BBDD ->" + map);
		return (List) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Lee el ltimo tomador aadido.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbLeeUltTomadores(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEULTTOMADORES();
		logger.debug("DATOS LTIMO TOMADOR ->" + map);
		return map;
	}

	/**
	 * Recupera un tomador especificado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Inserta un tomador en la BD.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbInsertTomadores(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_INSERTTOMADORES(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Cambia un tomador seleccionado por otro.
	 * 
	 * @param usuario
	 * @param SPERSON2MODIFY
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbCambiaPersonaTomAse(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON2MODIFY,
			BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(SPERSON2MODIFY, SPERSON, "T");
		logger.debug(map);
		return map;
	}

	/**
	 * Cambia AUTOMATICAMENTE un asegurado seleccionado por otro.
	 * 
	 * @param usuario
	 * @param SPERSON2MODIFY
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbCambiaPersonaTomAse2(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON2MODIFY,
			BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(SPERSON2MODIFY, SPERSON, "A");
		logger.debug(map);
		return map;
	}

	/**
	 * Lee la lista de domilios de una persona.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetLstDomiPerson(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve 1 0 segn se permitan o no multiregistros.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbPermitirMultiRegistro(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTITOMADOR();
		logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Elimina el tomador seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbEliminaTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINATOMADOR(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Graba los parmetros CDOMICI e ISASEG (domicilio escogido y si es asegurado o
	 * no) para un tomador seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @param CDOMICI
	 * @param ISASEG
	 * @return Map
	 * @throws Exception
	 */
	private Map dbGrabarTomadores(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			BigDecimal CDOMICI, BigDecimal ISASEG, BigDecimal EXISTEPAG, BigDecimal CAGRUPA) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARTOMADORES(SPERSON, CDOMICI, ISASEG, EXISTEPAG, CAGRUPA);
		logger.debug(map);
		return map;
	}

	/**
	 * Bug 9642-06/05/2009-AMC-Cargamos el tomador segun el parproducto
	 * "TOMADOR_NUEVO_SIMUL" Devuelve 1 0, indica si al contratar una simulacin
	 * deben borrarse los datos del tomador.
	 * 
	 * @param request  El HttpServletRequest que contiene la peticin del cliente
	 *                 web.
	 * @param usuario
	 * @param PSPRODUC
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbActivarTomador(HttpServletRequest request, UsuarioBean usuario, BigDecimal PSPRODUC,
			BigDecimal PSPERSON) throws Exception {
		Map map = new PAC_IAX_SIMULACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SIMULACIONES__F_ACTMODTOM(PSPERSON, PSPRODUC);
		logger.debug("Activar mod tomador?(1->si/0->no) ->" + map);
		return (BigDecimal) map.get("PFICTI");
	}

	/**
	 * Lee el numero de la pliza.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
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

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private BigDecimal getCdomici(HttpServletRequest request, ArrayList<HashMap> domicilios) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			BigDecimal CDOMICI = null;
			if (!isEmpty(domicilios) && domicilios.size() > 0) {
				logger.debug("domicilios-->" + domicilios);
				for (HashMap dom : domicilios) {
					logger.debug("dom-->" + dom);
					logger.debug("CDOMICI:" + dom.get("CDOMICI"));
					HashMap m = (HashMap) dom.get("OB_IAX_DIRECCIONES");
					CDOMICI = new BigDecimal(String.valueOf(m.get("CDOMICI")));
				}

			}
			return CDOMICI;
		} catch (Exception e) {
			return null;
		}

	}

	// INI IAXIS-2085 03/04/2019 AP
	private BigDecimal getCagrupa(HttpServletRequest request, ArrayList<HashMap> agrupacion) {
		try {
			BigDecimal CAGRUPA = null;
			if (!isEmpty(agrupacion) && agrupacion.size() > 0) {
				logger.debug("agrupacion-->" + agrupacion);
				for (HashMap dom : agrupacion) {
					logger.debug("dom-->" + dom);
					logger.debug("CAGRUPA:" + dom.get("CAGRUPA"));
					HashMap m = (HashMap) dom.get("OB_IAX_TOMADORES");
					CAGRUPA = new BigDecimal(String.valueOf(m.get("CAGRUPA")));
				}
			}
			return CAGRUPA;
		} catch (Exception e) {
			return null;
		}
	}
	// FIN IAXIS-2085 03/04/2019 AP

	private HashMap getTomador(HttpServletRequest request, ArrayList<HashMap> tomadores, BigDecimal SPERSON_TOMAD) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap tomador = null;
			if (!isEmpty(tomadores) && tomadores.size() > 0) {
				logger.debug("tomadores-->" + tomadores);
				for (HashMap tom : tomadores) {
					logger.debug("dom-->" + tom);
					logger.debug("OB_IAX_TOMADORES:" + tom.get("OB_IAX_TOMADORES"));
					HashMap m = (HashMap) tom.get("OB_IAX_TOMADORES");
					BigDecimal SPERSON = new BigDecimal(String.valueOf(m.get("SPERSON")));
					if (SPERSON_TOMAD.intValue() == SPERSON.intValue())
						return m;
				}

			}
			return tomador;
		} catch (Exception e) {
			return null;
		}

	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condicin de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			ArrayList<HashMap> listaTomadores = new ArrayList();
			Map mapGenPoliza = new HashMap();
			BigDecimal multiRegistro = this.dbPermitirMultiRegistro(request, usuario);

			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			if (multiRegistro != null)
				formdata.put("axisctr_multi_registro_tomadores", new Integer(multiRegistro.intValue()));

			listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
			formdata.put("axisctr_tomadores", listaTomadores);
			BigDecimal SPERSON_TOMAD = this.getCampoNumerico(request, "SPERSON_TOMAD");

			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

			/* Persona - Proceso de Emision : start */
			if (!isEmpty(listaTomadores) && listaTomadores.size() > 0) {
				HashMap m1 = (HashMap) listaTomadores.get(0);
				HashMap toma = (HashMap) m1.get("OB_IAX_TOMADORES");
				logger.debug("tomador : " + toma);
				formdata.put("SPERSON_TOMAD", toma.get("SPERSON"));
				logger.debug("SPEREAL : " + toma.get("SPEREAL"));
				logger.debug("sperson : " + toma.get("SPERSON"));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = null;
				formdata.put("SPEREAL", toma.get("SPEREAL"));
				BigDecimal SPEREAL = this.getCampoNumerico(request, "SPEREAL");
				// INI IAXIS-2085 03/04/2019 AP
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGRUPA_CONSORCIOS(SPEREAL);
				List LS_AGRUPACION = (List) tratarRETURNyMENSAJES(request, map);
				logger.debug("LS_AGRUPACION -----------------> " + map);
				request.setAttribute("LS_AGRUPACION", !isEmpty(LS_AGRUPACION) ? LS_AGRUPACION : new ArrayList());
				// FIN IAXIS-2085 03/04/2019 AP
			}
			/* Persona - Proceso de Emision : end */

			if (!isEmpty(listaTomadores) && listaTomadores.size() > 0 && isEmpty(SPERSON_TOMAD)) {
				HashMap mm = (HashMap) listaTomadores.get(0);
				HashMap tomador = (HashMap) mm.get("OB_IAX_TOMADORES");
				logger.debug("tomador : " + tomador);
				formdata.put("SPERSON_TOMAD", tomador.get("SPERSON"));
				logger.debug("sperson : " + tomador.get("SPERSON"));
				formdata.put("obtomador", tomador);
				Map mmm = this.dbGetLstDomiPerson(request, usuario,
						new BigDecimal(String.valueOf(tomador.get("SPERSON"))));
				ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
				logger.debug(" Array direcciones : " + direcciones);
				if (!isEmpty(direcciones) && direcciones.size() > 0) {
					formdata.put("lstdomicilios", direcciones);
				}

				if (!isEmpty(direcciones) && direcciones.size() == 1) {
					HashMap m = (HashMap) direcciones.get(0);
					// BUG 26079_137872 - JLTS - 20130319 Ini
					BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
					BigDecimal CDOMICI = (BigDecimal) m.get("CDOMICI");
					BigDecimal ISASEG = (BigDecimal) m.get("ISASEG");
					BigDecimal CEXISTEPAGADOR = (BigDecimal) m.get("CEXISTEPAGADOR");
					BigDecimal CAGRUPA = (BigDecimal) m.get("CAGRUPA");
					logger.debug("CAGRUPA2 : " + CAGRUPA);
					if (!isEmpty(CDOMICI)) {
						this.actualizarTomador(request, SPERSON_TOM, CDOMICI, ISASEG, CEXISTEPAGADOR, CAGRUPA);
					}
					// BUG 26079_137872 - JLTS - 20130319 Fin
					listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
					mm = (HashMap) listaTomadores.get(0);
					tomador = (HashMap) mm.get("OB_IAX_TOMADORES");
				}

				ArrayList l = (ArrayList) tomador.get("DIRECCIONES");
				formdata.put("CDOMICI", this.getCdomici(request, l));
				// IAXIS -3635 - ACL - 22/04/2019
				formdata.put("SPEREAL", tomador.get("SPEREAL"));
				formdata.put("CAGENTE", tomador.get("CAGENTE"));

				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				// BigDecimal SPERSON = (BigDecimal) AbstractDispatchAction.topPila(request,
				// "SPERSON");
				BigDecimal SPERSON = (BigDecimal) tomador.get("SPERSON");
				BigDecimal activartomador = this.dbActivarTomador(request, usuario, SPRODUC, SPERSON);

				logger.debug("------ Borrar tomador:" + activartomador);
				if (activartomador.intValue() == 1) {
					this.dbEliminaTomador(request, usuario, SPERSON);
				}

				List dirLM = (List) tomador.get("DIRECCIONES");
				List conLM = (List) tomador.get("CONTACTOS");
				Map OB_IAX_DIRECCIONES = null;
				Map OB_IAX_CONTACTOS_TEL = null;
				Map OB_IAX_CONTACTOS_EMA = null;
				BigDecimal CDOMICI = this.getCampoNumerico(request, "CDOMICI");

				int cantDir = 0;
				if (!isEmpty(direcciones)) {
					cantDir = direcciones.size();
				}

				Iterator entries = dirLM.iterator();
				while (entries.hasNext()) {
					Map obj = (Map) entries.next();
					OB_IAX_DIRECCIONES = (Map) obj.get("OB_IAX_DIRECCIONES");
				}
				entries = conLM.iterator();

				while (entries.hasNext()) {

					Map obj = (Map) entries.next();
					Map val = (Map) obj.get("OB_IAX_CONTACTOS");

					if (CDOMICI != null) {
						if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")
								&& val.get("CDOMICI") != null
								&& val.get("CDOMICI").toString().equals(CDOMICI.toString())) {
							OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
							break;
						} else if (val.get("CTIPCON") != null && val.get("CDOMICI") != null
								&& val.get("CDOMICI").toString().equals(CDOMICI.toString())
								&& !val.get("CTIPCON").toString().equals("3")) {
							OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
						}
					} else {

						if (cantDir > 1) {
							OB_IAX_CONTACTOS_TEL = null;
							break;
						} else {
							if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")) {
								OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
								break;
							} else if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("6")) {
								OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
							}
						}

					}
				}

				entries = conLM.iterator();

				while (entries.hasNext()) {
					Map obj = (Map) entries.next();
					Map val = (Map) obj.get("OB_IAX_CONTACTOS");
					if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("3")) {
						OB_IAX_CONTACTOS_EMA = (Map) obj.get("OB_IAX_CONTACTOS");
					}

				}

				formdata.put("OB_IAX_DIRECCIONES", OB_IAX_DIRECCIONES);
				formdata.put("OB_IAX_CONTACTOS_TEL", OB_IAX_CONTACTOS_TEL);
				formdata.put("OB_IAX_CONTACTOS_EMA", OB_IAX_CONTACTOS_EMA);

			} else {
				/*
				 * if (!isEmpty(listaTomadores) && listaTomadores.size() > 0 ){ HashMap mm =
				 * (HashMap) listaTomadores.get(0); HashMap tomador =(HashMap)
				 * mm.get("OB_IAX_TOMADORES"); logger.debug("tomador : "+ SPERSON_TOMAD);
				 * formdata.put("SPERSON_TOMAD",tomador.get("SPERSON"));
				 * logger.debug("sperson : "+ SPERSON_TOMAD); formdata.put("obtomador",(HashMap)
				 * mm.get("OB_IAX_TOMADORES")); }
				 */
				if (!isEmpty(SPERSON_TOMAD) && !isEmpty(listaTomadores) && listaTomadores.size() > 0) {

					// Map map = this.dbGetTomador(request,usuario,SPERSON_TOMAD);
					Map m = this.getTomador(request, listaTomadores, SPERSON_TOMAD);
					logger.debug("LISTA DE TOMADORES BBDD 2->" + m);
					// Map m = (HashMap)tratarRETURNyMENSAJES (request, map);
					formdata.put("obtomador", m);
					Map mm = this.dbGetLstDomiPerson(request, usuario, SPERSON_TOMAD);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mm);

					int cantDir = 0;
					if (!isEmpty(direcciones)) {
						cantDir = direcciones.size();
					}

					formdata.put("lstdomicilios", direcciones);
					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap lstdir = (HashMap) direcciones.get(0);
						String valor_pagador = String.valueOf(m.get("CEXISTEPAGADOR"));

						// INICIO IAXIS -2490 - BJHB - 13/10/2020
						BigDecimal CAGRUPA = BigDecimal.ZERO;
						if (!isEmpty(m.get("CAGRUPA"))) {
							CAGRUPA = (BigDecimal) m.get("CAGRUPA");
						}
						// FIN IAXIS -2490 - BJHB - 13/10/2020

						if (valor_pagador != null && !valor_pagador.equals("") && !valor_pagador.equals("null")) {
							this.actualizarTomador(request, SPERSON_TOMAD,
									new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))),
									new BigDecimal(String.valueOf(m.get("ISASEG"))),
									new BigDecimal(String.valueOf(m.get("CEXISTEPAGADOR"))), CAGRUPA);
						} else {
							this.actualizarTomador(request, SPERSON_TOMAD,
									new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))),
									new BigDecimal(String.valueOf(m.get("ISASEG"))), new BigDecimal("0"), CAGRUPA);
						}

						listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
						m = this.getTomador(request, listaTomadores, SPERSON_TOMAD);
					}
					ArrayList l = (ArrayList) m.get("DIRECCIONES");
					formdata.put("CDOMICI", this.getCdomici(request, l));
					// IAXIS -3635 - ACL - 22/04/2019
					formdata.put("SPEREAL", m.get("SPEREAL"));
					formdata.put("CAGENTE", m.get("CAGENTE"));

					BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
					// BigDecimal SPERSON = (BigDecimal) AbstractDispatchAction.topPila(request,
					// "SPERSON");
					BigDecimal SPERSON = (BigDecimal) m.get("SPERSON");
					BigDecimal activartomador = this.dbActivarTomador(request, usuario, SPRODUC, SPERSON);

					logger.debug("------ Borrar tomador:" + activartomador);
					if (activartomador.intValue() == 1) {
						this.dbEliminaTomador(request, usuario, SPERSON);
					}

					List dirLM = (List) m.get("DIRECCIONES");
					List conLM = (List) m.get("CONTACTOS");
					Map OB_IAX_DIRECCIONES = null;
					Map OB_IAX_CONTACTOS_TEL = null;
					Map OB_IAX_CONTACTOS_EMA = null;
					Iterator entries = dirLM.iterator();
					while (entries.hasNext()) {
						Map obj = (Map) entries.next();
						OB_IAX_DIRECCIONES = (Map) obj.get("OB_IAX_DIRECCIONES");
					}
					entries = conLM.iterator();

					BigDecimal CDOMICI = this.getCampoNumerico(request, "CDOMICI");

					while (entries.hasNext()) {

						Map obj = (Map) entries.next();
						Map val = (Map) obj.get("OB_IAX_CONTACTOS");

						if (CDOMICI != null) {
							if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")
									&& val.get("CDOMICI") != null
									&& val.get("CDOMICI").toString().equals(CDOMICI.toString())) {
								OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
								break;
							} else if (val.get("CTIPCON") != null && val.get("CDOMICI") != null
									&& val.get("CDOMICI").toString().equals(CDOMICI.toString())
									&& !val.get("CTIPCON").toString().equals("3")) {
								OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
							}
						} else {

							if (cantDir > 1) {
								OB_IAX_CONTACTOS_TEL = null;
								break;
							} else {
								if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")) {
									OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
									break;
								} else if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("6")) {
									OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
								}
							}

						}
					}

					entries = conLM.iterator();

					while (entries.hasNext()) {
						Map obj = (Map) entries.next();
						Map val = (Map) obj.get("OB_IAX_CONTACTOS");
						if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("3")) {
							OB_IAX_CONTACTOS_EMA = (Map) obj.get("OB_IAX_CONTACTOS");
						}

					}

					formdata.put("OB_IAX_DIRECCIONES", OB_IAX_DIRECCIONES);
					formdata.put("OB_IAX_CONTACTOS_TEL", OB_IAX_CONTACTOS_TEL);
					formdata.put("OB_IAX_CONTACTOS_EMA", OB_IAX_CONTACTOS_EMA);
				}

			}

			/*
			 * List listaTomadores = new ArrayList(); if
			 * (request.getSession().getAttribute("axisctr_tomadores") == null){ //Para
			 * gestionar multiregistro del displayTag (1-Multiregistro, 0->un slo registro)
			 * BigDecimal multiRegistro = this.dbPermitirMultiRegistro(request, usuario);
			 * 
			 * if(multiRegistro != null)
			 * request.getSession().setAttribute("axisctr_multi_registro_tomadores", new
			 * Integer(multiRegistro.intValue()));
			 * 
			 * listaTomadores = this.dbLeeTomadores(request, usuario);
			 * request.getSession().setAttribute("axisctr_tomadores", ((listaTomadores ==
			 * null)? new ArrayList():listaTomadores) ); }else{
			 * 
			 * // Leer tomadores y actualizar ISASEG de lista de sesin listaTomadores =
			 * this.dbLeeTomadores(request, usuario); List oldTomadores = (List)
			 * request.getSession().getAttribute("axisctr_tomadores");
			 * 
			 * if (!isEmpty(listaTomadores)) { for (int i = 0; i < listaTomadores.size();
			 * i++) { Map personaBD = (Map) ((Map)
			 * listaTomadores.get(i)).get("OB_IAX_TOMADORES"); logger.debug(personaBD);
			 * 
			 * if (isEmpty(personaBD)) continue;
			 * 
			 * BigDecimal SPERSON = (BigDecimal) personaBD.get("SPERSON");
			 * 
			 * Map personaSesion = getObjetoDeLista(oldTomadores, SPERSON.toString(),
			 * "SPERSON", "OB_IAX_TOMADORES");
			 * 
			 * 
			 * if (!isEmpty(personaBD)) { if (!isEmpty(personaSesion))
			 * personaSesion.put("ISASEG", personaBD.get("ISASEG")); }
			 * 
			 * } logger.debug("LISTA DE TOMADORES ACTUALIZADA -> " +
			 * request.getSession().getAttribute("axisctr_tomadores")); } }
			 * 
			 * 
			 * if (!Boolean.valueOf(true).equals(request.getAttribute("multiPantalla"))) //
			 * No reordenar si estamos en multipantalla, ya lo haremos en Axisctr003Service
			 * tras cargar las dos tablas gestionarOrdenacionTablas(request);
			 * 
			 * //Bug 9642-06/05/2009-AMC-Cargamos el tomador segun el parproducto
			 * "TOMADOR_NUEVO_SIMUL"
			 * 
			 * if (!isEmpty(listaTomadores)) { BigDecimal SPRODUC = (BigDecimal)
			 * AbstractDispatchAction.topPila(request, "SPRODUC"); // BigDecimal SPERSON =
			 * (BigDecimal) AbstractDispatchAction.topPila(request, "SPERSON"); Map
			 * personaBD = (Map) ((Map) listaTomadores.get(0)).get("OB_IAX_TOMADORES");
			 * BigDecimal SPERSON = (BigDecimal) personaBD.get("SPERSON"); BigDecimal
			 * activartomador = this.dbActivarTomador(request, usuario,SPRODUC,SPERSON);
			 * 
			 * logger.debug("------ Borrar tomador:"+activartomador); if
			 * (activartomador.intValue() == 1){ request.setAttribute("TOMFICTICIO",1); }
			 * else{ request.setAttribute("TOMFICTICIO",0); } }
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * MTODOS DE ACTUALIZACIN
	 *******************************************/
	/*********************************************************************************************************************/
	/**
	 * Obtiene la lista de tomadores de la BD y la condicin de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_guardar_tomador(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_guardar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
			Map insertTomadores = this.dbInsertTomadores(request, usuario, SPERSON_TOM);
			this.tratarRETURNyMENSAJES(request, insertTomadores);
			logger.debug("insertTomadores-->" + insertTomadores);
			formdata.put("MIS", insertTomadores.get("MENSAJES"));
			formdata.put("ERROR", insertTomadores.get("RETURN"));
			formdata.put("PPREGUN", insertTomadores.get("PPREGUN"));
			if (!isEmpty(insertTomadores.get("MENSAJES"))) {
				ArrayList MENSAJES = (ArrayList) insertTomadores.get("MENSAJES");
				logger.debug("antes de aadir:" + MENSAJES);

				for (int i = 0; i < MENSAJES.size(); i++) {
					HashMap mensaje = (HashMap) MENSAJES.get(i);
					// System.out.println("MENSAJES:"+i+" "+mensaje.get("OB_IAX_MENSAJES"));
					HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
					BigDecimal TIPERROR = (BigDecimal) OB_IAX_MENSAJES.get("TIPERROR");

					if (TIPERROR.intValue() == 1) {
						this.dbEliminaTomador(request, usuario, SPERSON_TOM);
						formdata.put("hayMensaje", "1");
						request.removeAttribute("SPERSON_TOMAD");
						formdata.remove("SPERSON_TOMAD");

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_guardar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condicin de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_cambiar_tomador(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_cambiar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			// INI GEK IAXIS-4205 Cambio tomador-asegurado
			// Recibir el objeto poliza de la base de datos en memoria
			Map mapGenPoliza = new HashMap();
			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));
			BigDecimal CRAMO = (BigDecimal) mapGenPoliza.get("CRAMO");
			// FIN GEK IAXIS-4205 Cambio tomador-asegurado

			BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
			BigDecimal SPERSON_ANTIGUO = this.getCampoNumerico(request, "SPERSON_ANTIGUO");

			if (!isEmpty(SPERSON_ANTIGUO)) {

				// Se lo producto es RCE entonces cambia lo assegurado automaticamente
				// INI -IAXIS-15959 - JLTS - 17/08/2021
				// Bug 9642-AMC-Al modificar el tomador que pregunte si es el asegurado segun el
				// parametro MISMO_ASEG
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MISMO_ASEG", SPRODUC);

				BigDecimal pregun = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				// pregun = 1 -> S, siempre, pregun = 2 -> Preguntar (Se evalua despus)
				if (!isEmpty(pregun) && (pregun.intValue() == 1 || pregun.intValue() == 2)) {
					// Cambiar assegurado automaticamente
					Map cambiaPersonaTomase = this.dbCambiaPersonaTomAse2(request, usuario, SPERSON_ANTIGUO,
							SPERSON_TOM);
					this.tratarRETURNyMENSAJES(request, cambiaPersonaTomase);
					logger.debug("cambiaPersonaTomase : " + cambiaPersonaTomase);
				}
				// FIN -IAXIS-15959 - JLTS - 17/08/2021
				// Des-seleccionar ISASEG de la persona antigua
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON_ANTIGUO, new BigDecimal(0),
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));
				// Si hay errores, no intentamos modificar nada, por si acaso.
				this.tratarRETURNyMENSAJES(request, grabarTomadores);
				if (!isEmpty(grabarTomadores) && isEmpty(grabarTomadores.get("MENSAJES"))) {
					Map cambiaPersonaTomAse = this.dbCambiaPersonaTomAse(request, usuario, SPERSON_ANTIGUO,
							SPERSON_TOM);
					logger.debug("cambiaPersonaTomAse-->" + cambiaPersonaTomAse);
					this.tratarRETURNyMENSAJES(request, cambiaPersonaTomAse);

					grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON_TOM, new BigDecimal(0),
							new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));

					if (((BigDecimal) this.tratarRETURNyMENSAJES(request, grabarTomadores)).intValue() != 1) {
						// Bug 9642-AMC-Al modificar el tomador que pregunte si es el asegurado segun el
						// parametro MISMO_ASEG
						// INI ERROR EN INSTALL TRC SE QUITA AMC 18/09/2021
						// BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request,
						// "SPRODUC");
						// Map map = new
						// PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MISMO_ASEG",SPRODUC);

						// BigDecimal pregun = (BigDecimal) tratarRETURNyMENSAJES (request, map);
						// FIN ERROR EN INSTALL TRC SE QUITA AMC 18/09/2021
						logger.debug("------- modificar pregunta:" + pregun);
						if (!isEmpty(pregun) && pregun.intValue() == 2) {
							formdata.put("PPREGUN", new BigDecimal(1));
						} else if (!isEmpty(pregun) && pregun.intValue() == 1
								|| (!isEmpty(pregun) && pregun.intValue() == 4)) {
							logger.debug("-------- cargamos isaseg");
							BigDecimal MARCARASEG = new BigDecimal(1);
							formdata.put("MARCARASEG", MARCARASEG);
							grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON_TOM, new BigDecimal(0),
									new BigDecimal(1), new BigDecimal(0), new BigDecimal(0));
							if (((BigDecimal) this.tratarRETURNyMENSAJES(request, grabarTomadores)).intValue() == 1) {
								this.dbEliminaTomador(request, usuario, SPERSON_TOM);
								formdata.put("hayMensaje", "1");
							}
						}
					} else {
						this.dbEliminaTomador(request, usuario, SPERSON_TOM);
					}

				}
				// INI AXIS-15990 JLTS 27/08/2021
				BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");
				if (pPCMOTMOV.intValue() == 696) {
					Map varParametro = new PAC_IAXPAR_PRODUCTOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("BENEF_TOM", SPRODUC);
					BigDecimal valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);
					BigDecimal SPERSON_BEN = SPERSON_TOM;

					if (valorParamtero.intValue() != 0) {

						Map map1 = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
						ArrayList<HashMap> listaTomadores = (ArrayList) (List) tratarRETURNyMENSAJES(request, map1);

						if (!isEmpty(listaTomadores) && listaTomadores.size() > 0) {
							HashMap m1 = (HashMap) listaTomadores.get(0);
							HashMap toma = (HashMap) m1.get("OB_IAX_TOMADORES");
							SPERSON_BEN = (BigDecimal) toma.get("SPERSON");
						}
					}

					this.guardaBeneficiario(request, SPERSON_BEN);
				}
				// FIN AXIS-15990 JLTS

			}

			/*
			 * Map insertTomadores = this.dbInsertTomadores(request,usuario, SPERSON_TOM);
			 * this.tratarRETURNyMENSAJES(request,insertTomadores);
			 * logger.debug("insertTomadores-->"+insertTomadores);
			 * formdata.put("MIS",insertTomadores.get("MENSAJES"));
			 * formdata.put("ERROR",insertTomadores.get("RETURN"));
			 * 
			 * formdata.put("PPREGUN",insertTomadores.get("PPREGUN"));
			 * formdata.put("PPREGUNx",insertTomadores.get("PPREGUN"));
			 * request.setAttribute("PPREGUN","1");
			 */
			/*
			 * BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD"); BigDecimal
			 * SPERSON2MODIFY = getCampoNumerico(request, "SPERSON_TOMAD2MODIFY");
			 * 
			 * if(SPERSON2MODIFY != null){ // Des-seleccionar ISASEG de la persona antigua
			 * Map grabarTomadores = this.dbGrabarTomadores(request,usuario, SPERSON2MODIFY,
			 * new BigDecimal(0), new BigDecimal(0));
			 * ajax.rellenarPlAContenedorAjax(grabarTomadores);
			 * 
			 * //Si hay errores, no intentamos modificar nada, por si acaso.
			 * if(!isEmpty(grabarTomadores) && isEmpty(grabarTomadores.get("MENSAJES"))){ //
			 * Actualizar persona a lista tomadores Map cambiaPersonaTomAse =
			 * this.dbCambiaPersonaTomAse(request,usuario, SPERSON2MODIFY, SPERSON);
			 * BigDecimal cambiaPersonaTomAseReturn = (BigDecimal)
			 * ajax.rellenarPlAContenedorAjax(cambiaPersonaTomAse); if
			 * (cambiaPersonaTomAseReturn.equals(new BigDecimal(0))){ // Borrar de la lista
			 * de sessin y recargar displayTag de registros List listaTomadores = (List)
			 * request.getSession().getAttribute("axisctr_tomadores");
			 * quitaObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON2MODIFY),
			 * "SPERSON", "OB_IAX_TOMADORES");
			 * 
			 * // DATOS ULTIMO TOMADOR AADIDO
			 * 
			 * Map leeUltTomador = this.dbGetTomador(request,usuario, SPERSON); Map tomador
			 * = (Map) ajax.rellenarPlAContenedorAjax(leeUltTomador);
			 * 
			 * if (!isEmpty(tomador)) { // Recuperar domicilios Map domicilios =
			 * this.dbGetLstDomiPerson(request,usuario, SPERSON); List T_DOMICILOS = (List)
			 * ajax.rellenarPlAContenedorAjax(domicilios);
			 * 
			 * // Ponemos los domicilios en el objeto Tomador para tenerlos relacionados y
			 * recuperarlos en el Ajax tomador.put("T_DOMICILIOS", T_DOMICILOS != null ?
			 * T_DOMICILOS : new ArrayList()); setObjetoALista(listaTomadores, tomador,
			 * "OB_IAX_TOMADORES"); }
			 * 
			 * 
			 * 
			 * 
			 * 
			 * // Bug 9642-AMC-Al modificar el tomador que pregunte si es el asegurado segun
			 * el parametro MISMO_ASEG BigDecimal SPRODUC = (BigDecimal)
			 * AbstractDispatchAction.topPila(request, "SPRODUC"); Map map = new
			 * PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MISMO_ASEG",
			 * SPRODUC);
			 * 
			 * BigDecimal pregun = (BigDecimal) tratarRETURNyMENSAJES (request, map);
			 * logger.debug("------- modificar pregunta:"+pregun); if (!isEmpty(pregun) &&
			 * pregun.intValue() == 2) { request.getSession().setAttribute
			 * ("Preguntar_asegurado",new BigDecimal(1)); } else if (!isEmpty(pregun) &&
			 * pregun.intValue() == 1 || (!isEmpty(pregun) && pregun.intValue() == 4)){
			 * logger.debug("-------- cargamos isaseg"); BigDecimal MARCARASEG = new
			 * BigDecimal(1); tomador.put("MARCARASEG",MARCARASEG); }
			 * 
			 * ajax.guardarContenidoFinalAContenedorAjax(tomador);
			 * request.getSession().setAttribute ("axisctr_tomador", tomador); } } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_cambiar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condicin de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_borrarTomador(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_borrarTomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");

			if (!isEmpty(SPERSON_TOM)) {
				// Des-seleccionar ISASEG de la persona antigua
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON_TOM, new BigDecimal(0),
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));
				// Si hay errores, no intentamos modificar nada, por si acaso.
				if (!isEmpty(grabarTomadores) && isEmpty(grabarTomadores.get("MENSAJES"))) {
					Map eliminaTomador = this.dbEliminaTomador(request, usuario, SPERSON_TOM);
					this.tratarRETURNyMENSAJES(request, eliminaTomador);
					request.removeAttribute("SPERSON_TOMAD");
					formdata.remove("SPERSON_TOMAD");
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_borrarTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Obtiene la lista de tomadores de la BD y la condicin de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la peticin del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_actTomador(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_actTomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
			ArrayList listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
			HashMap m = this.getTomador(request, listaTomadores, SPERSON_TOM);
			BigDecimal CDOMICI = null;
			if (!isEmpty(m.get("DIRECCIONES"))) {
				ArrayList l = (ArrayList) m.get("DIRECCIONES");
				CDOMICI = this.getCdomici(request, l);
			}
			if (!isEmpty(SPERSON_TOM))
				this.dbGetTomador(request, usuario, SPERSON_TOM);

			// BUG: 0027955/0152214 (JSV) - 06/09/2013 - INI
			/*
			 * if (!isEmpty(CDOMICI)){
			 * this.actualizarTomador(request,SPERSON_TOM,CDOMICI,new
			 * BigDecimal(String.valueOf(m.get("ISASEG"))),new
			 * BigDecimal(String.valueOf(m.get("CEXISTEPAGADOR")))); }
			 */

			if (!isEmpty(CDOMICI)) {
				String valor_pagador = String.valueOf(m.get("CEXISTEPAGADOR"));
				if (valor_pagador != null && !valor_pagador.equals("") && !valor_pagador.equals("null")) {
					this.actualizarTomador(request, SPERSON_TOM, CDOMICI,
							new BigDecimal(String.valueOf(m.get("ISASEG"))),
							new BigDecimal(String.valueOf(m.get("CEXISTEPAGADOR"))),
							new BigDecimal(String.valueOf(m.get("CAGRUPA"))));
				} else {
					this.actualizarTomador(request, SPERSON_TOM, CDOMICI,
							new BigDecimal(String.valueOf(m.get("ISASEG"))), new BigDecimal("0"),
							new BigDecimal(String.valueOf(m.get("CAGRUPA"))));
				}
			}

			// BUG: 0027955/0152214 (JSV) - 06/09/2013 - FIN

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_actTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante SPERSON y la
	 * aade en los objetos de sessin axisctr_tomadores (Lista de personas en sesin)
	 * y axisctr_tomador (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_ver_tomador(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		try {
			// Aadir persona a lista tomadores
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");

			Map insertTomadores = this.dbInsertTomadores(request, usuario, SPERSON);
			// BigDecimal insertTomadoresReturn = (BigDecimal)
			// ajax.rellenarPlAContenedorAjax(insertTomadores);

			if (((BigDecimal) insertTomadores.get("RETURN")).intValue() == 0) {
				// Aadir a la lista de sessin y recargar displayTag de registros
				List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");

				// DATOS ULTIMO TOMADOR AADIDO
				Map leeUltTomador = this.dbLeeUltTomadores(request, usuario);
				Map tomador = (Map) ajax.rellenarPlAContenedorAjax(leeUltTomador);

				// Recuperar domicilios
				Map domicilios = this.dbGetLstDomiPerson(request, usuario, SPERSON);
				List T_DOMICILOS = (List) ajax.rellenarPlAContenedorAjax(domicilios);

				// Ponemos los domicilios en el objeto Tomador para tenerlos relacionados y
				// recuperarlos en el Ajax
				tomador.put("T_DOMICILIOS", T_DOMICILOS != null ? T_DOMICILOS : new ArrayList());
				setObjetoALista(listaTomadores, tomador, "OB_IAX_TOMADORES");

				tomador.put("MIS", insertTomadores.get("MENSAJES"));
				tomador.put("ERROR", insertTomadores.get("RETURN"));
				ajax.guardarContenidoFinalAContenedorAjax(tomador);

				request.getSession().setAttribute("axisctr_tomador", tomador);

				if (insertTomadores.get("PPREGUN") != null) {
					if (insertTomadores.get("PPREGUN").equals(new BigDecimal(1)))
						request.getSession().setAttribute("Preguntar_asegurado", new BigDecimal(1));

				}

			} else {
				BigDecimal insertTomadoresReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(insertTomadores);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_ver_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante
	 * SPERSON2MODIFY y la modifica por la persona contenida en SPERSON en los
	 * objetos de sessin axisctr_tomadores (Lista de personas en sesin) y
	 * axisctr_tomador (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_modifica_tomador(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			BigDecimal SPERSON2MODIFY = getCampoNumerico(request, "SPERSON_TOMAD2MODIFY");

			if (SPERSON2MODIFY != null) {
				// Des-seleccionar ISASEG de la persona antigua
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON2MODIFY, new BigDecimal(0),
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));
				ajax.rellenarPlAContenedorAjax(grabarTomadores);

				// Si hay errores, no intentamos modificar nada, por si acaso.
				if (!isEmpty(grabarTomadores) && isEmpty(grabarTomadores.get("MENSAJES"))) {
					// Actualizar persona a lista tomadores
					Map cambiaPersonaTomAse = this.dbCambiaPersonaTomAse(request, usuario, SPERSON2MODIFY, SPERSON);
					BigDecimal cambiaPersonaTomAseReturn = (BigDecimal) ajax
							.rellenarPlAContenedorAjax(cambiaPersonaTomAse);
					if (cambiaPersonaTomAseReturn.equals(new BigDecimal(0))) {
						// Borrar de la lista de sessin y recargar displayTag de registros
						List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");
						quitaObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON2MODIFY), "SPERSON",
								"OB_IAX_TOMADORES");

						// DATOS ULTIMO TOMADOR AADIDO

						Map leeUltTomador = this.dbGetTomador(request, usuario, SPERSON);
						Map tomador = (Map) ajax.rellenarPlAContenedorAjax(leeUltTomador);

						if (!isEmpty(tomador)) {
							// Recuperar domicilios
							Map domicilios = this.dbGetLstDomiPerson(request, usuario, SPERSON);
							List T_DOMICILOS = (List) ajax.rellenarPlAContenedorAjax(domicilios);

							// Ponemos los domicilios en el objeto Tomador para tenerlos relacionados y
							// recuperarlos en el Ajax
							tomador.put("T_DOMICILIOS", T_DOMICILOS != null ? T_DOMICILOS : new ArrayList());
							setObjetoALista(listaTomadores, tomador, "OB_IAX_TOMADORES");
						}

						// Bug 9642-AMC-Al modificar el tomador que pregunte si es el asegurado segun el
						// parametro MISMO_ASEG
						BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
						Map map = new PAC_IAXPAR_PRODUCTOS(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MISMO_ASEG", SPRODUC);

						BigDecimal pregun = (BigDecimal) tratarRETURNyMENSAJES(request, map);
						logger.debug("------- modificar pregunta:" + pregun);
						if (!isEmpty(pregun) && pregun.intValue() == 2) {
							request.getSession().setAttribute("Preguntar_asegurado", new BigDecimal(1));
						} else if (!isEmpty(pregun) && pregun.intValue() == 1
								|| (!isEmpty(pregun) && pregun.intValue() == 4)) {
							logger.debug("-------- cargamos isaseg");
							BigDecimal MARCARASEG = new BigDecimal(1);
							tomador.put("MARCARASEG", MARCARASEG);
						}

						ajax.guardarContenidoFinalAContenedorAjax(tomador);
						request.getSession().setAttribute("axisctr_tomador", tomador);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_modifica_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Borra un tomador pasado por SPERSON de la lista de personas de sesin.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_delete_tomador(HttpServletRequest request) {
		logger.debug("Axisctr002Service m_ajax_delete_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			if (request.getSession().getAttribute("axisctr_tomadores") != null) {
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
				List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");

				// Desseleccionar ISASEG de la persona antigua
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON, new BigDecimal(0),
						new BigDecimal(0), new BigDecimal(0), new BigDecimal(0));
				ajax.rellenarPlAContenedorAjax(grabarTomadores);

				// Si hay errores, no intentamos borrar nada, por si acaso.
				if (!isEmpty(grabarTomadores) && isEmpty(grabarTomadores.get("MENSAJES"))) {
					// Borrar de BD
					Map eliminaTomador = this.dbEliminaTomador(request, usuario, SPERSON);
					BigDecimal eliminaTomadorReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaTomador);

					if (eliminaTomadorReturn.equals(new BigDecimal(0))) {
						// Borrar de la lista de sesin
						ajax.setAjaxContainer(quitaObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON), "SPERSON",
								"OB_IAX_TOMADORES"));
						// Borrar el axisctr_tomador (tomador seleccionado) en caso que est seleccionado
						if ((request.getSession().getAttribute("axisctr_tomador") != null)
								&& ((BigDecimal) ((HashMap) request.getSession().getAttribute("axisctr_tomador"))
										.get("SPERSON")).equals(SPERSON))
							request.getSession().removeAttribute("axisctr_tomador");
						listaTomadores = null;
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_delete_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void actualizarTomador(HttpServletRequest request, BigDecimal SPERSON, BigDecimal CDOMICI,
			BigDecimal ISASEG, BigDecimal EXISTEPAG, BigDecimal CAGRUPA) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Map m= this.dbGetTomador(request,usuario,SPERSON);
			// Map map = this.dbGetTomador(request,usuario,SPERSON_TOMAD);
			ArrayList<HashMap> listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
			Map tomador = this.getTomador(request, listaTomadores, SPERSON);
			logger.debug("LISTA DE TOMADOR BBDD ->" + tomador);
			// Map tomador = (HashMap)tratarRETURNyMENSAJES (request, m);
			if (!isEmpty(tomador)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// CDOMICI = new BigDecimal(String.valueOf( tomador.get("SELECTEDDOMICI")));
					ArrayList l = (ArrayList) tomador.get("DIRECCIONES");
					CDOMICI = this.getCdomici(request, l);

				}

				if (isEmpty(ISASEG) || ISASEG.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					ISASEG = new BigDecimal(String.valueOf(tomador.get("ISASEG")));
				}

				// DF
				if (isEmpty(EXISTEPAG) || EXISTEPAG.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					EXISTEPAG = tomador.get("CEXISTEPAGADOR") != null
							? new BigDecimal(String.valueOf(tomador.get("CEXISTEPAGADOR")))
							: null;
				}
				// IAXIS-2085 03/04/2019 AP
				if (isEmpty(CAGRUPA) || CAGRUPA.equals("null")) {
					// CDOMICI = new BigDecimal(String.valueOf( tomador.get("SELECTEDDOMICI")));
					CAGRUPA = new BigDecimal(String.valueOf(tomador.get("CAGRUPA")));
				}

			}

			// Grabar a BD
			Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON, CDOMICI, ISASEG, EXISTEPAG,
					CAGRUPA);
			logger.debug(grabarTomadores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_selected_tomador", e);

		}
	}

	/**
	 * Al seleccionar un tomador, cargamos sus domicilios en axisctr_tomador.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void ajax_update_tomador(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX ajax_update_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map tomador = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal ISASEG = getCampoNumerico(request, "ISASEG");
			BigDecimal EXISTEPAG = getCampoNumerico(request, "EXPAGADOR"); // TODO : Revisar nombres
			BigDecimal CAGRUPA = getCampoNumerico(request, "CAGRUPA"); // IAXIS-2085 03/04/2019 AP

			// List listaTomadores = (List) request.getSession().getAttribute
			// ("axisctr_tomadores");
			// attomador = getObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON),
			// "SPERSON", "OB_IAX_TOMADORES");

			/*
			 * Map m= this.dbGetTomador(request,usuario,SPERSON); tomador =
			 * (HashMap)tratarRETURNyMENSAJES (request, m);
			 */
			ArrayList<HashMap> listaTomadores = (ArrayList) this.dbLeeTomadores(request, usuario);
			tomador = this.getTomador(request, listaTomadores, SPERSON);
			logger.debug("LISTA DE TOMADOR BBDD ->" + tomador);
			if (!isEmpty(tomador)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// CDOMICI = new BigDecimal(String.valueOf( tomador.get("SELECTEDDOMICI")));
					if (!isEmpty(tomador.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) tomador.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}

				if (isEmpty(ISASEG) || ISASEG.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					ISASEG = new BigDecimal(String.valueOf(tomador.get("ISASEG")));
				}
				if (isEmpty(CAGRUPA) || CAGRUPA.equals("null")) {
					CAGRUPA = null;
				}
			}

			ajax.guardarContenidoFinalAContenedorAjax(tomador);
			// Grabar a BD
			Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON, CDOMICI, ISASEG, EXISTEPAG,
					CAGRUPA);
			ajax.rellenarPlAContenedorAjax(grabarTomadores);

			/*
			 * if (!isEmpty(tomador)) { // Establecer domicilio if (isEmpty(CDOMICI) ||
			 * CDOMICI.equals("null")) { // Si no se lo hemos pasado, establecemos el que ya
			 * tena // si es que tena...sino ser NULL CDOMICI = (BigDecimal)
			 * tomador.get("SELECTEDDOMICI"); } else // Establecer su SELECTEDDOMICI
			 * tomador.put("SELECTEDDOMICI", CDOMICI);
			 * 
			 * // Establecer ISASEG if (isEmpty(ISASEG) || ISASEG.equals("null")) { // Si no
			 * se lo hemos pasado, establecemos el que ya tena // si es que tena...sino ser
			 * NULL ISASEG = (BigDecimal)tomador.get("ISASEG"); } else // Establecer su
			 * ISASEG tomador.put("ISASEG", ISASEG);
			 * 
			 * // Act. lista de sesin setObjetoALista(listaTomadores, tomador,
			 * "OB_IAX_TOMADORES"); // Aadirlo de nuevo
			 * 
			 * ajax.guardarContenidoFinalAContenedorAjax(tomador); // Grabar a BD Map
			 * grabarTomadores = this.dbGrabarTomadores(request,usuario, SPERSON, CDOMICI,
			 * ISASEG); ajax.rellenarPlAContenedorAjax(grabarTomadores);
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_selected_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(tomador);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Al seleccionar un tomador, cargamos sus domicilios en axisctr_tomador.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_selected_tomador(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX m_selected_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map tomador = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");
			tomador = getObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_TOMADORES");
			Map tomadorBD = (Map) ajax.rellenarPlAContenedorAjax(dbGetTomador(request, usuario, SPERSON));

			if (!isEmpty(tomador)) {
				if (!isEmpty(tomadorBD)) {
					// Actualizar las claves del tomador de sesin con las que vienen de BD
					Object[] keys = tomadorBD.keySet().toArray();
					for (int i = 0; i < keys.length; i++) {
						if (tomador.containsKey(keys[i])) {
							tomador.put(keys[i], tomadorBD.get(keys[i]));
						}
					}
				}

				logger.debug("Lista de tomadores: " + listaTomadores);

				// Recuperar domicilios
				Map domicilios = this.dbGetLstDomiPerson(request, usuario, SPERSON);
				List T_DOMICILOS = (List) ajax.rellenarPlAContenedorAjax(domicilios);
				// Ponemos los domicilios en el objeto Tomador para tenerlos relacionados y
				// recuperarlos en el Ajax
				tomador.put("T_DOMICILIOS", T_DOMICILOS != null ? T_DOMICILOS : new ArrayList());

				// Poner el domicilio seleccionado en SELECTEDDOMICI
				if (isEmpty(tomador.get("SELECTEDDOMICI"))) {
					List DIRECCIONES = (List) tomador.get("DIRECCIONES");
					if (!isEmpty(DIRECCIONES)) {
						Map DIRECCION = (Map) DIRECCIONES.get(0);
						if (!isEmpty(DIRECCION)) {
							Map OB_IAX_DIRECCIONES = (Map) DIRECCION.get("OB_IAX_DIRECCIONES");
							if (!isEmpty(OB_IAX_DIRECCIONES) && !isEmpty(OB_IAX_DIRECCIONES.get("CDOMICI")))
								tomador.put("SELECTEDDOMICI", OB_IAX_DIRECCIONES.get("CDOMICI"));
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_selected_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(tomador);
			request.getSession().setAttribute("axisctr_tomador", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Mtodo que sirve para establecer domicilios y marcar/desmarcar si el tomador
	 * es asegurado. Al seleccionar un domicilio, establecemos el SELECTEDDOMICI del
	 * axisctr_tomador. Al marcar/desmarcar la casilla de esAesgurado, establecemos
	 * el parmetro ISASEG.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_selected_domicilio(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX m_ajax_selected_domicilio");
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal ISASEG = getCampoNumerico(request, "ISASEG");
			BigDecimal EXISTEPAG = getCampoNumerico(request, "EXISTEPAG");
			BigDecimal CAGRUPA = getCampoNumerico(request, "CAGRUPA");

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");
			Map tomador = getObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_TOMADORES");

			if (!isEmpty(tomador)) {
				// Establecer domicilio
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					CDOMICI = (BigDecimal) tomador.get("SELECTEDDOMICI");
				} else
					// Establecer su SELECTEDDOMICI
					tomador.put("SELECTEDDOMICI", CDOMICI);

				// Establecer ISASEG
				if (isEmpty(ISASEG) || ISASEG.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					ISASEG = (BigDecimal) tomador.get("ISASEG");
				} else
					// Establecer su ISASEG
					tomador.put("ISASEG", ISASEG);

				// Act. lista de sesin
				setObjetoALista(listaTomadores, tomador, "OB_IAX_TOMADORES"); // Aadirlo de nuevo

				ajax.guardarContenidoFinalAContenedorAjax(tomador);
				// Grabar a BD
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON, CDOMICI, ISASEG, EXISTEPAG,
						CAGRUPA);
				ajax.rellenarPlAContenedorAjax(grabarTomadores);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_selected_domicilio", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_tomador", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Mtodo que sirve para borrar las variables de sesin de la pantalla para que
	 * stas no afecten al flujo que las contienen
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_delete_session_tomador(HttpServletRequest request) {
		logger.debug("Axisctr002Service AJAX m_ajax_delete_session_tomador");
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {
			request.getSession().removeAttribute("axisctr_tomadores");
			request.getSession().removeAttribute("axisctr_tomador");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_delete_session_tomador", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Guarda la pantalla, realiza su validacin y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_siguiente");
		HashMap m = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1)
			m_validar(request, thisAction, Constantes.SIGUIENTE);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Guarda la pantalla, realiza su validacin y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr002Service m_anterior");
		m_validar(request, thisAction, Constantes.ANTERIOR);
	}

	/**
	 * Realiza la validacin de la pantalla y guarda en FORWARDACTION la siguiente
	 * pgina donde vamos a navegar.
	 * 
	 * @param request
	 * @param thisAction
	 * @param direccion
	 */
	private void m_validar(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal direccion) {
		logger.debug("Axisctr002Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// this.m_selected_domicilio(request);

			Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDATOMADORES();
			logger.debug(map);
			BigDecimal codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (codiRetorn.intValue() == 0) {

				map = new PAC_IAX_GESTIONBPM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GESTIONBPM__F_VALIDA_TOMADORBPM();
				logger.debug(map);

				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			}

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			} else {
				this.m_form(request, thisAction);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - mtodo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Funcion que comprueba si se tiene que preguntar si el tomador es el asegurado
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	public void m_ajax_comprobar_pregunta(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		try {

			if (request.getSession().getAttribute("Preguntar_asegurado") != null) {
				Map PREGUNTA = new HashMap();
				PREGUNTA.put("Preguntar_asegurado", request.getSession().getAttribute("Preguntar_asegurado"));
				ajax.guardarContenidoFinalAContenedorAjax(PREGUNTA);
			}

			request.getSession().removeAttribute("Preguntar_asegurado");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_ajax_comprobar_pregunta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Mtodo que sirve para establecer domicilios y marcar/desmarcar si el tomador
	 * es asegurado. Al seleccionar un domicilio, establecemos el SELECTEDDOMICI del
	 * axisctr_tomador. Al marcar/desmarcar la casilla de esAesgurado, establecemos
	 * el parmetro ISASEG.
	 * 
	 * @param request El HttpServletRequest que contiene la peticin del cliente web.
	 */
	private void m_selected_domicilio(HttpServletRequest request) {
		logger.debug("Axisctr002Service  m_selected_domicilio");

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_TOMAD");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal ISASEG = getCampoNumerico(request, "ISASEG");
			BigDecimal EXISTEPAG = getCampoNumerico(request, "EXISTEPAG"); // TODO: revisar nombre
			BigDecimal CAGRUPA = getCampoNumerico(request, "CAGRUPA"); // TODO: revisar nombre
			logger.debug("SPERSON :" + SPERSON);
			logger.debug("CDOMICI :" + CDOMICI);
			logger.debug("ISASEG :" + ISASEG);
			logger.debug("CAGRUPA :" + CAGRUPA);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			List listaTomadores = (List) request.getSession().getAttribute("axisctr_tomadores");
			logger.debug("listaTomadores :" + listaTomadores);
			Map tomador = getObjetoDeLista(listaTomadores, bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_TOMADORES");
			logger.debug("tomador :" + tomador);

			if (!isEmpty(tomador)) {
				// Establecer domicilio
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					CDOMICI = (BigDecimal) tomador.get("SELECTEDDOMICI");
				} else
					// Establecer su SELECTEDDOMICI
					tomador.put("SELECTEDDOMICI", CDOMICI);

				// Establecer ISASEG
				if (isEmpty(ISASEG) || ISASEG.equals("null")) {
					// Si no se lo hemos pasado, establecemos el que ya tena
					// si es que tena...sino ser NULL
					ISASEG = (BigDecimal) tomador.get("ISASEG");
				} else
					// Establecer su ISASEG
					tomador.put("ISASEG", ISASEG);

				// Act. lista de sesin
				setObjetoALista(listaTomadores, tomador, "OB_IAX_TOMADORES"); // Aadirlo de nuevo

				// Grabar a BD
				Map grabarTomadores = this.dbGrabarTomadores(request, usuario, SPERSON, CDOMICI, ISASEG, EXISTEPAG,
						CAGRUPA);
				logger.debug("grabarTomadores : " + grabarTomadores);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - mtodo m_selected_domicilio", e);

		}
	}

	// INI AXIS-15990 JLTS 07/08/2021
	private void guardaBeneficiario(HttpServletRequest request, BigDecimal SPERSON_BENEIDENT) throws Exception {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map configForm = (Map) request.getAttribute(Constantes.CONFIGFORM);
		BigDecimal SIMUL = getCampoNumerico(request, "SIMUL");

		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		// INI IAXIS-4203 CJMR 26/06/2019
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		Map map_benef_ries = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("BENIDENT_RIES", SPRODUC);
		BigDecimal sperson_benef_ries = (BigDecimal) tratarRETURNyMENSAJES(request, map_benef_ries);

		if (!isEmpty(map_benef_ries) && sperson_benef_ries.intValue() != 0) {
			SPERSON_BENEIDENT = sperson_benef_ries;
		}
		// FIN IAXIS-4203 CJMR 26/06/2019

		if (isEmpty(SIMUL) && !isEmpty(SPERSON_BENEIDENT)) {

			try {
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map;
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_INSERT_BENEIDENT_R(NRIESGO, SPERSON_BENEIDENT);

				logger.debug(map);
				BigDecimal ok = (BigDecimal) tratarRETURNyMENSAJES(request, map);
				if (ok.intValue() == 0) {
					formdata.put("okBen", "1");
					formdata.put("NRIESGO", NRIESGO);
					formdata.put("NORDEN", map.get("PNORDEN"));
				}

				if (!isEmpty(map.get("PNORDEN"))) {
					Map ejecuta_get_beneident_r = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_BENEIDENT_R(NRIESGO,
							new BigDecimal(map.get("PNORDEN").toString()));
					logger.debug(ejecuta_get_beneident_r);
					HashMap map_get_beneident_r = (HashMap) tratarRETURNyMENSAJES(request, ejecuta_get_beneident_r,
							false);

					// (NRIESGO, NORDEN, SPERSON_TIT, CTIPBEN, CPAREN, PPARTICIP, CESTADO, CTIPOCON)
					Map ejecuta_set_beneident = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_SET_BENEIDENT_R(NRIESGO,
							new BigDecimal(map.get("PNORDEN").toString()), SPERSON_BENEIDENT, BigDecimal.ONE,
							BigDecimal.ZERO, new BigDecimal("100"), null, null);
					logger.debug(ejecuta_set_beneident);
					BigDecimal map_set_beneident = (BigDecimal) tratarRETURNyMENSAJES(request, ejecuta_set_beneident,
							false);
					logger.debug(map_set_beneident);
					request.setAttribute("grabarOK", map_set_beneident);
					request.setAttribute("BORDEN", map.get("PNORDEN").toString());
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
	// FIN AXIS-15990 JLTS

}
