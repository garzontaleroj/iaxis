//Revision:# /l4ckx+uuCecgF36ldMinA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;

public class Axisctr003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/*****************************************************
	 * M�TODOS DE BBDD
	 ***********************************************/
	/*********************************************************************************************************************/

	/**
	 * Lee los asegurados de la p�liza.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	protected Map dbLeeAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal SPRODUC) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug(map);
		return map;
	}

	/**
	 * Recupera un asegurado especificado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbGetAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_ASEGURADO(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Inserta un asegurado en la BD.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbInsertAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON,
			java.sql.Date FECRETROACT) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_INSERTASEGURADO(SPERSON, FECRETROACT);
		logger.debug(map);
		return map;
	}

	/**
	 * Cambia un asegurado seleccionado por otro.
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
				.ejecutaPAC_IAX_PRODUCCION__F_CAMBIARPERSONATOMASE(SPERSON2MODIFY, SPERSON, "A");
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve 1 � 0 seg�n se permitan o no multiregistros.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbPermitirMultiRegistro(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRMULTIASEG();
		logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * Elimina el asegurado seleccionado.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @return
	 * @throws Exception
	 */
	private Map dbEliminaAsegurado(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON)
			throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAASEGURADO(SPERSON);
		logger.debug(map);
		return map;
	}

	/**
	 * Devuelve la lista de v�nculos asegurado/tomador posibles.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbGetTipoVinculos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPOVINCULOS();
		logger.debug(map);
		return map;
	}

	/**
	 * Graba un asegurado en funci�n de su SPERSON y su CODI de V�nculo.
	 * 
	 * @param usuario
	 * @param SPERSON
	 * @param CODI
	 * @return
	 * @throws Exception
	 */
	private Map dbGrabaAsegurados(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPERSON, BigDecimal CODI,
			java.sql.Date FECRETROACT, BigDecimal CDOMICI, BigDecimal CPAREN) throws Exception {

		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAASEGURADOS(SPERSON, CODI, FECRETROACT, CDOMICI, CPAREN);
		logger.debug(map);

		return map;
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

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_init");
		try {
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Obtiene la lista de asegurados de la BD y la condici�n de si se permite el
	 * multiregistro o no.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			Map mapGenPoliza = new HashMap();
			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			// CJMR 4205
			// BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request,
			// "CRAMO");

			logger.debug("SSEGURO :: " + SSEGURO + " SPRODUC :: " + SPRODUC);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SPRODUC", SPRODUC);
			// Para gestionar multiregistro del displayTag (1-Multiregistro, 0->un s�lo
			// registro)
			BigDecimal multiRegistro = this.dbPermitirMultiRegistro(request, usuario);

			// BARTOLO INICIO
			BigDecimal masAseg = BigDecimal.ZERO;

			// INI CJMR 4205
			Map map_masAseg = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("2_CABEZAS", SPRODUC);
			masAseg = (BigDecimal) tratarRETURNyMENSAJES(request, map_masAseg);
			// FIN CJMR 4205

			formdata.put("MASASE", masAseg);

			// BARTOLO FIN

			mapGenPoliza = this.dbLeePoliza(request);
			formdata.put("NPOLIZA", mapGenPoliza.get("NPOLIZA"));

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}

			if (multiRegistro != null)
				formdata.put("axisctr_multi_registro_asegurados", new Integer(multiRegistro.intValue()));

			BigDecimal asegNoRiesgo = this.dbAsegNoRiesgo(request, usuario, SPRODUC);
			if (asegNoRiesgo != null)
				formdata.put("axisctr_aseg_no_riesgo", new Integer(asegNoRiesgo.intValue()));
			// Carga de asegurados
			ArrayList asegurados;
			asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
					dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			// Inici BUG 29315/165856 - 12/02/2014 - RCL
			if (VisibleTag.esComponenteVisibleDefectoNoVer(request, "axisctr003", "MOD_PER_DATOS_SUPLEM")) {

				if (!isEmpty(asegurados)) {
					for (int i = 0; i < asegurados.size(); i++) {
						HashMap mm = (HashMap) asegurados.get(i);

						HashMap asegurado = (HashMap) mm.get("OB_IAX_ASEGURADOS");
						Map mapval = new PAC_IAX_VALIDACIONES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(
										(BigDecimal) asegurado.get("SPERSON"));
						logger.debug(mapval);
						BigDecimal valaseguradomodificar = (BigDecimal) tratarRETURNyMENSAJES(request, mapval);

						mm.put("permiteModificarAsegurado", valaseguradomodificar);
					}
				}
			}
			// Fi BUG 29315/165856 - 12/02/2014 - RCL
			formdata.put("axisctr_asegurados", ((asegurados == null) ? new ArrayList() : asegurados));

			formdata.put("numAsegurados", (asegurados == null) ? 0 : asegurados.size());

			BigDecimal abrir_axisper001 = this.getCampoNumerico(request, "abrir_axisper001");
			if (abrir_axisper001 == null) {
				formdata.put("abrir_axisper001", new BigDecimal(1));
			}

			BigDecimal SPERSON_ASEG = this.getCampoNumerico(request, "SPERSON_ASEG");

			Map configform = (Map) request.getAttribute(Constantes.CONFIGFORM);
			// El asegurado es el mismo que el tomador
			if (!isEmpty(asegurados) && asegurados.size() > 0 && isEmpty(SPERSON_ASEG)) {
				for (int j = 0; j < asegurados.size(); j++) {
					HashMap mm = (HashMap) asegurados.get(j);
					HashMap asegurado = (HashMap) mm.get("OB_IAX_ASEGURADOS");
					logger.debug("asegurado : " + asegurado);
					formdata.put("SPERSON_ASEG", asegurado.get("SPERSON"));
					formdata.put("obasegurado", asegurado);
					Map mmm = this.dbGetLstDomiPerson(request, usuario,
							new BigDecimal(String.valueOf(asegurado.get("SPERSON"))));
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mmm);
					formdata.put("lstdomiciliosase", direcciones);

					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap m = (HashMap) direcciones.get(0);
						BigDecimal SPERSON_ASE = this.getCampoNumerico(request, "SPERSON_ASEG");
						BigDecimal CDOMICI = (BigDecimal) m.get("CDOMICI");
						BigDecimal CODI = (BigDecimal) m.get("CODI");
						java.sql.Date FECRETROACT = (java.sql.Date) m.get("FECRETROACT");
						BigDecimal CPAREN = asegurado.get("CPAREN") != null
								? new BigDecimal(String.valueOf(asegurado.get("CPAREN")))
								: null;

						if (!isEmpty(CDOMICI)) {
							this.actualizarAsegurado(request, SPERSON_ASE, CDOMICI, CODI, FECRETROACT, NRIESGO, SPRODUC,
									CPAREN);
						}
						asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
								dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
						mm = (HashMap) asegurados.get(j);
						asegurado = (HashMap) mm.get("OB_IAX_ASEGURADOS");
					}

					ArrayList l = (ArrayList) asegurado.get("DIRECCIONES");
					BigDecimal aux = this.getCdomici(request, direcciones);
					if (this.getCdomici(request, l) == null) {
						String domicilioString = this.getCampoTextual(request, "domicilio");
						if (domicilioString != null && !isEmpty(domicilioString)) {
							BigDecimal domicilio = new BigDecimal(new Double(domicilioString));
							formdata.put("CDOMICI_ASEG", domicilioString);

							// formdata.get("domicilio")
							if (!isEmpty(direcciones)) {
								int i = 0;
								for (i = 0; i < direcciones.size(); i++) {
									HashMap dir = (HashMap) direcciones.get(i);
									BigDecimal domicilio2 = (BigDecimal) dir.get("CDOMICI");
									if (domicilio != null && domicilio2 != null && domicilio2.equals(domicilio)) {
										BigDecimal codi = (BigDecimal) dir.get("CODI");
										java.sql.Date fec = (java.sql.Date) dir.get("FECRETROACT");
										BigDecimal CPAREN = asegurado.get("CPAREN") != null
												? new BigDecimal(String.valueOf(asegurado.get("CPAREN")))
												: null;
										this.actualizarAsegurado(request, (BigDecimal) asegurado.get("SPERSON"),
												domicilio, codi, fec, NRIESGO, SPRODUC, CPAREN);
									}
								}
							}
						}

					} else {
						formdata.put("CDOMICI_ASEG", this.getCdomici(request, l));
					}
					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) this.tratarRETURNyMENSAJES(request, getTipoVinculos);

					if (!isEmpty(configform.get("axisctr003__CPARENTESCOHID__valordefecto"))) {
						// Recuperar parentescos
						Map valores_parentesco = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(
								new BigDecimal(1054),
								"catribu in(" + configform.get("axisctr003__CPARENTESCOHID__valordefecto") + ")");
						List lista_valoresparentesco = (List) tratarRETURNyMENSAJES(request, valores_parentesco, false);
						formdata.put("lista_detvaloresparentesco", lista_valoresparentesco);
					} else {
						// Recuperar parentescos
						Map valores_parentesco = pac_iax_listvalores
								.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1054));
						List lista_valoresparentesco = (List) tratarRETURNyMENSAJES(request, valores_parentesco, false);
						formdata.put("lista_detvaloresparentesco", lista_valoresparentesco);
					}
					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
					if (VisibleTag.esComponenteVisibleDefectoNoVer(request, "axisctr003", "MOD_PER_DATOS_SUPLEM")) {
						Map mapval = new PAC_IAX_VALIDACIONES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(
										(BigDecimal) asegurado.get("SPERSON"));
						logger.debug(mapval);
						BigDecimal valaseguradomodificar = (BigDecimal) tratarRETURNyMENSAJES(request, mapval);
						asegurado.put("permiteModificarAsegurado", valaseguradomodificar);
					}
					formdata.put("obasegurado", asegurado);
					/* Consulta de los contactos del asegurado */
					// INI-IAXIS-2065 CESS 05/04/2019
					getContactos(request, asegurado);
					// END-IAXIS-2065 CESS
				}

			} else {
				// El asegurado no es el mismo que el tomador
				if (!isEmpty(SPERSON_ASEG) && !isEmpty(asegurados) && asegurados.size() > 0) {

					Map m = this.getAsegurado(request, asegurados, SPERSON_ASEG);
					logger.debug("LISTA DE Asegurados BBDD ->" + m);

					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) this.tratarRETURNyMENSAJES(request, getTipoVinculos);
					// Recuperar parentescos

					if (!isEmpty(configform.get("axisctr003__CPARENTESCOHID__valordefecto"))) {
						Map valores_parentesco = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(
								new BigDecimal(1054),
								"catribu in(" + configform.get("axisctr003__CPARENTESCOHID__valordefecto") + ")");
						List lista_valoresparentesco = (List) tratarRETURNyMENSAJES(request, valores_parentesco, false);
						formdata.put("lista_detvaloresparentesco", lista_valoresparentesco);
					} else {
						// Recuperar parentescos
						Map valores_parentesco = pac_iax_listvalores
								.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1054));
						List lista_valoresparentesco = (List) tratarRETURNyMENSAJES(request, valores_parentesco, false);
						formdata.put("lista_detvaloresparentesco", lista_valoresparentesco);
					}
					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					m.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

					if (VisibleTag.esComponenteVisibleDefectoNoVer(request, "axisctr003", "MOD_PER_DATOS_SUPLEM")) {

						Map mapval = new PAC_IAX_VALIDACIONES(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS_NOMODIFCAR(SPERSON_ASEG);
						logger.debug(mapval);
						BigDecimal valaseguradomodificar = (BigDecimal) tratarRETURNyMENSAJES(request, mapval);
						m.put("permiteModificarAsegurado", valaseguradomodificar);
					}
					formdata.put("obasegurado", m);

					Map mm = this.dbGetLstDomiPerson(request, usuario, SPERSON_ASEG);
					ArrayList direcciones = (ArrayList) tratarRETURNyMENSAJES(request, mm);
					formdata.put("lstdomiciliosase", direcciones);
					if (!isEmpty(direcciones) && direcciones.size() == 1) {
						HashMap lstdir = (HashMap) direcciones.get(0);
						BigDecimal CODI = (BigDecimal) lstdir.get("CODI");
						java.sql.Date FECRETROACT = (java.sql.Date) lstdir.get("FECRETROACT");
						BigDecimal CPAREN = m.get("CPAREN") != null ? new BigDecimal(String.valueOf(m.get("CPAREN")))
								: null;
						this.actualizarAsegurado(request, SPERSON_ASEG,
								new BigDecimal(String.valueOf(lstdir.get("CDOMICI"))), CODI, FECRETROACT, NRIESGO,
								SPRODUC, CPAREN);
						asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
								dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));
						m = this.getAsegurado(request, asegurados, SPERSON_ASEG);
					}
					ArrayList l = (ArrayList) m.get("DIRECCIONES");
					formdata.put("CDOMICI_ASEG", this.getCdomici(request, l));
					// INI-IAXIS-2065 CESS 05/04/2019
					getContactos(request, m);

				}
			}

			Map varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ASEG_BENEF", SPRODUC);
			BigDecimal valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);

			if (valorParamtero.intValue() != 0) {
				asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
						dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));

				HashMap mm = (HashMap) asegurados.get(0);

				HashMap asegurado = (HashMap) mm.get("OB_IAX_ASEGURADOS");

				SPERSON_ASEG = (BigDecimal) asegurado.get("SPERSON");
			}

			// INI CJMR IAXIS-4205 07/08/2019
			Map map_benef_ries = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("BENIDENT_RIES", SPRODUC);
			BigDecimal sperson_benef_ries = (BigDecimal) tratarRETURNyMENSAJES(request, map_benef_ries);

			if (!(!isEmpty(pPCMOTMOV) && pPCMOTMOV.intValue() == 230 && sperson_benef_ries.intValue() != 0)) {
				varParametro = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("BENEF_TOM", SPRODUC);
				valorParamtero = (BigDecimal) tratarRETURNyMENSAJES(request, varParametro);
				BigDecimal SPERSON_BEN = SPERSON_ASEG;

				if (valorParamtero.intValue() != 0) {

					Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_LEETOMADORES();
					ArrayList<HashMap> listaTomadores = (ArrayList) (List) tratarRETURNyMENSAJES(request, map);

					if (!isEmpty(listaTomadores) && listaTomadores.size() > 0) {
						HashMap m1 = (HashMap) listaTomadores.get(0);
						HashMap toma = (HashMap) m1.get("OB_IAX_TOMADORES");
						SPERSON_BEN = (BigDecimal) toma.get("SPERSON");
					}
				}

				this.guardaBeneficiario(request, SPERSON_BEN);
				// END-IAXIS-2065 CESS
			}
			// FIN CJMR IAXIS-4205 07/08/2019

			gestionarOrdenacionTablas(request);

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

