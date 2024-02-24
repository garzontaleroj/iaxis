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
import axis.mvc.control.modal.Axisctr013Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr013Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr013Action thisAction) {
		logger.debug("Axisctr013Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr013Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axisctr013Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("Axisctr013Service m_form");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal IFRANQU = getCampoNumerico(request, "IFRANQU");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

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

			List g = null;
			if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
				g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
			else
				g = (List) request.getSession().getAttribute("axisctr_garantias");

			Map garantia = getObjetoDeLista(g, bigDecimalToString(CGARANT), "CGARANT", "OB_IAX_GARANTIAS");
			request.getSession().setAttribute("axisctr_garantia", garantia);

			if (isEmpty(IFRANQU) && !isEmpty(garantia.get("IFRANQ"))) {
				formdata.put("IFRANQU", new BigDecimal(String.valueOf(garantia.get("IFRANQ"))));
			}

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
			logger.error("Error en el servicio Axisctr013Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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

		return franqdividides;

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que actualiza la pantalla en funci�n de los cambios producidos en una
	 * garantia.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardarCambios(HttpServletRequest request, Axisctr013Action thisAction) {
		logger.debug("Axisctr013Service m_guardarCambios");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal IFRANQU = getCampoNumerico(request, "IFRANQU");
			BigDecimal CTIPFRA = getCampoNumerico(request, "CTIPFRA");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_FRANQGAR_MANUAL(NRIESGO, CGARANT, CTIPFRA, IFRANQU);
			logger.debug(m);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.put("ok", "ok");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr013Service - m�todo m_guardarCambios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
