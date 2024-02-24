package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro015Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro015Action thisAction) {
		logger.debug("Axispro015Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {

			formdata.remove("OK");

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			logger.debug("---> SPRODUC" + SPRODUC + " CACTIVI:" + PCACTIVI + " CGARANT:" + PCGARANT);

			formdata.put("CACTIVI", PCACTIVI);
			formdata.put("CGARANT", PCGARANT);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_DATOSGENERALESGARAN(SPRODUC, PCACTIVI, PCGARANT);
			logger.debug(map);
			Map OB_IAX_PRODGARANTIAS = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(OB_IAX_PRODGARANTIAS))
				formdata.putAll(OB_IAX_PRODGARANTIAS);

			if (!isEmpty(OB_IAX_PRODGARANTIAS.get("CPARDEP")))
				m_buscarvalparam(request, thisAction);

			cargarDatosCombos(request, SPRODUC, PCACTIVI, PCGARANT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro015Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request, BigDecimal SPRODUC, BigDecimal PCACTIVI,
			BigDecimal PCGARANT) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap combos = new HashMap();
		Map map = null;

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPGAR();
		logger.debug(map);
		combos.put("LSTTIPGAR", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPCAPGAR();
		logger.debug(map);
		combos.put("LSTTIPCAPGAR", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCAPMAXGAR();
		logger.debug(map);
		combos.put("LSTCAPMAXGAR", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_GFI__F_GET_CLAVES();
		logger.debug(map);
		combos.put("CLAVES", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIASDEP(SPRODUC, PCACTIVI, PCGARANT);
		logger.debug(map);
		combos.put("LSTGARANTIASDEP", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_MNTPROD__F_GET_PARGARANTIA(usuario.getCidioma());
		logger.debug(map);
		combos.put("LSTPARGARANTIAS", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
		logger.debug(map);

		// MONEDA
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDIVISA();
		logger.debug(map);
		combos.put("MONEDA", (List) tratarRETURNyMENSAJES(request, map, false));

		if (isEmpty(map.get("RETURN"))) {
			map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(SPRODUC, PCGARANT, PCACTIVI);
			logger.debug(map);
			map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
			logger.debug(map);
		}

		formdata.put("GARANPROCAP", map.get("RETURN"));

		formdata.put("COMBOS", combos);

	}

	/**
	 * M�todo que realiza la b�squeda de preguntas en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscarvalparam(HttpServletRequest request, Axispro015Action thisAction) {
		logger.debug("Axispro015Service m_buscarvalparam");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			String CPARGAR = getCampoTextual(request, "CPARGAR");
			String CPARDEP = getCampoTextual(request, "CPARDEP");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			String cpargar = isEmpty(CPARGAR) ? CPARDEP : CPARGAR;

			formdata.put("CACTIVI", PCACTIVI);
			formdata.put("CGARANT", PCGARANT);

			String CAMBIO = getCampoTextual(request, "CAMBIO");
			if (!isEmpty(CAMBIO))
				formdata.remove("CVALPAR");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_VALPARGARANTIA(cpargar, usuario.getCidioma());
			logger.debug("---> valores param:" + map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("CTIPO", map.get("PCTIPO"));
				if (map.get("PCTIPO").equals(new BigDecimal(2))) {
					formdata.put("LISTAVALPREG", map.get("PLISTRESP"));
				}
			}

			tratarRETURNyMENSAJES(request, map);
			cargarDatosCombos(request, SPRODUC, PCACTIVI, PCGARANT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro042Service - m�todo m_buscarpreg", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recargar(HttpServletRequest request, Axispro015Action thisAction) {
		logger.debug("Axispro015Service m_recargar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			String PCPARDEP = getCampoTextual(request, "CPARDEP");

			logger.debug("--->recargar SPRODUC:" + SPRODUC + " CACTIVI:" + PCACTIVI + " CGARANT:" + PCGARANT
					+ " PCPARDEP:" + PCPARDEP);

			formdata.put("CACTIVI", PCACTIVI);
			formdata.put("CGARANT", PCGARANT);

			if (!isEmpty(PCPARDEP))
				m_buscarvalparam(request, thisAction);

			cargarDatosCombos(request, SPRODUC, PCACTIVI, PCGARANT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro015Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axispro015Action thisAction) {
		logger.debug("Axispro015Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.formattingNumericValues(request);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			BigDecimal PNORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal PCTIPGAR = getCampoNumerico(request, "CTIPGAR");
			BigDecimal PCTIPCAP = getCampoNumerico(request, "CTIPCAP");

			BigDecimal PCGARDEP = isEmpty(getCampoNumerico(request, "CGARDEP")) ? getCampoNumerico(request, "CGARDEP2")
					: getCampoNumerico(request, "CGARDEP");

			String PCPARDEP = getCampoTextual(request, "CPARDEP");

			BigDecimal PCVALPAR = getCampoNumerico(request, "CVALPAR");
			BigDecimal PCTARJET = getCampoNumerico(request, "CTARJET");
			BigDecimal PCBASICA = getCampoNumerico(request, "CBASICA");
			BigDecimal PICAPMAX = getCampoNumerico(request, "ICAPMAX");
			BigDecimal PCCAPMAX = getCampoNumerico(request, "CCAPMAX") == null ? getCampoNumerico(request, "CCAPMAX_")
					: getCampoNumerico(request, "CCAPMAX");
			BigDecimal PCFORMUL = getCampoNumerico(request, "CFORMUL");
			BigDecimal PCCLACAP = getCampoNumerico(request, "CCLACAP");
			BigDecimal PICAPREV = getCampoNumerico(request, "ICAPREV");
			BigDecimal PPCAPDEP = getCampoNumerico(request, "PCAPDEP");
			BigDecimal PIPRIMIN = getCampoNumerico(request, "IPRIMIN");
			BigDecimal PIPRIMAX = getCampoNumerico(request, "IPRIMAX");
			BigDecimal PCCAPMIN = getCampoNumerico(request, "CCAPMIN");
			BigDecimal PICAPMIN = getCampoNumerico(request, "ICAPMIN");
			BigDecimal PCCLAMIN = getCampoNumerico(request, "CCLAMIN");
			BigDecimal PCMONCAP = getCampoNumerico(request, "CMONCAP");

			logger.debug("--->recargar SPRODUC:" + SPRODUC + " CACTIVI:" + PCACTIVI + " CGARANT:" + PCGARANT);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGEN(SPRODUC, PCGARANT, PCACTIVI, PNORDEN, PCTIPGAR, PCTIPCAP,
							PCGARDEP, PCPARDEP, PCVALPAR, PCTARJET, PCBASICA, PICAPMAX, PCCAPMAX, PCFORMUL, PCCLACAP,
							PICAPREV, PPCAPDEP, PIPRIMIN, PIPRIMAX, PCCAPMIN, PICAPMIN, PCCLAMIN, PCMONCAP);
			logger.debug("----> map:" + map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			}

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro015Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