//INI-IAXIS-2065 CESS 05/04/2019
	private void getContactos(HttpServletRequest request, Map m) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

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

		BigDecimal CDOMICI = this.getCampoNumerico(request, "CDOMICI_ASEG");

		while (entries.hasNext()) {

			Map obj = (Map) entries.next();
			Map val = (Map) obj.get("OB_IAX_CONTACTOS");

			if (CDOMICI != null) {
				if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")
						&& val.get("CDOMICI") != null && val.get("CDOMICI").toString().equals(CDOMICI.toString())) {
					OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
					break;
				} else if (val.get("CTIPCON") != null && val.get("CDOMICI") != null
						&& val.get("CDOMICI").toString().equals(CDOMICI.toString())
						&& !val.get("CTIPCON").toString().equals("3")) {
					OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
				}
			} else {

				if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("1")) {
					OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");
					break;
				} else if (val.get("CTIPCON") != null && val.get("CTIPCON").toString().equals("6")) {
					OB_IAX_CONTACTOS_TEL = (Map) obj.get("OB_IAX_CONTACTOS");

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

		formdata.put("OB_IAX_DIRECCIONES_ASE", OB_IAX_DIRECCIONES);
		formdata.put("OB_IAX_CONTACTOS_TEL_ASE", OB_IAX_CONTACTOS_TEL);
		formdata.put("OB_IAX_CONTACTOS_EMA_ASE", OB_IAX_CONTACTOS_EMA);

	}
