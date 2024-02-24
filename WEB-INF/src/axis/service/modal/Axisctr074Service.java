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
import axis.mvc.control.modal.Axisctr074Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr074Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr074Action thisAction) {
		logger.debug("Axisctr074Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr074Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

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
	public void m_form(HttpServletRequest request, Axisctr074Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("Axisctr074Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal IFRANQU = getCampoNumerico(request, "IFRANQU");
			BigDecimal CTIPVISGRUP = getCampoNumerico(request, "CTIPVISGRUP");

			BigDecimal CONSULTA = getCampoNumerico(request, "CONSULTA");

			// Bug 0027955/0152240 - JSV (17/09/2013) => a�adimos get y set ctipo (=0 =>
			// FRANQUICIAS / =1 => BONUS MALUS)
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");

			request.setAttribute("CTIPO", CTIPO);
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (isEmpty(NRIESGO))
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			Map franq = new HashMap();
			if (isEmpty(CONSULTA))
				franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS(NRIESGO, null, null, null);
			else
				franq = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_FRANQUICIAS_CONSULTA(NRIESGO, null);
			logger.debug(franq);
			formdata.put("franq", this.tratarRETURNyMENSAJES(request, franq));
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, franq))) {

				List franquicias = (ArrayList) this.tratarRETURNyMENSAJES(request, franq);
				this.eliminarGarantiasNoContratadas(request, (ArrayList) franquicias);
				ArrayList total = new ArrayList();

				List franqtecnicas = null;
				List bonusmalus = null;
				List franqtecnicaslibres = null;
				List bonusmaluslibres = null;
				List franqgartecnicaslibres = new ArrayList();
				List franqgarlibres = new ArrayList();
				List bonusmalusgarlibres = new ArrayList();
				if (!isEmpty(franquicias)) {
					franqtecnicas = dividirFranqPerCtipgru(request, franquicias, 1); // tecnicas
					logger.debug("franqtecnicas :." + franqtecnicas);
					franqtecnicaslibres = dividirFranqLibres(franqtecnicas, total); // tecnicas libres
					bonusmalus = dividirFranqPerCtipgru(request, franquicias, 2); // bonusmalus
					logger.debug("bonusmalus :." + bonusmalus);
					bonusmaluslibres = dividirFranqLibres(bonusmalus, total); // bonusmalus libres
				}

				franquicias = dividirFranqPerCtipgru(request, franquicias, -1); // tecnicas
				logger.debug("franquicias :." + franquicias);
				formdata.put("franq", franquicias);
				formdata.put("franqlibres", dividirFranqLibres(franquicias, total));
				formdata.put("franqtecnicas", franqtecnicas);
				formdata.put("franqtecnicaslibres", franqtecnicaslibres);
				formdata.put("bonusmalus", bonusmalus);
				formdata.put("bonusmaluslibres", bonusmaluslibres);

				formdata.put("franqgarantias", total);
			}

			List g = null;
			if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
				g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
			else if (!isEmpty(request.getSession().getAttribute("axisctr_garantias")))
				g = (List) request.getSession().getAttribute("axisctr_garantias");
			else if (!isEmpty(request.getSession().getAttribute("garantias_ori")))
				g = (List) request.getSession().getAttribute("garantias_ori");
			else if (!isEmpty(request.getSession().getAttribute("garantiasGeneral")))
				g = (List) request.getSession().getAttribute("garantiasGeneral");

			ArrayList resultat = new ArrayList();
			if (!isEmpty(g)) {

				for (int i = 0; i < g.size(); i++) {
					HashMap gar = (HashMap) g.get(i);
					HashMap garantia = (HashMap) gar.get("OB_IAX_GARANTIAS");
					if (!isEmpty(garantia.get("IFRANQ")) || !isEmpty(garantia.get("IFRANQU"))) {
						BigDecimal franqgar = isEmpty(garantia.get("IFRANQ"))
								? new BigDecimal(String.valueOf(garantia.get("IFRANQU")))
								: new BigDecimal(String.valueOf(garantia.get("IFRANQ")));

						if (franqgar.intValue() > 0)
							resultat.add(gar);
					}
				}
			}

			formdata.put("resultat", resultat);
			logger.debug(resultat);

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

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr074Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public static ArrayList reestructurarGarantias(HttpServletRequest request, List<HashMap> li) {
		boolean situat = false;

		ArrayList resultat = new ArrayList();
		try {

			for (int i = 0; i < li.size(); i++) {
				HashMap xxx = li.get(i);
				HashMap gar = (HashMap) xxx.get("OB_IAX_BF_PROGARANGRUP");
				BigDecimal CGARPADRE = isEmpty(gar.get("CGARPADRE")) ? new BigDecimal(0)
						: new BigDecimal(String.valueOf(gar.get("CGARPADRE")));
				BigDecimal CVISIBLE = isEmpty(gar.get("CVISIBLE")) ? new BigDecimal(1)
						: new BigDecimal(String.valueOf(gar.get("CVISIBLE")));
				BigDecimal CGARANT = new BigDecimal(String.valueOf(gar.get("CGARANT")));

				if (CGARPADRE.intValue() == 0 && CVISIBLE.intValue() == 1) {
					// resultat.add((HashMap)li.get(i));

					resultat.add(gar);
					mirarquipenja(CGARANT.intValue(), li, resultat, gar);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultat;

	}

	private static void mirarquipenja(int cgarant, List li, ArrayList resultat, HashMap garPadre) {

		for (int i = 0; i < li.size(); i++) {
			HashMap xxx = (HashMap) li.get(i);
			HashMap garh = (HashMap) xxx.get("OB_IAX_BF_PROGARANGRUP");
			BigDecimal CGARPADRE = isEmpty(garh.get("CGARPADRE")) ? new BigDecimal(0)
					: new BigDecimal(String.valueOf(garh.get("CGARPADRE")));
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));
			BigDecimal CVISIBLE = isEmpty(garh.get("CVISIBLE")) ? new BigDecimal(1)
					: new BigDecimal(String.valueOf(garh.get("CVISIBLE")));

			if (CGARPADRE.intValue() == cgarant && CVISIBLE.intValue() == 1) {

				if (isEmpty(garPadre.get("T_IAX_HIJOS"))) {
					ArrayList hijos = new ArrayList();
					hijos.add(garh);
					garPadre.put("T_IAX_HIJOS", hijos);
				} else {
					ArrayList hhh = (ArrayList) garPadre.get("T_IAX_HIJOS");
					if (!existe(hhh, CGARANT))
						hhh.add(garh);
				}

				// resultat.add(garantia);
				mirarquipenja(CGARANT.intValue(), li, resultat, garh);
			}

		}
	}

	private static boolean existe(ArrayList li, BigDecimal pCGARANT) {

		for (int i = 0; i < li.size(); i++) {
			HashMap garh = (HashMap) li.get(i);
			BigDecimal CGARANT = new BigDecimal(String.valueOf(garh.get("CGARANT")));

			if (CGARANT.intValue() == pCGARANT.intValue())
				return true;
		}

		return false;

	}

	private void eliminarGarantiasNoContratadas(HttpServletRequest request, ArrayList<HashMap> franquicias) {
		List g = null;

		logger.debug("ori:" + request.getSession().getAttribute("garantias_ori"));
		if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
			g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
		else if (!isEmpty(request.getSession().getAttribute("axisctr_garantias")))
			g = (List) request.getSession().getAttribute("axisctr_garantias");
		else if (!isEmpty(request.getSession().getAttribute("garantias_ori")))
			g = (List) request.getSession().getAttribute("garantias_ori");
		else if (!isEmpty(request.getSession().getAttribute("garantiasGeneral")))
			g = (List) request.getSession().getAttribute("garantiasGeneral");
		// 298891
		ArrayList garanticontratas = new ArrayList();
		BigDecimal CONSULTA = getCampoNumerico(request, "CONSULTA");
		logger.debug("size franq-->" + franquicias.size());
		if (!isEmpty(franquicias) && franquicias.size() > 0) {
			for (HashMap m : franquicias) {
				HashMap mm = (HashMap) m.get("OB_IAX_BF_PROACTGRUP");

				ArrayList<HashMap> garantias = (ArrayList<HashMap>) mm.get("GARANTIAS");

				if (!isEmpty(garantias) && garantias.size() > 0) {
					garanticontratas = new ArrayList();
					for (HashMap gar : garantias) {
						boolean trobat = false;
						HashMap progran = (HashMap) gar.get("OB_IAX_BF_PROGARANGRUP");
						BigDecimal CGARANTFRANQ = new BigDecimal(String.valueOf(progran.get("CGARANT")));

						if (!isEmpty(g)) {

							for (int i = 0; i < g.size(); i++) {
								HashMap garantiaa = (HashMap) g.get(i);
								HashMap garantia = (HashMap) garantiaa.get("OB_IAX_GARANTIAS");
								BigDecimal CGARANT = new BigDecimal(String.valueOf(garantia.get("CGARANT")));
								BigDecimal COBLIGA = // (isEmpty(CONSULTA)) ?
										new BigDecimal(String.valueOf(garantia.get("COBLIGA")));// : new BigDecimal(1);
								BigDecimal CNIVGAR = (!isEmpty(garantia.get("CNIVGAR")))
										? new BigDecimal(String.valueOf(garantia.get("CNIVGAR")))
										: new BigDecimal(0);
								if (CGARANTFRANQ.intValue() == CGARANT.intValue() && COBLIGA.intValue() == 1
										&& CNIVGAR.intValue() < 3) {
									trobat = true;

								}
							}
						}

						if (trobat) {
							garanticontratas.add(gar);

						}

					}
				}

				mm.put("GARANTIAS", garanticontratas);
			}
		}

	}

	private List dividirFranqPerCtipgru(HttpServletRequest request, List<HashMap> franquicias, int CTIPGRU) {

		List franqdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();
		for (HashMap OB_IAX_BF_PROACTGRUP : franquicias) {
			HashMap franq = (HashMap) OB_IAX_BF_PROACTGRUP.get("OB_IAX_BF_PROACTGRUP");
			HashMap grup = (HashMap) franq.get("GRUPO");
			BigDecimal CTIPGRUobj = (BigDecimal) grup.get("CTIPVISGRUP");

			if ((CTIPGRU < 0 && (isEmpty(CTIPGRUobj) || CTIPGRUobj.intValue() == 0))
					|| (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU)) {

				if (!isEmpty(franq.get("GARANTIAS"))) {
					ArrayList li = (ArrayList<HashMap>) franq.get("GARANTIAS");
					logger.debug("gar : " + li);
					li = reestructurarGarantias(request, li);
					logger.debug("li : " + li);
					franq.put("GARANTIAS", li);
				}

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
				/*
				 * if (!isEmpty(CTIPGRUPSUBGRUP)&&CTIPGRUPSUBGRUP.intValue()==3) {
				 * franqdividides.add(OB_IAX_BF_PROACTGRUP);
				 * objBorrar.add(OB_IAX_BF_PROACTGRUP); }else{
				 */
				if (!isEmpty(CTIPGRUPSUBGRUP) && CTIPGRUPSUBGRUP.intValue() == 4) {
					objBorrar.add(OB_IAX_BF_PROACTGRUP);
					franquiciasgar.add(OB_IAX_BF_PROACTGRUP);

				}

			}

		}

		for (HashMap OB_IAX_BF_PROACTGRUP : objBorrar) {
			franquicias.remove(OB_IAX_BF_PROACTGRUP);
		}

		return franqdividides;

	}

}
