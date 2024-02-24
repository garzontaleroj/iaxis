package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPUESTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro016Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro016Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axispro016Action thisAction) {
		logger.debug("Axispro016Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			formdata.put("PCACTIVI", PCACTIVI);
			formdata.put("PCGARANT", PCGARANT);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_GESTIONGARAN(SPRODUC, PCACTIVI, PCGARANT);
			logger.debug(map);
			Map OB_IAX_PRODGARDATGESTION = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(OB_IAX_PRODGARDATGESTION))
				formdata.putAll(OB_IAX_PRODGARDATGESTION);

			map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_GET_IMPREC(usuario.getCempres(), new BigDecimal(8), null, null,
							SPRODUC, null, PCACTIVI, PCGARANT, null, null);

			logger.debug("---> recargos:" + map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("FORPAGRECGARAN", map.get("RETURN"));

			cargarDatosCombos(request, SPRODUC, PCACTIVI, PCGARANT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	private void cargarDatosCombos(HttpServletRequest request, BigDecimal SPRODUC, BigDecimal PCACTIVI,
			BigDecimal PCGARANT) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap combos = new HashMap();
		Map map = null;

		/*
		 * map = new
		 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
		 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPTARGAR();
		 * logger.debug(map); combos.put("LSTTIPTARGAR", (List)
		 * tratarRETURNyMENSAJES(request, map, false));
		 */

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(56));
		logger.debug(map);
		combos.put("LSTTARMAN", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREAGAR();
		logger.debug(map);
		combos.put("LSTREAGAR", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTREVALGAR();
		logger.debug(map);
		combos.put("LSTREVALGAR", (List) tratarRETURNyMENSAJES(request, map, false));

		formdata.put("COMBOS", combos);

	}

	public void m_aceptar(HttpServletRequest request, Axispro016Action thisAction) {
		logger.debug("Axispro016Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			BigDecimal PCIEDMIC = isEmpty(getCampoNumerico(request, "CIEDMIC")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEDMIC");
			BigDecimal PNEDAMIC = getCampoNumerico(request, "NEDAMIC");
			BigDecimal PCIEDMAC = isEmpty(getCampoNumerico(request, "CIEDMAC")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEDMAC");
			BigDecimal PNEDAMAC = getCampoNumerico(request, "NEDAMAC");
			BigDecimal PCIEDMAR = isEmpty(getCampoNumerico(request, "CIEDMAR")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEDMAR");
			BigDecimal PNEDAMAR = getCampoNumerico(request, "NEDAMAR");
			BigDecimal PCIEMI2C = isEmpty(getCampoNumerico(request, "CIEMI2C")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEMI2C");
			BigDecimal PNEDMI2C = getCampoNumerico(request, "NEDMI2C");
			BigDecimal PCIEMA2C = isEmpty(getCampoNumerico(request, "CIEMA2C")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEMA2C");
			BigDecimal PNEDMA2C = getCampoNumerico(request, "NEDMA2C");
			BigDecimal PCIEMA2R = isEmpty(getCampoNumerico(request, "CIEMA2R")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEMA2R");
			BigDecimal PNEDMA2R = getCampoNumerico(request, "NEDMA2R");
			BigDecimal PCREASEG = getCampoNumerico(request, "LSTREAGAR");
			BigDecimal PCREVALI = getCampoNumerico(request, "LSTREVALGAR");
			BigDecimal PCTIPTAR = new BigDecimal(0);
			BigDecimal PCMODREV = isEmpty(getCampoNumerico(request, "CMODREV")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CMODREV");
			BigDecimal PCRECARG = isEmpty(getCampoNumerico(request, "CRECARG")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CRECARG");
			BigDecimal PCDTOCOM = isEmpty(getCampoNumerico(request, "CDTOCOM")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CDTOCOM");
			BigDecimal PCTECNIC = isEmpty(getCampoNumerico(request, "CTECNIC")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CTECNIC");
			BigDecimal PCOFERSN = isEmpty(getCampoNumerico(request, "COFERSN")) ? new BigDecimal(0)
					: getCampoNumerico(request, "COFERSN");
			BigDecimal PCEXTRAP = isEmpty(getCampoNumerico(request, "CEXTRAP")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CEXTRAP");
			BigDecimal PCDERREG = isEmpty(getCampoNumerico(request, "CDERREG")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CDERREG");
			BigDecimal PPREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal PIREVALI = getCampoNumerico(request, "IREVALI");
			BigDecimal PCRECFRA = isEmpty(getCampoNumerico(request, "CRECFRA")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CRECFRA");
			BigDecimal PCTARMAN = getCampoNumerico(request, "CTARMAN");
			BigDecimal PNEDAMRV = getCampoNumerico(request, "NEDAMRV");
			BigDecimal PCIEDMRV = isEmpty(getCampoNumerico(request, "CIEDMRV")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CIEDMRV");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_DATOSGES(PSPRODUC, PCGARANT, PCACTIVI, PCIEDMIC, PNEDAMIC, PCIEDMAC,
							PNEDAMAC, PCIEDMAR, PNEDAMAR, PCIEMI2C, PNEDMI2C, PCIEMA2C, PNEDMA2C, PCIEMA2R, PNEDMA2R,
							PCREASEG, PCREVALI, PCTIPTAR, PCMODREV, PCRECARG, PCDTOCOM, PCTECNIC, PCOFERSN, PCEXTRAP,
							PCDERREG, PPREVALI, PIREVALI, PCRECFRA, PCTARMAN, PNEDAMRV, PCIEDMRV);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			}

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_delrecargo(HttpServletRequest request, Axispro016Action thisAction) {
		logger.debug("Axispro016Service m_delrecargo");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PCCONCEP = getCampoNumerico(request, "PCCONCEP");
			BigDecimal PNCONCEP = getCampoNumerico(request, "PNCONCEP");
			BigDecimal PCFORPAG = getCampoNumerico(request, "PCFORPAG");

			java.sql.Date PFINIVIG = this.stringToSqlDate(getCampoTextual(request, "PFINIVIG"));

			Map map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_DEL_IMPREC(PCCONCEP, usuario.getCempres(), PNCONCEP, PCFORPAG,
							PFINIVIG);

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axispro016Action thisAction) {
		logger.debug("Axispro016Service m_delrecargo");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");

			formdata.put("PCACTIVI", PCACTIVI);
			formdata.put("PCGARANT", PCGARANT);

			Map map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_GET_IMPREC(usuario.getCempres(), new BigDecimal(8), null, null,
							SPRODUC, null, PCACTIVI, PCGARANT, null, null);

			tratarRETURNyMENSAJES(request, map);
			formdata.put("FORPAGRECGARAN", map.get("RETURN"));

			cargarDatosCombos(request, SPRODUC, PCACTIVI, PCGARANT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
