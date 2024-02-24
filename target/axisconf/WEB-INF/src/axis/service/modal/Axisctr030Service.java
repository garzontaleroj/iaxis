//Revision:# p5RmhfUIV5/upJwHFFagfQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr030Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr030Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * importes de las garantia seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr030Action thisAction) {
		logger.debug("Axisctr030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (!isEmpty(NRIESGO)) {
				// Recuperar descripci�n riesgo
				initDescRiesgo(request, NRIESGO);
				// Recuperar garant�a seleccionada y sus par�metros de importes
				initPrimasGarantia(request, NRIESGO);
			}

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO:" + SSEGURO);
			formdata.put("SSEGURO", SSEGURO);

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));
			}

			String ORIGEN = getCampoTextual(request, "ORIGEN");
			logger.debug("--->ORIGEN:" + ORIGEN);
			formdata.put("ORIGEN", ORIGEN);

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			logger.debug("--->NMOVIMI:" + NMOVIMI);
			formdata.put("NMOVIMI", NMOVIMI);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr030Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que recupera de BD la descripci�n del riesgo.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void initDescRiesgo(HttpServletRequest request, BigDecimal NRIESGO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DESCRIESGO(NRIESGO);
		logger.debug(map);
		String TRIESGO = (String) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TRIESGO", TRIESGO);

	}

	/**
	 * M�todo que recupera de BD el OB_IAX_GARANTIAS de la garantia en cuesti�n.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void initPrimasGarantia(HttpServletRequest request, BigDecimal NRIESGO) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal NDETGAR = getCampoNumerico(request, "NDETGAR");

		if (!isEmpty(CGARANT)) {
			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(NRIESGO, CGARANT, NDETGAR);
			logger.debug("------------------------- " + map);
			Map OB_IAX_GARANTIAS = (Map) tratarRETURNyMENSAJES(request, map, false);
			String CVALOR = null;
			formdata.put("OB_IAX_GARANTIAS", OB_IAX_GARANTIAS);

			List preguntas = (List) OB_IAX_GARANTIAS.get("PREGUNTAS");
			initPreguntasGarantia(request, preguntas);

			Map mapo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_MASDATOSDETGARANTIA(NRIESGO, CGARANT, NDETGAR);
			Map OB_IAX_MASDATOSGAR = (Map) tratarRETURNyMENSAJES(request, mapo, false);

			/*
			 * comentat perqu� la pantalla ja no mostra l'agent. if (!isEmpty
			 * (OB_IAX_MASDATOSGAR)) { HashMap map2 = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null,
			 * (String)OB_IAX_MASDATOSGAR.get("cagente"), new BigDecimal(1));
			 * 
			 * List agentes=new ArrayList(); Map agente=new HashMap(); if
			 * (!isEmpty(tratarRETURNyMENSAJES(request, map2, false))) {
			 * agentes=(List)map2.get("RETURN"); if (agente.size()>0)
			 * agente=(Map)agentes.get(0); //agente = getObjetoDeLista(agentes,
			 * String.valueOf(mapAgentes.get("RETURN")), "CODI"); } formdata.put
			 * ("AXISCTR_AGENTE", agente); }
			 */

			/* Recoger el objeto de garant�a seleccionado **/
			Map objeto_garantia = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(NRIESGO, CGARANT, new BigDecimal("0"));
			logger.debug(objeto_garantia);
			if (!isEmpty(objeto_garantia)) {
				Map valores = (Map) tratarRETURNyMENSAJES(request, objeto_garantia);
				if (!isEmpty(valores)) {
					ArrayList lista_primas = (ArrayList) valores.get("DETPRIMAS");
					// A�adida precisi�n segun tabla det_primas.

					if (lista_primas != null && lista_primas.size() > 0) {
						for (int i = 0; i < lista_primas.size(); i++) {

							Map detPrimas = (Map) lista_primas.get(i);
							if (!isEmpty(detPrimas)) {
								Map detGarFormula = (Map) detPrimas.get("OB_IAX_DETPRIMAS");
								if (!isEmpty(detGarFormula)) {
									String pattern = "###,##0.000000";
									BigDecimal decvis = (BigDecimal) detGarFormula.get("NDECVIS");

									if (decvis != null) {
										pattern = "###,##0";
										if (!decvis.equals(BigDecimal.ZERO)) {
											pattern += ".";
											int j = decvis.intValue();
											while (j > 0) {
												pattern += "0";
												j--;
											}

										}
									}
									detGarFormula.put("PDECVIS", pattern);
								}
							}
						}
					}
					request.setAttribute("DETPRIMAS", lista_primas);
				}
			}
			/* ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** */

			Map franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_GARANTIA(NRIESGO, null, CGARANT);

			logger.debug(franq);
			formdata.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {
				ArrayList franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
				List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
				if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(franquicias, 1); // tecnicas
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, franqgartecnicaslibres); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(franquicias, 2); // bonusmalus
					bonusmaluslibres = dividirFranqLibres(bonusmalus, bonusmalusgarlibres); // bonusmalus libres
				}

				formdata.put("franq", franquicias);
				formdata.put("franqlibres", dividirFranqLibres(franquicias, franqgarlibres));
				formdata.put("franqtecnicas", franqtecnicas);
				formdata.put("franqtecnicaslibres", franqtecnicaslibres);
				formdata.put("bonusmalus", bonusmalus);
				formdata.put("bonusmaluslibres", bonusmaluslibres);
				formdata.put("franqgartecnicaslibres", franqgartecnicaslibres);
				formdata.put("franqgarlibres", franqgarlibres);
				formdata.put("bonusmalusgarlibres", bonusmalusgarlibres);

				// -${franquicias.OB_IAX_BF_PROACTGRUP.GRUPO.CTIPVISGRUP}
			}

			if (!isEmpty(OB_IAX_GARANTIAS.get("IFRANQU"))) {
				formdata.put("IFRANQU", new BigDecimal(String.valueOf(OB_IAX_GARANTIAS.get("IFRANQU"))));
			}

		}
	}

	private void initPreguntasGarantia(HttpServletRequest request, List preguntas) throws Exception {

		if (!isEmpty(preguntas)) {

			List pregGarQuestSalut = null;
			List pregGarDespeses = null;

			if (!isEmpty(preguntas)) {
				pregGarQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
				pregGarDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
			}

			// Guardar lista de preguntas para mostrarla en la pantalla mediante un
			// DisplayTag
			// es guarden els diferents grups de preguntes
			request.getSession().setAttribute("axisctr_pregGarQuestSalut",
					!isEmpty(pregGarQuestSalut) ? pregGarQuestSalut : new ArrayList());
			request.getSession().setAttribute("axisctr_pregGarDespeses",
					!isEmpty(pregGarDespeses) ? pregGarDespeses : new ArrayList());
			request.getSession().setAttribute("axisctr_preguntasGarantia",
					!isEmpty(preguntas) ? preguntas : new ArrayList());

		}
		// Bug 41390/231687 - 07/04/2016
		// Si la garantia no tiene preguntas hay que quitar las preguntas de la session
		else {

			request.getSession().setAttribute("axisctr_pregGarQuestSalut", null);
			request.getSession().setAttribute("axisctr_pregGarDespeses", null);
			request.getSession().setAttribute("axisctr_preguntasGarantia", null);

		}
	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAX_PREGUNTAS.get("OB_IAX_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAX_PREGUNTAS);
				objBorrar.add(OB_IAX_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAX_PREGUNTAS);
		}

		for (HashMap OB_IAX_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAX_PREGUNTAS);
		}

		return pregdividides;

	}

	private List dividirFranqPerCtipgru(List<HashMap> franquicias, int CTIPGRU) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
			BigDecimal CTIPGRUobj = (BigDecimal) grup.get("CTIPVISGRUP");
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				franqdividides.add(OB_IAX_BF_PROACTGRUP);
				objBorrar.add(OB_IAX_BF_PROACTGRUP);
			}

		}

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
			franquicias.remove(OB_IAX_BF_PROACTGRUP);
		}

		return franqdividides;

	}

	private List dividirFranqLibres(List<HashMap> franquicias, List<HashMap> franquiciasgar) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
			ArrayList lsubgrupos = (ArrayList) grup.get("LSUBGRUPOS");

			if (!isEmpty(lsubgrupos) && lsubgrupos.size() > 0) {
				HashMap mm = (HashMap) lsubgrupos.get(0);
				HashMap subgrup = (HashMap) mm.get("OB_IAX_BF_GRUPSUBGRUP");
				BigDecimal CTIPGRUPSUBGRUP = (BigDecimal) subgrup.get("CTIPGRUPSUBGRUP");
				if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 3) {
					franqdividides.add(OB_IAX_BF_PROACTGRUP);
					objBorrar.add(OB_IAX_BF_PROACTGRUP);
				} else {
					if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 4) {
						objBorrar.add(OB_IAX_BF_PROACTGRUP);
						franquiciasgar.add(OB_IAX_BF_PROACTGRUP);
					}

				}

			}

		}

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
			franquicias.remove(OB_IAX_BF_PROACTGRUP);
		}

		return franquiciasgar;

	}
}