//END-IAXIS-2065

	private BigDecimal getCdomici(HttpServletRequest request, ArrayList<HashMap> domicilios) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			BigDecimal CDOMICI = null;
			if (!isEmpty(domicilios) && domicilios.size() > 0) {
				logger.debug("domicilios-->" + domicilios);
				for (HashMap dom : domicilios) {
					logger.debug("dom-->" + dom);
					logger.debug("CDOMICI_ASEG:" + dom.get("CDOMICI"));
					HashMap m = (HashMap) dom.get("OB_IAX_DIRECCIONES");
					CDOMICI = new BigDecimal(String.valueOf(m.get("CDOMICI")));
				}

			}
			return CDOMICI;
		} catch (Exception e) {
			return null;
		}
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
	 * Devuelve 1 � 0 seg�n se permitan o no multiregistros.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbAsegNoRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("ASEG_NO_RIESGO", SPRODUC);
		logger.debug("MULTIREGISTROS?(1->si/0->no) ->" + map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	private HashMap getAsegurado(HttpServletRequest request, ArrayList<HashMap> asegurados, BigDecimal SPERSON_ASEG) {

		// DIRECCIONES=[{OB_IAX_DIRECCIONES={
		try {
			HashMap ASEGURADO = null;
			if (!isEmpty(asegurados) && asegurados.size() > 0) {
				logger.debug("asegurados-->" + asegurados);
				for (HashMap aseg : asegurados) {
					logger.debug("aseg-->" + aseg);
					logger.debug("OB_IAX_ASEGURADOS:" + aseg.get("OB_IAX_ASEGURADOS"));
					HashMap m = (HashMap) aseg.get("OB_IAX_ASEGURADOS");
					BigDecimal SPERSON = new BigDecimal(String.valueOf(m.get("SPERSON")));
					if (SPERSON_ASEG.intValue() == SPERSON.intValue())
						return m;
				}

			}
			return ASEGURADO;
		} catch (Exception e) {
			return null;
		}

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante SPERSON y la
	 * a�ade en los objetos de sessi�n axisctr_asegurados (Lista de personas en
	 * sesi�n) y axisctr_asegurado (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr003Service m_ajax_ver_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			java.sql.Date FECRETROACT = stringToSqlDate(getCampoTextual(request, "FECRETROACT"));
			// A�adir persona a lista asegurados
			Map insertAsegurado = this.dbInsertAsegurado(request, usuario, SPERSON, FECRETROACT);
			BigDecimal insertAseguradoReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(insertAsegurado);
			if (insertAseguradoReturn.equals(new BigDecimal(0))) {
				// A�adir a la lista de sessi�n y recargar displayTag de registros
				Map leeAsegurados = this.dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC);
				List asegurados = (List) ajax.rellenarPlAContenedorAjax(leeAsegurados);
				Map asegurado = new HashMap();

				// RECUPERAR DATOS ULTIMO ASEGURADO A�ADIDO
				if (!isEmpty(asegurados)) {
					asegurado = (Map) asegurados.get(asegurados.size() - 1);
					ajax.rellenarPlAContenedorAjax(asegurado);

					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					if (!isEmpty(asegurado))
						asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}

				request.getSession().setAttribute("axisctr_asegurados",
						((asegurados == null) ? new ArrayList() : asegurados));
				request.getSession().setAttribute("axisctr_asegurado", asegurado);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_ajax_ver_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Recupera una persona seleccionada del modal axisper001 mediante
	 * SPERSON2MODIFY y la modifica por la persona contenida en SPERSON en los
	 * objetos de sessi�n axisctr_asegurados (Lista de personas en sesi�n) y
	 * axisctr_asegurado (Map que representa a una persona seleccionada).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_modificar_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr003Service m_ajax_modificar_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal SPERSON2MODIFY = getCampoNumerico(request, "SPERSON_ASEG2MODIFY");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(SPERSON2MODIFY)) {
				// Actualizar persona a lista tomadores
				Map cambiaPersonaTomase = this.dbCambiaPersonaTomAse(request, usuario, SPERSON2MODIFY, SPERSON);
				BigDecimal cambiaPersonaTomaseReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(cambiaPersonaTomase);
				if (cambiaPersonaTomaseReturn.equals(new BigDecimal(0))) {
					// A�adir a la lista de sessi�n y recargar displayTag de registros
					Map leeAsegurados = this.dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC);
					List asegurados = (List) ajax.rellenarPlAContenedorAjax(leeAsegurados);

					// DATOS ULTIMO ASEGURADO A�ADIDO
					Map getAsegurado = this.dbGetAsegurado(request, usuario, SPERSON);
					Map asegurado = (Map) ajax.rellenarPlAContenedorAjax(getAsegurado);

					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);

					request.getSession().setAttribute("axisctr_asegurados",
							((asegurados == null) ? new ArrayList() : asegurados));
					request.getSession().setAttribute("axisctr_asegurado", asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_ajax_modificar_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
	public void m_guardar_asegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_guardar_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			java.sql.Date FECRETROACT = stringToSqlDate(getCampoTextual(request, "FECRETROACT"));

			Map insertAsegurado = this.dbInsertAsegurado(request, usuario, SPERSON, FECRETROACT);
			this.tratarRETURNyMENSAJES(request, insertAsegurado);
			logger.debug(insertAsegurado);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_guardar_tomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_actAsegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal SPERSON_ASEG = this.getCampoNumerico(request, "SPERSON_ASEG");
			/*
			 * ArrayList listaAsegurados = (ArrayList)this.dbLeeAsegurados(request,
			 * usuario,NRIESGO,SPRODUC); HashMap m =
			 * this.getAsegurado(request,listaAsegurados,SPERSON_ASEG);
			 */
			if (!isEmpty(SPERSON_ASEG))
				this.dbGetAsegurado(request, usuario, SPERSON_ASEG);

			// Map aseguradoBD = (Map)
			// ajax.rellenarPlAContenedorAjax(dbGetAsegurado(request,usuario, SPERSON));

			/*
			 * BigDecimal SPERSON_TOM = this.getCampoNumerico(request, "SPERSON_TOMAD");
			 * ArrayList listaTomadores = (ArrayList)this.dbLeeTomadores(request, usuario);
			 * HashMap m = this.getTomador(request,listaTomadores,SPERSON_TOM); BigDecimal
			 * CDOMICI = null; if (!isEmpty(m.get("DIRECCIONES"))){ ArrayList l =
			 * (ArrayList)m.get("DIRECCIONES"); CDOMICI = this.getCdomici(request,l); } if
			 * (!isEmpty(SPERSON_TOM)) this.dbGetTomador(request,usuario,SPERSON_TOM);
			 * 
			 * if (!isEmpty(CDOMICI)){
			 * this.actualizarTomador(request,SPERSON_TOM,CDOMICI,new
			 * BigDecimal(String.valueOf(m.get("ISASEG")))); }
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_actTomador", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
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
	public void m_cambiar_asegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_cambiar_tomador");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON_ASEG = this.getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal SPERSON_ANTIGUO = this.getCampoNumerico(request, "SPERSON_ANTIGUO");

			if (!isEmpty(SPERSON_ANTIGUO)) {
				Map cambiaPersonaTomase = this.dbCambiaPersonaTomAse(request, usuario, SPERSON_ANTIGUO, SPERSON_ASEG);
				this.tratarRETURNyMENSAJES(request, cambiaPersonaTomase);
				logger.debug("cambiaPersonaTomase : " + cambiaPersonaTomase);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_cambiar_asegurado", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Borra un asegurado pasado por SPERSON de la lista de personas de sesi�n.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_delete_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr003Service m_ajax_delete_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			if (!isEmpty(request.getSession().getAttribute("axisctr_asegurados"))) {
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
				List asegurados = (List) request.getSession().getAttribute("axisctr_asegurados");

				// Borrar de BD
				Map eliminaAsegurado = this.dbEliminaAsegurado(request, usuario, SPERSON);
				BigDecimal eliminaAseguradoReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaAsegurado);

				if (eliminaAseguradoReturn.equals(new BigDecimal(0))) {
					// Borrar de la lista de sesi�n
					ajax.guardarContenidoFinalAContenedorAjax(quitaObjetoDeLista(asegurados,
							bigDecimalToString(SPERSON), "SPERSON", "OB_IAX_ASEGURADOS"));
					request.getSession().setAttribute("axisctr_asegurados",
							((asegurados == null) ? new ArrayList() : asegurados));
					asegurados = null;
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_ajax_delete_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_borrarAsegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_borrarAsegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		int traza = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this), new String("MODIF_ASEG"));
			logger.debug(m);
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				m = this.f_Get_Avisos_delaseg(request, this.whoami(this), "DELASEG");

				pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

				if (pRETURN != null && pRETURN.intValue() != 1) {
					BigDecimal SPERSON_ASEG = this.getCampoNumerico(request, "SPERSON_ASEG");

					Map eliminaAsegurado = this.dbEliminaAsegurado(request, usuario, SPERSON_ASEG);
					this.tratarRETURNyMENSAJES(request, eliminaAsegurado);
					request.removeAttribute("SPERSON_ASEG");
					formdata.remove("SPERSON_ASEG");

					// INI-IAXIS-2132 CES 05/04/2019
					BigDecimal NRIESGO = isEmpty(AbstractDispatchAction.topPila(request, "NRIESGO")) ? new BigDecimal(1)
							: (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
					BigDecimal NORDEN_BENEIDENT = isEmpty(AbstractDispatchAction.topPila(request, "NORDEN"))
							? new BigDecimal(1)
							: (BigDecimal) AbstractDispatchAction.topPila(request, "NORDEN");

					PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_ELIMINAR_BENEIDENT_R(NRIESGO,
							NORDEN_BENEIDENT);
					logger.debug(map);
					tratarRETURNyMENSAJES(request, map);
					// END-IAXIS-2132 CES 05/04/2019
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_borrarAsegurado", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Al seleccionar un asegurado, cargamos sus v�nculos en axisctr_asegurado.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr003Service AJAX m_selected_asegurado");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			if (request.getSession().getAttribute("axisctr_asegurados") != null) {
				// Recuperar lista asegurados y objeto asegurado
				List listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
				Map asegurado = getObjetoDeLista(listaAsegurados, bigDecimalToString(SPERSON), "SPERSON",
						"OB_IAX_ASEGURADOS");
				Map aseguradoBD = (Map) ajax.rellenarPlAContenedorAjax(dbGetAsegurado(request, usuario, SPERSON));

				if (!isEmpty(asegurado)) {
					if (!isEmpty(aseguradoBD)) {
						// Actualizar las claves del asegurado de sesi�n con las que vienen de BD
						Object[] keys = aseguradoBD.keySet().toArray();
						for (int i = 0; i < keys.length; i++) {
							if (asegurado.containsKey(keys[i])) {
								asegurado.put(keys[i], aseguradoBD.get(keys[i]));
							}
						}
					}
					// Recuperar v�nculos
					Map getTipoVinculos = this.dbGetTipoVinculos(request, usuario);
					List vinculos = (List) ajax.rellenarPlAContenedorAjax(getTipoVinculos);

					// Ponemos los vinculos en el objeto Asegurado para tenerlos relacionados y
					// recuperarlos en el Ajax
					asegurado.put("T_VINCULOS", vinculos != null ? vinculos : new ArrayList());

					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que sirve para establecer el v�nculo seleccionado (CTVINCULO) al
	 * objeto asegurado.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_selected_vinculo_tomador(HttpServletRequest request) {
		logger.debug("Axisctr003Service AJAX m_ajax_selected_vinculo_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal CODI = getCampoNumerico(request, "CODI");
			java.sql.Date FECRETROACT = stringToSqlDate(getCampoTextual(request, "FECRETROACT"));
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI_ASEG");
			BigDecimal CPAREN = getCampoNumerico(request, "CPARENTESCO");

			if (!isEmpty(SPERSON) && !isEmpty(request.getSession().getAttribute("axisctr_asegurado"))) {
				Map grabaAsegurados = this.dbGrabaAsegurados(request, usuario, SPERSON, CODI, FECRETROACT, CDOMICI,
						CPAREN);
				BigDecimal grabaAseguradosReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(grabaAsegurados);

				if (grabaAseguradosReturn.equals(new BigDecimal(0))) {
					Map asegurado = (Map) request.getSession().getAttribute("axisctr_asegurado");
					asegurado.put("CTVINCULO", CODI);
					setObjetoALista((List) request.getSession().getAttribute("axisctr_asegurados"), asegurado,
							"OB_IAX_ASEGURADOS");
					ajax.guardarContenidoFinalAContenedorAjax(asegurado);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_actualiza_asegurado(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr003Service m_actualiza_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal CODI = getCampoNumerico(request, "CODI");
			BigDecimal CTVINCULO = getCampoNumerico(request, "CTVINCULO");
			java.sql.Date FECRETROACT = stringToSqlDate(getCampoTextual(request, "FECRETROACT"));
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI_ASEG");
			BigDecimal CPAREN = getCampoNumerico(request, "CPARENTESCO");

			logger.debug("FECRETROACT=" + FECRETROACT + ",CTVINCULO=" + CTVINCULO + ",SPERSON=" + SPERSON + ",CDOMICI="
					+ CDOMICI);

			Map grabaAsegurados = this.dbGrabaAsegurados(request, usuario, SPERSON, CTVINCULO, FECRETROACT, CDOMICI,
					CPAREN);
			this.tratarRETURNyMENSAJES(request, grabaAsegurados);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_actualiza_asegurado", e);
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
		logger.debug("Axisctr003Service m_siguiente");
		m_actualiza_asegurado(request, thisAction);

		HashMap m = this.f_Get_Avisos(request, this.whoami(this));

		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
		request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

		if (pRETURN != null && pRETURN.intValue() != 1) {
			m_validar(request, thisAction, Constantes.SIGUIENTE);
		}

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
		logger.debug("Axisctr003Service m_anterior");
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
		logger.debug("Axisctr003Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal codiRetorn = new BigDecimal(0);
			if (!(isEmpty((List) request.getSession().getAttribute("axisctr_asegurados"))
					&& direccion == Constantes.ANTERIOR)) {
				// Si la Lista axisctr_asegurados est� vac�a y vamos atr�s, no validar
				// asegurados
				// Map map = new
				// PAC_IAX_VALIDACIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_VALIDACIONES__F_VALIDAASEGURADOS();
				Map map = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADATOSASEGURADOS();
				logger.debug(map);
				codiRetorn = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			}

			if (codiRetorn.equals(new BigDecimal(0))) {
				// vaya al siguiente...
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, whoami(this), null));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo m_validar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**************************************************************************************************************/
	/**
	 * Al seleccionar un asegurado, cargamos sus domicilios en axisctr_asegurado.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_update_asegurado(HttpServletRequest request) {
		logger.debug("Axisctr003Service AJAX ajax_update_asegurado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService(request);
		Map asegurado = null;

		try {
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_ASEG");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CODI = getCampoNumerico(request, "CODI");
			java.sql.Date FECRETROACT = stringToSqlDate(getCampoTextual(request, "FECRETROACT"));
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CPAREN = getCampoNumerico(request, "CPARENTESCO");

			ArrayList<HashMap> asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
					dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));

			asegurado = this.getAsegurado(request, asegurados, SPERSON);
			logger.debug("LISTA DE ASEGURADO BBDD ->" + asegurado);
			if (!isEmpty(asegurado)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					if (!isEmpty(asegurado.get("DIRECCIONES"))) {
						ArrayList l = (ArrayList) asegurado.get("DIRECCIONES");
						CDOMICI = this.getCdomici(request, l);
					}

				} else if (CDOMICI.intValue() == -1) {
					logger.debug("negativo");
					CDOMICI = null;
				}
			}

			ajax.guardarContenidoFinalAContenedorAjax(asegurado);
			// Grabar a BD

			// Faltaria pasarle el domicilio
			Map grabarTomadores = this.dbGrabaAsegurados(request, usuario, SPERSON, CODI, FECRETROACT, CDOMICI, CPAREN);
			ajax.rellenarPlAContenedorAjax(grabarTomadores);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr003Service - m�todo ajax_update_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(asegurado);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void actualizarAsegurado(HttpServletRequest request, BigDecimal SPERSON, BigDecimal CDOMICI,
			BigDecimal CODI, java.sql.Date FECRETROACT, BigDecimal NRIESGO, BigDecimal SPRODUC, BigDecimal CPAREN) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			ArrayList<HashMap> asegurados = (ArrayList) tratarRETURNyMENSAJES(request,
					dbLeeAsegurados(request, usuario, NRIESGO, SPRODUC));

			Map asegurado = this.getAsegurado(request, asegurados, SPERSON);
			logger.debug("LISTA DE ASEGURADO BBDD ->" + asegurado);

			if (!isEmpty(asegurado)) {
				if (isEmpty(CDOMICI) || CDOMICI.equals("null")) {
					ArrayList l = (ArrayList) asegurado.get("DIRECCIONES");
					CDOMICI = this.getCdomici(request, l);
				}
			}

			// Grabar a BD
			Map grabarAsegurados = this.dbGrabaAsegurados(request, usuario, SPERSON, CODI, FECRETROACT, CDOMICI,
					CPAREN);
			logger.debug(grabarAsegurados);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr002Service - m�todo m_ajax_selected_tomador", e);

		}
	}

	private HashMap f_Get_Avisos_delaseg(HttpServletRequest request, String whoami, String MODO) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMODO = MODO;
			if (isEmpty(MODO))
				CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NRIESGO = new BigDecimal(request.getParameter("NRIESGO"));

			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("NRIESGO", NRIESGO);

			String pparams = this.getInfoStringConcatenarDelaseg(request);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			logger.debug(m);

			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_delaseg " + whoami + " ha causado un error", e);
			return null;
		}

	}

	private String getInfoStringConcatenarDelaseg(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName -->" + fieldName);
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined") && fieldName.indexOf("respuesta") == -1) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			enumera = request.getAttributeNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName attributos -->" + fieldName);
				String fieldValue = String.valueOf(request.getAttribute(fieldName));
				logger.debug("fieldValue attributos -->" + fieldValue);
				if (!fieldName.equals("TTITOBS") && fieldName.indexOf("respuesta") == -1 && !fieldName.equals("TOBS")
						&& !isEmpty(fieldValue) && !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					cadena.append("#").append(fieldName).append(";").append(fieldValue);
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			String c = cadena.append("#").toString();
			/*
			 * logger.debug("cadena avisos sin recorte -->"+cadena); if (c.length()>1999)
			 * c=c.substring(0, 1999);
			 */
			logger.debug("cadena avisos length-->" + cadena.length());
			return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	public void m_ajax_buscar_avisos(HttpServletRequest request) {
		logger.debug("Axisctr101Service m_buscar_avisos");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService(request);

		try {

			HashMap m = this.f_Get_Avisos(request, this.whoami(this), new String("MODIF_ASEG"));
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

//INI-IAXIS-2132 CES 05/04/2019
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
		// END-IAXIS-2132 CES 05/04/2019

	}

}
