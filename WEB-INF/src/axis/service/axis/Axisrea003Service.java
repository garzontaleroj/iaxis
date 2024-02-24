//Revision:# TEuFVMLJUcMFkC/QSO2QZg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea003Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea003Service.java 20/08/2008
 * 
 * @author <a href="icanada@csi-ti.com">Iv�n Ca�ada</a>
 * @since Java 5.0
 */
public class Axisrea003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*
	 * private int f_indice_contrato(ArrayList pLista, BigDecimal pSCONTRA,
	 * BigDecimal pNVERSIO){ int vIndice = 0; boolean vTrobat = false; BigDecimal
	 * auxSCONTRA; BigDecimal auxNVERSIO;
	 * 
	 * while(!vTrobat && vIndice < pLista.size()){ auxSCONTRA =
	 * (BigDecimal)((HashMap)((HashMap)pLista.get(vIndice)).get(
	 * "OB_IAX_CONTRATO_REA")).get("SCONTRA"); auxNVERSIO =
	 * (BigDecimal)((HashMap)((HashMap)pLista.get(vIndice)).get(
	 * "OB_IAX_CONTRATO_REA")).get("NVERSIO"); if( auxSCONTRA.equals(pSCONTRA) &&
	 * auxNVERSIO.equals(pNVERSIO)){ vTrobat = true; } else { vIndice++; } }
	 * 
	 * if(vTrobat) return vIndice; else return -1; }
	 * 
	 * private int f_indice_tramo(ArrayList pLista, BigDecimal pSCONTRA, BigDecimal
	 * pNVERSIO, BigDecimal pCTRAMO){ int vIndice = 0; boolean vTrobat = false;
	 * BigDecimal auxSCONTRA; BigDecimal auxNVERSIO; BigDecimal auxCTRAMO;
	 * 
	 * while(!vTrobat && vIndice < pLista.size()){ auxSCONTRA =
	 * (BigDecimal)((HashMap)((HashMap)pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA")
	 * ).get("SCONTRA"); auxNVERSIO =
	 * (BigDecimal)((HashMap)((HashMap)pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA")
	 * ).get("NVERSIO"); auxCTRAMO =
	 * (BigDecimal)((HashMap)((HashMap)pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA")
	 * ).get("CTRAMO"); if( auxSCONTRA.equals(pSCONTRA) &&
	 * auxNVERSIO.equals(pNVERSIO) && auxCTRAMO.equals(pCTRAMO)){ vTrobat = true; }
	 * else { vIndice++; } }
	 * 
	 * if(vTrobat) return vIndice; else return -1; }
	 */

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/*
			 * if getCampoNumerico(request, "grabarOK") == 0 {
			 * logger.debug("ENTRO A LIMPIAR"); formdata.clear(); }
			 */

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug("ENTRO AL AXISREA003");
			/*
			 * BigDecimal vSCONTRA =
			 * this.stringToBigDecimal((String)request.getParameter("SCONTRA")); BigDecimal
			 * vobtenerDatos =
			 * this.stringToBigDecimal((String)request.getParameter("obtenerDatos"));
			 * BigDecimal vNVERSIO =
			 * this.stringToBigDecimal((String)request.getParameter("NVERSIO")); BigDecimal
			 * vCTRAMO = this.stringToBigDecimal((String)request.getParameter("CTRAMO"));
			 */

			/* Miramos si hay que recoger algun campo m�s */

			try {
				this.m_obtener_combos(request);
			} catch (Exception e) {
				logger.error("Error en el servicio Axisrea003Service - m�todo m_form", e);
				AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrea003Service m_obtener_combos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			Map map_tiprease = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPO_REA();
			List listaTipReaseg = (List) tratarRETURNyMENSAJES(request, map_tiprease, false);
			formdata.put("listaTipReaseg", listaTipReaseg);
			logger.debug(map_tiprease);
			listaTipReaseg = null;

			Map map_empre = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List listaEmpresas = (List) tratarRETURNyMENSAJES(request, map_empre, false);
			formdata.put("listaEmpresas", listaEmpresas);
			logger.debug(map_tiprease);
			listaEmpresas = null;

			Map map_cvidaga = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(161));
			List ListaVidaga = (List) tratarRETURNyMENSAJES(request, map_cvidaga, false);
			formdata.put("ListaVidaga", ListaVidaga);
			logger.debug(map_tiprease);
			ListaVidaga = null;

			Map map_cum = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(225));
			List ListaCumul = (List) tratarRETURNyMENSAJES(request, map_cum, false);
			formdata.put("ListaCumul", ListaCumul);
			logger.debug(map_tiprease);
			ListaCumul = null;

			Map map_agrupa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGR_REA();
			List listaAgrupa = (List) tratarRETURNyMENSAJES(request, map_agrupa, false);
			formdata.put("listaAgrupa", listaAgrupa);
			logger.debug(map_tiprease);
			listaAgrupa = null;

			/* Nuevos campos */

			Map map_erc = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ERCARTERAPRIMAS();
			List ListaERCartera = (List) tratarRETURNyMENSAJES(request, map_erc, false);
			formdata.put("ListaERCartera", ListaERCartera);
			logger.debug(map_tiprease);
			ListaERCartera = null;

			Map map_baseXL = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BASEXL();
			List ListaBaseXL = (List) tratarRETURNyMENSAJES(request, map_baseXL, false);
			formdata.put("ListaBaseXL", ListaBaseXL);
			logger.debug(map_baseXL);
			ListaBaseXL = null;

			Map map_loss = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("1"));
			List ListaLoss = (List) tratarRETURNyMENSAJES(request, map_loss, false);
			formdata.put("ListaLoss", ListaLoss);
			logger.debug(map_loss);
			ListaLoss = null;

			Map map_capped = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_TRAMOSREA(new BigDecimal("2"));
			List ListaCapped = (List) tratarRETURNyMENSAJES(request, map_capped, false);
			formdata.put("ListaCapped", ListaCapped);
			logger.debug(map_capped);
			ListaCapped = null;

			Map map_contraprot = new PAC_IAX_LISTVALORES_REA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_CONTRATOPROT(CEMPRES);
			List ListaContratoProt = (List) tratarRETURNyMENSAJES(request, map_contraprot, false);
			formdata.put("ListaContratoProt", ListaContratoProt);
			logger.debug(map_contraprot);
			ListaContratoProt = null;
			HashMap orden;
			Map mapa_monedas = null;
			try {
				PAC_IAX_PARAM param = new PAC_IAX_PARAM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				orden = param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("LSTMONEDA", usuario.getCempres());

				if (orden.get("RETURN") != null && orden.get("RETURN").equals(BigDecimal.ONE)) {
					mapa_monedas = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND("FILTRO_MONEDAS");
				} else {
					mapa_monedas = new PAC_IAX_OPERATIVA_FINV(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
				}

			} catch (Exception e) {
				e.toString();
			}
			List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa_monedas, false);
			formdata.put("listaMonedas", listaMonedas);
			logger.debug(mapa_monedas);
			listaMonedas = null;

			/* INI - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo */
			Map maparamos = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
			List listaRamos = (List) tratarRETURNyMENSAJES(request, maparamos, false);
			formdata.put("listaRamos", listaRamos);
			listaRamos = null;
			/* FIN - CJAD - 21/JUNIO2019 - IAXIS4427 - Cambio de producto a ramo */

		} catch (Exception e) {

			logger.error("Error en el servicio Axisrea001Service - m�todo m_obtener_combos", e);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_guardar_contrato(HttpServletRequest request, Axisrea003Action thisAction) {
		logger.debug("Axisctr003Service m_guardar_contrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_MOD");
			if (SCONTRA == null) {
				SCONTRA = getCampoNumerico(request, "NEW_SCONTRA");
			}
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");

			BigDecimal SPTRAMO = new BigDecimal("0");
			Boolean BSCESION = true;
			String STTRAMOS = "";

			BigDecimal SPLENO = getCampoNumerico(request, "SPLENO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CTIPREA = getCampoNumerico(request, "CTIPREA");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal SCONAGR = getCampoNumerico(request, "SCONAGR");
			BigDecimal CVIDAGA = getCampoNumerico(request, "CVIDAGA");
			BigDecimal CVIDAIR = getCampoNumerico(request, "CVIDAIR");
			BigDecimal CTIPCUM = getCampoNumerico(request, "CTIPCUM");

			BigDecimal CVALID = getCampoNumerico(request, "cvalid");

			logger.debug("<-----cvalid ---->" + CVALID);

			Date FCONINI = stringToSqlDate(getCampoTextual(request, "FCONINI"));
			BigDecimal NPRIORI = getCampoNumerico(request, "NPRIORI");
			BigDecimal NCONREL = getCampoNumerico(request, "NCONREL");
			Date FCONFIN = stringToSqlDate(getCampoTextual(request, "FCONFIN"));

			logger.debug("<----------------------Hasta aqui -------------------------->");
			BigDecimal ICAPACI = getCampoNumerico(request, "ICAPACI");
			logger.debug("<----------------------- ICAPACI -------------------->" + ICAPACI);
			BigDecimal IAUTORI = getCampoNumerico(request, "IAUTORI");
			BigDecimal IRETENC = getCampoNumerico(request, "IRETENC");
			BigDecimal IMINCES = getCampoNumerico(request, "IMINCES");
			BigDecimal IPRIOXL = getCampoNumerico(request, "IPRIOXL");
			BigDecimal PPRIOSL = getCampoNumerico(request, "PPRIOSL");
			String TOBSERV = getCampoTextual(request, "TOBSERV");
			BigDecimal PCEDIDO = getCampoNumerico(request, "PCEDIDO");
			BigDecimal PRIESGOS = getCampoNumerico(request, "PRIESGOS");

			BigDecimal PDESCUENTO = getCampoNumerico(request, "PDESCUENTO");
			BigDecimal PGASTOS = getCampoNumerico(request, "PGASTOS");
			BigDecimal PPARTBENE = getCampoNumerico(request, "PPARTBENE");
			BigDecimal CREAFAC = getCampoNumerico(request, "CREAFAC");
			BigDecimal PCESEXT = getCampoNumerico(request, "PCESEXT");
			BigDecimal CGARREL = getCampoNumerico(request, "CGARREL");
			BigDecimal CFRECUL = getCampoNumerico(request, "CFRECUL");
			BigDecimal SCONQP = getCampoNumerico(request, "SCONQP");
			BigDecimal NVERQP = getCampoNumerico(request, "NVERQP");
			BigDecimal IAGREGA = getCampoNumerico(request, "IAGREGA");
			BigDecimal IMAXAGR = getCampoNumerico(request, "IMAXAGR");
			// BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			String TCONTRA = getCampoTextual(request, "TCONTRA");

			/* Nuevos campos a�adidos */

			String CMONEDA = getCampoTextual(request, "CMONEDA");
			String TDESCRIPCION = getCampoTextual(request, "TDESCRIPCION");
			BigDecimal CERCARTERA = getCampoNumerico(request, "CERCARTERA");
			BigDecimal IPRIMAESPERADAS = getCampoNumerico(request, "IPRIMAESPERADAS");
			BigDecimal NANYOSLOSS = getCampoNumerico(request, "NANYOSLOSS");
			BigDecimal CBASEXL = getCampoNumerico(request, "CBASEXL");
			BigDecimal CLOSSCORRIDOR_CON = getCampoNumerico(request, "CLOSSCORRIDOR_CON");
			BigDecimal CCAPPEDRATIO_CON = getCampoNumerico(request, "CCAPPEDRATIO_CON");
			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			BigDecimal NVERSIOPROT = getCampoNumerico(request, "NVERSIOPROT");
			BigDecimal PCOMEXT = getCampoNumerico(request, "PCOMEXT");

			/* TODO: revisar Clave CBR???? */
			/* Nuevos campos a�adidos */

			BigDecimal CDEVENTO = getCampoNumerico(request, "CDEVENTO");

			// INI - EDBR - 11/06/2019 - IAXIS3338 - se agregan los variables de Retencion
			// por poliza NRETPOL y Retencion por Cumulo NRETCUL
			BigDecimal NRETPOL = getCampoNumerico(request, "NRETPOL");
			BigDecimal NRETCUL = getCampoNumerico(request, "NRETCUL");
                 BigDecimal NISUBLIMITE   = getCampoNumerico(request, "ISUBLIMITE");
			// FIN - EDBR - 11/06/2019 - IAXIS3338 - se agregan los variables de Retencion
			// por poliza NRETPOL y Retencion por Cumulo NRETCUL

			logger.debug("<----------------------- F_SET_CONTRATO_REA -------------------->");

			// Antes de guardar el contrato, eliminamos tramos si hay en la variable
			// deletedTramos
			String deletedTramos = (String) formdata.get("deletedTramos");
			if (!isEmpty(deletedTramos)) {
				map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_FILTERED_TRAMOS(NVERSIO, deletedTramos, SCONTRA);
				formdata.put("deletedTramos", null);
			}

			String deletedCuadroces = (String) formdata.get("deletedCuadroces");
			if (!isEmpty(deletedCuadroces)) {
				// Eliminamos cuadros por contrato, version, tramo y compa�ia
				String[] cuadroces = deletedCuadroces.split(",");
				for (String cuadro : cuadroces) {
					String[] cuadroSplit = cuadro.split("-");
					BigDecimal ctramo = new BigDecimal(cuadroSplit[0]);
					BigDecimal ccompani = new BigDecimal(cuadroSplit[1]);

					map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_CUADROCES(ccompani, NVERSIO, SCONTRA, ctramo);
				}
				formdata.put("deletedCuadroces", null);
			}

			// INI - AXIS 4085 - 24/5/2019 - AABG - SE PROCEDE A VALIDAR EL CAMPO SCONTRA
			// PARA CONSULTAR SU TRAMO Y EVITAR LA EXCEPCION DEL SP
			Map mapAux = new HashMap();
			if (SCONTRA != null) {
				mapAux = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_TRAMOS_REA(SCONTRA, NVERSIO);
			}
			// FIN - AXIS 4085 - 24/5/2019 - AABG - SE PROCEDE A VALIDAR EL CAMPO SCONTRA
			// PARA CONSULTAR SU TRAMO Y EVITAR LA EXCEPCION DEL SP

			List<Map> lstTramos = (List<Map>) tratarRETURNyMENSAJES(request, mapAux);
			logger.debug(mapAux);
			if (!isEmpty(mapAux) && lstTramos != null) {
				for (Map iLstTramos : lstTramos) {
					BigDecimal SCESION = new BigDecimal("0");

					Map objeto_tramos_rea = (Map) iLstTramos.get("OB_IAX_TRAMOS_REA");
					logger.debug(objeto_tramos_rea);
					if (!isEmpty(objeto_tramos_rea.get("PTRAMO")) && objeto_tramos_rea.get("PTRAMO") != null) {
						SPTRAMO = SPTRAMO.add((BigDecimal) objeto_tramos_rea.get("PTRAMO"));
					}

					List cuadroces = (ArrayList) objeto_tramos_rea.get("CUADROCES");
					for (int j = 0; j < cuadroces.size(); j++) {
						Map cuadro = (HashMap) cuadroces.get(j);
						HashMap ob_iax_cuadroces_rea = (HashMap) cuadro.get("OB_IAX_CUADROCES_REA");
						SCESION = SCESION.add((BigDecimal) ob_iax_cuadroces_rea.get("PCESION"));
					}
					if (SCESION.compareTo(new BigDecimal("100")) != 0) {
						BSCESION = false;
						STTRAMOS = STTRAMOS + ((String) objeto_tramos_rea.get("TTRAMO")) + " ";
					}
				}

				// INI - AXIS 4451 - 20/06/2019 - AABG - SE QUITA VALIDACION DE 100 PORCENTAJE
				// DE TRAMO
				// if(BSCESION==true){
				// INI - DB - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion
				// NRETPOL y Retencion por Cumulo NRETCUL
				map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_CONTRATO_REA(SCONTRA, SPLENO, CEMPRES, CTIPREA, CRAMO,
						CMODALI, CTIPSEG, CCOLECT, CACTIVI, CGARANT, CVIDAGA, SCONAGR, CVIDAIR, CTIPCUM, CVALID,
						NVERSIO, NPRIORI, FCONINI, NCONREL, FCONFIN, IAUTORI, IRETENC, IMINCES, ICAPACI, IPRIOXL,
						PPRIOSL, TOBSERV, PCEDIDO, PRIESGOS, PDESCUENTO, PGASTOS, PPARTBENE, CREAFAC, PCESEXT, CGARREL,
						CFRECUL, SCONQP, NVERQP, IAGREGA, IMAXAGR, TCONTRA, CMONEDA, TDESCRIPCION, null, CERCARTERA,
						IPRIMAESPERADAS, NANYOSLOSS, CBASEXL, CLOSSCORRIDOR_CON, CCAPPEDRATIO_CON, SCONTRAPROT, null,
						NVERSIOPROT, CDEVENTO, PCOMEXT, NRETPOL, NRETCUL,NISUBLIMITE);

				logger.debug(map);
				// FIN - DB - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion
				// NRETPOL y Retencion por Cumulo NRETCUL

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
					logger.debug("<----- ENTRO IF ---->" + map);
					request.setAttribute("grabarr", new BigDecimal(0));

					// Si el contrato es nuevo, iremos a buscar el nuevo SCONTRA para ponerlo en el
					// form
					if (SCONTRA == null) {
						// Integer new_scontra =0;
						Map map_scontra = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_NEW_SCONTRA();
						int new_scontra = ((BigDecimal) tratarRETURNyMENSAJES(request, map_scontra, false)).intValue();
						formdata.put("NEW_SCONTRA", new_scontra);
						formdata.put("NVERSIO", 1);
						// BigDecimal abrir_axisrea004 = (BigDecimal) formdata.get("abrir_axisrea004");
						BigDecimal abrir_axisrea004 = getCampoNumerico(request, "abrir_axisrea004");
						if (abrir_axisrea004 == null || !abrir_axisrea004.equals(new BigDecimal(0))) {
							formdata.put("abrir_axisrea004", 1);
						}

					}
				}

				// }else{
				// thisAction.guardarMensaje(request, "9910595", new Object[] {
				// map.get("MENSAJES")},Constantes.MENSAJE_ERROR);
				// thisAction.guardarMensaje(request, "verbatim:"+STTRAMOS, null,
				// Constantes.MENSAJE_INFO);
				// }

				// FIN - AXIS 4451 - 20/06/2019 - AABG - SE QUITA VALIDACION DE 100 PORCENTAJE
				// DE TRAMO
			} else {

				// INI - EDBR - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion
				// por poliza NRETPOL y Retencion por Cumulo NRETCUL
				map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_CONTRATO_REA(SCONTRA, SPLENO, CEMPRES, CTIPREA, CRAMO,
						CMODALI, CTIPSEG, CCOLECT, CACTIVI, CGARANT, CVIDAGA, SCONAGR, CVIDAIR, CTIPCUM, CVALID,
						NVERSIO, NPRIORI, FCONINI, NCONREL, FCONFIN, IAUTORI, IRETENC, IMINCES, ICAPACI, IPRIOXL,
						PPRIOSL, TOBSERV, PCEDIDO, PRIESGOS, PDESCUENTO, PGASTOS, PPARTBENE, CREAFAC, PCESEXT, CGARREL,
						CFRECUL, SCONQP, NVERQP, IAGREGA, IMAXAGR, TCONTRA, CMONEDA, TDESCRIPCION, null, CERCARTERA,
						IPRIMAESPERADAS, NANYOSLOSS, CBASEXL, CLOSSCORRIDOR_CON, CCAPPEDRATIO_CON, SCONTRAPROT, null,
						NVERSIOPROT, CDEVENTO, PCOMEXT, NRETPOL, NRETCUL,NISUBLIMITE);
				// FIN - EDBR - 11/06/2019 - IAXIS3338 - se agregan los parametros de Retencion
				// por poliza NRETPOL y Retencion por Cumulo NRETCUL

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0) {
					logger.debug("<----- ENTRO IF ---->" + map);
					request.setAttribute("grabarr", new BigDecimal(0));

					// Si el contrato es nuevo, iremos a buscar el nuevo SCONTRA para ponerlo en el
					// form
					if (SCONTRA == null) {
						// Integer new_scontra =0;
						Map map_scontra = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_NEW_SCONTRA();
						int new_scontra = ((BigDecimal) tratarRETURNyMENSAJES(request, map_scontra, false)).intValue();
						formdata.put("NEW_SCONTRA", new_scontra);
						formdata.put("NVERSIO", 1);
						// BigDecimal abrir_axisrea004 = (BigDecimal) formdata.get("abrir_axisrea004");
						BigDecimal abrir_axisrea004 = getCampoNumerico(request, "abrir_axisrea004");
						if (abrir_axisrea004 == null || !abrir_axisrea004.equals(new BigDecimal(0))) {
							formdata.put("abrir_axisrea004", 1);
						}
					}
				}

			}

			m_ActualitzarDisplays(request, thisAction);

			// request.setAttribute("grabarOk",
			// BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map,false)));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea003Service - m�todo m_guardar_contrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * M�todo para Recuperar un registro de tramos
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 * @throws Exception
	 */

	public void m_ActualitzarDisplays(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea003Service m_ActualizarDisplays");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA");
			if (SCONTRA == null) {
				SCONTRA = getCampoNumerico(request, "NEW_SCONTRA");
			}
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO2");
			if (NVERSIO == null) {
				NVERSIO = getCampoNumerico(request, "NVERSIO");
			}

			if (SCONTRA != null && NVERSIO != null) {
				// Miramos si hay tramos para el contrato
				// Tenemos que filtrar los tramos por deletedTramos
				String deletedTramos = (String) formdata.get("deletedTramos");
				Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_FILTERED_TRAMOS(SCONTRA, NVERSIO, deletedTramos,
						new BigDecimal(1));

				List resultado = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(map);
				if (resultado != null) { // Si hay, lo pondremos en el form
											// formdata.put("MAYORES",map.get("PIRPFMAYORES"));
					logger.debug("Axisrea003Service m_tramosrea");
					formdata.put("TRAMOSREA", resultado);

					logger.debug("Axisrea003Service m_tramosrea2");

					BigDecimal indexTramos = this.getCampoNumerico(request, "indexTramos");

					if (isEmpty(indexTramos) && !isEmpty((resultado)))
						indexTramos = new BigDecimal(0);
					formdata.put("indexTramos", indexTramos);

				} /*
					 * else logger.debug("else");
					 */
			}

			// this.cargarValoresDesplegables(request,usuario,formdata);
			m_obtener_combos(request);

			/*
			 * Al recargar los valores de pantalla no perder los valores introducidos por
			 * pantalla
			 */
			/* Cojo los valores del array que toca */
			Map rec_pantalla = (Map) request.getAttribute(Constantes.FORMDATA);

			// Antes de setear el objeto, vamos a manipularlo para quitar los cuadros
			// borrados
			String deletedCuadroces = (String) formdata.get("deletedCuadroces");
			if (!isEmpty(deletedCuadroces)) {
				String[] tramosCuadros = deletedCuadroces.split(",");
				if (tramosCuadros.length > 0) {

					List tramosrea = (ArrayList) rec_pantalla.get("TRAMOSREA");
					int i = 0;
					for (i = 0; i < tramosrea.size(); i++) {
						Map tramorea = (HashMap) tramosrea.get(i);
						HashMap ob_iax_tramo = (HashMap) tramorea.get("OB_IAX_TRAMOS_REA");
						List cuadros = (ArrayList) ob_iax_tramo.get("CUADROCES");
						int j = 0;
						for (j = 0; j < cuadros.size(); j++) {
							Map cuadro = (HashMap) cuadros.get(j);
							HashMap ob_iax_cuadro = (HashMap) cuadro.get("OB_IAX_CUADROCES_REA");
							BigDecimal ccompania = (BigDecimal) ob_iax_cuadro.get("CCOMPANI");
							BigDecimal ctramo = (BigDecimal) ob_iax_cuadro.get("CTRAMO");

							// Para cada pareja tramo-compa�ia
							for (String pareja : tramosCuadros) {
								String[] parejaSplit = pareja.split("-");
								if (parejaSplit[0].equals(ctramo.toString())
										&& parejaSplit[1].equals(ccompania.toString())) {
									// quitamos el cuadroces
									cuadros.remove(j);
									j--;
								}
							}
						}

					}

				}
			}

			formdata.put("OB_IAX_CONTRATO_REA", rec_pantalla);

			/*
			 * Recuperamos el combo con los valores actuales del capped ratio calculados con
			 * ajax
			 */
			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			if (SCONTRAPROT != null) {
				Map mapa_versiones = new PAC_IAX_LISTVALORES_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
				List listaVersiones = (List) tratarRETURNyMENSAJES(request, mapa_versiones, false);
				formdata.put("listaVersiones", listaVersiones);
			}

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea003Service.m_Actualizar_display", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_tramo(HttpServletRequest request, Axisrea003Action thisAction) {
		logger.debug("Axisctr03Service m_borrar_tramo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMOSelected");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_MOD");

			logger.debug(CTRAMO);

			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_OBJETOTRAMOSREA(NVERSIO, CTRAMO, SCONTRA);
			logger.debug(map);
			m_ActualitzarDisplays(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea003Service - m�todo m_borrar_tramo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @return true o false indicando si la actualitzaci�n de la p�liza.
	 */
	public void m_borrar_cuadro(HttpServletRequest request, Axisrea003Action thisAction) {
		logger.debug("Axisctr03Service m_borrar_cuadro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		try {

			PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CTRAMO = getCampoNumerico(request, "CTRAMOSelected");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPASelected");
			BigDecimal NVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal SCONTRA = getCampoNumerico(request, "SCONTRA_MOD");

			logger.debug("----------- CTRAMO --------------" + CTRAMO);
			logger.debug("----------- CCOMPANI --------------" + CCOMPANI);

			map = pacIaxRea.ejecutaPAC_IAX_REA__F_DEL_OBJETOCUADROREA(NVERSIO, CTRAMO, SCONTRA, CCOMPANI);
			logger.debug(map);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, map, false))) {
				logger.debug(map);
				// request.setAttribute("grabarOK", new BigDecimal(0));
			}

			m_ActualitzarDisplays(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea003Service - m�todo m_borrar_cuadro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ModificarContrato(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea003Service m_ModificarContrato");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SCONTRA_MOD = getCampoNumerico(request, "SCONTRA_MOD");
			BigDecimal FlagVersion = getCampoNumerico(request, "NVERSIO"); // EDBR - IAXIS4529 - 27/06/2019 - se agrega
																			// variale de version enviada desde la
																			// pantalla axisrea002
			Map map3 = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_NVERSIO(SCONTRA_MOD);
			logger.debug("map F_GET_NVERSIO******************************** ---------->" + map3);
			BigDecimal NVERSIO = (BigDecimal) tratarRETURNyMENSAJES(request, map3); // map3.get("RETURN");
			BigDecimal NVERSIO_RECDATOS = (BigDecimal) map3.get("PNVERSIO_DATOS");

			BigDecimal NVER = null;

			// INI - EDBR - IAXIS4529 - 26/06/2019 - se agrega condicion de nueva version de
			// contrato
			/*
			 * if (!isEmpty(NVERSIO_RECDATOS)) { NVER = NVERSIO_RECDATOS; }
			 */
			Map map = null;
			// FIN - AABG - 18-02-2020 - IAXIS 12910 - Se agrega attr al formadata para
			// campos bloqueados
			if (!isEmpty(FlagVersion)) {
				NVER = FlagVersion;
				map = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(SCONTRA_MOD, NVER);
				formdata.put("EDITABLE", "0");
			} else {
				NVER = NVERSIO;
				map = pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(SCONTRA_MOD, NVERSIO_RECDATOS);
				formdata.put("EDITABLE", "1");
			}
			// FIN - AABG - 18-02-2020 - IAXIS 12910 - Se agrega attr al formadata para
			// campos bloqueados
			// FIN - EDBR - IAXIS4529 - 26/06/2019 - se agrega condicion de nueva version de
			// contrato

			// Map map =
			// pac_axis_rea.ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(SCONTRA_MOD,NVER);
			// //NVERSIO_RECDATOS
			logger.debug("map F_GET_DETALLECAB_REA---------->" + map);
			Map OB_IAX_CODICONTRATO_REA = (Map) tratarRETURNyMENSAJES(request, map, false);
			logger.debug("map OB_IAX_CODICONTRATO_REA---------->" + OB_IAX_CODICONTRATO_REA);

			/* Cojo los valores del array que toca */
			ArrayList CONTRATOS = (ArrayList) OB_IAX_CODICONTRATO_REA.get("CONTRATOS");

			HashMap mapa = (HashMap) CONTRATOS.get(0);// S�lo devuelve una l�nea = version
			HashMap OB_IAX_CONTRATO_REA = (HashMap) mapa.get("OB_IAX_CONTRATO_REA");
			formdata.put("OB_IAX_CONTRATO_REA", OB_IAX_CONTRATO_REA);

			// INI - AABG - 18-02-2020 - IAXIS 12910 - Se agrega atritubos requeridos para
			// combos en el formdata
			formdata.put("SCONTRAPROT", OB_IAX_CONTRATO_REA.get("SCONTRAPROT"));
			formdata.put("CERCARTERA", OB_IAX_CONTRATO_REA.get("CERCARTERA"));
			// FIN - AABG - 18-02-2020 - IAXIS 12910 - Se agrega atritubos requeridos para
			// combos en el formdata

			logger.debug("************************************ " + OB_IAX_CONTRATO_REA);
			formdata.putAll(OB_IAX_CODICONTRATO_REA);
			// formdata.put("NVERSIO2",NVERSIO);
			formdata.put("NVERSIO2", NVER); // EDBR - IAXIS4529 - 27/06/2019 - se envia la version correspondiente en el
											// request
			// formdata.put("NVERSIO",((Map)map3.get("RETURN")).get("NVERSIO"));

			logger.debug("NVER-------------------------------->" + NVER);
			// NVERSIO -= NVERSIO;

			Map map2 = pac_axis_rea.ejecutaPAC_IAX_REA__F_SET_T_TRAMO_MEM(SCONTRA_MOD, NVER);
			logger.debug(map2);
			m_ActualitzarDisplays(request, thisAction);

			/*
			 * Al recargar los valores de pantalla no perder los valores introducidos por
			 * pantalla
			 */
			/* Cojo los valores del array que toca */
			Map rec_pantalla = (Map) request.getAttribute(Constantes.FORMDATA);
			formdata.put("OB_IAX_CONTRATO_REA", rec_pantalla);

			/*
			 * Recuperamos el combo con los valores actuales del capped ratio calculados con
			 * ajax
			 */
			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			if (SCONTRAPROT != null) {
				Map mapa_versiones = new PAC_IAX_LISTVALORES_REA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
				List listaVersiones = (List) tratarRETURNyMENSAJES(request, mapa_versiones, false);
				formdata.put("listaVersiones", listaVersiones);
			}

			if (OB_IAX_CONTRATO_REA != null) {
				formdata.put("PCOMEXT", OB_IAX_CONTRATO_REA.get("PCOMEXT"));
			}

			// INI - EDBR - IAXIS4529 - 27/06/2019 - se agrega condicion de para determinar
			// si es edicion o nueva version y limpiar los datos del request
			if (isEmpty(FlagVersion)) {
				m_borrarDetalleContrato(request);
			}
			// FIN - EDBR - IAXIS4529 - 27/06/2019 - se agrega condicion de para determinar
			// si es edicion o nueva version y limpiar los datos del request

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea003Service.m_ModificarContrato", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_BorrarObjCache(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisrea003Service m_BorrarObjCache");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_REA pac_axis_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_rea.ejecutaPAC_IAX_REA__F_INI_OBJ_TRAMOS();
			logger.debug("map F_INI_OBJ_TRAMOS---------->" + map);

			m_form(request);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisrea003Service.m_BorrarObjCache", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CEMPRES = (BigDecimal) AbstractDispatchAction.topPila(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}

			BigDecimal SCONTRAPROT = getCampoNumerico(request, "SCONTRAPROT");
			Map map = new PAC_IAX_LISTVALORES_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_VERSIONESCONTRATOPROT(CEMPRES, SCONTRAPROT);
			logger.debug("------- Ramos:" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	@SuppressWarnings("all")
	public void m_delete_contrato(HttpServletRequest request) {
		logger.debug("Axisarea003Service m_delete_contrato");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SCONTRA = getCampoNumerico(request, "NEW_SCONTRA");
			Map map = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REA__F_DEL_CONTRATO_REA(SCONTRA);

			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisarea003Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// INI - EDBR - IAXIS4529 - 27/06/2019 - se agrega metodo para limpiar los datos
	// de detalle de version request
	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_borrarDetalleContrato(HttpServletRequest request) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		formdata.put("FCONINI", "");
		formdata.put("FCONFIN", "");
		formdata.put("CVIDAGA", "");
		formdata.put("TCONTRA", "");
		formdata.put("SCONQP", "");
		formdata.put("NVERQP", "");
		formdata.put("IRETENC", "");
		formdata.put("IPRIOXL", "");
		formdata.put("ICAPACI", "");
		formdata.put("PCEDIDO", "");
		formdata.put("TOBSERV", "");
		formdata.put("PCOMEXT", "");
		formdata.put("NRETPOL", "");
		formdata.put("NRETCUL", "");
    	formdata.put("NISUBLIMITE","");
		formdata.remove("OB_IAX_CONTRATO_REA");
	}
	// FIN - EDBR - IAXIS4529 - 27/06/2019 - se agrega metodo para limpiar los datos
	// de detalle de version request
}
